QT     = gui core dbus
TARGET = $$qtLibraryTarget(mlite)
TEMPLATE = lib

CONFIG += link_pkgconfig
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

pcfiles.files += mlite.pc
pcfiles.path += $$INSTALL_ROOT/usr/lib/pkgconfig

headers.files += $$INSTALL_HEADERS
headers.path += $$INSTALL_ROOT/usr/include/mlite

target.path += $$[QT_INSTALL_LIBS]

INSTALLS += target headers pcfiles

TRANSLATIONS += $${SOURCES} $${HEADERS} $${OTHER_FILES}
VERSION = 0.0.6
PROJECT_NAME = mlite

dist.commands += rm -fR $${PROJECT_NAME}-$${VERSION} &&
dist.commands += git clone . $${PROJECT_NAME}-$${VERSION} &&
dist.commands += rm -fR $${PROJECT_NAME}-$${VERSION}/.git &&
dist.commands += tar jcpvf $${PROJECT_NAME}-$${VERSION}.tar.bz2 $${PROJECT_NAME}-$${VERSION}
QMAKE_EXTRA_TARGETS += dist
