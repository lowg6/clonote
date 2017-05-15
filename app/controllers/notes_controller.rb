class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def show
    @user = @note.user
  end

  def new
    @note = current_user.notes.new
  end

  def edit
  end

  def create
    @note = current_user.notes.create(note_params)
    redirect_to @note
  end

  def update
    @note.update(note_params)
    redirect_to @note
  end

  def destroy
    @note.destroy
    redirect_to notes_url
  end

  private
  
  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body, :price, :header_image)
  end
end
