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
compute_power(bB, aB, x, "Butterworth LPF")

%% Chebyshev Type I
[Nc1, WpC1] = cheb1ord(Wp, Ws, Ap, As);
[bC1, aC1] = cheby1(Nc1, Ap, WpC1, 'low');
plot_filter_analysis(bC1 , aC1 , Fs, 0, 0);
sgtitle('Chebyshev Type I LPF');
compute_power(bC1, aC1, x, "Chebyshev Type I LPF")

%% Chebyshev Type II
[Nc2, WpC2] = cheb2ord(Wp, Ws, Ap, As);
[bC2, aC2] = cheby2(Nc2, As, WpC2, 'low');
plot_filter_analysis(bC2 , aC2 , Fs, 0, 0);
sgtitle('Chebyshev Type II LPF');
compute_power(bC2, aC2, x, "Chebyshev Type II LPF")

%% Elliptic
[Nc3, WpC3] = ellipord(Wp, Ws, Ap, As);
[bC3, aC3] = ellip(Nc3, Ap, As, WpC3, 'low');
plot_filter_analysis(bC3 , aC3 , Fs, 0, 0);
sgtitle('Elliptic LPF');
compute_power(bC3, aC3, x, "Elliptic LPF")
