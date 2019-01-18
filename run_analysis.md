{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww21700\viewh12660\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \
#Samsung Dataset transformation project\
\
The script run_analysis.R includes the following variables:\
\
- raw_test is the raw test data loaded from the file x_test.txt\
- test_labels is the raw label data for test data set in raw_test and comes from the file Y_test.txt\
- raw_train is the raw training data loaded from the file X_train.txt\
- train_labels is the raw label data for the training data set in raw_train and comes from the file Y_train.txt\
\
- raw_combined is the raw_test and raw_train data merged together\
- labels_combined is the train and test labels data merged together\
\
- raw_features are the names of the columns for each feature and are loaded from the file features.txt\
- raw_labels are the names of the activities and are read from the file activity_labels.txt\
- activities is the combined set of labels from labelse_combined and raw_labels merged together\
\
- mean_and_std is the subset of only the features requested from raw_combined\
- clean_data is the final data set joined with the labels that is ultimately what is written to file}