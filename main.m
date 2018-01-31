 clear all;close all;clc;

addpath('toolbox_graph');

%Following 2 lines are for reading .off and .ply formats respectively
[vertices, faces] = read_off('bumpy.off');
% [vertices, faces] = ply_to_tri_mesh('cow.ply');

color = rand(size(vertices));
% figure, hold on,
trisurf(faces',vertices(1,:),vertices(2,:),vertices(3,:));axis equal;

%The following line is used to map the colors for the additional section 
% colormap(color');

hold off;

newVertices = vertices;
threshold = 0.01; % distance between vertices 
nIter = 1; % number of iterations define the number of edges to be removed
newFaces = faces;

%Main algorithm (Common, to be commented if trying additional sections)
for i = 1:nIter
        [newFaces,newVertices] = simplifyMesh(newFaces,newVertices,threshold);
end

%Additional section including color parameters
% newVertices = vertcat(newVertices,color);
% for i = 1:nIter
%         [newFaces,newVertices] = simplifyMeshColor(newFaces,newVertices,threshold);
% end

figure;
% hold on,
trisurf(newFaces',newVertices(1,:),newVertices(2,:),newVertices(3,:));axis equal;

%The following line is used to map the colors for the additional section
% colormap(newVertices(4:6,:)');
hold off;
