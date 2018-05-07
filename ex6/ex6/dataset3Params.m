function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
C_set = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_set = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
m = length(C_set);
temp0 = 1e6;
sigma = 0; C = 0;
for i = 1:m
    for j = 1:m
        model = svmTrain(X, y, C_set(i), @(x1, x2) gaussianKernel(x1, x2, sigma_set(j)));
        predictions = svmPredict(model,Xval);
        temp = mean(double(predictions ~= yval));
        if temp < temp0
            temp0 = temp;
            sigma = sigma_set(j);
            C = C_set(i);
        end
    end
end


% =========================================================================

end
