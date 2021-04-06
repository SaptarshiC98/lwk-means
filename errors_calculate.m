function [Error, flagrecord] = errors_calculate(T)
 
n = sum(sum(T)); 
[k, k0] = size(T);
flags = perms(1:k);
match = zeros(length(flags),1);
 
for j=1:length(flags)
    Tnew = T(flags(j,:), :);
    Tnew = Tnew(1:min(k,k0), 1:min(k,k0));
    match(j) = sum(diag(Tnew));
end
 
[maxmatch,ind] = max(match);
Error = 1- maxmatch/n;
flagrecord = flags(ind(1),:);
 
 
end