%%%%%%% TRAINING %%%%%%%

% Create Training Data
DatasetPath = fullfile('D:\Research\Deep Neural Network\DeepLearningDemos\DataSet2');
Data = imageDatastore(DatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
            
% Define the Network Layers
layers = [imageInputLayer([32 32 3])        
          convolution2dLayer(5,10)
          reluLayer
          maxPooling2dLayer(2,'Stride',2)   
          
          convolution2dLayer(3,5)
          reluLayer
          maxPooling2dLayer(2,'Stride',2)  
         
          fullyConnectedLayer(3)          
          softmaxLayer                      
          classificationLayer()];           

% Specify the Training Options
options = trainingOptions('sgdm','MaxEpochs',15, ...
	'InitialLearnRate',0.0001);

% Train the Network Using Training Data
convnet = trainNetwork(Data,layers,options);