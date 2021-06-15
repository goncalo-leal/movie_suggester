
% --> Esta função retorna uma matriz tal que a 1º coluna representa 
%   o ID do user atual, a 2º cada um dos outros utilizadores e a
%   a 3º representa a distância entre cada um dos utilizadores (coluna 1 e 2)


% u - duas primeiras colunas do ficheiro u.data (ID utilizador + ID filme)
% minHash - função minHash 
% k - k funções de dispersão
% threshold - limiar de decisão
% ID - Número de identificação do utilizador atual

function [SimilarUsers] = getSimilarUsers(u, minHash, K, threshold, ID)

    users = unique(u(:,1)); % Extrai os IDs dos utilizadores
    Nu = length(users); % Número de utilizadores
    
    SimilarUsers = zeros(1,3);
    k = 1;
    for n = 1 : Nu 
        distancia = 1 - sum(minHash(ID,:) == minHash(n,:)) / K;
        if ( distancia < threshold  && ID ~= n )  
            SimilarUsers(k,:) = [users(ID) users(n) distancia];
            k = k + 1;
        end
    end

end