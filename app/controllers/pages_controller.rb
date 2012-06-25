# coding: utf-8
class PagesController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @pages = Page.where( user_id: session[:user_id] ).all
  end

  #------#
  # show #
  #------#
  def show
    @page = Page.where( id: params[:id], user_id: session[:user_id] ).first
  end

  #-----#
  # new #
  #-----#
  def new
    @page = Page.new
    
    @submit = "create"
  end

  #------#
  # edit #
  #------#
  def edit
    @page = Page.where( id: params[:id], user_id: session[:user_id] ).first
    
    @submit = "update"
  end

  #--------#
  # create #
  #--------#
  def create
    @page = Page.new( params[:page] )
    @page.user_id = session[:user_id]

    if @page.save
      redirect_to( { action: "index" }, notice: "Page was successfully created." )
    else
      render action: "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @page = Page.where( id: params[:id], user_id: session[:user_id] ).first

    if @page.update_attributes( params[:page] )
      redirect_to( { action: "show", id: params[:id] }, notice: "Page was successfully updated." )
    else
      render action: "edit", id: params[:id]
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @page = Page.where( id: params[:id], user_id: session[:user_id] ).first
    @page.destroy

    redirect_to action: "index"
  end

end
