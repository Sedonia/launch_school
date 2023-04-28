require 'yaml'
MESSAGES = YAML.load_file('rps.yml')

VALID_CHOICES = { 'rock' => 'r', 'paper' => 'p', 'scissors' => 'sc',
                  'lizard' => 'l', 'spock' => 'sp' }

MEANS = { cuts: ['scissors', 'paper'], covers: ['paper', 'rock'],
          squashes: ['rock', 'lizard'], poisons: ['lizard', 'spock'],
          smashes: ['spock', 'scissors'], decapitates: ['scissors', 'lizard'],
          eats: ['lizard', 'paper'], disproves: ['paper', 'spock'],
          vaporizes: ['spock', 'rock'], crushes: ['rock', 'scissors'] }

NUMBER_TO_WIN = 3

def prompt(message)
  puts "=> #{message}"
end

def valid_play?(user_input)
  VALID_CHOICES.value?(user_input) || VALID_CHOICES.key?(user_input)
end

def prints_play(input)
  if VALID_CHOICES.value?(input)
    puts VALID_CHOICES.key(input)
  else
    puts input
  end
end

def format_play(input)
  if VALID_CHOICES.value?(input)
    VALID_CHOICES.key(input)
  else
    input
  end
end

def prints_player_choice(input)
  if valid_play?(input)
    print MESSAGES['player_pick']
    prints_play(input)
  else
    puts MESSAGES['invalid_entry']
  end
end

def player_wins?(play)
  MEANS.value?(play)
end

def decide_method(hsh)
  method_of_defeat = MEANS.key(hsh)
  method_of_defeat.to_s
end

def prints_win_message(input, player, computer)
  prompt "#{format_play(input)} #{decide_method(player)} #{computer}"
  prompt MESSAGES['winning']
end

def prints_lose_message(input, computer, player)
  prompt "#{input} #{decide_method(computer)} #{format_play(player)}"
  prompt MESSAGES['losing']
end

def prints_count(player, computer)
  prompt "That's #{player} to you and #{computer} to the computer."
end

def play_again?
  prompt MESSAGES['again?']
  replay = gets.chomp.downcase
  replay.start_with?('y')
end

def clear_board
  system "clear"
end

def clear_score
  counter1 = 0 
  counter2 = 0
  [counter1, counter2]
end

clear_board
prompt MESSAGES['welcome']

player_counter = 0
computer_counter = 0

loop do
  answer = nil
  loop do
    prompt MESSAGES['play']
    answer = gets.chomp.downcase
    prints_player_choice(answer)
    break if valid_play?(answer)
  end

  comp_choice = VALID_CHOICES.keys.sample
  print MESSAGES['computer_pick']
  puts comp_choice

  user_wins = [format_play(answer), comp_choice]
  comp_wins = [comp_choice, format_play(answer)]

  if player_wins?(user_wins)
    player_counter += 1
    clear_board
    prints_win_message(answer, user_wins, comp_choice)
  elsif MEANS.value?(comp_wins)
    computer_counter += 1
    clear_board
    prints_lose_message(comp_choice, comp_wins, answer)
  else
    clear_board
    prompt MESSAGES['tie']
  end

  prints_count(player_counter, computer_counter)
  puts MESSAGES['space']

  if player_counter == NUMBER_TO_WIN
    prompt MESSAGES['you_win']
    player_counter, computer_counter = clear_score # multiple assignment used here
    break unless play_again?
  elsif computer_counter == NUMBER_TO_WIN
    prompt MESSAGES['computer_wins']
    player_counter, computer_counter = clear_score # and here
    break unless play_again?
  end
end

puts MESSAGES['space']
prompt MESSAGES['thanks']
puts MESSAGES['space']
