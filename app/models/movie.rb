class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model

  # pg_search_scope :title_and_syllabus,
  #   against: [:title, :syllabus],
  #   using: {
  #     tsearch: {prefix: true}
  #   }

  pg_search_scope :movie_and_director,
    against: [:title, :syllabus],
    associated_against: {
      director: [:first_name, :last_name]
    },
    using: {
      tsearch: {prefix: true}
    }
end
