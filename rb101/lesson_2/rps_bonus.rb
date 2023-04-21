require 'yaml'
MESSAGES = YAML.load_file('rps.yml')

VALID_CHOICES = %w(rock paper scissors lizard Spock)

WINNERS = { rock: ['lizard', 'scissors'], scissors: ['paper', 'lizard'],
            paper: ['rock', 'Spock'], lizard: ['Spock', 'paper'],
            Spock: ['scissors', 'rock'] }

MEANS = { cuts: ['scissors', 'paper'], covers: ['paper', 'rock'],
          squashes: ['rock', 'lizard'], poisons: ['lizard', 'Spock'],
          smashes: ['Spock', 'scissors'], decapitates: ['scissors', 'lizard'],
          eats: ['lizard', 'paper'], disproves: ['paper', 'Spock'],
          vaporizes: ['Spock', 'rock'], crushes: ['rock', 'scissors'] }

def prompt(message)
  puts "=> #{message}"
end

def valid_play?(user_input)
  WINNERS.include?(user_input.to_sym)
end

def player_wins?(play)
  MEANS.value?(play)
end

def computer_wins?(play)
  MEANS.value?(play)
end

def says_how_defeated(hsh)
  method_of_defeat = MEANS.key(hsh)
  method_of_defeat.to_s
end

message = <<-WELCOME
Welcome to Rock, Paper, Scissors, Lizard, Spock!
    A twist on the classic game of rock, paper, scissors.
    You'll be playing against the computer.
    The first to reach three wins takes the title of <<GRAND WINNER>>!

WELCOME

rules = <<-RULES
Here are the rules:
    Scissors > Paper; Paper > Rock;
    Rock > Lizard; Lizard > Spock;
    Spock > Scissors; Scissors > Lizard;
    Lizard > Paper; Paper > Spock;
    Spock > Rock; Rock > Scissors

Example: You play Spock, the computer plays rock. You win because Spock vaporizes rock!

Easy peasy. Okay, let's PLAY!

RULES

system "clear"
prompt message
prompt rules

plyr_cntr = 0
cmp_cntr = 0
answer = ''

loop do
  loop do
    prompt MESSAGES['play']
    answer = gets.chomp.downcase

    case answer
    when '1'
      answer = "rock"
    when '2'
      answer = 'paper'
    when '3'
      answer = 'scissors'
    when '4'
      answer = 'lizard'
    when '5'
      answer = 'Spock'
    else
      answer = 'wrong'
    end

    if valid_play?(answer)
      puts MESSAGES['player_pick'] + answer
      break
    else
      puts "Oops, that's not a valid entry."
    end
  end

  computer_choice = VALID_CHOICES.sample
  print MESSAGES['computer_pick']
  puts computer_choice

  user_wins = [answer, computer_choice]
  computer_wins = [computer_choice, answer]
  says_how_defeated(MEANS)

  if player_wins?(user_wins)
    plyr_cntr += 1
    prompt "#{answer} #{says_how_defeated(user_wins)} #{computer_choice}"
    prompt MESSAGES['winning']
    prompt "That's #{plyr_cntr} to you and #{cmp_cntr} to the computer."
  elsif MEANS.value?(computer_wins)
    cmp_cntr += 1
    prompt "#{computer_choice} #{says_how_defeated(computer_wins)} #{answer}"
    prompt MESSAGES['losing']
    prompt "That's #{cmp_cntr} to the computer and #{plyr_cntr} to you."
  else
    prompt MESSAGES['tie']
    prompt "Still #{plyr_cntr} to you and #{cmp_cntr} to the computer."
  end

  puts MESSAGES['space']

  if plyr_cntr == 3
    prompt MESSAGES['you_win']
    prompt MESSAGES['again?']
    replay = gets.chomp.downcase
    break unless replay.start_with?('y')
    plyr_cntr = 0
    cmp_cntr = 0
    system 'clear'
  elsif cmp_cntr == 3
    prompt MESSAGES['computer_wins']
    prompt MESSAGES['again?']
    replay = gets.chomp.downcase
    break unless replay.start_with?('y')
    plyr_cntr = 0
    cmp_cntr = 0
    system 'clear'
  end
end

puts MESSAGES['space']
prompt MESSAGES['thanks']
puts MESSAGES['space']
