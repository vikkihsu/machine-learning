function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 

%[I,J0] = size(X);
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
%    for i=1:I
%        total = theta * X(i,:) - y(i);
%        total_h = zeros(J0, 1);
%        for j=1:J0
%            total_h(j) = total(j,j);
%        end
%    end
%    J = 1/(2*m) * sum(total_h.^2);
J = 1/(2*m) * (X * theta - y)' * (X * theta - y);

% =========================================================================

end
