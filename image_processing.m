%specify properties
%in matrix the dimensions are a somehow reversed
cut = [15,17,190,125];
channels = 1:3;

%load image
pic = imread('mclovin.jpg');
%cut image (we only need the face)
pic_cut = pic(cut(1):cut(1)+cut(3),cut(2):cut(2)+cut(4),channels);
%process image (black and white) we use mean over third dimension
pic_bw = mean(pic_cut,3);
%grayscale is 0 (black) to 1 (white), 0..255 -> 0..1
pic_bw = pic_bw ./ 255;
%process image, edge detection
pic_edges = pic_bw;

pic_size = size(pic_bw);
pic_size(1) = pic_size(1) - 1;
pic_size(2) = pic_size(2) - 1;
for row = 1:pic_size(1)
	for col = 1:pic_size(2)
		value = pic_edges(row,col)-pic_edges(row,col+1);
		if (value>0.1) 
			value = 1;
		end
		pic_edges(row,col) = value;
	end
end

%plotting the result
subplot(2,2,1), image(pic), title('original image (RGB)');
subplot(2,2,2), imshow(pic_cut), title('cut image (RGB)');
subplot(2,2,3), imshow(pic_bw), title('bw image (BW)');
subplot(2,2,4), imshow(pic_edges), title('edges (BW)');
