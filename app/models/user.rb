class User < ApplicationRecord
  include Rodauth::Rails.model
  enum :status, unverified: 1, verified: 2, closed: 3

  has_many :user_roles
  has_many :roles, through: :user_roles

  def able_to_edit?(model)
    case model
    when :schedule then roles.map(&:name).include?("schedule_compiler")
    else
      false
    end
  end
end
