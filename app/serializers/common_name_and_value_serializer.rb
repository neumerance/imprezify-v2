class CommonNameAndValueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :value
end
