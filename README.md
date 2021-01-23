# PCA-in-MATLAB
This is a PCA project that I completed in MATLAB as part of an NYU course I took in Spring 2018. After loading the supporting data ("LSRP.xlsx"), I reverse coded the inversely-coded items; removed participants who did not answer all of the questions; and then plotted a histogram of the distribution of total scores. I conducted a princicpal component analysis (PCA) of the data, and used the Kaiser criterion to determined that there are 6 factors (6 bars above the eigenvalue criterion of 1), which I interpreted to be 1. Inconsiderate/Self-Centered, 2. Immoral, 3. Manipulative, 4. Immature, 5. Short-Term Thinking, 6. Bored. Finally, I plotted individuals in the factor space that resulted from the PCA applying labels to the axes according to these interpreted meanings. 

# About the supporting data
The supporting dataset ("LSRP.xlsx") contains results of 606 people who completed the Levension Self-Report Psychopathy Scale (LSRP), a test which is used to screen for Psychopathy. This dataset consists of Likert ageement scale responses (1 = strongly disagree, 5 = strongly agree) to 26 statements. In general, the higher the score is, the higher the likelihood that someone qualifies as a psychopath. To avoid response biases (some people say yes to everything), some of the items are “inversely coded.” 

# Instructions to Run 
There are no dependencies or assumptions to run this script, but you will need to copy the MATLAB script to a M-File (.m) and download the supporting dataset ("LSRP.xlsx"). 
