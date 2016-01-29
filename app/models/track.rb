class Track < ActiveRecord::Base
  validates :track_name, :album_id, presence: true

  belongs_to :album,
    foreign_key: :album_id,
    primary_key: :id,
    class_name: "Album"

  has_one :band,
    through: :album,
    source: :band
end
