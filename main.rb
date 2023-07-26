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


class StartGame

  attr_reader :player1, :player2, :question
  attr_writer :player1, :player2, :question

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @question = GenQuestion.new
  end

  def start
    puts("Math Game!")
    while @player1.lives > 0 && @player2.lives > 0
      player1_turn
      player2_turn
    end
    game_over
  end


  def player1_turn
    puts("----- NEW TURN -----")
    question = GenQuestion.new
    puts("Player 1: " + question.question)
    question.user_answer = gets.chomp.to_i
    if question.check_answer
      puts("P1: #{player1.lives}/3 vs P2: #{player2.lives}/3.")
    else
      player1.lose_life
      puts("P1: #{player1.lives}/3 vs P2: #{player2.lives}/3.")
    end
  end


  def player2_turn
    puts("----- NEW TURN -----")
    question = GenQuestion.new
    puts("Player 2: " + question.question)
    question.user_answer = gets.chomp.to_i
    if question.check_answer
      puts("P1: #{player1.lives}/3 vs P2: #{player2.lives}/3.")
    else
      player2.lose_life
      puts("P1: #{player1.lives}/3 vs P2: #{player2.lives}/3.")
    end
  end


  def game_over
    puts("----- GAME OVER -----")
    puts("Good bye!")
  end
end

StartGame.new.start()
