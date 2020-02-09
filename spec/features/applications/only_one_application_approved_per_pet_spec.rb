require 'rails_helper'

RSpec.describe "As a visitor" do 

  before :each do 
    Shelter.destroy_all
    Pet.destroy_all

    @shelter_1 = Shelter.create!(name: "Abby's Shelter", address: "123 Maine Street", city: "Denver", state: "CO", zip: "80210")
    
    @pet_1 = @shelter_1.pets.create!(
        image: 'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234558/Chinook-On-White-03.jpg',
        name: "Penny",
        age: 2,
        sex: "F",
        description: "Nice dog"
        )


    @owner_info1 = {  :name => 'Alex', 
                    :address => '123 Maine Ave', 
                    :city => 'Paris', 
                    :state => 'CO', 
                    :zip => '80210', 
                    :phone_number => '2077020720', 
                    :description => 'I will be a good pet owner, trust me.'}

    @owner_info2 = { :name => 'Mike', 
                    :address => '476 Market street', 
                    :city => 'Denver', 
                    :state => 'CO', 
                    :zip => '80210', 
                    :phone_number => '4737020720', 
                    :description => "I loved pets, I'll do my best"}

    @application1 = @pet_1.applications.create(@owner_info1)
    @application2 = @pet_1.applications.create(@owner_info2)
  end

  it "once an application has been approved for one pet, other applications for the same pet can not be approved" do
    
    visit "/applications/#{@application1.id}"

    within("span#pet_#{@pet_1.id}") do 
      click_link "Approve Application"
    end

    visit "/applications/#{@application2.id}"

    within("span#pet_#{@pet_1.id}") do 
      expect(page).to_not have_link("Approve Application")
    end

  end

#   User Story 24, Pets can only have one approved application on them at any time

# [ ] done

# As a visitor
# When a pet has more than one application made for them
# And one application has already been approved for them
# I can not approve any other applications for that pet but all other applications still remain on file (they can be seen on the pets application index page)
# (This can be done by either taking away the option to approve the application, or having a flash message pop up saying that no more applications can be approved for this pet at this time)

end