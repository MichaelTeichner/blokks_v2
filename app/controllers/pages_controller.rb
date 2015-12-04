class PagesController < ApplicationController

	before_action :find_page, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@pages = Page.all.order("created_at DESC")
	end

	def show
	end

	def new
		@page = current_user.pages.build
	end

	def create
		@page = current_user.pages.build(page_params)

		if @page.save
			PageMailer.page_created(current_user).deliver
			redirect_to @page
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @page.update(page_params)
			redirect_to @page
		else
			render 'edit'
		end
	end

	def destroy
		@page.destroy
		redirect_to root_path
	end

	private

	def page_params
		params.require(:page).permit(:name)
	end

	def find_page
		@page = Page.find(params[:id])
	end
end
