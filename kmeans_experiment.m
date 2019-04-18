%k_means experiment
figure()
data = rand(1000,2);
K = 4;
[centroids, clusters] = k_means(data, K);
gscatter(data(:,1),data(:,2),clusters);

figure()
[centroids, clusters] = spectral_k_means(data, K);
gscatter(data(:,1),data(:,2),clusters);
title('spectral k means')



