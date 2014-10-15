class Question < ActiveRecord::Base
  vaidates :title, :description,  presence: true
end
