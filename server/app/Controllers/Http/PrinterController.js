'use strict'

const Database = use('Database')
const { validate } = use('Validator')

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

  async show({ response, params }) {
    const validation = await validate(params.id, { id: 'integer' })
    if (validation.fails()) return response.badRequest('Mauvaise requête')

    const printerQuery = await Database.raw(`
      SELECT t_printers.idPrinter, priName, priWidth, priHeight, priLength, priPrintSpeed, priScanRes, priSales, braName, conName, t_consumables.csbName, t_consumables.csbDescription, t_consumables.csbPrice from t_printers 
      inner join t_brands on t_printers.idBrands = t_brands.idBrands 
      inner join t_constructors on t_constructors.idConstructor = t_brands.idConstructor 
      inner join t_consumables on t_printers.idConsumable = t_consumables.idConsumable 
      where t_printers.idPrinter = ?`, [params.id])
    const pricesQuery = await Database.raw(`SELECT idPrice, priDate, priValue FROM t_prices where t_prices.idPrinter = ?`, [params.id])

    const result = { printer: printerQuery[0][0], prices: pricesQuery[0] }

    return printerQuery[0].length > 0 ? response.ok(result) : response.notFound('Pas de résultat')
  }
}

module.exports = PrinterController
