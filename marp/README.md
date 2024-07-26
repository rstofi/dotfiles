## marp style files

I am thinking about using [marp](https://marp.app/) for making presentations in the future instead of LaTeX.

For now, I am collecting some basic scripting info, later on I want to include my marp style files here.

### Basic usage

To start a presentation on `port 5000` from a sub-directory:

```bash

PORT=5000 marp -s --html .
```

To convert a presentation to pdf:

```bash

marp --html --pdf --allow-local-files ./{presentation_folder}/{presentation}.md

```
