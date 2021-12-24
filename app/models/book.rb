class Book < ApplicationRecord
  belongs_to :book_status
  belongs_to :category

  validates :name, presence: true
  validates :book_status_id, presence: true
  validates :category_id, presence: true

  scope :research, -> { where(book_status: BookStatus::RESEARCH) }

  scope :in_progress, -> { where(book_status: BookStatus::IN_PROGRESS) }
  scope :draft, -> { where(book_status: BookStatus::DRAFT) }
  scope :revise_and_edit, -> { where(book_status: BookStatus::REVISE_AND_EDIT) }
  scope :published, -> { where(book_status: BookStatus::PUBLISHED) }

  scope :canceled, -> { where(book_status: BookStatus::CANCELED) }

  scope :last_10_in_progress, -> { self.joins(:book_status).select { |book| book.book_status.in_progress? }.last(10) }

  class << self
    def rating_unrated
      where('rating IS NULL')
    end

    def rating_less_than_1
      where('rating < 1')
    end

    def rating_less_than_2
      where('rating < 2')
    end

    def rating_less_than_3
      where('rating < 3')
    end

    def rating_less_than_4
      where('rating < 4')
    end

    def rating_more_than_4
      where('rating > 4')
    end

    def capitalized_name
      name.capitalize
    end

    def titleize_name
      name.titleize
    end
  end

  def move_to_in_progress
    if research?
      update_column(:book_status_id, BookStatus::IN_PROGRESS)
    else
      errors.add(
        :book_status_id,
        "to set 'in progress' status the book status must be 'research'"
      )
    end
  end

  def move_to_draft
    if in_progress?
      update_column(:book_status_id, BookStatus::DRAFT)
    else
      errors.add(
        :book_status_id,
        "to set 'draft' status the book status must be 'in progress'"
      )
    end
  end

  def move_to_revise_and_edit
    if draft?
      update_column(:book_status_id, BookStatus::REVISE_AND_EDIT)
    else
      errors.add(
        :book_status_id,
        "to set 'revise and edit' status the book status must be 'draft'"
      )
    end
  end

  def move_to_published
    if revise_and_edit?
      update_column(:book_status_id, BookStatus::PUBLISHED)
    else
      errors.add(
        :book_status_id,
        "to set 'published' status the book status must be 'revise and edit'"
      )
    end
  end

  def move_to_canceled
    update_column(:book_status_id, BookStatus::CANCELED)
  end

  enum ownership: {
    total: 1,
    partial: 2
  }

  enum book_status_id: {
    research: 1,
    in_progress: 2,
    draft: 3,
    revise_and_edit: 4,
    published: 5,
    canceled: 6
  }

  enum book_priority: {
    very_high: 1,
    high: 2,
    medium: 3,
    low: 4,
    very_low: 5
  }
end
