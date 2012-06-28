# == Schema Information
#
# Table name: works
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  type        :string(255)
#  realized    :date
#  where       :string(255)
#  position    :integer
#  visible     :boolean
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Work < ActiveRecord::Base
  attr_accessible :title, :description, :realized, :where, 
                  :position, :visible

  validates :title, presence: true
end
