# Review of NoncommutativeFlatness (pull request #2618 at 3f0df5e)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review; the folder has not changed since the last review of `3f0df5e`, and this round read the pull request's title and description, as they stand now, against that head. The description's list of the clauses of Theorem P now carries the simple-subobject condition beside the orthogonal-idempotent one, as the README and `Suggested.lean` do, and no sentence of the title or description is contradicted by the head. Two format notes are carried over, neither blocking; four points are left for the human reviewers.

## N01 — `letI` in two theorem statements

`isMoritaEquivalent_tfae` (`Suggested.lean` lines 1144–1150) and `BalancedTor.outerSMulCommClass` (lines 1273–1274) bring module structures into scope with `letI` inside the statement; a named instance argument reads and applies more easily.

## N02 — "current Tau Ceti `main`" and "not yet at this roadmap's pin" date the Scope paragraph

README lines 103–105 (and "on Tau Ceti `main`", line 1398) describe the library on the day of writing. "(`IsFinitelyPresentedFunctor` in ArtinAlgebras' `Suggested.lean`)" alone is timeless; the remark about the pin already stands in the description, where it belongs.

## Previous findings

- C01 — repaired: the description now ends its list with "no infinite orthogonal idempotents in `End X` together with a simple subobject in every nonzero right module", which is clause 4″ of Theorem P (README lines 1310–1312).
- N01 — not repaired: `letI` remains in the two statements (N01 above).
- N02 — not repaired: "implemented on current Tau Ceti `main` as … not yet at this roadmap's pin" stands (N02 above).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.5 Theorem P, clause 4″, as the description now cites it (both conjuncts) | `ℤ`; `∏_ℕ 𝔽₂`; `k[x]/(x²)` | `ℤ`: idempotents {0,1}, first conjunct holds; `nℤ ≅ ℤ` never simple, second fails; `J = 0`, `ℤ` not semisimple. `∏𝔽₂`: unit vectors orthogonal nonzero, first fails; not semisimple. `k[x]/(x²)`: `J² = 0`, socle `(x)`, both hold | description, README and `isLeftPerfectCategory_tfae` (Lean lines 2194–2195) agree; both sides of the equivalence fail on the two non-perfect rings and hold on the third | none |
| 4.5 Theorem P, clause 1, as the description cites it ("left T-nilpotence of `J`, semisimplicity of `C ⧸ J(C)` with idempotent lifting") | `ℤ_(p)`; `k[x]/(x²)` | `ℤ_(p)`: `A/J = 𝔽_p` semisimple, idempotents lift trivially, `pⁿ ≠ 0` so `J` not T-nilpotent; `ℚ` flat, not projective. `k[x]/(x²)`: all hold | idempotent lifting is redundant beside T-nilpotence (README line 1239 derives it) but the list is true | none |
| 1.6 supplier `nonempty_tor_iso_tor'`, as the description cites it | SpectralSequencesAndConvergencePartII on main | declared at its `Suggested.lean` line 284; README line 1600, under "4.1 Balancing Tor" (line 1594) | citation resolves on main | none |

The rows for the untouched statements stand as in the previous review, of `3f0df5e`.

- Description against the head, sentence by sentence: it adds a new roadmap (not on main; 3,788 insertions in three files, `metadata.toml` with `topic = "math.RA"`); the layer ranges 0.1–0.10, 1.1–1.7, 2.1–2.6, 3.1–3.5, 4.1–4.6 equal the README's 34 numbered subsections; `Suggested.lean` has 2,253 lines and 307 declarations, no line over 100 characters; Tau Ceti pin `2fd255d9`; every topic named per layer (Baer, Lambek, Karoubi, `CategoryAlgebra`, Jensen, `FP_∞`, Fisher, Bass–Eilenberg, weak cokernels, pure superfluous subobjects) is found in the README.
- Suppliers named in the description against "From other roadmaps" (README lines 309–315): ArtinAlgebras §0.2, §0.3, §1.1 and SpectralSequencesAndConvergencePartII §4.1, the headings found on main (ArtinAlgebras README lines 344, 372, 544; `IsKrullSchmidt` at its `Suggested.lean` line 89).
- Consumers named in the description against "Downstream consumers" (README lines 1384–1395): ArtinAlgebras §7.2 (3.4, 4.6), §7.5 (3.4), §§4.1–4.2 (1.4); headings found on main at its README lines 1246, 1438, 921, 959.
- Elaboration of `Suggested.lean` at the pins: exit 0, no errors, 203 `sorry` warnings and nothing else; no `set_option`; a single `import Mathlib` plus `TauCeti.*` modules.
- Dependency check: `depcheck: 197 roadmaps, 2162 edges, 0 problem(s)`. No change outside the roadmap folder.
- Source locators checked against the text: none new (no line of the folder changed); the seeded sample falls in no changed passage.
- Headline theorems: unchanged; all stated, none named as not statable.
- Overlap check: read ArtinAlgebras (main and its open revision), QuiverRepresentations (main), LocallyPresentableCategories (open); `mod C` — owner ArtinAlgebras §1.1, cited; `Tor ≅ Tor'` — owner SpectralSequencesAndConvergencePartII §4.1, cited; no cited id dropped by an open pull request; nothing else shared.

Source independence: changed passages only; no passage of the folder changed, so 0 passages compared with 0 sources; largest share Mitchell, 17 of about 190 locators; contents not compared again (no layer added, removed or reordered; Mitchell's contents not readable).

Research link: The headline targets are Bass's Theorem P (Bass 1960) with its categorical form (Simson 1977, Harada 1973), Crawley-Boevey's representation theorem (1994) and Auslander's global-dimension theorems (1955); the README names flat-dominant dimension (Hoshino 1989, Xi 2021) as a user. Rests on the README and on Bass and Auslander read at their locators.

## Not verifiable

- That Tau Ceti's main branch has `TauCeti.IsFinitelyPresentedFunctor` in `TauCeti/CategoryTheory/FinitelyPresentedFunctor/Basic.lean` (README lines 103–105, and the description's "on Tau Ceti `main` past the pin"): only the pinned Tau Ceti was available, and it does not have it, as both texts say.
- The description's "`check_roadmap_topics.py` passes", its "separate local Lean probes" and its account of AI assistance were not rerun or checked; the topic file and the line lengths were read directly.
- The sources listed as unread in the earlier reviews remain unread; nothing changed in a locator into them.

Automatic checks set aside as false positives: four names reported as undeclared are two Tau Ceti declarations that exist at the pin, a field of Tau Ceti's balanced tensor product, and the notation `Tor_0`; eight reports of TeX syntax are inside code spans that wrap over a line break; the subsection "Layer 4 checks" is read as a layer heading; the Prop-valued instances and the `sorry` proof fields of definitions with real data are not `sorry` data.

## Source issues

- none

## For the human reviewers

- **Scope.** Clause 4″ of the categorical Theorem P (right simple subobjects and orthogonal idempotents, README lines 1310–1312) is, in the README's words, this roadmap's own extension of Bass's clause (7); no refereed source states it.
- **Scope.** `Module.End.exists_prod_eq_zero_of_isNilpotent` (4.3) is stated for multiplicatively closed nil sets; the README (lines 1252–1255) says its two sources state it for nil subrings and nil one-sided ideals.
- **Scope.** The README plans changes to existing Tau Ceti declarations "without shims" (`IsSuperfluous`, `globalDimension`, `IsSemiperfectRing`, and ArtinAlgebras §1.1's `IsFinitelyPresentedFunctor`; lines 101–125, 1396–1410).
- **Not tested.** Mitchell, *Rings with several objects*, has the largest share of locators (17); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
