class Project < ApplicationRecord

  has_many :bugs, dependent: :destroy

  has_many :userprojects, dependent: :destroy

  belongs_to :user
  belongs_to :manager, class_name: "User", optional: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

  def self.search(search)
    # User.where(:username => "Paul").includes(:domains).where("domains.name" => "paul-domain").limit(1)
    if search
      self.where("name LIKE ?
                  OR description LIKE ?
                  OR bugs_num LIKE ?",
                  "%#{search}%",
                  "%#{search}%",
                  "%#{search}%")
    else
      self.all
    end
  end

end
