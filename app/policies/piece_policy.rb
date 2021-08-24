class PiecePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def new?
  #   true
  # end

  def create?
    return true
  end

  def show?
    true
  end

  def update?
    # record = @restaurant
    # user = current_user
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end
