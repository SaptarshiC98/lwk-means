function [ label,weight,errors,L,alpha] = lwkmeans(X,k,lambda,Class,alpha,beta,tmax)
%This is Lasso weighted kmeans with wk-means initialization
%   Detailed explanation goes here
[n,p]=size(X);
weight=ones(1,p)/p;
w.dummy=zeros(1,p);
label=kmeans(X,k,'replicates',10);
label=label';
dist=zeros(1,k);
D=zeros(1,p);
x.bar=mean(X);

if (nargin<5||isempty(alpha))
    alpha=1; 
end
 
if (nargin<6)||isempty(beta)
    beta=4;
end
 
if (nargin<7)||isempty(tmax)
    tmax=30;
end
 
 on=ones(1,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Normalize
for i=1:n
    X(i,:)=X(i,:)-x.bar;
end
lambda=lambda/p^2;
for i = 1:p
    X(:,i)=X(:,i)/std(X(:,i));
end
for i = 1:k
      I=find(label==i);
      M(i,:)=mean(X(I,:));
    end
    %update weights
    for j = 1:p 
      D(j)=0;
    end
    for i = 1:k
      I=find(label==i);
      
      for j = I
        D=D+vec_euc_dist(X(j,:),M(i,:),on);
      end
    end
    D=1./D;
    D=D.^(1/(beta-1));
    alpha=sum(D);
    alpha=1/alpha;
    alpha=alpha^(beta-1);  
    %alpha=1;
for iter = 1:tmax
    
        %update centres
    for i = 1:k
      I=find(label==i);
      M(i,:)=mean(X(I,:));
    end
    %update weights
    for j = 1:p 
      D(j)=0;
    end
    for i = 1:k
      I=find(label==i);
      
      for j = I
        D=D+vec_euc_dist(X(j,:),M(i,:),on);
      end
    end
    for i=1:p
    if(alpha>(lambda*D(i)))
        weight(i)=alpha/D(i)-lambda;
        weight(i)=weight(i)^(1/(beta-1));
    else
        weight(i)=0;
  end
    end
    w.dummy=weight.^beta+lambda*weight;
      for i = 1:n
      for j = 1:k
        dist(j)=wt_euc_dist(X(i,:),M(j,:),w.dummy);
      end
      [~,label(i)]=min(dist);
      end
end
t = crosstab(label, Class);
    if k == 2
        errors = min(sum(diag(t)), n - sum(diag(t)))/n;
    else
        errors = errors_calculate(t);
    end
L=sum(weight>0);
%errors=nmi(label,Class);
%errors=rand_index(label,Class);
%obj=0;
%w.dummy=weight.^beta+lambda*weight;
%for i=1:n
%    obj=obj+wt_euc_dist(X(i,:),M(label(i),:),on);
%end
end
