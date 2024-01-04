require 'rails_helper'

describe 'manage order' do
  before(:each) { create(:user, :confirmed ) }
  before(:each) { create(:product ) }
  before(:each) { create(:customer ) }
  context 'succesfully' do
    it 'when set all atributtes' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Novo Pedido'
      fill_in 'Buscar Cliente', with: 'wesley'
      click_on 'Confirmar'
      page.check('Sukita Laranja 2L')
      click_on 'Fechar Pedido'

      expect(page).to have_content('Pedido confirmado com Sucesso')
    end    
  end
end