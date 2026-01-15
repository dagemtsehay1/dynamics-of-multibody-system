function animation(T, Q)
% ANIMATION – cylinders and pistons using geometric formula

P = parameters();
Ccol = lines(10);

figure;

for k = 1:length(T)

    clf; hold on; grid on; axis equal;
    xlim([-0.5 2.5]);
    ylim([-0.5 2.0]);
    title(sprintf('t = %.3f s', T(k)));

    q = Q(:,k);

    %% -------- UNPACK --------
    r1=q(1:2);  R1=Rot(q(3));
    r3=q(7:8);  R3=Rot(q(9));
    r4=q(10:11);R4=Rot(q(12));
    r5=q(13:14);R5=Rot(q(15));
    r6=q(16:17);R6=Rot(q(18));
    r7=q(19:20);R7=Rot(q(21));
    r8=q(22:23);R8=Rot(q(24));
    r9=q(25:26);R9=Rot(q(27));
    r10=q(28:29);R10=Rot(q(30));

    %% -------- GLOBAL POINTS --------
    A=P.A;  B=P.B;  E=P.E;

    D = r1 + R1*(P.D-P.c1);
    F = r1 + R1*(P.F-P.c1);
    G = r1 + R1*(P.G-P.c1);

    I = r7 + R7*(P.I-P.c7);
    L = r7 + R7*(P.L-P.c7);

    H = r8 + R8*(P.H-P.c8);
    J = r8 + R8*(P.J-P.c8);
    K = r8 + R8*(P.K-P.c8);

    N = r9  + R9 *(P.N-P.c9);
    M = r10 + R10*(P.M-P.c10);

    %% ================= SOLID BODIES =================

    % c1 : E–F–G–D
    fillBody([E F G D], Ccol(1,:), 'c1');

    % c2 : G–J
    fillLink(G, J, Ccol(2,:), 'c2');

    %% ---------- CYLINDER 4 at A ----------
    C4 = r4;
    u4 = C4 - A;
    L4 = 2*norm(u4);
    u4 = u4 / norm(u4);
    drawCylinder(A, u4, L4, 0.025, Ccol(4,:), 'c4');   % 5 cm diameter

    %% ---------- PISTON 3 at D ----------
    C3 = r3;
    u3 = C3 - D;
    L3 = 2*norm(u3);
    u3 = u3 / norm(u3);
    drawCylinder(D, u3, L3, 0.015, Ccol(3,:), 'c3');   % 3 cm diameter

    %% ---------- CYLINDER 6 at B ----------
    C6 = r6;
    u6 = C6 - B;
    L6 = 2*norm(u6);
    u6 = u6 / norm(u6);
    drawCylinder(B, u6, L6, 0.025, Ccol(6,:), 'c6');   % 5 cm diameter

    %% ---------- PISTON 5 at H ----------
    C5 = r5;
    u5 = C5 - H;
    L5 = 2*norm(u5);
    u5 = u5 / norm(u5);
    drawCylinder(H, u5, L5, 0.015, Ccol(5,:), 'c5');   % 3 cm diameter

    % c7 : F–I–L
    fillBody([F I L], Ccol(7,:), 'c7');

    % c8 : H–I–J–K
    fillBody([H I J K], Ccol(8,:), 'c8');

    % c9 : K–N
    fillLink(K, N, Ccol(9,:), 'c9');

    % c10 : L–M–N
    fillBody([L M N], Ccol(10,:), 'c10');

    %% ---------- JOINT LABELS ----------
    drawJoint(A,'A'); drawJoint(B,'B'); drawJoint(E,'E');
    drawJoint(D,'D'); drawJoint(F,'F'); drawJoint(G,'G');
    drawJoint(H,'H'); drawJoint(I,'I'); drawJoint(J,'J');
    drawJoint(K,'K'); drawJoint(L,'L'); drawJoint(M,'M');
    drawJoint(N,'N');

    pause(0.02);
end
end

%% ================= HELPERS =================

function fillBody(P,col,label)
    label = "";
    fill(P(1,:),P(2,:),col,'FaceAlpha',0.45,'EdgeColor','k','LineWidth',1.5);
    c=mean(P,2);
    text(c(1),c(2),label,'FontWeight','bold');
end

function fillLink(p1,p2,col,label)
    label = "";
    w=0.03;
    v=p2-p1; v=v/norm(v);
    n=[-v(2);v(1)];
    P=[p1+n*w p2+n*w p2-n*w p1-n*w];
    fillBody(P,col,label);
end

function drawCylinder(p0,u,L,w,col,label)
    label = "";
    n=[-u(2);u(1)];
    P=[ ...
        p0+n*w, ...
        p0+u*L+n*w, ...
        p0+u*L-n*w, ...
        p0-n*w ];
    fillBody(P,col,label);
end

function drawJoint(p,label)
label = "";
    plot(p(1),p(2),'ko','MarkerFaceColor','k');
    text(p(1)+0.02,p(2)+0.02,label,'FontWeight','bold');
end
