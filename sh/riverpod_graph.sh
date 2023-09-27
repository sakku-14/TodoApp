#!/bin/bash
# riverpod_graphについては以下参照
# https://github.com/rrousselGit/riverpod/tree/master/packages/riverpod_graph

# riverpod_graphコマンドを有効化方法する際のコマンドは以下
# dart pub global activate -sgit https://github.com/rrousselGit/riverpod.git --git-path packages/riverpod_graph

# riverpod_graphコマンドを有効化し、プロジェクトフォルダ直下（libフォルダと同階層）で下記コマンド実行
dart pub global run riverpod_graph . > graph.md