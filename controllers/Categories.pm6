
use Hiker::Route;

class DDG::Stories::Category does Hiker::Route {
    has $.path     = '/:category';
    has $.template = 'List.mustache';
    has $.model    = 'DDG::Stories::Filter';

    method handler($req, $res) {
        $res.headers<Content-Type> = 'text/html';
    }
}
