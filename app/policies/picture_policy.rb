class PicturePolicy < ApplicationPolicy

  def create?
    return true if user.present? && user == picture.bug.user
  end

  # def update?
  #   return true if user.present? && user == picture.user
  # end

  def destroy?
    return true if user.present? && user == picture.bug.user
  end


  class Scope < Scope
    def resolve
      scope
    end
  end


private

  def picture
    record
  end

end
