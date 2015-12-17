class CategoriesController < ApplicationController

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Successfully created a new category"
			redirect_to categories_path
		else
			flash[:danger] = "Failed to make a new category!"
			render 'new'
		end
	end

private
	def category_params
		params.require(:category).permit(:name)
	end


end