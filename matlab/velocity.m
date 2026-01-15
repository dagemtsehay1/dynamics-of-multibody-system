function [dq, Fq] = velocity(q, t)
% Computes generalized velocities dq at time t
% Uses the velocity constraint equation

% Get driver parameters
[A1, A2, w] = driverParams();

% Time derivatives of prescribed motions
ds1 = A1 * w * cos(w * t);
ds2 = A2 * w * cos(w * t);

% Initialize time-derivative vector of constraints
Ft = zeros(30,1);

% Only driving constraints depend on time
Ft(29) = -ds1;   % driver for piston 3–4
Ft(30) = -ds2;   % driver for piston 5–6

% Compute Jacobian matrix
Fq = Jacobian(q);

% Solve velocity equation: Fq * dq = -Ft
dq = -Fq \ Ft;

end
