fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
        'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octupus(fishes)
  # compare each fish to all other fishes. return it if no others are longer
  fishes.each do |fish1|
    biggest = true
    fishes.each do |fish2|
      biggest = false if fish2.length > fish1.length
    end
    return fish1 if biggest
  end
end

p sluggish_octupus(fishes)

def dominant_octopus(fishes)
  # use merge sort
  return fishes if fishes.length <= 1

  mid = fishes.length / 2
  merge(dominant_octopus(fishes.take(mid)),
        dominant_octopus(fishes.drop(mid)))
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when -1
      result << left.shift
    when 0
      result << left.shift << right.shift
    else
      result << right.shift
    end
  end
  result + left + right
end

p dominant_octopus(fishes).last

def clever_octopus(fishes)
  longest = fishes.first
  fishes.each { |fish| longest = fish if fish.length > longest.length }
  longest
end

p clever_octopus(fishes)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, array)
  array.each_with_index { |el, i| return i if el == dir }
  nil
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

tiles_hash = {"up" => 0,
              "right-up" => 1,
              "right" => 2,
              "right-down" => 3,
              "down" => 4,
              "left-down" => 5,
              "left" => 6,
              "left-up" => 7 }

def fast_dance(dir, new_tiles_data_structure)
  return new_tiles_data_structure[dir] if new_tiles_data_structure.key?(dir)
  nil
end

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)
