# create module
module RedshiftConnector
  module Reader
  end
end

require 'redshift-connector/data_file/reader/redshift_csv'
require 'redshift-connector/data_file/reader/csv'
require 'redshift-connector/data_file/reader/tsv'
require 'redshift-connector/data_file/reader/exception'

module RedshiftConnector
  module Reader
    def Reader.get(id)
      Abstract.get_reader_class(id)
    end
  end
end
