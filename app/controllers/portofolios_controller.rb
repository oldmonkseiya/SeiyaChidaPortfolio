class PortofoliosController < ApplicationController
	
	def index
		@portfolio_item = Portofolio.all
	end
	
	def new
		@portfolio_item = Portofolio.new
	end

	def create
		@portfolio_item = Portofolio.new(params.require(:portofolio).permit(:title,:body))	
		respond_to do |format|
		  if @portfolio_item.save
			format.html { redirect_to portofolios_path, notice: 'Portfolio was successfully created.' }
		  else
			format.html { render :new }
		  end
		end
	end

	def edit
		@portfolio_item = Portofolio.find(params[:id])
	end

	def update
		@portfolio_item = Portofolio.find(params[:id])
		respond_to do |format|
			if @portfolio_item.update(params.require(:portofolio).permit(:title,:body))
				format.html { redirect_to portofolios_path, notice: 'The record was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def show
		@portfolio_item = Portofolio.find(params[:id])
	end

	def destroy
		@portfolio_item = Portofolio.find(params[:id])
		@portfolio_item.destroy
		respond_to do |format|
		  format.html { redirect_to portofolio_url, notice: 'The record was successfully destroyed.' }
		end
	  end

 end