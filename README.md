# Bookmarks manager

## User Stories

```
As a user
So that I can go to websites I visit regularly
I want to be able to see a list of bookmarks
```
```
As a user
So that I can bookmark a new website
I want to be able to add a URL to my list of bookmarks
```
 ```
As a user
So that I can keep my bookmarks relevant
I want to delete a bookmark
```
```
As a user
So that I can keep my bookmarks up to date
I want to edit a bookmark
```
```
As a user
So that the bookmarks I save are useful
I want to only save a valid URL
```
```
As a user
So that I can make interesting notes
I want to add a Comment to a Bookmark
```
```
As a user
So that I can categorize my bookmarks
I want to add a Tag to a Bookmark
```
```
As a user
So that I can have a personalised bookmark list
I want to sign up with my email address
```
```
As a user
So that I can keep my account secure
I want to sign in with my email and password
```
### Domain Model

![domain model](images/bookmark_manager_13.png)

## Entity Relationship Diagram
 The below diagram indicates that:
- A Bookmark *has many* Comments
- A Comment *belongs to* a Bookmark
 ![Bookmark Manager entity relation diagram](./public/images/bookmark_manager_relations_17_1.png)


### Database setup

<!-- * Connect to psql
* Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
* Connect to the database using the `pqsl` command `\c bookmark_manager;`
* Run the query we have saved in the file `01_create_bookmarks_table.sql` -->

Connect to `psql` and create the `bookmark_manager` and `bookmark_manager_test` databases:
 ```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```
To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

  ```
 rackup -p 3000
 ```

 To view bookmarks, navigate to `localhost:3000/bookmarks`.

### To run tests:

 ```
 rspec
 ```

 ### To run linting:

 ```
 rubocop
 ```
