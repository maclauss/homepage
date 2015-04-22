class IpAddress < ActiveRecord::Base
  has_many :connections, dependent: :destroy
  validates :ip_address, presence: true, length: { maximum: 15 },
                    uniqueness: { case_sensitive: true }
end
