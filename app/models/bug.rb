class Bug < ApplicationRecord

  belongs_to :project
  belongs_to :user
  has_many :steps, :dependent => :destroy
  has_many :pictures, :dependent => :destroy

  validates :name, presence: true
  validates :priority,
    presence: true,
    :inclusion  => { :in => [ 'low', 'medium', 'high'],
    :message    => "%{value} is not a valid priority"
  }
  validates :description,
    presence: true,
    :length =>{
      :minimum => 15,
      :too_short => "description is too short, must be at least %{count} characters"
    }
  validates :status,
    presence: true,
    :inclusion  => { :in => [ 'open', 'closed'],
    :message    => "%{value} is not a valid status"
  }

end
