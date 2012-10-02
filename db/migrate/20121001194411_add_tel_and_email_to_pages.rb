class AddTelAndEmailToPages < ActiveRecord::Migration
  def change
    add_column :pages, :tel, :string
    add_column :pages, :email, :string
  end
end
