# frozen_string_literal: true

class BookEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book_entry, only: %i[show edit update destroy]

  def index
    @book_entries = Command::BookEntry::Search.new(user_id: current_user.id).execute
  end

  def show; end

  def new
    @book_entry = BookEntry.new
  end

  def edit; end

  def create
    respond_to do |format|
      @book_entry = Command::BookEntry::Create.new(user: current_user, kind: params[:book_entry][:kind]).execute
      if @book_entry.save
        format.html { redirect_to @book_entry, notice: 'Book entry was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @book_entry = Command::BookEntry::Update.new(id: params[:id], changes: book_entry_params).execute
      if @book_entry.update(book_entry_params)
        format.html { redirect_to @book_entry, notice: 'Book entry was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @deleted_book = Command::BookEntry::Destroy.new(id: params[:id], user: current_user.id).execute
    respond_to do |format|
      format.html { redirect_to book_entries_url, notice: 'Book entry was successfully destroyed.' }
    end
  end

  private

  def set_book_entry
    @book_entry = Command::BookEntry::Show.new(id: params[:id], user: current_user.id).execute
  end

  def book_entry_params
    params.require(:book_entry).permit(:kind)
  end
end
