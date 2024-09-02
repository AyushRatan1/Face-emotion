% Example: Imbalanced Distribution of Emotion Classes

% Define emotion labels
emotionLabels = {'Angry', 'Disgust', 'Fear', 'Happy', 'Sad', 'Surprise', 'Neutral'};

% Define the number of samples for each emotion class
% (Example values to illustrate imbalance)
numSamples = [500, 100, 600, 3000, 700, 400, 1500];

% Create a bar graph to visualize the distribution
figure;
bar(numSamples, 'FaceColor', [0.2, 0.6, 0.8]);
title('Imbalanced Distribution of Emotion Classes');
xlabel('Emotion Classes');
ylabel('Number of Samples');
xticklabels(emotionLabels);
grid on;

% Optional: Highlight the imbalance
for i = 1:length(numSamples)
    if numSamples(i) < mean(numSamples)
        bar(i, numSamples(i), 'r'); % Highlight minority classes in red
    end
end

% Show the plot
set(gca, 'FontSize', 12);
