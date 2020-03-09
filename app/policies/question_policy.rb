class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    check_host
  end

  def create?
    check_host
  end

  def destroy?
    check_host
  end

  private

  def check_host
    record.edition.host_id == user.id
  end
end
