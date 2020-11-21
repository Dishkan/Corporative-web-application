<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\SlidersRepository;
use App\Repositories\PortfoliosRepository;
use App\Repositories\ArticlesRepository;
use Config;
use Illuminate\Support\Arr;

class IndexController extends SiteController
{

    public function __construct(SlidersRepository $s_rep, PortfoliosRepository $p_rep, ArticlesRepository $a_rep) {
    	
    	parent::__construct(new \App\Repositories\MenusRepository(new \App\Models\Menu));
    	
    	$this->s_rep = $s_rep;
		$this->p_rep = $p_rep;
		$this->a_rep = $a_rep;
		
    	$this->bar = 'left';
		
    	$this->template = 'pink'.'.index';
		
	}
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $portfolios = $this->getPortfolio();
        
        $content = view('pink'.'.content')->with('portfolios',$portfolios)->render();
        $this->vars = Arr::add($this->vars,'content', $content);
        
        $sliderItems = $this->getSliders();
        
        $sliders = view('pink'.'.slider')->with('sliders',$sliderItems)->render();
        $this->vars = Arr::add($this->vars,'sliders',$sliders);
		
		$this->keywords = 'Home Page';
		$this->meta_desc = 'Home Page';
		$this->title = 'Home Page';
		
		$articles = $this->getArticles();
        
       // dd($articles);
        
        $this->contentRightBar = view('pink'.'.indexBar')->with('articles',$articles)->render();
        
        
        return $this->renderOutput();
    }
	
	    protected function getArticles() {
    	$articles = $this->a_rep->get(['title','created_at','img','alias'],Config::get('settings.home_articles_count'));
    	
    	return $articles;
          }	
	
	    protected function getPortfolio() {
		
		$portfolio = $this->p_rep->get('*',Config::get('settings.home_port_count'));
		
		return $portfolio;
		
	}
	
	    public function getSliders() {
    	$sliders = $this->s_rep->get();
    	
    	if($sliders->isEmpty()) {
			return FALSE;
		}
		
		$sliders->transform(function($item,$key) {
			
			$item->img = Config::get('settings.slider_path').'/'.$item->img;
			return $item;
			
		});
    	
    	
    	return $sliders;
       }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
