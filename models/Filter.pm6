
use Hiker::Model;
use JSON::Fast;
use HTTP::UserAgent;

class DDG::Stories::Filter does Hiker::Model {
    has $.story-url = 'https://watrcoolr.duckduckgo.com/watrcoolr.js?o=json';

    method bind($req, $res) {
        my $category = $req.params<category>.Str.subst(/'%20'/, ' ') // Any;
        $res.data<category> = $category;
        $res.data<stories> = self.get-stories: $category;

        my $bag = self.get-stories.map(*<category>).Bag;
        $res.data<categories>.append: $bag.kv.map: { (name => $^k.Str, amnt => $^v).Hash };
    }

    method get-stories($category = Any) {
        my HTTP::UserAgent $ua .= new;
        my $res = $ua.get: $!story-url;

        my @posts = (from-json $res.decoded-content).List;
        return @posts.grep({$_<category> ~~ $category}).List;
    }
}
