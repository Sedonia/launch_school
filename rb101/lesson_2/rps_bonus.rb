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

def usable_play(input)
  if VALID_CHOICES.value?(input)
    VALID_CHOICES.key(input)
  else
    input
  end
end

def says_play_valid(input)
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

def says_method(hsh)
  method_of_defeat = MEANS.key(hsh)
  method_of_defeat.to_s
end

message = <<-WELCOME
Welcome to Rock, Paper, Scissors, Lizard, Spock!
    A twist on the classic game of rock, paper, scissors.
    You'll be playing against the computer.
    The first to reach three wins takes the title of <<GRAND WINNER>>!

=> Here are the rules:
    Scissors > Paper; Paper > Rock;
    Rock > Lizard; Lizard > Spock;
    Spock > Scissors; Scissors > Lizard;
    Lizard > Paper; Paper > Spock;
    Spock > Rock; Rock > Scissors

=> Example: You play Spock, the computer plays rock. You win because Spock vaporizes rock!

=> Easy peasy. Okay, let's PLAY!

WELCOME

system "clear"
prompt message

plyr_cntr = 0
cmp_cntr = 0

loop do
  answer = nil
  loop do
    prompt MESSAGES['play']
    answer = gets.chomp.downcase
    says_play_valid(answer)
    break if valid_play?(answer)
  end

  cmp_choice = VALID_CHOICES.keys.sample
  print MESSAGES['computer_pick']
  puts cmp_choice

  user_wins = [usable_play(answer), cmp_choice]
  comp_wins = [cmp_choice, usable_play(answer)]
  says_method(MEANS)

  if player_wins?(user_wins)
    plyr_cntr += 1
    prompt "#{usable_play(answer)} #{says_method(user_wins)} #{cmp_choice}"
    prompt MESSAGES['winning']
    prompt "That's #{plyr_cntr} to you and #{cmp_cntr} to the computer."
  elsif MEANS.value?(comp_wins)
    cmp_cntr += 1
    prompt "#{cmp_choice} #{says_method(comp_wins)} #{usable_play(answer)}"
    prompt MESSAGES['losing']
    prompt "That's #{cmp_cntr} to the computer and #{plyr_cntr} to you."
  else
    prompt MESSAGES['tie']
    prompt "Still #{plyr_cntr} to you and #{cmp_cntr} to the computer."
  end

  puts MESSAGES['space']

  if plyr_cntr == NUMBER_TO_WIN
    prompt MESSAGES['you_win']
    prompt MESSAGES['again?']
    replay = gets.chomp.downcase
    break unless replay.start_with?('y')
    plyr_cntr = 0
    cmp_cntr = 0
    system 'clear'
  elsif cmp_cntr == NUMBER_TO_WIN
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
