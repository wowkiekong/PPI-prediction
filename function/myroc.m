function [sn,sp,MCC]=myroc(test_label,tar_label)
tp=0;
tn=0;
fp=0;
fn=0;
MCC=0;
for i=1:length(tar_label)
    if test_label(i)==1&&tar_label(i)==1
        tp=tp+1;
    elseif test_label(i)==1&&tar_label(i)==(-1)
        fn=fn+1;
    elseif test_label(i)==(-1)&&tar_label(i)==1
        fp=fp+1;
    elseif test_label(i)==(-1)&&tar_label(i)==(-1)
        tn=tn+1;
    end
    
end
if sqrt((tp+fp)*(tn+fn)*(tp+fn)*(tn+fp))==0
   MCC=0;
else
   MCC=(tp*tn-fp*fn)/(sqrt((tp+fp)*(tn+fn)*(tp+fn)*(tn+fp)));
end


if tp+fn==0
    sn=0;
else
sn=tp/(tp+fn);
end
if fp+tn==0
    sp=0;
else
sp=tn/(fp+tn);
end