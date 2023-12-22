require 'rails_helper'

describe 'manage product' do
  context 'create' do 
    before(:each){ create(:user, :confirmed) }
    context 'succesfully' do 
      it 'when all atributes set' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Produtos'
        click_on 'Novo Produto'
        fill_in 'Código:', with: '55'
        fill_in 'Nome:', with: 'Coca Cola 2L'
        fill_in 'Preço:', with: '8.95'
        click_on 'Salvar'
              
        expect(page).to have_content('55')
        expect(page).to have_content('Coca')
        expect(page).not_to have_content('Novo Produto')
        expect(page).not_to have_content('Salvar')
      end
      
      it 'when price fill with ","' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Produtos'
        click_on 'Novo Produto'
        fill_in 'Código:', with: '55'
        fill_in 'Nome:', with: 'Coca Cola 2L'
        fill_in 'Preço:', with: '8,95'
        click_on 'Salvar'
              
        expect(page).to have_content('55')
        expect(page).to have_content('Coca')
        expect(page).to have_content(8.95)
        expect(page).not_to have_content('Novo Produto')
        expect(page).not_to have_content('Salvar')
      end
    end

    context 'error' do
      it 'when missing a code attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Produtos'
        click_on 'Novo Produto'
        # fill_in 'Código:', with: '55'
        fill_in 'Nome:', with: 'Coca Cola 2L'
        fill_in 'Preço:', with: '8.95'
        click_on 'Salvar'
        
        expect(page).not_to have_content('Novo Produto')
        expect(page).to have_content("can't be blank")
      end

      it 'when missing a name attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Produtos'
        click_on 'Novo Produto'
        fill_in 'Código:', with: '55'
        # fill_in 'Nome:', with: 'Coca Cola 2L'
        fill_in 'Preço:', with: '8.95'
        click_on 'Salvar'
        
        expect(page).not_to have_content('Novo Produto')
        expect(page).to have_content("can't be blank")
      end

      it 'when missing a price attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Produtos'
        click_on 'Novo Produto'
        fill_in 'Código:', with: '55'
        fill_in 'Nome:', with: 'Coca Cola 2L'
        # fill_in 'Preço:', with: '8.95'
        click_on 'Salvar'
        
        expect(page).not_to have_content('Novo Produto')
        expect(page).to have_content("can't be blank")
      end
    end
  end  
end