<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Http\Requests\MenusRequest;
use App\Repositories\MenusRepository;
use App\Repositories\ArticlesRepository;
use App\Repositories\PortfoliosRepository;
use Gate;


class MenusController extends AdminController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	 
	protected $m_rep;
    
    
    public function __construct(MenusRepository $m_rep, ArticlesRepository $a_rep, PortfoliosRepository $p_rep)
    {
        parent::__construct();
        
        $this->m_rep = $m_rep;
        $this->a_rep = $a_rep;
        $this->p_rep = $p_rep;
        
        $this->template = 'pink'.'.admin.menus';
        
        //
    }
	 
    public function index()
    {
        //
		if(Gate::denies('VIEW_ADMIN_MENU')) {
			abort(403);	
		} 
		
		$this->title = "Менеджер меню";
		
		$menu = $this->getMenus();
        
        $this->content = view('pink'.'.admin.menus_content')->with('menus',$menu)->render();
        
        return $this->renderOutput();
    }
	
	
	public function getMenus()
    {
        //		
    $menu = $this->m_rep->get();
      $items_menu = array();
      
       foreach($menu as $item) {
        if($item->parent == 0) {      
          $value = array('title' => $item->title, 'path' => $item->path, 'id' => $item->id,'parent' => $item->parent);
        array_push($items_menu, $value);
        }
		else {      
          $value = array('title' => $item->title, 'path' => $item->path, 'id' => $item->id,'parent' => $item->parent);
        array_push($items_menu, $value);
        }
       }
	   
       return $items_menu;
    //return $menu;
    }	
	
	public function getMenusParentIds()
    {
        //		
    $menu = $this->m_rep->get();
      $items_menu = array();
      
       foreach($menu as $item) {
        if($item->parent == 0) {      
          $value = array($item->id => $item->title);
        array_push($items_menu, $value);
        }
		else {      
          $value = array($item->id => $item->title);
        array_push($items_menu, $value);
        }
       }
	   
       return $items_menu;
    //return $menu;
    }
	

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    	
    	$this->title = 'Новый пункт меню';
    	
    	$menus = $this->getMenus();
		
		$menus_parent_ids = $this->getMenusParentIds();
    	
    	$categories = \App\Models\Category::select(['title','alias','parent_id','id'])->get();
    	
    	$list = array();
    	$list = Arr::add($list,'0','Не используется');
    	$list = Arr::add($list,'parent','Раздел блог');
    	
    	foreach($categories as $category) {
			if($category->parent_id == 0) {
				$list[$category->title] = array();
			}
			else {
				$list[$categories->where('id',$category->parent_id)->first()->title][$category->alias] = $category->title;
			}
		}
    	
    	$articles = $this->a_rep->get(['id','title','alias']);
    	
		//null is first element
    	$articles = $articles->reduce(function ($returnArticles, $article) {
		    $returnArticles[$article->alias] = $article->title;
		    return $returnArticles;
		}, []);
		
		
		$portfolios = $this->p_rep->get(['id','alias','title'])->reduce(function ($returnPortfolios, $portfolio) {
		    $returnPortfolios[$portfolio->alias] = $portfolio->title;
		    return $returnPortfolios;
		}, []);
		
		$this->content = view('pink'.'.admin.menus_create_content')->with(
		['menus'=>$menus,'menus_parent_ids'=>$menus_parent_ids,
		'categories'=>$list,'articles'=>$articles,
		'portfolios' => $portfolios])->render();	
		
		
		return $this->renderOutput();
		
 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(MenusRequest $request)
    {
        //
        $result = $this->m_rep->addMenu($request);
		
		if(is_array($result) && !empty($result['error'])) {
			return back()->with($result);
		}
		
		return redirect('/admin/adminIndex')->with($result);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(\App\Models\Menu $menu)
    {
        //
        //dd($menu);
        
        $this->title = 'Редактирование ссылки - '.$menu->title;
        
        $type = FALSE;
        $option = FALSE;
        
        //path - http://company.loc/articles
        $route = app('router')->getRoutes()->match(app('request')->create($menu->path));       
        
        $aliasRoute = $route->getName();
        $parameters = $route->parameters();
        
       // dump($aliasRoute);
       // dump($parameters);
        
        if($aliasRoute == 'articles.index' || $aliasRoute == 'articlesCat') {
			$type = 'blogLink';
			$option = isset($parameters['cat_alias']) ? $parameters['cat_alias'] : 'parent';
		}
		
		else if($aliasRoute == 'articles.show') {
			$type = 'blogLink';
			$option = isset($parameters['alias']) ? $parameters['alias'] : '';
		
		}
		
		else if($aliasRoute == 'portfolios.index') {
			$type = 'portfolioLink';
			$option = 'parent';
		
		}
		
		else if($aliasRoute == 'portfolios.show') {
			$type = 'portfolioLink';
			$option = isset($parameters['alias']) ? $parameters['alias'] : '';
		
		}
		
		else {
			$type = 'customLink';
		}
		
		
    	$menus = $this->getMenus();
		
		$menus_parent_ids = $this->getMenusParentIds();
    	
    	$categories = \App\Models\Category::select(['title','alias','parent_id','id'])->get();
    	
    	$list = array();
    	$list = Arr::add($list,'0','Не используется');
    	$list = Arr::add($list,'parent','Раздел блог');
    	
    	foreach($categories as $category) {
			if($category->parent_id == 0) {
				$list[$category->title] = array();
			}
			else {
				$list[$categories->where('id',$category->parent_id)->first()->title][$category->alias] = $category->title;
			}
		}
    	
    	$articles = $this->a_rep->get(['id','title','alias']);
    	
    	$articles = $articles->reduce(function ($returnArticles, $article) {
		    $returnArticles[$article->alias] = $article->title;
		    return $returnArticles;
		}, []);
		
		
		$filters = \App\Models\Filter::select('id','title','alias')->get()->reduce(function ($returnFilters, $filter) {
		    $returnFilters[$filter->alias] = $filter->title;
		    return $returnFilters;
		}, ['parent' => 'Раздел портфолио']);
		
		$portfolios = $this->p_rep->get(['id','alias','title'])->reduce(function ($returnPortfolios, $portfolio) {
		    $returnPortfolios[$portfolio->alias] = $portfolio->title;
		    return $returnPortfolios;
		}, []);
		
		$this->content = view('pink'.'.admin.menus_create_content')->with(['menu' => $menu,'type' => $type,'option' => $option,'menus'=>$menus,'menus_parent_ids'=>$menus_parent_ids,'categories'=>$list,'articles'=>$articles,'filters' => $filters,'portfolios' => $portfolios])->render();
		
		
		
		return $this->renderOutput();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, \App\Models\Menu $menu)
    {
        //
		$result = $this->m_rep->updateMenu($request,$menu);
		
		if(is_array($result) && !empty($result['error'])) {
			return back()->with($result);
		}
		
		return redirect('/admin/adminIndex')->with($result);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(\App\Models\Menu $menu)
    {
        //
        
        //
        $result = $this->m_rep->deleteMenu($menu);
		
		if(is_array($result) && !empty($result['error'])) {
			return back()->with($result);
		}
		
		return redirect('/admin/adminIndex')->with($result);
    }
}
