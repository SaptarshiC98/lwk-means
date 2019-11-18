X=load('C:\Users\User-PC\Desktop\ebooks\Project Summer of 2017\Lasso kmeans\np2.txt');
X=load('C:\Users\User-PC\Desktop\Datasets\ASU\COIL20')
[l,w]=wkmeans(X,3,1,0.08,5,30);
Class=[ones(1,10),2*ones(1,10),3*ones(1,10)];

[l,w,e,L]=wkmeans(X,2,10,1.1,30,30,Class);
e=zeros(1,20);
s=zeros(1,20);
o=zeros(1,20);
for i= 1:20
[~,~,e(i),s(i)]=k_lwkmeans(X,2,0.001/5000^2,Class);
disp(i)
end
mean(e)
[l,w,e,L]=wkmeans1(X,3,1,30,Class);
plot(1:5000,w);
[l,w,e,L]=wkmeans_PCA(X,2,5,0.04,5,30,Class);
[l,w,e,L]=wkmeans_PCA(X,k,5,0.04,5,30,30,Class);
X=X(1:72,:);
[l,w,e,L]=wk_lwkmeans(X,3,0.01);
[l,w,e,L,o]=lwkmeans(X,2,1);
%%%%%%%%%%%%%%%%%%%%%%%%COIL20%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('C:\Users\User-PC\Desktop\Datasets\ASU\COIL20')
X=X(1:144,:);
Class=Y(1:144,:);
[l,w,e,L]=k_lwkmeans(X,2,0.005/1024^2,Class);
e=zeros(1,20);
s=zeros(1,20);
for i= 1:20
[~,~,e(i),s(i)]=k_lwkmeans(X,2,0.005/1024^2,Class);
disp(i)
end
mean(e)
wh=[e',s'];
mean(wh)
median(wh)
[e,~,L]=my_ifpca(X',Class,2);
%%%%%%%%%%%%%%%________________iris__________________%%%%%%%%%%%%%%%%
X=load('Data\iris.csv');
Class=X(:,5);
X=X(:,1:4);
[l,w,e,L]=k_lwkmeans(X,3,0.5/150^2,Class);
e=zeros(1,20);
s=zeros(1,20);
for i= 1:20
[~,~,e(i),s(i)]=k_lwkmeans(X,3,200/150^2,Class);
disp(i)
end
mean(e)
wh=[e',s'];
mean(wh)
median(wh)
[e,~,L]=my_ifpca(X',Class,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%________________wine__________________%%%%%%%%%%%%%%%%
X=load('C:\Users\User-PC\Desktop\Datasets\classification keel\wine.csv');
Class=X(:,14);
X=X(:,1:13);
[l,w,e,L]=k_lwkmeans(X,3,1/178^2,Class);
e=zeros(1,20);
s=zeros(1,20);
for i= 1:20
[~,~,e(i),s(i)]=k_lwkmeans(X,3,1/178^2,Class);
disp(i)
end
mean(e)
wh=[e',s'];
mean(wh)
median(wh)
[e,~,L]=my_ifpca(X',Class,3);
%%%%%%%%%%%%%%%________________colon cancer__________________%%%%%%%%%%%%%%%%
X=load('C:\Users\User-PC\Desktop\Datasets\microarray\colon.x.txt');
X=X';
Class=load('C:\Users\User-PC\Desktop\Datasets\microarray\colon.y.txt');
[l,w,e,L]=k_lwkmeans(X,2,1/2000^2,Class);
e=zeros(1,20);
s=zeros(1,20);
for i= 1:20
[~,~,e(i),s(i)]=k_lwkmeans(X,2,0.00071/2000^2,Class);
disp(i)
end
mean(e)
wh=[e',s'];
mean(wh)
median(wh)
[e,~,L]=my_ifpca(X',Class,2);
%%%%%%%%%%%%%%%________________SuCancer__________________%%%%%%%%%%%%%%%%
X=load('C:\Users\User-PC\Desktop\Datasets\microarray\SuCancer.txt');
X=X';
Class=load('C:\Users\User-PC\Desktop\Datasets\microarray\SuCancer.y.txt');
[l,w,e,L]=k_lwkmeans(X,2,0.00001/7909^2,Class);
e=zeros(1,20);
s=zeros(1,20);
for i= 1:20
[~,~,e(i),s(i)]=k_lwkmeans(X,2,0.00071/2000^2,Class);
disp(i)
end
mean(e)
wh=[e',s'];
mean(wh)
median(wh)
[e,~,L]=my_ifpca(X',Class,2);


