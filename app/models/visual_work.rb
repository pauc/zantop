# == Schema Information
#
# Table name: visual_works
#
#  id               :integer         not null, primary key
#  slug_en          :string(255)
#  slug_es          :string(255)
#  slug_ca          :string(255)
#  realization_date :date
#  dimensions       :string(255)
#  position         :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class VisualWork < Work
end
