
% --> A função procura os títulos dos filmes mais similares à string
%   introduzida indicando a (estimativa da) distância de Jaccard 
%   entre a string e cada título.

% search - String a procurar 
% minHash_titles - função minHash para determinar os títulos mais similares
% n_hash_titles - n funções de dispersão para os títulos
% titles - título dos filmes
% n_shingle - n sequências de caracteres da string dada

function [] = searchTitle(search, minHash_titles, n_hash_titles, titles, n_shingle)
    

    % Retorna um array com os minHashs( títulos mais similares com a string
    % introduzida (search) )
    len = length(search);
    minHash_search = inf(1, n_hash_titles);
    for j = 1 : (len - n_shingle + 1)
        key = char(search(j:(j+n_shingle-1))); 
        h = zeros(1, n_hash_titles);
        for i = 1 : n_hash_titles
            key = [key num2str(i)];
            h(i) = DJB31MA(key, 127);
        end
        minHash_search(1, :) = min([minHash_search(1, :); h]);
    end
    
    % Permite obter todos os títulos mais similares à palavra fornecida e
    % as respetivas distâncias estimadas (em cel arrays) através do minHash
    % desenvolvido a cima 
    n_titles = length(titles);
    threshold = 0.99;
    similar_titles = {};
    distances = {};
    k = 0;
    for n = 1 : n_titles
        distancia = 1 - (sum(minHash_search(1, :) == minHash_titles(n,:)) / n_hash_titles);
        if (distancia < threshold)
            k = k + 1;  % número de títulos obtidos
            similar_titles{k} = titles{n};
            distances{k} = distancia;
        end
    end
         
    %  A lista apresentada deve ter no maximo 5 títulos
    if (k == 0)
        disp('No results found');
    elseif (k > 5)
        k = 5;
    end
    
    % Distância ordenada por ordem crescente, quanto menor a distância
    % maior a similaridade
    distances = cell2mat(distances);
    [distances, index] = sort(distances);
    
    for h = 1 : k
        fprintf('%s - %.3f\n', similar_titles{index(h)}, distances(h));
    end
end

