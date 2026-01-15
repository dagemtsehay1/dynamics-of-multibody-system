function [T,Q,DQ,D2Q] = main_fun

clc;
close all;

%% ---------------- Time definition ----------------
tStart = 0;
tEnd   = 5;
nSteps = 100;
dt     = (tEnd - tStart) / nSteps;

time = tStart : dt : tEnd;
nPts = length(time);

%% ---------------- Initialization ----------------
q   = zeros(30,1);
dq  = zeros(30,1);
d2q = zeros(30,1);

P = parameters();

q = [
    P.c1;  0;
    P.c2;  0;
    P.c3;  0;
    P.c4;  0;
    P.c5;  0;
    P.c6;  0;
    P.c7;  0;
    P.c8;  0;
    P.c9;  0;
    P.c10; 0
];

%% ---------------- Storage ----------------
T   = zeros(1,nPts);
Q   = zeros(30,nPts);
DQ  = zeros(30,nPts);
D2Q = zeros(30,nPts);

%% ---------------- Time loop ----------------
for i = 1:nPts
    t = time(i);

    % Predictor
    q0 = q + dq*dt + 0.5*d2q*dt^2;

    % Position
    q = NewRaphson(q0, t);
    

    % Velocity
    dq = velocity(q, t);

    % Acceleration
    d2q = acceleration(dq, q, t);

    % Store
    T(i)     = t;
    Q(:,i)  = q;
    DQ(:,i) = dq;
    D2Q(:,i)= d2q;
end

end



c = 10;

adams_data     = readtable("Adams/c" + c + ".csv");

[T, Q, DQ, D2Q] = main_fun;
% animation(T, Q);

idx_x = 3*(c-1) + 1;
idx_y = 3*(c-1) + 2;

Px = Q(idx_x,:);
Py = Q(idx_y,:);

Vx = DQ(idx_x,:);
Vy = DQ(idx_y,:);

Ax = D2Q(idx_x,:);
Ay = D2Q(idx_y,:);



%% ---------------- X direction ----------------
figure(1)

subplot(3,1,1)
plot(T, Px, 'r', 'LineWidth', 1.5)
hold on
plot(adams_data.Time, ...
     adams_data.x_cm_Translational_Displacement_X, 'b--')
grid on
title(['Position for cm ', num2str(c), ' X'])
legend('MATLAB','ADAMS')

subplot(3,1,2)
plot(T, Vx, 'r', 'LineWidth', 1.5)
hold on
plot(adams_data.Time, ...
     adams_data.x_cm_Translational_Velocity_X, 'b--')
grid on
title(['Velocity for cm ', num2str(c), ' X'])
legend('MATLAB','ADAMS')

subplot(3,1,3)
plot(T, Ax, 'r', 'LineWidth', 1.5)
hold on
plot(adams_data.Time, ...
     adams_data.x_cm_Translational_Acceleration_X, 'b--')
grid on
title(['Acceleration for cm ', num2str(c), ' X'])
legend('MATLAB','ADAMS')

%% ---------------- Y direction ----------------
figure(2)

subplot(3,1,1)
plot(T, Py, 'r', 'LineWidth', 1.5)
hold on
plot(adams_data.Time, ...
     adams_data.x_cm_Translational_Displacement_Y, 'b--')
grid on
title(['Position for cm ', num2str(c), ' Y'])
legend('MATLAB','ADAMS')

subplot(3,1,2)
plot(T, Vy, 'r', 'LineWidth', 1.5)
hold on
plot(adams_data.Time, ...
     adams_data.x_cm_Translational_Velocity_Y, 'b--')
grid on
title(['Velocity for cm ', num2str(c), ' Y'])
legend('MATLAB','ADAMS')

subplot(3,1,3)
plot(T, Ay, 'r', 'LineWidth', 1.5)
hold on
plot(adams_data.Time, ...
     adams_data.x_cm_Translational_Acceleration_Y, 'b--')
grid on
title(['Acceleration for cm ', num2str(c), ' Y'])
legend('MATLAB','ADAMS')
