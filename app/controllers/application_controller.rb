class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :stats
  
  private
    
    # Before filters
    
    def stats
      ip = request.remote_ip
      ip_address = IpAddress.find_or_create_by(ip_address: ip)
      if current_user.nil?
        connection = Connection.find_or_create_by(user_id: nil, ip_address_id: ip_address.id)
      else
        connection = Connection.find_or_create_by(user_id: current_user.id, ip_address_id: ip_address.id)
      end
      connection.count = connection.count + 1
      connection.save
      # TODO increment connection count
      
      
      #ip_address = request.remote_ip
      #ip_address = IpAddress.find_by(ip_address: ip_address)
      #if ip_address.nil?
      #  ip_address = IpAddress.create(ip_address: ip_address)
      #end
      #connection = Connection.find_by(user_id: current_user.id, ip_address_id: ip_address.id)
      #if ( connection.nil? )
      #  Connection.create(user_id: current_user.id, ip_address_id: ip_address.id)
      #else
      #  connection.touch
      #end
    end
    
    # Confirms a logged-in user.
    def redirect_unless_logged_in
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def redirect_unless_correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # Confirms an admin user.
    def redirect_unless_admin
      redirect_to(root_url) unless current_user.admin?
    end

end
