# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  description  :text             not null
#
class Sub < ApplicationRecord
    validates :title, :description, presence: true

    has_many :posts, through: :post_subs, source: :sub

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :post_subs,
        foreign_key: :sub_id,
        class_name: :PostSub,
        dependent: :destroy,
        inverse_of: :sub
end
