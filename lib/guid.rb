class Guid
  @@ut_available_guid = 1

  def self.guid()
    # self.new(UUIDTools::UUID.timestamp_create)
    result = peek
    @@ut_available_guid += 1
    result
  end

  def self.peek()
    @@ut_available_guid.to_s
  end

  def self.reset!(number_or_string)
    @@ut_available_guid = number_or_string.to_i
  end
end
