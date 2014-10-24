class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy  #could be :nullify instead of destroy
  belongs_to :user
  belongs_to :category
  validates :title, presence: true, uniqueness: {case_sensitive: false}    #can also pass => presence: {"message" => "title must be provided"} 
  validates :view_count, numericality: true    #can also pass numericality: {greater_than_or_equal_to: 0}
  # validates :title_is_longer_than_one_character

  #can call model.errors.messages or model.errors.full_messages
  #arguments to validations are hashes where the keys equals true or where the key is anoth hash of messages/conditions

  #validates :description, uniqueness: {scope: :title}  validate only in the presence of something else
  #validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #can add if: :custom_helper
  #validates :can_be_custom_private_method_in_model  

  scope :recent_ten, lambda { limit(10).order("updated_at DESC") }  #lambda sugar syntax is ->
  #scope is same as def self.recent_10 with contents of block inside method definition
  scope :last_three_days, -> { where(["created_at > ?", 3.days.ago]) }
  scope :recent,          -> { order("updated_at DESC") }



  after_initialize :set_defaults
  before_save :capitalize_title

  private

  def capitalize_title
    self.title = title.capitalize
  end

  def set_defaults
    self.view_count ||= 0
  end

  def title_is_longer_than_one_character
    title.length>1
  end
end

