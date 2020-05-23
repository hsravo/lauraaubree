class Project < ApplicationRecord

  belongs_to :user
  has_many_attached :images

  validates :title, :body, presence: true 
  validate :images_presence_format #image presence and format validation

  private

  def images_presence_format
    if !images.attached?
      errors.add(:images, "manquantes !")
    elsif images.attached?
      images.each do |image|
        if !image.blob.content_type.in?(%w(image/jpeg image/jpg image/png))
          errors.add(:images, "doivent être au format JPG ou PNG !")
        end
      end
    end
  end

end
