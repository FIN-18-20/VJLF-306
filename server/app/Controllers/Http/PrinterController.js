'use strict'

const Database = use('Database')

class PrinterController {
  async test() {
    // const result = await Database.raw('select * from users where username = ?', [username])
    const result = await Database.raw('select * from t_printers')
    return result[0]
  }

  async brand() {
    const result = await Database.raw(`
      SELECT t_printers.idPrinter as 'show-Id', t_printers.priName as 'show-Nom', t_printers.priSales as 'show-Ventes', t_printers.idBrands,
      t_prices.priValue as 'show-Prix', t_prices.priDate, t_brands.braName as 'show-Marque', t_brands.idConstructor
      FROM t_printers
      INNER JOIN t_brands ON t_brands.idBrands = t_printers.idBrands
      INNER JOIN t_prices ON t_prices.idPrinter = t_printers.idPrinter
      WHERE t_prices.idPrice IN (
          SELECT MAX(t_prices.idPrice) FROM t_prices
          GROUP BY t_prices.idPrinter
      )
      ORDER BY t_prices.priDate DESC, t_brands.braName
    `)
    return result[0]
  }
}

module.exports = PrinterController
