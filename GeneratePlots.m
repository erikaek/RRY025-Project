%% Generate 3x3x3 plots, varying all parameters.
clear all, clc, clf, close all;
load('first.mat');
for k = 1:length(cList)
  c = cList(k);
  figure();
  text = sprintf('$c$ = %.3f', c);
  h = suptitle(text);
  set(h,'Interpreter','latex');
  set(h,'FontSize', 16);

  z = 1;
  for i = 1:length(gammaLList)
    gammaL = gammaLList(i);
    for j = 1:length(gammaHList)
      gammaH = gammaHList(j);
      image = filteredImageCollection{i, j, k};

      subplot(3, 3, z);
      imshow(image, []);
      if ismember(z, [7, 8, 9])
	% last row	
	text = sprintf('$\\gamma_H$ = %.3f', gammaH);
        h = xlabel(text);
        set(h,'Interpreter','latex');
        set(h,'FontSize',15);
      end 
      if ismember(z, [1, 4, 7])
	% first column
	text = sprintf('$\\gamma_L$ = %.3f', gammaL);
        h = ylabel(text);
        set(h,'Interpreter','latex');
        set(h,'FontSize', 15);
      end
      z = z + 1;
    end
  end
		
  imageFileName = sprintf('first_%d.png', k);
  saveas(gcf, imageFileName);
end

%% Generate 50
clear all, clc, clf, close all;
originalImage = importdata('forest.mat');
load('second.mat');

nImages = length(gammaLList);
for i = 1:nImages
  figure(i);		
  gammaL = gammaLList(i);			  
  text = sprintf('$\\gamma_L$ = %.3f, $\\gamma_H$ = %.3f, $c$ = %.3f', gammaL, gammaHList, cList);
  h = suptitle(text);
  set(h, 'Interpreter', 'latex');
  set(h, 'FontSize', 16);
  gammaL = gammaLList(i);
  image = filteredImageCollection{i};
  differenceImage = image - originalImage;
			  
  subplot(2, 1, 1);
  imshow(image, []);			  
  subplot(2, 1, 2);			  
  imshow(differenceImage, []);			  
end
 
%% Generate 3x3 plots, varying gamma H and c parameters.
clear all, clc, clf, close all;
load('third.mat');

figure();

z = 1;
gammaL = gammaLList;
for k = 1:length(cList)
  c = cList(k);
  for j = 1:length(gammaHList)
    gammaH = gammaHList(j);
    image = filteredImageCollection{1, j, k};

    subplot(3, 3, z);
    imshow(image, []);
    if ismember(z, [7, 8, 9])
	% last row	
  	text = sprintf('$\\gamma_H$ = %.3f', gammaH);
      h = xlabel(text);
      set(h,'Interpreter','latex');
      set(h,'FontSize',15);
    end 
    if ismember(z, [1, 4, 7])
      %first column
      text = sprintf('$c$ = %.3f', c);
      h = ylabel(text);
      set(h,'Interpreter','latex');
      set(h,'FontSize', 15);
    end
    z = z + 1;
  end
end
		
  imageFileName = sprintf('first_%d.png');
  saveas(gcf, imageFileName);

