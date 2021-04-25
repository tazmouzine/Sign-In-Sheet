# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @book_entry = BookEntry.new
  end
end
