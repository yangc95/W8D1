# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  body              :text             not null
#  post_id           :integer          not null
#  author_id         :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Comment < ApplicationRecord
    validates :body, presence: true
    
    belongs_to :post
    belongs_to :author, foreign_key: :author_id, class_name: :User

end
