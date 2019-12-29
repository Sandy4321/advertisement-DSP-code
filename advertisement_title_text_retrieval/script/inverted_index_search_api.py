#!/home/dmer/.pyenv/versions/env3/bin/python
# -*- coding: utf-8 -*-
"""
---------------------------------------------------------------------------
File Name   : inverted_index_search_api.py
Description : 文本检索API服务。
              1. 常驻内存，提供广告文案的检索服务
              2. 接收到检索关键词或文案，进行分词，然后检索倒排索引，返回查询json格式结果。
              3. API传入参数：
                1）title：查询文案，必填，如果是一句话，服务将首先分词
                2）number：最大返回文案数，可选，为空为API服务缺省值
Created at  : 2018/12/07
---------------------------------------------------------------------------
"""
__author__ = 'zhang zhiyong'

import os
import argparse
import datetime
from flask import Flask, request, jsonify, render_template

import jieba
import re
import glob
from whoosh.index import create_in, open_dir
from whoosh.fields import Schema, TEXT, NUMERIC
from whoosh.qparser import QueryParser

import sys
sys.path.append("/home/dmer/models/pub/")
import text_mining_lib as tml
import general_logging as gl
import title_word2vec_similarity as tws

# only accept Chinese and English characters
GOOD_WORDS = 'en&cn'
CUT_WORDS = '[’!"#$%&\'()*+,-./:;<=>?@，。?★、…【】《》？“”‘’！[\\]^_`{|}~]+'
LOGFILEPATH = 'inverted_index_search_api_%s.log' % datetime.datetime.now().strftime('%Y-%m-%d')

app = Flask(__name__)
@app.route('/search', methods=['post', 'get'])
def api_main():
    # capture the search parameters
    title = request.args.get('title')
    title_number = request.args.get('num')
    is_similar = request.args.get('similar')      # yes or no
    similar_number = request.args.get('simnum')

    query_words = set(tml.words_segment(title, stopwords, GOOD_WORDS))
    words_results_dict = {}

    # get similar words and return to user only
    # user will check which ones should be used in the next query
    if is_similar == 'yes':
        if not similar_number:
            similar_number = get_similar_number
        all_similar_words = {}
        for word in query_words:
            similar_words = tws.get_similarity_words(similar_model, word, int(similar_number))
            # similar_words: [('广袤', 0.630869448184967), ('整片', 0.6198980808258057), ('这片', 0.6139094233512878)]
            all_similar_words[word] = dict(similar_words)
        words_results_dict['similar_words'] = all_similar_words

    words_results_dict['searched_titles'] = index_search(list(query_words), title_number)
    return jsonify(words_results_dict)  # json format


def index_search(query_words, title_number):
    if not title_number:
        title_number = get_title_number

    # words_results: [<Top 5 Results for Term('segwords', '美团') runtime=...>, <Top 5 Results for Term('segwords', '汽车') runtime=...>]
    words_results = tml.query_index(query_words, int(title_number), index_searcher, query_parser, logpath)

    i = 0
    j = 0
    words_results_dict = {}
    for word_results in words_results:  # get results for each segmented query word
        # print('word_results: ', word_results)
        word_result_dict = {}
        for word_result in word_results:
            word_result_id = {}
            word_result_id['source'] = word_result.get(key="source")
            word_result_id['ad_title'] = word_result.get(key="title")
            word_result_id['segmented_words'] = word_result.get(key="segwords")
            word_result_dict[word_result.get(key="seq_no")] = word_result_id
            j +=1
        words_results_dict[query_words[i]] = word_result_dict
        i +=1

    loginfo = ' query words: %s, result number: %d.' % (query_words, j)
    gl.write_log(logpath, 'info', loginfo)
    return words_results_dict


def comand_line_set():
    args = argparse.ArgumentParser(description='Word retrieval from inverted index of segment words', epilog='')
    # optional parameter
    args.add_argument("-p", type=str, dest="logpath", help="the log path", default='/home/dmer/logs/ad_title_retrieval/' + LOGFILEPATH)
    args.add_argument("-i", type=str, dest="indexpath", help="the path of inverted index file", default='../data/index')
    args.add_argument("-d", type=str, dest="userdictpath", help="the path of user dictionary file", default='../dict/ik_taobao_dict300000_nojieba.txt')
    args.add_argument("-k", type=str, dest="compdictpath", help="the path of comp dictionary file", default='../dict/comp_dict.txt')
    args.add_argument("-s", type=str, dest="stopwordpath", help="the path of stop words file", default='../dict/stop_words.txt')
    args.add_argument("-e", type=str, dest="modelpath", help="the path of word2vec similar model", default='../model/word2Vec_general.model')
    args.add_argument("-n", type=int, dest="titlenumber", help="the max number of return words", default=500, choices=range(1, 10000))
    args.add_argument("-m", type=int, dest="similarnumber", help="the max number of similar words", default=10, choices=range(1, 100))

    args = args.parse_args()
    args_dict = args.__dict__
    return args_dict


if __name__ == '__main__':
    global logpath
    global index_path
    global stopwords
    global similar_model
    global get_title_number
    global get_similar_number
    global index_searcher
    global query_parser

    args_dict = comand_line_set()
    index_path = args_dict.get("indexpath")
    logpath = args_dict.get("logpath")
    user_dict_path = args_dict.get("userdictpath")
    comp_dict_path = args_dict.get("compdictpath")
    stop_word_path = args_dict.get("stopwordpath")
    modelpath = args_dict.get("modelpath")
    get_title_number = args_dict.get("titlenumber")
    get_similar_number = args_dict.get("similarnumber")

    gl.write_log(logpath, 'info', "\n\n")
    loginfo = ' word retrieval service starting...'
    gl.write_log(logpath, 'info', loginfo)

    # preload dicts to save running time
    tml.load_dicts(user_dict_path, logpath)
    tml.load_dicts(comp_dict_path, logpath)
    stopwords = tml.get_stopwords(stop_word_path, logpath)

    ix = open_dir(index_path)    # for read only
    index_searcher = ix.searcher()
    query_parser = QueryParser("segwords", schema=ix.schema)
    loginfo = ' inverted index file %s has been opened.' % index_path
    gl.write_log(logpath, 'info', loginfo)

    # preload similar model to save running time
    similar_model = tws.load_wordVectors(modelpath)

    # port number should be changed when demploying
    app.run(debug=True, host='0.0.0.0', port=8888)
