class StaticPagesController < ApplicationController
  before_action :redirect_unless_logged_in, only: :traffic
  before_action :redirect_unless_admin,     only: :traffic

  def home
    @posts = Post.paginate(page: params[:page], :per_page => 10)
    ip_address = IpAddress.find_by(ip_address: request.remote_ip)
    if ip_address.nil?
      ip_address = IpAddress.create(ip_address: request.remote_ip)
    end
    connection = Connection.find_by(user_id: current_user.id, ip_address_id: ip_address.id)
    if ( connection.nil? )
      Connection.create(user_id: current_user.id, ip_address_id: ip_address.id)
    else
      connection.touch
    end
  end

  def about
  end

  def traffic
    @connections = Connection.take(20)
  end
end
