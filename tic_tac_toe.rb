# frozen_string_literal: true

$position_hash = { 
    'UL' => 1,
    'UM' => 5,
    'UR' => 9,
    'ML' => 1,
    'MM' => 5,
    'MR' => 9,
    'DL' => 1,
    'DM' => 5,
    'DR' => 9,
}
# This creates the board
class Board
  @@arr1 = ['_', ' ', '_', '|', '_', ' ', '_', '|', '_', ' ', '_']
  @@arr2 = ['_', ' ', '_', '|', '_', ' ', '_', '|', '_', ' ', '_']
  @@arr3 = [' ', ' ', ' ', '|', ' ', ' ', ' ', '|', ' ', ' ', ' ']
  @@player_tracker = 1

  def self.draw_board
    @@arr1.each { |value| print value }
    puts
    @@arr2.each { |value| print value }
    puts
    @@arr3.each { |value| print value }
    nil
  end

  def change_board(piece, position)
    @@arr1[$position_hash.fetch(position)] = piece if position[0, 1] == 'U'

    @@arr2[$position_hash.fetch(position)] = piece if position[0, 1] == 'M'

    @@arr3[$position_hash.fetch(position)] = piece if position[0, 1] == 'D'

    @@player_tracker += 1

    puts Board.draw_board
  end
end

class PlayGame < Board
  def initialize
    @finished = false
      while @finished == false
        player_selection = gets.chomp
        if @@player_tracker.even? == false
          change_board('X', player_selection)
        else
          change_board('O', player_selection)
        end
        @finished = true
      end
  end
end

PlayGame.new