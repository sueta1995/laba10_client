# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculatesController, type: :controller do
  describe 'various input' do
    it 'returns various output html' do
      get 'create', params: { numbers: '1 2 3 2 1 6 5', mode: 'html' }

      expect(response.content_type).to eq('text/html; charset=utf-8')
      expect(Nokogiri::HTML.parse(response.body).css('#result').text.gsub(/\r\n/, '').gsub(' ',
                                                                                           '')).to eq "\n1\n2\n3\n"
    end

    it 'returns variout output xml' do
      get 'create', params: { numbers: '5 4 2 1 6 8 1', mode: 'xml' }

      expect(response.content_type).to eq('application/xml; charset=utf-8')
      expect(Nokogiri::XML(response.body).xpath('//max-result')[0].text.gsub(/\r\n/, '').gsub(' ',
                                                                                              '')).to eq "\n1\n6\n8\n"
    end
  end
end
