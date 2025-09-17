%O programa a seguir é uma modelagem do exemplo 8 do livro do Ilmar F.
%Santos, "Dinamica de Sistemas Mecanicos". Ele descreve uma particula deslizando atraves de um cano rotativo
%em um dos eixos e sem atrito

clc; clear all; close all

% ==== Parâmetros do modelo ====
w = 1.0;            % rad/s
teta2 = pi/4;       % rad
g = 9.81;            % m/s^2
h = 1400.0;         % m

% ==== Dados da integração ====
t0 = 0.0;           % tempo inicial [s]
tf = 8.0;           % tempo final [s]
npt = 1000;         % número de pontos
deltat = (tf - t0)/npt;   % passo de integração

% ==== Condições iniciais ====
t = t0;
teta1 = 0.0;
X_aprox = 0.0;
Xp_aprox = 0.0;

% ==== Vetores para armazenar resultados ====
tempo = zeros(1, npt);
X_exato_v = zeros(1, npt);
X_aprox_v = zeros(1, npt);
erro_v = zeros(1, npt);

% Orbitas (exata e aproximada)
r_oa_x_exato = zeros(1, npt);
r_oa_y_exato = zeros(1, npt);
r_oa_z_exato = zeros(1, npt);

r_oa_x_aprox = zeros(1, npt);
r_oa_y_aprox = zeros(1, npt);
r_oa_z_aprox = zeros(1, npt);

% ==== Loop de integração numérica ====
for n = 1:npt
    t = t + deltat;
    teta1 = teta1 + w*deltat;

    % ---- Solução Exata ----
    X_exato = -(g*sin(teta2)/(w^2*cos(teta2)^2)) * ...
        ( (exp(w*cos(teta2)*t) + exp(-w*cos(teta2)*t))/2 - 1 );

    % Coordenadas exatas
    r_oa_x_exato(n) = X_exato * cos(teta1) * cos(teta2);
    r_oa_y_exato(n) = -X_exato * sin(teta2) + h;
    r_oa_z_exato(n) = -X_exato * sin(teta1) * cos(teta2);

    % ---- Equação diferencial ----
    Xpp = g*sin(teta2) + w^2*cos(teta2)^2 * X_aprox;

    % ---- Aproximação por Taylor ----
    Xp_aprox = Xp_aprox + Xpp*deltat;
    X_aprox = X_aprox + Xp_aprox*deltat;

    % Coordenadas aproximadas
    r_oa_x_aprox(n) = X_aprox * cos(teta1) * cos(teta2);
    r_oa_y_aprox(n) = -X_aprox * sin(teta2) + h;
    r_oa_z_aprox(n) = -X_aprox * sin(teta1) * cos(teta2);

    % ---- Erro relativo ----
    erro = (X_aprox - X_exato)/X_exato * 100.0;

    % ---- Armazenar valores ----
    tempo(n) = t;
    X_exato_v(n) = X_exato;
    X_aprox_v(n) = X_aprox;
    erro_v(n) = erro;
end

% ==== Gráfico comparativo X(t) ====
figure;
plot(tempo, X_exato_v, 'b-', 'LineWidth', 1.5); hold on;
plot(tempo, X_aprox_v, 'r--', 'LineWidth', 1.5);
xlabel('Tempo [s]');
ylabel('X');
legend('Solução Exata','Solução Aproximada');
title('Comparação Exata vs Aproximada');

% ==== Gráfico do erro ====
figure;
plot(tempo, erro_v, 'k-');
xlabel('Tempo [s]');
ylabel('Erro [%]');
title('Erro relativo (%)');

% ==== Gráfico da órbita (exata vs aproximada) ====
figure;
plot3(r_oa_x_exato, r_oa_y_exato, r_oa_z_exato, 'b-', 'LineWidth', 1.5); hold on;
plot3(r_oa_x_aprox, r_oa_y_aprox, r_oa_z_aprox, 'r--', 'LineWidth', 1.5);
xlabel('x'); ylabel('y'); zlabel('z');
legend('Órbita Exata','Órbita Aproximada');
title('Trajetória no espaço (base inercial)');
grid on; axis equal;
