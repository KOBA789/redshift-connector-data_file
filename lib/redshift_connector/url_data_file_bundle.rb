require 'redshift_connector/url_data_file'
require 'redshift_connector/reader'
require 'redshift_connector/logger'
require 'uri'

module RedshiftConnector
  class UrlDataFileBundle
    def initialize(urls, format: :redshift_csv, logger: RedshiftConnector.logger)
      raise ArgumentError, 'no URL given' if urls.empty?
      reader_class = Reader.get(format)
      @data_files = urls.map {|url| UrlDataFile.new(URI.parse(url), reader_class: reader_class) }
      @logger = logger
      logger.info "reader: #{reader_class}"
    end

    attr_reader :data_files
    attr_reader :logger
  end
end
