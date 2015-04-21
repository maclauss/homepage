class Connection < ActiveRecord::Base
  belongs_to :user
  belongs_to :ip_address
  default_scope -> { order(created_at: :desc) }
end
