clear all;
clc
SamplePath =  'H:\��������N��\20210507̨ɽʵ��_5�߹������\3\';  %�洢ͼ���·��
x = xlsread('D:\����\x.xlsx');

imgDataDir  = dir([SamplePath '*']); 

for tt=3:272
imagefile=[imgDataDir(tt).folder '\' imgDataDir(tt).name  '\' ];

fileExt = '*.bmp';  %����ȡͼ��ĺ�׺��
%��ȡ����·��
files = dir(fullfile(imagefile,fileExt)); 
len1 = size(files,1);
%����·����ÿһ��ͼ��
files1 = files(3:176,:);
files2 = files(1:2,:);
files3 = [files1; files2]; 

for i=1:len1-1
    fileName = strcat(imagefile,'\',files3(i).name); 
	image = imread(fileName);
    

    fileName2 = strcat(imagefile,'\',files3(i+1).name); 
    image2 = imread(fileName2);    

    %��������ͼ��
    imgA=image;
    imgB=image2;

    %����ת��
    imgA=double(imgA);
    imgB=double(imgB);

    %��׳���ж�
    [imgArow,imgAcol]=size(imgA);
    [imgBrow,imgBcol]=size(imgB);
    if imgArow<1||imgAcol<1||imgBrow<1||imgBcol<1
        error('������������ά������С��1');
    elseif imgArow~=imgBrow||imgAcol~=imgBcol
        error('������ľ���ά������ȣ�');
    end
    %������ͼ��ľ�ֵ��
    imgA=imgA-mean2(imgA);
    imgB=imgB-mean2(imgB);

    %��������ͼ������ϵ��
    CC(i,tt-2)=sum(sum(imgA.*imgB))./(sqrt(sum(sum(imgA.^2))).*sqrt(sum(sum(imgB.^2))));

end

end
% 
