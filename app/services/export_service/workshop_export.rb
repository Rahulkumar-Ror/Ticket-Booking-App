require "csv"

class ExportService::WorkshopExport
  def initialize(data)
    @data = data
  end

  def to_csv
    attributes = Workshop.column_names
    CSV.generate(headers: true) do |csv|
      csv << attributes

      @data.all.each do |workshop|
        csv << attributes.map { |attr| workshop.send(attr) }
      end
    end
  end
end
