class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites, source: :user


  validates :body, presence: :true
end
