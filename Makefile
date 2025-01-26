version=0.0.1
vsix=llvm-better-highlighting-$(version).vsix

.PHONY: build
build: $(vsix)

.PHONY: install
install: $(vsix)
	code --install-extension $(vsix)

$(vsix): language-configuration.json syntaxes/llvm.tmLanguage.json
	npx vsce package -o $@

.PHONY: clean
clean:
	$(RM) $(vsix)
