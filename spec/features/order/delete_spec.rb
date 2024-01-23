require 'rails_helper'

describe 'delete order' do
  before(:each) { create(:user, :confirmed) }
  before(:each) { create(:customer, :second_customer) }
  before(:each) { create(:order, :stand_alone) }
  context 'succesfully' do
    it '#destroy' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Pedidos'
      click_on 'Detalhes'
      click_on 'Apagar'

      expect(page).to have_content('Pedido deletado com Sucesso')
      expect(page).not_to have_content('Fechar Pedido')
    end    
  end
end