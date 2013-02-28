###############################
##########  IMPORTANT  ########
###############################

#If the method "visit" doesn't functions, I have to rename the directory spec/requests to spec/features

###############################
###############################
###############################

###############################
###  SOME Capybara Methods ####
###############################

# visit '/quienes-somos'
# visit root_path
# page.should have_text('Entrar')
# page.should have_content('Entrar')
# page.should have_selector('h1', :text => 'Hello')
# page.should have_selector('img')

###############################

require 'spec_helper'

describe "Static Pages" do
  
  describe "Welcome page" do #THIS BLOCK IS THE SAME AS THE BLOCK IS UNDER THISONE.
    subject {page}
    before {visit '/welcome_page'}
    it { should have_link('Entrar', :href=>root_path) }
    it { should have_selector('img') }
  end

  # describe "Welcome page" do
  #   it "should have some features" do
  #     visit '/welcome_page'
  #     page.should have_link('Entrar', :href=>root_path)
  #   end
  # end


end

