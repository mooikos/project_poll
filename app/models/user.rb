# frozen_string_literal: true

class User
  def where(id:)
    table.where(id:)
  end

  def save(id:, name:)
    table.insert(id:, name:)
  end

  def delete_if_present(id:)
    target_record = where(id:)
    return if target_record.count == 0

    target_record.delete
  end

  private

  def table
    DB[:users]
  end
end
