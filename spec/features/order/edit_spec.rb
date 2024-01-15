require 'rails_helper'

describe 'edit order' do
  before(:each) { create(:user, :confirmed) }
  before(:each) { create(:product) }
  # let!(:product) { create(:product ) }
  # before(:each) { create(:customer) }
  before(:each) { create(:order) }
  before(:each) { create(:item) }
  context 'succesfully' do
    it 'when set all atributtes' do
      binding.break
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Pedidos'
      sleep 3
      click_on 'Detalhes'
      click_on 'Editar'
      sleep 3
      fill_in 'Cliente', with: 'Wesley Machado dos Santos'
      sleep 3
      find("#order_product_ids_#{product.id}").set true
      sleep 3
      click_on 'Fechar Pedido'
      sleep 3

      expect(page).to have_content('Pedido confirmado com Sucesso')
      expect(page).to have_content('Wesley')
      expect(page).not_to have_content('Joãozinho')
    end    
  end

  context 'error' do
    it 'missing set customer' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Pedidos'
      sleep 3
      click_on 'Detalhes'
      sleep 3
      fill_in 'Cliente', with: ''
      sleep 3
      find("#order_product_ids_#{product.id}").set true
      sleep 3
      click_on 'Fechar Pedido'
      sleep 3

      expect(page).not_to have_content('Sucesso')
      expect(page).to have_content("can't be blank")
    end
  end
end