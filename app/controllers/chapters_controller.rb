class ChaptersController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  before_action :set_article, :only => [ :show ]

  def index
    @chapters =  Chapter.all
    @finish = Chapter.where( :finish => true )

    respond_to do |format|
      format.html
      format.json {
        arr = @chapters.map { |t|
          { :id => t.id, :topic => t.topic }
        }
        render :json => { :data => arr }
      }
    end
  end

  def show

    unless cookies["view-chapter-#{@chapter.id}"]
       cookies["view-chapter-#{@chapter.id}"] = "viewed"
       @chapter.view = @chapter.view.to_i + 1
       @chapter.save!
     end

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
      @chapter.user = current_user
    else
      @chapter = Chapter.new(chapter_params)
      @chapter.user = current_user
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
    params.require(:chapter).permit(:topic, :setting, :content, :finish, :category_id )
  end

end
