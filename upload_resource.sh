# 说明：
## 由于 git 是每次 commit 都会保存一个版本，这导致当前目录下的 .git 文件过于庞大
## 而本库只用作保存资源文件，不考虑版本更替
## 所以在每次提交前将删除 .git 文件，然后强 push 到远端
## 这样控制了本地文件夹大小，也确保远端仓库每次都只有1个 commit
## 缺陷：由于每次都是完整上传，所以上传耗时较之前会长一些
## 由于 gitee 支持 svn， 而其是增量更新，所以当文件数量上涨时可考虑切换到 SVN 上传。

# 执行步骤：
## 删除 .git 文件夹
rm -rf ./.git/

## 重新初始化仓库
git init
## 将本地资源添加到暂存区
git add . && git com "Upload resources on `date`"
## 添加远端仓库地址
git remote add origin git@gitee.com:fcbHank/MyResource.git
## 强 push 到远端（因为每次都删除了.git文件，所以肯定与远端库不同步）
git push -u -f origin master

# 显示当前仓库占用本地空间大小
echo "当前仓库占用本地空间大小如下所示"
du -sh ../MyResource/
