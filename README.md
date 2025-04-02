# Data-Science-in-Finance-Dimension-Reduction
Analysis Data Science in Finance: Dimension Reduction using PCA (Principal Component Analysis) in R

## Overview
This repository demonstrates the application of Principal Component Analysis (PCA) for dimension reduction in finance data. PCA is a powerful technique used to reduce the complexity of large financial datasets by transforming the original variables into a smaller set of uncorrelated variables (principal components) that retain the most important information.

## Features
- **Principal Component Analysis (PCA)** for reducing dimensionality.
- Works with financial datasets to simplify analysis without losing critical information.
- R-based scripts for easy customization and analysis.

## Resources in this Repository
- `StudyCaseFor4Variabel.R`: PCA example using 4 variables in financial data.
- `StudyCaseFor8Variable.R`: PCA example using 8 variables in financial data.
- `dqlab_pcadata.xlsx`: Sample dataset used for PCA analysis.

## Requirements
Before running this project, make sure you have the following installed:
- **R** (preferably the latest version)
- R packages (you can install these directly within R)
  - `stats`
  - `ggplot2`
  - `dplyr`
  - `readxl`

## Steps to Run the Project

### Step 1: Clone the Repository
Start by cloning this repository to your local machine using the following command:
bash
git clone https://github.com/AdityaAnanta123/Data-Science-in-Finance-Dimension-Reduction.git

### Step 2: Install Required R Packages 
Open R or RStudio and install the necessary packages by running the following commands:

- install.packages("stats")
- install.packages("ggplot2")
- install.packages("dplyr")
- install.packages("readxl")

### Step 3: Load the Dataset
Make sure you have the dqlab_pcadata.xlsx file in the same directory where your R scripts are located. You can load the dataset into R using the following command:

library(readxl)
data <- read_excel("dqlab_pcadata.xlsx")

### Step 4: Run the PCA Analysis
For analyzing data with 4 variables, open and run the script StudyCaseFor4Variabel.R:
source("StudyCaseFor4Variabel.R")

For analyzing data with 8 variables, open and run the script StudyCaseFor8Variable.R:
source("StudyCaseFor8Variable.R")

The script will perform PCA and display the results, which include:
A summary of the principal components.
A plot of the explained variance.
A reduced dataset with fewer dimensions.
