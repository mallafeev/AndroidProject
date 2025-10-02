gen:
	flutter pub run build_runner build --delete-conflicting-outputs
icon:
	flutter pub run flutter_launcher_icons:main
init-res:
	dart pub global activate flutter_asset_generator
format:
	dart format . --line-length 100

res:
	fgen --output lib/data/resources.g.dart --no-watch --no-preview
loc:
	flutter gen-l10n