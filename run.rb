require './sudoku.rb'
require './life.rb'


breed = lambda do |p|
  m = p[0].board
  n = p[1].board
  b = m.map(&:dup)
  (0..8).each { |i|
    (0..8).each { |j|
      if m[i][j] != n[i][j]
        if rand(2) == 0
          b[i][j] = m[i][j]
        else
          b[i][j] = n[i][j]
        end
      end
    }
  }
  baby = Sudoku.new(p[0].init)
  baby.board = b
  return baby
end

fit = lambda do |s|
  f = 0
  # check rows
  (0..8).each { |i|
    r = s.row(i)
    r.each { |x|
      n = r.count(x)
      f -= (n * (n + 1))/2
    }
  }
  # check columns
  (0..8).each { |i|
    c = s.col(i)
    c.each { |x|
      n = c.count(x)
      f -= (n * (n + 1))/2
    }
  }
  # check blocks
  (0..2).each { |i|
    (0..2).each { |j|
      b = s.blk(i, j)
      b.each { |x|
        n = b.count(x)
        f -= (n * (n + 1))/2
      }
    }
  }
  return f
end

l = Life.new(breed, fit)

m = [[0, 6, 0, 1, 0, 4, 0, 5, 0],
     [0, 0, 8, 3, 0, 5, 6, 0, 0],
     [2, 0, 0, 0, 0, 0, 0, 0, 1],
     [8, 0, 0, 4, 0, 7, 0, 0, 6],
     [0, 0, 6, 0, 0, 0, 3, 0, 0],
     [7, 0, 0, 9, 0, 1, 0, 0, 4],
     [5, 0, 0, 0, 0, 0, 0, 0, 2],
     [0, 0, 7, 2, 0, 6, 9, 0, 0],
     [0, 4, 0, 5, 0, 8, 0, 7, 0]].freeze

sol = [[9, 6, 3, 1, 7, 4, 2, 5, 8],
       [1, 7, 8, 3, 2, 5, 6, 4, 9],
       [2, 5, 4, 6, 8, 9, 7, 3, 1],
       [8, 2, 1, 4, 3, 7, 5, 9, 6],
       [4, 9, 6, 8, 5, 2, 3, 1, 7],
       [7, 3, 5, 9, 6, 1, 8, 2, 4],
       [5, 8, 9, 7, 1, 3, 4, 6, 2],
       [3, 1, 7, 2, 4, 6, 9, 8, 5],
       [6, 4, 2, 5, 9, 8, 1, 7, 3]].freeze

world = Array.new(1000) { Sudoku.new(m) }

world.each { |s|
  (0..2).each { |i|
    (0..2).each { |j|
      s.set_blk!(i, j, (1..9).to_a.shuffle!)
    }
  }
}

l.genesis(world)

l.generation(1000)

l.best.print
l.best.check(sol)