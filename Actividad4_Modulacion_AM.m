clc;
clear;
close all;

% ACTIVIDAD FORMATIVA 4: MODULACION EN AMPLITUD (AM)
% Asignatura: Señales y Sistemas
% Descripcion: Genera una señal AM y analiza su espectro, ruido,
%              atenuacion y distorsion.

%% 1. Parametros de las senales
fm = 200;       % Frecuencia del mensaje (Hz)
fc = 5000;      % Frecuencia de la portadora (Hz)
Am = 1;         % Amplitud del mensaje
Ac = 1;         % Amplitud de la portadora
mu = 0.7;       % Indice de modulacion (70 %)

%% 2. Frecuencia de muestreo y vector de tiempo
fs = 100000;
t = 0:1/fs:0.02;

%% 3. Generacion de senales
mensaje = Am*cos(2*pi*fm*t);
portadora = Ac*cos(2*pi*fc*t);

%% 4. Modulacion AM convencional
senal_AM = Ac*(1 + mu*mensaje/Am).*portadora;

%% 5. Graficas en el dominio del tiempo
figure;
subplot(3,1,1);
plot(t,mensaje);
title('Senal de informacion');
xlabel('Tiempo (s)'); ylabel('Amplitud'); grid on;

subplot(3,1,2);
plot(t,portadora);
title('Senal portadora');
xlabel('Tiempo (s)'); ylabel('Amplitud'); grid on;

subplot(3,1,3);
plot(t,senal_AM);
title('Senal modulada en amplitud (AM)');
xlabel('Tiempo (s)'); ylabel('Amplitud'); grid on;

%% 6. Analisis en el dominio de la frecuencia (FFT)
N = length(senal_AM);
Y = fft(senal_AM);
P2 = abs(Y/N);
P1 = P2(1:floor(N/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:floor(N/2))/N;

figure;
plot(f,P1);
title('Espectro de frecuencias de la senal AM');
xlabel('Frecuencia (Hz)'); ylabel('Amplitud');
xlim([0 6000]); grid on;

%% 7. Efecto del ruido
ruido = 0.3*randn(size(senal_AM));
senal_con_ruido = senal_AM + ruido;

figure;
subplot(2,1,1);
plot(t,senal_AM);
title('Senal AM original');
xlabel('Tiempo (s)'); ylabel('Amplitud'); grid on;

subplot(2,1,2);
plot(t,senal_con_ruido);
title('Senal AM con ruido');
xlabel('Tiempo (s)'); ylabel('Amplitud'); grid on;

%% 8. Atenuacion y distorsion
senal_atenuada = 0.5*senal_AM;
senal_distorsionada = tanh(2*senal_AM);

figure;
subplot(3,1,1);
plot(t,senal_AM);
title('Senal AM original');
xlabel('Tiempo (s)'); ylabel('Amplitud');
ylim([-2 2]); grid on;

subplot(3,1,2);
plot(t,senal_atenuada);
title('Senal AM con atenuacion del 50 por ciento');
xlabel('Tiempo (s)'); ylabel('Amplitud');
ylim([-2 2]); grid on;

subplot(3,1,3);
plot(t,senal_distorsionada);
title('Senal AM con distorsion no lineal');
xlabel('Tiempo (s)'); ylabel('Amplitud');
ylim([-2 2]); grid on;
