require 'rails_helper'

describe 'products/new' do
  context 'create' do
    before(:each){ create(:user, :confirmed) }
    before(:each){ create(:product) }
    before(:each) do
      assign(:product, Product.first)
    end
    context 'succesfully' do
      it 'when all atributes set' do
        render
        # binding.break
        assert_select "label", 'Nome:'
        assert_select "input[name=?]", 'product[batata]'
        # assert_select "form p input[name='product[code]']", :text, ''
        # expect(rendered).to include('label')
      end
    end
  end
end
