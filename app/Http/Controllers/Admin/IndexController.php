<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Gate;
use App\Models\User;

class IndexController extends AdminController
{
    //
	 public function __construct() {
		
		parent::__construct();
		
		$this->template = 'pink'.'.admin.index';
		
	}
	
	public function index() {
	
		if(Gate::denies('view_admin', new User)) {
			abort(403);
		}
		
		$this->title = 'Панель администратора';
		
		return $this->renderOutput();
		
	}
}
