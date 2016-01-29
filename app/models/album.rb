class Album < ActiveRecord::Base
  validates :band_id, :album_name, presence: true
  validates :live_record, inclusion: [true, false]

  belongs_to :band,
    foreign_key: :band_id,
    primary_key: :id,
    class_name: "Band"

  has_many :tracks,
    foreign_key: :album_id,
    primary_key: :id,
    class_name: "Track",
    dependent: :destroy

end
