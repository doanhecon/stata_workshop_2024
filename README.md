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
* Basic knowledge of your computer, for example, how to organize files and
folders, how to locate a file and its path, how to unzip folders, etc.

## Before the Event:

Please make sure that you follow these steps prior to the workshop. Because the
event only lasts 60 minutes, we will have more time to cover the core materials
if everyone comes prepared. If you run into any issues, feel free to send me an
email at doanh\[@\]msu.edu as soon as possible.

1. Check that you have Stata installed and running on your device.

2. Check your inbox for an email from CSTAT with a zip file named
"stata_workshop_2024.zip". Download and unzip this file. This is the sample
project that we will walk through together during the workshop. The content is
the same as what you find here in this Git repository. **If you have done this,
you're set and can skip step 3!**

3. In case you cannot find the email from us with the zip file, you can download
all files/folders directly from this Git repository to your computer, keeping
all file names unchanged. **To do so**: On the top right of this page, click on
the green button that says "Code", then click on "Download ZIP", save the zip
file as "stata_workshop_2024", and unzip it on your computer.

Once you have completed these steps, you should have this file structure on your
computer:

```bash
stata_workshop_2024                             # ROOT folder
    ├── README.md                               # README file
    ├── code                                    # Stata .do files
    │   ├── 01_master.do                        
    │   ├── 02_process_data.do
    │   ├── 03_explore_data.do
    │   ├── 04_analysis.do
    │   └── code_folder_info.txt
    ├── final_data                              # Processed data
    │   └── final_data_folder_info.txt
    ├── log                                     # Stata log files
    │   └── log_folder_info.txt
    ├── output                                  # Graphs and tables
    │   └── output_folder_info.txt
    └── raw_data                                # Raw data
        ├── gpa2_mod.csv
        └── raw_data_folder_info.txt
```

## Helpful Resources:

Here is a list of resources that I find helpful. I will update this list over
time.

1. Statalist, the official Stata forum: [Statalist](https://www.statalist.org/)
2. UCLA Office of Advanced Research Computing:
[OARC](https://stats.oarc.ucla.edu/stata/)
3. Other resources recommended by Stata:
[Link](https://www.stata.com/links/resources-for-learning-stata/)
4. The Stata workflow guide by Asjad Naqvi: [Medium
article](https://medium.com/the-stata-guide/the-stata-workflow-guide-52418ce35006)
5. The Do's and Don'ts of a Do file by Emmanuel Milet:
[PDF](https://www.parisschoolofeconomics.eu/docs/yin-remi/do-file.pdf)

## Data Source:

This workshop uses a modified version of the GPA2.DTA data file from 
"Introductory Econometrics: A Modern Approach, 7e" by Jeffrey M. Wooldridge.
