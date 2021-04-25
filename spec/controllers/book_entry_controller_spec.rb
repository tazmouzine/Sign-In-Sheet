# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookEntriesController, type: :controller do
  let(:valid_attributes) do
    {
      user: create(:user),
      kind: :arrive
    }
  end

  let(:invalid_attributes) do
    {
      user: create(:user),
      kind: ''
    }
  end
  context 'Without a access' do
    describe 'GET index' do
      it 'redirect to sign in page' do
        get :index
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
  context 'User logged' do
    describe 'GET index' do
      login_user
      let!(:book_entries) { create_list(:book_entry, 2) }

      it 'renders saved book entries' do
        get :index

        expect(assigns[:book_entries]).to have(2).items
        expect(response).to render_template('index')
      end
    end

    describe 'GET edit' do
      login_user
      let!(:book_entry) { create(:book_entry) }

      it 'renders book_entry edit form' do
        get :edit, params: { id: book_entry.id }

        expect(assigns[:book_entry]).to eq(book_entry)
        expect(response).to render_template('edit')
      end
    end

    describe 'POST /create' do
      login_user
      context 'with valid parameters' do
        it 'creates a new BookEntry' do
          expect do
            post :create, params: { book_entry: valid_attributes }
          end.to change(BookEntry, :count).by(1)
        end

        it 'redirects to the created book_entry' do
          post :create, params: { book_entry: valid_attributes }
          expect(response).to redirect_to(book_entry_url(BookEntry.last))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new BookEntry' do
          post :create, params: { book_entry: invalid_attributes }
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PATCH /update' do
      login_user
      context 'with valid parameters' do
        let(:new_attributes) do
          attributes_for(:book_entry)
        end

        it 'updates the requested book_entry' do
          book_entry = BookEntry.create! valid_attributes
          patch :update, params: { id: book_entry.id, book_entry: new_attributes }
          book_entry.reload
          expect(book_entry.kind.to_sym).to eq(new_attributes[:kind])
        end

        it 'redirects to the book_entry' do
          book_entry = BookEntry.create! valid_attributes
          patch :update, params: { id: book_entry.id, book_entry: new_attributes }
          book_entry.reload
          expect(response).to redirect_to(book_entry_url(book_entry))
        end
      end

      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          book_entry = BookEntry.create! valid_attributes
          patch :update, params: { id: book_entry.id, book_entry: invalid_attributes }
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      login_user
      let!(:book_entry) { create(:book_entry) }
      subject { delete :destroy, params: { id: book_entry.id } }

      it 'destroys a book_entry' do
        expect { subject }.to change { BookEntry.count }.by(-1)
        expect(response).to redirect_to(book_entries_path)
      end
    end
  end
end
