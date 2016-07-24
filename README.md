# Analysis of AACT

Aggregate Analysis of Clinical Trials (AACT) is a data set released by the
[Clinical Trials Transformation Initiative](http://www.ctti-clinicaltrials.org/)
which contains detailed data describing all studies registered on ClinicalTrials.gov.

This repository contains code for downloading, extracting and analyzing the AACT
data set. This includes:

1. Command line for very simple ETL:
  - Download the data set from it's source
  - Extract the flat files into a MySQL database
  - Perform some useful transformations on the database


2. Analyses of the data within ipython notebooks
