class Student < ActiveRecord::Base

  belongs_to :users

  has_many :curriculums
end
