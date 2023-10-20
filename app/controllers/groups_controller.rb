class GroupsController < ApplicationController
  before_action :groups_by_current_user, only: %i[new create edit update destroy]
  before_action :load_photos, only: [:new, :edit]

  def index
    @groups = current_user.groups.includes(:purchases)
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

  def edit
		@group = @groups.find_by(id: params[:id])
  end

  def update
		group = @groups.find_by(id: params[:id])

		if group.update(group_params)
			flash[:notice] = 'The Category was modified successfully!'
			redirect_to groups_path
		else
			flash[:alert] = group.errors.full_messages.join(', ')
			redirect_to request.referrer
		end
  end

  def destroy
  	group = @groups.find_by(id: params[:id])
  	if group.destroy
  		flash[:notice] = 'The Category was removed successfully!'
  		redirect_to groups_path
  	else
  		flash[:alert] = 'The Category was not removed!'
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
      'https://live.staticflickr.com/65535/48012754801_260dcc1070.jpg',
      'https://m.media-amazon.com/images/I/61M3SN0s6vL._AC_UF894,1000_QL80_.jpg',
      'https://img.freepik.com/vector-premium/dibujos-animados-electrodomesticos_24911-67071.jpg',
      'https://w0.peakpx.com/wallpaper/689/1023/HD-wallpaper-anime-original-computer-night.jpg',
      'https://media.gcflearnfree.org/content/5ccc48c7e5c6c4116cbd9df7_05_03_2019/consolasjuegos-01_xl.png',
      'https://cdn.pixabay.com/photo/2023/03/01/01/49/mountain-7822071_1280.jpg',
      'https://www.gob.mx/cms/uploads/article/main_image/22672/DEPORTES-01.jpg',
      'https://i.pinimg.com/originals/81/b2/34/81b234e6d4a79f243357e9f0d928135e.png',
      'https://png.pngtree.com/png-clipart/20230414/ourlarge/pngtree-beautiful-green-shoes-anime-style-illustration-png-image_6704693.png',
      'https://img.freepik.com/vector-gratis/pack-productos-limpieza-superficies_23-2148534089.jpg',
      'https://serviciostecnicosmovil.com/wp-content/uploads/2019/09/electronica.jpg',
      'https://static.wixstatic.com/media/802169_73480bec98d941f0891456532673c1b4~mv2.jpg/v1/fit/w_500,h_500,q_90/file.jpg',
      'https://www.respetmascotas.com/_Assets/img/181129-Imagen-AlimentacionMascotas.jpg'
    ]
  end
end
