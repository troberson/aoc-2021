% Advent of Code - Day 4a
% Tamara Roberson
% December 19, 2021

function score = process_cards(calls, cards)
    winner = false;
    for call = calls'
        for card_idx = 1:size(cards, 2)
            [r, c] = find(cards{card_idx} == call);
            if isempty(r)
                continue
            end

            % Mark called numbers as -1
            cards{card_idx}(r,c) = -1;

            % Check rows and columns of the marked number for winner
            if all(cards{card_idx}(r,:) == -1) || ...
               all(cards{card_idx}(:,c) == -1)
                winner = true; % assume no ties, first card wins
                break
            end
        end % card_idx
        if winner
            break
        end
    end % call

    % Score: Sum all unmarked numbers and multiply by the current call
    cards{card_idx}(cards{card_idx} == -1) = 0;
    score = call * sum(cards{card_idx}, 'all');
end
