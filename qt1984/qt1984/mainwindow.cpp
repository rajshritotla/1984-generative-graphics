#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "drawarea.h"

#include <QFileDialog>

//MainWindow::MainWindow()
//    : QMainWindow(parent)
//    , ui(new Ui::MainWindow)
//{
//    ui->setupUi(this);
//}

//MainWindow::~MainWindow()
//{
//    delete ui;
//}

MainWindow::MainWindow()
{
    // Create the ScribbleArea widget and make it
    // the central widget
    drawArea = new DrawArea;
    setCentralWidget(drawArea);

    // Create actions and menus
    createActions();
    createMenus();

    // Set the title
    setWindowTitle(tr("Scribble"));

    // Size the app
    resize(500, 500);
}

//case of closing app
void MainWindow:: closeEvent(QCloseEvent *event)
{
    if(hasSaved())
    {
        event->accept();
    }
    else
    {
        event->ignore();
    }
}


//case when opening a file
void MainWindow:: open()
{
    if(hasSaved())
    {
        QString fileName = QFileDialog::getOpenFileName(this,
                                           tr("Open File"), QDir::currentPath());
        if (!fileName.isEmpty())
        {
            drawArea->openGraphic(fileName);
        }
    }

}

//saving file
void MainWindow::save()
{
    QAction *action = qobject_cast<QAction *>(sender());
    QByteArray fileFormat = action->data().toByteArray();
    saveFile(fileFormat);

}



