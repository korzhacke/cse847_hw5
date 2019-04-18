function [centroids, clusters] = spectral_k_means(data, K)
    xx = data * data';
    [V,D] = eig(xx)
    [D,I] = sort(diag(D), 'descend');
    V = V(:, I);
    xx = [xx V(:, 1:K)];
    [centroids, clusters] = k_means(xx, K);
end