class User < ApplicationRecord
  include Rodauth::Rails.model
  enum :status, unverified: 1, verified: 2, closed: 3

  belongs_to :group, optional: true
  has_many :user_roles
  has_many :roles, through: :user_roles

  def able_to_edit?(model)
    roles.map(&:name).include?(model.to_s)
  end
end
