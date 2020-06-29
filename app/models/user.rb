class User < ApplicationRecord
    before_save {self.email.downcase!}
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    validates :weight_initial, presence: true, numericality: {greater_than: 0}
    validates :weight_goal, presence: true, numericality: {greater_than: 0}
    validates :age, presence: true, numericality: {greater_than: 0}
    validates :height, presence: true, numericality: {greater_than: 0}
    
    has_secure_password
    has_many :weights
end
