This matlab code proposes a novel computational model namely FCTP-WSRC to predict PPIs (protein-protein interactions) effectively.
Users can test unknown PPI with the code to see the prediction.

********************File structure*********************
<matlab code>:
    <data>: 
        Name_Data.mat 
           N_protein_a, N_ptotein_b, P_protein_a, P_protein_b
    <function>:
        crosskfoldsvmt.m                       # Cross validation function
        extract_feature.m                      # function uesd to map each protein sequence onto numeric feature vectors.
        GlobalEncoding.m                       # The composition and transition of protein sequence (CT).
        Sline.m                                # The design of the F vector.
        myroc.m                                # Generate ROC curve function.
        plotroc.m                              # Generate ROC curve function.
        roc.m                                  # Generate ROC curve function.
        Similarity.m                           # Generate ROC curve function.
        Wowkie_splitdata.m                     # Calculate the weight of the training sample.
        WSRC.m                                 # Weighted sparse representation based classification (WSRC)
    <scripts>:
        run_feature.m                          # Map each protein sequence onto numeric feature vectors
        mainWSRC.m                             # PPI prediction main function.
        WSRC_ROC.m                             # Results of ROC curves.
        
********************Introduction************************
# File "data" contains Matein, Yeast and Human PPIs datasets which are downloaded from the DIP database. Matein dataset contains 1428 pairs of interacting proteins, the Yeast dataset contains 5594 pairs of interacting proteins, and the Human dataset contains 3899 pairs of interacting proteins. N_protein_a and N_ptotein_b are non-interaction protein pairs. P_protein_a and P_protein_b are interaction protein pairs.
# File "function" conteins the functions of the F-vector, composition (C) and transition (T) which are used to map each protein sequence onto numeric feature vectors.
# File "scripts" contains main function and result representation function for PPI prediction.

*******************parameters****************************
The variable sigma means the Gaussian kernel width in "mainWSRC" (sigma =1.5).
The lambda means the tolerance of reconstruction error in "mainWSRC" (lambda=0.005).


