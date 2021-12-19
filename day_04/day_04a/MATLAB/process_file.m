% Advent of Code - Day 4a
% Tamara Roberson
% December 19, 2021

function score = process_file(fname)
    assert(~isempty(fname), 'Filename cannot be blank.');

    file_text = fileread(fname);
    assert(~isempty(file_text), 'Unable to read file.');

    data_cells = strsplit(file_text, {'\r', '\n'});

    % Extract Bingo calls
    calls = textscan(data_cells{1}, '%f', 'Delimiter', ',');
    calls = calls{1};

    % Get first Bingo card line to determine size
    line = textscan(data_cells{2}, '%f');
    card_size = length(line{1});

    % Bingo card matrices
    num_cards = length(data_cells(2:end-1))/card_size;
    cards = cell(1, num_cards);

    % Get remainder of cards
    card_num = 1;
    line_num = 1;
    for idx = 2:length(data_cells)
        line = data_cells{idx};

        % The last line will be empty
        if isempty(line)
            break
        end

        line = textscan(data_cells{idx}, '%f');
        cards{card_num}(line_num, :) = line{1}';

        % Advance to next line or card
        if (mod(idx-1, card_size) == 0)
            card_num = card_num + 1;
            line_num = 1;
        else
            line_num = line_num + 1;
        end
    end

    score = process_cards(calls, cards);
end
