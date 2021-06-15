function [movies] = suggestMovies(genre_id, minHash, n_hash, u, u_genres, ID, titles)
    
    set = getUserMovies(u); % Conjunto do nº de filmes por cada utilizador 
    
    similar_users = getSimilarUsers(u, minHash, n_hash, 0.99, ID); % [users(ID) users(n) distância]
   
    row = find(similar_users(:, 3) == min(similar_users(:, 3))); % Utilizador mais similar ao user atual 
    
    % ID's dos filmes que o utilizador atual não viu  
    not_seen_movies = setdiff([set{similar_users(row, 2)}], [set{similar_users(row, 1)}]); 
 
    movies = [];
    c = 1;
    for k = 1 : length(not_seen_movies) % Percorre todos os filmes não vistos pelo user_id
        if (u_genres(not_seen_movies(k), genre_id) == 1) % se o filme for do género selecionado então adiciona ao vetor
            movies(c, 1) = not_seen_movies(k);
            c = c + 1;
        end
    end
  
    if (isempty(movies))
        disp('No suggestions found.');
    else
        n_suggested = length(movies);
        for k = 1 : n_suggested     
            disp(titles{movies(k, 1)});    % Conjunto de todos os filmes em função da sugestão pedida
        end
    end
end

