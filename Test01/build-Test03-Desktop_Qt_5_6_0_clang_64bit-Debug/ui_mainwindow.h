/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.6.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTableView>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QLabel *datenbankname;
    QLabel *ipadresse;
    QLabel *benutzername;
    QLabel *spieler;
    QTableView *spielerTabelle;
    QLabel *passwort;
    QPushButton *pushButton;
    QLabel *port;
    QPushButton *connect;
    QLabel *label;
    QLabel *datenbankname_2;
    QLabel *datenbankname_3;
    QLabel *datenbankname_5;
    QLabel *datenbankname_6;
    QLabel *datenbankname_7;
    QLineEdit *lineEdit;
    QLineEdit *lineEdit_2;
    QLineEdit *lineEdit_3;
    QLineEdit *lineEdit_4;
    QLineEdit *port_2;
    QMenuBar *menuBar;
    QMenu *menuDB_Connection;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(885, 650);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        datenbankname = new QLabel(centralWidget);
        datenbankname->setObjectName(QStringLiteral("datenbankname"));
        datenbankname->setGeometry(QRect(40, 50, 70, 16));
        ipadresse = new QLabel(centralWidget);
        ipadresse->setObjectName(QStringLiteral("ipadresse"));
        ipadresse->setGeometry(QRect(40, 210, 71, 16));
        benutzername = new QLabel(centralWidget);
        benutzername->setObjectName(QStringLiteral("benutzername"));
        benutzername->setGeometry(QRect(50, 120, 59, 16));
        spieler = new QLabel(centralWidget);
        spieler->setObjectName(QStringLiteral("spieler"));
        spieler->setGeometry(QRect(350, 50, 59, 16));
        spielerTabelle = new QTableView(centralWidget);
        spielerTabelle->setObjectName(QStringLiteral("spielerTabelle"));
        spielerTabelle->setGeometry(QRect(350, 80, 501, 441));
        passwort = new QLabel(centralWidget);
        passwort->setObjectName(QStringLiteral("passwort"));
        passwort->setGeometry(QRect(50, 160, 60, 16));
        pushButton = new QPushButton(centralWidget);
        pushButton->setObjectName(QStringLiteral("pushButton"));
        pushButton->setGeometry(QRect(100, 480, 113, 32));
        port = new QLabel(centralWidget);
        port->setObjectName(QStringLiteral("port"));
        port->setGeometry(QRect(80, 250, 33, 16));
        connect = new QPushButton(centralWidget);
        connect->setObjectName(QStringLiteral("connect"));
        connect->setGeometry(QRect(90, 340, 131, 32));
        label = new QLabel(centralWidget);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(90, 380, 161, 16));
        datenbankname_2 = new QLabel(centralWidget);
        datenbankname_2->setObjectName(QStringLiteral("datenbankname_2"));
        datenbankname_2->setGeometry(QRect(130, 50, 49, 16));
        datenbankname_3 = new QLabel(centralWidget);
        datenbankname_3->setObjectName(QStringLiteral("datenbankname_3"));
        datenbankname_3->setGeometry(QRect(130, 120, 39, 16));
        datenbankname_5 = new QLabel(centralWidget);
        datenbankname_5->setObjectName(QStringLiteral("datenbankname_5"));
        datenbankname_5->setGeometry(QRect(130, 160, 27, 16));
        datenbankname_6 = new QLabel(centralWidget);
        datenbankname_6->setObjectName(QStringLiteral("datenbankname_6"));
        datenbankname_6->setGeometry(QRect(130, 210, 69, 16));
        datenbankname_7 = new QLabel(centralWidget);
        datenbankname_7->setObjectName(QStringLiteral("datenbankname_7"));
        datenbankname_7->setGeometry(QRect(130, 250, 33, 16));
        lineEdit = new QLineEdit(centralWidget);
        lineEdit->setObjectName(QStringLiteral("lineEdit"));
        lineEdit->setGeometry(QRect(190, 50, 113, 21));
        lineEdit_2 = new QLineEdit(centralWidget);
        lineEdit_2->setObjectName(QStringLiteral("lineEdit_2"));
        lineEdit_2->setGeometry(QRect(210, 210, 113, 21));
        lineEdit_3 = new QLineEdit(centralWidget);
        lineEdit_3->setObjectName(QStringLiteral("lineEdit_3"));
        lineEdit_3->setGeometry(QRect(180, 160, 113, 21));
        lineEdit_4 = new QLineEdit(centralWidget);
        lineEdit_4->setObjectName(QStringLiteral("lineEdit_4"));
        lineEdit_4->setGeometry(QRect(180, 120, 113, 21));
        port_2 = new QLineEdit(centralWidget);
        port_2->setObjectName(QStringLiteral("port_2"));
        port_2->setGeometry(QRect(190, 250, 113, 21));
        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 885, 22));
        menuDB_Connection = new QMenu(menuBar);
        menuDB_Connection->setObjectName(QStringLiteral("menuDB_Connection"));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);
        QWidget::setTabOrder(port_2, lineEdit_4);
        QWidget::setTabOrder(lineEdit_4, lineEdit_3);
        QWidget::setTabOrder(lineEdit_3, lineEdit_2);
        QWidget::setTabOrder(lineEdit_2, lineEdit);
        QWidget::setTabOrder(lineEdit, connect);
        QWidget::setTabOrder(connect, spielerTabelle);
        QWidget::setTabOrder(spielerTabelle, pushButton);

        menuBar->addAction(menuDB_Connection->menuAction());

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", 0));
        datenbankname->setText(QApplication::translate("MainWindow", "Datenbank:", 0));
        ipadresse->setText(QApplication::translate("MainWindow", "IP-Adresse:", 0));
        benutzername->setText(QApplication::translate("MainWindow", "Benutzer:", 0));
        spieler->setText(QApplication::translate("MainWindow", "Spieler:", 0));
        passwort->setText(QApplication::translate("MainWindow", "Passwort:", 0));
        pushButton->setText(QApplication::translate("MainWindow", "Exit", 0));
        port->setText(QApplication::translate("MainWindow", "Port: ", 0));
        connect->setText(QApplication::translate("MainWindow", "Connect", 0));
        label->setText(QApplication::translate("MainWindow", "Currently not connected.", 0));
        datenbankname_2->setText(QApplication::translate("MainWindow", "fbverein", 0));
        datenbankname_3->setText(QApplication::translate("MainWindow", "fbuser", 0));
        datenbankname_5->setText(QApplication::translate("MainWindow", "****", 0));
        datenbankname_6->setText(QApplication::translate("MainWindow", "10.0.105.56", 0));
        datenbankname_7->setText(QApplication::translate("MainWindow", "5432", 0));
        lineEdit->setText(QApplication::translate("MainWindow", "fbverein", 0));
        lineEdit_2->setText(QString());
        lineEdit_3->setText(QApplication::translate("MainWindow", "root", 0));
        lineEdit_4->setText(QApplication::translate("MainWindow", "fbuser", 0));
        port_2->setText(QApplication::translate("MainWindow", "5432", 0));
        menuDB_Connection->setTitle(QApplication::translate("MainWindow", "DB-Connection", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
