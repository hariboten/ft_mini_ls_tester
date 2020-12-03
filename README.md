# ft_mini_ls_tester

## config
tester.shの4行目、mini_ls_dirを編集してft_mini_lsがある**ディレクトリ**を指定する
```
4: mini_ls_dir=../ft_mini_ls
```

## usage
```
sh tester.sh
```

## script
scriptsディレクトリの中にテストケースの状態を作るshell scriptを追加することでテストケースを追加できます。

## other
（未テスト）
```
sh tester.sh some_script.sh
```
スクリプトを指定して単体テスト

```
sh tester.sh user_script_dir
```
ディレクトリを指定してディレクトリ内のスクリプトをすべてテスト
