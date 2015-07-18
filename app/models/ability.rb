class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new

    alias_action :create, :show, :update, :delete, :destroy, :to => :csudd

    if user.admin?
      # admins
      can :manage, :all
    elsif user.login.nil?
      # anonymus
      can :create, User
    else
      # normal user
      can :csudd, User, id: user.id

      can :csudd, Production, user_id: user.id

      can :create, MountPoint
      can [:show, :update, :delete, :destroy], MountPoint do |mp|
        user_ids = user.productions.map(&:user_id)
        user_ids.include? user.id
      end
    end
  end
end
