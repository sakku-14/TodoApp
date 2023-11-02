# Todoアプリ
一般的なTodoアプリに各Todoの優先順位をつける指標に『緊急度x重要度』という概念を追加したアプリです。
この概念により、ユーザーが本当に優先すべきTodoが一目で分かり、今まで以上に抱えているタスクを効率良くこなせるようになります。
<img src="https://github.com/sakku-14/TodoApp/assets/65479630/36a60f85-8f4d-46e4-b95d-4848c9386023" width="400">

## Todoアプリの機能
- Todoを追加・編集・削除できる
- Todoを「追加時刻」「緊急度x重要度」でソートできる
- Todoの状態を「未着手」「作業中」「保留」「完了」の４種類設定できる

|Top画面|Todo登録画面|Todo更新画面|削除・編集ボタン|
|---|---|---|---|
|<img src="https://github.com/sakku-14/TodoApp/assets/65479630/486c6b61-900c-4833-810e-2a1d6ae7b881" width="200">|<img src="https://github.com/sakku-14/TodoApp/assets/65479630/1d6c7a1f-21a5-442b-8b62-76c665eef811" width="200">|<img src="https://github.com/sakku-14/TodoApp/assets/65479630/3df42e70-2cb3-44d0-bfc3-7c57df447e43" width="200">|<img src="https://github.com/sakku-14/TodoApp/assets/65479630/d7957237-6031-4a2f-a53c-3fbf4f7183c7" width="200">|

## デモ
https://github.com/sakku-14/TodoApp/assets/65479630/458b19c0-3d8d-4c88-ae7c-ea8dcc71e018

## 実行
### 実行環境
- Dart
  - 3.1.2
- Flutter
  - 3.13.4
- XCode
  - 15.0
### 実行手順
#### Dart/Flutterバージョン指定
[asdf](https://asdf-vm.com/)にてプロジェクトのバージョン管理をしているので、そのバージョン設定方法を以下に記載する
<details>
  <summary>asdfの導入方法(必要な方は左の▶️をクリックすると手順確認できます)</summary>
  <ol>
  <li>asdfのインストール<br><code>brew install asdf</code></li>
  <li>M1 Macの場合は以下のコマンドを実行してください<br>（以下コードはzshを指定してるので、別のシェルを使用してる場合は適宜書き換えてください）<br><code>echo -e "n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.zshrc</code></li>
  </ol>
</details>

<br>

1. Dart/Flutterプラグインの追加
    ```bash
    asdf plugin-add dart
    asdf plugin-add flutter
    ```
2. Dart/Flutter SDKのインストール
    ```bash
    asdf install dart 3.1.2
    asdf install flutter 3.13.4
    ```
3. Dart/Flutter SDKの指定
    ```bash
    asdf local dart 3.1.2
    asdf local flutter 3.13.4
    ```

#### アプリ実行
プロジェクトフォルダ内にて以下コマンド実行
```bash
flutter run
```

#### integration_test実行
プロジェクトフォルダ内にて以下コマンド実行
```bash
flutter test integration_test --dart-define=projectRoot=$(pwd)
```
##### integration_testデモ
https://github.com/sakku-14/TodoApp/assets/65479630/8697c7db-b0a0-4bdc-aec5-fdaa11e7f7ef

## ProviderとWidgetの相関関係
以下は[Riverpod Graph](https://github.com/rrousselGit/riverpod/tree/master/packages/riverpod_graph)にて生成
![Riverpod Graph](https://github.com/sakku-14/TodoApp/assets/65479630/a7415fe6-c2bb-4c45-af82-d3504a5ebddb)
