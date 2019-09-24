function [ACC,SN,PE,MCC] = roc( predict_label,test_data_label )
%ROC Summary of this function goes here
%   Detailed explanation goes here
l=length(predict_label);
TruePositive = 0;
TrueNegative = 0;
FalsePositive = 0;
FalseNegative = 0;
test_data_label(isnan(test_data_label))=1;
for k=1:l
    if test_data_label(k)==1 & predict_label(k)==1  %真阳性
        TruePositive = TruePositive +1;
    end
    if test_data_label(k)==-1 & predict_label(k)==-1 %真阴性
        TrueNegative = TrueNegative +1;
    end 
    if test_data_label(k)==-1 & predict_label(k)==1  %假阳性
        FalsePositive = FalsePositive +1;
    end

    if test_data_label(k)==1 & predict_label(k)==-1  %假阴性
        FalseNegative = FalseNegative +1;
    end
end

ACC = (TruePositive+TrueNegative)./(TruePositive+TrueNegative+FalsePositive+FalseNegative);
SN = TruePositive./(TruePositive+FalseNegative);

PE=TruePositive./(TruePositive+FalsePositive);
MCC= (TruePositive*TrueNegative+FalsePositive*FalseNegative)./sqrt(  (TruePositive+FalseNegative)...
    *(TrueNegative+FalsePositive)*(TruePositive+FalsePositive)*(TrueNegative+FalseNegative));
end

