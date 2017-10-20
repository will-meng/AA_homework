class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  has_many :drivers,
    through: :buses,
    source: :drivers

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    all_drivers = Hash.new { |h, k| h[k] = [] }
    drivers.each { |driver| all_drivers[driver.bus_id] << driver.name }
    all_drivers
  end
end
