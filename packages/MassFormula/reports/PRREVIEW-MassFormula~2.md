# Review of MassFormula (pull request #1819 at 5980bc8)

**Verdict:** needs changes

**Summary.** Needs changes, for one reason: the mathematics of the folder is sound (every statement was recomputed on small cases and none failed), but the Tau Ceti commit the repository now pins already proves every target of the roadmap, on its own definitions, and neither the README nor `Suggested.lean` cites it; the Lean file instead redefines nine library objects and leaves 22 proved theorems as `sorry`. The three findings of the previous review are repaired. There are four small corrections and two format notes, none blocking. Two things are left to a human: whether a roadmap that is complete in the library is closed out in this pull request, and the primary sources, none of which could be read.

## R01 (P2) — Every target of the roadmap is proved in the pinned Tau Ceti, and the folder restates them as open instead of citing them

A reader of this head is told that the counting machinery "is missing" from the libraries and is given 22 `sorry` goals and nine definitions to converge on; an implementer who follows it rebuilds a second copy of a development that exists. The pin moved with the merge of main (the previous review read a Tau Ceti commit that had none of this; the manifest now pins `2fd255d`), and at that commit:

- `TauCeti/NumberTheory/LocalField/MassFormula/Basic.lean` defines `TauCeti.totallyRamifiedOfDegree` (line 111), `IntermediateField.IsTotallyRamified`, `IntermediateField.discriminantExponent` and `IntermediateField.wildExponent`, with the comparison theorems (lines 93, 181), `sub_one_le_discriminantExponent` (214), `wildExponent_eq_zero_iff` (246) and the invariance under `K`-isomorphism (283, 303);
- `MassFormula/Representative.lean` line 65 defines `TauCeti.IsRepresentativeSet` with the body this file gives; `MassFormula/Eisenstein/Region.lean` defines `eisensteinSet` (99) and proves `measure_eisensteinSet` (214); `TauCeti/FieldTheory/IntermediateField/RootCount.lean` line 67 defines `IntermediateField.rootCount`;
- `MassFormula/Main.lean` proves Theorem 1 (72), Theorem 2 (89), the dichotomy (100), the real convergence (109, 118) and the tame count (125); `Orbit.lean` line 65 the orbit count; `Countable.lean` line 44 countability; `RootCount.lean` line 136 the almost-everywhere root-count identity; `Integral.lean` line 232 the integral of the root count; `RootCount/Basic.lean` line 117 the local constancy; `RootCount/Fibre.lean` line 158 the local fibre count;
- `TauCeti/LinearAlgebra/FreeModule/CardQuotient.lean` line 114, `Matrix.card_quotient_range_mulVecLin_eq_pow`, is `card_quotient_range` word for word (on a scratch copy, `exact Matrix.card_quotient_range_mulVecLin_eq_pow hπ hk` closes it); `TauCeti/RingTheory/DiscreteValuationRing/Hensel.lean` line 131 is the Newton estimate, with equality and for a Henselian ring; `TauCeti/MeasureTheory/Group/LocalFieldScaling.lean` line 306 is the scaling law.

The other sorried statements do not close by one `exact` only because they are stated on this file's parallel definitions, which Lean does not unfold to the library's (tried for Theorem 1, the dichotomy, countability, the orbit count and the tame count: each fails with a mismatch between `totallyRamifiedOfDegree` here and `TauCeti.totallyRamifiedOfDegree`). The two roadmaps that consume this one, EtaleMassFormula and PadicExtensionFamilies on main, already cite these Tau Ceti names and say that Tau Ceti "realizes" this roadmap.

The smallest change that makes the text true: add a `### From Tau Ceti` subsection to the supplier contracts that names the modules and declarations above as the realization of Layers 0–4, and in `Suggested.lean` import those modules and state the headline theorems on Tau Ceti's carriers, dropping the nine parallel definitions; each statement is then closed by the library's theorem, as `Completed/LocalFieldsRamification/Suggested.lean` does for its own. The layers, proof routes and worked examples need not change.

## C01 — The pull request's description no longer describes the change

The description says "This touches only `TauCetiRoadmap/MassFormula/README.md`" and "Krasner's discriminant-refined count stays a Long-horizon item". At this head `Suggested.lean` is changed as well (module header, three Tau Ceti imports in place of the import of the supplier's module, six names requalified from `LocalFieldsRamification.` to `TauCeti.`), the README is reordered (scope and supplier contracts moved after the layers, `Standing conventions` now `Conventions`, the `Ordering` section now `How to read the build`), and the `Long horizon` section is replaced by `Continuations in other roadmaps`, which points Krasner's count to Layer 5 of PadicExtensionFamilies. No statement, target or Lean declaration is removed. A description that says this, and a title that is not only about Bhargava, would be right.

## C02 — The note that the Eisenstein converse "has no declaration" is out of date

In the supplier contracts (README lines 334–340, the table row at line 373, and the comment at lines 191–198 of `Suggested.lean`) a reader is told that "a root of a degree-`n` Eisenstein polynomial generates a totally ramified extension … in which its power basis generates the ring of integers" is only a README item of the supplier. At the pin it is three declarations of `TauCeti/NumberTheory/LocalField/Eisenstein/TotallyRamified.lean`: `isTotallyRamified_of_eisenstein_adjoin_eq_top` (line 145), `algebra_adjoin_eq_top_of_eisenstein_adjoin_eq_top` (line 153) and `adjoin_eq_top_of_eisenstein_of_natDegree_eq_finrank` (line 161); and `TauCeti.isTotallyRamified_iff_exists_eisenstein_generator` (line 180) takes the field-level hypothesis `K⟮π⟯ = ⊤`, not `Algebra.adjoin 𝒪[K] {ξ} = ⊤`. Cite these in place of the README item.

## C03 — Several sentences describe the supplier's README as it was before its rewrite

The local fields and ramification README on main is now a record of a completed roadmap. It still maps its former "Layer 3" and "Layer 3, consumer contract" labels to its present sections, so the citations resolve, but it no longer states a consumer contract that "requires" or "prescribes" comparison theorems or "permits" junk-tolerant wrappers (README lines 104 and 384, the docstrings at lines 41, 81, 108 and 160 of `Suggested.lean`), and its worked examples give the breaks of `ℚ_2(i)` and `ℚ_2(√2)` (1 and 2, hence `d = 2` and `d = 3` by Hilbert's formula), not "those two discriminant values" (README line 274). Say what the two proved comparison theorems are, checks by unfolding that each wrapper agrees with the library's invariant on a finite subextension, and cite the supplier's *Downstream consumers* entry for what it supplies.

## C04 — `tsum_rootCount` carries a normalization hypothesis it does not use

The almost-everywhere identity `∑ rootCount = n` does not depend on the normalization of the measure, and `aemeasurable_rootCount` beside it has no such hypothesis. `hμ : μ (integerBox K n) = 1` at line 426 can go: Tau Ceti's `ae_tsum_rootCount_eq` (`MassFormula/RootCount.lean` line 136) proves the statement for every additive Haar measure.

## N01 — The layers state their targets as bullets, so no target has a number

Other roadmaps can cite only "MassFormula Layer 0" or "Layer 4". Numbered subsections (`### 4.1 Theorem 1`, …) would let them cite a statement.

## N02 — Process wording

"that instance is now in Mathlib", "`sorry` is allowed in this human-owned roadmap library", "Serre's phrase verbatim" and the ⚠ markers date the text; plain statements would not.

## Verified sound

**Previous findings.** R01 of the previous review (module header): repaired, `Suggested.lean` opens with `module` and `public import` lines and elaborates with exit 0. R02 (import of another roadmap's module): repaired, lines 3–6 import `Mathlib` and three `TauCeti.*` modules, all present at the pin. R03 (Krasner's count unowned): repaired, "Krasner's refinement … is Layer 5 of the `p`-adic extension families roadmap"; that heading is line 1138 of PadicExtensionFamilies on main.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `wildExponent` = `d + 1 − n` | `ℚ_2(√2)`, `ℚ_2(i)`, `K`, `L` infinite | 3+1−2 = 2; 2+1−2 = 1; 0+1−1 = 0; junk 0+1−0 = 1 | Serre's `c`; junk excluded by membership |
| `sub_one_le_…DiscriminantExponent` | `ℚ_2(√2)`; `ℚ_3(∛3)`, d = 2+3; `K` | 1 ≤ 3; 2 ≤ 5; 0 ≤ 0 | holds |
| `wildExponent_eq_zero_iff` | `ℚ_p(√p)` p odd; `ℚ_2(i)`; `ℚ_2(∛2)` | c = 0, p ∤ 2; c = 1, 2 ∣ 2; c = 0, 2 ∤ 3 | both directions hold |
| Theorem 1 | n = 1; p odd, n = 2; `ℚ_2`, n = 2 (six fields, c = 1,1,2,2,2,2); n = 0 | 1; 2; 2·½ + 4·¼ = 2; empty sum 0 = 0 | holds; `0 < n` not needed |
| Theorem 2 | `ℚ_2`, n = 2 (#Aut = 2); `ℚ_2`, n = 3 (one class, #Aut = 1); n = 0 | 2·¼ + 4·⅛ = 1; 1; 0 ≠ 1 | holds; `0 < n` needed and present |
| Orbit count | Galois `L`; `ℚ_2(∛2)` | 1·n; 3·1 = 3 | holds |
| Finiteness dichotomy | `ℚ_p`; `𝔽_p((t))`, n = p; `𝔽_p((t))`, p ∤ n | finite, right side false; `X^n + t^m X + t`, f′ = t^m, d = nm distinct, separable; n members | iff holds |
| Uniform bound in the dichotomy | `(n : K) ≠ 0` | c = d − n + 1 ≤ v_L(n) = n·v_K(n) | as README line 243 |
| Convergence, tame count | `𝔽_p((t))`, n = p; p odd, n = 2 | ℝ≥0∞ sum p < ∞; 2 | hold |
| `eisensteinSet`, `mem_eisensteinSet_iff` | n = 0; `X² − 2`, `X² − 4`, `X² − 1` over `ℚ_2` | `toPoly = 1`, set is `univ` (excluded by `0 < n`); in; out (4 ∈ 𝔪²); out | determined; wrong model "all coefficients in 𝔪" excluded by the second clause |
| `measure_eisensteinSet` | n = 1; `ℚ_2`, n = 2 | q⁻¹ − q⁻² = q⁻¹(1 − q⁻¹); ½·(½ − ¼) = ⅛ = 2⁻²·½ | holds |
| `lintegral_rootCount` | n = 1; `ℚ_2`, n = 2 summed over six fields | μ(E₁) on both sides; 2·2⁻³·½ + 4·2⁻⁴·½ = ¼ = 2·⅛ | holds, consistent with Theorem 1 |
| `tsum_rootCount` | separable Eisenstein `a`; `X^p − t` | n roots, each in exactly one `K(x)`: n; no root in the separable closure: 0 on a null set | a.e. needed; `hμ` not (C04) |
| Local fibre count (README) | general: Σ_{i<n} ⌈(m − i)/n⌉ = m for m = nρ + d; `ℚ_2(√2)`, ρ = 1 | box measure q^{−(nρ+d)}; v(g′(ξ)) = d since nρ + d − 1 > d; cube `√2 + 2𝒪_L` contains `−√2` | holds for d + n ≤ nρ; counterexample below it as stated |
| `exists_isRoot` | `ℤ_2`, `X² − 17`, y₀ = 1; F′(y₀) = 0; F(y₀) = 0 | 4 ≤ 1 + 3; hypothesis ⊤ < x false; z = y₀ | holds, sharp |
| `eq_of_isRoot_of_addVal_lt` | same F, z′ = −z; general | v(2z) = 1 = v(F′(z)), hypothesis false; 0 = (z′−z)(F′(z) + (z′−z)G) forces v(F′ z) ≥ v(z′−z) | holds |
| `card_aroots_eq` | `X² − 2` vs `X² − 2 + 2^T u` over `ℚ_2`, T ≥ 4; degree of g | 1 − 2^{T−1}u a square, same count in each L; T > 0 forces equal degree | holds |
| `card_quotient_range` | n = 0; diag(π); M = 0 | 1 = q⁰; q; hypothesis false | holds; proved at the pin (R01) |
| `le_addVal_sum_eisenstein_powerBasis_iff` | `ℚ_2(√2)`: r = 3; r = 1; degree 0 | v(c₀) ≥ 2, v(c₁) ≥ 1; v(c₀) ≥ 1, c₁ free; no root, vacuous | holds |
| `adjoin_mem_…`, `exists_eisenstein_generator` | `√2` over `ℚ_2`; `X^p − t` | `ℚ_2(√2) ∈ σ(2)`; no root, vacuous | hold |
| Worked example, `ℚ_2`, n = 2 | square classes ±1, ±5, ±2, ±10 | 5 unramified; −1, −5: d = 2; ±2, ±10: d = 3 | six fields as stated |

- Source locators checked against the text: 0 of 9 (see *Not verifiable*).
- Library declarations opened at the pins: 15 Mathlib (among them `hensels_lemma`, `Padics/Hensel.lean` line 460, with the four clauses the README lists; `pow_sub_one_dvd_differentIdeal`, `DedekindDomain/Different.lean` line 743; `lintegral_tsum`, `Integral/Lebesgue/Add.lean` line 362; `ENNReal.summable_toReal`) and 21 supplier names, each found in `Completed/LocalFieldsRamification/Suggested.lean` and, except `localDiscriminantIdeal`, in Tau Ceti.
- Cross-roadmap citations resolved: 3 (LocalFieldsRamification, EtaleMassFormula, PadicExtensionFamilies with its Layer 5 anchor), all on main; the anchor `#layer-4-the-mass-formulas` that EtaleMassFormula cites is unchanged.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: exit 0, 22 `sorry` warnings, nothing else. The elaborated types of the 33 declarations were compared with the README; the binders dropped are `[IsUniformAddGroup K]` and the like on definitions whose types do not need them.
- Padding probe: one `exact` with a Tau Ceti theorem on six targets; one closes, five fail on the parallel definitions (R01).
- Headline theorems (Theorems 1 and 2, the dichotomy, convergence, the orbit count, the tame count): all stated in `Suggested.lean`, lines 455–494.
- Ownership: no other roadmap, on main or open, declares `totallyRamifiedOfDegree`, `wildExponent`, `eisensteinSet` or `IsRepresentativeSet`.

Overlap check: read EtaleMassFormula (main and its two open revisions), PadicExtensionFamilies, LocalFieldsRamification; nothing shared between roadmaps (both consumers cite this roadmap and Tau Ceti; the open FieldOfNorms head was not read).

Source independence: 0 passages compared with 0 sources, none readable; largest share serre1978, 8 of 9 locators; contents not compared (a six-page note whose text could not be read).

Research link: The headline targets are Theorems 1 and 2 of Serre 1978; Krasner 1966 refines the count by discriminant and Bhargava 2007 extends it to étale algebras, the local input to conjectured densities of number-field discriminants; README summary, *Continuations* and *References*.

## Not verifiable

- Serre 1978, C. R. Acad. Sci. Paris 286, 1031–1036 (Thm. 1, Thm. 2, Remarks 1° and 3°, Lemmas 1–3, eqs. (1), (3), (5)–(13), p. 1031 footnote 1): the sources service found no legal copy.
- Serre 1979, *Local Fields*, Chap. I §6 Prop. 17 and Chap. III §§3, 6: paywalled, recorded as uncertified.
- Bhargava 2007, IMRN: the publisher's page refuses access; no open version found.
- Krasner 1966, CNRS proceedings, 143–169: no legal copy found.

Automatic checks set aside as false positives: the rule against `letI`/`haveI` in a theorem's signature, for the two comparison theorems and the box corollary: the structures on a subextension carrier are installed by the consumed adapters and are not instances, so an instance binder would state the theorem for an arbitrary structure instead.

## Source issues

- none

## For the human reviewers

- Scope: the pinned Tau Ceti (`2fd255d`) proves every target, and the folder's `STATUS.md` says the roadmap is complete. Whether it is closed out into `Completed/` here or in a separate change is yours; R01 asks only for the citation.
- Not tested: Serre 1978 holds 8 of the README's 9 source locators and could not be read, so neither the wording nor the arrangement was compared with it.
- Licence: the README (lines 420–457) says the mathematics was first formalised in the proposer's repository `0stellensatz/MassFormula` (Apache-2.0) and maps layers to its files; that repository was not opened, so agreement of `Suggested.lean` with it was not checked.
