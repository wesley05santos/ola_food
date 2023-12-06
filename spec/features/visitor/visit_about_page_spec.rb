require 'rails_helper'

describe 'visitor' do
  context 'visit about page' do
    it 'succesfully' do
      visit '/'
      click_on 'Sobre'
      expect(page).to have_content('Detalhes do funcionamento')
    end
  end
end