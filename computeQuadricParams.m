function [A,b,c] = computeQuadricParams(p,q,r)

e1 = (q - p) / norm(q-p);
e2 = (r - p - (dot(e1,(r-p)) * e1)) / norm(r - p - (dot(e1,(r-p)) * e1));
A = eye(6) - (e1 * e1') - (e2 * e2');
b = (dot(p,e1)) * e1 + (dot(p,e2)) * e2 - p;
c = dot(p,p) - (dot(p,e1))^2 - (dot(p,e2))^2;