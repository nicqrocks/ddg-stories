
use Hiker::Model;
use JSON::Fast;
use HTTP::UserAgent;

class DDG::Stories::Filter does Hiker::Model {
    has $.story-url = 'https://watrcoolr.duckduckgo.com/watrcoolr.js?o=json';
    has @.posts;

    method bind($req, $res) {
        my Any $category = $req.params<category>;
        if $category.defined {
            $category = $category.gist.subst(/'%20'/, ' ');
        }
        $res.data<category> = $category.gist;
        $res.data<stories> = self.get-stories: $category;

        my $bag = self.get-stories.map(*<category>).Bag;
        $res.data<categories>.append:
            $bag.kv.map: { (name => $^k.Str, amnt => $^v).Hash };
    }

    method get-stories($category = Any) {
        unless @!posts {
            my $res = HTTP::UserAgent.new.get: $!story-url;
            @!posts = (from-json $res.decoded-content).List;
        }

        return @!posts.grep({$_<category> ~~ $category}).List;
    }

}
