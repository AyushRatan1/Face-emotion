function realTimeEmotionDetectionWithGraph()
    % Load the trained model
    load('emotionNet.mat', 'net');

    % Initialize face detector and webcam
    faceDetector = vision.CascadeObjectDetector();
    cam = webcam();

    % Create a UI figure window
    fig = uifigure('Name', 'Real-Time Emotion Detection', 'Position', [100, 100, 1200, 600]);
    fig.Color = [0.1, 0.1, 0.1];  % Dark background color
    
    % Create axes for webcam feed
    axWebcam = uiaxes(fig, 'Position', [50, 50, 700, 500]);
    title(axWebcam, 'Webcam Feed', 'Color', 'white', 'FontSize', 16, 'FontWeight', 'bold');
    axWebcam.XColor = 'none';
    axWebcam.YColor = 'none';
    axWebcam.Color = [0.15, 0.15, 0.15];  % Slightly lighter background
    
    % Create axes for emotion graph
    axGraph = uiaxes(fig, 'Position', [800, 50, 350, 500]);
    title(axGraph, 'Emotion Count', 'Color', 'white', 'FontSize', 16, 'FontWeight', 'bold');
    axGraph.XColor = [0.8, 0.8, 0.8];
    
    axGraph.YColor = [0.8, 0.8, 0.8];
    axGraph.Title.Color = 'white';
    axGraph.XLabel.Color = 'white';
    axGraph.YLabel.Color = 'white';
    axGraph.GridColor = [0.5, 0.5, 0.5];
    axGraph.XGrid = 'on';
    axGraph.YGrid = 'on';
    axGraph.Color = [0.15, 0.15, 0.15];  % Slightly lighter background

    % Emotion labels and count
    emotionLabels = {'Angry', 'Disgust', 'Fear', 'Happy', 'Sad', 'Surprise', 'Neutral'};
    emotionCount = zeros(1, length(emotionLabels));

    % Initialize bar graph
    b = bar(axGraph, emotionCount);
    axGraph.XTickLabel = emotionLabels;
    axGraph.YLabel.String = 'Count';
    b.FaceColor = 'flat';
    b.CData = repmat([0.2, 0.8, 0.8], length(emotionLabels), 1);  % Cyan bars
    ylim(axGraph, [0 10]);

    % Add a subtitle
    subtitle(axGraph, 'Real-Time Emotion Detection Counts', 'Color', 'white', 'FontSize', 12, 'FontWeight', 'bold');

    % Create a loop to continuously capture frames from the webcam
    while isvalid(fig)
        img = snapshot(cam);
        bbox = step(faceDetector, img);
        if ~isempty(bbox)
            for i = 1:size(bbox, 1)
                face = imcrop(img, bbox(i, :));
                face = imresize(face, [48 48]);
                faceGray = rgb2gray(face);  % Convert to grayscale if necessary
                label = classify(net, faceGray);
                emotionIdx = find(strcmpi(char(label), emotionLabels));
                if ~isempty(emotionIdx)
                    emotionCount(emotionIdx) = emotionCount(emotionIdx) + 1;
                end
                img = insertObjectAnnotation(img, 'rectangle', bbox(i, :), char(label), ...
                    'TextBoxOpacity', 0.9, 'FontSize', 12, 'Color', 'cyan', 'LineWidth', 2);
            end
        end
        imshow(img, 'Parent', axWebcam);
        b.YData = emotionCount;  % Update bar graph data
        drawnow;
    end
end
