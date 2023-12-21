class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validate :validate_domain  

  private

  def validate_domain
    return if Mail::Address.new(email).domain == 'olafood.com'

    errors.add(:email, ' - Somente dominios de @olafood.com podem se cadastrar')
  end
end
