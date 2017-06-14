class Address < ApplicationRecord
  belongs_to :user
  validates :state, presence: true, if: :us?
  validates :country, inclusion: { in: %w(co us)}

  def us?
    country == 'us'
  end
end
