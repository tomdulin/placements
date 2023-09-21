class LoginController < SecureController
	layout "page"
	
	def index
		redirect_to(invoices_path)
	end
end