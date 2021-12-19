% Advent of Code - Day 4b
% Tamara Roberson
% December 19, 2021

function score = process_cards(calls, cards)
    for call = calls'
        for card_idx = 1:size(cards, 2)
            [r, c] = find(cards{card_idx} == call);
            if isempty(r)
                continue
            end

            % Mark called numbers as -1
            cards{card_idx}(r,c) = -1;

            % Check rows and columns of the marked number for winner
            % Record the winning card and the call and remove it from
            % the list of cards to check.
            if all(cards{card_idx}(r,:) == -1) || ...
               all(cards{card_idx}(:,c) == -1)
                winning_card = cards{card_idx};
                winning_call = call;
                cards{card_idx} = [];
            end
        end % card_idx
    end % call

    % Score: Sum all unmarked numbers and multiply by the current call
    winning_card(winning_card == -1) = 0;
    score = winning_call * sum(winning_card, 'all');
end
