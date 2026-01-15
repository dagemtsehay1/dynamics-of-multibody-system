function R=Rot(fi)
% Calculating the rotation matrix - in the plannar case matrix size is 2x2
% Input:
% fi - angle fi of coordinate system (in radians)
% Output:
% R - Rotation matrix to abosoule coordinate system 

R= [cos(fi) -sin(fi); sin(fi) cos(fi)];
end 