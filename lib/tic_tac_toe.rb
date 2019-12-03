class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    number.to_i - 1
  end

  def move(position, marker)
    @board[position] = marker
  end

  def position_taken?(position)
    taken = false
    if @board[position] == " "
      taken = false
    else
      taken = true
    end
    taken
  end

  def valid_move?(position)
    valid = false
    if position_taken?(position) || !(position >= 0 && position <= 8)
      valid = false
    else
      valid = true
    end
    valid
  end

  def turn_count
      @board.count { |i| i == "X" || i == "O"}
  end

  def current_player
    player = ""
    if (turn_count.even?)
      player = "X"
    else
      player = "O"
    end
    player
  end

  def turn
    puts "enter 1-9"
    number = input_to_index(gets.strip)
    if valid_move?(number)
      move(number, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    won = false
    WIN_COMBINATIONS.each do |combo|
      if combo.all?("X")
        won = combo
      elsif combo[0] == "O" && combo[1] == "O" && combo[2] == "O"
        return combo
      end
    end
    won
  end

end
