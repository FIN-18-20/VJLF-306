'use strict'

const Database = use('Database')

class PrinterController {
  async test() {
    // const result = await Database.raw('select * from users where username = ?', [username])
    const result = await Database.raw('select * from t_constructors')[0]
    return result
  }
}

module.exports = PrinterController
