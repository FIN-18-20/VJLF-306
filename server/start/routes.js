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

Route.get('/filter-printers', 'PrinterController.filter') // 1, 2, 4, 5, 6, 7, 8
Route.get('/multiple-filters-printers', 'PrinterController.multipleFilters') // 9
Route.get('/printers/:id', 'PrinterController.show') // 3, 10

