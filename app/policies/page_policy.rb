class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def index?
    check_user
  end

  private

  def check_user
    record.user == user
  end

end
