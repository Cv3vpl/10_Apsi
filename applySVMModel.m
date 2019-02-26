%load('SVMmodel.mat');

[label1,score1] = executeCVMPredict('aligned_average_doeubdo.stl',SVMModel);
[label2,score2] = executeCVMPredict('aligned_average_gaesuel.stl',SVMModel);
[label3,score3] = executeCVMPredict('aligned_average_jak.stl',SVMModel);

[label4,score4] = executeCVMPredict('aligned_average_jiabibu.stl',SVMModel);
[label5,score5] = executeCVMPredict('aligned_average_nomja.stl',SVMModel);
[label6,score6] = executeCVMPredict('aligned_good_ajjine.stl',SVMModel);

[label7,score7] = executeCVMPredict('aligned_good_heanean.stl',SVMModel);
[label8,score8] = executeCVMPredict('aligned_good_jachak.stl',SVMModel);
[label9,score9] = executeCVMPredict('aligned_good_ji.stl',SVMModel);

[label10,score10] = executeCVMPredict('aligned_good_kongdu.stl',SVMModel);

[label11,score11] = executeCVMPredict('aligned_poor_changanmu.stl',SVMModel);
[label12,score12] = executeCVMPredict('aligned_poor_dahalga.stl',SVMModel);

[label13,score13] = executeCVMPredict('aligned_poor_gonggong.stl',SVMModel);
[label14,score14] = executeCVMPredict('aligned_poor_li.stl',SVMModel);
[label15,score15] = executeCVMPredict('aligned_poor_nomja.stl',SVMModel);

[label16,score16] = executeCVMPredict('aligned_poor_samsu.stl',SVMModel);