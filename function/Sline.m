function V=Sline(seq)
% seq = strrep(seq,'X','');  % omit 'X'
% seq = strrep(seq,'Z','');  % omit 'Z'
% seq = strrep(seq,'B','');
% seq = strrep(seq,'J','');  
% seq = strrep(seq,'O',''); 
% seq = strrep(seq,'Q','');  
% seq = strrep(seq,'U','');  
C1='AVLIMC';
C2='FWYH';
C3='STNQ';
C4='KR';
C5='DE';
C6='GP';
len=length(seq);
% 将氨基酸分为4类，对序列进行转换
seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C2)||sum(seq(i)==C3)
           seq1(i)='B';
    elseif sum(seq(i)==C4)
           seq1(i)='J';
    elseif sum(seq(i)==C5)
           seq1(i)='O';
    elseif sum(seq(i)==C6)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(1)=1/len*sum(seqx);
V(2)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(3)=sqrt(1/(len-1)*sum(a1));
V(4)=sqrt(1/(len-1)*sum(b1));

seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C2)||sum(seq(i)==C4)
           seq1(i)='B';
    elseif sum(seq(i)==C3)
           seq1(i)='J';
    elseif sum(seq(i)==C5)
           seq1(i)='O';
    elseif sum(seq(i)==C6)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(5)=1/len*sum(seqx);
V(6)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(7)=sqrt(1/(len-1)*sum(a1));
V(8)=sqrt(1/(len-1)*sum(b1));

seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C2)||sum(seq(i)==C5)
           seq1(i)='B';
    elseif sum(seq(i)==C3)
           seq1(i)='J';
    elseif sum(seq(i)==C4)
           seq1(i)='O';
    elseif sum(seq(i)==C6)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(9)=1/len*sum(seqx);
V(10)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(11)=sqrt(1/(len-1)*sum(a1));
V(12)=sqrt(1/(len-1)*sum(b1));

seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C2)||sum(seq(i)==C6)
           seq1(i)='B';
    elseif sum(seq(i)==C3)
           seq1(i)='J';
    elseif sum(seq(i)==C4)
           seq1(i)='O';
    elseif sum(seq(i)==C5)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(13)=1/len*sum(seqx);
V(14)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(15)=sqrt(1/(len-1)*sum(a1));
V(16)=sqrt(1/(len-1)*sum(b1));

seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C3)||sum(seq(i)==C4)
           seq1(i)='B';
    elseif sum(seq(i)==C2)
           seq1(i)='J';
    elseif sum(seq(i)==C5)
           seq1(i)='O';
    elseif sum(seq(i)==C6)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(17)=1/len*sum(seqx);
V(18)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(19)=sqrt(1/(len-1)*sum(a1));
V(20)=sqrt(1/(len-1)*sum(b1));

seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C3)||sum(seq(i)==C5)
           seq1(i)='B';
    elseif sum(seq(i)==C2)
           seq1(i)='J';
    elseif sum(seq(i)==C4)
           seq1(i)='O';
    elseif sum(seq(i)==C6)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(21)=1/len*sum(seqx);
V(22)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(23)=sqrt(1/(len-1)*sum(a1));
V(24)=sqrt(1/(len-1)*sum(b1));

seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C3)||sum(seq(i)==C6)
           seq1(i)='B';
    elseif sum(seq(i)==C2)
           seq1(i)='J';
    elseif sum(seq(i)==C4)
           seq1(i)='O';
    elseif sum(seq(i)==C5)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(25)=1/len*sum(seqx);
V(26)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(27)=sqrt(1/(len-1)*sum(a1));
V(28)=sqrt(1/(len-1)*sum(b1));

seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C4)||sum(seq(i)==C5)
           seq1(i)='B';
    elseif sum(seq(i)==C2)
           seq1(i)='J';
    elseif sum(seq(i)==C3)
           seq1(i)='O';
    elseif sum(seq(i)==C6)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(29)=1/len*sum(seqx);
V(30)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(31)=sqrt(1/(len-1)*sum(a1));
V(32)=sqrt(1/(len-1)*sum(b1));

seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C4)||sum(seq(i)==C6)
           seq1(i)='B';
    elseif sum(seq(i)==C2)
           seq1(i)='J';
    elseif sum(seq(i)==C3)
           seq1(i)='O';
    elseif sum(seq(i)==C5)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(33)=1/len*sum(seqx);
V(34)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(35)=sqrt(1/(len-1)*sum(a1));
V(36)=sqrt(1/(len-1)*sum(b1));

seq1=zeros(1,len);
for i=1:len
    if sum(seq(i)==C1)||sum(seq(i)==C5)||sum(seq(i)==C6)
           seq1(i)='B';
    elseif sum(seq(i)==C2)
           seq1(i)='J';
    elseif sum(seq(i)==C3)
           seq1(i)='O';
    elseif sum(seq(i)==C4)
           seq1(i)='U';
    end
end
% 统计4类氨基酸出现的次数
idx1=strfind(seq1,'B');
idx2=strfind(seq1,'J');
idx3=strfind(seq1,'O');
idx4=strfind(seq1,'U');
AN=length(idx1);
BN=length(idx2);
CN=length(idx3);
DN=length(idx4);

seqx=zeros(1,len);
seqy=zeros(1,len);
n1=0;
n2=0;
n3=0;
n4=0;  
for i=1:len
    if (seq1(i)=='B')
        n1=n1+1;
        seqx(i)=cos((pi/2)*(n1/(AN+1)));
        seqy(i)=sin((pi/2)*(n1/(AN+1)));
    elseif(seq1(i)=='J')
        n2=n2+1;
        seqx(i)=cos(pi/2+(pi/2)*(n2/(BN+1)));
        seqy(i)=sin(pi/2+(pi/2)*(n2/(BN+1)));
    elseif(seq1(i)=='O')
        n3=n3+1;
        seqx(i)=cos(pi+(pi/2)*(n3/(CN+1)));
        seqy(i)=sin(pi+(pi/2)*(n3/(CN+1)));
    elseif(seq1(i)=='U')
        n4=n4+1;
        seqx(i)=cos(3*pi/2+(pi/2)*(n4/(DN+1)));
        seqy(i)=sin(3*pi/2+(pi/2)*(n4/(DN+1)));
    end
end
% 4维特征
V(37)=1/len*sum(seqx);
V(38)=1/len*sum(seqy);
a1=(seqx-V(1)).^2;
b1=(seqy-V(2)).^2;
V(39)=sqrt(1/(len-1)*sum(a1));
V(40)=sqrt(1/(len-1)*sum(b1));
