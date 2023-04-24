local setup, comment = pcall(require, "Comment")

if not setup then
  return
end
comment.setup()

-- to use it :
-- gcc for single line comment, you can undo it with the same way
-- gc and the how which lines you want and j or k exampe: gc4j gc4k
