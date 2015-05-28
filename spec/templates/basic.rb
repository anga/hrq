match /\AI want all ([a-z_]+[a-z0-9_]*)/i do |table_name|
  select(table_name)
end

# Match with weight
match /\AI want all deleted ([a-z_]+[a-z0-9_]*)/i, weight: 10 do |table_name|
  # Pending....
end