
% --> Esta função faz as hash functions n_hash vezes, escolhe o minHash
%   e devolve o array com os minHash

% Set - Conjunto de utilizadores (+ o filme visto por cada um)
% n_hash - funções de dispersão

function [minHash] = minHash(Set,n_hash)
    
    n_users = length(Set);
    minHash = inf(n_users, n_hash);
    
    disp('minhash UTILIZADORES');
   
    for k = 1 : n_users     % Percorre todos os utilizadores
        movies = Set{k};  % Filmes do utilizador k
        n_movies = length(movies);
        
        for h = 1 : n_movies
            key = char(movies(h));            
            h = zeros(1, n_hash);
            for i = 1 : n_hash
                key = [key num2str(i)];
                h(i) = DJB31MA(key, 127);
            end
            minHash(k, :) = min([minHash(k, :); h]);
        end
    end
end




