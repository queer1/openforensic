describe "authorization" do

  describe "for non-signed-in users" do
    let(:user) { FactoryGirl.create(:user) }
  
    describe "submitting to the update action" do
      before { put user_path(user) }
      specify { response.should redirect_to(signin_path) }
    end

  end

  describe "as wrong user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
    before { sign_in user }
    
    describe "submitting a PUT request to the Users#update action" do
      before { put user_path(wrong_user) }
     # specify { response.should redirect_to(root_path) }
    end
  end
  
end