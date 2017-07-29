Sequel.migration do
  up do
    create_table(:domains) do
      primary_key :id
      String :name, :null=>false
      Timestamp :processed_at
    end
  end

  down do
    drop_table(:domains)
  end
end
