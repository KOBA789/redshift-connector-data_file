module RedshiftConnector
  module DataFile
    @logger = nil

    def self.logger
      # REVIEW: Reverse dependency
      @logger || RedshiftConnector&.logger || Rails.logger
    end

    def self.logger=(logger)
      @logger = logger
    end
  end
end
