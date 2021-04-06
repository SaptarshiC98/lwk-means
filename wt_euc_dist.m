function [p]=wt_euc_dist(x1,x2,w)
p=(x1-x2).^2;
p=sum(w.*p);
end