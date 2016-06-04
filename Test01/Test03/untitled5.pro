#-------------------------------------------------
#
# Project created by QtCreator 2016-04-17T22:30:37
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Test03
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui


#Libs
LIBS += -L"/usr/lib/"

unix|win32: LIBS += -lpqxx-4.0


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../usr/local/Cellar/libpqxx/4.0.1/lib/release/ -lpqxx-4.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../usr/local/Cellar/libpqxx/4.0.1/lib/debug/ -lpqxx-4.0
else:unix: LIBS += -L$$PWD/../../../../../usr/local/Cellar/libpqxx/4.0.1/lib/ -lpqxx-4.0

INCLUDEPATH += $$PWD/../../../../../usr/local/Cellar/libpqxx/4.0.1/include
DEPENDPATH += $$PWD/../../../../../usr/local/Cellar/libpqxx/4.0.1/include

INCLUDEPATH += $$PWD/../../../../../usr/local/Cellar/libpqxx/4.0.2/include
DEPENDPATH += $$PWD/../../../../../usr/local/Cellar/libpqxx/4.0.2/include
