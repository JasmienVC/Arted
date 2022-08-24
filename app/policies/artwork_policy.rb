class ArtworkPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    user.admin? ? true : record.user == user
  end

  def destroy?
    user.admin? ? true : record.user == user
  end

  def confirm_transaction?
    true
  end
end
