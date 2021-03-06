class Schedule < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :company
    validates :person
    validates :date
    validates :place
    validates :purpose
    validates :relation_id
  end

  validates :relation_id, numericality: { other_than: 1 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :relation
  
  def self.search(search)
    if search != ""
      Schedule.where('company LIKE(?)', "%#{search}%")
    else
      Schedule.all
    end
  end

end
