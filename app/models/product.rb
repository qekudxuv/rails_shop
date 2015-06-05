class Product < ActiveRecord::Base
  validates :name, presence: true

  default_scope { where(is_deleted: false) }

  scope :available, -> { where(is_online: true) }

  def destroy
    self.is_deleted = true
    save
  end
end
