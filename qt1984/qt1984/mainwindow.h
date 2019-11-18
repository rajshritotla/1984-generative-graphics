#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include<QList>
#include <QMainWindow>

//widget to be drawn on
class DrawArea;

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    //base class for QT object
    Q_OBJECT

public:
    MainWindow();

protected:
    //stops the event from executing
    void closeEvent(QCloseEvent *event) override;

private slots:
    //events/options for the users
    void open();
    void save();
    void color();
    void size();
    void about();

private:
    Ui::MainWindow *ui;

    //ties the functions in private slots to actions
    void createActions();
    void createMenus();

    //checks for unsaved changes
    bool hasSaved();

    //opens save dialog and saves file
    bool saveFile(const QByteArray &fileFormat);

    //drawing pad
    DrawArea *drawArea;

    //menu options
    QMenu *saveAsMenu;
    QMenu *fileMenu;
    QMenu *optionMenu;
    QMenu *helpMenu;

    //actions that can occue
    QAction *openAct;
};
#endif // MAINWINDOW_H
