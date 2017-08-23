function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% 我的轮子
m = size(X,1);
for i = 1 : m
%     fprintf('%d=====================\n',i );
    idx(i) = 1;
    distMin = X(i,:) - centroids(1,:);
    minSqu = distMin * distMin';
    for j = 1 : K
        dist = X(i,:) -  centroids(j,:);
        squ = dist * dist';
%         fprintf('minSqu %fsqu %f \n' , minSqu, squ);
        if squ < minSqu
            idx(i) = j;
            minSqu = squ;
        end
    end
end

% 其他参考1
% for i=1:size(X,1)
%     tmp=zeros(K,1);
%     for j=1:K
%         
%         tmp(j)=tmp(j)+sum((X(i,:)-centroids(j,:)).^2);
%         tmp(j)=sqrt(tmp(j));
%     end
%     [~,  idx(i)]=min(tmp,[],1);
%     
% end;

% 其他参考2
% [m, n] = size(X);     % number of examples & number of features      
% Idx_compare = zeros(m, K);
% 
% for i = 1:K
%     mu_i = centroids(i, :);
%     Mu_i = ones(m, 1) * mu_i;
%     Idx_compare(:, i) = ((X-Mu_i).^2) * ones(n, 1);
% end
% 
% [M, I] = min(Idx_compare, [], 2);
% idx = I;



% =============================================================

end

