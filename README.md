prob-wrapper
============

TOJ 出題打包工具

Requirements
============

- Python 3
- pandoc
- tar
- bash

File structure
==============

出題的題目敘述請以 `Markdown` 的格式撰寫，放入 `data` 的資料夾中

所有的測資（input/output）也請用 **數字** 加上 `.in` / `.out` ，並放入 `data` 的資料夾中

```
prob-wrapper
├── README.md
├── data
│   ├── (id).in
│   ├── (id).out
│   └── (problem).md
├── gen-json.py
├── output
│   └── pack.tar.xz
└── prob-wrapper.sh
```

How to use
==========

直接執行 `prob-wrapper.sh` 即可。

```bash
$ ./prob-wrapper.sh
=======================================
# 這邊會清空暫存資料夾與之前的輸出檔案
# 暫存的資料夾我設定為 /tmp/sprout-prob/
# 輸出的資料夾則為當前的 ./output/ 中
Cleanup temp folder...
Cleanup temp folder......Done
=======================================
# 我透過 gen-json.py 這個 script 來生成 OJ 需要的設定
Generate conf.json...
Time limit(in ms): 1000 # 該題目時間限制，單位是毫秒
Memory limit(in bytes): 16384 # 該題目記憶體限制，單位是 Byte
Compile type(g++/makefile): g++ # 除了特別 Judge 以外，請填 g++
How many groups of testcases do you want to put: 2 # OJ 有將多筆測資組成一個群組的功能

Group  1
Group weight? 25 # 此群組佔的分數
Group data?(ex: 1,2) 1 # 在 data 資料夾中，1.in 1.out 屬於這個群組的話，這邊就放 1

Group  2
Group weight? 75 # 此群組佔的分數，建議所有群組總和為 100
Group data?(ex: 1,2) 2,3 # 在 data 資料夾中，2.in 2.out 3.in 3.out 屬於這個群組，所以這邊就放 2,3
Generate conf.json......Done
=======================================
Generate cont.html...
Full file name of your problem markdown(ex: prob.md):
oao.md # 輸入你放在 data 中的題目 markdown 檔案名稱
Generate cont.html......Done
=======================================
Copy input and output file...
Copy input and output file......Done
=======================================
Zip all files to output/pack.tar.xz...
a conf.json
a res
a res/testcase
a res/testcase/1.in
a res/testcase/1.out
a res/testcase/2.in
a res/testcase/2.out
a res/testcase/3.in
a res/testcase/3.out
a http
a http/cont.html
Zip all files to output/pack.tar.xz......Done
# 你現在可以在當前資料夾中的 output 資料夾找到這個壓縮檔案，並把它上傳到 OJ 上
=======================================
```
