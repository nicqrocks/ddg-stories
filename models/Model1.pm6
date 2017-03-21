
use Hiker::Model; 

class MyApp::Model1 does Hiker::Model {
  method bind($req, $res) {
    $res.data<who> = 'web!';
  }
}  
  