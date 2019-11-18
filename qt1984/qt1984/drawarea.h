#ifndef DRAWAREA_H
#define DRAWAREA_H

#include <QColor>
#include <QImage>
#include <QPoint>
#include <QWidget>

class DrawArea: public QWidget
{
    //declare class as a QObject -> handles events
    Q_OBJECT

public:
    DrawArea(QWidget *parent = 0);

    //Handles events
    bool openGraphic (const QString &fileName);
    bool saveGraphic (const QString &filename, const char *fileFormat);
    void setColor (const QColor &newColor);
    void setSize( int newSize);

    //checks if graphic has been modified since last save

    bool isModified() const{
        return modified;
    }

    QColor color() const
    {
       return currColor;
    }

    int size() const
    {
        return currSize;
    }

public slots:
    //events to handle
    void clearImage();
    void print();
protected:
    void mousePressEvent(QMouseEvent *event) override;
    void mouseMoveEvent(QMouseEvent *event) override;
    void mouseReleaseEvent(QMouseEvent *event) override;

    void paintEvent(QPaintEvent *event) override;

       // Makes sure the area we are drawing on remains
       // as large as the widget
    void resizeEvent(QResizeEvent *event) override;

    void drawLineTo(const QPoint &endPoint);
        void resizeImage(QImage *image, const QSize &newSize);

        // Will be marked true or false depending on if
        // we have saved after a change
        bool modified;

        // Marked true or false depending on if the user
        // is drawing
        bool scribbling;

        // Holds the current pen width & color
        int currSize;
        QColor currColor;

        // Stores the image being drawn
        QImage graphic;

        // Stores the location at the current mouse event
        QPoint lastPoint;
};

#endif // DRAWAREA_H
