global t Ea Eb Ec Ia Ib Ic Ra Trq N
t = Stator_bemf_c.time;
Ea = Stator_bemf_A.signals.values;
Eb = Stator_bemf_b.signals.values;
Ec = Stator_bemf_c.signals.values;
Ia = Stator_I_A.signals.values;
Ib = Stator_I_B.signals.values;
Ic = Stator_I_C.signals.values;
Ra = rotor_angle.signals.values;
Trq = torque.signals.values;
N = speed.signals.values;

blockSize = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
t_avg = blockproc(t, blockSize, meanFilterFunction);

blockSize1 = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
Ea_avg = blockproc(Ea, blockSize, meanFilterFunction);

blockSize2 = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
Eb_avg = blockproc(Eb, blockSize, meanFilterFunction);

blockSize3 = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
Ec_avg = blockproc(Ec, blockSize, meanFilterFunction);

blockSize4 = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
Ia_avg = blockproc(Ia, blockSize, meanFilterFunction);

blockSize5 = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
Ib_avg = blockproc(Ib, blockSize, meanFilterFunction);

blockSize6 = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
Ic_avg = blockproc(Ic, blockSize, meanFilterFunction);

blockSize7 = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
Ra_avg = blockproc(Ra, blockSize, meanFilterFunction);

blockSize8 = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
Trq_avg = blockproc(Trq, blockSize, meanFilterFunction);

blockSize9 = [100, 1];
meanFilterFunction = @(theBlockStructure) mean2(theBlockStructure.data(:));
N_avg = blockproc(N, blockSize, meanFilterFunction);

T = table(Ea_avg ,Eb_avg ,Ec_avg ,Ia_avg ,Ib_avg ,Ic_avg ,Ra_avg ,Trq_avg ,N_avg ,'VariableNames',{'eba','ebb','ebc','isa','isb','isc','Rotor_Angle','Torque','Speed'})

% save Ea_avg.mat
% save Eb_avg.mat
% save Ec_avg.mat
% save Ia_avg.mat
% save Ib_avg.mat
% save Ic_avg.mat
% save Ra_avg.mat
% save Trq_avg.mat
% save N_avg.mat

writetable(T,'s1_sc.csv')

