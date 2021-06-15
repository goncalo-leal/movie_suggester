% function [minHash_titles] = minHash_titles( n_hash_titles, n_shingle)
% 
%     titles = load('info2.mat'); 
%     n_titles = length(titles);
%     minHash_titles = inf(n_titles, n_hash_titles);
% 
%     x = waitbar(0,'A calcular minHash()...');
%     for k = 1 : n_titles
%         waitbar(k/n_titles,x);
%         movie = titles{k};
%         len = length(movie);
%         for j = 1 : (len - n_shingle + 1)
%             key = lower(char(movie(j:(j+n_shingle-1)))); 
%             h = zeros(1, n_hash_titles);
%             for i = 1 : n_hash_titles
%                 key = [key num2str(i)];
%                 h(i) = DJB31MA(key, 127);
%             end
%         minHash_titles(k, :) = min([minHash_titles(k, :); h]);
%         end
%     end
%     delete(x);
% end