---
name: human-writing
description: Write or rewrite prose so a person gets the content fast, in the user's own plain voice. Use whenever asked to write, rewrite, shorten, clean up or de-AI any prose, including notes, docs, README text, commit bodies, emails, thesis or paper text, and whenever the user says something sounds too AI, too polished, too long or too much like ChatGPT. Prefer this over writing prose unaided any time the text is meant to be read by a person.
---

# Human writing

The reader should get the content fast.
Text that sounds generated is a sign they won't.

## Before writing

Write the one thing the reader should take away as a single sentence.
If that sentence can't be written, there is nothing to record yet, so say that and write nothing.

Look for a file that already covers the subject and edit it before creating a new one.

## Order

Result first, then how it was reached.
The first line of a note or README carries its main point.

What was done and what is planned go in separate sections.

## Length

Say the thing once and stop.
Cut until removing another sentence would lose a fact.

Every fact lives in one place.
If it is already written somewhere, point to it.

When new text replaces old text, delete the old text in the same edit.

No closing paragraph that summarises what was just said.

## Numbers

Only write a number that has a source you can name, like a results file.

Don't copy settings from the code into prose, like seed counts.
They go stale.

## The tells

Each of these is fine once.
Two in a short piece and it reads as generated.

- Paragraphs that land on a punchline or a reversal
- X not Y constructions, like "the oracle is a prompt, not a model"
- Triples, like "same model, same data, completely different ground truth"
- One sentence dramatic fragments, like "Nobody checks it."
- "It's not just X, it's Y"
- Openers like "Here's the thing" or "The reality is"
- Adjectives standing in for a number, like "significant" or "dramatically better"
- Every paragraph the same length

Fix by flattening.
Let a sentence end without a beat.
A flat sentence with a number in it beats a sharp one without.

## Voice

In notes, logs and READMEs use first person past tense for anything done, like "Lost the day to logprobs".
Contractions are fine.

State what is uncertain or broken as plainly as what worked, like "Pilot labels were garbage".
Do not sell the idea.

Concrete over abstract.
Names and what happened.

Thesis and paper text follows the same rules in a formal register.
No contractions or slang, and every claim from someone else gets a citation.

## Mechanics

No em dashes.
No semicolons.
No bold or italics for emphasis.
Plain words over buzzwords.

Match the conventions of whatever is already around the text, like the other notes in the folder and the project's CLAUDE.md.

## Example

Before, generated:

```
The results were striking.
Embeddings didn't just match links, they beat them.
Four predicates, four losses.
So what does this tell us? Links are not the signal we hoped for.
```

After:

```
Embeddings beat links on all four predicates.
Robotics needed 12% of the rows with embeddings and 72% with links.
Numbers are in results/predicates.txt.
```

The after is shorter, and the reader gets the result, one number and where to check it.

## Check before finishing

- Does the first line carry the main point?
- Would the reader miss this paragraph? If not, cut it.
- Does every path and number exist where the text says?
