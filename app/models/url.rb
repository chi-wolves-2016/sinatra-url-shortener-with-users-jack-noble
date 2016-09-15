class Url < ActiveRecord::Base
  belongs_to :creator, class_name: :User

  validates_presence_of :long_url, :short_url
  validates :long_url, format: { with: /\Ahttps?/, message: "A URL must begin with http:// or https://" }
  validates :short_url, uniqueness: true

  before_save :create_short_url

  def create_short_url
    self.short_url = SecureRandom.hex(4)
  end
end
