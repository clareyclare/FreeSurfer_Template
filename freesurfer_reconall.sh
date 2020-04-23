#! /bin/bash



# Exit immediately if a command exits with a non-zero status.
set -e

# Treat unset variables as an error when substituting.
set -u



### input arguments
### 1. Subject Directory
### 2. BIDS subject list


freesurfer_subject_directory=$1
subject=$2


# Add Freesurfer to the path and modify	your Subject Directory
source /usr/local/apps/psycapps/config/freesurfer_bash_update $freesurfer_subject_directory

recon-all -subject $subject -i /MRIWork/MRIWork10/pv/giusi_pollicina/Sounds_BIDS/${subject}/ses-mri/anat/${subject}_ses-mri_run-01_T1w.nii.gz -all
