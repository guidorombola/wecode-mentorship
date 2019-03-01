require 'test/unit'
require_relative 'ejercicio_facturacion'

class FacturacionTest < Test::Unit::TestCase

  def test_promocion_con_descuento_fijo_compuesta_por_dos_productos
    lucas = Cliente.new("Lucas", "Videla", "123 fake st")
    galletitas = Producto.new("Galletitas", 60)
    fideos = Producto.new("Fideos", 40)
    promo_fija = PromocionConDescuentoFijo.new("Promo $30 dto comprando fideos y galletitas",30)
    promo_fija.agregar_unidad_de_compra(galletitas)
    promo_fija.agregar_unidad_de_compra(fideos)
    detalle_promo_fideos_y_galletitas = Detalle.new(promo_fija, 1)
    detalles_factura_1 = [detalle_promo_fideos_y_galletitas]
    factura1 = Factura.new("WeCode", lucas, detalles_factura_1)

    assert_equal(70,factura1.subtotal)
    assert_equal(84.7,factura1.total)
  end

end