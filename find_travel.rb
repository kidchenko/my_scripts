require_relative "skyscanner"

key = ""
sky = Skyscanner.new(key)
puts sky.flight_to_anywhere()