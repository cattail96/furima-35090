class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_days
  belongs_to :delivery_fee
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image
  has_one :order
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations

  with_options presence: true do
    validates :image
    validates :item_name
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :item_explanation
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_days_id
  end
end
