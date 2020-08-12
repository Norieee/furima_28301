class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :ordered_items

  japanese_letters = /\A[ぁ-んァ-ン一-龥]+\z/
  japanese_kana_letters = /\A[ァ-ンー]+\z/

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :email, uniqueness: { case_sensitive: true },
                      format: { with: /\w+([-+.]\w+)*@\w+([-.]\w+)*/ }
    validates :password, format: { with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+\z/, message: 'includes both half-width letters and half-width numbers' }
    validates :password_confirmation
    validates :first_name, format: { with: japanese_letters, message: 'is not full-width characters' }
    validates :last_name, format: { with: japanese_letters, message: 'is not full-width characters' }
    validates :f_name_kana, format: { with: japanese_kana_letters, message: 'is not full-width katakana characters' }
    validates :l_name_kana, format: { with: japanese_kana_letters, message: 'is not full-width katakana characters' }
    validates :birthday
  end
end
