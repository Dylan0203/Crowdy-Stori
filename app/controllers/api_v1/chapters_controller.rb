class ApiV1::ChaptersController < ApplicationController

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

end
