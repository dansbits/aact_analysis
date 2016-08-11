# AACT Analysis

Aggregate Analysis of Clinical Trials (AACT) is a data set released by the
[Clinical Trials Transformation Initiative](http://www.ctti-clinicaltrials.org/)
which contains detailed data describing all studies registered on ClinicalTrials.gov.

This repository contains code for downloading, extracting and analyzing the AACT
data set. This includes:

1. Command line tools for ETL:
    - Download the data set from it's source
    - Extract the flat files into a MySQL database
    - Perform some useful transformations on the database

2. Analyses of the data within ipython notebooks

## Setup
You should have Ruby and Bundler installed. Once this is finished, install any missing gems using bundler.

```
bundle install
```

Before running any of the ETL commands you need  to set up a MySQL database and set up a secrets file. Make a copy of the secrets.yml.tpl file and name the new file 'secrets.yml'. Fill in the username, password, host and database name for your database in this file.

## Getting and preparing the data
The data set is released as pipe-delimited text files. I found it difficult to parse them because they contain unquoted strings with new lines. I couldn't find any CSV parsers to read them. I ended up rolling my own parser.

I've created a set terminal commands to make preparing the data as easy as possible. If you're database and secrets are set up as described above just run the following commands in the root of this repo.

```
# create the database schema
rake aact:create_db

# download the data and into a source_data directory in the root of this repository
rake aact:download

# load the data into the mysql database
rake aact:extract

# do some useful transformations 
# - currently this only converts all date strings to actual dates
rake aact:transform
```

If all of this runs without error you should now have data set to start analyzing.

## Analyses
You'll find my analyses within the analyses directory as ipython notebooks. I primarily use Ruby's Daru, statsample and related gems for analysis but you may find some python or R.
