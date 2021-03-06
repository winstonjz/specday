class Goal < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 6 }
  belongs_to(
   :author,
   class_name: "User",
   foreign_key: :user_id
  )
  has_many :cheers

  include Commentable
  # **NB**: comments association is created in Commentable
  # concern
  # has_many :comments, as: :commentable

  def cheered_by?(user)
   cheers.exists?(giver_id: user.id)
  end
end
