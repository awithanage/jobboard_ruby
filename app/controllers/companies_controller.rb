class CompaniesController < ApplicationController
	# before_action :find_company, only: [:show, :edit, :update, :destroy]
        def index
            if params[:user_id] && @user = User.find_by_user_id(id: params[:user_id])
               @companies = @user.companies
           else
               @companies = Company.all
           end
       end
        	
		def show
			 @company = Company.find_by_user_id(current_user.id)
             @company_user_id = current_user.id

			#@company.user_id == current_use
            

		 #@companies = Campany.where(user_id: '1')
		# @company = Company.where(user_id:company.user_id)
			
              # @company_user_id = current_user.id
		end

		def new
			
			   @company = current_user.companies.build     
		end

		def create
			@company = current_user.companies.build(company_params)

			if @company.save
				flash[:success]= "success"
				redirect_to @company
			else
				flash[:error]=@company.errors.full_messages
				render "new"
			end
		end

		def edit
		end

		def update
			if @company.update(company_params)
				redirect_to @company
	        else
	        	render "Edit"
	        end
		end

		def destroy
			@company.destroy
		redirect_to root_path 
		end

		private

		def company_params
			params.require(:company).permit(:c_name, :c_description)
		end

			# def find_company
			# 	@company = Company.find(params[:id]) 
			# end

		# def current_user
  #           @current_user ||= User.find_by(id: session[:user_id])
  #       end

		

end
