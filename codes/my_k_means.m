function [ errors ] = my_k_means(X,k,Class )
%My k-means to compute misclassification error
%Normalize
[n,p]=size(X);
x.bar=mean(X);
for i=1:n
    X(i,:)=X(i,:)-x.bar;
end
for i = 1:p
    X(:,i)=X(:,i)/std(X(:,i));
end
label=kmeans(X,k);
t = crosstab(label, Class);
    if k == 2
        errors = min(sum(diag(t)), n - sum(diag(t)))/n;
    else
        errors = errors_calculate(t);
    end


end

