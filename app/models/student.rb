# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  # Student.where("name LIKE ?", "%M%")

  def self.search(query)
    if query 
        # self.where(student_id: student)
        self.where('name LIKE ?', "%#{query}%")
      else
        Student.all
    end
  end
end
