function  [SN,SP,MCC,totalaveacc, AUC]=crosskfoldsvmt(data,label,m,k, svmcg)
%SVM m次K折交叉验证准确率
[M,N]=size(data);
for i=1:m
    indices(:,i)=crossvalind('Kfold',M,k);%//进行随机分包
    class1={};
    cr1=[];
    osn=[];
    osp=[];
    oMCC=[];
    oAUC=[];
    for p=1:k%//交叉验证k=10，10个包轮流作为测试集
        test = (indices(:,i)== p); %//获得test集元素在数据集中对应的单元编号
        train = ~test;     %train集元素的编号为非test元素的编号
        train_data=data(train,:);%//从数据集中划分出train样本的数据
        train_target=label(train,:);%//获得样本集的测试目标，在本例中是实际分类情况
        test_data=data(test,:);%//test样本集
        test_target=label(test,:);
        
        
%       mytrain=svmtrain1(train_data,train_target,'kernel_function','rbf','rbf_sigma',0.03);
%       predict_labels=svmclassify(mytrain,test_data);
%         
        
        model=svmtrain(train_target,train_data,svmcg);
        [predict_labels, accuracy, dec_values] = svmpredict(test_target,test_data, model);
        [sn,sp,MCC]=myroc(test_target,predict_labels);
        AUC=plotroc(test_target, test_data, model);
        temp_cr1=length(find(predict_labels==test_target))/length(test_target);% cp=classperf(test_target,class);
        %temp_cr=cp.CorrectRate;
        cr1=[cr1 temp_cr1];
        osn=[osn sn];
        osp=[osp sp];
        oMCC=[oMCC,MCC];
        oAUC=[oAUC,AUC];
    end
    onesn(i)=mean(osn);
    onesp(i)=mean(osp);
    oneMCC(i)=mean(oMCC);
    onetimeavecr1(i)=mean(cr1);
    oneAUC(i)=mean(oAUC);
end
totalaveacc=mean(onetimeavecr1);
onesn(any(isnan(onesn),1))=[];
onesp(any(isnan(onesp),1))=[];
oneMCC(any(isnan(oneMCC),1))=[];
oneAUC(any(isnan(oneAUC),1))=[];
SN=mean(onesn);
SP=mean(onesp);
MCC=mean(oneMCC);
AUC=mean(oneAUC);








