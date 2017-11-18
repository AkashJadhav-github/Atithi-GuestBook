class Receptionist < ApplicationRecord
  has_secure_password
  has_many :guests

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/;

  validates :name, :email_id, presence:true
  #validates :my_email_attribute, email: true
  validates :email_id, format: {with: VALID_EMAIL_REGEX, uniqueness: {:case_sensitive => false}, message: "Eg - example@xyz.com"}
  #validates :mobile_no, :numericality => {:only_integer => true}
  validates :name, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, uniqueness: {:case_sensitive => false}, message: "only allows alphabets"}#/\A[a-zA-Z]+\z/
  validates :email_id, uniqueness: true

end
