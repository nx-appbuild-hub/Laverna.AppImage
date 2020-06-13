SOURCE="https://github.com/Laverna/laverna/releases/download/0.7.1/laverna-0.7.1-linux-x64.zip"
DESTINATION="laverna.zip"
OUTPUT="Laverna.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)

	rm -rf ./buiuld
	mkdir -p ./build
	unzip -o $(DESTINATION) -d ./build
	rm -rf AppDir/application
	
	mkdir --parents AppDir/application
	cp -r build/* AppDir/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/application
	rm -rf ./buiuld
