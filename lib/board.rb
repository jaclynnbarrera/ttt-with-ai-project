require 'pry'

class Board

    attr_accessor :cells, :board

    def initialize
        self.cells = Array.new(9, " ")
    end

    # method can reset the state of the cells to what a board 
    # should look like at the start of a game, an array with 9 
    # " " elements.
    def reset!
        self.cells.clear
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(input)
        #1. takes in user's input in the form of 1-9 strings
        input = input.to_i - 1
        #2. looks up the value of the cells in corrext index    
        self.cells[input]
    end

    def full?
        self.cells.none? { |cell| cell  == " " }
    end

    # returns the amount of turns based on cell value
    def turn_count
        self.cells.find_all {|cells|cells == "X" || cells == "O"}.count
    end

     #return true or false for individual position
    def taken?(input)
        self.position(input) != " "
    end
    
    def valid_move?(input)
        true if input.to_i.between?(1,9) && !self.taken?(input)
    end

    def update(input, player)
        self.cells[(input.to_i)-1] = player.token if self.valid_move?(input)
    end
    
end
