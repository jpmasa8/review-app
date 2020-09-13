# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#
class Comment < ApplicationRecord
  belongs_to :post

  validates :name, presence: true, length: { maximum: 20}
  validates :comment, presence: true, length: { maximum: 1000 }
end
