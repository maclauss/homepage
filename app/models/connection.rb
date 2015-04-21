class Connection < ActiveRecord::Base
  belongs_to :user
  belongs_to :ip_address
  default_scope -> { order(updated_at: :desc) }
end
