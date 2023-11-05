local setup, comment = pcall(require, "Comment")
if not setup then
	print("Cannot find Comment")
	return
end

comment.setup()
