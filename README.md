What's ?
===============
chef で使用する MongoDB の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://supermarket.chef.io"

cookbook "mongodb", git: "https://github.com/bageljp/cookbook-mongodb.git"
```

```
berks vendor
```

#### Role and Environment attributes

* sample_role.rb
```ruby
override_attributes(
  "mongodb" => {
    "bind_ip" => "0.0.0.0"
  }
)
```

Recipes
----------

#### mongodb::default
MongoDB のインストールと設定。

Attributes
----------

多分 Usage のサンプルの記載見ればわかると思います。

TODO
----------

* server と client で recipe を分けた方がいい。
