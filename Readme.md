# 设计

[toc]

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
│   └── Project
└── PHP
```


## 网段划分

- MySQL - 10.0.1.0
  - 5.7 - 10.0.1.1
- Nginx - 10.0.2.0
  - Nginx - 10.0.2.1
- PHP - 10.0.3.0
  - 5.6 - 10.0.3.56
  - 7.2 - 10.0.3.72
  - 7.3 - 10.0.3.73
  - 8.0 - 10.0.3.80
- Golang - 10.0.4.0
  - 1.16 - 10.0.4.1
- Redis - 10.0.5.0
  - 5 - 10.0.5.1
- Node.js - 10.0.6.0
  - 14.16 - 10.0.6.1

## 注意

### Nginx

想要用不同的 PHP 版本打开项目的时候，修改 ``fastcgi_pass`` 对应的 IP 就可以。
为保证正确，最好在这里写死源代码的目录，PHP 容器中映射的地址。

```nginx
location ~ \.php$ {
    root           html;
    fastcgi_pass   10.0.3.80:9000;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  /var/www$fastcgi_script_name;
    include        fastcgi_params;
}
```

### Node.js

Node.js 只配置了国内源和 npm 的更新。

npm 安装在 /usr/local/lib/node_modules 中，比如 vue-cli 的全局安装也会在这个目录中。

#### Vue

在本机访问容器的 vue 的 ui 和 serve 服务需要执行：

```
npx vue ui -H 0.0.0.0
或
npx vue ui -H 10.0.6.1

npx vue-cli-service serve --host=10.0.6.1
```

