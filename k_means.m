function [centroids, clusters] = k_means(data, K)

%init random centroids
centroids = data(randperm(size(data,1), K), :);

while true
    %init clusters for the current centroids
    clusters = zeros(size(data,1), 1);
    
    %foreach row, compute distance to each centriod and assign to min
    for i=1:size(data,1)
        row = data(i, :);
        distances = pdist2(row, centroids);
        [~, idx] = min(distances);
        clusters(i) = idx;
    end
    
    next_centroids = zeros(K, size(data,2));
    
    %recompute the centroid of each cluster
    for c=1:K
        %init new centroid
        centroid = zeros(1, size(data,2));
        
        %foreach row in this cluster combine it to a subset matrix
        for i=1:size(clusters,1)
            if clusters(i) == c
                centroid = [centroid ; data(i, :)];
            end
        end
        centroids
        next_centroids
        next_centroids(c, :) = mean(centroid);
    end
    
    %if our centroids haven't changed, break
    if next_centroids == centroids
        break
    end
    centroids = next_centroids
end

end