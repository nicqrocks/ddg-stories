
use Hiker::Route;

class DDG::Stories::List does Hiker::Route {
    has $.path     = '/';
    has $.template = 'List.mustache';
    has $.model    = 'DDG::Stories::Filter';

    method handler($req, $res) {
        $res.headers<Content-Type> = 'text/html';
    }
}
