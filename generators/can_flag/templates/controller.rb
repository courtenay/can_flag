# This controller handles the 'flag as inappropriate' functionality
class <%= controller_class_name %>Controller < ApplicationController
  before_filter :login_required
# You probably have your own 'admin' filter
  before_filter :admin_required, :only => :index
protected
  def admin_required
    raise AccessDenied unless current_user.admin?
  end

public
  
  # collection methods

  def create
    flag = current_user.flags.create params[:flag]
    flash[:notice] = if flag.new_record?
      "You already flagged this content!"
    else # success
      "Content has been flagged!"
    end

    respond_to do |format|# note: you'll need to ensure that this route exists
      format.html { redirect_to flag.flaggable }
      # format.js # render some js trickery
    end
  end

  def index
    @flags = if current_user.admin?
      current_user.flags.find(:all)
      #We suggest 'will_paginate' plugin
      #@flags = current_user.flags.paginate(:all, :page => params[:page])
    else
      Flag.find(:all, :order => "id desc")
    end
    respond_to do |format|
      format.html {} # index.html.erb
      format.xml  { render :xml => @flags }
    end
  end    
    
end