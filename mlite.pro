QT     = gui core dbus
if (wayland) {
    TARGET = $$qtLibraryTarget(mlite-wayland)
} else {
    TARGET = $$qtLibraryTarget(mlite-xlib)
}
TEMPLATE = lib

CONFIG += create_pc create_prl no_install_prl link_pkgconfig
PKGCONFIG += gconf-2.0

DEFINES += MLITE_LIBRARY

OBJECTS_DIR = .obj
MOC_DIR = .moc

SOURCES += \
    mgconfitem.cpp \
    mdesktopentry.cpp \
	mfiledatastore.cpp


HEADERS += \
    mdesktopentry_p.h \
    mdesktopentry.h \
    mgconfitem.h \
	mlite-global.h \
    mfiledatastore.h \
    mfiledatastore_p.h \
    mdataaccess.h \
	mdatastore.h \
	MGConfItem

INSTALL_HEADERS += \
    mgconfitem.h \
    mdesktopentry.h \
    mlite-global.h \
    mfiledatastore.h \
	MGConfItem

headers.files += $$INSTALL_HEADERS
if (wayland) {
    headers.path = $$INSTALL_ROOT/usr/include/mlite-wayland
} else {
    headers.path = $$INSTALL_ROOT/usr/include/mlite-xlib
}

QMAKE_PKGCONFIG_NAME = $$target.name
QMAKE_PKGCONFIG_DESCRIPTION = mlite classes
QMAKE_PKGCONFIG_LIBDIR = $$target.path
if (wayland) {
    QMAKE_PKGCONFIG_INCDIR = $$headers.path
} else {
    QMAKE_PKGCONFIG_INCDIR = $$headers.path
}
QMAKE_PKGCONFIG_DESTDIR = pkgconfig

target.path += $$[QT_INSTALL_LIBS]

INSTALLS += target headers

TRANSLATIONS += $${SOURCES} $${HEADERS} $${OTHER_FILES}
VERSION = 0.1.2
PROJECT_NAME = mlite

dist.commands += rm -fR $${PROJECT_NAME}-$${VERSION} &&
dist.commands += git clone . $${PROJECT_NAME}-$${VERSION} &&
dist.commands += rm -fR $${PROJECT_NAME}-$${VERSION}/.git &&
dist.commands += tar jcpvf $${PROJECT_NAME}-$${VERSION}.tar.bz2 $${PROJECT_NAME}-$${VERSION}
QMAKE_EXTRA_TARGETS += dist
