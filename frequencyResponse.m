function [f0,Y0] = frequencyResponse(X,fs,p1,p2)
%Frequency response

X=X(p1:p2);%input
Nsig=length(X); L=Nsig;%number of signals in the input

NFFT0=2^nextpow2(L);%
 f0=fs/2*linspace(0,1,NFFT0/2+1);
     Xshi=X;
     YY0=fft(Xshi,NFFT0)/L;
     Y0=2*abs(YY0(1:NFFT0/2+1));
end