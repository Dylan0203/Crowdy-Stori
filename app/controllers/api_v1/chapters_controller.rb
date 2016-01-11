class ApiV1::ChaptersController < ApplicationController

  skip_before_action :verify_authenticity_token

  # GET /api/v1/chapters/:id
  def show
    @chapter = Chapter.find(params[:id])

  # show.json.jbuilder
  end

  # GET /api/v1/chapters
  def index
    #@chapters = Chapter.page( params[:page] ).per(5)
    @chapters = Chapter.all

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

end