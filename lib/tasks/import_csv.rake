require 'csv'

namespace :csv do
  desc "Importa palavras do dicionário a partir de um arquivo CSV"
  task import: :environment do
    file_path = 'C:/Users/jvito/Downloads/arquivo.csv'

    # Verifique se o arquivo CSV está sendo corretamente lido
    CSV.foreach(file_path, headers: true, col_sep: ';', quote_char: '"') do |row|
      # Mostra o conteúdo da linha para depuração
      puts "Linha do CSV: #{row.inspect}"

      # Tenta criar uma palavra a partir de cada linha do CSV
      word = Word.create(
        term: row['term'],
        definition: row['definition']
      )

      # Verifica se houve erro ao criar o registro
      if word.persisted?
        puts "Palavra importada: #{word.term}"
      else
        puts "Erro ao importar palavra: #{word.errors.full_messages.join(', ')}"
      end
    end

    puts "Importação completa!"
  end
end