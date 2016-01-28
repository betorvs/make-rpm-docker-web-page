Name:		website
Version:	1.0.0
Release:	0%{?dist}
Summary:	Website Static
Group:		Development/Files
License:	Non free
URL:		https://github.com/betorvs/make-rpm-docker-web-page
Source0:	website-1.0.0.0.tar.gz
BuildRoot:	%{_topdir}/%{_tmppath}/%{name}-%{version}-%{release}
BuildArch:	noarch
Prefix:		/var/www/website
Requires(pre): shadow-utils
Requires(postun): shadow-utils

%description
Static files for vitrine for Oi Internet

%prep
%setup -c -n %{name}-%{version}

%build

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/var/www/website
cp -Rip %{_builddir}/%{name}-%{version}/* %{buildroot}/var/www/website
cp %{_builddir}/%{name}-%{version}/.htaccess %{buildroot}/var/www/website/

%pre

%clean
rm -rf %{buildroot}

%postun

%post

%files
%defattr(-,apache,apache,-)
%dir
/var/www/website
/var/www/website/img
%defattr(0644,apache,apache)
/var/www/website/index.html
/var/www/website/.htaccess


%changelog
* Wed Jan 28 2016 - beto.rvs (at) gmail.com
- First package for Webite Static
