# require 'spec_helper'
# 
# describe Image do
#   before { @image = FactoryGirl.create(:image) }
# 
#   subject { @image }
# 
#   it { should respond_to :illustrated }
# 
#   describe "illustrated type" do
#     it "is VisualWork when belonks to a visual work" do
#       @image.illustrated_type.should == "VisualWork"
#     end
# 
#     it "is ActionWork when belonks to an action work" do
#       @image2 = FactoryGirl.create(:image, illustrated: FactoryGirl.create(:action_work))
#       @image2.illustrated_type.should == "ActionWork"
#     end
#   end
# 
#   it "is not valid without image field" do
#     @image.image = " "
#     should_not be_valid
#   end 
# end
