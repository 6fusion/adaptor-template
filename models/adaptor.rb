class Adaptor < Base
  SETTINGS_FILE = "#{PADRINO_ROOT}/data/settings.json"

  attr_accessor :host,
                :username,
                :password

  def self.load()
    logger.info('Adaptor.load')
    unless File.zero?(SETTINGS_FILE)
      File.open(SETTINGS_FILE, "r") do |file_handle|
        self.new(ActiveSupport::JSON.decode(file_handle))
      end
    end
  end

  def save()
    logger.info('adaptor.save')
    File.open(SETTINGS_FILE, "w") do |file_handle|
      file_handle.write(self.to_json)
    end

    $settings = self
  end
end