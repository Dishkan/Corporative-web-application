<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\PortfoliosRepository;
use App\Http\Requests\PortfolioRequest;
use App\Models\Portfolio;
use App\Models\Filter;
use Gate;

class PortfolioController extends AdminController
{

     public function __construct(PortfoliosRepository $p_rep) {
		
		parent::__construct();
		
		$this->p_rep = $p_rep;
		
		$this->template = 'pink'.'.admin.portfolios';
		
	}
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
		if(Gate::denies('VIEW_ADMIN_ARTICLES')) {
			abort(403);
		}
		
		$this->title = 'Менеджер портфолио';
        
        $portfolios = $this->getPortfolios();
        $this->content = view('pink'.'.admin.portfolios_content')->with('portfolios',$portfolios)->render();
       
        
        return $this->renderOutput(); 
    }
	
	public function getPortfolios() {
	   return $this->p_rep->get();
	}

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //	
		$this->title = "Добавить новое портфолио";
		
		$filters = Filter::select(['id','title','alias'])->get();
		
		$lists = array();
		
		foreach($filters as $filter) {
			if($filter->alias == 'brand-identity') {
				$lists[$filter->alias] = $filter->title;    
			}
			else {
				$lists[$filter->alias] = array();    
			}
		}
		
		$this->content = view('pink'.'.admin.portfolios_create_content')->with('filters', $lists)->render();
		
		return $this->renderOutput();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PortfolioRequest $request)
    {
        //
		$result = $this->p_rep->addPortfolio($request);
		
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
    public function edit(Portfolio $portfolio)
    {
        //$article = Portfolio::where('alias', $alias);
		
		$this->title = 'Реадактирование портфолио - '. $portfolio->title;
		
		$portfolio->img = json_decode($portfolio->img);
		
		
		$filters = Filter::select(['id','title','alias'])->get();
		
		$lists = array();
		
		foreach($filters as $filter) {
			if($filter->alias == 'brand-identity') {
				$lists[$filter->alias] = $filter->title;    
			}
			else {
				$lists[$filter->alias] = array();    
			}
		}
		
		$this->content = view('pink'.'.admin.portfolios_create_content')->with(['filters' =>$lists, 'portfolio' => $portfolio])->render();
		
		return $this->renderOutput();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PortfolioRequest $request, Portfolio $portfolio)
    {
        //
        $result = $this->p_rep->updatePortfolio($request, $portfolio);
		
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
    public function destroy(Portfolio $portfolio)
    {
        //
        $result = $this->p_rep->deletePortfolio($portfolio);
		
		if(is_array($result) && !empty($result['error'])) {
			return back()->with($result);
		}
		
		return redirect('/admin/adminIndex')->with($result);  
        
    }
}
