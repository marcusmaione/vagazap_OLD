class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def edit?
    @user == user
  end

  def update?
    @user == user
  end

  def destroy?
    @user == user
  end
end
