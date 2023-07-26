class Player
  
  attr_reader :name, :lives
  attr_writer :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

end

class GenQuestion
  
  attr_reader :num1, :num2, :answer
  attr_writer :user_answer

  def initialize
    @num1 = rand(1...9)
    @num2 = rand(1...9)
    @answer = @num1 + @num2
    @user_answer = nil
  end

  def question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer
    if @user_answer == @answer
      puts("YES, You are Correct.")
      true
    else
      puts("Seriously? No!")
      false
    end
  end
end

puts("Welcome to the Math Game!")

puts("Player 1, please enter your name:")
player1 = Player.new(gets.chomp)
puts player1.name

puts("Player 2, please enter your name:")
player2 = Player.new(gets.chomp)
puts player2.name

puts("Let's begin!")

question = GenQuestion.new
puts("Player 1, please answer the following question:")

puts("What does #{question.num1} plus #{question.num2} equal?")
question.user_answer = gets.chomp.to_i

if question.check_answer
  puts("P2: #{player1.lives}/3.")
else
  player1.lose_life
  puts("P1: #{player1.lives}/3.")
end


