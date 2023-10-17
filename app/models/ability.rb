# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
  	can :read, Group, user_id: user.id
  	can :read, Purchase, author_id: user.id
  end
end
