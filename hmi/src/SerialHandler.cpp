#include "SerialHandler.h"
#include <QDebug>

SerialHandler::SerialHandler(QObject *parent)
    : QObject(parent)
{
    serial.setPortName("/dev/ttyUSB0");
    serial.setBaudRate(QSerialPort::Baud115200);

    if (!serial.open(QIODevice::WriteOnly)) {
        qDebug() << "Error abriendo puerto";
    } else {
        qDebug() << "Serial conectado";
    }
}

void SerialHandler::sendData(float a, float b, float c, float d)
{
    QString data = QString("%1,%2,%3,%4\n")
                       .arg(a)
                       .arg(b)
                       .arg(c)
                       .arg(d);

    serial.write(data.toUtf8());

    //Debug() << "Enviado:" << data;
}
