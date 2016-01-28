# Gerando RPM a partir de um tar.gz contendo um simples site.

## Primeiro, faça o clone deste repositório.

## Dentro do seu diretorio voce terá estes arquivos:

build.sh test.sh website.spec website-1.0.0.0.tar.gz

## Altere o website.spec nos parametros Version, Release e Source para ajustar a versão, como exemplo:

```
Version:	1.0.0
Release:	0%{?dist}
...
Source0:	website-1.0.0.0.tar.gz
```

## Execute o build. Voce usará o docker para isso. Ira compilar no centos6 devido ao servidor do website.

```
./build.sh website.spec website website-1.0.0.0.tar.gz
```

## O comando acima alem de compilar o rpm, cria o diretorio website onde foi executado.

## Execute um teste de instalação com o script test.sh:

```
./test.sh test website-1.0.0-0.el6.noarch.rpm website website
```

## Como adaptar este website para mais arquivos:

Arrume a sessão %files dentro do website.spec com todos os novos diretórios e arquivos.

## Como contribuir

Faça um fork e se divirta!

## Release
Primeira versão de Roberto Scudeller - beto.rvs (at) gmail.com
