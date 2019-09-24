function  FEAT=GlobalEncoding(P) 

L=4;  %size of the patch（补丁） used for extracting the descriptors
if length(P)<L
    P(length(P):L)=P(length(P)); %to avoid proteins too short 
    % 用最后一个字符补全，序列至少有4个氨基酸
end

Len=length(P);
for i=1:Len
    t=1;
    if sum(P(i)=='A')
        
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='R')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='N')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='D')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='C')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='Q')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='E')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='G')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='H')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='I')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='L')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='K')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='M')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='F')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='P')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='S')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='T')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='W')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='Y')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
    t=t+1;
    if sum(P(i)=='V')
        H(t,i)=1;
    else
        H(t,i)=0;
    end
end

%揷omposition," i.e., the frequency of 0s and 1s
for i=1:20 %the 10 binary sequence H 
    S=max([length(P)/L 1]);  
    t=1;
    for j=1:L  
        F(i,t)=sum(H(i, floor((j-1)*S+1:j*S) )==1)/(S);  
        t=t+1;
        F(i,t)=sum(H(i, floor((j-1)*S+1:j*S) )==0)/(S);
        t=t+1;
    end
end

%ransition? i.e., the percent of frequency with which 1 is followed by 0 or 0 is followed by 1  in a characteristic sequence
for i=1:20
    S=max([length(P)/L 1]);   
    t=1;
    for j=1:L       
        Sezione=H(i, floor((j-1)*S+1:j*S) );
        Sezione1=Sezione(2:length(Sezione));
        Sezione2=Sezione(3:length(Sezione));
        Sezione(length(Sezione))=[];
        F1(i,t)=(sum(Sezione==1 & Sezione1==0)+sum(Sezione==0 & Sezione1==1));  
        t=t+1;
        F1(i,t)=sum(Sezione==1 & Sezione1==1);  
        t=t+1;
        Sezione(length(Sezione)-1)=[];
        Sezione1(length(Sezione))=[];
        F1(i,t)=sum(Sezione==1 & Sezione1==1 & Sezione2==1);  
        t=t+1;
    end
end

FEAT=[reshape(F,size(F,1)*size(F,2),1); reshape(F1,size(F1,1)*size(F1,2),1)]; %  排成一列向量