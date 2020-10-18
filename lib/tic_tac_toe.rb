class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],
    [1,4,7],[2,5,8],[0,4,8],[6,4,2]
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

  def input_to_index(index)
    index.to_i - 1
  end

  def move(index,player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn 
    puts "enter position"
    user_input = gets.chomp
    user_input = input_to_index(user_input)
    if valid_move?(user_input)
      move(user_input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|turn| turn != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |combination|
      if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
        return combination
      end
    end
  end

  def full? 
    @board.all?{|element| element != " " } 
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    combination = won?
    if combination
      @board[combination[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end

