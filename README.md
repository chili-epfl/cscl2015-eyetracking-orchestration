# cscl2015-eyetracking-orchestration
Preprocessing, analysis and visualization scripts for the [CSCL2015](http://isls.org/cscl2015/) conference paper, **"The Burden of Facilitating Collaboration: Towards Estimation of Teacher Orchestration Load using Eye-tracking Measures"** by Prieto, Sharma, Wen &amp; Dillenbourg.

Basically, this is a set of R scripts to help reproduce the download of raw data (the datasets used have been published [in Zenodo (MISSING LINK)]()), data pre-processing, analysis and visualizations used for the paper. All these processes are tied together by a report written in R Markdown, compiled using the knitr package.

## Requirements and Installation

In order to reproduce the paper's data analysis and generate the corresponding report, you need at least the following:

* An internet connection (to download the data)
* R
* RStudio (optional, but very convenient)
* The ```knitr``` package

## Usage

Basically, open the ```cscl2015-eyetracking-orchestration.Rmd``` file in RStudio, and click on ```Knit HTML```. An HTML version of the report should be generated.

## Project structure

The project is organized in a folder structure, inspired by [ProjectTemplate](http://projecttemplate.net/):

* data/ : Contains the scripts to download, uncompress and load the raw data
* lib/ : Contains some useful R scripts used throughout the report, such as the functions to calculate rolling windows, extract extreme load episodes to be video coded, etc.
