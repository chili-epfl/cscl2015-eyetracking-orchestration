Jetris - An eyetracking dataset from a Tetris-like task
=======================================================

This dataset contains eye-tracking data from a set of 16 subjects, playing a series of short games of Tetris (for up to 5 minutes each), in different conditions (e.g., collaborative vs competitive).

This dataset has been used in several scientific works, such as the [CSCL 2015](http://isls.org/cscl2015/) conference paper "The Burden of Facilitating Collaboration: Towards Estimation of Teacher Orchestration Load using Eye-tracking Measures", by Luis P. Prieto, Kshitij Sharma, Yun Wen & Pierre Dillenbourg. The analysis and usage of this dataset is available publicly at https://github.com/chili-epfl/cscl2015-eyetracking-orchestration

# Overall structure

Aside from this README.md file, the dataset is composed of two 

* ALLCombinedVariables_timeseriesPupilEvolution.csv.zip : The raw export of the eyetracker data (pupil diameters, gaze position, etc.), with additional game-related variables taken at that point in time
* fixationDetails.zip : It contains multiple csv files (one per game), with the export of the fixation details (e.g., fixation times, durations), as done by the SMI BGaze software

# Data gathering context and method

_TODO: Subjects, how data was gathered (eyetracker model, main specs, sample rate etc)_

# Detailed data structure

Below we describe briefly the format of the data files composing the dataset:

## ALLCombinedVariables_timeseriesPupilEvolution.csv

_TODO_

## ATESTvariables_XXXX.csv (fixationDetails.zip)

* start : moment in which the fixation starts (in ms) **from the start of the eyetracking session** (there may be more than one game in each such session)
* end : moment in which the fixation ends (in ms) **from the start of the eyetracking session** (there may be more than one game in each such session)
* side : which side of the screen is the subject looking at
* pupil : pupil size, in mm
* aoi : area of interest (normally, the game grid)
* row : in the game grid, at which row is the subject looking
* col : in the game grid, at which column is the subject looking