class BookStatus < ApplicationRecord
  has_many :books

  RESEARCH = 1
  IN_PROGRESS = 2
  DRAFT = 3
  REVISE_AND_EDIT = 4
  PUBLISHED = 5
  CANCELED = 6

  def research?
    id == RESEARCH
  end

  def in_progress?
    id == IN_PROGRESS
  end

  def draft?
    id == DRAFT
  end

  def revise_and_edit?
    id == REVISE_AND_EDIT
  end

  def published?
    id == PUBLISHED
  end

  def canceled?
    id == CANCELED
  end
end
