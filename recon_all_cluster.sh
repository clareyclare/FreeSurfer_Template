#! /bin/bash



# Exit immediately if a command exits with a non-zero status.
set -e

# Treat unset variables as an error when substituting.
set -u


### input arguments
### 1. Subject Directory
### 2. BIDS subject list


freesurfer_subject_directory=$1
bids_subject_list=$2


IFS=', ' read -a bids_subject_list <<< "$bids_subject_list"

# Add Freesurfer to the path and modify your Subject Directory
# source /usr/local/apps/psycapps/config/freesurfer_bash_update /MRIWork/MRIWork10/pv/giusi_pollicina/Sounds_analysis/freesurfer

for subject in "${bids_subject_list[@]}"; do
    echo 'Generating freesurfer segmentation for : ' $subject

    log_folder=$freesurfer_subject_directory/logs/$subject
        mkdir -p $log_folder

        qsub    -l h_rss=4G \
                -o ${log_folder}/output_freesurfer_${subject}.out \
                -e ${log_folder}/error_freesurfer_${subject}.err \
                /MRIWork/MRI-Scratch/Freesurfer_Template/freesurfer_reconall.sh $freesurfer_subject_directory ${subject}
done




