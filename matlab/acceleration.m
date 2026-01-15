function d2q = acceleration(dq, q, t)
% Computes generalized accelerations d2q
% Solves the acceleration constraint equation

constants;

%% ---------------- Positions from q ----------------
% Absolute positions and angles of all bodies
r0  = [0;0];      fi0  = 0;
r1  = q(1:2);     fi1  = q(3);
r2  = q(4:5);     fi2  = q(6);
r3  = q(7:8);     fi3  = q(9);
r4  = q(10:11);   fi4  = q(12);
r5  = q(13:14);   fi5  = q(15);
r6  = q(16:17);   fi6  = q(18);
r7  = q(19:20);   fi7  = q(21);
r8  = q(22:23);   fi8  = q(24);
r9  = q(25:26);   fi9  = q(27);
r10 = q(28:29);   fi10 = q(30);

%% ---------------- Rotation matrices ----------------
Rot0  = eye(2);
Rot1  = Rot(fi1);   Rot2  = Rot(fi2);
Rot3  = Rot(fi3);   Rot4  = Rot(fi4);
Rot5  = Rot(fi5);   Rot6  = Rot(fi6);
Rot7  = Rot(fi7);   Rot8  = Rot(fi8);
Rot9  = Rot(fi9);   Rot10 = Rot(fi10);

%% ---------------- Velocities from dq ----------------
% Linear and angular velocities
dr0  = [0;0];      dfi0  = 0;
dr1  = dq(1:2);    dfi1  = dq(3);
dr2  = dq(4:5);    dfi2  = dq(6);
dr3  = dq(7:8);    dfi3  = dq(9);
dr4  = dq(10:11);  dfi4  = dq(12);
dr5  = dq(13:14);  dfi5  = dq(15);
dr6  = dq(16:17);  dfi6  = dq(18);
dr7  = dq(19:20);  dfi7  = dq(21);
dr8  = dq(22:23);  dfi8  = dq(24);
dr9  = dq(25:26);  dfi9  = dq(27);
dr10 = dq(28:29);  dfi10 = dq(30);

%% ---------------- Helper matrix ----------------
% Used for derivatives of rotation
Om = [0 -1; 1 0];

%% ---------------- Gamma vector ----------------
% Right-hand side of acceleration equation
gam = zeros(30,1);

%% ---------------- Revolute joint gamma terms ----------------
% Centripetal acceleration terms only (ω² terms)

s1G = P.G - P.c1;
s2G = P.G - P.c2;
gam(1:2)   = Rot1*s1G*dfi1^2 - Rot2*s2G*dfi2^2;
gam(3:4)   = Rot1*SA_DF*dfi1^2 - Rot7*SB_LF*dfi7^2;
gam(5:6)   = -Rot1*SB_DE*dfi1^2;
gam(7:8)   = Rot1*SA_PISTON_C3*dfi1^2 - Rot3*SB_PISTON_C3*dfi3^2;
gam(9:10)  = Rot7*SA_FI*dfi7^2 - Rot8*SB_KI*dfi8^2;
gam(11:12) = Rot7*SA_FL*dfi7^2 - Rot10*SB_NL*dfi10^2;
gam(13:14) = Rot8*SA_PISTON_C5*dfi8^2 - Rot5*SB_PISTON_C5*dfi5^2;

s8J = P.J - P.c8;
s2J = P.J - P.c2;
gam(15:16) = Rot8*s8J*dfi8^2 - Rot2*s2J*dfi2^2;

gam(17:18) = Rot8*SA_K*dfi8^2 - Rot9*SB_NK*dfi9^2;
gam(19:20) = Rot9*SA_N*dfi9^2 - Rot10*SB_LN*dfi10^2;
gam(21:22) = -Rot4*SB_cyclinderA*dfi4^2;
gam(23:24) = -Rot6*SB_cyclinderB*dfi6^2;

%% ---------------- Prismatic joint 3–4 ----------------
% Geometry and relative motion

s3D = SB_PISTON_C3;
s4A = SB_cyclinderA;

p3D = r3 + Rot3*s3D;
p4A = r4 + Rot4*s4A;

d34 = p3D - p4A;

d34_dot = (dr3 + Rot3*Om*s3D*dfi3) ...
        - (dr4 + Rot4*Om*s4A*dfi4);

a1 = Rot4*v1;
a1_dot = Rot4*Om*v1*dfi4;
a1_ddot_noacc = -Rot4*v1*dfi4^2;

b1 = Rot4*u1;
b1_dot = Rot4*Om*u1*dfi4;
b1_ddot_noacc = -Rot4*u1*dfi4^2;

% Orientation constraint has zero acceleration
gam(25) = 0;

% Perpendicular constraint acceleration
gam(26) = -( a1_ddot_noacc'*d34 ...
           + 2*a1_dot'*d34_dot ...
           + a1'*(-Rot3*s3D*dfi3^2 + Rot4*s4A*dfi4^2) );

% Driving constraint acceleration
[A1,A2,w] = driverParams();
d2s1 = -A1*w^2*sin(w*t);

gam(29) = -( b1_ddot_noacc'*d34 ...
           + 2*b1_dot'*d34_dot ...
           + b1'*(-Rot3*s3D*dfi3^2 + Rot4*s4A*dfi4^2) ) + d2s1;

%% ---------------- Prismatic joint 5–6 ----------------

s5H = SB_PISTON_C5;
s6B = SB_cyclinderB;

p5H = r5 + Rot5*s5H;
p6B = r6 + Rot6*s6B;

d56 = p5H - p6B;

d56_dot = (dr5 + Rot5*Om*s5H*dfi5) ...
        - (dr6 + Rot6*Om*s6B*dfi6);

a2 = Rot6*v2;
a2_dot = Rot6*Om*v2*dfi6;
a2_ddot_noacc = -Rot6*v2*dfi6^2;

b2 = Rot6*u2;
b2_dot = Rot6*Om*u2*dfi6;
b2_ddot_noacc = -Rot6*u2*dfi6^2;

% Orientation constraint has zero acceleration
gam(27) = 0;

% Perpendicular constraint acceleration
gam(28) = -( a2_ddot_noacc'*d56 ...
           + 2*a2_dot'*d56_dot ...
           + a2'*(-Rot5*s5H*dfi5^2 + Rot6*s6B*dfi6^2) );

% Driving constraint acceleration
d2s2 = -A2*w^2*sin(w*t);

gam(30) = -( b2_ddot_noacc'*d56 ...
           + 2*b2_dot'*d56_dot ...
           + b2'*(-Rot5*s5H*dfi5^2 + Rot6*s6B*dfi6^2) ) + d2s2;

%% ---------------- Solve acceleration equation ----------------
% Fq * d2q = gamma
Fq = Jacobian(q);
d2q = Fq \ gam;

end
