class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_notes, only: [:index, :index_recommend, :index_category, :index_hashtag]
  before_action :set_tags, only: [:index, :index_recommend, :index_category, :set_search_result_users_hashtags]
  before_action :authenticate_user!, except: [:index, :show, :index_recommend, :index_category, :index_hashtag, :set_search_result_users_hashtags]
  before_action :set_note_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:new, :edit]
  
  def index
    @notes = @notes.where(is_draft: false).order('created_at DESC')
  end

  def show
    if @note.is_draft
      unless view_context.current_user?(@note.user)
        redirect_to root_path
      end
    end

    @note.views += 1
    @note.save

    @user = @note.user
    @magazines = @note.magazines.where(user_id: @user.id)
    @comment = @note.comments.new
    @comments = @note.comments.includes(:user).order('created_at ASC')
    @is_purchased = (current_user.purchases.where('category = ? AND object_id = ?', 0, @note.id).count > 0 ? true : false) if user_signed_in?
  end

  def new
    @note = current_user.notes.new
    @magazine = current_user.notes.new
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
    redirect_to drafts_path
  end

  def index_draft
    @notes = current_user.notes.where(is_draft: true).order('created_at DESC')
    @user = current_user
  end

  def index_recommend
    @notes = @notes.joins(:favorites).group('favorites.note_id').order('count(favorites.note_id) DESC').order('views DESC')
  end

  def index_hashtag
    @notes = @notes.tagged_with(params[:id]).where(is_draft: false).order('created_at DESC')
  end

  def index_category
    @notes = @notes.tagged_with(params[:id]).where(is_draft: false).order('created_at DESC')
  end

  def set_search_result_users_hashtags
    @search_result_users = User.where('nickname LIKE(?)', "#{params[:keyword]}%")
    @search_result_hashtags = @tags.where('name LIKE(?)', "#{params[:keyword]}%")
  end

  private
  
  def set_note
    @note = Note.find(params[:id])
  end

  def set_notes
    @notes = Note.includes(:user)
  end

  def set_tags
    @tags = ActsAsTaggableOn::Tag
  end

  def note_params
    params.require(:note).permit(:title, :body, :price, :header_image, :is_draft, :tag_list, magazine_ids: [])
  end

  def set_note_tags_to_gon
    gon.note_tags = @note.tag_list
  end

  def set_available_tags_to_gon
    gon.available_tags = Note.tags_on(:tags).pluck(:name)
  end
end
