require 'rails_helper'

describe 'manage customer' do
  before(:each){ create(:user, :confirmed) }
  before(:each){ create(:customer) }
  context 'delete' do
    it 'succesfully' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_on 'Log in'
      click_on 'Clientes'
      click_on 'Detalhes'
      click_on 'Apagar'

      expect(page).to have_content('Deletado com Sucesso')      
    end
  end
end