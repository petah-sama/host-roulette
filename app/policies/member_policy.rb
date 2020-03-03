class MemberPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
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
