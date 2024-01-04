require 'rails_helper'

describe 'manage order' do
  before(:each) { create(:user, :confirmed ) }
  before(:each) { create(:product ) }
  before(:each) { create(:costumer ) }
  context 'succesfully' do
    it 'when set all atributtes' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Novo Pedido'
      fill_in 'Telefone', with: '16982039595'
      click_on 'Adicionar Item'
      fill_in 'Buscar', with: 'coca cola'
      click_on 'Adicionar'
      click_on 'Fechar Pedido'

      expect(page).to have_content('Pedido confirmado com Sucesso')
    end    
  end
end