function [error,vBar] = computeErrorColor(A,b,c,vertices,vertex1,vertex2)
    
    threshold = 1;
    v1 = vertices(:,vertex1);
    v2 = vertices(:,vertex2);
    A1 = A(:,:,vertex1);
    A2 = A(:,:,vertex2);
    At = A1 + A2;
    Am = At;
    B1 = b(:,:,vertex1);
    B2 = b(:,:,vertex2);
    C1 = c(:,:,vertex1);
    C2 = c(:,:,vertex2);
    Bt = B1 + B2;
    Ct = C1 + C2;
    Am(3,:) = [0 0 1 0 0 0];
    
    if(cond(Am) > threshold)
        vBar = (v1(1:6) + v2(1:6)) / 2;
    else
        vBar = Am \ [0;0;1;0;0;0];
    end

    error = vBar' * At * vBar + 2 * Bt' * vBar + Ct;
    vBar = vBar';
    
end