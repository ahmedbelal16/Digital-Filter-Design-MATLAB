clear all;
close all;
clc;

%Read Audio File
[yt,Fs] = audioread("sample_audio_file.wav") ;


%Stereo --> Mono & Ploting Time Domain
yt=mean(yt,2) ; %due to that the audio signal is stereo so we got the mean to make it mono
N = length(yt) ; %to get number of samples
plot (0:N-1,yt) ; %Plot time domain 
title('Audio Signal (Time Domain)') ;
xlabel('N (Samples)') ;
ylabel('Amplitude') ;


%Frequency domain analysis & Ploting the Magnitude Spectrum
yf = abs(fft(yt)) ; % Magnitude of FFT of the signal (using abs function)
f = (0:(N-1)/2)*(Fs/N) ; %Sampling the frequency axis
figure
plot(f,yf(1:N/2));
title('Magnitude Spectrum of Audio Signal (Frequency Domain)') ;
xlabel('Frequency') ;
ylabel('Amplitude') ;


%Energy of Time Domain using Parseval's Relation
E = sum(yt.^2) ;
fprintf('Energy of Signal in Time Domain = %E\n',E) ;

%Energy of Frequency Domain using Parseval's Relation
E = (1/N)*sum(yf.^2) ;
fprintf('Energy of Signal in Frequncy Domain = %E\n',E) ;



