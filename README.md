This project involves the development of a real-time emotion detection system using deep learning techniques. The system captures live video feed from a webcam, detects faces in the video, and predicts the emotions displayed on those faces using a pre-trained Convolutional Neural Network (CNN) model. The detected emotions are then visualized in real-time with both text labels and a graphical bar chart.

Key Features:
Real-Time Face Detection: Utilizes MATLAB's Computer Vision Toolbox to detect faces in a live video stream.
Emotion Recognition: Employs a deep learning model trained on the FER-2013 dataset to classify emotions into categories such as Angry, Happy, Sad, Surprise, etc.
Live Visualization: Displays the real-time video feed alongside a bar chart that dynamically updates with the count of detected emotions.
User Interface: A custom MATLAB UI is used to enhance the user experience, making the system visually appealing and easy to use.
README
Project Overview
This MATLAB-based project implements a real-time emotion detection system using a deep learning model trained on the FER-2013 dataset. The system can identify seven different emotions from live video feed and display the results both as text annotations on the video and as a bar chart showing the frequency of each emotion detected.

Table of Contents
Installation
Usage
Model Training
Real-Time Detection
UI Customization
Toolboxes Required
Dataset
References
Installation
To get started with the project, ensure you have MATLAB installed along with the required toolboxes. You also need the FER-2013 dataset to train the model.

Clone the Repository:

bash
Copy code
git clone https://github.com/yourusername/emotion-detection-matlab.git
cd emotion-detection-matlab
Install Required Toolboxes: Ensure the following MATLAB toolboxes are installed:

Computer Vision Toolbox
Deep Learning Toolbox
Image Processing Toolbox
Download and Prepare Dataset: Download the FER-2013 dataset and extract it into the appropriate folder structure (train and test).

Usage
Train the Model: Use the provided script to train the CNN model on the FER-2013 dataset. The trained model will be saved as emotionNet.mat.

matlab
Copy code
trainEmotionModel;
Run Real-Time Emotion Detection: After training the model, use the following command to start the real-time emotion detection system.

matlab
Copy code
realTimeEmotionDetectionWithGraph;
Model Training
The CNN model is trained using the FER-2013 dataset. The dataset consists of grayscale images of faces, each labeled with one of seven emotions. The images are preprocessed by resizing them to 48x48 pixels. The model architecture includes several convolutional layers followed by fully connected layers.

Real-Time Detection
The realTimeEmotionDetectionWithGraph.m script captures live video feed using a webcam, detects faces using a Cascade Object Detector, and classifies each detected face using the trained CNN model. Detected emotions are displayed on the video feed, and a bar graph shows the frequency of each detected emotion.

UI Customization
The user interface is built using MATLAB's uifigure and uiaxes components. The UI is designed to be visually appealing with a dark theme, live video feed, and an updating bar chart.

Toolboxes Required
Computer Vision Toolbox
Deep Learning Toolbox
Image Processing Toolbox
Statistics and Machine Learning Toolbox (optional for advanced analysis)
Dataset
The FER-2013 dataset is used for training the model. It contains over 30,000 labeled images of facial expressions representing seven different emotions.

References
FER-2013 Dataset: https://www.kaggle.com/msambare/fer2013
MATLAB Documentation: https://www.mathworks.com/help/
