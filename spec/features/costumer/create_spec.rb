require 'rails_helper'

describe 'manage costumer' do
  context 'create' do 
    before(:each){ create(:user, :confirmed) }
    context 'succesfully' do 
      it 'when all atributes set' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Clientes'
        click_on 'Novo Cliente'
        fill_in 'Telefone:', with: '(16) 98203-9595'
        fill_in 'Nome:', with: 'Wesley M. Santos'
        fill_in 'Endereço:', with: 'Rua 2'
        fill_in 'Número:', with: '86'
        fill_in 'Bairro:', with: 'Jardim Testando'
        click_on 'Salvar'
              
        expect(page).to have_content('Wesley')
        expect(page).to have_content('98203-9595')
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
        click_on 'Novo Cliente'
        # fill_in 'Telefone:', with: '(16) 98203-9595'
        fill_in 'Nome:', with: 'Wesley M. Santos'
        fill_in 'Endereço:', with: 'Rua 2'
        fill_in 'Número:', with: '86'
        fill_in 'Bairro:', with: 'Jardim Testando'
        click_on 'Salvar'
        
        expect(page).not_to have_content('Novo Cliente')
        expect(page).to have_content("can't be blank")
      end

      it 'when missing a name attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Clientes'
        click_on 'Novo Cliente'
        fill_in 'Telefone:', with: '(16) 98203-9595'
        # fill_in 'Nome:', with: 'Wesley M. Santos'
        fill_in 'Endereço:', with: 'Rua 2'
        fill_in 'Número:', with: '86'
        fill_in 'Bairro:', with: 'Jardim Testando'
        click_on 'Salvar'
        
        expect(page).not_to have_content('Novo Cliente')
        expect(page).to have_content("can't be blank")
      end

      it 'when missing a address attribute' do
        visit '/'
        click_on 'Login'
        fill_in 'Email', with: 'teste@olafood.com'
        fill_in 'Password', with: 'abc123'
        click_button 'Log in'
        click_on 'Clientes'
        click_on 'Novo Cliente'
        fill_in 'Telefone:', with: '(16) 98203-9595'
        fill_in 'Nome:', with: 'Wesley M. Santos'
        # fill_in 'Endereço:', with: 'Rua 2'
        # fill_in 'Número:', with: '86'
        # fill_in 'Bairro:', with: 'Jardim Testando'
        click_on 'Salvar'
        
        expect(page).not_to have_content('Novo Cliente')
        expect(page).to have_content("can't be blank")
      end
    end
  end  
end