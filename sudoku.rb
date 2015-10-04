class Sudoku
  attr_reader :init
  attr_accessor :board

  def initialize(init)
    @init = init.freeze
    @board = init.map(&:dup)
  end

  def set!(r, c, n)
    if @init[r][c] == 0
      @board[r][c] = n
    end
  end

  def row(n)
    @board[n]
  end

  def col(n)
    c = []
    @board.each { |r|
      c << r[n]
    }
    c
  end

  def blk(r, c)
    b = []
    (0..2).each { |i|
      (0..2).each { |j|
        b << @board[i + r*3][j + c*3]
      }
    }
    b
  end

  def set_blk!(r, c, b)
    (0..2).each { |i|
      (0..2).each { |j|
        set!(i + r*3, j + c*3, b[i + j*3])
      }
    }
  end

  def check(sol)
    puts '+-------+-------+-------+'
    (0..2).each { |i|
      s = '| '
      (0..2).each { |j|
        if @board[i][j] != sol[i][j]
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (3..5).each { |j|
        if @board[i][j] != sol[i][j]
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (6..8).each { |j|
        if @board[i][j] != sol[i][j]
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      puts s + '|'
    }
    puts '+-------+-------+-------+'
    (3..5).each { |i|
      s = '| '
      (0..2).each { |j|
        if @board[i][j] != sol[i][j]
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (3..5).each { |j|
        if @board[i][j] != sol[i][j]
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (6..8).each { |j|
        if @board[i][j] != sol[i][j]
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      puts s + '|'
    }
    puts '+-------+-------+-------+'
    (6..8).each { |i|
      s = '| '
      (0..2).each { |j|
        if @board[i][j] != sol[i][j]
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (3..5).each { |j|
        if @board[i][j] != sol[i][j]
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (6..8).each { |j|
        if @board[i][j] != sol[i][j]
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      puts s + '|'
    }
    puts '+-------+-------+-------+'
  end

  def print
    puts '+-------+-------+-------+'
    (0..2).each { |i|
      s = '| '
      (0..2).each { |j|
        if @board[i][j] == 0
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (3..5).each { |j|
        if @board[i][j] == 0
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (6..8).each { |j|
        if @board[i][j] == 0
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      puts s + '|'
    }
    puts '+-------+-------+-------+'
    (3..5).each { |i|
      s = '| '
      (0..2).each { |j|
        if @board[i][j] == 0
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (3..5).each { |j|
        if @board[i][j] == 0
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (6..8).each { |j|
        if @board[i][j] == 0
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      puts s + '|'
    }
    puts '+-------+-------+-------+'
    (6..8).each { |i|
      s = '| '
      (0..2).each { |j|
        if @board[i][j] == 0
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (3..5).each { |j|
        if @board[i][j] == 0
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      s += '| '
      (6..8).each { |j|
        if @board[i][j] == 0
          s += '_ '
        else
          s += @board[i][j].to_s + ' '
        end
      }
      puts s + '|'
    }
    puts '+-------+-------+-------+'
  end
end

# ToDo write a better sudoku class