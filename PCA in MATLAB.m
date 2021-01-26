%% PCA in MATLAB
%This is the script for a project where I used PCA to reduce the dimensions of psychopathy score results taken using the Levenson
%Self-Report Psychopathy Scale (LSRP).
%Version 1: 4/19/18
%Dependencies and Assumptions: none


%% Clearing all and starting the assignment

clear all %Clears the Workspace
close all %Closes all figuresg
clc %Clears the Command Window


%% Loading in the data (see other files for supporting data)

rawdata = xlsread('LSRP.xlsx');
data = rawdata(:,1:26); %Isolating the first 26 columns, which contain the LSRP results


%% Reversing the coding of the inversely-scored items (6, 14, 19, 22, 24, 25, 26)

for jj = [6 14 19 22 24 25 26]
data(:,jj) = data(:,jj) * -1 + 6;
end


%% Removing missing data

[ii,hh] = find(isnan(data));
data(ii,:)= []; %Eliminate everyone with at least 1 missing value


%% Making a histogram of the distribution of total scores

total= NaN(length(data),1); %Creating an empty vector the length of the data matrix
for ii= 1:length(data)
    total(ii) = sum(data(ii,:)); %Summing each row of the data matrix into the 'total' vector
end
histogram(total)
title('Total Psychopathy Scores)')
xlabel('Score on the Levenson Self-Report Psychopathy Scale (LSRP)')
ylabel('Frequency of Score')


%% Doing a principal component analysis (PCA) of the data

mW= mean(data(:)); %Finding the linear mean
sW = std(data(:)); %Finding the standard deviation
data = (data  - mW)./sW; %Normalizing the data matrix

[eigVec,rotVal,eigVal] = pca(data); %Performing the PCA


%% Determining how many factors there are

x = 1:length(eigVal); %Creating an x-base
figure %Making a screeplot
bar(x,eigVal)
line([0 27], [1 1])

%Using the Kaiser criterion, there are 6 factors (there are 6 bars above the eigenvalue criterion of 1)


%% Making a figure of the PCA results
%Since there are 6 factors, we need combinations of 6 taken in pairs of 2, so 15 subplots/scatterplots. I interpret these 6 factors to be:
%1. Inconsiderate/Self-Centered
%2. Immoral
%3. Manipulative
%4. Immature
%5. Short-Term Thinking
%6. Bored

figure
screenSize = get(0,'ScreenSize'); %Identifying the size of the screen
set(gcf,'Position',screenSize) %Makes the figure the same size as the screen
set(gcf, 'MenuBar', 'none') %Turns off the menubar in the figure
set(gcf, 'ToolBar', 'none') %Turns off the toolbar in the figure
set(gcf, 'color', 'w') %Making the figure white

subplot(5,3,1)
plot(rotVal(1:length(data),1),rotVal(1:length(data),2),'.','color','k') %Graphing each comparison in the factor space
xlabel('Inconsiderate/Self-Centered')
ylabel('Immoral')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,2)
plot(rotVal(1:length(data),1),rotVal(1:length(data),3),'.','color','k')
xlabel('Inconsiderate/Self-Centered')
ylabel('Manipulative')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,3)
plot(rotVal(1:length(data),1),rotVal(1:length(data),4),'.','color','k')
xlabel('Inconsiderate/Self-Centered')
ylabel('Immature')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,4)
plot(rotVal(1:length(data),1),rotVal(1:length(data),5),'.','color','k')
xlabel('Inconsiderate/Self-Centered')
ylabel('Short-Term Thinking')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,5)
plot(rotVal(1:length(data),1),rotVal(1:length(data),6),'.','color','k')
xlabel('Inconsiderate/Self-Centered')
ylabel('Bored')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,6)
plot(rotVal(1:length(data),2),rotVal(1:length(data),3),'.','color','k')
xlabel('Immoral')
ylabel('Manipulative')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,7)
plot(rotVal(1:length(data),2),rotVal(1:length(data),4),'.','color','k')
xlabel('Immoral')
ylabel('Immature')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,8)
plot(rotVal(1:length(data),2),rotVal(1:length(data),5),'.','color','k')
xlabel('Immoral')
ylabel('Short-Term Thinking')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,9)
plot(rotVal(1:length(data),2),rotVal(1:length(data),6),'.','color','k')
xlabel('Immoral')
ylabel('Bored')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,10)
plot(rotVal(1:length(data),3),rotVal(1:length(data),4),'.','color','k')
xlabel('Manipulative')
ylabel('Immature')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,11)
plot(rotVal(1:length(data),3),rotVal(1:length(data),5),'.','color','k')
xlabel('Manipulative')
ylabel('Short-Term Thinking')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,12)
plot(rotVal(1:length(data),3),rotVal(1:length(data),6),'.','color','k')
xlabel('Manipulative')
ylabel('Bored')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,13)
plot(rotVal(1:length(data),4),rotVal(1:length(data),5),'.','color','k')
xlabel('Immature')
ylabel('Short-Term Thinking')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,14)
plot(rotVal(1:length(data),4),rotVal(1:length(data),6),'.','color','k')
xlabel('Immature')
ylabel('Bored')
set(gca, 'tickdir', 'out')
box off

subplot(5,3,15)
plot(rotVal(1:length(data),5),rotVal(1:length(data),6),'.','color','k')
xlabel('Short-Term Thinking')
ylabel('Bored')
set(gca, 'tickdir', 'out')
box off
