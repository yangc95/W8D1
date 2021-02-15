# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint           not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PostSub < ApplicationRecord
    validates :sub_id, presence: true, uniqueness: {scope: :post_id}
    validates :post_id, presence: true

    belongs_to :sub
    
    belongs_to :post
end
