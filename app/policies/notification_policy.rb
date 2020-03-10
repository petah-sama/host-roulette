class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user:user)
    end
  end

  def create?
    true
  end


  private

  def check_user
    record.user == user
  end

end
