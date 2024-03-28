class Configuration < ApplicationRecord
  belongs_to :user, optional: true

  before_validation :validate_colors_not_empty

  def validate_colors_not_empty
    if colors.size.zero?
      errors.add(:colors, 'Não pode remover todas as cores!!!')
    end
  end
end
