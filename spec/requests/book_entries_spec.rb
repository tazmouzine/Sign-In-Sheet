 require 'rails_helper'

 RSpec.describe "/book_entries", type: :request do
  
  let(:valid_attributes) {
    {
      user: create(:user),
      kind: 1
    }
  }

  let(:invalid_attributes) {
    {
      user: create(:user),
      kind: ''
    }
  }
  context 'User logged' do
    describe "GET /index" do
      login_user
      it "renders a successful response" do
        BookEntry.create! valid_attributes
        get book_entries_url
        puts response.inspect
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        book_entry = BookEntry.create! valid_attributes
        get book_entry_url(book_entry)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_book_entry_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        book_entry = BookEntry.create! valid_attributes
        get edit_book_entry_url(book_entry)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new BookEntry" do
          expect {
            post book_entries_url, params: { book_entry: valid_attributes }
          }.to change(BookEntry, :count).by(1)
        end

        it "redirects to the created book_entry" do
          post book_entries_url, params: { book_entry: valid_attributes }
          expect(response).to redirect_to(book_entry_url(BookEntry.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new BookEntry" do
          expect {
            post book_entries_url, params: { book_entry: invalid_attributes }
          }.to change(BookEntry, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post book_entries_url, params: { book_entry: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          attributes_for(:book_entry)
        }

        it "updates the requested book_entry" do
          book_entry = BookEntry.create! valid_attributes
          patch book_entry_url(book_entry), params: { book_entry: new_attributes }
          book_entry.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the book_entry" do
          book_entry = BookEntry.create! valid_attributes
          patch book_entry_url(book_entry), params: { book_entry: new_attributes }
          book_entry.reload
          expect(response).to redirect_to(book_entry_url(book_entry))
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          book_entry = BookEntry.create! valid_attributes
          patch book_entry_url(book_entry), params: { book_entry: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested book_entry" do
        book_entry = BookEntry.create! valid_attributes
        expect {
          delete book_entry_url(book_entry)
        }.to change(BookEntry, :count).by(-1)
      end

      it "redirects to the book_entries list" do
        book_entry = BookEntry.create! valid_attributes
        delete book_entry_url(book_entry)
        expect(response).to redirect_to(book_entries_url)
      end
    end
  end
end
