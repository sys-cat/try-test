`Try::Tiny` でこけて大変だった話

PerlでTry-Catchしたくて `Try::Tiny` をインスコして利用してみたら便利だったのでよく使っている。

今日とあるパッケージを作成する際にこんなコードを書いた

```perl
my $test = "test";

try {
  print "$test\n";
} catch {
  warn "error $_";
}

my $temp = undef;
```

するとこんなエラーが出てきた。

```perl
$ perl test.pl
try() encountered an unexpected argument (undef) - perhaps a missing semi-colon before or at error.pl line 16.
```

良くわからんくて大分詰まっていたところ、よくよくドキュメントを見ると…

http://search.cpan.org/~ether/Try-Tiny-0.24/lib/Try/Tiny.pm

```perl
# handle errors with a catch handler
  try {
    die "foo";
  } catch {
    warn "caught error: $_"; # not $@
  };
```

セミコロンついてる！！！！
Try::Tinyのコード的にはセミコロン無いとその後も読んでしまって怒られてしまったということになるのだろうか…
セミコロンを入れて文を区切るって事はこれはif文なんかと同じ処理ではなく無名関数的な処理を行ってるのかな。と。
詳細の処理などはPerl歴浅い人間的に読みきれずに途中で諦めてるので今年はCpanModuleの中身を読める様になれればいいなぁと簡単な抱負も考えたりしてた。
