require 'fileutils'

# Configuración para el directorio de reportes
module CucumberReport
  REPORTS_DIR = 'reports'.freeze

  # Método para configurar el directorio de reportes
  def self.prepare_report
    # Crear el directorio si no existe
    FileUtils.mkdir_p(REPORTS_DIR) unless Dir.exist?(REPORTS_DIR)
  end
end

# Hook para preparar el directorio antes de ejecutar las pruebas
Before do
  CucumberReport.prepare_report
end

# Generar un mensaje al finalizar la ejecución
at_exit do
  puts "Cucumber HTML Report should be available in the 'reports' directory."
end