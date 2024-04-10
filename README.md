# Introduction to Stata

## Event Website:
https://cstat.msu.edu/event/introduction-stata

## Event Description:
In this 60-minute seminar, you will learn about the basics of Stata and how to
best use Stata in the data analysis process. In particular, we will walk through
a simple project to demonstrate the typical workflow in Stata as well as how to
use Stata’s command syntax to achieve the following tasks:

1. Importing data
2. Cleaning data and doing basic data/variable transformation
3. Exploring data with basic visualization and descriptive statistics
4. Running statistical tests and fitting models
5. Reporting results and saving data

Along the way, we will also discuss tips and tricks to manage your research
project effectively and ensure reproducibility when using Stata.

**Prerequisites:**

* We assume no prior knowledge of using Stata but some basic knowledge/interest 
in data analysis
* Stata installed and working, preferably Stata 16 and up but older versions 
will work (If you need help with installing Stata or do not have Stata on your 
personal machine, please email Anh Do at doanh\[@\]msu.edu)
* Basic knowledge of your computer

## Before the Event:
Please make sure that you follow these steps prior to the workshop. Because the
event only lasts 60 minutes, we will have more time to cover the core materials
if everyone comes prepared. If you run into any issues, feel free to send me an
email at doanh\[@\]msu.edu as soon as possible.

1. Check that you have Stata installed and running on your device.
2. Download all files/folders from this Git repository to your computer, keeping
all file names unchanged. I suggest that you create a folder named
"stata_workshop_2024" (or any name of your choice) on your computer and download
all files here into that folder. You should have this file structure on your
computer:

```bash
stata_workshop_2024                           # ROOT folder
    ├── README.md                             # README file
    ├── code                                  # Stata do files
    │   ├── 01_master.do
    │   ├── 02_process_data.do
    │   ├── 03_explore_data.do
    │   └── code_folder_info.txt
    ├── final_data                            # Processed data
    │   └── final_data_folder_info.txt
    ├── log                                   # Stata log files
    │   └── log_folder_info.txt
    ├── output                                # Graphs and tables
    │   └── output_folder_info.txt
    └── raw_data                              # Raw data
        ├── gpa2_mod.csv
        └── raw_data_folder_info.txt
```

## Helpful Resources:
1. https://www.statalist.org/

## Data Source:
This workshop uses a modified version of the GPA2.DTA data file from 
"Introductory Econometrics: A Modern Approach, 7e" by Jeffrey M. Wooldridge.
