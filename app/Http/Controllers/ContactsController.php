<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Mail\Mailsender;
use Mail;

class ContactsController extends SiteController
{
    //
	public function __construct() {
    	
    	parent::__construct(new \App\Repositories\MenusRepository(new \App\Models\Menu));
    	
    	
    	$this->bar = 'left';
    	
    	$this->template = 'pink'.'.contacts';
		
	}
	
	public function index(Request $request) {
	
	    	if($request->isMethod('post')) {
			
			$messages = [
			
			'required' => "Поле :attribute обязательно к заполнению",
			'email' => "Поле :attribute должно соответствовать email адресу"
			
			];
			
			$request->validate([
			
			'name' => 'required|max:255',
			'email' => 'required|email',
			'text' => 'required'	
					
			], $messages);
						
			$data = $request->all();
			//dilshodkhudayarov@gmail.com
    	    Mail::to('dilshodkhudayarov@gmail.com')->send(new Mailsender($data));
			return redirect()->route('contacts')->with('status', 'Email успешно отправлен!');	
		}
	
	 	$this->title = 'Контакты';
	 	
	 	$content = view('pink'.'.contact_content')->render();
	 	$this->vars = Arr::add($this->vars,'content',$content);
	 	
	 	$this->contentLeftBar = view('pink'.'.contact_bar')->render();
	 	
	 	return $this->renderOutput();
	}
}
