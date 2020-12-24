class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_name, :building_name, :phone_number, :item_id, :token, :block_name, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token, :block_name, :item_id, :user_id
  end

    validates :prefecture_id, numericality: { other_than: 1 }

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, building_name: building_name, phone_number: phone_number, block_name: block_name, city_name: city_name)
  end

end