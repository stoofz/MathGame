require './player'
require './questions'

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
      if @player1.lives == 0
        break
      end
      player2_turn
      if @player2.lives == 0
        break
      end
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

  def winner
    if @player1.lives > @player2.lives
      puts("Player 1 wins with a score of #{player1.lives}/3")
    else
      puts("Player 2 wins with a score of #{player2.lives}/3")
    end
  end

  def game_over
    winner
    puts("----- GAME OVER -----")
    puts("Good bye!")
  end
end