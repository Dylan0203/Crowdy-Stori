class ChaptersController < ApplicationController

  before_action :set_article, :only => [ :show ]

  def index
    @chapters =  Chapter.all
    @finish = Chapter.where( :finish => true )
  end

  def show
    @chapter.view = @chapter.view.to_i + 1
    @chapter.save
  end

  def new

    if params[:id]
      @chapter = Chapter.find(params[:id])
      @chapter = @chapter.children.new
    else
      @chapter = Chapter.new
    end

  end

  def create
    
    if params[:id]
      @chapter = Chapter.find(params[:id])
      @chapter = @chapter.children.new(chapter_params)
    else
      @chapter = Chapter.new(chapter_params)
    end
    
    if @chapter.save
      flash[:notice] = "新增成功"
      redirect_to chapters_path
    
    else
      render :action => :new
    
    end

  end

  private

  def set_article
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:topic, :setting, :content, :finish )
  end

end
