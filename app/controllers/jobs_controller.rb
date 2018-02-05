	class JobsController < ApplicationController
		before_action :find_job, only: [:show, :edit, :update, :destroy]
		before_action :authenticate_user!,except:[:index, :show], notice: 
		
		def index
			if params[:category].blank?
				@jobs = Job.all.order("created_at DESC")
			else
				@category_id = Category.find_by(name: params[:category]).id
				@jobs = Job.where(category_id: @category_id).order("created_at DESC")
		    end
		end

		def show
		end

		def new
			
			   @job = current_user.jobs.build       
		end

		def create
			@job = current_user.jobs.build(jobs_params)

			if @job.save
				flash[:success]= "success"
				redirect_to @job
			else
				flash[:error]=@job.errors.full_messages
				render "new"
			end
		end

		def edit
		end

		def update
			if @job.update(jobs_params)
				redirect_to @job
	        else
	        	render "Edit"
	        end
		end

		def destroy
			@job.destroy
		redirect_to root_path
		end

		private

		def jobs_params
			params.require(:job).permit(:title, :description, :company, :category_id, :image,:jobclosedate)
		end

		def find_job
			@job = Job.find(params[:id])
		end

		# def require_login
		#     unless current_user
		#       flash[:error] = "You must be logged in to the post a Job"
		#       redirect_to new_user_session_path 
		#      end
		 #end

	end
