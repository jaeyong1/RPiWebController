#!/bin/sh

echo "-----------------------------"
echo "  JAVA Complier Version (1.8.xxxx)"
echo "-----------------------------"
echo $(javac -version)
echo $(rm bin/ -rf)
echo $(mkdir bin)
echo $(rm release/ -rf)
echo $(mkdir release)
echo $(rm RPI_Client_* -rf)
echo ""
echo "-----------------------------"
echo "  JAVA BUILD (.java)"
echo `pwd`
echo "-----------------------------"
echo "=== java source files ==="
echo $(find -name "*.java")
echo $(find -name "*.java" > "sources.txt")
javac -d ./bin @sources.txt -cp ./lib/org.eclipse.paho.client.mqttv3_1.1.0.jar:./lib/json-simple-1.1.jar:.
echo "=== complied classes ==="
echo $(find ./bin -name "*.class")
echo $(rm sources.txt)
echo ""
echo "-----------------------------"
echo "  Packaging JAR (release/)"
echo "-----------------------------"
echo $(cp lib/org.eclipse.paho.client.mqttv3_1.1.0.jar release/)
echo $(cp lib/json-simple-1.1.jar release/)
echo $(cp src/*.py release/)
echo $(jar cvfm release/RPi_FieldController.jar Manifest.txt -C bin/ .)
echo ""
echo ""
echo "-----------------------------"
echo "  RUN (release/)"
echo "-----------------------------"
echo "To Run.."
echo "cd release/"
echo "python MotorControlD.py&"
echo "java -cp org.eclipse.paho.client.mqttv3_1.1.0.jar:RPi_FieldController.jar:json-simple-1.1.jar:. com.jyp.rpi.RPi_FieldController"
echo ""
echo "  OR.."
echo "sudo service puttingclient stop"
echo "sudo service puttingclient start"
echo ""
cd release/
java -cp RPi_FieldController.jar:json-simple-1.1.jar:. com.jyp.rpi.json.SaveMyRpiSettings
echo ""
