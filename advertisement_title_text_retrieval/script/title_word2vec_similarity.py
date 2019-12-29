#!/home/dmer/.pyenv/versions/env3/bin/python
# -*- coding: utf-8 -*-
"""
---------------------------------------------------------------------------
File Name   : title_word2vec_similarity.py
Description : 利用word2vec功能，构建查询扩展。
              1. 。
Author      : Zhang Zhiyong
Created at  : 2018/12/05
---------------------------------------------------------------------------
"""
import warnings
warnings.filterwarnings("ignore")

import os
import datetime
import argparse

from gensim.models import word2vec
import multiprocessing

import sys
sys.path.append("/home/dmer/models/pub/")
import mysql_conn as msc
import general_logging as gl

LOGFILEPATH = 'title_word2vec_similarity_%s.log' % datetime.datetime.now().strftime('%Y-%m-%d')

def load_wordVectors(model_path):
    w2vModel = word2vec.Word2Vec.load(model_path)
    return w2vModel


def get_similarity_words(model, query_word, number):
    similarity_words = ''
    try:
        similarity_words = model.most_similar(query_word, topn=number)
    except KeyError:
        loginfo = ' The word is not in vocabulary!'
        gl.write_log(logpath, 'error', loginfo)
    return similarity_words


def incrementally_build_model(model_path, sentences):
    model = word2vec.Word2Vec.load(model_path)
    model.build_vocab(sentences, update=True)
    print(model.corpus_count, model.iter)
    model.train(sentences, total_examples=model.corpus_count, epochs=model.iter)
    model.save(model_path)

    loginfo = ' model %s has been built incrementally!' % model_path
    gl.write_log(logpath, 'info', loginfo)


def build_model(model_path, sentences, embedding_size=128, in_window=5, in_min_count=5):
    w2vModel = word2vec.Word2Vec(sentences, sg=1, size=embedding_size, window=in_window, 
                                        min_count=in_min_count, workers=multiprocessing.cpu_count())
    w2vModel.save(model_path)
    loginfo = ' model %s has been built initially!' % model_path
    gl.write_log(logpath, 'info', loginfo)


def fetch_segwords(tablename):
    mysql = msc.MyPymysqlPool("dbMysql")
    sql = "SELECT ad_title_segwords FROM %s where ad_title_segwords is not null" % tablename
    rst = mysql.getAll(sql)
    mysql.dispose()

    loginfo = ' %d rows are fetched.' % len(rst)
    gl.write_log(logpath, 'info', loginfo)
    return rst


def comand_line_set():
    args = argparse.ArgumentParser(description='Word2vec words retrieval information', epilog='Information end')
    # required parameter
    # args.add_argument("initial", type=str, help="if initially build a model, input 1, else input 0 !")
    # optional parameter
    args.add_argument("-i", type=str, dest="initial", help="build initially, 1 or 0!", default=0, choices={0,1})
    args.add_argument("-p", type=str, dest="logpath", help="the log path", default='/home/dmer/logs/ad_title_retrieval/' + LOGFILEPATH)
    args.add_argument("-d", type=str, dest="segment_dir", help="the path of text segmented file", default='../data/segment')
    args.add_argument("-m", type=str, dest="modelpath", help="the path of word2vec text extend model", default='../model/word2Vec_general.model')
    args.add_argument("-t", type=str, dest="tablename", help="the creative table name", default='pzbase.ai_adtitle_words_retrieval_history')

    args = args.parse_args()
    args_dict = args.__dict__
    return args_dict


if __name__=='__main__':
    global logpath

    args_dict = comand_line_set()
    initial = int(args_dict.get("initial"))
    logpath = args_dict.get("logpath")
    segment_dir = args_dict.get("segment_dir")
    model_path = args_dict.get("modelpath")
    tablename = args_dict.get("tablename")

    gl.write_log(logpath, 'info', '\n\n')
    loginfo = 'word2vec model building...'
    gl.write_log(logpath, 'info', loginfo)

    if initial == 1:
        sentences = word2vec.PathLineSentences(segment_dir)
        build_model(model_path, sentences)

    rst = fetch_segwords(tablename)
    sentences = list(list(x.values()) for x in rst)
    incrementally_build_model(model_path, sentences)
