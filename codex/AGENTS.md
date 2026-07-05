> The best code to write is zero code.

I want to write principled code where every token justifiably earns its place or is eliminated.
I run Windows 11 and M1+ Mac locally and Linux on cloud.
I use `uv` and `npm`.
**ALL** of the following rules apply **unless otherwise demanded by me (or the compiler)**.

# Understanding

- Read the code base or search the web for unstable knowledge.
- Do not eagerly implement or test things if not demanded, even if I use "we".
  - Exception: Prompts containing output traces with no accompanying question.
  - Bad example 1:
    ```
    User: "Can we use X to implement Y?"
    AI: "I will read the spec and use X to implement Y."
    ```
  - Good example 1:
    ```
    User: "Can we use X to implement Y?"
    AI: "I will figure out if X can be used to implement Y, then answer your question."
    ```
  - Bad example 2:
    ```
    User: "Traceback (most recent call last): ..."
    AI: "This happened because of X. Would you like me to tweak the code to fix it?"
    ```
  - Good example 2:
    ```
    User: "Traceback (most recent call last): ..."
    AI: "I will examine the root cause and tweak the code to fix the error."
    ```
- Feel free to pose and propose solutions to design questions before implementation.

# Explaining

- Prefer enumerated over non-enumerated markers for bullet point lists benefiting from order.
  - Bad example:
    ```
    User: How many files are in this repo?
    AI: There are 2 files in this repo:
    - `foo.html`
    - `foo.css`
    ```
  - Good example:
    ```
    User: How many files are in this repo?
    AI: There are 2 files in this repo:
    1. `foo.css`
    2. `foo.html`
    ```
- Use emoji appropriately when explaining concepts.
  - Reason: This can build intuition and improve readability.
- Never include optional refinements such as "caveats", "subtleties", or "warnings".
- Avoid being pedantic and taking things too literally. Understand user intent first.
- Never assume the user has prior knowledge of jargon.

# Coding

- If a parameter looks like it could be arbitrary (e.g. a "magic number"), check if there is a (1) code default or (2) strong community recommendation you could use.
  - Bad example:
    ```
    User: Implement a sliding window chat.
    AI: I will implement a sliding window with a reasonable default of 512 max tokens.
    ```
  - Good example:
    ```
    User: Implement a sliding window chat.
    AI: As there is both a code default and strong community recommendation, and code defaults are preferred, I will implement a sliding window chat with the code default.
    ```
- Never add arbitrary stylistic symbolic prints.
  - Exception: `|` as separator for logging.
  - Bad example: `print("*" * 60)`.
  - Good example: `print(f"{time}s | {message}")`.
- Be clear.
  - Bad example:
    ```python
    def get_code(path):
        return tokenize.open(path).read()
    ```
  - Good example:
    ```python
    def get_code(path):
        source_file = tokenize.open(path)
        source_code = source_file.read()
        return source_code
    ```
  - Reason: Separating "mentally atomic operations" spreads cognitive burden evenly.
- If a mathematical trade-off exists, spend a turn clarifying it instead of presuming what I want.
- Be concise.
  Recall the meme where a builder "patches" a structure into brick degeneracy: avoid this.
  Never write more code than needed.
  Consider avoiding or dropping a LOC that could fail PR review without clear justification.
  Leave to future work all writing of code beyond current need.
  Embrace importing standard libraries and packages.
  - Reason: It is often easier to add to simplicity than subtract from complexity.
  If you must write custom, start small.
  - Reason: Every piece of custom code introduces maintenance cost.
  - Bad example 1:
    ```html
    <body>
        <canvas id="vtuber-canvas"></canvas>
        <button class="send-button">Send query</button>
        <script>
        const canvas = document.querySelector("#vtuber-canvas");
        const button = document.querySelector(".send-button");
        </script>
    </body>
    ```
    - Good example 1:
    ```html
    <body>
        <canvas></canvas>
        <button>Send query</button>
        <script>
        const canvas = document.querySelector("canvas");
        const button = document.querySelector("button");
        </script>
    </body>
    ```
  - Reason: For unique elements, extra attributes functionally add nothing and add cognitive load.
- Consistently use a canonical vocabulary (e.g. defined by READMEs) everywhere.
  Flag legitimate inconsistencies.
- State assumptions before implementation.
- Avoid comments and docstrings.
  - Reason: Good code should "speak for itself".
- Notify me about things I may want to add to config files.
  Never add them without consent.
- Group and order things lexicographically by default.
  Check lexicographic order using Python if unsure.
  Example:
  ```css
  body {
    ...
  }

  ul {
    ...
  }

  li {
    ...
  }
  ```
- Ensure that in Python by default:
  (1) Imports, if any, precede variables, if any.
  (2) Classes/functions, if any, precede executed code, if any.
  - Example:
    ```python
    import torch
    import zipfile


    class Tokenizer:
        ...


    def generate_dataset():
        ... # Tokenizer is used by, and so defined before, generate_dataset


    if __name__ == "__main__":
        # Executed code belongs here
        generate_dataset()
    ```
- Use shebang `#!/bin/sh` by default.
- Feel free to import principled dependencies that give standard useful task abstractions.
  Prefer dependency installs within project-allocated environment directories.
  - Reason: I would rather have more helpful dependencies than unhelpful "wheel re-inventions" and have more lines of code to maintain.
  - Bad example: (Custom TOML parser that is brittle and costs 10 LOC).
  - Good example: (Imported TOML parser that is robust and costs 5 LOC).
- Ensure code is implemented efficiently in asymptotic and wall-clock time and space.
- Demand elegance in approach.
- Follow existing code style, if any.
- Prefer updating over creating files.
  - Exception 1: `config.toml` for code that can read TOML.
  - Exception 2: `utils.py` for Python.
  - Reason: I love stashing reusable code and "utils" is a standard name.
- Use a consistent verb-noun naming convention for function names.
  - Bad example 1: `def cook_dragon_meal()` when there exists only 1 meal.
  - Good example 1: `def cook_meal()` when there exists only 1 meal.
  - Bad example 2: `def wait_for_response()`.
  - Good example 2: `def await_response()`.
- Avoid global variables.
  - Exception: Documentation-recommended global variables.
- Skip testing if it could be heavy.
  - Reason: I am often actively using resources on the system you execute code from.
- Use `import` instead of `from` in Python.
- Never use lines to separate imports by Standard Library availability.
  - Reason: This separation often never matters in practice.
  - Bad example 1:
    ```python
    import torch
    import zipfile
    from torch import nn

    import utils
    ```
  Good example 1:
    ```python
    import torch
    import torch.nn
    import utils
    import zipfile
    ```
  - Bad example 2:
    ```typescript
    import { useState } from "react";

    import VtuberCanvas from "../components/VtuberCanvas";
    import SendButton from "../components/SendButton";
    ```
    - Good example 2:
    ```typescript
    import { useState } from "react";
    import VtuberCanvas from "../components/VtuberCanvas";
    import SendButton from "../components/SendButton";
    ```
- Use tab indentation.
  - Exception: Code that wants space indentation (e.g. YAML code, custom low-level code with abstraction for read 2-space but not tab indentation, etc.).
- Inline where there is no computational or line-width benefit to not doing so.
  Avoid writing one-line helper functions.
  Reason: A project is often a few "big" main functions importing "small" auxiliary functions.
  - Bad example:
    ```python
    def get_emails(users): # This new abstraction for 1 line is not reused
        return [user.email for user in users]


    def send_email(users):
        emails = get_emails(users)
        email.send(
            to=emails,
            subject="Welcome!",
            body="Thanks for signing up."
        )
    ```
  - Good example:
    ```python
    def send_email(users):
        email.send(
            to=[user.email for user in users],
            subject="Welcome!",
            body="Thanks for signing up."
        )
    ```
- Split lines only if needed.
  Prefer splitting list- or dict-style objects if they non-trivially have 3 or more entries.
  - Example:
    ```python
    fruits = ["apple", "banana"]
    phone_book = {
        "Alice": ["9876 5432", "9012 3456"],
        "Bob": ["8765 4321", "8012 3456"],
        "Charlie": ["6789 1234", "6012 3456"]
    }
    ```
- Prefer if-return over if-else patterns.
- If in doubt and a "magic number" is needed, prefer powers of two for faster computation, multiples of two for clear design, and `37` for seeds.
- If a parameter looks optional, check if it is possible to drop it.
- Avoid overly generic variable names.
  Prefer parallel variable names.
  - Reason: This greatly reduces the cognitive load of name resolution at a tiny length expense.
  - Bad example:
    ```python
    language_model = "GPT-Neo"
    image_model = "Qwen-Image"
    ```
    - Good example:
      ```python
      language_model = "GPT-Neo"
      image_model = "Qwen-Image"
      ```
- Use prints appropriately for important steps.
  Use progress bars for important and long-running steps.
  Ensure prints start with verbs using present participle (e.g. "Loading...").
  - Exception: Experiments where time is itself a result being measured.
- Ensure verbs and nouns are totally fair and standard to use.
  Use recognised verbs (e.g. "create", "read", "update", "delete", etc.) where appropriate.
- Prefer writing Python code directly in `if __name__ == "__main__"` instead of `def main()`.
- Use double quotes, then alternate with single quotes when nesting.
  - Example: `python -c "print('hello world')"`.
- Read but avoid writing README files.
  - Reason: I often use them to communicate important information.
- Scope variables and functions down as far as possible.
  - Reason: This builds discipline and makes errors less likely.
  - Bad example:
    ```python
    SINGLE_USE_VARIABLE_FOR_DRAWING_ARMS = 1


    def draw_arms():
        sketch_arms(SINGLE_USE_VARIABLE_FOR_DRAWING_ARMS)
        print("Drew arms")
    ```
  - Good example:
    ```python
    def draw_arms():
        single_use_variable_for_drawing_arms = 1
        sketch_arms(single_use_variable_for_drawing_arms)
        print("Drew arms")
    ```
- Clip words to standard shorter forms only if needed to shorten line.
  - Reason: This hurts readability for unfamiliar readers.
  - Example 1: `config` -> `cfg` everywhere as lines are too long.
  - Example 2: `message` -> `msg` everywhere as lines are too long.
- Avoid f-strings that could more cleanly be standalone files.
  - Example: Writing and reading from `faq.html` instead of HTML f-string in `main.py`.
- Ensure f-strings do not break indentation if you absolutely must use f-strings.
  - Bad example:
    ```python
    def print_html():
        html = f"""
    <section>
        <h1>Test</h1>
        <p>Test</p>
    </section>
    """
        print(html)
    ```
  - Good example:
    ```python
    def print_html():
        html = textwrap.dedent("""\
        <section>
            <h1>Test</h1>
            <p>Test</p>
        </section>
        """).strip()
        print(html)
    ```
- Avoid breaking lines directly inside functions.
  - Reason: A function containing many big and distinct ideas should be re-factored instead of line-broken.
  - Bad example:
    ```python
    def first_function(seed):
        start = 1 * seed
        end = 100 * seed

        for number in list(range(start, end + 1)):
        if fizzbuzz(number):
            print("FizzBuzz")
        elif fizz(number):
            print("Fizz")
        elif buzz(number):
            print("Buzz")
        else:
            print(number)
    ```
  - Good example 1:
    ```python
    def first_function(seed):
        start = 1 * seed
        end = 100 * seed
        for number in list(range(start, end + 1)):
        if fizzbuzz(number):
            print("FizzBuzz")
        elif fizz(number):
            print("Fizz")
        elif buzz(number):
            print("Buzz")
        else:
            print(number)
    ```
  - Reason: Imports go together. So do variable assignments. So do functions. So do classes.
- Keep to a *soft* maximum line width of 100 chars.
  Allow exceptions in special situations.
  - Exception: Necessary evils (e.g. URLs with no clear factorable structure).
- Avoid type hints.
- Avoid unneeded trailing commas.
  - Bad example 1:
    ```json
    {
        "editor.lineHighlightBorder": "#00000000",
        "focusBorder": "#00000000",
    }
    ```
  - Good example 1:
    ```json
    {
        "editor.lineHighlightBorder": "#00000000",
        "focusBorder": "#00000000"
    }
    ```
  - Bad example 2:
    ```python
    lines = (
        "Parameter A. Lorem ipsum dolor sit amet...",
        "Parameter B. Lorem ipsum dolor sit amet...",
    )
    ```
  - Good example 2:
    ```python
    lines = (
        "Parameter A. Lorem ipsum dolor sit amet...",
        "Parameter B. Lorem ipsum dolor sit amet..."
    )
    ```
- Avoid overly defensive checks or fallbacks.
  - Reason: Exposed lines that fail when run are easier to reason about than guarded lines.
- Avoid unneeded arguments.
  Check argument necessity against docs.
  - Bad example: `npm --yes md-to-pdf`.
  - Good example: `npm md-to-pdf`.
- Use `uv run python` or `uvx`.

If you have legitimate concerns or questions while working, halt to raise them early instead of consuming more tokens.
Before finishing work, quickly check that all requirements are satisfied.
