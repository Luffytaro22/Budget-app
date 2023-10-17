class PurchasesController < ApplicationController
	before_action :find_purchases, only: [:new, :create]
	before_action :find_group, only: [:index, :new]

	def index
		@purchases = @group.purchases.order(created_at: :asc)
	end

	def new
		@purchase = @purchases.new
		@groups = current_user.groups
	end

	def create
		purchase = @purchases.new(
			name: purchase_params[:name],
			amount: purchase_params[:amount]
		)
		group = Group.find(purchase_params[:group])
		purchase.groups << group
		if purchase.save
     	flash[:notice] = 'The Transaction was created successfully!'
     	redirect_to group_purchases_path(group)
    else
      flash[:alert] = purchase.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
	end

	private

	def purchase_params
		params.require(:purchase).permit(:name, :amount, :group)
	end

	def find_purchases
    @purchases = Purchase.where(author_id: current_user.id)
	end

	def find_group
		@group = Group.find_by(id: params[:group_id])
	end
end
