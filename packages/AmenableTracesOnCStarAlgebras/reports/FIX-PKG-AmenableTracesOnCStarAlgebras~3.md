# FIX-PKG-AmenableTracesOnCStarAlgebras~3

Findings of `REV-PKG-AmenableTracesOnCStarAlgebras~2` (three findings, all P3). Every finding was
checked against the cached brown2006 text and the package files before it was applied.

## F01 (P3) — applied

Verified: brown2006 line 804 credits Theorem 3.1.6 to its [47]. Line 4745 gives [47] as
Kirchberg's 1994 Math. Ann. paper, which is in neither list. Line 1282 says Kirchberg first
observed the face property.

§4.4: "Kirchberg's and Connes's origin as background" → "where it is credited to Kirchberg". §6.2:
"Kirchberg's observation" → "line 1282 credits the face property of `AT(A)` to Kirchberg".

**Same pattern elsewhere** (attributions to works missing from the References): §4.2's "due to
Connes and Ozawa" now cites footnote 3, line 822, which credits Connes [23] = connes1976 (line
4696), plus Ozawa's lemma (§2.4). §2.4 now adds "line 658 credits its proof to Ozawa". §5.2's
"Ozawa's condition (6)" now reads "condition (6), credited to Ozawa at line 971".

Manifest: `connes1976.cited_for` gains §4.2. "Kirchberg's factorization property" (README Scope and
ownership, and §5.4) is the name of a property of groups (brown2006, Definition 4.1.8, line 1627), not an
attribution, and is unchanged.

## F02 (P3) — applied

`Suggested.lean` line 62: "Layer 1: tracial states and the normalized matrix trace" → "Layer 1:
tracial states, their GNS data and the matrix trace". Line 380: "Layer 7: commutative, AF and
reduced group C*-algebras" → "Layer 7: examples: finite-dimensional, commutative, AF and group
algebras".

These are comments only. The other section comments (Layers 3, 4, 5, 6, 8) already match README
headings at lines 1032, 1215, 1470, 1630 and 1898 (before this round's edits shifted them).
Layer 2 has no Lean declarations, so it has no section comment.

## F03 (P3) — applied

`sources.toml`, `brown2006.version_note`: "arXiv v2; the design cites the arXiv v2 numbering and
line numbers of the cached text; the published Memoir … was not compared" → "arXiv v2 numbering
and cached line numbers; the published Memoir (Mem. Amer. Math. Soc. 184 (2006), no. 865) was not
compared".

A search of README, `Suggested.lean`, `sources.toml` and `metadata.toml` for design, package,
round, review, current, removed and checkpoint finds no other process label.

## Checks

**Elaboration.** `lake env lean packages/AmenableTracesOnCStarAlgebras/Suggested.lean`, run from
the content checkout: exit 0. Output: 21 warnings, all "declaration uses `sorry`" (one per
theorem), and no other message. No `TauCeti.*` module needed building.

**Signatures.** A scratch copy of `Suggested.lean` was given `#check @name` for all 44
declarations (40 theorems, definitions and structures, plus 4 instances) and elaborated once.
Every name resolved, with the same types the pre-round signature list records. No declaration changed
this round, only two comments. So the comparison with the README is the one the review recorded:

- `IsFaithfulTrace`, `IsHypertrace` and `IsFoelnerTrace` drop `[StarOrderedRing A]`, and `IsAF`
  drops both order classes. Their bodies do not use these classes.
- No theorem loses a hypothesis.

(One extra `#check` line, generated from a docstring line, failed to parse. It is not a
declaration.)

**Dependency check.** `gate --depcheck … --name AmenableTracesOnCStarAlgebras --movable`:

    depcheck: 210 roadmaps, 1925 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Citation resolver.** `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere:
None. Lean names found nowhere: None."

**Line widths.** Every README line this round touched is at most 100 characters. Six lines
were already over 100 characters before this round, and they are unchanged.

## Adversarial pass on the changed text

No statement, hypothesis, definition or Check changed. Only locators, attributions, two section
comments and a manifest note changed. Each new locator was read at the cited line:

| Changed text | Instance checked | Value read at the source | Result | Change |
|---|---|---|---|---|
| §4.4 "credited to Kirchberg" | brown2006 l. 804; ref. list l. 4741–4746 | "Theorem 3.1.6 ([47])"; [47] is the third Kirchberg entry (l. 4745, 1994, Math. Ann. 299) | attribution correct; no new key needed | text |
| §4.4 footnote 2 | l. 819–821 | equivalence with the existence of some faithful representation with a u.c.p. `Φ` | matches (c)/(f) as stated | none |
| §6.2 face attribution | l. 1282–1283 | Kirchberg first observed that `AT(A)` is a face; Prop. 3.5.3 cites [47, Lemma 3.4] | correct; `UAT` face (l. 1291) is not credited to Kirchberg, and the text credits only `AT(A)` | text |
| §4.2 Connes credit | l. 822–823; ref. [23] l. 4696 | footnote 3: main idea from Connes's uniqueness theorem for the injective II₁ factor [23]; [23] = Connes, Classification of injective factors, Ann. Math. 104 | [23] = connes1976 (same DOI entry) | text, `cited_for` |
| §4.2 "matrix step is Ozawa's lemma" | l. 839 | proof of (1) ⇒ (2) applies Lemma 3.1.4 | correct | text |
| §2.4 Ozawa credit | l. 657–658, 662 | the proof of the next lemma (3.1.4) is credited to Ozawa [58, Thm 6.1] | correct; [58] not added (carried through brown2006) | text |
| §5.2 condition (6) | l. 970–971, 973 | Ozawa added (6) to Theorem 3.2.2 | correct | text |
| Lean section titles | README l. 444, 1775 (before edit) | headings quoted in F02 | equal after lower-casing the first word, as in Layers 3–6 and 8 | comments |
| `brown2006.version_note` | entries `schafhauser2020`, `tikuisis-white-winter2017` | "arXiv v2 numbering and cached line numbers" | same form | text |

## Notes for the maintainer

- No name changed. No other roadmap cites anything this round touched.
- `design/plan.json` is unchanged and declares no supplier gaps.
- No new constructions were added this round, so no ownership question arose, and ownership
  against open pull requests needed no new search.
- No source was fetched and `needs-references.toml` was not written. No new reference was added:
  the 1994 Kirchberg paper and Ozawa's QWEP survey are cited only through brown2006's own
  attributions.
- The review's "Source issues" note on brown2006 Lemma 3.1.4 (orthonormal vectors on a small
  space) is already covered in README §2.4. There the auxiliary factor `ℂ^q` supplies the vectors
  even when `H` is finite-dimensional.
- No text in the review asked for anything outside this job.
