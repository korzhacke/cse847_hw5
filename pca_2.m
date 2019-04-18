load USPS.mat

%for i=1:2
%    A2 = reshape(A(i,:), 16, 16);
%    imshow(A2');
%end

p_components = [10, 50, 100, 200];
errors = zeros(1, 4);
reconstructed_1  = zeros(4,size(A,2));
reconstructed_2 = zeros(4,size(A,2));

for p=1:4
    [~, A_reconstructed] = pcares(A, p_components(p));
    errors(p) = norm(A - A_reconstructed);
    reconstructed_1(p, :) = A_reconstructed(1, :);
    reconstructed_2(p, :) = A_reconstructed(2, :);
end

%scatter(p_components, errors);

for i=1:4
    figure()
    A1 = reshape(reconstructed_1(i,:), 16, 16);
    imshow(A1')
    title(sprintf('image 1 with %d components',p_components(i)));
    
    figure()
    A2 = reshape(reconstructed_2(i,:), 16, 16);
    imshow(A2')
    title(sprintf('image 2 with %d components',p_components(i)));
end



