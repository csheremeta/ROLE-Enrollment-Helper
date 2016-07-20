PACKAGE_NAME=role-enrollments-helper
VERSION=1.0.0
MILESTONE=
ifneq ($(MILESTONE),)
SUFFIX:=_$(MILESTONE)
endif
PACKAGE_VERSION=$(VERSION)$(SUFFIX)
PACKAGE_RPM_VERSION=$(VERSION)
# for milestones
#PACKAGE_RPM_RELEASE=0.0.$(MILESTONE)
# for releases

PREFIX=/usr/local
PKG_DATA_DIR=$(PREFIX)/$(PACKAGE_NAME)

all:	dist

dist:	role-enrollments-helper.spec
	mkdir -p "$(PACKAGE_NAME)-$(VERSION)"
	cp ROLE-enrollments.sh "$(PACKAGE_NAME)-$(VERSION)"
	cp ROLE_helper.py "$(PACKAGE_NAME)-$(VERSION)"
	cp Makefile "$(PACKAGE_NAME)-$(VERSION)"
	cp role-enrollments-helper.desktop "$(PACKAGE_NAME)-$(VERSION)"
	tar cfvz "$(PACKAGE_NAME)-$(VERSION).tar.gz" \
		"$(PACKAGE_NAME)-$(VERSION)"

