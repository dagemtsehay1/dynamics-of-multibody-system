function P = parameters()
% PARAMETERS
% Defines global coordinates of joints and centers of mass
% Used by constraints, Jacobian, main function, plotting

%% ---------------- Characteristic points (Table 1) ----------------
P.A = [0.0; 0.0];
P.B = [0.0; 0.4];
P.D = [0.2; 0.4];
P.E = [0.0; 0.7];
P.F = [0.0; 0.8];
P.G = [0.3; 1.0];
P.H = [0.6; 0.6];
P.I = [0.9; 0.6];
P.J = [1.1; 0.7];
P.K = [1.2; 0.9];
P.L = [1.7; 0.2];
P.M = [2.0; 0.4];
P.N = [1.9; 0.7];

%% ---------------- Centers of Mass (Table 2) ----------------
P.c0  = [0.0; 0.0];
P.c1  = [0.15; 0.70];
P.c2  = [0.70; 0.85];
P.c3  = [0.15; 0.30];
P.c4  = [0.05; 0.10];
P.c5  = [0.45; 0.55];
P.c6  = [0.15; 0.45];
P.c7  = [0.85; 0.55];
P.c8  = [0.95; 0.70];
P.c9  = [1.55; 0.80];
P.c10 = [1.85; 0.45];

%% ---------------- Ground orientation ----------------
P.phi_ground = 0;

end
