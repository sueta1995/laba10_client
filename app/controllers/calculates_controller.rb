class CalculatesController < ApplicationController
  before_action :set_numbers, only: %i[ create ]
  
  include CalculatesHelper
  
  def new
  end

  def create
    if valid?(@numbers)
      @xml_response = Nokogiri::XML(URI.open("#{SERVER_URL}?numbers=#{params[:numbers]}"))

      proccessing
    else
      flash.now[:alert] = 'Введены не верные значения!'

      render :new
    end
  end
end
