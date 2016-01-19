class ChaptersController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  before_action :set_article, :only => [ :show ]

  def index
    @chapters =  Chapter.all
    @finish = Chapter.where( :finish => true )


    if params[:keyword] || params[:category]

      if params[:category][:id].blank?
        @chapters = Chapter.where([ "topic like ?", "%#{params[:keyword]}%"])
      else
        @category = Category.find(params[:category][:id])
        @chapters = @category.chapters
        @chapters = @chapters.where([ "topic like ?", "%#{params[:keyword]}%"])
      end
    else
      @chapters = Chapter.all
    end

    #if %w[topic comments_count last_comment_time view].include?(params[:order])
    if %w[topic view].include?(params[:order])
      sort_by = (params[:order])
    else
      sort_by = 'id'
    end

    @chapters = @chapters.order(sort_by + " DESC")#.page(params[:page]).per(5)

  end

  def show

    unless cookies["view-chapter-#{@chapter.id}"]
     cookies["view-chapter-#{@chapter.id}"] = "viewed"
     @chapter.view = @chapter.view.to_i + 1
     @chapter.save!
    end


  end

  def new

    if params[:parent_id]
      #@chapter = Chapter.find(params[:id])
      parent = Chapter.find(params[:parent_id])
      @chapter = parent.children.new
    else
      @chapter = Chapter.new
    end

  end

  def create

    if params[:id]
      @chapter = Chapter.find(params[:id])
      @chapter = @chapter.children.new(chapter_params)
      @chapter.user = current_user
    else
      @chapter = Chapter.new(chapter_params)
      @chapter.user = current_user
    end

    if @chapter.save
      flash[:notice] = "成功新增故事"
      redirect_to chapter_path(@chapter)
      
    else
      render :action => :new
      
    end

  end

  private

  def set_article
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:topic, :setting, :content, :finish, :category_id, :avatar, :avatar_cache, :remote_avatar_url )
  end
end
