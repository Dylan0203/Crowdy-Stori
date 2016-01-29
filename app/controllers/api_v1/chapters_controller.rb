class ApiV1::ChaptersController < ApiController

  before_action :authenticate_user!, :only => [:create]

  # GET /api/v1/chapters
  def index
    #@chapters = Chapter.page( params[:page] ).per(5)
    @chapters = Chapter.includes_more.order("id DESC")
  end

  # POST /api/v1/chapters
  def create
    # [CR] move to strong parameter, 
    # And remove user_id, it should become: @chapters = current_user.chapters.new
    @chapter = current_user.chapters.new(chapter_params)

    if @chapter.save
      render :json => { :id => @chapter.id, :message => "OK" }
    else
      render :json => { :message => "Invalid", :errors => @chapter.errors }, :status => 400
    end
  end

  # GET /api/v1/chapters/:id
  def show
    @chapter = Chapter.find(params[:id])
  end

  def finished
    @finish = Chapter.includes_more.finished
  end

  def unfinished
    @unfinished_chapters = Chapter.includes_more.unfinished
  end

  def weekpop
    @weekpop = Chapter.includes_more.weekpop
  end

  def mostpop
    @mostpop = Chapter.includes_more.mostpop
  end
  protected

  def chapter_params
    params.permit(:topic, :setting, :content, :finish, :category_id, :avatar, :avatar_cache, :remote_avatar_url, :parent_id )
  end
end