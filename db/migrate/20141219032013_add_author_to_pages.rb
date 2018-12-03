class AddAuthorToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :author, after: :meta_keywords, index: true
  end
end
