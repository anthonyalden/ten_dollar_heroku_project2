class SessionsController < ApplicationController
	def new

	end

	def create 
		seller = Seller.where(username: params[:login][:username].downcase).first
		if seller && seller.authenticate(params[:login][:password])
			session[:user_id] = seller.id.to_s 
			redirect_to seller_path(seller.id) 
		else 
			flash[:notice] = "Invalid Username/Password"
			redirect_to items_path

		end
	end

	def destroy
		session.delete(:user_id) 
		redirect_to items_path
	end
end
