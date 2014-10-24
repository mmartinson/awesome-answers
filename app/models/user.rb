class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :nullify
  has_many :answers, dependent: :nullify


  def full_name
    if first_name || last_name
      "#{first_name.try(:capitalize)} #{last_name.try(:capitalize)}".strip.squeeze(" ")  #try is a rails method
    else
      email
    end
  end 
end

#script to associatre users with q&a
# q = Question.all
# q.each do |question|
