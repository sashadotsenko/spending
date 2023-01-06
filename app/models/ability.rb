# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Cost

    return if user.blank?

    can :create, Cost
    can %i[update destroy], Cost, user:
  end
end
