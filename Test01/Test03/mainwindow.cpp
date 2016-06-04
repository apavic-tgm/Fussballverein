#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <pqxx/pqxx>
#include <string>
#include <QTextEdit>

using namespace std;
using namespace pqxx;



MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}



void MainWindow::on_pushButton_clicked()
{
     exit (EXIT_FAILURE);
}


void MainWindow::on_connect_clicked()
{
    char * sql;
   QString p2 = ui->port_2->text();
   QString ip2 = ui->lineEdit_2->text();
   QString pw2 = ui->lineEdit_3->text();
   QString usr2 = ui->lineEdit_4->text();
   QString dbn = ui->lineEdit->text();
   QString s = "dbname="+dbn+" user="+usr2+" password="+pw2+ "hostaddr="+ip2+" port="+p2;

    // Either this if you use UTF-8 anywhere
    std::string utf8_text = s.toUtf8().constData();

    connection C(utf8_text);
    if (C.is_open()) {
       cout <<"Opened database successfully: " << C.dbname() << endl;
            ui->label->setText("Database connected!");
    } else {
       cout << "Can't open database" << endl;

    }

    /* Create SQL statement */
        sql = "SELECT * from spieler";

    /* Create a non-transactional object. */
        nontransaction N(C);

     /* Execute SQL query */
        result R( N.exec( sql ));

     /* List down all the records */
        for (result::const_iterator c = R.begin(); c != R.end(); ++c) {
           cout << "persnr = " << c[0].as<int>() << endl;
           cout << "gehalt = " << c[1].as<double>() << endl;
           cout << "position = " << c[2].as<string>() << endl;
           cout << "von = " << c[3].as<string>() << endl;
           cout << "bis = " << c[4].as<string>() << endl;
          }
}


