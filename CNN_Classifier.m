%%%%%%% CLASSIFICATION %%%%%%%

cam = webcam('Integrated Webcam');
figure;
while true
    I = snapshot(cam);
    
    r = I(:, :, 1);
    g = I(:, :, 2);
    b = I(:, :, 3);
    
    justBlue = b - r/2 - g/2;
    bw = justBlue > 0;

    %find the center point
    [x, y] = find(bw);
    
    if ~isempty(x) && ~isempty(y)
        x_center = round(mean(x));
        y_center = round(mean(y));
        
        %calculate the radius
        S = sum(bw(bw>0));
        R = round(sqrt(S/pi))+20;
        
        %draw a circle focusing on the object
        marker = insertMarker(I,[y_center x_center],'o','color',...
                                            'green','size',R);
        I_crop = imcrop(I, [y_center-R x_center-R 2*R 2*R]);
    else
        marker = I;
        I_crop = I;
    end
    
    I_conv = imresize(I_crop,[32,32]);
    label = classify(convnet,I_conv);
    
    subplot(121); image(marker);
    subplot(122); image(I_conv); title(char(label));
    drawnow;    
end
