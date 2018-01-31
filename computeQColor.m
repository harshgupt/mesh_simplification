function [At,Bt,Ct] = computeQColor(vertex,faces,vertices)

    At = zeros(6);
    Bt = zeros(6,1);
    Ct = 0;
    vRingFaces = compute_vertex_face_ring(faces);
    currFace = vRingFaces{vertex};
    for index = 1:length(currFace)
        currVertices =(faces(:,currFace(index)))';
        [A,b,c] = computeQuadricParams(vertices(:,currVertices(1)),vertices(:,currVertices(2)),vertices(:,currVertices(3)));
        At = At + A;
        Bt = Bt + b;
        Ct = Ct + c;
    end

end