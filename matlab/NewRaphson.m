function [q,Fq] = NewRaphson(q0,t)

% Preallocate Jacobian
Fq = zeros(30,30);

% q = NewRaphson(q0,t)
% Solves Φ(q,t) = 0 using the Newton–Raphson method
%
% Input:
% q0 : initial guess of absolute coordinates
% t  : current time
%
% Output:
% q  : solution of generalized coordinates
% Fq : Jacobian matrix at the solution
%
% Constraint equations are defined in constrains.m
% Jacobian of constraints is defined in Jacobian.m

%% -------------------------------------------------
% Initialize solution with initial guess
%% -------------------------------------------------
q = q0;

% Evaluate constraint vector at initial guess
F = constrains(q,t);

% Iteration counter
iter = 1;

%% -------------------------------------------------
% Newton–Raphson iteration loop
%% -------------------------------------------------
while ((norm(F) > 1e-10) && (iter < 30))

    % Re-evaluate constraint vector Φ(q,t)
    F = constrains(q,t);

    % Compute Jacobian Φ_q(q)
    Fq = Jacobian(q);

    % Check Jacobian rank (singularity detection)
    if rank(Fq) < 30
        disp('Jacobian is singular')
    end

    % Newton–Raphson update step
    % Solve: Φ_q * Δq = Φ
    % Update: q_new = q − Δq
    q = q - Fq \ F;

    % Increase iteration counter
    iter = iter + 1;

end

%% -------------------------------------------------
% Convergence check
%% -------------------------------------------------
if iter >= 30
    disp('ERROR: 30 iterations of the Newton-Raphson do not converge.')
    q = q0;   % revert to initial guess if not converged
end

end
