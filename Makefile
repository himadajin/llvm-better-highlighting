BUILD_DIR:=build

version=$(shell jq -r ".version" package.json)
vsix=$(BUILD_DIR)/llvm-better-highlighting-$(version).vsix

.PHONY: package
package: $(vsix)

.PHONY: install
install: $(vsix)
	code --install-extension $(vsix)

$(vsix): language-configuration.json package.json syntaxes/llvm.tmLanguage.json | $(BUILD_DIR)
	npx vsce package -o $@

$(BUILD_DIR):
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
