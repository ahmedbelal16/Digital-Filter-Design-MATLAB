close all ;
clear all ;
clc ;

[x, Fs] = audioread('sample_audio_file.wav');
x = x(:,1);
Fp = 3000;
Fs_stop = 4000;
Ap = 1;
As = 50;
Wp = Fp / (Fs/2);
Ws = Fs_stop / (Fs/2);

%% Butterworth
[Nb, WnB] = buttord(Wp, Ws, Ap, As);
[bB, aB] = butter(Nb, WnB, 'low');
plot_filter_analysis(bB , aB , Fs, 0, 0);
sgtitle('Butterworth LPF');

[B_HPF, A_HPF]= LPF_transform_HPF(bB,aB);
plot_filter_analysis(B_HPF , A_HPF , Fs, 0, 0);
sgtitle('Butterworth HPF');


[B_BPF, A_BPF] = LPF_transform_BPF(bB, aB);
plot_filter_analysis(B_BPF , A_BPF , Fs, 0, 0);
sgtitle('Butterworth BPF');
