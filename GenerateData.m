clear all, clc, clf, close all;

% Load original image
originalImage = importdata('forest.mat');

GenerateAndSaveFilteredImages(originalImage, ...
			      [0.025, 0.25, 2.5], ... % gammaL
			      [0.2, 2, 20], ... % gammaH
			      [0.1, 1.0, 10], ...        % k
			      'first.mat');

GenerateAndSaveFilteredImages(originalImage, ...
			      linspace(0.01, 0.5, 50),... % gammaL
			      2, ... % gammaH
			      0.1, ...        % k
			      'second.mat');


GenerateAndSaveFilteredImages(originalImage, ...
            0.1, ... % gammaL
            [0.02 2 200], ...
			      [0.01, 1.0, 100], ...        % k
			      'third.mat');







