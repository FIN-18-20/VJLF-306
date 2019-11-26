'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URLs and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')

Route.get('/', 'PrinterController.test') // test route

Route.get('/brand', 'PrinterController.brand') // 1
Route.get('/size-weight', 'PrinterController.size') // 2
Route.get('/constructor', 'PrinterController.constructor') // 4
Route.get('/sell', 'PrinterController.sell') // 5
Route.get('/speed', 'PrinterController.speed') // 6
Route.get('/resolution', 'PrinterController.resolution') // 7
Route.get('/price', 'PrinterController.price') // 8
Route.get('/constructor-price', 'PrinterController.constructorPrice') // 9
Route.get('/printers/:id', 'PrinterController.show') // 3, 10
Route.get('/consumables', 'ConsumableController.index') // 11

