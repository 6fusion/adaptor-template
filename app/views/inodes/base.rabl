attribute :uuid
child capabilities: :capabilities do
  attribute :name
end
child networks: :networks do
  attribute :uuid
  attribute :name
  attribute :description
end