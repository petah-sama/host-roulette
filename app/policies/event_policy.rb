class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
    check_user
  end

  def create?
    check_user
  end

  def update?
    check_user
  end

  def destroy?
    check_user
  end

  private

  def check_user
    record.user == user
  end

end
