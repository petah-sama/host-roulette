class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
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
    record.host_id == user.id
  end

end
