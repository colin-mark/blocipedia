class User < ApplicationRecord
  has_many :wikis
  after_initialize { self.role ||= :standard }
  # attr_accessor :email, :password, :password_confirmation, :remember_me, :username

  # Include default devise modules. Others available are: :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  enum role: [:standard, :premium, :admin]

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def has_wiki?(wiki)
    wiki.user_id == self.id
  end
end
