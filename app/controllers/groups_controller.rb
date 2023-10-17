class GroupsController < ApplicationController
	before_action :groups_by_current_user, only: [:new, :create]
	before_action :load_photos, only: :new

  def index
    @groups = current_user.groups
  end

  def new
  	@group = @groups.new
  end

  def create
  	group = @groups.new(group_params)
  	if group.save
  		flash[:notice] = 'The Category was created successfully!'
  		redirect_to groups_path
  	else
  		flash[:alert] = group.errors.full_messages.join(', ')
  		redirect_to request.referrer
  	end
  end

  private

  def group_params
  	params.require(:group).permit(:name, :icon)
  end

  def groups_by_current_user
  	@groups = current_user.groups
  end

  def load_photos
  	@photos = [
      		"https://n9.cl/mgn495",
      		"https://n9.cl/yko32",
      		"https://n9.cl/z3rxl",
      		"https://n9.cl/cxg32",
    			"https://n9.cl/qmb20",
    			"https://n9.cl/ysy5f",
    			"https://n9.cl/1orfm",
    			"https://n9.cl/60zpm",
    			"https://n9.cl/v4c05",
    			"https://n9.cl/nrm4c",
    			"https://n9.cl/nufqes",
    			"https://n9.cl/agfch",
    			"https://n9.cl/rwoyb"
      	]
  end
end
