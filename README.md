# Bookmarks manager

## User Stories

```
As a user
So that I can go to websites I visit regularly
I want to be able to see a list of bookmarks
```
### Domain Model

![domain model](images/US1.jpg)

### Database setup

* Connect to psql
* Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
* Connect to the database using the `pqsl` command `\c bookmark_manager;`
* Run the query we have saved in the file `01_create_bookmarks_table.sql`
