class Project < ApplicationRecord

  belongs_to :user
  has_one_attached :cover
  has_many_attached :images

  validates :title, presence: true
  validates :slug, uniqueness: true
  validate :images_presence_format

  extend FriendlyId
  friendly_id :title, use: :slugged

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
