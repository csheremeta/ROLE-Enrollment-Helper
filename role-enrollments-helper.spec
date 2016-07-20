Name:		role-enrollments-helper
Summary:	Program to help generate spreadsheet with ROLE enrollment requests
Version:	1.0.0
Release:	1%{?release_suffix}%{?dist}
License:	ASL 2.0
URL:		https://github.com/patternfly/rcue
Source0:	ROLE_helper.py
Source1:	ROLE-enrollments.sh
Source2:	role-enrollments-helper.desktop

BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:	noarch
AutoReq:	no
Requires:	desktop-file-utils

%description
Program to help generate spreadsheet with ROLE enrollment requests.

%install
pwd
mkdir -p "%{buildroot}%{_datadir}/%{name}"
mkdir -p "%{buildroot}%{_datadir}/applications"
cp "$RPM_SOURCE_DIR/ROLE_helper.py" "%{buildroot}%{_datadir}/%{name}"
cp "$RPM_SOURCE_DIR/ROLE-enrollments.sh" "%{buildroot}%{_datadir}/%{name}"
cp "$RPM_SOURCE_DIR/role-enrollments-helper.desktop" "%{buildroot}%{_datadir}/applications"
chmod 0755 "%{buildroot}%{_datadir}/%{name}/ROLE_helper.py"
chmod 0755 "%{buildroot}%{_datadir}/%{name}/ROLE-enrollments.sh"
chmod 0644 "%{buildroot}%{_datadir}/applications/role-enrollments-helper.desktop"

%post
update-desktop-database

%postun
update-desktop-database

%files
%{_datadir}/%{name}/
%{_datadir}/applications/role-enrollments-helper.desktop

%changelog
* Wed Jul 20 2016 Candace Sheremeta <cshereme@redhat.com> - 1.0.0-1
- Initial version.

