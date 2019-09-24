function [predictions,src_scores] = WSRC( trnX ,trnY ,tstX , lambda)

% weighted SRC，　min_{alpha} ||diag(w)alpha||_1 
%           s.t. ||x-Dalpha||_2^2 <= lambda

% Input:
% trnX [dim * num ] - each column is a training sample，每列是训练样本
% trnY [ 1  * num ] - training label ，标签是一行
% tstX
% tstY

% Output:
% rate             - Recognition rate of test sample 准确率
% predictlabel     - predict label of test sample

ntrn = size( trnX , 2 );  % 训练样本数
ntst = size( tstX , 2 );  % 测试样本数
nClass = length( unique(trnY) );  % 类别数

% normalize 列归一化
for i = 1 : ntrn
    trnX(:,i) = trnX(:,i) / norm( trnX(:,i) ) ;  % norm求范数
end
for i = 1 : ntst
    tstX(:,i) = tstX(:,i) / norm( tstX(:,i) ) ;
end

sigma = 1.5;
W = SimilarityMatrix( trnX , tstX , sigma ) ;  % 训练样本和测试样本的相似度矩阵，行是训练样本，列是测试样本，作为权重矩阵
% W = SimilarityMatrix( trnX , tstX ) ;

% classify
param.lambda = lambda ; % not more than 20 non-zeros coefficients
% param.numThreads=2;   % number of processors/cores to use; the default choice is -1
% and uses all the cores of the machine
param.mode = 1 ;        % penalized formulation
param.verbose = false ;
A = mexLassoWeighted( tstX , trnX , W , param ) ;
% [rate predictlabel] = Decision_Residual( trnX ,trnY ,tstX , tstY , A) ;

K=full(A);           
Trainlabels=trnY';   
Test=tstX';          
Train=trnX';          
K=K';                

uniqlabels=unique(Trainlabels);  % 去掉矩阵中重复的元素,剩[-1;1]
c=max(size(uniqlabels));         % 标签个数2
for i=1:c
    R=Test-K(:,find(Trainlabels==uniqlabels(i)))*Train(find(Trainlabels==uniqlabels(i)),:);  % 583*240
    src_scores(:,i)=sqrt(sum(R.*R,2));  
end
[maxval,indices]=min(src_scores'); % src_scores'：2*583，maxval是列最小值，indices是列最小值的行号
predictions=uniqlabels(indices);  
src_scores=src_scores(:,2);
