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


[T,Q,DQ,D2Q] = main_fun;
% animation(T, Q);

%% -------- SELECT BODY AND LETTER --------
c = 10;              % body index 7 and 10
letter = 'N';       % change letter here
marker = 25;        % 17 for I && 25 for N

%% -------- LOAD ADAMS DATA --------
adams_data = readtable("Adams/c" + c + ".csv");
adams_data2 = readtable("Adams/c" + c + "." + letter + ".csv");

P = parameters();

%% -------- INDICES --------
idx_x  = 3*(c-1) + 1;
idx_y  = 3*(c-1) + 2;
idx_fi = 3*(c-1) + 3;

%% -------- CENTER OF MASS --------
Px = Q(idx_x,:);
Py = Q(idx_y,:);

Vx = DQ(idx_x,:);
Vy = DQ(idx_y,:);

Ax = D2Q(idx_x,:);
Ay = D2Q(idx_y,:);

%% -------- LETTER POINT (POSITION) --------
Pg = P.(letter);                 % global at t = 0
Pc = P.(['c' num2str(c)]);       % CM at t = 0
P_local = Pg - Pc;

Rx = Q(idx_x,:);
Ry = Q(idx_y,:);
Fi = Q(idx_fi,:);

Lx = zeros(size(T));
Ly = zeros(size(T));

for k = 1:length(T)

    Pk = [Rx(k); Ry(k)] + Rot(Fi(k)) * P_local;
    Lx(k) = Pk(1);
    Ly(k) = Pk(2);
end

%% -------- LETTER POINT (VELOCITY & ACCELERATION) --------
Vx_L = gradient(Lx, T);
Vy_L = gradient(Ly, T);

Ax_L = gradient(Vx_L, T);
Ay_L = gradient(Vy_L, T);

% -------- ADAMS marker field names --------
m = num2str(marker);

AD_Px = "x_MARKER_" + m + "_Translational_Displacement_X";
AD_Py = "x_MARKER_" + m + "_Translational_Displacement_Y";

AD_Vx = "x_MARKER_" + m + "_Translational_Velocity_X";
AD_Vy = "x_MARKER_" + m + "_Translational_Velocity_Y";

AD_Ax = "x_MARKER_" + m + "_Translational_Acceleration_X";
AD_Ay = "x_MARKER_" + m + "_Translational_Acceleration_Y";

%% ================= cm X DIRECTION =================
figure(1)

subplot(3,1,1)
plot(T, Px, 'r','LineWidth',1.5); hold on
plot(adams_data.Time, adams_data.x_cm_Translational_Displacement_X,'b--','LineWidth',1.5)
grid on
title(['Position X  for cm ',num2str(c)])
legend('MATLAB','ADAMS')

subplot(3,1,2)
plot(T, Vx, 'r','LineWidth',1.5); hold on
plot(adams_data.Time, adams_data.x_cm_Translational_Velocity_X,'b--','LineWidth',1.5)
grid on
title('Velocity X')
legend('MATLAB','ADAMS')

subplot(3,1,3)
plot(T, Ax, 'r','LineWidth',1.5); hold on
plot(adams_data.Time, adams_data.x_cm_Translational_Acceleration_X,'b--','LineWidth',1.5)
grid on
title('Acceleration X')
legend('MATLAB','ADAMS')

%% ================= cm Y DIRECTION =================
figure(2)

subplot(3,1,1)
plot(T, Py, 'r','LineWidth',1.5); hold on
plot(adams_data.Time, adams_data.x_cm_Translational_Displacement_Y,'b--','LineWidth',1.5)
grid on
title(['Position Y  for cm ',num2str(c)])
legend('MATLAB','ADAMS')

subplot(3,1,2)
plot(T, Vy, 'r','LineWidth',1.5); hold on
plot(adams_data.Time, adams_data.x_cm_Translational_Velocity_Y,'b--','LineWidth',1.5)
grid on
title('Velocity Y')
legend('MATLAB','ADAMS')

subplot(3,1,3)
plot(T, Ay, 'r','LineWidth',1.5); hold on
plot(adams_data.Time, adams_data.x_cm_Translational_Acceleration_Y,'b--','LineWidth',1.5)
grid on
title('Acceleration Y')
legend('MATLAB','ADAMS')


%% ================= letter X DIRECTION =================
figure(3)

subplot(3,1,1)
plot(T, Lx, 'r','LineWidth',1.5)
hold on
plot(adams_data2.Time, adams_data2.(AD_Px),'b--','LineWidth',1.5)
grid on
title(['Position X  for point ',letter])
legend('MATLAB','ADAMS')

subplot(3,1,2)
plot(T, Vx_L, 'r','LineWidth',1.5)
hold on
plot(adams_data2.Time, adams_data2.(AD_Vx),'b--','LineWidth',1.5)
grid on
title('Velocity X')
legend('MATLAB','ADAMS')

subplot(3,1,3)
plot(T, Ax_L, 'r','LineWidth',1.5)
hold on
plot(adams_data2.Time, adams_data2.(AD_Ax),'b--','LineWidth',1.5)
grid on
title('Acceleration X')
legend('MATLAB','ADAMS')

%% ================= letter y DIRECTION =================
figure(4)

subplot(3,1,1)
plot(T, Ly, 'r','LineWidth',1.5)
hold on
plot(adams_data2.Time, adams_data2.(AD_Py),'b--','LineWidth',1.5)
grid on
title(['Position Y  for point ',letter])
legend('MATLAB','ADAMS')

subplot(3,1,2)
plot(T, Vy_L, 'r','LineWidth',1.5)
hold on
plot(adams_data2.Time, adams_data2.(AD_Vy),'b--','LineWidth',1.5)
grid on
title('Velocity X')
legend('MATLAB','ADAMS')

subplot(3,1,3)
plot(T, Ay_L, 'r','LineWidth',1.5)
hold on
plot(adams_data2.Time, adams_data2.(AD_Ay),'b--','LineWidth',1.5)
grid on
title('Acceleration X')
legend('MATLAB','ADAMS')