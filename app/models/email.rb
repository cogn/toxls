class Email < ActiveRecord::Base
  attr_accessible :email, :user_id
  belongs_to :emp

  def email_name
  	self.email
  end
end
