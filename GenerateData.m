clear all, clc, clf, close all;

% Load original image
originalImage = importdata('forest.mat');

GenerateAndSaveFilteredImages(originalImage, ...
			      [0.025, 0.25, 2.5], ... % gammaL
			      [0.025, 0.25, 2.5], ... % gammaH
			      [0.01, 0.1, 1.0], ...        % k
			      'first.mat');

GenerateAndSaveFilteredImages(originalImage, ...
			      linspace(0.025, 2.5, 100),... % gammaL
			      0.25, ... % gammaH
			      1.0, ...        % k
			      'second.mat');










