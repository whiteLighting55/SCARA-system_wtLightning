#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "SerialHandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // 🔌 Crear handler serial
    SerialHandler serial;

    // 📡 Exponer a QML como "serialHandler"
    engine.rootContext()->setContextProperty("serialHandler", &serial);

    // 🚀 Cargar UI
    engine.load(QUrl("qrc:/ui/Main.qml"));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
