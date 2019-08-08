% This will calculate all feature values from given image set
clear all;
clc;

% Dataset size
Data_set_size = 6000;

% Intialise Data
Data = zeros(Data_set_size, 40);
Tag = zeros(Data_set_size, 1);

% Temporary variable
Temp = zeros(1, 40);



fprintf("\n\n");

fprintf("<====================Generating feature set matrix============================>\n ");

count = 0;

for i = 0:Data_set_size - 1
    % i -th file name
    image_name_str = ("BengaliBMP\bn" + extractAfter(int2str(100000 + i), 1) + ".bmp");
    
    % Converting image_name_str into character vector
    % We can only pass character vector into imread function
    image_name = convertStringsToChars(image_name_str);
    
    % Loading i - th image from folder.
    raw_img = imread(image_name);

    % Converting to gray scale
    gray_img = rgb2gray(raw_img);

    % Resize to row_sz x column_sz
    resize_img = imresize(gray_img,[32,32]);

    % Converting to binary
    bin = imbinarize(resize_img);
    
    Temp = feature_cal(bin);
    
    Data(i+1,:) = Temp;
    Tag(i+1) = mod(i, 10);
    
    count = count + 2;
    
    if count > 150
        fprintf(".");
        count = 0;
    end
    
end

fprintf("\n<=============================================================================>\n");

% Combine feature set and label data
Labled_data = [Data Tag];


% Creating csv file:
csvwrite("data.csv", Labled_data);

fprintf("\nCongrats!! Feature set successfully generated!!!\n");
    
    