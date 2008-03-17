# This controller handles the 'flag as inappropriate' functionality
class <%= controller_class_name %>Controller < ApplicationController

  def create
    flag = current_user.flags.create! params[:flag]
    flash[:notice] = "Content has been flagged!"
    redirect_to flag.flaggable
  end

end