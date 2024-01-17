require 'rails_helper'

describe 'manage product' do
  context 'edit' do 
    before(:each){ create(:user, :confirmed) }
    before(:each){ create(:product) }
    context 'succesfully' do 
      it 'when all atributes set' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Produtos'
        click_on 'Detalhes'
        click_on 'Editar'
        fill_in 'Código:', with: '11'
        fill_in 'Nome:', with: 'Refrigerante Grande'
        fill_in 'Preço:', with: '10.50'
        click_on 'Salvar'
              
        expect(page).to have_content('11')
        expect(page).to have_content('Refrigerante')
        expect(page).to have_content(10.50)
        expect(page).not_to have_content('Cola')
        expect(page).not_to have_content('Salvar')
      end
      
      it 'when price fill with ","' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Produtos'
        click_on 'Detalhes'
        click_on 'Editar'
        fill_in 'Código:', with: '11'
        fill_in 'Nome:', with: 'Refrigerante Grande'
        fill_in 'Preço:', with: '10,50'
        click_on 'Salvar'
              
        expect(page).to have_content('11')
        expect(page).to have_content('Refrigerante')
        expect(page).to have_content(10.50)
        expect(page).not_to have_content('Cola')
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
        click_on 'Detalhes'
        click_on 'Editar'
        fill_in 'Código:', with: ''
        fill_in 'Nome:', with: 'Refrigerante Grande'
        fill_in 'Preço:', with: '10.50'
        click_on 'Salvar'
        
        expect(page).to have_content("can't be blank")
      end

      it 'when missing a name attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Produtos'
        click_on 'Detalhes'
        click_on 'Editar'
        fill_in 'Código:', with: '11'
        fill_in 'Nome:', with: ''
        fill_in 'Preço:', with: '10.50'
        click_on 'Salvar'
        
        expect(page).to have_content("can't be blank")
      end

      it 'when missing a price attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Produtos'
        click_on 'Detalhes'
        click_on 'Editar'
        fill_in 'Código:', with: '11'
        fill_in 'Nome:', with: 'Refrigerante Grande'
        fill_in 'Preço:', with: ''
        click_on 'Salvar'
        
        expect(page).to have_content("can't be blank")
      end
    end
  end  
end