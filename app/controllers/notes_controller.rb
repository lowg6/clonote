class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @notes = Note.all
  end

  def show
    if @note.is_draft
      unless view_context.current_user?(@note.user)
        redirect_to root_path
      end
    end

    @user = @note.user
  end

  def new
    @note = current_user.notes.new
  end

  def edit
    redirect_to root_path unless view_context.current_user?(@note.user)
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

  def index_draft
    @notes = current_user.notes.where(is_draft: true).order('created_at DESC')
  end

  private
  
  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body, :price, :header_image, :is_draft)
  end
end
