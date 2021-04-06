function [ p ] = vec_euc_dist( x1,x2,w )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
p=(x1-x2).^2;
p=w.*p;

end

