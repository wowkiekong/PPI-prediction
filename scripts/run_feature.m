%%
%--------Initializing working environments---------------------------------
clear
WowkiePath = 'F:\KM\DDI\PPI0322\';
WowkiePathData = strcat(WowkiePath, 'data\');
addpath(genpath(WowkiePath));
%% 
%---------Matine data extraction feature----------------------------------                                                                                                                                                                                           
MatineData = load( strcat(WowkiePath, 'data\Matine_Data.mat') );
[P_A_feature, P_B_feature, N_A_feature, N_B_feature] = extract_feature(MatineData);  
[P_A_feature, mapping1] = compute_mapping(P_A_feature, 'PCA', 30);
[P_B_feature, mapping2] = compute_mapping(P_B_feature, 'PCA', 30);
[N_A_feature, mapping3] = compute_mapping(N_A_feature, 'PCA', 30);
[N_B_feature, mapping4] = compute_mapping(N_B_feature, 'PCA', 30);
PP=[P_A_feature P_B_feature];  
NN=[N_A_feature N_B_feature];
Matine_data_GE=[PP;NN]; 
m=length(N_A_feature);
n=length(P_A_feature);
p_label=ones(n,1);
n_label=-1*ones(m,1); 
Matine_label=[p_label;n_label];
data=[Matine_label Matine_data_GE];
save(strcat(WowkiePath, 'data\Matine_data_GE.mat'), 'Matine_data_GE');
save(strcat(WowkiePath, 'data\Matine_label.mat'), 'Matine_label');


%%
%---------Human data extraction feature----------------------------------                                                                                                                                                                                           

HumanData = load( strcat(WowkiePath, 'data\human_data.mat') );
[P_A_feature, P_B_feature, N_A_feature, N_B_feature] = extract_feature(HumanData);
[P_A_feature, mapping1] = compute_mapping(P_A_feature, 'PCA', 28);
[P_B_feature, mapping2] = compute_mapping(P_B_feature, 'PCA', 28);
[N_A_feature, mapping3] = compute_mapping(N_A_feature, 'PCA', 28);
[N_B_feature, mapping4] = compute_mapping(N_B_feature, 'PCA', 28);
PP=[P_A_feature P_B_feature];  
NN=[N_A_feature N_B_feature];
human_data_GE=[PP;NN]; 
m=length(N_A_feature);
n=length(P_A_feature);
p_label=ones(n,1);
n_label=-1*ones(m,1); 
human_label=[p_label;n_label];
data=[human_label human_data_GE];
save(strcat(WowkiePath, 'data\human_data_GE.mat'), 'human_data_GE');
save(strcat(WowkiePath, 'data\human_label.mat'), 'human_label');

%%
%---------Yeast data extraction feature----------------------------------                                                                                                                                                                                           

YeastData = load( strcat(WowkiePath, 'data\yeast_data.mat') );
[P_A_feature, P_B_feature, N_A_feature, N_B_feature] = extract_feature(YeastData);
[P_A_feature, mapping1] = compute_mapping(P_A_feature, 'PCA', 26);
[P_B_feature, mapping2] = compute_mapping(P_B_feature, 'PCA', 26);
[N_A_feature, mapping3] = compute_mapping(N_A_feature, 'PCA', 26);
[N_B_feature, mapping4] = compute_mapping(N_B_feature, 'PCA', 26);
PP=[P_A_feature P_B_feature];  
NN=[N_A_feature N_B_feature];
yeast_data_GE=[PP;NN]; 
m=length(N_A_feature);
n=length(P_A_feature);
p_label=ones(n,1);
n_label=-1*ones(m,1); 
yeast_label=[p_label;n_label];
data=[yeast_label yeast_data_GE];
save(strcat(WowkiePath, 'data\yeast_data_GE.mat'), 'yeast_data_GE');
save(strcat(WowkiePath, 'data\yeast_label.mat'), 'yeast_label');

