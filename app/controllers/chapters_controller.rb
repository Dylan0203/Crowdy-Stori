class ChaptersController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_article, :only => [ :show, :edit, :update ]

  def index
    @weekpop = Chapter.includes_more.weekpop.search(params)
    @finish = Chapter.includes_more.finished.search(params)
    @unfinished = Chapter.includes_more.unfinished.search(params)
    @begins = Chapter.includes_more.begins.search(params)
    @mostpop = Chapter.includes_more.mostpop.search(params)

    @chapters = Chapter.search(params)

    sort_by = if %w[topic view].include?(params[:order])
      params[:order]
    else
      'id'
    end

    @chapters = @chapters.order(sort_by + " DESC")
  end
  
  def show
    @page_title = "故事里 - #{@chapter.topic}"

    unless cookies["view-chapter-#{@chapter.id}"]
      cookies["view-chapter-#{@chapter.id}"] = "viewed"
      @chapter.view = @chapter.view.to_i + 1
      @chapter.save!
    end
  end

  def new
    @chapter = Chapter.new(parent_id: params[:parent_id])
    @page_title = (@chapter.parent)? "故事里 - 接續故事 #{@chapter.parent.topic}" : "故事里 - 開創新的故事"
  end

  def create
    @chapter = current_user.chapters.new(chapter_params)

    if @chapter.save
      flash[:notice] = "成功新增故事"
      redirect_to chapter_path(@chapter)
    else
      render :action => :new
    end
  end

  def edit
    
  end

  def update
    @chapter.update(chapter_params)
    if @chapter.save
      flash[:notice] = "成功更新故事"
    redirect_to chapter_path(@chapter)
    else
      flash[:alert] = "故事標題或內容不可為空白"
      render :action => :edit
    end
  end

  private

  def set_article
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:topic, 
                                    :setting, 
                                    :content, 
                                    :finish, 
                                    :category_id, 
                                    :avatar, 
                                    :avatar_cache, 
                                    :remote_avatar_url, 
                                    :parent_id, 
                                    :category_id)
  end
end
