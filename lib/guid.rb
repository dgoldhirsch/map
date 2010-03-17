# Mockable GUID generator.  In mocking mode, it creates strings of simple integers ("1", "2", etc.), and can be reset to any given integer.
# In production mode, it uses the UUID gem to create a bona fide UUID string.
class Guid
  @@ut_available_guid = 1

  def self.guid()
    # UUIDTools::UUID.timestamp_create
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
