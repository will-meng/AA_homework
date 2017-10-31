module Toyable
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    # Toy.find_or_create_by(name: name,
    #                       toyable_type: self.class.to_s,
    #                       toyable_id: id)
    self.toys.find_or_create_by(name: name)
  end
end
