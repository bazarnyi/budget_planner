RSpec.describe HomePageController do
  describe "GET #index" do
    subject { get :index }

    it "renders the index template" do
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("home_page/index")
    end

    it "does not render a different template" do
      expect(subject).not_to render_template("home_page/show")
    end
  end
end