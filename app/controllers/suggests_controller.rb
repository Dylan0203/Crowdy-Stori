class SuggestsController < ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]

	before_action :set_suggest, only: [:edit, :update, :destroy]

	def index
		@suggests = Suggest.all.order("id DESC")
	end

	def show
		@suggest = Suggest.find(params[:id])
		@page_title = "故事里 - #{@suggest.topic}"
	end	

	def new
		@suggest = Suggest.new
	end

	def create
		@suggest = current_user.suggests.new(suggest_params)
		if @suggest.save
			redirect_to action: :index
		else
			render :new
		end
	end

	def edit
		@page_title = @suggest.topic
	end

	def update
		if @suggest.update(suggest_params)
			redirect_to suggests_path
		else
			render :edit
		end
	end

	def destroy
		@suggest.destroy
		redirect_to suggests_path
	end

	private

	def suggest_params
		params.require(:suggest).permit( :topic, :content, :suggest_category )
	end

	def set_suggest
		@suggest = Suggest.find(params[:id])
		
	end
end