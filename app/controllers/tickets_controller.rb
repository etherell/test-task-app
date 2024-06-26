# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id]).decorate
  end
end
