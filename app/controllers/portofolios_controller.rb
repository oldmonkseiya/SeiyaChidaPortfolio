class PortofoliosController < ApplicationController
	def index
		@portfolio_item = Portofolio.all
	end

	
end
