class Life
  attr_reader :breed, :fit, :gen, :world

  def initialize(breed, fit)
    @breed = breed
    @fit = fit
    @gen = 0
    @world = []
  end

  def genesis(world)
    @world = world
  end

  def generation(num=1)
    num.times do
      population_control
      regenerate
      @gen += 1
    end
  end

  def regenerate
    @world.count.times do
      parents = @world.sample(2)
      baby = @breed.call(parents)
      @world += [baby]
    end
  end

  def population_control
    @world.sort_by! { |x| @fit.call(x) }.reverse!
    @world = @world.take(@world.count/2)
  end

  def best
    @world.sort_by { |x| @fit.call(x) }.reverse[0]
  end
end

