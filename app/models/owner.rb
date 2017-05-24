class Owner < ActiveRecord::Base
  # Adding secure password bcrypt stuff
  has_secure_password
  
  # TODO: add association to pets
  has_many :pets

  # TODO: add association to appointments (through pets)
  has_many :appointments, through: :pets

  # TODO: add validations
  # validates_associated :pets
  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
    # p self.phone
    # raise "nil phone number" if self.phone.nil?

    # self.phone.sub("1", "")
    # p self.phone
  end

end
