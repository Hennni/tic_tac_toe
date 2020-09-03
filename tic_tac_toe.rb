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
  'DR' => 9
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
        if @@player_tracker.even? == false
          puts 'X, its your move'
        else
          puts 'O, its your move'
        end
        player_selection = gets.chomp.upcase
        if $position_hash.key?(player_selection) == false
          puts 'Enter valid move u knob'
        elsif @@player_tracker.even? == false
          change_board('X', player_selection)
        else
          change_board('O', player_selection)
        end
        @finished = true if finished?
      end
  end

  def finished?
    hori_arr1 = [@@arr1[1], @@arr1[5], @@arr1[9]]
    hori_arr2 = [@@arr2[1], @@arr2[5], @@arr2[9]]
    hori_arr3 = [@@arr3[1], @@arr3[5], @@arr3[9]]
    vert_arr1 = [@@arr1[1], @@arr2[1], @@arr3[1]]
    vert_arr2 = [@@arr1[5], @@arr2[5], @@arr3[5]]
    vert_arr3 = [@@arr1[9], @@arr2[9], @@arr3[9]]
    diag_arr1 = [@@arr1[1], @@arr2[5], @@arr3[9]]
    diag_arr2 = [@@arr1[9], @@arr2[5], @@arr3[1]]
    check_arr = [hori_arr1, hori_arr2, hori_arr3, vert_arr1, vert_arr2, vert_arr3, diag_arr1, diag_arr2]
    if check_arr.include?(%w[X X X])
      puts 'X player wins!!'
      return true
    elsif check_arr.include?(%w[O O O])
      puts 'O player wins!!!'
      return true
    else
      check_arr.each do |x|
        return false if x.include?(' ')
      end
      puts 'It\'s a draw!!'
      return true
    end
  end
end

PlayGame.new
