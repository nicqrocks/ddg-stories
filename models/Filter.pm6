
use Hiker::Model;

class DDG::Stories::Filter does Hiker::Model {
  method bind($req, $res) {
    $res.data<who> = 'web!';
  }
}
