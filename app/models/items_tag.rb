class ItemsTag

  include ActiveModel::Model
  attr_accessor :item_name, :item_explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
  :delivery_days_id, :price, :image, :name, :user_id

  with_options presence: true do
    validates :item_name
    validates :item_explanation
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :delivery_days_id
    validates :delivery_days_id
    validates :price

    validates :name
  end

  def save
    item = Item.create(item_name: item_name, item_explanation: item_explanation, category_id: category_id, condition_id: condition_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id,
      delivery_days_id: delivery_days_id,  price: price, image: image, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end
