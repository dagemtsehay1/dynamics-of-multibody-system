function Fq = Jacobian(q)
% Fq = Jacobian(q)
% Computes the Jacobian matrix Φ_q = ∂Φ/∂q
% Used by Newton–Raphson in the position problem
%
% q  : absolute coordinates of the multibody system
% Fq : Jacobian matrix of constraint equations

%% -------------------------------------------------
% Load constants and geometry
%% -------------------------------------------------
constants;
P = parameters();

%% -------------------------------------------------
% Constant skew-symmetric matrix Ω
% Used for derivative of rotation matrix:
% d(R*s)/dφ = Ω*R*s   (lecture eq. 5.31)
%% -------------------------------------------------
Om = [0 -1; 1 0];

%% -------------------------------------------------
% Extract absolute coordinates from q
% Each body has [x; y; φ]
%% -------------------------------------------------
r0 = [0;0];

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
%% -------------------------------------------------
Rot0 = eye(2);

Rot1  = Rot(fi1);   Rot2  = Rot(fi2);
Rot3  = Rot(fi3);   Rot4  = Rot(fi4);
Rot5  = Rot(fi5);   Rot6  = Rot(fi6);
Rot7  = Rot(fi7);   Rot8  = Rot(fi8);
Rot9  = Rot(fi9);   Rot10 = Rot(fi10);

%% -------------------------------------------------
% Initialize Jacobian matrix with zeros
% Size: 30 constraints × 30 coordinates
%% -------------------------------------------------
Fq = zeros(30,30);

%% =================================================
% REVOLUTE JOINT JACOBIAN TERMS
% Based on lecture eqs. (5.30)–(5.33)
% Only bodies connected by a joint contribute
%% =================================================

%% ----- Joint G (body 1 – body 2) -----
s1G = P.G - P.c1;
s2G = P.G - P.c2;

Fq(1:2,1:2) =  eye(2);                % ∂Φ/∂r1
Fq(1:2,3)   =  Om * Rot1 * s1G;        % ∂Φ/∂φ1
Fq(1:2,4:5) = -eye(2);                % ∂Φ/∂r2
Fq(1:2,6)   = -Om * Rot2 * s2G;        % ∂Φ/∂φ2

%% ----- Joint F (body 1 – body 7) -----
Fq(3:4,1:2)     =  eye(2);
Fq(3:4,3)       =  Om * Rot1 * SA_DF;
Fq(3:4,19:20)   = -eye(2);
Fq(3:4,21)      = -Om * Rot7 * SB_LF;

%% ----- Joint E (ground – body 1) -----
Fq(5:6,1:2) = -eye(2);
Fq(5:6,3)   = -Om * Rot1 * SB_DE;

%% ----- Joint D (body 1 – body 3) -----
Fq(7:8,1:2)   =  eye(2);
Fq(7:8,3)     =  Om * Rot1 * SA_PISTON_C3;
Fq(7:8,7:8)   = -eye(2);
Fq(7:8,9)     = -Om * Rot3 * SB_PISTON_C3;

%% ----- Joint I (body 7 – body 8) -----
Fq(9:10,19:20) =  eye(2);
Fq(9:10,21)    =  Om * Rot7 * SA_FI;
Fq(9:10,22:23) = -eye(2);
Fq(9:10,24)    = -Om * Rot8 * SB_KI;

%% ----- Joint L (body 7 – body 10) -----
Fq(11:12,19:20) =  eye(2);
Fq(11:12,21)    =  Om * Rot7 * SA_FL;
Fq(11:12,28:29) = -eye(2);
Fq(11:12,30)    = -Om * Rot10 * SB_NL;

%% ----- Joint H (body 8 – body 5) -----
Fq(13:14,22:23) =  eye(2);
Fq(13:14,24)    =  Om * Rot8 * SA_PISTON_C5;
Fq(13:14,13:14) = -eye(2);
Fq(13:14,15)    = -Om * Rot5 * SB_PISTON_C5;

%% ----- Joint J (body 8 – body 2) -----
s8J = P.J - P.c8;
s2J = P.J - P.c2;

Fq(15:16,22:23) =  eye(2);
Fq(15:16,24)    =  Om * Rot8 * s8J;
Fq(15:16,4:5)   = -eye(2);
Fq(15:16,6)     = -Om * Rot2 * s2J;

%% ----- Joint K (body 8 – body 9) -----
Fq(17:18,22:23) =  eye(2);
Fq(17:18,24)    =  Om * Rot8 * SA_K;
Fq(17:18,25:26) = -eye(2);
Fq(17:18,27)    = -Om * Rot9 * SB_NK;

%% ----- Joint N (body 9 – body 10) -----
Fq(19:20,25:26) =  eye(2);
Fq(19:20,27)    =  Om * Rot9 * SA_N;
Fq(19:20,28:29) = -eye(2);
Fq(19:20,30)    = -Om * Rot10 * SB_LN;

%% ----- Joint A (ground – body 4) -----
Fq(21:22,10:11) = -eye(2);
Fq(21:22,12)    = -Om * Rot4 * SB_cyclinderA;

%% ----- Joint B (ground – body 6) -----
Fq(23:24,16:17) = -eye(2);
Fq(23:24,18)    = -Om * Rot6 * SB_cyclinderB;

%% =================================================
% TRANSLATIONAL (PRISMATIC) JOINT JACOBIAN
% Based on lecture eqs. (5.42)–(5.58)
%% =================================================

% Local vectors
s3D = SB_PISTON_C3;
s4A = SB_cyclinderA;

s5H = SB_PISTON_C5;
s6B = SB_cyclinderB;

% Global joint positions
p3D = r3 + Rot3*s3D;
p4A = r4 + Rot4*s4A;

p5H = r5 + Rot5*s5H;
p6B = r6 + Rot6*s6B;

%% Orientation constraints (φ differences)
Fq(25,9)  =  1;     % ∂/∂φ3
Fq(25,12) = -1;     % ∂/∂φ4

Fq(27,15) =  1;     % ∂/∂φ5
Fq(27,18) = -1;     % ∂/∂φ6

%% Helper vectors for dot-product constraints
a1  = Rot4 * v1;    da1 = Om * Rot4 * v1;
b1  = Rot4 * u1;    db1 = Om * Rot4 * u1;

a2  = Rot6 * v2;    da2 = Om * Rot6 * v2;
b2  = Rot6 * u2;    db2 = Om * Rot6 * u2;

d34 = (p3D - p4A);
d56 = (p5H - p6B);

%% Perpendicularity constraint Jacobians
Fq(26,7:8)   =  a1';
Fq(26,9)     =  a1' * Om * Rot3 * s3D;
Fq(26,10:11) = -a1';
Fq(26,12)    =  da1' * d34 - a1' * Om * Rot4 * s4A;

Fq(28,13:14) =  a2';
Fq(28,15)    =  a2' * Om * Rot5 * s5H;
Fq(28,16:17) = -a2';
Fq(28,18)    =  da2' * d56 - a2' * Om * Rot6 * s6B;

%% Sliding direction (driver) constraint Jacobians
Fq(29,7:8)   =  b1';
Fq(29,9)     =  b1' * Om * Rot3 * s3D;
Fq(29,10:11) = -b1';
Fq(29,12)    =  db1' * d34 - b1' * Om * Rot4 * s4A;

Fq(30,13:14) =  b2';
Fq(30,15)    =  b2' * Om * Rot5 * s5H;
Fq(30,16:17) = -b2';
Fq(30,18)    =  db2' * d56 - b2' * Om * Rot6 * s6B;

end
