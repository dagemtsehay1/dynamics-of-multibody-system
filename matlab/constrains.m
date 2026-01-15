function F = constrains(q,t)
% F = constrains(q,t)
% Computes the constraint vector Φ(q,t)
% Used by Newton–Raphson to solve the position problem
%
% q : absolute coordinates of all bodies [x y φ] stacked
% t : current time
% F : values of constraint equations

%% -------------------------------------------------
% Load constants and geometric parameters
%% -------------------------------------------------
constants;
P = parameters();

%% -------------------------------------------------
% Extract absolute coordinates from vector q
% Each body has 3 coordinates: [x; y; φ]
% Body 0 (ground) is fixed
%% -------------------------------------------------
r0 = [0;0];     fi0 = 0;

r1  = q(1:2);    fi1  = q(3);
r2  = q(4:5);    fi2  = q(6);
r3  = q(7:8);    fi3  = q(9);
r4  = q(10:11);  fi4  = q(12);
r5  = q(13:14);  fi5  = q(15);
r6  = q(16:17);  fi6  = q(18);
r7  = q(19:20);  fi7  = q(21);
r8  = q(22:23);  fi8  = q(24);
r9  = q(25:26);  fi9  = q(27);
r10 = q(28:29);  fi10 = q(30);

%% -------------------------------------------------
% Rotation matrices R(φ)
% Used in expressions r + R*s
%% -------------------------------------------------
Rot0 = eye(2);

Rot1  = Rot(fi1);   Rot2  = Rot(fi2);   Rot3  = Rot(fi3);
Rot4  = Rot(fi4);   Rot5  = Rot(fi5);   Rot6  = Rot(fi6);
Rot7  = Rot(fi7);   Rot8  = Rot(fi8);   Rot9  = Rot(fi9);
Rot10 = Rot(fi10);

%% =================================================
% REVOLUTE JOINT CONSTRAINTS  (Lecture eq. 5.17)
% Condition: r_i + R_i*sA = r_j + R_j*sB
% Each revolute joint gives 2 equations
%% =================================================

% Joint between body 1 and body 2 at point G
s1G = P.G - P.c1;   % local vector from c1 to G
s2G = P.G - P.c2;   % local vector from c2 to G
F(1:2,1) = (r1 + Rot1*s1G) - (r2 + Rot2*s2G);

% Joint between body 1 and body 7 at point F
F(3:4,1) = r1 + Rot1*SA_DF - (r7 + Rot7*SB_LF);

% Joint between ground (body 0) and body 1 at point E
F(5:6,1) = r0 + Rot0*SA_AE - (r1 + Rot1*SB_DE);

% Joint between body 1 and body 3 at point D
F(7:8,1) = r1 + Rot1*SA_PISTON_C3 - (r3 + Rot3*SB_PISTON_C3);

% Joint between body 7 and body 8 at point I
F(9:10,1) = r7 + Rot7*SA_FI - (r8 + Rot8*SB_KI);

% Joint between body 7 and body 10 at point L
F(11:12,1) = r7 + Rot7*SA_FL - (r10 + Rot10*SB_NL);

% Joint between body 8 and body 5 at point H
F(13:14,1) = r8 + Rot8*SA_PISTON_C5 - (r5 + Rot5*SB_PISTON_C5);

% Joint between body 8 and body 2 at point J
s8J = P.J - P.c8;   % c8 -> J
s2J = P.J - P.c2;   % c2 -> J
F(15:16,1) = (r8 + Rot8*s8J) - (r2 + Rot2*s2J);

% Joint between body 8 and body 9 at point K
F(17:18,1) = r8 + Rot8*SA_K - (r9 + Rot9*SB_NK);

% Joint between body 9 and body 10 at point N
F(19:20,1) = r9 + Rot9*SA_N - (r10 + Rot10*SB_LN);

% Joint between ground (body 0) and body 4 at point A
F(21:22,1) = r0 + Rot0*SA_A - (r4 + Rot4*SB_cyclinderA);

% Joint between ground (body 0) and body 6 at point B
F(23:24,1) = r0 + Rot0*SA_B - (r6 + Rot6*SB_cyclinderB);

%% =================================================
% TRANSLATIONAL (PRISMATIC) JOINT CONSTRAINTS
% Lecture eqs. 5.18 and 5.21
%% =================================================

% Local vectors for piston–cylinder joints
s3D = SB_PISTON_C3;     % body 3 to point D
s4A = SB_cyclinderA;    % body 4 to point A

s5H = SB_PISTON_C5;     % body 5 to point H
s6B = SB_cyclinderB;    % body 6 to point B

% Global positions of piston points
p3D = r3 + Rot3*s3D;
p4A = r4 + Rot4*s4A;

p5H = r5 + Rot5*s5H;
p6B = r6 + Rot6*s6B;

% Orientation constraints (relative angle fixed)
F(25,1) = fi3 - fi4 - f1;
F(27,1) = fi5 - fi6 - f2;

% Perpendicularity constraints (no sideways motion)
F(26,1) = (Rot4*v1)' * (p3D - p4A);
F(28,1) = (Rot6*v2)' * (p5H - p6B);

% Driving constraints (motion along cylinder axis)
[A1, A2, w] = driverParams();

persistent s10 s20
if isempty(s10)
    % Initial piston positions at first call (t = 0)
    s10 = (Rot4*u1)' * (p3D - p4A);
    s20 = (Rot6*u2)' * (p5H - p6B);
end

% Prescribed sinusoidal motion
s1 = s10 + A1*sin(w*t);
s2 = s20 + A2*sin(w*t);

% Enforce motion along sliding direction
F(29,1) = (Rot4*u1)' * (p3D - p4A) - s1;
F(30,1) = (Rot6*u2)' * (p5H - p6B) - s2;

end
