class DashboardController < ApplicationController
	
	before_action :authenticate_user!
	

	layout 'dashboard'
	
	def index

		
		
	end

	def unauthorize
		render layout: 'unauthorize'
	end

	def create_organization
		#if request.subdomain.present? && request.subdomain != 'www'   
		if current_user.admin? || current_user.superuser?
			
		
			unless  current_organization.present? 
				redirect_to setup_organization_path
			end	
		end
		#end
	end
	
	

end