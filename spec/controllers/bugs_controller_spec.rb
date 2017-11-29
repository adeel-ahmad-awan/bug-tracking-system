require 'rails_helper'

RSpec.describe BugsController, type: :controller do

  describe "GET #new" do

    let(:pro1) { FactoryGirl.create(:project) }

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "creates a new bug" do
      expect{
        bug_attributes = FactoryGirl.attributes_for(:bug)
        bug_attributes[:project_id] = pro1.id
        puts bug_attributes.inspect
        post :create, bug: bug_attributes
        puts assigns(:bug).inspect
        puts assigns(:bug).errors.inspect
        # expect(response).to render_template("new")
        expect(response).to redirect_to(assigns(:bug))
      }.to change(Bug,:count).by(1)
    end

  end #describe "GET #new"

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "populates an array of bugs" do
      bug = FactoryGirl.create(:bug)
      get :index
      expect(assigns(:bugs)).to eq([bug])
    end
  end   #describe "GET #index"

  describe "GET #show" do

    it "returns http success" do
      bug = FactoryGirl.create(:bug)
      get :show, params: {id: bug.to_param}
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested bug to @bug" do
      bug = FactoryGirl.create(:bug)
      get :show, id: bug
      assigns(:bug).should eq(bug)
    end

  end   #describe "GET #show" do

  describe "GET #edit" do

    it "returns http success" do
      bug = FactoryGirl.create(:bug)
      get :edit, id: bug
      expect(response).to have_http_status(:success)
    end
    it "redirect_to show page after successfull update" do
      bug = FactoryGirl.create(:bug)
      puts bug.inspect
      puts bug.errors.inspect
      put :update, {id: bug.id, bug: {name: 'abd'}}
      puts assigns(:bug).inspect
      puts assigns(:bug).errors.inspect
      expect(response).to redirect_to(assigns(:bug))
    end
    it "re-render edit page after un-successfull update" do
      bug = FactoryGirl.create(:bug)
      puts bug.inspect
      puts bug.errors.inspect
      put :update, {id: bug.id, bug: {name: ''}}
      puts assigns(:bug).inspect
      puts assigns(:bug).errors.inspect
      expect(response).to render_template(:edit)
    end

  end   #describe "GET #edit" do

# <---->
describe "GET #destroy" do

  it "returns http success" do
    bug = FactoryGirl.create(:bug)
    delete :destroy, id: bug
    expect(response).to redirect_to(:bugs)
  end

  it "reduce bugs count to -1 after deletion" do
    bug = FactoryGirl.create(:bug)
    expect{
      delete :destroy, id: bug
    }.to change(Bug,:count).by(-1)
  end

end   #describe "GET #destroy" do

# <---->

end #RSpec.describe BugsController, type: :controller
