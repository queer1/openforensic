require 'spec_helper'

describe "Authentication" do

  subject { page }

  # FOR STATIC SIGN IN PAGE
  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h4',    text: 'Sign in to your account') }
    it { should have_title('Sign in') }
  end

  # FOR SIGNIN PROCESS
  describe "signin" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_error_message }

      describe "after visiting another page" do
        before { click_link "OpenForensic" }
        it { should_not have_error_message }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('SIGN IN') }
      end
    end
  end

  # FOR AUTHORIZING WHICH ACCOUNTS CAN DO WHAT
  describe "authorization" do
    
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_title('Edit user')
          end
        end
      end
      
      describe "in the Users controller" do
        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title('Sign in') }
        end
        
        #describe "submitting to the update action" do
        #  before { put user_path(user) }
        #  specify { response.should redirect_to(signin_path) }
        #end
        
      end
    end
    
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit user')) }
      end
    end
    
  end
  
end
