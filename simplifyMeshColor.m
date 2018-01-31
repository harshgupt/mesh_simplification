function [newFaces,newVertices] = simplifyMeshColor(newFaces,newVertices,threshold)
    
    %Compute pair sets separated by vertices
    pairSet = computePairs(newVertices(1:3,:),newFaces,threshold);

    %Compute Q for all Vertices
    A = zeros(6,6,length(newVertices));
    b = zeros(6,1,length(newVertices));
    c = zeros(1,1,length(newVertices));
    for index = 1:length(newVertices)
        [A(:,:,index),b(:,:,index),c(:,:,index)] = computeQColor(index,newFaces,newVertices);
    end
    
    sortingList = zeros(size(pairSet,1),9);
    
    for sIndex = 1:length(pairSet)
        currentPairs = pairSet(sIndex,:);
        
        if ~isempty(currentPairs)        
            [error,vBar] = computeErrorColor(A,b,c,newVertices,currentPairs(1),currentPairs(2));
            sortingList(sIndex,1:2) = currentPairs;
            sortingList(sIndex,3) = error;
            sortingList(sIndex,4:9) = vBar;
        end

    end    
    
    sortingList = sortrows(sortingList,3);
    [newFaces,newVertices] = updateValues(newFaces,newVertices,sortingList(1,4:9),sortingList(1,1),sortingList(1,2));
        
end

