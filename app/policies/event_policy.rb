class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def destroy?
    check_user
  end

  private

  def check_user
    record.user == user
  end

  def check_host
    record.editions.last.host_id == user.id
  end

end
