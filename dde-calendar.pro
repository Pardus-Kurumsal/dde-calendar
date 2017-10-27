#-------------------------------------------------
#
# Project created by QtCreator 2016-03-17T15:35:18
#
#-------------------------------------------------

QT       += core gui dbus

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = dde-calendar
TEMPLATE = app
CONFIG += link_pkgconfig c++11
PKGCONFIG += dtkbase dtkwidget dtkutil

SOURCES += main.cpp\
    calendarview.cpp \
    calendarwindow.cpp \
    calendardbus.cpp \
    dbuscalendar_adaptor.cpp \
    infoview.cpp \
    spinner.cpp \
    weekindicator.cpp

HEADERS  += calendarwindow.h \
    calendardbus.h \
    calendarview.h \
    constants.h \
    dbuscalendar_adaptor.h \
    infoview.h \
    spinner.h \
    weekindicator.h

RESOURCES += \
    resources.qrc

# Automating generation .qm files from .ts files
CONFIG(release, debug|release) {
    !system($$PWD/translate_generation.sh): error("Failed to generate translation")
    !system($$PWD/translate_desktop.sh): error("Failed to generate translation")
}

target.path = /usr/bin/

desktop_files.files = dde-calendar.desktop
desktop_files.path = /usr/share/applications/

icon_files.files = resources/icon/dde-calendar.svg
icon_files.path = /usr/share/icons/hicolor/scalable/apps/

qm_files.path = /usr/share/dde-calendar/translations/
qm_files.files = translations/*.qm

TRANSLATIONS = translations/dde-calendar.ts

INSTALLS += target desktop_files icon_files qm_files
