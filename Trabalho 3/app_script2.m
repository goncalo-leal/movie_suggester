Mesmo% Script 2
% -- Começa por ler do disco todas as estruturas previamente guardadas 
%   pelo primeiro script (readData) e depois implementa todas as interações com o utilizador

load('info.mat');

ID = input('Insert user ID (1 to 943): ');

while true
    
    if ~(mod(ID, 1) == 0)   % Verificar se ID é inteiro e se está entre 1 a 943
        fprintf('ERRO --> Input must be a numeric, not a %s.\n',class(ID)');
        ID = input('Try again: ');
    else
        if( ID >= 1 && ID <= 943)  % Verificar se ID é inteiro e se está entre 1 a 943
            
            disp('---------------------------');
            fprintf('          Menu      \n');
            fprintf('1 - Your movies\n');
            fprintf('2 - Get Suggestions\n');
            fprintf('3 - Search Title\n');
            fprintf('4 - Exit\n');
            choice = input('Select choice: ');
            
            % Verificar a validade da opção do menu
            while ( (choice < 1 || choice > 4) && ~(mod(choice, 1) == 0))
                fprintf('ERRO --> Número inválido. Tente Novamente \n');
                choice = input('Select choice: ');
            end
  
            switch choice
                case 1 
                    % mudei de u_item para titles, porque é carregada no
                    % load e aqui só é preciso passar os filmes para a
                    % função
                    listMovies(userMovies, titles, ID);
                    
                case 2
                    fprintf('\n1 - unknown, 2 - Action, 3 - Adventure, 4 - Animation\n');
                    fprintf('5 - Childrens, 6 - Comedy, 7 - Crime, 8 - Documentary\n');
                    fprintf('9 - Drama, 10 - Fantasy, 11 - Film-Noir, 12 - Horror\n');
                    fprintf('13 - Musical, 14 - Mystery, 15 - Romance, 16 - Sci-fi\n');
                    fprintf('17 - Thriller, 18 - War, 19 - Western\n');         
                    genre_id = input('Select choice: ');
                    
                    % Verificar a validade do genre_id
                    while (genre_id < 1 || genre_id > 19)      
                        disp('Invalid genre');
                        genre_id = input('Select choice: ');
                    end
                    
                    fprintf("\n--> Suggested movies:  \n");
                    suggested_movies = suggestMovies(genre_id, minHash_table, n_hash_table, u, u_genres, ID, titles);

                case 3

                    search = lower(input('Write a string: ', 's'));
                    while (length(search) < n_shingle)
                        fprintf('Write a minimum of %d characters\n', n_shingle);
                        search = lower(input('Write a string: ', 's'));
                    end
                    
                    searchTitle(search, minHash_titles, n_hash_titles, titles, n_shingle);  
                    
                case 4  
                    break;
            end     
        else
            fprintf('ERRO --> ID must be a value between 1 and 943.\n');
            ID = input('Try again: ');
        end
    end
end 