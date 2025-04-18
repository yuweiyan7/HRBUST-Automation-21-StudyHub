X=imread('cameraman.jpg');
X1=rgb2gray(X);
BW_prewitt=edge(X1,'prewitt');%使用prewitt算子
BW_roberts=edge(X1,'roberts');%使用roberts算子
subplot(131),imshow(X),title('原图');
subplot(132),imshow(BW_prewitt),title('prewitt算子');
subplot(133),imshow(BW_roberts),title('roberts算子');