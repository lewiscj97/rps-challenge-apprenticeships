module GameLogic
  def self.player1_wins?(choice1, choice2)
    true if (
    choice1 == "Scissors" && choice2 == "Paper" ||
    choice1 == "Rock" && choice2 == "Scissors" ||
    choice1 == "Paper" && choice2 == "Rock"
  )
  end
  
  def self.draw?(choice1, choice2)
    choice1 == choice2
  end

  # def self.player1_wins_extended_game?(choice1, choice2)
end
