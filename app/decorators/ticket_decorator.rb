# frozen_string_literal: true

class TicketDecorator < Draper::Decorator
  delegate_all

  def digging_coordinates
    coordinates = object.digsite_info_text.scan(/(-?\d+\.\d+) (-?\d+\.\d+)/)
    coordinates.map { |coordinate| { longitude: coordinate[0], latitude: coordinate[1] } }
  end
end
