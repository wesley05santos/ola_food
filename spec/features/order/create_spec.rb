require 'rails_helper'

describe 'create order' do
  before(:each) { create(:user, :confirmed ) }
  let!(:product) { create(:product ) }
  before(:each) { create(:customer ) }
  context 'succesfully' do
    it 'when set all atributtes' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Novo Pedido'
      fill_in 'Cliente', with: 'Joãozinho da Silva'
      find("#order_product_ids_#{product.id}").set true
      click_on 'Fechar Pedido'

      expect(page).to have_content('Pedido confirmado com Sucesso')
    end    
  end

  context 'error' do
    xit 'missing set products' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Novo Pedido'
      fill_in 'Cliente', with: 'Joãozinho da Silva'
      click_on 'Fechar Pedido'

      expect(page).not_to have_content('Sucesso')
      expect(page).to have_content("can't be blank")
    end

    it 'missing set customer' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Novo Pedido'
      find("#order_product_ids_#{product.id}").set true
      click_on 'Fechar Pedido'

      expect(page).not_to have_content('Sucesso')
      expect(page).to have_content("can't be blank")
    end 
  end
end

