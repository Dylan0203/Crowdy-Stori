class ApiV1::ChaptersController < ApiController

  #before_action :authenticate_user!, :only => [:create]

  # GET /api/v1/chapters/:id
  def show
    @chapter = Chapter.find(params[:id])

  # show.json.jbuilder
  end

  # GET /api/v1/chapters
  def index
    #@chapters = Chapter.page( params[:page] ).per(5)
    @chapters = Chapter.all
    @chapters = @chapters.order("id DESC")

  # index.json.jbuilder
  end

  # POST /api/v1/chapters
  def create
    @chapter = Chapter.new( :topic => params[:topic],
                            :setting => params[:setting],
                            :content => params[:content],
                            :finish => params[:finish],
                            :user_id => params[:user_id] )
    # @topic.user = current_user

    if @chapter.save
      render :json => { :id => @chapter.id, :message => "OK" }
    else
      render :json => { :message => "Invalid", :errors => @chapter.errors }, :status => 400
    end
  end

  def finished
    @finish = Chapter.where( :finish => true )
    @finish = @finish.order("id DESC")
  end
end