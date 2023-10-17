class PurchasesController < ApplicationController
	def index
		@group = Group.find_by(id: params[:group_id])
		@purchases = @group.purchases.order(created_at: :asc)
	end
end
