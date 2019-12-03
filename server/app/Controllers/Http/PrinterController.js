'use strict'

const Database = use('Database')
const { validate } = use('Validator')

class PrinterController {
  async test() {
    // const result = await Database.raw('select * from users where username = ?', [username])
    const result = await Database.raw('select * from t_printers')
    return result[0]
  }

  async filters({ request, response }) {
    const firstFilter = request.input('firstFilter')
    const firstOrder = request.input('firstOrder')
    const limit = request.input('limit')

    console.log(firstFilter, firstOrder, limit)

    if(firstOrder !== 'ASC' && firstOrder !== 'DESC') {
        return response.json(null)
    }

    const parameters = {filter: firstFilter, order: firstOrder}
    limit ? parameters.limit = limit : parameters.limit = 30

    console.log(parameters)

    const result = await Database.raw(`
      SELECT t_printers.idPrinter as 'show-Id', t_printers.priName as 'show-Nom', t_printers.priSales as 'show-Ventes', t_printers.priWeight as 'show-Poids<br>[kg]',
      t_printers.priPrintSpeed as 'show-Vitesse <br>impression', t_printers.priScanRes as 'show-Resolution <br>numerisation',
      t_brands.braName as 'show-Marque', t_brands.idConstructor,
      t_constructors.conName as 'show-Constructeur',
      t_prices.priValue as 'show-Prix', t_prices.priDate
      FROM t_printers
      INNER JOIN t_brands ON t_brands.idBrands = t_printers.idBrands
      INNER JOIN t_constructors ON t_constructors.idConstructor = t_brands.idConstructor
      INNER JOIN t_prices ON t_prices.idPrinter = t_printers.idPrinter
      WHERE t_prices.idPrice IN (
          SELECT MAX(t_prices.idPrice) FROM t_prices
          GROUP BY t_prices.idPrinter
      )
      ORDER BY :filter: ${firstOrder}
      LIMIT :limit
    `, parameters)
    return response.json(result[0])
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
