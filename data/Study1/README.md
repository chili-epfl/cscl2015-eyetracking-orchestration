Jetris - An eyetracking dataset from a Tetris-like task
=======================================================

This dataset contains eye-tracking data from a set of 16 subjects, playing a series of short games of Tetris (for up to 5 minutes each), in different conditions (e.g., collaborative vs competitive).

This dataset has been used in several scientific works, such as the [CSCL 2015](http://isls.org/cscl2015/) conference paper "The Burden of Facilitating Collaboration: Towards Estimation of Teacher Orchestration Load using Eye-tracking Measures", by Luis P. Prieto, Kshitij Sharma, Yun Wen & Pierre Dillenbourg. The analysis and usage of this dataset such paper is available publicly at https://github.com/chili-epfl/cscl2015-eyetracking-orchestration

# Overall structure

Aside from this README.md file, the dataset is composed of two 

* ALLCombinedVariables_timeseriesPupilEvolution.csv.zip : The raw export of the eyetracker data (pupil diameters, gaze position, etc.), with additional game-related variables taken at that point in time
* fixationDetails.zip : It contains multiple csv files (one per game), with the export of the fixation details (e.g., fixation times, durations), as done by the SMI BGaze software

# Data gathering context and method

The data were gathered in a controlled lab study in collaboration with University of Lausanne ([Prof. Lorenz Goette](https://applicationspub.unil.ch/interpub/noauth/php/Un/UnPers.php?PerNum=1081343)). The participants were asked to play a two-player Tetris game while the gaze of one of the players was being recorded. There were 16 pairs playing (thus, 16 subjects were recorded), and each pair played 8 games, with a maximum of 5 minutes of gameplay.

The gaze was recorded using a fixed eye-tracker (SMI RED 250), from which eye movement and pupil dilation data were recorded, along with main Tetris game variables (like stack height and its variance). Later on, the data from the eye-tracker was exported (using SMI's BeGaze software v3.4), and a "load index" was calculated for each 10-second episode of the three sessions (see the CSCL2015 paper report for further details).


# Detailed data structure

Below we describe briefly the format of the data files composing the dataset:

## ALLCombinedVariables_timeseriesPupilEvolution.csv (within ALLCombinedVariables_timeseriesPupilEvolution.csv.zip)

Comma-separated value file (separator=",") with headers, with the following fields:

* gameID : identifier of the tetris game (number)
* time[milliseconds] : timestamp of the sample, within a session (number)
* Screen.side : to which side of the screen the participant was looking ( left | right )
* Pupil.size : pupil size, in pixels (number)
* Screen.area : which area within the screen the subject is looking at ( time | self-score | other-score | grid )
* Grid.area : which area of the grid the subject is looking at ( stack | self-tetrimino | other-tetrimino )
* Number.Holes : number of holes that the participant had left within his stack (number)
* Stack.height.min : minimal height of the tetris block stack at this point in time (number)
* Stack.height.max : maximal height of the tetris block stack at this point in time (number)
* Stack.height.mean : mean height of the tetris block stack at this point in time (number)
* Stack.height.variance : variance of the height of the tetris block stack at this point in time (number)
* Score.1 , Score.2 : Tetris game score for players 1 and 2 (number)
* Speed : saccade speed, in pixels per millisecond (number)
* Pupil.change : pupil size as a proportion of initial pupil size (Pupil.size/Pupil.initial)
* Pupil.initial : initial pupil size, in pixels (number)

## ATESTvariables_XXXX.csv (within fixationDetails.zip)

Comma-separated value files (separator=",") with headers, with the following fields:

* start : moment in which the fixation starts (in ms) **from the start of the eyetracking session** (there may be more than one game in each such session) (number)
* end : moment in which the fixation ends (in ms) **from the start of the eyetracking session** (there may be more than one game in each such session) (number)
* side : which side of the screen is the subject looking at ( left | right )
* pupil : pupil size, in mm (number)
* aoi : area of interest ( time | self-score | other-score | grid )
* row : in the game grid, at which row is the subject looking at (number)
* col : in the game grid, at which column is the subject looking at (number)
