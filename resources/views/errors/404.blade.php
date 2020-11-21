<!DOCTYPE html>
<html lang="en-US">
 <head>
         <meta charset="UTF-8" />
        <!-- this line will appear only if the website is visited with an iPad -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.2, user-scalable=yes" />
    
    <meta name="description" content="404 Error">
    <meta name="keywords" content="404 Error">
        
        <title>404</title>
 <link rel="stylesheet" type="text/css" media="all" href="{{ asset('pink') }}/style.css" />
 </head>
 <body>
 <div id="content-index" class="content group" style="margin: 0 auto;">
<img class="error-404-image group" src="{{ asset('pink') }}/images/features/404.png" title="Error 404" alt="404" />
    <div class="error-404-text group">
   <p>We are sorry but the page you are looking for does not exist.
    <br />You could <a href="{{ route('home') }}" style="color: blue;">return to the home page</a> 
      or search using the search box below.</p>          
      </div>
    </div>
</body>          
</html>