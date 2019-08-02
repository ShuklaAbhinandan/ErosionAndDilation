camlist=webcamlist;
cam=webcam(1);
preview(cam);
img=snapshot(cam);


I=im2bw(img);
BNW=I;
Dil=I;
Ero=I;

BNW=padarray (BNW, [1 1]);
[r,c]=size(BNW);

for i=2:r-1
  for j=2:c-1
    a=BNW(i-1:i+1,j-1:j+1);
    s=sum(sum (a, 1));
    if(s >= 1)
      Dil(i-1,j-1,:)=1;
    end
  end
end


for i=2:r-1
  for j=2:c-1
    a=BNW(i-1:i+1,j-1:j+1);
    s=sum(sum (a, 1));
    if(s < 9)
      Ero(i-1,j-1,:)=0;
    end
  end
end

figure,imshow(I),title('ORIGINAL IMAGE');
figure,imshow(Dil),title('DILATION IMAGE');
figure,imshow(Ero),title('ERODED IMAGE');
