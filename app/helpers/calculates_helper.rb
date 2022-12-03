# frozen_string_literal: true

# helper for calculating controller
module CalculatesHelper
  SERVER_URL = 'http://127.0.0.1:3000/calculates/create.xml'
  XSLT_PATH = 'public/output.xslt'

  def set_numbers
    @numbers = params[:numbers].split(' ')
  end

  def valid?(array)
    result = true if array.any?

    array.each { |x| result = false if x.scan(/[-0-9]/).length != x.length }

    result
  end

  def proccessing
    case params[:mode]
    when 'xml'
      render xml: @xml_response
    when 'html'
      render inline: xml_transform
    end
  end

  def xml_transform
    xslt = Nokogiri::XSLT(File.read(XSLT_PATH))

    xslt.transform(@xml_response)
  end
end
