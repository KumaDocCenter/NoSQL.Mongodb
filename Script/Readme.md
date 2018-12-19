# Script 目录配置说明

### 目录列表

```
Script
├─hook
│  │  pre-commit
│  │  
│  └─SubModule
│          post-commit
│          
└─sh
    │  CallX.bat
    │  conf.bat
    │  Copy_public_git_To_public.bat
    │  info.bat
    │  init.bat.1
    │  init.bat
    │  ReadConf.bat
    │  repair_public_link.bat
    │  start.bat
    │  submodule.bat
    │  submodule_batch.bat
    │  write_copy_status.bat
    │  YAML
    │  YAMLwrite.bat
    │  Copy_hook_submodule.bat
    │  submodule_hanlde.bat
    │  submodule_sparse_checkout.bat
    │  sparse-checkout
    │  
    └─git_submodule
        └─Template
                Template.add
                Template.bat
                Template.del
                Template.init
                Template.update
```



### 列表说明

* `hook`   ： git钩子根目录。
  * `pre-commit`  ： 父仓库使用的 ==预提交钩子(pre-commit)==  。
  * `SubModule` ： 子模块使用的钩子。
    * `post-commit` ： 提交钩子。



* `sh`  ： 脚本根目录(.bat：Windows专用)。
  * `init.bat` ： (==单分支==)子仓库初始化脚本。将此脚本和Script目录一起复制到子仓库根目录。
  * `init.bat.1` : (==多分支==)子仓库初始化脚本。将此脚本和Script目录一起复制到子仓库根目录。
    * 已停用
  * `CallX.bat`  ： 依赖文件，用于脚本之间的调用。
  * `conf.bat` ： 依赖文件，用于读取配置文件。
  * `Copy_public_git_To_public.bat`  ： 检出public数据库并复制到仓库根目录public下。
    * 可手动执行
  * `ReadConf.bat` ： 根据文件中的配置项进行目录和文件的复制(不包含隐藏文件夹)。
    * 父仓库，==预提交钩子(pre-commit)==  调用。
  * `write_copy_status.bat`  ：写入状态数据到特定文件。
    * 子模块，==提交钩子(post-commit)== 调用。
    * 将通过钩子复制到仓库根目录执行，执行完删除自身。
    * 数据写入`.git\modules\<SubModuleName>`
  * `info.bat`  :  仓库基本配置信息。
    * 可手动执行或被调用。
  * `submodule.bat`  :  依赖文件，用于处理子模块。
  * `submodule_batch.bat`  ： 根据配置文件批处理子模块，在父项目中。
    * 读取配置文件路径：` .git\myconf\submodule`
    * 在子仓库初始化时，会生成相关的配置文件，将其复制到相应的`.git\myconf\submodule\staged` 下。
  * `repair_public_link.bat`  :  修复子模块 public 并检出自定义文件。
  * `YAMLwrite.bat` ： 输出md文件的YAML头。
  * `YAML` ： YAML模版。
  * `start.bat` ： 子仓库初始化启动器。可复制到根目录执行。
  * `Copy_hook_submodule.bat`  ：复制子模块钩子。`submodule.bat`文件调用此脚本
  * `submodule_hanlde.bat` :  子模块处理 脚本调度器。
    * 子仓库初始化，会自动配置脚本变量指向此脚本。
    * 在此脚本中扩展和调用其它脚本。
  * `submodule_sparse_checkout.bat` : 子模块稀疏检出。
    * 当前脚本所在目录需要有 sparse-checkout 文件
  * `sparse-checkout` ： 稀疏检出配置文件。
    * 在脚本中，复制此文件到子模块的相应目录下。
* `git_submodule`  ： git 子模块根目录。
  * `Template`  ： 模版目录。
    * `Template.bat` ：配置文件生成。



