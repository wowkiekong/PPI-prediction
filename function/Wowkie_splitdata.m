function [trnX1,trnY1,trnX2,trnY2,trnX3,trnY3,trnX4,trnY4,trnX5,trnY5,tstX1,tstY1,tstX2,tstY2,tstX3,tstY3,tstX4,tstY4,tstX5,tstY5]=Wowkie_splitdata(data)
[nrow,ncol]=size(data);
p=randperm(nrow);

%DCT
Matine_data=data;
for i = 1:nrow
    Matine_data(i,2:ncol)=Matine_data(i,2:ncol)/norm(Matine_data(i,2:ncol));
end

dataall=Matine_data;
dataall=dataall(p(1:nrow),:);
flod_num=5; 
step =floor(size(dataall,1)/flod_num);
j=1;
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     tstX1 = dataall(cv_p,2:ncol);
     tstY1=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     trnX1= A(:,2:ncol);
     trnY1=A(:,1);
     
j=2;
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     tstX2 = dataall(cv_p,2:ncol);
     tstY2=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     trnX2= A(:,2:ncol);
     trnY2=A(:,1);

j=3;
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     tstX3 = dataall(cv_p,2:ncol);
     tstY3=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     trnX3= A(:,2:ncol);
     trnY3=A(:,1);
     
j=4;
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     tstX4 = dataall(cv_p,2:ncol);
     tstY4=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     trnX4= A(:,2:ncol);
     trnY4=A(:,1);

j=5;
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     tstX5 = dataall(cv_p,2:ncol);
     tstY5=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     trnX5= A(:,2:ncol);
     trnY5=A(:,1);
     
     