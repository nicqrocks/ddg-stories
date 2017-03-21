
use Hiker::Route;

class DDG::Stories::Categories does Hiker::Route {
  has $.path     = '/';
  has $.template = 'List.mustache';
  has $.model    = 'DDG::Stories::Filter';

  method handler($req, $res) {
    $res.headers<Content-Type> = 'text/plain';
  }
}
