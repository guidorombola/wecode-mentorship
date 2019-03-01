class Cliente

  attr_reader :nombre, :apellido, :direccion

  def initialize(nombre, apellido, direccion)
    @nombre = nombre
    @apellido = apellido
    @direccion = direccion
  end

  def to_s
    return "#{@nombre} #{@apellido}\nDireccion: #{@direccion}"
  end
end

class Factura

  attr_reader :nombre_comercio, :cliente, :detalles

  def initialize(nombre_comercio, cliente, detalles)
    @nombre_comercio = nombre_comercio
    @cliente = cliente
    @detalles = detalles
  end

  def subtotal()
    subtotal = 0
    @detalles.each { |detalle| subtotal += detalle.unidad_de_compra.total*detalle.cantidad }
    return subtotal
  end

  def total()
    return subtotal*1.21
  end

  def to_s
    salida = "#{@nombre_comercio}\n\nCliente: #{@cliente}\n\n"
    detalles.each { |detalle| salida += "#{detalle}"+"\n" }
    salida += "-----------------\n\nSubtotal: #{subtotal}\nTotal: #{total}"
  end
end

class Detalle

  attr_reader :unidad_de_compra, :cantidad

  def initialize(unidad_de_compra, cantidad)
    @unidad_de_compra = unidad_de_compra
    @cantidad = cantidad
  end

  def total()
    return unidad_de_compra.total*@cantidad
  end

  def to_s
    return "Cantidad: #{@cantidad} Descripcion: #{@unidad_de_compra} Precio unitario: #{@unidad_de_compra.total} Precio: #{total}"
  end
end

class Producto

  attr_reader :nombre, :precio

  def initialize(nombre, precio)
    @nombre = nombre
    @precio = precio
  end

  def total()
    return @precio
  end

  def to_s
    return "#{@nombre} #{@precio}"
  end

end

class Promocion

  attr_reader :nombre, :descuento, :unidades_de_compra

  def initialize(nombre, descuento)
    @unidades_de_compra = []
    @nombre = nombre
    @descuento = descuento
  end

  def agregar_unidad_de_compra(unidad_de_compra)
    @unidades_de_compra.push(unidad_de_compra)
  end

  def total()
    total = 0
    @unidades_de_compra.each { |unidad| total += unidad.total }
    return total
  end

  def to_s
    return @nombre
  end

end

class PromocionConDescuentoFijo < Promocion
  def initialize(nombre, monto)
    super
  end

  def total()
    return super - @descuento
  end
end

class PromocionConDescuentoDePorcentaje < Promocion
  def initialize(nombre, porcentaje)
    super
  end

  def total()
    return (super - super*@descuento/100)
  end
end