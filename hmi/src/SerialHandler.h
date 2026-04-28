#pragma once

#include <QObject>
#include <QSerialPort>

class SerialHandler : public QObject
{
    Q_OBJECT

public:
    explicit SerialHandler(QObject *parent = nullptr);

    Q_INVOKABLE void sendData(float a, float b, float c, float d);

private:
    QSerialPort serial;
};
