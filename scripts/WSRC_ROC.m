%%
%--------Initializing working environments---------------------------------
clear
WowkiePath = 'F:\KM\DDI\KongMeng_PPI_1904\PPI_matlab0415\';
WowkiePathData = strcat(WowkiePath, 'data\');
addpath(genpath(WowkiePath));
%%
%-----------------------Matine five fold cross validation------------------------
Matine_label = load( strcat(WowkiePath, 'data\Matine_label.mat') );
Matine_data_GE= load( strcat(WowkiePath, 'data\Matine_data_GE.mat') );
Matine_label=Matine_label.Matine_label;
Matine_data_GE=Matine_data_GE.Matine_data_GE;
data=[Matine_label Matine_data_GE];
[trnX1,trnY1,trnX2,trnY2,trnX3,trnY3,trnX4,trnY4,trnX5,trnY5,tstX1,tstY1,tstX2,tstY2,tstX3,tstY3,tstX4,tstY4,tstX5,tstY5]=Wowkie_splitdata(data);

[predictions1,src_scores1] = WSRC( trnX1' ,trnY1' ,tstX1' ,0.005);
[predictions2,src_scores2] = WSRC( trnX2' ,trnY2' ,tstX2' ,0.005);
[predictions3,src_scores3] = WSRC( trnX3' ,trnY3' ,tstX3' ,0.005);
[predictions4,src_scores4] = WSRC( trnX4' ,trnY4' ,tstX4' ,0.005);
[predictions5,src_scores5] = WSRC( trnX5' ,trnY5' ,tstX5' ,0.005);

[ACC1,SN1,SP1,MCC1] = roc( predictions1,tstY1);
[ACC2,SN2,SP2,MCC2] = roc( predictions2,tstY2);
[ACC3,SN3,SP3,MCC3] = roc( predictions3,tstY3);
[ACC4,SN4,SP4,MCC4] = roc( predictions4,tstY4);
[ACC5,SN5,SP5,MCC5] = roc( predictions5,tstY5);
[X1,Y1,THRE1,AUC1,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY1,src_scores1,'-1');
[X2,Y2,THRE2,AUC2,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY2,src_scores2,'-1');
[X3,Y3,THRE3,AUC3,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY3,src_scores3,'-1');
[X4,Y4,THRE4,AUC4,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY4,src_scores4,'-1');
[X5,Y5,THRE5,AUC5,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY5,src_scores5,'-1');

hold on
    plot(X1,Y1,'g','LineWidth',1.5);
    plot(X2,Y2,'y','LineWidth',1.5);
    plot(X3,Y3,'b','LineWidth',1.5);    
    plot(X4,Y4,'r','LineWidth',1.5);    
    plot(X5,Y5,'k','LineWidth',1.5);
    grid on;
    ll=legend('1th fold','2th fold','3th fold','4th fold','5th fold');
    xlabel('1-Specificity');ylabel('Sensitivity');
    box on;
    meanAUC=mean([AUC1,AUC2,AUC3,AUC4,AUC5]);
    grid off;

text(0.3,0.05,num2str(meanAUC,'Average AUC =%.4f'),'Fontsize',18)
 
set(get(gca,'XLabel'),'FontSize',18);
set(get(gca,'YLabel'),'FontSize',18);
set(gca,'FontSize',10);
set(ll,'FontSize',10);
ACC=mean([ACC1,ACC2,ACC3,ACC4,ACC5])
SN=mean([SN1,SN2,SN3,SN4,SN5])
SP=mean([SP1,SP2,SP3,SP4,SP5])
MCC=mean([MCC1,MCC2,MCC3,MCC4,MCC5])
A_meanAUC=mean([AUC1,AUC2,AUC3,AUC4,AUC5])            
A_stdAUC=std([AUC1,AUC2,AUC3,AUC4,AUC5]);  

%%
%%-----------------------Human five fold cross validation------------------------
human_label = load( strcat(WowkiePath, 'data\human_label.mat') );
human_data_GE= load( strcat(WowkiePath, 'data\human_data_GE.mat') );
human_label=human_label.human_label;
human_data_GE=human_data_GE.human_data_GE;
data=[human_label human_data_GE];
[trnX1,trnY1,trnX2,trnY2,trnX3,trnY3,trnX4,trnY4,trnX5,trnY5,tstX1,tstY1,tstX2,tstY2,tstX3,tstY3,tstX4,tstY4,tstX5,tstY5]=Wowkie_splitdata(data);

[predictions1,src_scores1] = WSRC( trnX1' ,trnY1' ,tstX1' ,0.005);
[predictions2,src_scores2] = WSRC( trnX2' ,trnY2' ,tstX2' ,0.005);
[predictions3,src_scores3] = WSRC( trnX3' ,trnY3' ,tstX3' ,0.005);
[predictions4,src_scores4] = WSRC( trnX4' ,trnY4' ,tstX4' ,0.005);
[predictions5,src_scores5] = WSRC( trnX5' ,trnY5' ,tstX5' ,0.005);

[ACC1,SN1,SP1,MCC1] = roc( predictions1,tstY1);
[ACC2,SN2,SP2,MCC2] = roc( predictions2,tstY2);
[ACC3,SN3,SP3,MCC3] = roc( predictions3,tstY3);
[ACC4,SN4,SP4,MCC4] = roc( predictions4,tstY4);
[ACC5,SN5,SP5,MCC5] = roc( predictions5,tstY5);
[X1,Y1,THRE1,AUC1,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY1,src_scores1,'-1');
[X2,Y2,THRE2,AUC2,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY2,src_scores2,'-1');
[X3,Y3,THRE3,AUC3,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY3,src_scores3,'-1');
[X4,Y4,THRE4,AUC4,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY4,src_scores4,'-1');
[X5,Y5,THRE5,AUC5,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY5,src_scores5,'-1');

hold on
    plot(X1,Y1,'g','LineWidth',1.5);
    plot(X2,Y2,'y','LineWidth',1.5);
    plot(X3,Y3,'b','LineWidth',1.5);    
    plot(X4,Y4,'r','LineWidth',1.5);    
    plot(X5,Y5,'k','LineWidth',1.5);
    grid on;
    ll=legend('1th fold','2th fold','3th fold','4th fold','5th fold');
    xlabel('1-Specificity');ylabel('Sensitivity');
    box on;
    meanAUC=mean([AUC1,AUC2,AUC3,AUC4,AUC5]);
    grid off;

text(0.3,0.05,num2str(meanAUC,'Average AUC =%.4f'),'Fontsize',18)
 
set(get(gca,'XLabel'),'FontSize',18);
set(get(gca,'YLabel'),'FontSize',18);
set(gca,'FontSize',10);
set(ll,'FontSize',10);
ACC=mean([ACC1,ACC2,ACC3,ACC4,ACC5])
SN=mean([SN1,SN2,SN3,SN4,SN5])
SP=mean([SP1,SP2,SP3,SP4,SP5])
MCC=mean([MCC1,MCC2,MCC3,MCC4,MCC5])
A_meanAUC=mean([AUC1,AUC2,AUC3,AUC4,AUC5])            
A_stdAUC=std([AUC1,AUC2,AUC3,AUC4,AUC5]);        

%%
%%-----------------------Yeast five fold cross validation------------------------
yeast_label = load( strcat(WowkiePath, 'data\yeast_label.mat') );
yeast_data_GE= load( strcat(WowkiePath, 'data\yeast_data_GE.mat') );
yeast_label=yeast_label.yeast_label;
yeast_data_GE=yeast_data_GE.yeast_data_GE;
data=[yeast_label yeast_data_GE];
[trnX1,trnY1,trnX2,trnY2,trnX3,trnY3,trnX4,trnY4,trnX5,trnY5,tstX1,tstY1,tstX2,tstY2,tstX3,tstY3,tstX4,tstY4,tstX5,tstY5]=Wowkie_splitdata(data);

[predictions1,src_scores1] = WSRC( trnX1' ,trnY1' ,tstX1' ,0.005);
[predictions2,src_scores2] = WSRC( trnX2' ,trnY2' ,tstX2' ,0.005);
[predictions3,src_scores3] = WSRC( trnX3' ,trnY3' ,tstX3' ,0.005);
[predictions4,src_scores4] = WSRC( trnX4' ,trnY4' ,tstX4' ,0.005);
[predictions5,src_scores5] = WSRC( trnX5' ,trnY5' ,tstX5' ,0.005);

[ACC1,SN1,SP1,MCC1] = roc( predictions1,tstY1);
[ACC2,SN2,SP2,MCC2] = roc( predictions2,tstY2);
[ACC3,SN3,SP3,MCC3] = roc( predictions3,tstY3);
[ACC4,SN4,SP4,MCC4] = roc( predictions4,tstY4);
[ACC5,SN5,SP5,MCC5] = roc( predictions5,tstY5);
[X1,Y1,THRE1,AUC1,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY1,src_scores1,'-1');
[X2,Y2,THRE2,AUC2,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY2,src_scores2,'-1');
[X3,Y3,THRE3,AUC3,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY3,src_scores3,'-1');
[X4,Y4,THRE4,AUC4,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY4,src_scores4,'-1');
[X5,Y5,THRE5,AUC5,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(tstY5,src_scores5,'-1');

hold on
    plot(X1,Y1,'g','LineWidth',1.5);
    plot(X2,Y2,'y','LineWidth',1.5);
    plot(X3,Y3,'b','LineWidth',1.5);    
    plot(X4,Y4,'r','LineWidth',1.5);    
    plot(X5,Y5,'k','LineWidth',1.5);
    grid on;
    ll=legend('1th fold','2th fold','3th fold','4th fold','5th fold');
    xlabel('1-Specificity');ylabel('Sensitivity');
    box on;
    meanAUC=mean([AUC1,AUC2,AUC3,AUC4,AUC5]);
    grid off;

text(0.3,0.05,num2str(meanAUC,'Average AUC =%.4f'),'Fontsize',18)
 
set(get(gca,'XLabel'),'FontSize',18);
set(get(gca,'YLabel'),'FontSize',18);
set(gca,'FontSize',10);
set(ll,'FontSize',10);
ACC=mean([ACC1,ACC2,ACC3,ACC4,ACC5])
SN=mean([SN1,SN2,SN3,SN4,SN5])
SP=mean([SP1,SP2,SP3,SP4,SP5])
MCC=mean([MCC1,MCC2,MCC3,MCC4,MCC5])
A_meanAUC=mean([AUC1,AUC2,AUC3,AUC4,AUC5])            
A_stdAUC=std([AUC1,AUC2,AUC3,AUC4,AUC5]);        