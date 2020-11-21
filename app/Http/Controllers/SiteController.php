<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\MenusRepository;
use Illuminate\Support\Arr;

class SiteController extends Controller
{
    //
    protected $p_rep;
    protected $s_rep;
    protected $a_rep;
    protected $m_rep;
	
	protected $keywords;
	protected $meta_desc;
	protected $title;
    
    
    protected $template;
    
    protected $vars = array();
    
    protected $contentRightBar = FALSE;
    protected $contentLeftBar = FALSE;
  
    
    protected $bar = 'no';
    
    
    public function __construct(MenusRepository $m_rep) {
    $this->m_rep = $m_rep;
  }
  
  
  protected function renderOutput() {
    
    
    $menu = $this->getMenu();
    
    //dd($menu);
    $navigation = view('pink'.'.navigation')->with('menu',$menu)->render();
    $this->vars = Arr::add($this->vars,'navigation',$navigation);
	
	if($this->contentRightBar) {
			$rightBar = view('pink'.'.rightBar')->with('content_rightBar',$this->contentRightBar)->render();
			$this->vars = Arr::add($this->vars,'rightBar',$rightBar);
	}
	
	if($this->contentLeftBar) {
			$leftBar = view('pink'.'.leftBar')->with('content_leftBar',$this->contentLeftBar)->render();
			$this->vars = Arr::add($this->vars,'leftBar',$leftBar);
		}
	
	    $this->vars = Arr::add($this->vars,'bar',$this->bar);
	
			
		$this->vars = Arr::add($this->vars,'keywords',$this->keywords);
		$this->vars = Arr::add($this->vars,'meta_desc',$this->meta_desc);
		$this->vars = Arr::add($this->vars,'title',$this->title);
		
		
		
		$footer = view('pink'.'.footer')->render();
		$this->vars = Arr::add($this->vars,'footer',$footer);
    
    return view($this->template)->with($this->vars);
  }
  
  protected function getMenu() {
    
    $menu = $this->m_rep->get();
      $items_menu = array();
      
       foreach($menu as $item) {
        if($item->parent == 0) {      
          $value = array('title' => $item->title, 'path' => $item->path, 'id' => $item->id, 'parent' => $item->parent);
        array_push($items_menu, $value);
        }
		else {      
          $value = array('title' => $item->title, 'path' => $item->path, 'id' => $item->id, 'parent' => $item->parent);
        array_push($items_menu, $value);
        }
       }
	   
       return $items_menu;
    //return $menu;
  }  
}