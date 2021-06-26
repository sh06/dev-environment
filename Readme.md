# 设计

[toc]

## 使用
使用以下命令来生成镜像，根据 ``run.sh`` 种使用的名称来创建：

```bash
docker build -t 镜像名称 .
```

然后在目录种运行 ``run.sh`` 来生成容器。

## 网络

使用如下网络：


```bash
docker network create --driver=bridge --subnet=10.0.0.0/8 develop
```

## 文件夹设置

在当前 Git 仓库的同级目录创建需要用到的文件夹，比如 PHP 的项目源代码放在 PHP 文件夹目录下，需要的有如下文件夹：

```
.
├── dev-environment
├── Web
├── Go
│   ├── GOPATH
│   ├── GOROOT
│   └── Project
└── PHP
```


## 网段划分

- MySQL - 10.0.1.0
  - 5.7 - 10.0.1.1 - 3306
- Nginx - 10.0.2.0
  - Nginx - 10.0.2.1 - 80、81、443
- PHP - 10.0.3.0
  - 5.6 - 10.0.3.56 - 9056
  - 7.2 - 10.0.3.72 - 9072
  - 7.3 - 10.0.3.73 - 9073
  - 8.0 - 10.0.3.80 - 9080
- Golang - 10.0.4.0
  - 1.16 - 10.0.4.1 - 10000-10100
- Redis - 10.0.5.0
  - 5 - 10.0.5.1 - 6379
- Node.js - 10.0.6.0
  - 14.16 - 10.0.6.1 - 8000、8080

## 注意

### MySQL

#### 启动失败

**需要修复表**

MySQL 遇到启动失败，查看 error.logs，发现有 ``[ERROR] mysqld: Table 'db' is marked as crashed and should be repaired`` 是这个表坏了需要修复。

这时候使用修复命令：

```
$ myisamchk --recover --quick /path/to/tblName
$ myisamchk --recover /path/to/tblName
$ myisamchk --safe-recover /path/to/tblName
```

所以在 run.sh 创建容器的时候增加一个命令：

```yml
/bin/sh -c "myisamchk --recover --quick /var/lib/mysql/mysql/db"
```

这样启动的时候就是执行这个命令来修复表。

### Go
在本地修改代码的时候，比如使用 GoLand 提示没有设置 GOROOT 很多代码标红，这时候可以用 GoLand 下载 SDK 保存到 GOROOT 目录中。

这样可以切换多个 SDK，便于开发。

### PHP

关于 composer 可以创建一个脚本，创建容器的时候运行获取最新的版本：

```bash
#!/bin/sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
```

### Nginx

想要用不同的 PHP 版本打开项目的时候，修改 ``fastcgi_pass`` 对应的 IP 就可以。
为保证正确，最好在这里写死源代码的目录，PHP 容器中映射的地址。

```nginx
location ~ \.php$ {
    root           html;
    fastcgi_pass   10.0.3.80:9000;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  /data/php$fastcgi_script_name;
    include        fastcgi_params;
}
```

### Node.js

Node.js 只配置了国内源和 npm 的更新。

npm 安装在 /usr/local/lib/node_modules 中，比如 vue-cli 的全局安装也会在这个目录中。

#### Vue

安装 vue/cli 报错找不到 Python

在本机访问容器的 vue 的 ui 和 serve 服务需要执行：

```
npx vue ui -H 0.0.0.0
或
npx vue ui -H 10.0.6.1

npx vue-cli-service serve --host=10.0.6.1
```

