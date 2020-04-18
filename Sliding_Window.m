I1 = imread('D:\Research\Autonomous Car\Matlab Code\50b.jpg');
figure;
imshow(I1);
hold on;

rectangle('Position',[50,50,100,100],...
            'Curvature',[0,0],...
            'EdgeColor', 'g',...
            'LineWidth', 2,...
            'LineStyle','-')



[y1,x1,z1] = size(I1);

row = 0;
col = 0;

WinH = 200;
WinW = WinH;

Stride = 50;

i=0; j=0;

figure;
while(true)    
    for col = 0:Stride:(y1-WinH)
        for row = 0:Stride:(x1-WinH)
            pos = [row (col+WinH/2)];
            I2 = insertMarker(I1,pos,'s','color','green','size',WinH);
    
            I_crop = imcrop(I1, [row col WinH WinW]);
            
            subplot(121); imshow(I2);
            subplot(122); imshow(I_crop); %title(char(label));
            drawnow; 
            pause(0.1);
        end
    end
end


