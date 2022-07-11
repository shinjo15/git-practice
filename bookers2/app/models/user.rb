class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :books, dependent: :destroy
end

  def change
    create_table :books do |t|
      t.string :name
      t.text :introduction
  end
  
end