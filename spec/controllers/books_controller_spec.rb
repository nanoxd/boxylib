require 'spec_helper'

describe BooksController do
  let(:book) { create(:book) }

  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'populates an array of all books' do
      tacos = create(:book, title: "Tacos")
      fish = create(:book, title: "Fish")
      get :index
      expect(assigns(:books)).to match_array([tacos, fish])
    end
  end

  describe 'GET #show' do

    it 'assigns the requested message to @book' do
      get :show, id: book
      expect(assigns(:book)).to eq book
    end

    it 'renders the show template' do
      get :show, id: book
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new Book to @book' do
      get :new
      expect(assigns(:book)).to be_a_new(Book)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested book to @book' do
      get :edit, id: book
      expect(assigns(:book)).to eq book
    end

    it 'renders the edit template' do
      get :edit, id: book
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    login_user

    context "with valid attributes" do
      it 'saves the new book in the database' do
        expect{
          post :create, book: attributes_for(:book)
        }.to change(Book, :count).by(1)
      end

      it 'redirects to books#show' do
        post :create, book: attributes_for(:book)
        expect(response).to redirect_to book_path(assigns(:book))
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new book in the database" do
        expect{
          post :create, book: attributes_for(:invalid_book)
        }.not_to change(Book, :count)
      end

      it "re-renders the new template" do
        post :create, book: attributes_for(:invalid_book)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before(:each) do
      @book = create(:book, title: 'Creation', isbn: 12345)
    end

    context "with valid attributes" do
      it "updates the book in the database" do
        patch :update, id: @book, book: attributes_for(:book)
        expect(assigns(:book)).to eq @book
      end

      it 'redirects to the book' do
        patch :update, id: @book, book: attributes_for(:book)
        expect(response).to redirect_to @book
      end
    end

    context 'with invalid attributes' do
      it "doesn't update the book" do
        patch :update, id: @book, book: attributes_for(:invalid_book, title: 'No!')
        @book.reload
        expect(@book.isbn).to_not eq(nil)
      end

      it "re-renders the #edit template" do
        patch :update, id: @book, book: attributes_for(:invalid_book)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @book = create(:book)
    end

    it 'deletes the book from the database' do
      expect{
        delete :destroy, id: @book
      }.to change(Book, :count).by(-1)
    end

    it 'redirects to books#index' do
      delete :destroy, id: @book
      expect(response).to redirect_to(books_url)
    end
  end

end
