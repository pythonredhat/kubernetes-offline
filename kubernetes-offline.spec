%define name kubernetes-offline 
%define version 1.0.0
%define unmangled_version 1.0.0
%define unmangled_version 1.0.0
%define release 1

Summary: Kubernetes Offline 
Name: %{name}
Version: %{version}
Release: %{release}
Source0: %{name}-%{unmangled_version}.tar.gz  
License: MIT
Group: Development/Libraries
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-buildroot
Prefix: %{_prefix}
BuildArch: noarch
Vendor: Turbo Python <office@realpython.com>
Url: https://github.com/pythonredhat/kubernetes-offline

#BuildRequires: pyinstaller
#Requires: rh-python3

%description
Kubernetes Offline 

%prep
%setup -q
%build 

%install
mkdir -p /opt/kubernetes-offline 
cp -a kubernetes-offline-%{version}/. $RPM_BUILD_ROOT/
#install -m 0755 -d $RPM_BUILD_ROOT/opt/kubernetes-offline 
#install -m 0755 docker-compose.yml $RPM_BUILD_ROOT/opt/elk-service/docker-compose.yml
#install -m 0755 -d $RPM_BUILD_ROOT/opt/elk-service/nginx
#install -m 0755 ./nginx/default.conf $RPM_BUILD_ROOT/opt/elk-service/nginx/default.conf

%clean
rm -rf %{buildroot}

%files
/opt/kubernetes-offline
%defattr(0755,root,root)