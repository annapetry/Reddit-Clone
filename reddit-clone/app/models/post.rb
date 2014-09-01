class Post < ActiveRecord::Base
  validates :title, :author, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )
  has_many(
    :post_subs,
    class_name: "PostSub",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post
  )
  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )
  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: :post_id,
    primary_key: :id
  )

end
