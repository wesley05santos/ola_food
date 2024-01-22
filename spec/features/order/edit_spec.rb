require 'rails_helper'

describe 'edit order' do
  before(:each) { create(:user, :confirmed) }
  before(:each) { create(:customer, :second_customer) }
  before(:each) { create(:order, :stand_alone) }
  context 'succesfully' do
    it 'when set all atributtes' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Pedidos'
      click_on 'Detalhes'
      click_on 'Editar'
      fill_in 'Cliente', with: 'Wesley Machado dos Santos'
      click_on 'Fechar Pedido'

      expect(page).to have_content('Pedido editado com Sucesso')
      expect(page).to have_content('Wesley')
      expect(page).not_to have_content('Joãozinho')
    end    
  end

  context 'error' do
    let(:product) { Product.first }
    it 'missing set customer' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Pedidos'
      click_on 'Detalhes'
      click_on 'Editar'
      fill_in 'Cliente', with: ''
      click_on 'Fechar Pedido'

      expect(page).not_to have_content('Sucesso')
      expect(page).to have_content("can't be blank")
    end

    xit 'missing set items' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'teste@olafood.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Log in'
      click_on 'Pedidos'
      click_on 'Detalhes'
      click_on 'Editar'
      fill_in 'Cliente', with: 'Wesley Machado dos Santos'
      find("#order_product_ids_#{product.id}").set false
      click_on 'Fechar Pedido'

      expect(page).not_to have_content('Sucesso')
      expect(page).to have_content("can't be blank")
    end
  end
end