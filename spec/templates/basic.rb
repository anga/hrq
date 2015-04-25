match /\AI want all ([a-z_]+[a-z0-9_]*)/i do |table_name|
  select(table_name)
end