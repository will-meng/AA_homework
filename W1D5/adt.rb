class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each_with_index do |(k, _v), i|
      if k == key
        @map[i][1] = value
        return [key, value]
      end
    end
    @map << [key, value]
  end

  def lookup(key)
    @map.each { |k, v| return v if k == key }
    nil
  end

  def remove(key)
    @map.each_with_index do |(k, v), i|
      if k == key
        @map.delete_at(i)
        return v
      end
    end
    nil
  end

  def show
    @map.dup
  end
end
