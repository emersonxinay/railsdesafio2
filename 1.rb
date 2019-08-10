=begin
1) Objetos y archivos
El archivo `casino.txt` contiene las recaudaciones de 4 días de un casino separadas por mesa de
juego.
Se pide:
Crear una clase Table cuyo constructor reciba el nombre de la mesa y las recaudaciones
correspondientes de cada día.
Hint: El constructor debe recibir 5 argumentos. Uno para el nombre de la mesa y los
demás para cada recaudación correspondiente a esa mesa.
Crear un método que permita leer el archivo e instanciar un objeto de la clase Table por cada
línea del archivo.
Crear métodos que permitan:
Conocer el mayor valor recaudado, por mesa, y el nombre de la mesa y día corresponde
(día 1, día 2, día 3 o día 4).
Calcular el promedio total de lo recaudado por todas las mesas en todos los días.
=end


class Table
  attr_reader :tablename, :collecdia
 def initialize(tablename, *collecdia)
 @tablename = tablename
 @collecdia = collecdia.map(& :to_i)
 end
 def maximo
   @collecdia.max
 end
 def promedio
   @collecdia.sum / @collecdia.size.to_f
 end
end

file = File.open('casino.txt','r')
data = file.readlines
file.close
table_list = []
data.each do |lines|
  line = lines.split(', ')
  table_list << Table.new(*line)
end
 table_list.each_with_index do |t, i| # te ayuda a mejorar
   puts " #{t.tablename} recaudo #{t.maximo} el dia #{i}"
 end
 promedios = table_list.map(&:promedio)
 puts "#{promedios.sum / promedios.size.to_f}"
