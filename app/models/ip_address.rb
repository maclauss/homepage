class IpAddress < ActiveRecord::Base
  has_many :connections, dependent: :destroy
end
