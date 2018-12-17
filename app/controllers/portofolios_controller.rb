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


end
