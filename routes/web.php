<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::resource('/','\App\Http\Controllers\IndexController',[
									'only' =>['index'],
									'names' => [
										'index'=>'home'
									]
									]);
									
Route::resource('portfolios','\App\Http\Controllers\PortfolioController',[												
													'parameters' => [													
														'portfolios' => 'alias'													
													]													
													]);	
													
Route::resource('articles','\App\Http\Controllers\ArticlesController',[												
												'parameters'=>[												
													'articles' => 'alias'												
												]												
												]);	
												
Route::get('articles/cat/{cat_alias?}',['uses'=>'\App\Http\Controllers\ArticlesController@index','as'=>'articlesCat'])->where('cat_alias','[\w-]+');;

Route::resource('comment','\App\Http\Controllers\CommentController',['only'=>['store']]);

Route::match(['get','post'],'/contacts',['uses'=>'\App\Http\Controllers\ContactsController@index','as'=>'contacts']);

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

Route::group(['prefix' => 'admin','middleware'=> 'auth'],function() {

	Route::get('/',function() {
		
	if(view()->exists('dashboard')) {

		return view('dashboard');
		}		
	});	

	Route::get('/adminIndex',['uses' => '\App\Http\Controllers\Admin\IndexController@index','as' => 'adminIndex']);
	
	Route::resource('/articles_panel','\App\Http\Controllers\Admin\ArticlesController');
	
	Route::resource('/permissions','\App\Http\Controllers\Admin\PermissionsController');
	
	Route::resource('/menus','\App\Http\Controllers\Admin\MenusController');
	
	Route::resource('/users','\App\Http\Controllers\Admin\UsersController');
	
	Route::resource('/portfolios_panel','\App\Http\Controllers\Admin\PortfolioController');
	
});
