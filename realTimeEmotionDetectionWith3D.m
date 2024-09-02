% realTimeEmotionDetectionWith3D.m
function realTimeEmotionDetectionWith3D()
    % Load the trained model
    load('emotionNet.mat', 'net');

    % Initialize face detector and webcam
    faceDetector = vision.CascadeObjectDetector();
    cam = webcam();
    
    % Create a UI figure window
    fig = uifigure('Name', 'Real-Time Emotion Detection and 3D Visualization', 'Position', [100, 100, 1200, 600]);
    
    % Create axes for webcam feed
    axWebcam = uiaxes(fig, 'Position', [50, 50, 500, 500]);
    title(axWebcam, 'Webcam Feed');
    
    % Create axes for 3D face visualization
    ax3D = uiaxes(fig, 'Position', [650, 50, 500, 500]);
    title(ax3D, '3D Face Visualization');
    
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
                img = insertObjectAnnotation(img, 'rectangle', bbox(i, :), char(label));
                
                % Simulate 3D face visualization
                show3DFace(ax3D, faceGray, label);
            end
        end
        imshow(img, 'Parent', axWebcam);
        drawnow;
    end
end

function show3DFace(ax, faceImage, label)
    % Convert the face image to double and normalize
    faceImage = im2double(faceImage);
    
    % Simulate 3D data (for visualization purposes)
    [X, Y] = meshgrid(1:size(faceImage, 2), 1:size(faceImage, 1));
    Z = faceImage;
    
    % Clear the previous plot
    cla(ax);
    
    % Create the 3D surface plot
    surf(ax, X, Y, Z, 'EdgeColor', 'none');
    colormap(ax, gray);
    view(ax, 3);  % Set view to 3D
    title(ax, ['Detected Emotion: ', char(label)]);
    axis(ax, 'tight');
    axis(ax, 'vis3d');
    ax.XTick = [];
    ax.YTick = [];
    ax.ZTick = [];
end
