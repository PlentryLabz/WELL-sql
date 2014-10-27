class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :city

  mount_uploader :pic, UsersUploader
  process_in_background :pic
  store_in_background :pic

  def full_name
    "#{first_name} #{second_name}"
  end
end
