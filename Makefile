.PHONY: download build upload-assets deploy clean

download:
	node process/download-doc.js

build:
	rm -rf dist/*
	npm run build

# upload-assets:
# 	aws s3 rm s3://spectator-static-assets/political-candidates/ --recursive --exclude "*" --include "*" --profile=spec
# 	aws s3 cp dist/ s3://spectator-static-assets/political-candidates/ --recursive --exclude "*" --include "*" --acl=public-read --profile=spec

# deploy: build upload-assets
	# cd dist && git add . && git commit -m 'Deploy to gh-pages' && git push origin gh-pages

sync-js: build
	aws s3 cp dist/script.75da7f30.js s3://spectator-static-assets/political-candidates/script.3906baa1.js --acl=public-read --profile=spec
	aws s3 cp dist/script.75da7f30.js.map s3://spectator-static-assets/political-candidates/script.3906baa1.js.map --acl=public-read --profile=spec

clean:
	rm -rf dist
	git worktree prune
	mkdir dist
	git worktree add dist gh-pages
