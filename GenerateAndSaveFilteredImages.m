function GenerateAndSaveFilteredImages(inputImage, gammaLList, gammaHList, cList, fileName)
  filteredImageCollection = GenerateFilteredImages(inputImage, gammaLList, gammaHList, cList);
  save(fileName, 'gammaLList', 'gammaHList', 'cList', 'filteredImageCollection', '-mat');
end
