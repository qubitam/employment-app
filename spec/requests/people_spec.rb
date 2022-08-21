require 'rails_helper'

RSpec.describe "People", type: :request do

  let(:valid_attributes) do
    {
      'id' => '1',
      'first_name' => 'Joe',
      'last_name' => 'Do',
      'email' => 'email@app.com',
      'phone_number' => '3333333333',
      'nickname' => 'fast'
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'first_name' => 'Joe',
      'last_name' => 'Do',
      'email' => 'email@app.com',
      'nickname' => 'fast'
    }
  end

  describe "GET /index" do
    it "returns http success" do
      get "/people/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      person = Person.new(valid_attributes)
      person.save
      get person_url(person)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_person_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it "creates a new Post" do
        expect {
          post people_url, params: { person: valid_attributes }
        }.to change(Person, :count).by(1)
      end

      it "redirects to the created post" do
        post people_url, params: { person: valid_attributes }
        expect(response).to redirect_to(person_url(Person.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Person' do
        expect {
          post people_url, params: { person: invalid_attributes }
        }.to change(Person, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post people_url, params: { person: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
