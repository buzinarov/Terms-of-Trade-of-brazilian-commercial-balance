
OPEN DATA "C:\Users\Windows-7\Desktop\Projeto Agronegócio\Data.xls"
CALENDAR 2000 1 12
ALL 2013:11
DATA(FORMAT=XLS,ORG=COLUMNS) 2000:01 2013:11 BCB BCS BCM CAMR CAM TT PIB USA CHINA EU MUNDO
Log BCB / LBCB
Log BCS / LBCS
Log BCM / LBCM
Log CAMR / LCAMR
Log CAM / LCAM
Log TT / LTT
Log PIB / LPIB
Log USA / LUSA
Log CHINA / LCHINA
Log EU / LEU
Log MUNDO / LMUNDO
Diff LBCB / DBCB
Diff LTT / DTT
DIff LPIB / DPIB
Diff LMUNDO / DMUNDO
set trend = t
system(model=chap2) 1 to 4
set r1 = 1.00*LBCB(t-1)-2.064*LTT(t-1)-0.733*LPIB(t-1)-0.084*LMUNDO(t-1)+9.654
lags 1 to 1
variables DBCB DTT DPIB DMUNDO
det constant r1
end(system)
estimate(outsigma=V,noprint)
declare rect pattern(4,4)
nonlin b c d
DEC FRML[RECT] AFRML
FRML AFRML = ||	1,-b,-c,-d|$
                0,1,0,0|$
                0,0,1,0|$
                0,0,0,1||
COMPUTE  b=c=d=0.0
CVMODEL(ITERS=100,METHOD=BFGS,TRACE,FACTOR=AFACTOR) %SIGMA AFRML
errors(impulse, MODEL=CHAP2, DEC=AFACTOR) *12
compute hstart=2000:02
compute hend=2013:10
history(model=chap2,add,results=history,window='saida') *hend-hstart+1 hstart %sigma

Non-Linear Optimization, Iteration 1. Function Calls 3.
 Cosine of Angle between Direction and Gradient  1.0000000. Alpha used was 0.000000
 Adjusted squared norm of gradient 11.64674
 Diagnostic measure (0=perfect) 0.0000
 Subiterations 3. Distance scale  0.250000000
Old Function = 2089.981407      New Function = 2090.773685
New Coefficients:
      0.444811       0.716597      -0.128662

Non-Linear Optimization, Iteration 2. Function Calls 4.
 Cosine of Angle between Direction and Gradient  0.6645045. Alpha used was 0.000000
 Adjusted squared norm of gradient 1.05983
 Diagnostic measure (0=perfect) 0.0000
 Subiterations 1. Distance scale  1.000000000
Old Function = 2090.773685      New Function = 2091.360023
New Coefficients:
      1.239136       0.198468      -0.258795

Non-Linear Optimization, Iteration 3. Function Calls 5.
 Cosine of Angle between Direction and Gradient  0.9693908. Alpha used was 0.000000
 Adjusted squared norm of gradient 0.0380217
 Diagnostic measure (0=perfect) 0.0000
 Subiterations 1. Distance scale  1.000000000
Old Function = 2091.360023      New Function = 2091.373329
New Coefficients:
      1.071598       0.234406      -0.336303

Non-Linear Optimization, Iteration 4. Function Calls 6.
 Cosine of Angle between Direction and Gradient  0.9408384. Alpha used was 0.000000
 Adjusted squared norm of gradient 0.01002757
 Diagnostic measure (0=perfect) 0.0000
 Subiterations 1. Distance scale  1.000000000
Old Function = 2091.373329      New Function = 2091.376116
New Coefficients:
      1.069837       0.248027      -0.263070

Non-Linear Optimization, Iteration 5. Function Calls 7.
 Cosine of Angle between Direction and Gradient  0.9124778. Alpha used was 0.000000
 Adjusted squared norm of gradient 0.0007146472
 Diagnostic measure (0=perfect) 0.0000
 Subiterations 1. Distance scale  1.000000000
Old Function = 2091.376116      New Function = 2091.376562
New Coefficients:
      1.088251       0.240115      -0.282416

Non-Linear Optimization, Iteration 6. Function Calls 8.
 Cosine of Angle between Direction and Gradient  0.9913458. Alpha used was 0.000000
 Adjusted squared norm of gradient 8.389796e-06
 Diagnostic measure (0=perfect) 0.0000
 Subiterations 1. Distance scale  1.000000000
Old Function = 2091.376562      New Function = 2091.376566
New Coefficients:
      1.085423       0.240782      -0.282225

Non-Linear Optimization, Iteration 7. Function Calls 9.
 Cosine of Angle between Direction and Gradient  0.9502636. Alpha used was 0.000000
 Adjusted squared norm of gradient 7.187551e-08
 Diagnostic measure (0=perfect) 0.0000
 Subiterations 1. Distance scale  1.000000000
Old Function = 2091.376566      New Function = 2091.376566
New Coefficients:
      1.085593       0.240764      -0.282134

Non-Linear Optimization, Iteration 8. Function Calls 10.
 Cosine of Angle between Direction and Gradient  0.9411568. Alpha used was 0.000000
 Adjusted squared norm of gradient 2.701362e-11
 Diagnostic measure (0=perfect) 0.0000
 Subiterations 1. Distance scale  1.000000000
Old Function = 2091.376566      New Function = 2091.376566
New Coefficients:
      1.085593       0.240763      -0.282138

Covariance Model-Concentrated Likelihood - Estimation by BFGS
Convergence in     8 Iterations. Final criterion was  0.0000036 <  0.0000100
Observations                    165
Log Likelihood                    2091.37656608
Log Likelihood Unrestricted       2109.61197914
Chi-Squared(3)                      36.47082612
Significance Level              5.95424200e-08

   Variable                     Coeff       Std Error      T-Stat     Signif
*******************************************************************************
1.  B                         1.085593205  0.922442977      1.17687  0.23924838
2.  C                         0.240763171  0.456752028      0.52712  0.59811020
3.  D                        -0.282138031  0.732457904     -0.38519  0.70009405


Responses to Shock in DBCB

 Entry      DBCB         DTT        DPIB       DMUNDO
       1  0.19906240  0.00000000  0.00000000  0.00000000
       2 -0.04500488  0.00044315  0.00073142 -0.00116755
       3  0.00955846 -0.00037738 -0.00021394 -0.00013937
       4 -0.00168379  0.00008983  0.00019478 -0.00011735
       5  0.00023446 -0.00004585  0.00000123 -0.00004059
       6 -0.00000151  0.00000462  0.00002893 -0.00001963
       7 -0.00001186 -0.00000473  0.00000645 -0.00000921
       8  0.00000646 -0.00000052  0.00000487 -0.00000418
       9 -0.00000206 -0.00000063  0.00000190 -0.00000202
      10  0.00000071 -0.00000022  0.00000098 -0.00000093
      11 -0.00000015 -0.00000012  0.00000045 -0.00000044
      12  0.00000006 -0.00000005  0.00000021 -0.00000021


Responses to Shock in DTT

 Entry      DBCB         DTT        DPIB       DMUNDO
       1  0.02023113  0.01863601  0.00000000 0.000000000
       2 -0.02460005 -0.00383988 -0.01142037 0.002097626
       3  0.01290658  0.00147818 -0.00147861 0.001782647
       4 -0.00418609  0.00001710 -0.00132754 0.000842053
       5  0.00126401  0.00015210 -0.00045345 0.000456471
       6 -0.00034523  0.00005000 -0.00023261 0.000210110
       7  0.00007920  0.00002607 -0.00010606 0.000102786
       8 -0.00002134  0.00001266 -0.00004940 0.000048042
       9  0.00000265  0.00000568 -0.00002354 0.000022833
      10 -0.00000125  0.00000280 -0.00001096 0.000010744
      11 -0.00000020  0.00000128 -0.00000520 0.000005070
      12 -0.00000013  0.00000062 -0.00000244 0.000002390


Responses to Shock in DPIB

 Entry      DBCB         DTT        DPIB       DMUNDO
       1  0.00926681 -0.00000000 0.038489307  0.00000000
       2 -0.01339345 -0.00150440 0.012803222 -0.00491282
       3  0.00119974 -0.00087921 0.005051004 -0.00324690
       4 -0.00060203 -0.00044754 0.002172663 -0.00176063
       5  0.00009157 -0.00022912 0.000967651 -0.00087240
       6 -0.00000289 -0.00010681 0.000449316 -0.00042170
       7  0.00001044 -0.00005183 0.000208474 -0.00020077
       8  0.00000494 -0.00002423 0.000098091 -0.00009508
       9  0.00000219 -0.00001152 0.000046048 -0.00004491
      10  0.00000123 -0.00000541 0.000021699 -0.00002119
      11  0.00000052 -0.00000256 0.000010218 -0.00000999
      12  0.00000027 -0.00000120 0.000004815 -0.00000471


Responses to Shock in DMUNDO

 Entry      DBCB         DTT        DPIB       DMUNDO
       1 -0.00618148 0.000000000  0.00000000 0.021909423
       2 -0.00000011 0.002910470  0.00031303 0.006861321
       3 -0.00365713 0.000296646 -0.00158618 0.002444004
       4  0.00081776 0.000319066 -0.00068519 0.001018290
       5 -0.00039157 0.000098366 -0.00040551 0.000436849
       6  0.00007399 0.000052996 -0.00018995 0.000201266
       7 -0.00003076 0.000023506 -0.00009235 0.000092542
       8  0.00000290 0.000011042 -0.00004383 0.000043461
       9 -0.00000243 0.000005242 -0.00002068 0.000020368
      10 -0.00000031 0.000002439 -0.00000979 0.000009592
      11 -0.00000029 0.000001159 -0.00000461 0.000004516
      12 -0.00000012 0.000000543 -0.00000217 0.000002128


Decomposition of Variance for Series DBCB
 Step   Std Error    DBCB     DTT      DPIB   DMUNDO
      1 0.20039766   98.672    1.019    0.214   0.095
      2 0.20729016   96.933    2.361    0.617   0.089
      3 0.20794703   96.533    2.731    0.617   0.119
      4 0.20799846   96.492    2.770    0.617   0.121
      5 0.20800282   96.488    2.774    0.617   0.121
      6 0.20800312   96.487    2.774    0.617   0.121
      7 0.20800314   96.487    2.774    0.617   0.121
      8 0.20800314   96.487    2.774    0.617   0.121
      9 0.20800314   96.487    2.774    0.617   0.121
     10 0.20800314   96.487    2.774    0.617   0.121
     11 0.20800314   96.487    2.774    0.617   0.121
     12 0.20800314   96.487    2.774    0.617   0.121

Decomposition of Variance for Series DTT
 Step   Std Error    DBCB     DTT      DPIB   DMUNDO
      1 0.01863601    0.000  100.000    0.000   0.000
      2 0.01931259    0.053   97.069    0.607   2.271
      3 0.01939496    0.090   96.827    0.807   2.275
      4 0.01940297    0.092   96.748    0.860   2.300
      5 0.01940522    0.093   96.731    0.873   2.302
      6 0.01940565    0.093   96.728    0.876   2.303
      7 0.01940575    0.093   96.727    0.877   2.303
      8 0.01940577    0.093   96.727    0.877   2.303
      9 0.01940578    0.093   96.727    0.877   2.303
     10 0.01940578    0.093   96.727    0.877   2.303
     11 0.01940578    0.093   96.727    0.877   2.303
     12 0.01940578    0.093   96.727    0.877   2.303

Decomposition of Variance for Series DPIB
 Step   Std Error    DBCB     DTT      DPIB   DMUNDO
      1 0.03848931    0.000    0.000  100.000   0.000
      2 0.04214744    0.030    7.342   92.622   0.006
      3 0.04250491    0.032    7.340   92.483   0.145
      4 0.04258706    0.034    7.409   92.387   0.170
      5 0.04260240    0.034    7.415   92.372   0.179
      6 0.04260584    0.034    7.417   92.368   0.181
      7 0.04260658    0.034    7.417   92.367   0.181
      8 0.04260674    0.034    7.417   92.367   0.181
      9 0.04260678    0.034    7.417   92.367   0.182
     10 0.04260679    0.034    7.417   92.367   0.182
     11 0.04260679    0.034    7.417   92.367   0.182
     12 0.04260679    0.034    7.417   92.367   0.182

Decomposition of Variance for Series DMUNDO
 Step   Std Error    DBCB     DTT      DPIB   DMUNDO
      1 0.02190942    0.000    0.000    0.000 100.000
      2 0.02360084    0.245    0.790    4.333  94.632
      3 0.02401484    0.240    1.314    6.013  92.433
      4 0.02411580    0.240    1.425    6.496  91.839
      5 0.02413988    0.240    1.458    6.613  91.689
      6 0.02414532    0.240    1.465    6.641  91.654
      7 0.02414656    0.240    1.466    6.647  91.646
      8 0.02414683    0.240    1.467    6.649  91.645
      9 0.02414689    0.240    1.467    6.649  91.644
     10 0.02414691    0.240    1.467    6.649  91.644
     11 0.02414691    0.240    1.467    6.649  91.644
     12 0.02414691    0.240    1.467    6.649  91.644


