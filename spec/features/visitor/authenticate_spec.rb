require 'rails_helper'

describe 'visitor' do
  context 'authenticate' do
    context 'registration' do
      context 'succesfully' do
        it 'has all attributes set' do
          visit '/'
          click_on 'Primeiro Acesso'
          fill_in 'Email', with: 'teste@olafood.com'
          fill_in 'Password', with: 'abc123' 
          fill_in 'Password confirmation', with: 'abc123'
          click_on 'Sign up'
          User.last.update(confirmed_at: DateTime.now)
          user = User.last
          login_as(user, scope: :user)
          visit '/'
          expect(page).to have_content('Olá, teste') 
          expect(page).not_to have_content('Primeiro Acesso') 
        end
      end
      context 'error' do
        it 'has email blank' do
          visit '/'
          click_on 'Primeiro Acesso'
          # fill_in 'Email', with: 'teste@ola_food.com'
          fill_in 'Password', with: 'abc123' 
          fill_in 'Password confirmation', with: 'abc123'
          click_on 'Sign up'
          expect(page).not_to have_content('Olá') 
          expect(page).to have_content('Primeiro Acesso') 
          expect(page).to have_content('can\'t be blank') 
        end
        it 'has password shorter than six chars' do
          visit '/'
          click_on 'Primeiro Acesso'
          fill_in 'Email', with: 'teste@olafood.com'
          fill_in 'Password', with: 'abc' 
          fill_in 'Password confirmation', with: 'abc'
          click_on 'Sign up'
          expect(page).not_to have_content('Olá') 
          expect(page).to have_content('Primeiro Acesso') 
          expect(page).to have_content('6') 
        end
        it 'invalid domain' do
          visit '/'
          click_on 'Primeiro Acesso'
          fill_in 'Email', with: 'teste@teste.com'
          fill_in 'Password', with: 'abc123' 
          fill_in 'Password confirmation', with: 'abc123'
          click_on 'Sign up'
          expect(page).not_to have_content('Olá, teste') 
          expect(page).to have_content('Primeiro Acesso') 
        end
      end
    end

    context 'login' do
      before(:each){ create(:user, :confirmed) }
      context 'succesfully' do
        it 'has all attributes set' do
          visit '/'
          click_on 'Login'
          fill_in 'Email', with: 'teste@olafood.com'
          fill_in 'Password', with: 'abc123'
          click_button 'Log in'
          expect(page).to have_content('Olá, teste') 
          expect(page).to have_content('Sair') 
          expect(page).not_to have_content('Primeiro Acesso')
        end
      end
      context 'error' do
        it 'has email blank' do
          visit '/'
          click_on 'Login'
          # fill_in 'Email', with: 'teste@ola_food.com'
          fill_in 'Password', with: 'abc123' 
          click_on 'Log in'
          expect(page).not_to have_content('Sair') 
          expect(page).to have_content('Primeiro Acesso') 
          expect(page).to have_content('Invalid Email or password')
        end
        it 'has password blank' do
          visit '/'
          click_on 'Login'
          fill_in 'Email', with: 'teste@ola_food.com'
          # fill_in 'Password', with: 'abc123' 
          click_on 'Log in'
          expect(page).not_to have_content('Sair') 
          expect(page).to have_content('Primeiro Acesso') 
          expect(page).to have_content('Invalid Email or password')
        end
      end
    end
  end
end