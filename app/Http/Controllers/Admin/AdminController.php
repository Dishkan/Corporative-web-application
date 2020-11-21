<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Auth;
use Gate;


class AdminController extends \App\Http\Controllers\Controller
{
    //
	protected $p_rep;
    
    protected $a_rep;
    
    protected $user;
    
    protected $template;
    
    protected $content = FALSE;
    
    protected $title;
    
    protected $vars;
    
    public function __construct() {
		
	}
	
	public function renderOutput() {
	
		$this->user = Auth::user();

		if(!$this->user) {
			abort(403);
		}
	
		$this->vars = Arr::add($this->vars,'title',$this->title);
		
		$menu = $this->getMenu();
		
		$navigation = view('pink'.'.admin.navigation')->with('menu',$menu)->render();
		$this->vars = Arr::add($this->vars,'navigation',$navigation);
		
		if($this->content) {
			$this->vars = Arr::add($this->vars,'content',$this->content);
		}
		
		$footer = view('pink'.'.admin.footer')->render();
		$this->vars = Arr::add($this->vars,'footer',$footer);
		
		return view($this->template)->with($this->vars);
		
	}
	
	public function getMenu() {
	
	        $admin_menu = array();
			
			if(Gate::allows('VIEW_ADMIN_ARTICLES')) {
				$admin_menu = Arr::add($admin_menu, 'Статьи', 'articles_panel.index');		
			}
			
			$admin_menu = Arr::add($admin_menu, 'Статьи', 'articles_panel.index'); //admin.articles.index		
			$admin_menu = Arr::add($admin_menu, 'Портфолио', 'portfolios_panel.index'); 		
			$admin_menu = Arr::add($admin_menu, 'Меню', 'menus.index');		
			$admin_menu = Arr::add($admin_menu, 'Пользователи', 'users.index'); 	
			$admin_menu = Arr::add($admin_menu, 'Привилегии', 'permissions.index'); 		
	
			return $admin_menu;

	}
}
