#!/home/dmer/.pyenv/versions/env3/bin/python
# -*- coding: utf-8 -*-
"""
---------------------------------------------------------------------------
File Name   : create_inverted_index.py
Description : 批量读入分词信息，创建倒排索引。
              1. 从创意历史表中读入文案标题信息，包括序号、分词内容等
              2. 为分词内容创建倒排索引，生成索引文件
Author      : Zhang Zhiyong
Created at  : 2018/12/06
---------------------------------------------------------------------------
"""
import os
import datetime
import argparse
import shutil
import glob

from whoosh.index import create_in, open_dir
from whoosh.fields import Schema, TEXT, NUMERIC
from whoosh.qparser import QueryParser
from jieba.analyse.analyzer import ChineseAnalyzer

import sys
sys.path.append("/home/dmer/models/pub/")
import mysql_conn as msc
import text_mining_lib as tml
import general_logging as gl


LOGFILEPATH = 'create_inverted_index_%s.log' % datetime.datetime.now().strftime('%Y-%m-%d')

def fetch_segwords(tablename):
    mysql = msc.MyPymysqlPool("dbMysql")
    sql = "SELECT seq_no, ad_title_source, ad_title, ad_title_segwords FROM %s where ad_title_segwords is not null" % tablename
    rst = mysql.getAll(sql)
    mysql.dispose()

    loginfo = ' %d titles are fetched.' % len(rst)
    gl.write_log(logpath, 'info', loginfo)
    return rst


def write_index_file(index_dir, tablename):
    analyzer = ChineseAnalyzer(minsize=1)   # can index one word
    schema = Schema(seq_no=NUMERIC(stored=True), source=TEXT(stored=True), title=TEXT(stored=True), 
                        segwords=TEXT(stored=True, analyzer=analyzer))
    ix = create_in(index_dir, schema)
    writer = ix.writer()

    datasets = fetch_segwords(tablename)
    for dataset in datasets:
        get_seq_no = int(dataset["seq_no"])
        get_source = dataset["ad_title_source"]
        get_title = dataset["ad_title"].replace('\n','')
        get_segwords = dataset["ad_title_segwords"].replace('\n','')
        writer.add_document(seq_no=get_seq_no, source=get_source, title=get_title, segwords=get_segwords)
    writer.commit()
    loginfo = 'Inverted index for %s has been created.' % tablename
    gl.write_log(logpath, 'info', loginfo)


def check_index_directory(index_dir):
    # 考虑到索引创建时间可能会比较长，为了保证创建索引时索引文件依然可以访问，
    # 如果已有索引，则先存放到后缀_processing目录中，待索引生成后，直接进行替换
    index_dir_processing = index_dir + "_processing"
    if not os.path.exists(index_dir):
        os.mkdir(index_dir)
        index_dir_writen = index_dir
        loginfo = '     Inverted index directory %s has been created.' % index_dir
        gl.write_log(logpath, 'info', loginfo)
    else:
        if os.path.exists(index_dir_processing):
            shutil.rmtree(index_dir_processing)
        os.mkdir(index_dir_processing)
        loginfo = '     Temporary inverted index directory %s has been created.' % index_dir_processing
        gl.write_log(logpath, 'info', loginfo)
        index_dir_writen = index_dir_processing

    return index_dir_writen, index_dir_processing


def create_index(index_dir):
    loginfo = 'inverted index are creating...'
    gl.write_log(logpath, 'info', loginfo)

    index_dir_writen, index_dir_processing = check_index_directory(index_dir)

    # create inverted index for all data because of not too many titles
    write_index_file(index_dir_writen, tablename)

    if index_dir_writen == index_dir_processing:
        shutil.rmtree(index_dir)
        os.rename(index_dir_writen, index_dir)
        loginfo = 'Inverted index directory %s has been renamed.' % index_dir
        gl.write_log(logpath, 'info', loginfo)


def comand_line_set():
    args = argparse.ArgumentParser(description='Create inverted index.', epilog='')
    # optional parameter
    args.add_argument("-p", type=str, dest="logpath", help="the log path", default='/home/dmer/logs/ad_title_retrieval/' + LOGFILEPATH)
    args.add_argument("-d", type=str, dest="indexpath", help="the path of inverted index", default='../data/index')
    args.add_argument("-t", type=str, dest="tablename", help="the creative table name", default='pzbase.ai_adtitle_words_retrieval_history')

    args = args.parse_args()
    args_dict = args.__dict__
    return args_dict


if __name__=='__main__':
    global logpath
    
    args_dict = comand_line_set()
    indexpath = args_dict.get("indexpath")
    tablename = args_dict.get("tablename")
    logpath =  args_dict.get("logpath")

    gl.write_log(logpath, 'info', '\n\n')
    loginfo = 'Inverted index building...'
    gl.write_log(logpath, 'info', loginfo)

    create_index(indexpath)

    

    
    
