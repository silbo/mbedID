%specify properties
cut_start = [10,10];
cut_size = [100,100];
channels = 1:3;

%load image
pic = imread('mclovin.jpg');
%cut image (we only need the face)
pic_cut = pic(cut_start(1):cut_start(1)+cut_size(1),cut_start(2):cut_start(2)+size(2),channels);
%process image (black and white)
pic_bw = rgb2gray(pic_cut);
%get edges of the image (using canny edge detection)
pic_edges = edge(pic_bw,'canny');

%plotting the result
subplot(2,2,1), image(pic), title('original image (RGB)');
subplot(2,2,2), image(pic_cut), title('cut image (RGB)');
subplot(2,2,3), image(pic_bw), title('bw image (BW)');
subplot(2,2,4), image(pic_edges), title('edges (BW)');
