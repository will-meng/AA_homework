# Notice the redundant implementations of moo/bark/meow.
module Wet
  class Animal
  end

  class Cow < Animal
    def moo
      puts "moo!"
    end
  end

  class Dog < Animal
    def bark
      puts "bark!"
    end
  end

  class Cat < Animal
    def meow
      puts "meow!"
    end
  end
end

# Let's DRY it up!
module Dry
  class Animal
    private
    # define a `makes_noise` class method; a method that defines other
    # methods is called a *macro*
    def self.makes_noise(name)
      # When an Animal subclass calls `makes_noise`, we will
      # *dynamically* define a new method on the
      # subclass. `Class#define_method` is an instance method of the
      # `Class` class.
      define_method(name) do
        puts "#{name}!"
      end

      nil
    end
  end

  class Cow < Animal
    makes_noise :moo
  end

  class Dog < Animal
    makes_noise :bark
  end

  class Cat < Animal
    makes_noise :meow
  end
end
# 
# class Object
#
#   private
#
#   def self.attr_reader(ivar_name)
#     ivar = "@#{ivar_name}".to_sym
#     define_method(ivar_name) do
#       instance_variable_get(ivar)
#     end
#   end
#
#   def self.attr_accessor(ivar_name)
#     define_method("#{ivar_name}=") do |value|
#       instance_variable_set(ivar, value)
#     end
#   end
# end
