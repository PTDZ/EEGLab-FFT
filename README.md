## Scripts for FFT (Fast-fourier transform) analysis of multiple EEG datasets using EEGlab

**NOTE: All scripts are created for a particular experiment, but can be extended later. These are work files which are, in most cases, working only for a specified datasets. More comments and further explanation will be given soon.**

- Comments inside the scripts are in polish for now

***

**FFT_Power_Calculation.m**
- PSD calculation using Welsch method (can be changed to power calculation)
- automatic calculation of powers for all files stored in ALLEEG structure
- division into EEG bands and drawing of sample charts

**Automatic_Individual_FFT_charts.m**
- **Input:** previously calculated means with FFT_Power_Calculation.m + ALLEEG dataset

**Output: Individual FFT chart for each participant**
- **Sample:** FIG_FFT_Ind_Sample.png

**Plots_for_Clusters_Mean_FFT_Value.m**
- **Input:** MATLAB table, sample: Mean_Sample_Data.mat
- **Output:** sample FIG_BAR_Temporal right (TP-R).png


