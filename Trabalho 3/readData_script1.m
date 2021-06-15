% Script 1
% -- Corre uma unica vez para ler os dois ficheiros de entrada e 
%     guardar em ficheiro todas as estruturas de dados associadas aos 
%     utilizadores e aos filmes, incluindo a matriz com os vectores MinHash 
%     de cada utilizador (de suporte à opção 2) e a matriz com os vectores 
%     MinHash de cada título (de suporte à opçãp 3).


u_item = readcell('u_item.txt');   % Filmes(coluna1) e os seus respetivos géneros (coluna 2 a 20)
u_data = load('u.data.txt');   % Carrega o ficheiro dos dados dos filmes

u = u_data(1:end,1:2); clear udata;   % Fica apenas com as duas primeiras colunas de 'u.data'
userMovies = getUserMovies(u);   % Conjunto de filmes vistos por cada utilizador
     
titles = u_item(:,1);   % Fica apenas com a primeira coluna de 'u.item' (títulos dos filmes)

u_genres = cell2mat(u_item(:, 2:end));  % Colunas 2 a 20 do 'u_item'

disp ('1');

n_hash_table = 100;
minHash_table = minHash(userMovies, n_hash_table);   % matriz com os vetores MinHash de cada utilizador

disp('2');


% hash function dos títulos com shingles
n_titles = length(titles);
n_hash_titles = 200;    % estava a 100
minHash_titles = inf(n_titles, n_hash_titles);
n_shingle = 2;  % n sequências de caracteres na string data 
                % estava a 3
                % ver a != entre 2 a 5 shingles 

x = waitbar(0,'A calcular minHash()...');
for k = 1 : n_titles
    waitbar(k/n_titles,x);
    movie = titles{k};
    len = length(movie);
    for j = 1 : (len - n_shingle + 1)
        key = lower(char(movie(j:(j+n_shingle-1)))); 
        h = zeros(1, n_hash_titles);
        for i = 1 : n_hash_titles
            key = [key num2str(i)];
            h(i) = DJB31MA(key, 127);
        end
    minHash_titles(k, :) = min([minHash_titles(k, :); h]);
    end
end
delete(x);

% n_hash_titles = 100;
% n_shingle = 3;  % n = 3 //  sequência de n caracteres
% minHash_titles_table = minHash_titles(n_hash_titles, n_shingle);    % matriz com os vectores MinHash de cada título


disp('3');

% Guarda no ficheiro 'info.mat' toda a informação necessária para ser
% carregada no script 2 (app_script2)
save 'info.mat' u_item u userMovies titles u_genres n_hash_table minHash_table minHash_titles n_shingle n_hash_titles ; 

