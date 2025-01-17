#[French version](README.md)

# Interacting with the Language Models Provided by Mistral AI

A small code snippet to interact with Mistral AI's conversation tool to perform spell-checking on a LaTeX document. The suggestions are then underlined in red in the new document. In the LeChat/tester_API_v4 file, the prompt can be modified to translate the document. The language can also be changed. It is also possible to list all the corrections made in a second file.

Tested on Ubuntu 22.04 during the writing of my HDR in January 2024

# Prerequisites

- Open an account on [https://mistral.ai/en/](https://mistral.ai/en/)
- Activate the free API in Account Settings
- Then generate an API key
- Save the API key in your ~/.bashrc or hardcode it in the Python code
- A LaTeX file that can be compiled with pdflatex named Chapitre1.tex

# Usage

```bash
./command_decoupe_corrige_assemble.sh
```



# Keywords

Mistral-AI, Le Chat, LaTeX, Spell Checking, Prompt, LeChat, Thesis, Doctorate, PhD, HDR