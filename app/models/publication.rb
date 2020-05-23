class Publication < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :title, :body, presence: true
  validate :image_presence_format #image presence and format validation

  private

  def image_presence_format
    if !image.attached? #image presence
      errors.add(:image, "manquante !")
    elsif image.attached? #image format JPG or PNG
      if !image.content_type.in?(%w(image/jpg image/jpeg image/png))
        errors.add(:image, "doit être au format JPG ou PNG !")
      end
    end
  end

end
