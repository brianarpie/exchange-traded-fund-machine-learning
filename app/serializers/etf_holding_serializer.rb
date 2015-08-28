class EtfHoldingSerializer < ActiveModel::Serializer
  attributes :etf_name, :holding_name

  puts "its loaded!"

  def etf_name
    object.etf.name
  end

  def holding_name
    object.holding ? object.holding.name : nil
  end

end