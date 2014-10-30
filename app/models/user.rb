class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :nullify
  has_many :answers, dependent: :nullify
  has_many :likes, dependent: :nullify
  has_many :liked_questions, through: :likes, source: :question
  has_many :favourites, dependent: :nullify 
  has_many :favourited_answers, through: :favourite, source: :answer


  def full_name
    if first_name || last_name
      "#{first_name.try(:capitalize)} #{last_name.try(:capitalize)}".strip.squeeze(" ")  #try is a rails method
    else
      email
    end
  end 
end

