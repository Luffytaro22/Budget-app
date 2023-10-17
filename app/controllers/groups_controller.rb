class GroupsController < ApplicationController
	before_action :groups_by_current_user, only: [:new, :create]

  def index
    @groups = current_user.groups
  end

  def new
  	@group = @groups.new
  end

  def create
  	group = @groups.new(group_params)
  	uploaded_io = params[:group][:icon]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end

    group.icon = '/uploads/' + uploaded_io.original_filename
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
end
