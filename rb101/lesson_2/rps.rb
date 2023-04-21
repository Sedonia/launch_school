VALID_CHOICES = %w(rock paper scissors)

def test_method
  puts "testing"
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "The computer won!"
  else
    prompt "It's a tie!"
  end
end

loop do
  choice = nil
  loop do
    prompt "Please choose one: #{VALID_CHOICES.join(', ')}"
    print "You pick: "
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "Oops! That's not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample
  puts "Computer picks: #{computer_choice}"

  display_results(choice, computer_choice)

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing! Bye now."
