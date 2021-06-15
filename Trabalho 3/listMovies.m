
% --> A função obtém os títulos dos filmes que o utilizador atual viu.
%   (um título por linha)

% userMovies - Conjunto do número de filmes vistos por cada utilizador
% titles - cell array que contém os filmes e respetivos géneros
% ID - Número de identificação do utilizador atual

function [] = listMovies(userMovies, titles, ID)
    
    fprintf('\n--------------------------')
    fprintf('\n  Movies seen by user:   ');
    fprintf('\n-------------------------\n');
    
    n_filmes = 0;
    for f = 1 : length(userMovies{ID})  % userMovies{ID} - ids dos filmes do user ID
        movies = titles{userMovies{ID}(f)};  % filmes do user ID 
        n_filmes = n_filmes + 1;
        fprintf('%s \n', movies);
    end
    fprintf("\n --> Número de filmes vistos pelo utilizador: %d \n\n", n_filmes) 

end
