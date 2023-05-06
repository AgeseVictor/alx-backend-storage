# 0x00. MySQL advanced

## Resources
Read or watch:

* [MySQL cheatsheet](https://devhints.io/mysql)
* [MySQL Performance: How To Leverage MySQL Database Indexing](https://www.liquidweb.com/kb/mysql-optimization-how-to-leverage-mysql-database-indexing/)
* [Stored Procedure](https://www.w3resource.com/mysql/mysql-procedure.php)
* [Triggers](https://www.w3resource.com/mysql/mysql-triggers.php?__cf_chl_rt_tk=U1xOGY.9QzjBSjU0KTsrZMk9i8.HKGdEUYMFokAMg.4-1638987638-0-gaNycGzNCuU)
* [Views](https://www.w3resource.com/mysql/mysql-views.php)
* [Functions and Operators](https://dev.mysql.com/doc/refman/5.7/en/functions.html)
* [Trigger Syntax and Examples](https://dev.mysql.com/doc/refman/5.7/en/trigger-syntax.html)
* [CREATE TABLE Statement](https://dev.mysql.com/doc/refman/5.7/en/create-table.html)
* [CREATE PROCEDURE and CREATE FUNCTION Statements](https://dev.mysql.com/doc/refman/5.7/en/create-procedure.html)
* [CREATE INDEX Statement](https://dev.mysql.com/doc/refman/5.7/en/create-index.html)
* [CREATE VIEW Statement](https://dev.mysql.com/doc/refman/5.7/en/create-view.html)

## Comments for your SQL file:
```
$ cat my_script.sql
-- 3 first students in the Batch ID=3
-- because Batch 3 is the best!
SELECT id, name FROM students WHERE batch_id = 3 ORDER BY created_at DESC LIMIT 3;
```

## How to import a SQL dump
```
$ echo "CREATE DATABASE hbtn_0d_tvshows;" | mysql -uroot -p
Enter password: 
$ curl "https://s3.amazonaws.com/intranet-projects-files/holbertonschool-higher-level_programming+/274/hbtn_0d_tvshows.sql" -s | mysql -uroot -p hbtn_0d_tvshows
Enter password: 
$ echo "SELECT * FROM tv_genres" | mysql -uroot -p hbtn_0d_tvshows
   ...

```

# Tasks

## [0. We are all unique!](./0-uniq_users.sql)
Write a SQL script that creates a table `users` following these requirements:

* With these attributes:
        `id`, integer, never null, auto increment and primary key
        `email`, string (255 characters), never null and unique
        `name`, string (255 characters)
* If the table already exists, your script should not fail
* Your script can be executed on any database

Context: Make an attribute unique directly in the table schema will enforced your business rules and avoid bugs in your application
```
bob@dylan:~$ echo "SELECT * FROM users;" | mysql -uroot -p holberton
Enter password: 
ERROR 1146 (42S02) at line 1: Table 'holberton.users' doesn't exist
bob@dylan:~$ 
bob@dylan:~$ cat 0-uniq_users.sql | mysql -uroot -p holberton
Enter password: 
bob@dylan:~$ 
bob@dylan:~$ echo 'INSERT INTO users (email, name) VALUES ("bob@dylan.com", "Bob");' | mysql -uroot -p holberton
Enter password: 
bob@dylan:~$ echo 'INSERT INTO users (email, name) VALUES ("sylvie@dylan.com", "Sylvie");' | mysql -uroot -p holberton
Enter password: 
bob@dylan:~$ echo 'INSERT INTO users (email, name) VALUES ("bob@dylan.com", "Jean");' | mysql -uroot -p holberton
Enter password: 
ERROR 1062 (23000) at line 1: Duplicate entry 'bob@dylan.com' for key 'email'
bob@dylan:~$ 
bob@dylan:~$ echo "SELECT * FROM users;" | mysql -uroot -p holberton
Enter password: 
id  email   name
1   bob@dylan.com   Bob
2   sylvie@dylan.com    Sylvie
bob@dylan:~$
```

## [1. In and not out](./1-country_users.sql)
Write a SQL script that creates a table `users` following these requirements:

* With these attributes:
        `id`, integer, never null, auto increment and primary key
        `email`, string (255 characters), never null and unique
        `name`, string (255 characters)
        `country`, enumeration of countries: `US`, `CO` and `TN`, never null (= default will be the first element of the enumeration, here `US`)
* If the table already exists, your script should not fail
* Your script can be executed on any database
```
bob@dylan:~$ echo "SELECT * FROM users;" | mysql -uroot -p holberton
Enter password: 
ERROR 1146 (42S02) at line 1: Table 'holberton.users' doesn't exist
bob@dylan:~$ 
bob@dylan:~$ cat 1-country_users.sql | mysql -uroot -p holberton
Enter password: 
bob@dylan:~$ 
bob@dylan:~$ echo 'INSERT INTO users (email, name, country) VALUES ("bob@dylan.com", "Bob", "US");' | mysql -uroot -p holberton
Enter password: 
bob@dylan:~$ echo 'INSERT INTO users (email, name, country) VALUES ("sylvie@dylan.com", "Sylvie", "CO");' | mysql -uroot -p holberton
Enter password: 
bob@dylan:~$ echo 'INSERT INTO users (email, name, country) VALUES ("jean@dylan.com", "Jean", "FR");' | mysql -uroot -p holberton
Enter password: 
ERROR 1265 (01000) at line 1: Data truncated for column 'country' at row 1
bob@dylan:~$ 
bob@dylan:~$ echo 'INSERT INTO users (email, name) VALUES ("john@dylan.com", "John");' | mysql -uroot -p holberton
Enter password: 
bob@dylan:~$ 
bob@dylan:~$ echo "SELECT * FROM users;" | mysql -uroot -p holberton
Enter password: 
id  email   name    country
1   bob@dylan.com   Bob US
2   sylvie@dylan.com    Sylvie  CO
3   john@dylan.com  John    US
bob@dylan:~$
```

## [2. Best band ever!](./2-fans.sql)
Write a SQL script that ranks country origins of bands, ordered by the number of (non-unique) fans

Requirements:

* Import this table dump: [metal_bands.sql.zip](https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/misc/2020/6/ab2979f058de215f0f2ae5b052739e76d3c02ac5.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20211208%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211208T193420Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=145901c8f91d17c729794949c1b5071f449b898f63b599bf32ef4fccb02fff1d)
* Column names must be: `origin` and `nb_fans`
* Your script can be executed on any database
Context: Calculate/compute something is always power intensive… better to distribute the load!

```
bob@dylan:~$ cat metal_bands.sql | mysql -uroot -p holberton
Enter password: 
bob@dylan:~$ 
bob@dylan:~$ cat 2-fans.sql | mysql -uroot -p holberton > tmp_res ; head tmp_res
Enter password: 
origin  nb_fans
USA 99349
Sweden  47169
Finland 32878
United Kingdom  32518
Germany 29486
Norway  22405
Canada  8874
The Netherlands 8819
Italy   7178
bob@dylan:~$ 
```

## [3. Old school band](./3-glam_rock.sql)
Write a SQL script that lists all bands with `Glam rock` as their main style, ranked by their longevity

Requirements:

* Import this table dump: `metal_bands.sql.zip`
* Column names must be: band_name and lifespan (in years)
* You should use attributes formed and split for computing the lifespan
* Your script can be executed on any database
```
bob@dylan:~$ cat metal_bands.sql | mysql -uroot -p holberton
Enter password: 
bob@dylan:~$ 
bob@dylan:~$ cat 3-glam_rock.sql | mysql -uroot -p holberton 
Enter password: 
band_name   lifespan
Alice Cooper    56
Mötley Crüe   34
Marilyn Manson  31
The 69 Eyes 30
Hardcore Superstar  23
Nasty Idols 0
Hanoi Rocks 0
bob@dylan:~$
```

## [4. Buy buy buy](./4-store.sql)
Write a SQL script that creates a trigger that decreases the quantity of an item after adding a new order.

Quantity in the table items can be negative.

Context: Updating multiple tables for one action from your application can generate issue: network disconnection, crash, etc… to keep your data in a good shape, let MySQL do it for you!
```
bob@dylan:~$ cat 4-init.sql | mysql -uroot -p holberton 
Enter password: 
bob@dylan:~$ cat 4-store.sql | mysql -uroot -p holberton 
bob@dylan:~$ cat 4-main.sql | mysql -uroot -p holberton 
Enter password: 
name    quantity
apple   10
pineapple   10
pear    10
--
--
name    quantity
apple   6
pineapple   10
pear    8
item_name   number
apple   1
apple   3
pear    2
```

## [5. Email validation to sent](./5-valid_email.sql)
Write a SQL script that creates a trigger that resets the attribute `valid_email` only when the `email` has been changed.

Context: Nothing related to MySQL, but perfect for user email validation - distribute the logic to the database itself!
```
bob@dylan:~$ cat 5-init.sql | mysql -uroot -p holberton
bob@dylan:~$ cat 5-valid_email.sql | mysql -uroot -p holberton 
bob@dylan:~$ cat 5-main.sql | mysql -uroot -p holberton 
Enter password: 
id  email   name    valid_email
1   bob@dylan.com   Bob 0
2   sylvie@dylan.com    Sylvie  1
3   jeanne@dylan.com    Jeanne  1
--
--
id  email   name    valid_email
1   bob@dylan.com   Bob 1
2   sylvie+new@dylan.com    Sylvie  0
3   jeanne@dylan.com    Jannis  1
--
--
id  email   name    valid_email
1   bob@dylan.com   Bob 1
2   sylvie+new@dylan.com    Sylvie  0
3   jeanne@dylan.com    Jannis  1

```

## [6. Add bonus](./6-bonus.sql)
Write a SQL script that creates a stored procedure `AddBonus` that adds a new correction for a student.

### Requirements:

* Procedure `AddBonus` is taking 3 inputs (in this order):
        `user_id`, a `users.id` value (you can assume `user_id` is linked to an existing `users`)
        `project_name`, a new or already exists `projects` - if no `projects.name` found in the table, you should create it
        `score`, the score value for the correction

Context: Write code in SQL is a nice level up!
```
bob@dylan:~$ cat 6-init.sql | mysql -uroot -p holberton
bob@dylan:~$ cat 6-bonus.sql | mysql -uroot -p holberton 
bob@dylan:~$ cat 6-main.sql | mysql -uroot -p holberton 
Enter password: 
id  name
1   C is fun
2   Python is cool
user_id project_id  score
1   1   80
1   2   96
2   1   91
2   2   73
--
--
--
--
id  name
1   C is fun
2   Python is cool
3   Bonus project
4   New bonus
user_id project_id  score
1   1   80
1   2   96
2   1   91
2   2   73
2   2   100
2   3   100
1   3   10
2   4   90
```

## [7. Average score](./7-average_score.sql)
Write a SQL script that creates a stored procedure `ComputeAverageScoreForUser` that computes and store the average score for a student. Note: An average score can be a decimal

#### Requirements:

* Procedure `ComputeAverageScoreForUser` is taking 1 input:
        `user_id`, a `users.id` value (you can assume `user_id` is linked to an existing `users`)
```
bob@dylan:~$ cat 7-init.sql | mysql -uroot -p holberton 
bob@dylan:~$ cat 7-average_score.sql | mysql -uroot -p holberton 
bob@dylan:~$ cat 7-main.sql | mysql -uroot -p holberton
Enter password: 
id  name    average_score
1   Bob 0
2   Jeanne  0
user_id project_id  score
1   1   80
1   2   96
2   1   91
2   2   73
--
--
--
--
id  name    average_score
1   Bob 0
2   Jeanne  82
```

## [8. Optimize simple search](./8-index_my_names.sql)
Write a SQL script that creates an index `idx_name_first` on the table `names` and the first letter of `name`.

#### Requirements:

* Import this table dump: [names.sql.zip](https://intranet-projects-files.s3.amazonaws.com/holbertonschool-webstack/632/names.sql.zip)
* Only the first letter of name must be indexed

Context: Index is not the solution for any performance issue, but well used, it’s really powerful!
```
bob@dylan:~$ cat names.sql | mysql -uroot -p holberton
bob@dylan:~$ mysql -uroot -p holberton
Enter password: 
mysql> SELECT COUNT(name) FROM names WHERE name LIKE 'a%';
bob@dylan:~$ cat 8-index_my_names.sql | mysql -uroot -p holberton 
bob@dylan:~$ mysql -uroot -p holberton
Enter password: 
mysql> SHOW index FROM names;
mysql> SELECT COUNT(name) FROM names WHERE name LIKE 'a%';

```

## [9. Optimize search and score](./9-index_name_score.sql)
Write a SQL script that creates an index `idx_name_first_score` on the table `names` and the first letter of `name` and the `score`.

#### Requirements:
* Import this table dump: `names.sql.zip`
* Only the first letter of `name` AND `score` must be indexed

```
bob@dylan:~$ cat names.sql | mysql -uroot -p holberton
bob@dylan:~$ mysql -uroot -p holberton
mysql> SELECT COUNT(name) FROM names WHERE name LIKE 'a%' AND score < 80;
bob@dylan:~$ cat 9-index_name_score.sql | mysql -uroot -p holberton 
bob@dylan:~$ mysql -uroot -p holberton
Enter password: 
mysql> SHOW index FROM names;
mysql> SELECT COUNT(name) FROM names WHERE name LIKE 'a%' AND score < 80;
```

## [10. Safe divide](./10-div.sql)
Write a SQL script that creates a function `SafeDiv` that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0.

#### Requirements:

* You must create a function
* The function `SafeDiv` takes 2 arguments:
           a, INT
           b, INT
* And returns `a / b` or 0 if `b == 0`
```
bob@dylan:~$ cat 10-init.sql | mysql -uroot -p holberton
bob@dylan:~$ cat 10-div.sql | mysql -uroot -p holberton
bob@dylan:~$ echo "SELECT (a / b) FROM numbers;" | mysql -uroot -p holberton
Enter password: 
(a / b)
5.0000
0.8000
0.6667
2.0000
NULL
0.7500
bob@dylan:~$ echo "SELECT SafeDiv(a, b) FROM numbers;" | mysql -uroot -p holberton
Enter password: 
SafeDiv(a, b)
5
0.800000011920929
0.6666666865348816
2
0
0.75

```

## [11. No table for a meeting](./11-need_meeting.sql)
Write a SQL script that creates a view `need_meeting` that lists all students that have a score under 80 (strict) and no `last_meeting` or more than 1 month.

#### Requirements:

* The view `need_meeting` should return all students name when:
        They score are under (strict) to 80
        AND no `last_meeting` date OR more than a month
```
bob@dylan:~$ cat 11-init.sql | mysql -uroot -p holberton
bob@dylan:~$ cat 11-need_meeting.sql | mysql -uroot -p holberton
bob@dylan:~$ cat 11-main.sql | mysql -uroot -p holberton
Enter password: 
name
Jean
Steeve
--
--
name
Bob
Jean
Steeve
--
--
name
Bob
Jean
--
--
name
Bob
--
--
name
Bob
Jean
--
--
View    Create View character_set_client    collation_connection
XXXXXX<yes, here it will display the View SQL statement :-) >XXXXXX
--
--
Table   Create Table
students    CREATE TABLE `students` (\n  `name` varchar(255) NOT NULL,\n  `score` int(11) DEFAULT '0',\n  `last_meeting` date DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=latin1
```

## [12. Average weighted score](./100-average_weighted_score.sql)
Write a SQL script that creates a stored procedure `ComputeAverageWeightedScoreForUser` that computes and store the average weighted score for a student.

#### Requirements:

* Procedure `ComputeAverageScoreForUser` is taking 1 input:
        `user_id`, a `users.id` value (you can assume `user_id` is linked to an existing `users`)

Tips:

[Calculate-Weighted-Average](https://www.wikihow.com/Calculate-Weighted-Average)

```
bob@dylan:~$ cat 100-init.sql | mysql -uroot -p holberton 
bob@dylan:~$ cat 100-average_weighted_score.sql | mysql -uroot -p holberton 
bob@dylan:~$ cat 100-main.sql | mysql -uroot -p holberton 
Enter password: 
id  name    average_score
1   Bob 0
2   Jeanne  82
id  name    weight
1   C is fun    1
2   Python is cool  2
user_id project_id  score
1   1   80
1   2   96
2   1   91
2   2   73
--
--
id  name    average_score
1   Bob 0
2   Jeanne  79
```

## [13. Average weighted score for all!](./101-average_weighted_score.sql)
Write a SQL script that creates a stored procedure `ComputeAverageWeightedScoreForUsers` that computes and store the average weighted score for all students.

#### Requirements:

* Procedure `ComputeAverageWeightedScoreForUsers` is not taking any input.

Tips:

[Calculate-Weighted-Average](https://www.wikihow.com/Calculate-Weighted-Average)

```
bob@dylan:~$ cat 101-init.sql | mysql -uroot -p holberton 
bob@dylan:~$ cat 101-average_weighted_score.sql | mysql -uroot -p holberton 
bob@dylan:~$ cat 101-main.sql | mysql -uroot -p holberton 
Enter password: 
id  name    average_score
1   Bob 0
2   Jeanne  0
id  name    weight
1   C is fun    1
2   Python is cool  2
user_id project_id  score
1   1   80
1   2   96
2   1   91
2   2   73
--
--
id  name    average_score
1   Bob 90.6667
2   Jeanne  79
```
