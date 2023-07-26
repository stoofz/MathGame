require './player'
require './questions'

class StartGame

  attr_reader :player1, :player2, :question
  attr_writer :player1, :player2, :question

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @question = GenQuestion.new
    @player_array = player_array
    @player_turn = 0
  end

  def start
    puts("Math Game!")
    while @player1.lives > 0 && @player2.lives > 0
      player_turn
      if @player1.lives == 0
        break
      end
      player_turn
      if @player2.lives == 0
        break
      end
    end
    game_over
  end

  def player_array
    @player_turn = 0
    @player_array = [@player1, @player2]
  end

  def player_turn
    puts("----- NEW TURN -----")
    question = GenQuestion.new
    puts("#{@player_array[@player_turn].name}: #{question.question}")
    question.user_answer = gets.chomp.to_i
    if question.check_answer
      puts("YES, You are Correct.")
      puts("P1: #{player1.lives}/3 vs P2: #{player2.lives}/3")
    else
      @player_array[@player_turn].lose_life
      puts("Seriously? No!")
      puts("P1: #{player1.lives}/3 vs P2: #{player2.lives}/3")
    end
    if @player_turn == 0
      @player_turn = 1
    else
      @player_turn = 0
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