'use strict'

const Database = use('Database')

class ConsumableController {
    async index({ request, response })
    {
        const result = await Database.raw('SELECT * FROM t_consumables');
        console.log(result);
        return response.json(result);
    }
}

module.exports = ConsumableController
