clear all; close all;
num_bit = 10;
bit = rand(1,num_bit);
bit_bin = round(bit);
plot(bit_bin);
wave_bit = bit_bin'*ones(1,100);%轉至完，生成每列100個相同數字
wave_bit_wave = reshape(wave_bit',1,1000)+0.0022555555555*randn(1,1000);%10*100轉至完，改成一列1000個數字
t = 10^-3:10^-3:1;
figure(2);
plot(t,wave_bit_wave);
ylim([-0.5 1.5]);
inv_bit = abs(wave_bit_wave-1);
%%%%%%%
%carriers
f1 = 20;f2 = 5;
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

%%%%%
%demodulation FSK
ca1_rx=cos(2*pi*f1*1*0.01*t);
ca2_rx=cos(2*pi*f2*1*0.01*t)
rxf1 = fsk_wave.*ca1_rx;
rxf2 = fsk_wave.*ca2_rx;
figure(5);
subplot(2,1,1);
plot(t,rxf1);
subplot(2,1,2);
plot(t,rxf2);
rx_2nd = rxf1 - rxf2;
figure(6);
subplot(2,1,1);
plot(t,wave_bit_wave);
subplot(2,1,2);
plot(t,rx_2nd);
%%%%%
%integration
for i=1:10
    rxf1_int(i)=sum(rxf1((i-1)*100+1:i*100),2);
    rxf2_int(i)=sum(rxf2((i-1)*100+1:i*100),2);
end

figure(7)
subplot(2,1,1);
plot(rxf1_int);
subplot(2,1,2);
plot(rxf2_int);

%%%%%
rx_comp=rxf1_int-rxf2_int;
rx_bit=rx_comp>0;
rx_bit_wave=reshape((rx_bit'*ones(1,100))',1,1000)

figure(8)

subplot(2,1,1);
plot(rx_bit);
ylim([-2.5 2.5]);
subplot(2,1,2);
plot(rx_bit_wave);
ylim([-1.5 1.5]);