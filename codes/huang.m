function [errors,label,weight] = huang(X,k,Class)
%This is Huang's WK-means
%  X is an n*p data matrix
%k is the number of clusters
[n,p]=size(X);
beta=4;
tmax=30;
weight=ones(1,p)/p;
label=zeros(1,n);
dist=zeros(1,k);
w.dummy=zeros(1,p);
D=zeros(1,p);
x.bar=mean(X);
on=ones(1,p);
%Normalize
for i=1:n
    X(i,:)=X(i,:)-x.bar;
end
for i = 1:p
    X(:,i)=X(:,i)/range(X(:,i));
end
s=randsample(n,k);
s=s';
M=X(s,:);  
for iter= 1:tmax
    w.dummy = weight.^beta;
    %Update Cluster Assignment
   for i = 1:n
      for j = 1:k
        dist(j)=wt_euc_dist(X(i,:),M(j,:),w.dummy);
      end
      [~,label(i)]=min(dist);
   end
      %Update Cluster Centroids
          for i = 1:k
      I=find(label==i);
      M(i,:)=mean(X(I,:));
    end
%Update Weights
for j = 1:p 
      D(j)=0;
end
for i = 1:k
      I=find(label==i);      
      for j = I
        D=D+vec_euc_dist(X(j,:),M(i,:),on);
      end
end
    D=D.^(1/(beta-1));
    weight=1./D;
    weight=weight/sum(weight);
end
t = crosstab(label, Class);
    if k == 2
        errors = min(sum(diag(t)), n - sum(diag(t)))/n;
    else
        errors = errors_calculate(t);
    end
end

