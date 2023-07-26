
class GenQuestion
  
  attr_reader :num1, :num2, :answer
  attr_writer :user_answer

  def initialize
    @num1 = rand(1...25)
    @num2 = rand(1...25)
    @answer = @num1 + @num2
    @user_answer = nil
  end

  def question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer
    if @user_answer == @answer
      true
    else
      false
    end
  end
end