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

Route.post('/filters', 'PrinterController.filters') // 1
Route.get('/printers/:id', 'PrinterController.show') // 3, 10
Route.get('/consumables', 'ConsumableController.index') // 11

