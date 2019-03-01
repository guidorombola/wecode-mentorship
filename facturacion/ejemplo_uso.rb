require_relative 'ejercicio_facturacion'

lucas = Cliente.new("Lucas", "Videla", "123 fake st")

galletitas = Producto.new("Galletitas", 60)
fideos = Producto.new("Fideos", 40)
jabon = Producto.new("Jabon", 100)
pan = Producto.new("Pan", 50)

promo_fija = PromocionConDescuentoFijo.new("Promo $30 dto comprando fideos y galletitas",30)
promo_de_promos = PromocionConDescuentoFijo.new("Promocion de promociones", 10)
promo_porcentaje = PromocionConDescuentoDePorcentaje.new("Promo 20% dto en fideos", 20)

promo_fija.agregar_unidad_de_compra(galletitas)
promo_fija.agregar_unidad_de_compra(fideos)
promo_porcentaje.agregar_unidad_de_compra(fideos)
promo_de_promos.agregar_unidad_de_compra(promo_porcentaje)
promo_de_promos.agregar_unidad_de_compra(pan)

#puts promo_fija.total
#puts promo_porcentaje.total
detalle_promo_fideos_y_galletitas = Detalle.new(promo_fija, 2)
detalle_promo_fideos_porcentaje = Detalle.new(promo_porcentaje, 1)
detalle_promo_de_promos = Detalle.new(promo_de_promos, 1)
detalle_jabon = Detalle.new(jabon, 3)
#puts detalle_promo_fideos_y_galletitas.total
#puts detalle_promo_fideos_porcentaje.total
detalles_factura_1 = [detalle_promo_fideos_y_galletitas, detalle_promo_fideos_porcentaje, detalle_promo_de_promos,
                      detalle_jabon]

factura1 = Factura.new("WeCode", lucas, detalles_factura_1)
#puts factura1.subtotal
#puts factura1.total
puts factura1.to_s
