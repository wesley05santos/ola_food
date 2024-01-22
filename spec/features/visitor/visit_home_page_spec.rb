require 'rails_helper'

describe 'visitor' do
  context 'visit home page' do
    it 'succesfully' do
      visit '/'
      expect(page).to have_content('Olá')
    end
  end
end