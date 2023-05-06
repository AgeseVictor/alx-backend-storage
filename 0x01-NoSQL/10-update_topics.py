#!/usr/bin/env python3
"""a Python function  that changes all topics of a school document"""
import pymongo


def update_topics(mongo_collection, name, topics):
    '''changes all topics of a school document'''
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
