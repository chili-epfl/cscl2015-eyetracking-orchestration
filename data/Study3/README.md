DELANA - An eyetracking dataset from facilitating a series of laptop-based lessons
=======================================================

This dataset contains eye-tracking data from a two subjects (an expert and a novice teachers), facilitating three collaborative learning lessons (2 for the expert, 1 for the novice) in a classroom with laptops and a projector, with real master-level students. These sessions were recorded during a course on the topic of digital education and learning analytics at [EPFL](http://epfl.ch).

This dataset has been used in several scientific works, such as the [CSCL 2015](http://isls.org/cscl2015/) conference paper "The Burden of Facilitating Collaboration: Towards Estimation of Teacher Orchestration Load using Eye-tracking Measures", by Luis P. Prieto, Kshitij Sharma, Yun Wen & Pierre Dillenbourg. The analysis and usage of this dataset is available publicly at https://github.com/chili-epfl/cscl2015-eyetracking-orchestration

# Overall structure

Aside from this README.md file, the dataset is composed of two zip archives:

* DELANA-EyetrackingData.zip : Contains the raw datasets from the mobile eyetracker that the main session facilitator was wearing, including eye measures time series, fixation and saccade details (as extracted using SMI's BeGaze 3.4 software).
* DELANA-VideoCodingData.zip : Contains the codes from the manual video coding, by a single researcher, of the 10-second episodes in which the "load index" calculated from eyetracking metrics (see the [CSCL2015 paper report](https://github.com/chili-epfl/cscl2015-eyetracking-orchestration)) had extreme low/high values.

# Data gathering context and method

This study was performed in the context of a real master-level course at our university, on the topic of learning analytics and digital education. In this course several teachers and teaching assistants facilitate the different course sessions, which often combine lecturing and collaborative problem solving. We selected **two of these teachers** (an expert one with more than ten years of teaching experience, and a novice one with two years of only sporadic teaching assistantship), and recorded **three course sessions** of 45-65 minutes, with 12-14 students attending the class (two sessions for the expert teacher, one for the novice teacher). All sessions interspersed explanation/lecturing on the part of the teacher, with student individual and collaborative work (using laptops), and later debriefing of student outcomes. 

In each session, the teacher that acted as the main facilitator wore a mobile eyetracker (SMI ETG 30Hz), from which eye movement and pupil dilation data were recorded. Later on, the data from the eye-tracker was exported (using SMI's BeGaze software v3.4), and a "load index" was calculated for each 10-second episode of the three sessions (see the [CSCL2015 paper report](https://github.com/chili-epfl/cscl2015-eyetracking-orchestration) for further details). From this set of 10-second episodes we selected those that had minimum (0) or maximum (4) cognitive load index, and performed a qualitative video coding of them, to assess the main trends/patterns in orchestration properties of high/low load episodes, regarding: the activity or intervention the teacher was performing, the social plane at which the activity was intended and the main focus of the teacher’s gaze during the episode. More details about the method used can be found in [Prieto et al. (2014)](http://dl.acm.org/citation.cfm?id=2669543).

# Detailed data structure

Below we describe briefly the format of the data files composing the dataset:

## DELANA-SessionX-[Expert|Novice]-eyetracking-eventexport.txt (in DELANA-EyetrackingData.zip)

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
* B POR X [px] : binocular point-of regard
* B POR Y [px] : 
* L POR X [px] : 
* L POR Y [px] : 
* R POR X [px] : 
* R POR Y [px] : 
* L EPOS X : left pupil position from the perspective of the subjective camera
* L EPOS Y : 
* L EPOS Z : 
* R EPOS X : 
* R EPOS Y : 
* R EPOS Z : 
* L GVEC X : left eye gaze vector, from the perspective of the left eye camera
* L GVEC Y : 
* L GVEC Z : 
* R GVEC X : 
* R GVEC Y : 
* R GVEC Z : 
* Frame : timestamp of the sample, in video feed hh:mm:ss:frame format (hh:mm:ss:frame)
* Aux1 : empty field
* B Event Info: type of event ( - | Saccade | Fixation | Blink )

## DELANA-SessionX-[Expert|Novice]-eyetracking-fixationDetails.txt (in DELANA-EyetrackingData.zip)

Comma-separated value file (separator=";", with headers). This is the export of the main fixation statistics, taken from the "Fixation details" section of BeGaze's Event Statistics (each row is a detected fixation). It has the following fields:

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


## DELANA-SessionX-[Expert|Novice]-eyetracking-saccadeDetails.txt (in DELANA-EyetrackingData.zip)

Comma-separated value file (separator=";", with headers). This is the export of the main saccade statistics, taken from the "Saccade details" section of BeGaze's Event Statistics (each row is a detected saccade). It has the following fields:


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


## DELANA-videocoding.csv (in DELANA-VideoCodingData.zip)

Comma-separated value file (separator=",", with headers), with the video codes assigned to different 10-second episodes by a single researcher/coder, along three main dimensions (only one code from each dimensions is assigned to an episode):

Orchestration dimension | Teacher activity | Social plane | Main gaze focus
------------------------|------------------|--------------|----------------
Example codes | Explanation/Lecturing (EXP), Monitoring (MON), Task distribution or transition (TDT), Technical or conceptual repairs, i.e., solving student questions (REP), Posing questions to students and listening to their answers (QUEST) | Individual (IND), Small group (GRP), Class-wide (CLS) | Students’ faces (FAC) or backs (BAK), Teacher or student's table surface (TAB), Classroom's projector (PROJ), Classroom's whiteboard (WHIT), Additional teacher on the room (TEA), Teacher's own computer (TCOMP), Student's computer (SCOMP)



The file has the following fields:

* time : timestamp marking the middle-point of the 10-second window of the episode (number)
* Time.min : timestamp, in minutes/seconds, marking the middle-point of the episode (e.g., "2m50s")
* Session : session identifier ( DELANA-SessionX-[Expert|Novice]-eyetracking )
* Short.description : short qualitative description of what is going on during the episode (character)
* Activity : code along the teacher activity dimension ( EXP | MON | TDT | REP | QUEST )
* Social : code along the social plane of interaction dimension ( CLS | GRP | IND )
* Focus : code along the main focus of gaze dimension ( BAK | FAC | PROJ | SCOMP | TAB | TCOMP | TEA | WHIT )
