% evaluateModel.m
function evaluateModel()
    % Load the trained model
    load('emotionNet.mat', 'net');

    % Load and preprocess the test dataset
    [~, augTest] = loadEmotionDataset();

    % Predict the labels of the test set
    predictedLabels = classify(net, augTest);

    % Get the actual labels
    actualLabels = augTest.UnderlyingDatastores{1}.Labels;

    % Calculate accuracy
    accuracy = mean(predictedLabels == actualLabels);

    % Display accuracy
    fprintf('Test set accuracy: %.2f%%\n', accuracy * 100);

    % Plot confusion matrix
    figure;
    confusionchart(actualLabels, predictedLabels);
end
