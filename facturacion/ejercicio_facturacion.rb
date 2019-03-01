class Cliente

  attr_reader :nombre, :apellido, :direccion

  def initialize(nombre, apellido, direccion)
    @nombre = nombre
    @apellido = apellido
    @direccion = direccion
  end

  def to_s
    "#{@nombre} #{@apellido}\nDireccion: #{@direccion}"
  end
end

class Factura

  attr_reader :nombre_comercio, :cliente, :detalles

  def initialize(nombre_comercio, cliente, detalles)
    @nombre_comercio = nombre_comercio
    @cliente = cliente
    @detalles = detalles
  end

  def subtotal
    @detalles.sum(&:total)
  end

  def total
    subtotal+iva
  end

  def iva
    subtotal*0.21
  end

  def to_s
    salida = "#{@nombre_comercio}\n\nCliente: #{@cliente}\n\n"
    salida += detalles.join "\n"
    salida += "\n-----------------\n\nSubtotal: #{subtotal}\nIVA(21%): #{iva}\nTotal: #{total}"
  end
end

class Detalle

  attr_reader :unidad_de_compra, :cantidad

  def initialize(unidad_de_compra, cantidad)
    @unidad_de_compra = unidad_de_compra
    @cantidad = cantidad
  end

  def total
    unidad_de_compra.total*@cantidad
  end

  def to_s
    "Cantidad: #{@cantidad} Descripcion: #{@unidad_de_compra} Precio unitario: #{@unidad_de_compra.total} Precio: #{total}"
  end
end

class Producto

  attr_reader :nombre, :precio

  def initialize(nombre, precio)
    @nombre = nombre
    @precio = precio
  end

  def total
    @precio
  end

  def to_s
    "#{@nombre}"
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
    @unidades_de_compra << unidad_de_compra
  end

  def total
    @unidades_de_compra.sum(&:total)
  end

  def to_s
    #@nombre
    salida = "Promocion("
    salida += @unidades_de_compra.join("+")
    salida+=") Descuento "
  end

end

class PromocionConDescuentoFijo < Promocion
  def initialize(nombre, monto)
    super
  end

  def total
    super - @descuento
  end

  def to_s
    super + "$#{@descuento}"
  end
end

class PromocionConDescuentoDePorcentaje < Promocion
  def initialize(nombre, porcentaje)
    super
  end

  def total
    super*(100-@descuento)/100
  end

  def to_s
    super + "#{@descuento}%"
  end
end