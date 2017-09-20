require 'redshift_connector/abstract_data_file'
require 'net/http'
require 'stringio'

module RedshiftConnector
  class UrlDataFile < AbstractDataFile
    def initialize(url, reader_class:)
      super reader_class: reader_class
      @url = url
    end

    attr_reader :url

    def key
      @url.path
    end

    def open
      http = Net::HTTP.new(@url.host, @url.port)
      http.use_ssl = (@url.scheme.downcase == 'https')
      content = http.start {
        res = http.get(@url.request_uri)
        res.body
      }
      StringIO.new(content)
    end
  end
end
