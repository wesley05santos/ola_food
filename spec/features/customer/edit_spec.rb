require 'rails_helper'

describe 'manage customer' do
  context 'edit' do 
    before(:each){ create(:user, :confirmed) }
    before(:each){ create(:customer) }
    context 'succesfully' do 
      it 'when all atributes set' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Clientes'
        click_on 'Detalhes'
        click_on 'Editar'
        fill_in 'Telefone:', with: '(16) 98203-9090'
        fill_in 'Nome:', with: 'Wesley M. Santos Silva'
        fill_in 'Endereço:', with: 'Rua das Flores'
        fill_in 'Número:', with: '555'
        fill_in 'Bairro:', with: 'Bairro Norte'
        click_on 'Salvar'
              
        expect(page).to have_content('Silva')
        expect(page).to have_content('Flores')
        expect(page).to have_content('Norte')
        expect(page).not_to have_content('Novo Cliente')
        expect(page).not_to have_content('Salvar')
      end
    end

    context 'error' do
      it 'when missing a phone attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Clientes'
        click_on 'Detalhes'
        click_on 'Editar'
        fill_in 'Telefone:', with: ''
        fill_in 'Nome:', with: 'Wesley M. Santos Silva'
        fill_in 'Endereço:', with: 'Rua das Flores'
        fill_in 'Número:', with: '555'
        fill_in 'Bairro:', with: 'Bairro Norte'
        click_on 'Salvar'
        
        expect(page).to have_content("can't be blank")
      end

      it 'when missing a name attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Clientes'
        click_on 'Detalhes'
        click_on 'Editar'
        fill_in 'Telefone:', with: '(16) 98203-9090'
        fill_in 'Nome:', with: ''
        fill_in 'Endereço:', with: 'Rua das Flores'
        fill_in 'Número:', with: '555'
        fill_in 'Bairro:', with: 'Bairro Norte'
        click_on 'Salvar'
        
        expect(page).to have_content("can't be blank")
      end

      it 'when missing a address attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Clientes'
        click_on 'Detalhes'
        click_on 'Editar'
        fill_in 'Telefone:', with: '(16) 98203-9090'
        fill_in 'Nome:', with: 'Wesley M. Santos Silva'
        fill_in 'Endereço:', with: ''
        fill_in 'Número:', with: '555'
        fill_in 'Bairro:', with: 'Bairro Norte'
        click_on 'Salvar'
        
        expect(page).to have_content("can't be blank")
      end
    end
  end  
end