class EditionPolicy < ApplicationPolicy
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
    check_host
  end

  def update?
    check_host
  end

  def destroy?
    check_user
  end

  private

  def check_user
    record.user == user
  end

  def check_host
    record.host_id == user.id
  end

end
