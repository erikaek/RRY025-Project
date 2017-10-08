function filteredImages = GenerateFilteredImages(inputImage, gammaLList, gammaHList, cList)
  nbrOfGammaL = length(gammaLList);
  nbrOfGammaH = length(gammaHList);
  nbrOfC = length(cList);
  [imageHeight, imageWidth] = size(inputImage);

  %filteredImages = zeros(nbrOfGammaL, nbrOfGammaH, nbrOfK, ...
%			 imageHeight, imageWidth);

  for i = 1:nbrOfGammaL
    gammaL = gammaLList(i);
    for j = 1:nbrOfGammaH;
      gammaH = gammaHList(j);
      for k = 1:nbrOfC
	c = cList(k);
	filteredImage = homomorphic(inputImage, ...
				    0, ... % we don't worry about zeros in the logarithm.
				    gammaL, ...
				    gammaH, ...
				    c);	

	filteredImages{i, j, k} = filteredImage;
      end
    end
  end
end