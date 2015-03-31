JDC2014 - An eyetracking dataset from facilitating a semi-authentic multi-tabletop lesson
=======================================================

This dataset contains eye-tracking data from a single subject (a researcher), facilitating three collaborative learning lessons in a multi-tabletop classroom, with real 10-12 year old students. These sessions were recorded during an "open doors day" at the [CHILI Lab](http://chili.epfl.ch).

This dataset has been used in several scientific works, such as the [CSCL 2015](http://isls.org/cscl2015/) conference paper "The Burden of Facilitating Collaboration: Towards Estimation of Teacher Orchestration Load using Eye-tracking Measures", by Luis P. Prieto, Kshitij Sharma, Yun Wen & Pierre Dillenbourg. The analysis and usage of this dataset is available publicly at https://github.com/chili-epfl/cscl2015-eyetracking-orchestration

# Overall structure

Aside from this README.md file, the dataset is composed of two zip archives:

* JDC2014-EyetrackingData.zip : Contains the raw datasets from the mobile eyetracker that the main session facilitator was wearing, including eye measures time series, fixation and saccade details (as extracted using SMI's BeGaze 3.4 software).
* JDC2014-VideoCodingData.zip : Contains the codes from the manual video coding, by a single researcher, of the 10-second episodes in which the "load index" calculated from eyetracking metrics (see the [CSCL2015 paper report](https://github.com/chili-epfl/cscl2015-eyetracking-orchestration)) had extreme low/high values.

# Data gathering context and method

The data were gathered in the context of an open doors day in our lab, in which whole classrooms of students from nearby primary schools had the chance to experience new learning technologies. In this occasion, a room was set up with five augmented paper tabletop devices running an augmented-paper tabletop collaborative learning software about mathematics. A researcher (a novice in teaching to primary school children) played the role of the teacher/facilitator in **three sessions**, each simulating a math lesson about fractions, assisted by two other researchers and with the presence of two of the usual school teachers acting as observers, during approximately 40 minutes. In total, 61 primary school students (10-12 years old) attended these sessions.

This main facilitator wore a mobile eyetracker (SMI ETG 30Hz), from which eye movement and pupil dilation data were recorded. Later on, the data from the eye-tracker was exported (using SMI's BeGaze software v3.4), and a "load index" was calculated for each 10-second episode of the three sessions (see the [CSCL2015 paper report](https://github.com/chili-epfl/cscl2015-eyetracking-orchestration) for further details). From this set of 10-second episodes we selected those that had minimum (0) or maximum (4) cognitive load index, and performed a qualitative video coding of them, to assess the main trends/patterns in orchestration properties of high/low load episodes, regarding: the activity or intervention the teacher was performing, the social plane at which the activity was intended and the main focus of the teacher’s gaze during the episode. More details about the context and method used can be found in [Prieto et al. (2014)](http://dl.acm.org/citation.cfm?id=2669543).

# Detailed data structure

Below we describe briefly the format of the data files composing the dataset:

## JDC2014-SessionX-eyetracking-eventexport.txt (in JDC2014-EyetrackingData.zip)

Comma-separated value file (separator=",", comments="#", with headers). This is the raw eye measures time series as exported using BeGaze software. It has the following fields:

* Time : timestamp of the sample, in microseconds (number)
* Type : protocol used to detect the fixations ( SMP )
* Trial : trial of the eyetracking recording (number, 1)
* L Dia X [px] : left-eye pupil diameter X axis in pixels (number)
* L Dia Y [px] : left-eye pupil diameter Y axis in pixels (number)
* L Pupil Diameter [mm] : left-eye pupil diameter in mm (number)
* R Dia X [px] : right-eye pupil diameter X axis in pixels (number)
* R Dia Y [px] : right-eye pupil diameter Y axis in pixels (number)
* R Pupil Diameter [mm] : right-eye pupil diameter in mm (number)
* B POR X [px] : binocular point-of regard in the X axis, in pixels (number)
* B POR Y [px] : binocular point-of regard in the Y axis, in pixels (number) 
* L POR X [px] : left eye point-of regard in the X axis, in pixels (number)
* L POR Y [px] : left eye point-of regard in the Y axis, in pixels (number)
* R POR X [px] : right eye point-of regard in the X axis, in pixels (number)
* R POR Y [px] : right eye point-of regard in the Y axis, in pixels (number)
* L EPOS X : left pupil position from the perspective of the subjective camera, in the X axis, in pixels (number)
* L EPOS Y : left pupil position from the perspective of the subjective camera, in the Y axis, in pixels (number) 
* L EPOS Z : left pupil position from the perspective of the subjective camera, in the Z axis, in pixels (number)
* R EPOS X : right pupil position from the perspective of the subjective camera, in the X axis, in pixels (number)
* R EPOS Y : right pupil position from the perspective of the subjective camera, in the X axis, in pixels (number)
* R EPOS Z : right pupil position from the perspective of the subjective camera, in the X axis, in pixels (number)
* L GVEC X : left eye gaze vector, from the perspective of the left eye camera, X axis component (number)
* L GVEC Y : left eye gaze vector, from the perspective of the left eye camera, Y axis component (number) 
* L GVEC Z : left eye gaze vector, from the perspective of the left eye camera, Z axis component (number) 
* R GVEC X : right eye gaze vector, from the perspective of the left eye camera, X axis component (number)
* R GVEC Y : right eye gaze vector, from the perspective of the left eye camera, Y axis component (number)
* R GVEC Z : right eye gaze vector, from the perspective of the left eye camera, Z axis component (number)
* Frame : timestamp of the sample, in video feed hh:mm:ss:frame format (hh:mm:ss:frame)
* Aux1 : empty field
* B Event Info: type of event ( - | Saccade | Fixation | Blink )

## JDC2014-SessionX-eyetracking-fixationDetails.txt (in JDC2014-EyetrackingData.zip)

Comma-separated value file (separator=",", with headers). This is the export of the main fixation statistics, taken from the "Fixation details" section of BeGaze's Event Statistics (each row is a detected fixation). It has the following fields:

* Trial : trial of the eyetracking recording (e.g., "Trial001")
* Subject : identifier of the participant recorded (e.g., "Participant 11-2-unified")
* Color : color coding of the participant (e.g., "Coral")
* Name : Participant name (e.g., "Participant 11")
* Stimulus : video file to be matched with the gaze dat (i.e., the subjective video feed of the eye-tracker; e.g., "participant 11-2-recording.avi")
* Start Time [ms] : starting timestamp of the experiment, in milliseconds (number)
* End Time [ms] : end timestamp of the experiment, in milliseconds (number)
* Fixation Start [ms] : starting time of the fixation, in milliseconds (number)
* Fixation Duration [ms] : duration of the fixation, in milliseconds (number)
* Fixation End [ms] :  end time of the fixation, in milliseconds (number)
* Position X : position of the fixation, on the X axis, in pixels (number)
* Position Y : position of the fixation, on the Y axis, in pixels (number)
* Average Pupil Size [px] X : average pupil size in the X axis during the fixation, in pixels (number)
* Average Pupil Size [px] Y : average pupil size in the Y axis during the fixation, in pixels (number)
* Average Pupil Diameter [mm] : average pupil diameter during the fixation, in mm (number)
* Dispersion X : gaze dispersion during the fixation, on the X axis (number)
* Dispersion Y : gaze dispersion during the fixation, on the Y axis (number)
* Eye : what eye was the fixation captured on (normally, "Binocular")
* Number : fixation number (number, from 1 to the number of fixations in the session)


## JDC2014-SessionX-eyetracking-saccadeDetails.txt (in JDC2014-EyetrackingData.zip)

Comma-separated value file (separator=",", with headers). This is the export of the main saccade statistics, taken from the "Saccade details" section of BeGaze's Event Statistics (each row is a detected saccade). It has the following fields:


* Trial : trial of the eyetracking recording (e.g., "Trial001")
* Subject : identifier of the participant recorded (e.g., "Participant 11-2-unified")
* Color : color coding of the participant (e.g., "Coral")
* Name : Participant name (e.g., "Participant 11")
* Stimulus : video file to be matched with the gaze dat (i.e., the subjective video feed of the eye-tracker; e.g., "participant 11-2-recording.avi")
* Start Time [ms] : starting timestamp of the experiment, in milliseconds (number)
* End Time [ms] : end timestamp of the experiment, in milliseconds (number)
* Saccade Start [ms] : starting time of the saccade, in milliseconds (number)
* Saccade Duration [ms] : duration of the saccade, in milliseconds (number)
* Saccade End [ms] :  end time of the saccade, in milliseconds (number)
* StartPosition X : starting position of the saccade, on the X axis, in pixels (number)
* StartPosition Y : starting position of the saccade, on the Y axis, in pixels (number)
* EndPosition X : end position of the saccade, on the X axis, in pixels (number)
* EndPosition Y : end position of the saccade, on the Y axis, in pixels (number)
* Amplitude [°] : amplitude of the saccade, in degrees (number)
* Acceleration  Average [°/s²] : average acceleration of the saccade, in degrees per square-second (number) (empty field)
* Acceleration  Peak [°/s²] : maximum acceleration of the saccade, in degrees per square-second (number) (empty field)
* Deceleration  Peak [°/s²] : maximum deceleration of the saccade, in degrees per square-second (number) (empty field)
* Velocity  Average [°/s] : average saccade speed, in degrees per second (number) (empty field)
* Velocity  Peak [°/s] : peak velocity of the saccade, in degrees per second (number) (empty field)
* Peak Velocity at [%] : when in the saccade is the peak velocity located, in % from start to finish (number) (empty field)
* Eye : what eye was the fixation captured on (normally, "Binocular")
* Number : fixation number (number, from 1 to the number of fixations in the session)


## JDC2014-SessionX-videocoding.csv (in JDC2014-VideoCodingData.zip)

Comma-separated value file (separator=",", with headers), with the video codes assigned to different 10-second episodes by a single researcher/coder, along three main dimensions (only one code from each dimensions is assigned to an episode):

Orchestration dimension | Teacher activity | Social plane | Main gaze focus
------------------------|------------------|--------------|----------------
Example codes | Explanation/Lecturing (EXP), Monitoring (MON), Task distribution or transition (TDT), Technical or conceptual repairs, i.e., solving student questions (REP) | Small group (G), Class-wide (C) | Students’ faces (FAC) or backs (BAK), Tabletop surface (TAB), Teacher desk with manipulatives to distribute (MD), Classroom's whiteboard (W), Additional researchers/facilitators (RES), Single paper manipulatives not on the tabletop (M)

The file has the following fields:

* time : timestamp marking the middle-point of the 10-second window of the episode (number)
* Time.min : timestamp, in minutes/seconds, marking the middle-point of the episode (e.g., "2m50s")
* Session : session identifier ( JDC2014-Session1-eyetracking | JDC2014-Session2-eyetracking | JDC2014-Session3-eyetracking )
* Short.description : short qualitative description of what is going on during the episode (character)
* Activity : code along the teacher activity dimension ( EXP | MON | TDT | REP )
* Social : code along the social plane of interaction dimension ( C | G )
* Focus : code along the main focus of gaze dimension ( FAC | TAB | BAK | RES | MD | W | M )
