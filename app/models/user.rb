class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  def full_name
    if first_name || last_name
      "#{first_name.try(:capitalize)} #{last_name.try(:capitalize)}".strip.squeeze(" ")
    else
      email
    end
  end 
end
