class GroupsController < ApplicationController
  def index
	@groups = Group.all
  end

  def show
	@group = Group.find(params[:id])
	puts params
  end

  def new
	@group = Group.new
  end

  def create
	@group = Group.new(params[:group])
	redirect_to @group if @group.save
  end

  def edit
	@group = Group.find(params[:id])
  end

  def update
	@group = Group.find(params[:id])
	if @group.update-attributes(params[:group])
		redirect_to @group
	else 
		render :edit
	end
  end

  def destroy
	Group.find(params[:id].try(:delete))
	redirect_to group_path
  end

end
