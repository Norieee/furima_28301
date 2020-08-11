class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :ordered_items

  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :email, uniqueness: true,
                      format: { with: /\A([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+\z/ }
    validates :password, length: {minimum: 6}
    validates :password_confirmation
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is not full-width characters' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is not full-width characters' }
    validates :f_name_kana, format: { with: /\A[ァ-ンー]+\z/, message: 'is not full-width katakana characters' }
    validates :l_name_kana, format: { with: /\A[ァ-ンー]+\z/, message: 'is not full-width katakana characters' }
    validates :birthday
  end
end
