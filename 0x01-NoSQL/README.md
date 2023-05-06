# 0x01. NoSQL

## Resources
Read or watch:

* [NoSQL Databases Explained](https://riak.com/resources/nosql-databases/)
* [What is NoSQL ?](https://www.youtube.com/watch?v=qUV2j3XBRHc)
* [Building Your First Application: An Introduction to MongoDB]()
* [Introduction to MongoDB](https://www.studytonight.com/mongodb/introduction-to-mongodb)
* [An Introduction to MongoDB](https://www.mongodb.com/presentations/back-to-basics-introduction-to-mongodb)
* [MongoDB Tutorial 2 : Insert, Update, Remove, Query](https://www.youtube.com/watch?v=CB9G5Dvv-EE)
* [How To Install MongoDB in](https://tecadmin.net/install-mongodb-on-fedora/)
* [Aggregation](https://docs.mongodb.com/manual/aggregation/)
* [Introduction to MongoDB and Python](https://realpython.com/introduction-to-mongodb-and-python/)
* [mongo Shell Methods](https://docs.mongodb.com/manual/reference/method/)
* [The mongo Shell](https://docs.mongodb.com/manual/reference/program/mongo/)

## Tasks

## [0. List all databases](./0-list_databases)
Write a script that lists all databases in MongoDB.

```
@ubuntu:~/0x01$ cat 0-list_databases | mongo
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.6.3
admin        0.000GB
config       0.000GB
local        0.000GB
logs         0.005GB
bye
@ubuntu:~/0x01$
```

## [1. Create a database](./1-use_or_create_database)
Write a script that creates or uses the database `my_db`:
```
@ubuntu:~/0x01$ cat 1-use_or_create_database | mongo
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.6.3
switched to db my_db
bye
```

## [2. Insert document](./2-insert)
Write a script that inserts a document in the collection `school`:

* The document must have one attribute `name` with value “Holberton school”
* The database name will be passed as option of `mongo` command
```
@ubuntu:~/0x01$ cat 2-insert | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
WriteResult({ "nInserted" : 1 })
bye
```

## [3. All documents](./3-all)
Write a script that lists all documents in the collection `school`:

* The database name will be passed as option of `mongo` command
```
@ubuntu:~/0x01$ cat 3-all | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
{ "_id" : ObjectId("5a8fad532b69437b63252406"), "name" : "Holberton school" }
bye
@ubuntu:~/0x01$
```

## [4. All matches](./4-match)
Write a script lists all that documents with `name="Holberton school"` in the collection `school`:

* The database name will be passed as option of `mongo` command
```
@ubuntu:~/0x01$ cat 4-match | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
{ "_id" : ObjectId("5a8fad532b69437b63252406"), "name" : "Holberton school" }
bye
```

## [5. Count](./5-count)
Write a script that displays the number of documents in the collection `school`:

* The database name will be passed as option of `mongo` command
```
@ubuntu:~/0x01$ cat 5-count | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
1
bye
```

## [6. Update](./6-update)
Write a script that adds a new attribute to a document in the collection `school`:

* The script should update only document with `name="Holberton school"` (all of them)
* The update should add the attribute `address` with the value “972 Mission street”
* The database name will be passed as option of `mongo` command
```
@ubuntu:~/0x01$ cat 6-update | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
bye
@ubuntu:~/0x01$ cat 4-match | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
{ "_id" : ObjectId("5a8fad532b69437b63252406"), "name" : "Holberton school", "address" : "972 Mission street" }
bye
```

## [7. Delete by match](./7-delete)
Write a script that deletes all documents with `name="Holberton school"` in the collection `school`:

* The database name will be passed as option of `mongo` command
```
@ubuntu:~/0x01$ cat 7-delete | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
{ "acknowledged" : true, "deletedCount" : 1 }
bye
@ubuntu:~/0x01$ cat 4-match | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
bye
```

## [8. List all documents in Python](./8-all.py)
Write a Python function that lists all documents in a collection:

* Prototype: `def list_all(mongo_collection)`:
* Return an empty list if no document in the collection
* `mongo_collection` will be the `pymongo` collection object
```
@ubuntu:~/0x01$ ./8-main.py
[5a8f60cfd4321e1403ba7ab9] Holberton school
[5a8f60cfd4321e1403ba7aba] UCSD
```

## [9. Insert a document in Python](./9-insert_school.py)
Write a Python function that inserts a new document in a collection based on `kwargs`:

* Prototype: `def insert_school(mongo_collection, **kwargs)`:
* `mongo_collection` will be the `pymongo` collection object
* Returns the new `_id`
```
@ubuntu:~/0x01$ ./9-main.py
New school created: 5a8f60cfd4321e1403ba7abb
[5a8f60cfd4321e1403ba7ab9] Holberton school
[5a8f60cfd4321e1403ba7aba] UCSD
[5a8f60cfd4321e1403ba7abb] UCSF 505 Parnassus Ave
```

## [10. Change school topics](./10-update_topics.py)
Write a Python function that changes all topics of a school document based on the name:

* Prototype: `def update_topics(mongo_collection, name, topics)`:
* mongo_collection will be the `pymongo` collection object
* `name` (string) will be the school name to update
* `topics` (list of strings) will be the list of topics approached in the school
```
@ubuntu:~/0x01$ ./10-main.py
[5a8f60cfd4321e1403ba7abb] UCSF 
[5a8f60cfd4321e1403ba7aba] UCSD 
[5a8f60cfd4321e1403ba7ab9] Holberton school ['Sys admin', 'AI', 'Algorithm']
[5a8f60cfd4321e1403ba7abb] UCSF 
[5a8f60cfd4321e1403ba7aba] UCSD 
[5a8f60cfd4321e1403ba7ab9] Holberton school ['iOS']
```

## [11. Where can I learn Python?](./11-schools_by_topic.py)
Write a Python function that returns the list of school having a specific topic:

* Prototype: `def schools_by_topic(mongo_collection, topic)`:
* mongo_collection will be the `pymongo` collection object
* `topic` (string) will be topic searched
```
@ubuntu:~/0x01$ ./11-main.py
[5a90731fd4321e1e5a3f53e3] Holberton school ['Algo', 'C', 'Python', 'React']
[5a90731fd4321e1e5a3f53e5] UCLA ['C', 'Python']
```

## [12. Log stats](./12-log_stats.py)
Write a Python script that provides some stats about Nginx logs stored in MongoDB:

* Database: `logs`
* Collection: `nginx`
* Display (same as the example):
        first line: `x logs` where `x` is the number of documents in this collection
        second line: `Methods`:
        5 lines with the number of documents with the `method = ["GET", "POST", "PUT", "PATCH", "DELETE"]` in this order (see example below - warning: it’s a tabulation before each line)
        one line with the number of documents with:
            + method=GET
            + path=/status
You can use this dump as data sample: [dump.zip](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-webstack/411/dump.zip)
```
@ubuntu:~/0x01$ curl -o dump.zip -s "https://s3.amazonaws.com/intranet-projects-files/holbertonschool-webstack/411/dump.zip"
@ubuntu:~/0x01$ unzip dump.zip
@ubuntu:~/0x01$ ./12-log_stats.py 
94778 logs
Methods:
    method GET: 93842
    method POST: 229
    method PUT: 0
    method PATCH: 0
    method DELETE: 0
47415 status check
```

## [13. Regex filter](./100-find)
Write a script that lists all documents with `name` starting by `Holberton` in the collection `school`:

* The database `name` will be passed as option of `mongo` command
```
@ubuntu:~/0x01$ cat 100-find | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
{ "_id" : ObjectId("5a90731fd4321e1e5a3f53e3"), "name" : "Holberton school" }
{ "_id" : ObjectId("5a90731fd4321e1e5a3f53e3"), "name" : "Holberton School" }
{ "_id" : ObjectId("5a90731fd4321e1e5a3f53e3"), "name" : "Holberton-school" }
bye
```

## [14. Top students](./101-students.py)
Write a Python function that returns all students sorted by average score:

* Prototype: `def top_students(mongo_collection)`:
* `mongo_collection` will be the `pymongo` collection object
* The top must be ordered
* The average score must be part of each item returns with key = `averageScore`
```
@ubuntu:~/0x01$ ./101-main.py
[5a90776bd4321e1ec94fc408] John - [{'title': 'Algo', 'score': 10.3}, {'title': 'C', 'score': 6.2}, {'title': 'Python', 'score': 12.1}]
[5a90776bd4321e1ec94fc409] Bob - [{'title': 'Algo', 'score': 5.4}, {'title': 'C', 'score': 4.9}, {'title': 'Python', 'score': 7.9}]
[5a90776bd4321e1ec94fc40a] Sonia - [{'title': 'Algo', 'score': 14.8}, {'title': 'C', 'score': 8.8}, {'title': 'Python', 'score': 15.7}]
[5a90776bd4321e1ec94fc40b] Amy - [{'title': 'Algo', 'score': 9.1}, {'title': 'C', 'score': 14.2}, {'title': 'Python', 'score': 4.8}]
[5a90776bd4321e1ec94fc40c] Julia - [{'title': 'Algo', 'score': 10.5}, {'title': 'C', 'score': 10.2}, {'title': 'Python', 'score': 10.1}]
[5a90776bd4321e1ec94fc40a] Sonia => 13.1
[5a90776bd4321e1ec94fc40c] Julia => 10.266666666666666
[5a90776bd4321e1ec94fc408] John => 9.533333333333333
[5a90776bd4321e1ec94fc40b] Amy => 9.366666666666665
[5a90776bd4321e1ec94fc409] Bob => 6.066666666666667
```

## [15. Log stats - new version](./102-log_stats.py)
Improve `12-log_stats.py` by adding the top 10 of the most present IPs in the collection `nginx` of the database `logs`:

* The IPs top must be sorted (like the example below)
```
@ubuntu:~/0x01$ ./102-log_stats.py 
94778 logs
Methods:
    method GET: 93842
    method POST: 229
    method PUT: 0
    method PATCH: 0
    method DELETE: 0
47415 status check
IPs:
    172.31.63.67: 15805
    172.31.2.14: 15805
    172.31.29.194: 15805
    69.162.124.230: 529
    64.124.26.109: 408
    64.62.224.29: 217
    34.207.121.61: 183
    47.88.100.4: 166
    45.249.84.250: 160
    216.244.66.228: 150
```
