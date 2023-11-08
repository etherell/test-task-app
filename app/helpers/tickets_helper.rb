# frozen_string_literal: true

module TicketsHelper
  def map_coordinates(ticket)
    coordinates = ticket.designite_info_text.scan(/(-?\d+\.\d+) (-?\d+\.\d+)/)
    coordinates.map { |coordinate| { longitude: coordinate[0], latitude: coordinate[1] } }
  end
end
