clear all; close all;
num_bit = 10;
bit = rand(1,num_bit);
bit_bin = round(bit);
plot(bit_bin);
wave_bit = bit_bin'*ones(1,100);
wave_bit_wave = reshape(wave_bit',1,1000);
t = 10^-3:10^-3:1;
figure(2);
plot(t,wave_bit_wave);
ylim([-0.5 1.5]);
inv_bit = abs(wave_bit_wave-1);
%%%%%%%
%carriers
f1 = 1000;f2 = 500;
ca1 = cos(2*pi*f1*t);
ca2 = cos(2*pi*f2*t);
figure(3);
subplot(2,1,1);
plot(t,ca1);
subplot(2,1,2);
plot(t,ca2);
%%
%FSK WAVE
fsk_wave = ca1.*wave_bit_wave + ca2.*inv_bit;
figure(4);
subplot(2,1,1);
plot(t,wave_bit_wave);
ylim([-0.5 1.5]);
subplot(2,1,2);
plot(t,fsk_wave);
