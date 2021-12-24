module BookHelper
  def name(book)
    book&.name || "NOT PROVIDED"
  end

  def book_status_name(book)
    book&.book_status&.name || "NOT PROVIDED"
  end

  def available_actions(book)
    actions = 'move to cancel, '
    if book.research?
      actions += 'move to in_progress'
    elsif book.in_progress?
      actions += 'move to draft'
    elsif book.draft?
      actions += 'move to revise_and_edit'
    elsif book.revise_and_edit?
      actions += 'move to published'
    end

    actions
  end
end
