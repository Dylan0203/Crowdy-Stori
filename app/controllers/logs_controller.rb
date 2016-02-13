class LogsController < ApplicationController

	before_action :authenticate_user!, :except => [:index]

	before_action :set_log, :only => [:update, :destroy]
	before_action :set_logs, :only => [:index, :create, :update]

	def index
		if params[:log_id]
			@log = Log.find(params[:log_id])
		else
			@log = Log.new
		end
	end

	def create
		@log = current_user.logs.new(log_params)
		if @log.save
			flash[:notice] = "新增成功"
			redirect_to logs_path
		else
			flash[:alert] = "新增失敗"
			render :index
		end
	end

	def update
		@log.update(log_params)
		if @log.save
			flash[:notice] = "更新成功"
			redirect_to logs_path
		else
			flash[:alert] = "更新失敗"
			render :index
		end
	end

	def destroy
		@log.destroy
		flash[:alert] = "記錄已刪除"
		redirect_to logs_path
	end

	private

	def log_params
		params.require(:log).permit(:topic, :content, :logtime)
	end

	def set_log
		@log = Log.find(params[:id])
	end

	def set_logs
		@logs = Log.all.order("logtime DESC")
	end

end
