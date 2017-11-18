class Guest < ApplicationRecord
	belongs_to :receptionist

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/;
	VALID_MOBILE_FIELD = /\d[1-9][0-9]\)*\z/;

	validates :name, :email_id, presence:true
	validates :email_id, format: {with: VALID_EMAIL_REGEX, uniqueness: {:case_sensitive => false}, message: "Eg - example@xyz.com"}
	validates :mobile_no, :numericality => {:only_integer => true}, :length => { :minimum => 10, :maximum => 10 }, format: {with: VALID_MOBILE_FIELD}
	validates_length_of :mobile_no, :minimum => 10, :maximum => 10, :allow_blank => false
	validates :name, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, uniqueness: {:case_sensitive => false}, message: "only allows alphabets"}#/\A[a-zA-Z]+\z/

end
