% Load all geometric parameters
P = parameters();

%% -------------------------------------------------
% Definition of local joint vectors sA and sB
% Each vector is defined as:
% s = (global joint point) − (center of mass of the body)
% This matches eq. (5.13) in the lecture:
% r_A = r_i + R_i * s_A
%% -------------------------------------------------

% Joint G between body 1 and body 2
SA_DG = P.G - P.c1;   % vector s_A for body 1 (from CoM c1 to joint G)
SB_JG = P.G - P.c2;   % vector s_B for body 2 (from CoM c2 to joint G)

% Joint F between body 1 and body 7
SA_DF = P.F - P.c1;   % body 1 local vector to F
SB_LF = P.F - P.c7;   % body 7 local vector to F

% Joint E between ground (body 0) and body 1
SA_AE = P.E - P.c0;   % ground local vector to E
SB_DE = P.E - P.c1;   % body 1 local vector to E

% Joint D between body 1 and body 3 (piston connection)
SA_PISTON_C3 = P.D - P.c1;   % body 1 local vector to D
SB_PISTON_C3 = P.D - P.c3;   % body 3 local vector to D

% Joint I between body 7 and body 8
SA_FI = P.I - P.c7;   % body 7 local vector to I
SB_KI = P.I - P.c8;   % body 8 local vector to I

% Joint L between body 7 and body 10
SA_FL = P.L - P.c7;   % body 7 local vector to L
SB_NL = P.L - P.c10;  % body 10 local vector to L

% Joint H between body 8 and body 5 (piston connection)
SA_PISTON_C5 = P.H - P.c8;   % body 8 local vector to H
SB_PISTON_C5 = P.H - P.c5;   % body 5 local vector to H

% Joint J between body 8 and body 2
SA_KJ = P.J - P.c8;   % body 8 local vector to J
SB_GJ = P.J - P.c2;   % body 2 local vector to J

% Joint K between body 8 and body 9
SA_K = P.K - P.c8;    % body 8 local vector to K
SB_NK = P.K - P.c9;   % body 9 local vector to K

% Joint N between body 9 and body 10
SA_N  = P.N - P.c9;   % body 9 local vector to N
SB_LN = P.N - P.c10;  % body 10 local vector to N

% Joint A between ground (body 0) and cylinder 4
SA_A = P.A - P.c0;           % ground local vector to A
SB_cyclinderA = P.A - P.c4;  % cylinder 4 local vector to A

% Joint B between ground (body 0) and cylinder 6
SA_B = P.B - P.c0;           % ground local vector to B
SB_cyclinderB = P.B - P.c6;  % cylinder 6 local vector to B


%% -------------------------------------------------
% Translational joint directions for piston–cylinder pairs
% These correspond to eq. (5.21) in the lecture
% u  = unit vector along sliding direction
% v  = normal vector used in dot-product constraint vᵀ d = 0
%% -------------------------------------------------

% Cylinder 4 and piston 3
u1 = P.D - P.A;          % direction of sliding axis
u1 = u1 / norm(u1);      % unit direction vector
v1 = [-u1(2); u1(1)];    % perpendicular vector (normal to sliding axis)
f1 = 0;                  % fixed relative orientation (φ_i − φ_j = const)

% Cylinder 6 and piston 5
u2 = P.H - P.B;          % direction of sliding axis
u2 = u2 / norm(u2);      % unit direction vector
v2 = [-u2(2); u2(1)];    % perpendicular vector
f2 = 0;                  % fixed relative orientation
