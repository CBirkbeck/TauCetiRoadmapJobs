# FIX-PKG-DimerModelsAndLozengeTilings~4

Repair of the one finding of `REV-PKG-DimerModelsAndLozengeTilings~3` (P3). File changed:
`packages/DimerModelsAndLozengeTilings/sources.toml` (the `cited_for` field of six records, no
other field). `README.md`, `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

`cited_for` now lists every README section citing each work, and nothing else. aggarwal2023: +5.3,
+Conventions, "1.1-1.5" → "1.1, 1.4, 1.5". sheffield2005: +5.3. kos2006: +2.1, +4.6, "8.4-8.5" →
"8.3-8.5". kenyon2009: +1.6, 2.10, 3.1, 4.6, 6.1, 7.2, 7.3, 10.1-10.2, Downstream consumers;
"8.2-8.5" → "8.2, 8.3, 8.5".

Verified: the review's witness is exact. A scan of the README (a section cites a work when it names
the work's key; References excluded) gives aggarwal2023 in 5.3 (line 1398), sheffield2005 in 5.3
(line 1399), kos2006 in 2.1 (678), 4.6 (1284), 8.3 (1752), and kenyon2009 in 1.6 (633), 2.10 (906),
3.1 (939), 4.6 (1284), 6.1 (1486), 7.2 (1629), 7.3 (1652), 10.1 (2050), 10.2 (2083), all absent
from the records. The descriptions follow the passages cited there: kenyon2009 lines 869–878 (2.10)
is the magnetic-field paragraph (type weights depend on the height change only, planar Boltzmann
measures unchanged); kos2006 lines 177–181 (2.1) is the flow form of the height function; kenyon2009
line 891 (1.6) is Exercise 13.

Where the suggested text is corrected: the review's kenyon2009 entry "7.1-7.3, 8.2-8.5" would list
8.4, which does not cite kenyon2009 (8.4 cites gorin2021, kenyon1997 and kos2006 only); the entry is
"7.1-7.3, 8.2, 8.3, 8.5". The review's statement that gorin2021's record already agrees with the
README is not right (below).

Pattern, repaired in the other records (same field only):

- gorin2021: 5.1 cites it (line 1331, lines 4494–4501 for the configuration space) and was missing:
  "4.4, 4.6, 5.2-5.4" → "4.4, 4.6, 5.1-5.4 configuration space, …". Its ranges listed sections
  that do not cite it (1.3, 2.3, 2.4, 9.4, 9.6): "1.1-1.5" → "1.1, 1.2, 1.4, 1.5", "2.1-2.9" →
  "2.1, 2.2, 2.5-2.9", "9.1-9.7" → "9.1-9.3, 9.5, 9.7". Added "Conventions" (lines 180, 246: the
  height convention and Definition 3.9) and "Downstream consumers" (line 2141, Lectures 11–12).
- aggarwal2023: "1.1-1.5" listed 1.2, which does not cite it; the Conventions cite it eight times
  (lines 149–260). 2.4 is kept: it cites the work by attribution ("every domain in Aggarwal's
  sense", line 744).
- okounkov-reshetikhin2003: the Conventions cite Definition 4 (line 260): "9.6 incomplete beta
  kernel" → "Conventions, 9.6 incomplete beta kernel".
- kenyon1997, cohn-kenyon-propp2001, thurston1990, georgii2011: already exact; no change. The three
  References lines of the README that name sections (cohn-kenyon-propp2001 "2.8", thurston1990
  "2.9", georgii2011 "4.2, 4.6 and 5.4") agree with the README and the manifest.

## Verification of the records (computed after the edit)

A script parsed every `cited_for` entry (expanding ranges against the README's section headings)
and compared it with the set of sections naming the key. Result for all ten records: missing `[]`,
extra `[]`.

| Record | Sections citing it (README) | Listed before | Listed after | Result |
| --- | --- | --- | --- | --- |
| aggarwal2023 | Conv., 1.1, 1.3, 1.4, 1.5, 2.1, 2.4 (attribution), 2.5–2.7, 4.4, 5.3, 5.4, 6.1, 9.6, 9.7, 10.1–10.3 | lacked Conv., 5.3; had extra 1.2 | equal | fixed |
| sheffield2005 | 4.1, 4.2, 4.3, 4.5, 4.6, 5.3, 5.4, 6.3 | lacked 5.3 | equal | fixed |
| kos2006 | 2.1, 2.10, 4.6, 5.2, 5.3, 6.1, 7.1–7.3, 8.3–8.5, 9.1–9.5 | lacked 2.1, 4.6, 8.3 | equal | fixed |
| kenyon2009 | 1.2, 1.5, 1.6, 2.3, 2.5, 2.8, 2.10, 3.1–3.3, 4.6, 5.1–5.4, 6.1–6.4, 7.1–7.3, 8.2, 8.3, 8.5, 9.1–9.5, 10.1, 10.2, Downstream | lacked 9 sections and Downstream; had extra 8.4 | equal | fixed |
| okounkov-reshetikhin2003 | Conv., 9.6, 9.7 | lacked Conv. | equal | fixed |
| gorin2021 | Conv., 1.1, 1.2, 1.4–1.6, 2.1, 2.2, 2.5–2.9, 3.1–3.3, 4.4, 4.6, 5.1–5.4, 6.1–6.3, 7.1, 7.3, 8.1–8.5, 9.1–9.3, 9.5, 9.7, 10.1, 10.2, Downstream | lacked Conv., 5.1, Downstream; had extra 1.3, 2.3, 2.4, 9.4, 9.6 | equal | fixed |
| kenyon1997 | 3.2, 3.3, 8.1, 8.3, 8.4, 9.3, 9.4 | equal | equal | unchanged |
| cohn-kenyon-propp2001 | 2.8 | equal | equal | unchanged |
| thurston1990 | 2.9 | equal | equal | unchanged |
| georgii2011 | 4.2, 4.6, 5.4 | equal | equal | unchanged |

The manifest still parses as TOML (`tomllib`), ten records, no key, locator, URL, hash or status
changed.

## Adversarial pass (changed text only)

No mathematical statement, definition, Check or Lean declaration changed, so no instance of the
mathematics is affected; the rows above are the computed record of the only text that changed (the
sets of sections, compared in both directions). No `*Needs:*` line, supplier contract or
cross-roadmap citation changed. Ownership against open pull requests: no construction was added,
so no ownership question arises.

## Checks

- Elaboration: `lake env lean packages/DimerModelsAndLozengeTilings/Suggested.lean`, run from the
  content repository: exit 0; 17 warnings, each `declaration uses sorry`, at lines 115, 168, 184,
  198, 234, 245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553; no other message.
  `Suggested.lean` is unchanged.
- Signatures: `#check @name` for all 57 declarations appended to a scratch copy and elaborated once:
  exit 0, no error, 57 types printed. They agree with the README statements and with the worker's
  signature list; the Layer 4 theorems carry `[Countable Γ] [Infinite Γ] [Countable I]
  [DecidableEq I] [Finite S] [DiscreteTopology S] [DiscreteMeasurableSpace S]`, properness, `X`,
  `γ` and `γ.IsEquivariant` in their own signatures. Nothing changed.
- Dependency check (`gate --depcheck … --movable`):

      depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.

## Gate failures

None listed for this round.

## For the maintainer

No Lean name, section, layer or target id changed, so no other roadmap is affected. The review's
`## For the human reviewers` section (licence of gorin2021's author copy, the unit-hexagon matrix
of 3.1, the consistency field of `Specification`, the scope of Part II) lists no finding and
nothing was changed for it. No suspicious instruction was found in the review text.
