
use Hiker::Route;

class DDG::Stories::CSS does Hiker::Route {
    has $.path     = '/style.css';
    has $.template = 'CSS.mustache';
    has $.model    = 'DDG::Stories::Filter';

    method handler($req, $res) {
        $res.headers<Content-Type> = 'text/css';
    }
}
