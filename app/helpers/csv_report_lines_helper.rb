module CsvReportLinesHelper
  def truncate_last(number,positions)
    unless number.length == 0
      return "~#{number.to_s.last(positions)}"
    else
      return ""
    end
  end#truncate_last()

  def format_device_name(model)
    if model.upcase == "EQUIPO DESCONOCIDO"
      return "DESCONOCIDO"
    else
      return model.sub(" T","").sub(" LTE","").sub(" NB","")
    end
  end
end#module
