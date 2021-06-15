% --> A função obtém o conjunto dos ID´s dos filmes, isto é, a quantidade de
%   filmes vistos por cada utilizador.

% u - duas primeiras colunas do ficheiro u.data (ID utilizador + ID filme)
function [Set] = getUserMovies(u)

    % Lista de utilizadores
    users = unique(u(:,1));         % Extrai os IDs dos utilizadores
    Nu = length(users);             % Número de utilizadores

    % Constrói a lista de filmes para cada utilizador
    Set = cell(Nu,1);    
    for n = 1 : Nu % Para cada utilizador
        % Obtém os filmes de cada um
        ind = find(u(:,1) == users(n));
        % E guarda num array. Usa células porque utilizador tem um número
        % diferente de filmes. Se fossem iguais podia ser um array
        Set{n} = [Set{n} u(ind,2)];
    end
end

