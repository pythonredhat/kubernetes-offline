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
#BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-buildroot
BuildRoot: /opt/development/kubernetes-offline
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
install -m 0755 -d $RPM_BUILD_ROOT/opt/kubernetes-offline
cp -R * $RPM_BUILD_ROOT/opt/kubernetes-offline
#cp -R * /opt/kubernetes-offline
#install -m 0755 -d $RPM_BUILD_ROOT/opt/kubernetes-offline 
#install -m 0755 docker-compose.yml $RPM_BUILD_ROOT/opt/elk-service/docker-compose.yml
#install -m 0755 -d $RPM_BUILD_ROOT/opt/elk-service/nginx
#install -m 0755 ./nginx/default.conf $RPM_BUILD_ROOT/opt/elk-service/nginx/default.conf

%clean
rm -rf %{buildroot}

%files
%defattr(0755,root,root,0755)
%dir /opt/kubernetes-offline/playbooks
%dir /opt/kubernetes-offline/roles
/opt/kubernetes-offline/*
#/opt/kubernetes-offline/ansible.cfg
#/opt/kubernetes-offline/kubernetes-offline.spec
#/opt/kubernetes-offline/README.md 
#/opt/kubernetes-offline/playbooks/kubernete-test.yml
#/opt/kubernetes-offline/roles/kubernetes-core/handlers/main.yml
#/opt/kubernetes-offline/roles/kubernetes-core/tasks/main.yml
#/opt/kubernetes-offline/roles/kubernetes-master/tasks/dashboard.yaml
#/opt/kubernetes-offline/roles/kubernetes-master/tasks/init.yaml
#/opt/kubernetes-offline/roles/kubernetes-master/tasks/main.yml
#/opt/kubernetes-offline/roles/kubernetes-master/templates/dashboard-adminuser.yaml.j2
#/opt/kubernetes-offline/roles/kubernetes-master/templates/dashboard.yaml.j2
#/opt/kubernetes-offline/roles/kubernetes-master/templates/kube-flannel.yml.j2
#/opt/kubernetes-offline/roles/kubernetes-test/tasks/main.yml
