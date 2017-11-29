class ProjectPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == project.user
  end

  def destroy?
    return true if user.present? && user == project.user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

private

  def project
    record
  end

end
