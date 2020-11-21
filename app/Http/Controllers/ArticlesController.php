<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\PortfoliosRepository;
use App\Repositories\ArticlesRepository;
use App\Repositories\CommentsRepository;
use App\Models\Category;
use Illuminate\Support\Arr;

class ArticlesController extends SiteController
{
    //
	     public function __construct(PortfoliosRepository $p_rep, ArticlesRepository $a_rep, CommentsRepository $c_rep) {
    	
    	parent::__construct(new \App\Repositories\MenusRepository(new \App\Models\Menu));
    	
    	$this->p_rep = $p_rep;
    	$this->a_rep = $a_rep;
    	$this->c_rep = $c_rep;
    	
    	$this->bar = 'right';
    	
    	$this->template = 'pink'.'.articles';
		
	}
	
	public function index($cat_alias = FALSE)
    {
        //
		
        $this->title = 'Áëîã';
		$this->keywords = 'String';
		$this->meta_desc = 'String';
        
        $articles = $this->getArticles($cat_alias);
		
		$content = view('pink'.'.articles_content')->with('articles',$articles)->render();
        $this->vars = Arr::add($this->vars,'content',$content);
		
		$comments = $this->getComments(config('settings.recent_comments'));
        $portfolios = $this->getPortfolios(config('settings.recent_portfolios'));

        
        $this->contentRightBar = view('pink'.'.articlesBar')->with(['comments' => $comments,'portfolios' => $portfolios]);
        
        return $this->renderOutput();
    }
	
	public function getComments($take) {
		
		$comments = $this->c_rep->get(['text','name','email','site','article_id','user_id'],$take);
		
		if($comments) {
			$comments->load('article','user');
		}
		
		return $comments;
	}
	
	public function getPortfolios($take) {
		$portfolios = $this->p_rep->get(['title','text','alias','customer','img','filter_alias'],$take);
		return $portfolios;
	}
    
    public function getArticles($alias = FALSE) {
	
	    $where = FALSE;
    	
    	if($alias) {
    		// WHERE `alias` = $alias
			$id = Category::select('id')->where('alias',$alias)->first()->id;
			//WHERE `category_id` = $id
			$where = ['category_id',$id];
			
		}
		
		$articles = $this->a_rep->get(['id','title','alias','created_at','img','desc','user_id','category_id','keywords','meta_desc'],FALSE,TRUE,$where);
		
		if($articles) {
			$articles->load('user','category','comments');
		}
		
		return $articles;
		
	}
	
	public function show($alias = FALSE) {
		
		$article = $this->a_rep->one($alias,['comments' => TRUE]);
		
		if($article) {
			$article->img = json_decode($article->img);
		}
		
		//dd($article->comments->groupBy('parent_id'));
		
		if(isset($article->id)) {
			$this->title = $article->title;
			$this->keywords = $article->keywords;
			$this->meta_desc = $article->meta_desc;
		}
		
		$content = view('pink'.'.article_content')->with('article',$article)->render();
		$this->vars = Arr::add($this->vars,'content',$content);
		
		
		$comments = $this->getComments(config('settings.recent_comments'));
        $portfolios = $this->getPortfolios(config('settings.recent_portfolios'));

        
        $this->contentRightBar = view('pink'.'.articlesBar')->with(['comments' => $comments,'portfolios' => $portfolios]);
		
		
		return $this->renderOutput();
	}	
}
