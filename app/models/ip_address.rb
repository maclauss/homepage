class IpAddress < ActiveRecord::Base
  has_many :connections, dependent: :destroy
  validates :ip_address, presence: true, length: { minimum: 7,maximum: 15 },
                    uniqueness: { case_sensitive: true }
end
