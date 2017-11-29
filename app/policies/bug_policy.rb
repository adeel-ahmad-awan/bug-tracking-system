class BugPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == bug.user
  end

  def destroy?
    return true if user.present? && user == bug.user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

private

  def bug
    record
  end

end
