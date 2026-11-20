# Review of InductionRestriction (pull request #2639 at 67fee23)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the previous review of this head, so this round read the pull request's description against the head and against the version on main: the sentence on the anchors of old Layer 2.1 and of the universal central extension, wrong last round, is now right, and every other sentence checked agrees with the files. There is one small correction (the description does not say that two top-level sections of the old README are gone) and two format notes carried from the previous review, none blocking. For the humans: Isaacs, the most-cited text, is still unread behind a paywall.

## C01 — The description does not say that the sections "Worked examples (acceptance criteria)" and "Ordering" of the version on main are removed

A reader comparing with main finds two top-level sections missing and is told about neither. The description's account of the form lists "layers with `### k.n` sections … ending with Examples and Dependencies, downstream consumers, scope, supplier contracts and references", and its mapping paragraph covers the layer headings only. At the head the worked examples are split between the per-layer Examples and the last row of the Scope table (README line 908), and the build order is in the per-layer Dependencies. No other roadmap links to either heading, so nothing breaks.

Text that would be right, added to "What changes in form": "The old sections 'Worked examples (acceptance criteria)' and 'Ordering' are gone: the examples are now the Examples of each layer, those proved in Tau Ceti are the last row of the Scope table, and the order is in each layer's Dependencies."

## N01 — Four sections state targets with no source locator

Carried from the previous review, unchanged: §4.2, §7.3, §7.7 and §7.8 cite no text, while §7.6 cites Curtis–Reiner §11 for the same crossed systems. A locator for §§7.7–7.8 would let an implementer check the conventions against a reference; §4.2 and §7.3 are adapters and may need none.

## N02 — Two entries of the References are cited nowhere in the text

Carried, unchanged: James–Liebeck (Ch. 21) and Alperin–Bell (§16) appear only in the list of references (README lines 1074–1077). Would cite each where it is used, or say in the entry what it is background for.

## Questions for the author

- §6.1 gives "over `ℂ`: Serre, Part II, §9–10" for the basis statement, while the target is over a field of characteristic zero that need not split `G`. Does Serre's §12.1 state the basis and orthogonality of the characters of the simple `K[G]`-modules for such a field? The text is behind a paywall and was not read.
- Which results of Curtis–Reiner §11 give Clifford's theorem and the correspondence of §§5.2–5.3 over an arbitrary field, and the crossed systems of §7.6? The text could not be read (paywall), so the section-level locator was not checked.

## Previous findings

The previous review (of this same head) had no finding (no R01); its other remarks against this head and the description as it stands now:

- C01 (description said two anchors change) — repaired: the description now reads "The anchors other roadmaps link to still resolve: … those of old Layer 2.1 and of "Abstract universal central extensions" by explicit anchors placed before §2.1 and §7.1", which README lines 145 and 552 confirm.
- N01 (four sections without a locator) — not repaired: §4.2, §7.3, §7.7, §7.8 untouched; written again as N01.
- N02 (two references cited nowhere) — not repaired: lines 1074–1077 untouched; written again as N02.
- The two questions for the author are untouched and written again.

The repair of the description introduced no new problem: its new sentence and the following one on the paragraph after the Scope table (README lines 910–916) are both true at the head.

## Verified sound

The folder's diff since the previous review is empty and changes no statement; the rows are for statements and Checks that the description (the text read this round) cites.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| "28 Checks in 16 sections" (description) | count of Check blocks and bullets in the README | 16 blocks; bullets 3+2+1+1+2+2+2+1+2+4+1+2+2+1+1+1 = 28 | agrees | none |
| §5.2 Clifford's theorem, Check `C₄` over `ℚ` | `W = ℚ²`, `g` rotation, `N = ⟨g²⟩` | `g² = −I`: `χ_W(g²) = −2`; right side `e·χ_V(g²) = 2·(−1)`; `dim W = 2 = e·[G:T]·dim V = 2·1·1`; over `ℂ` each `g ↦ ±i` gives `e = 1` | holds; `e` depends on `k` as described | none |
| §5.3 `clifford_correspondence`, Check `S₄ ⊃ V₄` | `χ` with kernel `⟨(1 3)(2 4)⟩`; also `N = 1`, `N = G` | orbit of `χ` has 3 characters, so `[S₄ : T] = 3`, `|T| = 8`; `[T,T] = ⟨(1 3)(2 4)⟩`, 2 of 4 linear characters restrict to `χ`; `dim Ind = 3`, `3 + 3 = 6 = dim Ind_{V₄} χ`. `N = 1` or `N = G`: `T = G`, induction is the identity | bijection `2 ↔ 2`; hypothesis in Lean is `[(inertia V).FiniteIndex]`, no `Finite G`, as described | none |
| §2.3 normalization, Checks over `𝔽₂` and `ℝ` | `C₂`, `H = 1`, `k = 𝔽₂`; `C₃` on `ℝ²` | `(|G| : k)⁻¹ = 0⁻¹ = 0`, pairing `0 ≠ 1`; `(4 + 1 + 1)/3 = 2 = dim_ℝ ℂ ≠ 1` | both hypotheses needed, as described | none |
| §7.7 Check `A₃ ◁ S₃` over `ℚ` | `D = ℚ(ω)`, `Q = C₂`, factor `1` | crossed product has dimension `2·2 = 4`, acts faithfully on `ℚ(ω)`, so is `M₂(ℚ)`: 1 simple module; `ℚ[C₂]` would give 2; `Ind U` has dimension 4 = 2 copies of the standard | agrees with the description's `M₂(ℚ)` | none |
| §7.5 `exists_scalarProjectiveInertiaExtension` universes | elaborated signature | `k : Type u`, `G : Type v`; the class statements have `k G : Type` | as the description says | none |
| §3.1 and §7.1 replaced data (description) | base file against head | base: exactly 2 `def`s with body `sorry` (`mackeyDirectSumIsoBiproduct`, `kernelEquiv`); head: 0, replaced by a theorem and by `kernelMap` with a real body plus `kernelMap_bijective` | agrees | none |

The rows of the earlier reviews for the untouched statements stand as in the previous review, of `67fee23`.

- Description read against the head and the base, sentence by sentence: the form (overview, 10 conventions, `### k.n` sections each with a *Needs:* line), the renumbering, the 28 Checks, the dropped supplier (SemisimpleAlgebras, linked once in the base README and nowhere at the head), the sources, each item of "Statements whose content changed", the two lists of what is and is not at the pin, and the `Suggested.lean` section; one omission (C01), no sentence contradicted.
- Lean declarations named in the description, checked in the files: 5 removed `AbstractUCE` names present at the base and absent at the head; 6 added names present at the head; no correspondence statement in the base file (a comment only).
- Cross-roadmap citations resolved: PolynomialGaloisGroupsPartIII on main names `Gassmann.restrictEquiv` and `Gassmann.normalInvariantEquiv` (README lines 264–265, 675–677, 697), as the description and the Lean docstring say; it is a consumer, not a supplier.
- Library declarations opened at the pins: none new; the folder is unchanged.
- Source locators checked: none fall in changed passages (there are none); the seeded sample's sections stand as verified, or as listed under Not verifiable, in the earlier reviews.
- Elaboration of `Suggested.lean` at this head: 13 `sorry` warnings and nothing else. The one-tactic probe and the signature comparison of the earlier review stand (file unchanged).
- Dependency check: `depcheck: 181 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed. Changes outside the folder: none.
- Overlap report: no other open pull request changes this roadmap, no cited id is dropped, no id this pull request drops is cited elsewhere.

Overlap check: read ModularCharactersAndBlocksPartII, ModularInduction and CharacterTheory on main and ModularInduction, MetaplecticAutomorphicFormsPartII, ArtinRepresentations, CharacterTheory and FiniteGroupInvariants at their open heads, as in the previous review; nothing shared. No list of roadmaps closest by named results was produced (none scored). The folder adds no object since.

Source independence: changed passages only: 0 passages changed in the folder, so 0 compared with 0 sources, none shared; largest share Isaacs, 7 of 21 locators, whose text could not be read; no layer added, removed or reordered, so the contents were not compared again (previous result: independent, from chapter titles only).

Research link: §7.1 is the universal central extension that Weibel (2013, Ch. III, Theorems 5.4–5.5) uses for the Kervaire–Steinberg identification `K₂(R) ≅ H₂(E(R); ℤ)`, consumed by StableHomotopyKTheory §3.29; Layers 5 and 7 feed ModularCharactersAndBlocksPartII. Rests on Weibel2013 lines 1970–1987 and the README's Downstream consumers.

## Not verifiable

- Isaacs, *Character Theory of Finite Groups*, Ch. 6 and Ch. 11 (§§5.1–5.3, 7.2, 7.4–7.6): paywalled, not recorded for this roadmap; not read.
- Curtis–Reiner, *Methods of Representation Theory I*, §§10–11 (§§0.1, 3.1, 5.1–5.3, 7.6): paywalled; not read.
- Serre, *Linear Representations of Finite Groups*, Part II (§§2.3, 4.1, 4.3, 6.1): paywalled; not read.
- Mackey, Amer. J. Math. 73 (1951), 576–592 (§3.1): paywalled; not read.
- James–Liebeck and Alperin–Bell (References only): paywalled; not read.
- How the hosting site renders an `<a id>` element inside a README was not tested in a browser.
- The description's list of what Tau Ceti proves at the pin was read against the README's Scope table, not opened again declaration by declaration this round.

Automatic checks set aside as false positives: the citation resolver lists eight names as found nowhere, of which seven are declared in this head's `Suggested.lean` (six `AbstractUCE` names and `Gassmann.normalInvariantEquiv`) and the eighth is the roadmap's own namespace; the signature check flags a dropped `[Group G]` on `AbstractUCE.derived`, the commutator subgroup of the free group on the set `G`, which uses no group structure on `G`.

## Source issues

- **Gap** in Weibel2013 at Ch. III, Recognition Theorem 5.4, p. 37: the source says uniqueness of the map out of `[F,F]/[R,F]` follows from Lemma 5.3.3, without showing that group perfect as the lemma requires; it should be noted that perfect `G` gives `F = [F,F]·R`, so every commutator of `F` is a commutator of elements of `[F,F]` modulo `[R,F]`; affects the proof.

## For the human reviewers

- Not tested: Isaacs, *Character Theory of Finite Groups*, has the largest share of the locators (7 of 21 in the README body) and could not be read legally; wording was not compared with it, and its contents only at the level of chapter titles.
