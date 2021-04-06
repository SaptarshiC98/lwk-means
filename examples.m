%%%%%%%%%%%%%%%_______________Brain_____________%%%%%%%%%%%%%%%%%%%
X=load('microarray\brain_x.txt');
Class=load('microarray\brain_y.txt');
X=X';
tic
[l,w,e,L]=lwkmeans(X,5,0.0005,Class);
toc

%%%%%%%%%%%%%%%_______________Leukemia_____________%%%%%%%%%%%%%%%%%%%
X=load('microarray\leukemia_x.txt');
Class=load('microarray\leukemia_y.txt');
X=X';
tic
[l,w,e,L]=lwkmeans(X,2,0.0005,Class);
toc

%%%%%%%%%%%%%%%_______________Lung Cancer_____________%%%%%%%%%%%%%%%%%%%
X=load('microarray\BhattacherjeeLung2001.txt');
Class=load('microarray\BhattacherjeeLung2001_y.txt');
X=X';
tic
[l,w,e,L]=lwkmeans(X,2,0.000162,Class);
toc

%%%%%%%%%%%%%%%_______________Lymphoma_____________%%%%%%%%%%%%%%%%%%%
X=load('microarray\lymphoma_x.txt');
Class=load('microarray\lymphoma_y.txt');
X=X';
tic
[l,w,e,L]=lwkmeans(X,3,0.0006,Class);
toc
%%%%%%%%%%%%%%%_______________SU Cancer_____________%%%%%%%%%%%%%%%%%%%
X=load('microarray\SuCancer.txt');
Class=load('microarray\SuCancer_y.txt');
X=X';
tic
[l,w,e,L]=lwkmeans(X,2,0.00003,Class);
toc

%%%%%%%%%%%%%%%________________wine__________________%%%%%%%%%%%%%%%%
X=load('classification keel\wine.csv');
Class=X(:,14);
X=X(:,1:13);
tic
[l,w,e,L]=lwkmeans(X,3,0.01,Class);
toc

%%%%%%%%%%%%%%%_______________ALLAML_____________%%%%%%%%%%%%%%%%%%%
load('C:\Users\User-PC\Documents\Datasets\ASU\ALLAML.mat');
Class=Y;
tic
[l,w,e,L]=lwkmeans(X,2,0.0002,Class);
toc

%%%%%%%%%%%%%%%_______________GLIOMA_____________%%%%%%%%%%%%%%%%%%%
load('C:\Users\User-PC\Documents\Datasets\ASU\GLIOMA.mat');
Class=Y;
tic
[l,w,e,L]=lwkmeans(X,2,0.00051,Class);
toc