'use strict'

const Database = use('Database')

class ConsumableController {
    async index({ request, response })
    {
        const result = await Database.raw('SELECT * FROM t_consumables');
        
        let data = [];

        for (const cons of result[0]) {
            let element = [];
            element.push(cons);
            const printers = await Database.raw(`SELECT idPrinter, priName, braName, priValue
                FROM t_printers 
                NATURAL JOIN t_consumables NATURAL JOIN t_brands NATURAL JOIN t_prices 
                WHERE idConsumable = ` + cons.idConsumable + ` 
                GROUP BY idPrinter 
                ORDER BY priValue`);
            
            element.push(printers[0]);
            data.push(element);
        console.log(printers[0]);
        }

        return response.json(data);
    }
}

module.exports = ConsumableController
