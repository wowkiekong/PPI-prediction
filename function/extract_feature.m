function [N_A_feature,N_B_feature,P_A_feature,P_B_feature]=extract_feature(Data)
N_protein_a = Data.N_protein_a;
N_protein_b = Data.N_protein_b;
P_protein_a = Data.P_protein_a;
P_protein_b = Data.P_protein_b;
N_A_feature=[];
N_B_feature=[];
P_A_feature=[];
P_B_feature=[];
m=length(N_protein_a);
n=length(P_protein_a);
for i=1:m
    SEQ=N_protein_a(i);
    SEQ=cell2mat(SEQ); 
    C=GlobalEncoding(SEQ);
    C=C';
    D=Sline(SEQ);
    N_A_feature(i,:)=[C D];
end

for i=1:m
    SEQ=N_protein_b(i);
    SEQ=cell2mat(SEQ);
    C=GlobalEncoding(SEQ);
    C=C';
    D=Sline(SEQ);
    N_B_feature(i,:)=[C D];
end
for i=1:n
    SEQ=P_protein_a(i);
    SEQ=cell2mat(SEQ);
    C=GlobalEncoding(SEQ);
    C=C';
    D=Sline(SEQ);
    P_A_feature(i,:)=[C D];
end
for i=1:n  
    SEQ=P_protein_b(i);
    SEQ=cell2mat(SEQ);
    C=GlobalEncoding(SEQ);
    C=C';
    D=Sline(SEQ);
    P_B_feature(i,:)=[C D];
end   
