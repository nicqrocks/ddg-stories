
use Hiker::Route; 

class MyApp::Route1 does Hiker::Route {
  has $.path     = '/';
  has $.template = 'Route1.mustache';
  has $.model    = 'MyApp::Model1';

  method handler($req, $res) {
    $res.headers<Content-Type> = 'text/plain';
  }
}  
  