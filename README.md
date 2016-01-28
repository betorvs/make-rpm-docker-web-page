# Make a RPM from tar.gz for simple websties
# Gerando RPM a partir de um tar.gz contendo um simples site.

## First, make a clone from this repository.
## Primeiro, faça o clone deste repositório.

## Inside your directory, you see this:
## Dentro do seu diretorio voce terá estes arquivos:

build.sh test.sh website.spec website-1.0.0.0.tar.gz

## Remember, you need change this settings inside website.spec if you need to change the version and source.
## Altere o website.spec nos parametros Version, Release e Source para ajustar a versão, como exemplo:

Version:	1.0.0
Release:	0%{?dist}
...
Source0:	website-1.0.0.0.tar.gz

## For a build, use this command.
## Execute o build. Voce usará o docker para isso. Ira compilar no centos5 devido ao servidor do website.

./build.sh website.spec website website-1.0.0.0.tar.gz

## This command above make the RPM for you.
## O comando acima alem de compilar o rpm, cria o diretorio website onde foi executado.

## Test this RPM with this simple script test.sh:
## Execute um teste de instalação com o script test.sh:

./test.sh test website-1.0.0-0.noarch.rpm website

## How to adapt for my website with more archives:
## Como adaptar este website para mais arquivos:

Adjust the section %files inside website.spec with all new directories and files.
Arrume a sessão %files dentro do website.spec com todos os novos diretórios e arquivos.

## How to contribute
## Como contribuir

Make a fork and have fun!
Faça um fork e se divirta!

## Release
First version (Primeira versão de) Roberto Scudeller - beto.rvs (at) gmail.com
