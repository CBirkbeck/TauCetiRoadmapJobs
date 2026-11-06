# Review of ArithmeticGaloisRepresentations (pull request #856 at ef45a6f)

**Verdict:** needs changes

Incremental re-review of the 10 lines changed since `cdbe447` (7 insertions, 3 deletions, all in `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`; `Suggested.lean` and everything outside the folder unchanged). The two changed passages are the repairs of the previous report's R02 (§2.1 compositum locator) and R03 (§7.11 twist invariance locator); both were checked against the cached texts at their locators and are correct. The previous report's R01, on the pull-request description, is unrepaired and is written again below. The gate, the dependency check and the elaboration were run on this head. Nothing blocks.

## R01 (P3) — The pull-request description's merge-order block and supplier paragraph do not match the README's suppliers or the declared gap

**Location:** the pull-request description (quoted as data in the job scratch): the block "#1227 (StableHomotopyKTheory) → … → #849 (AbelianSchemesAndArithmeticModuli) → **this pull request** (#856). It also depends on … #248 (LFunctions, roed-math)" and the paragraph "**Supplier amendments.** … are supplied by the amendment pull requests #1410 and #1411 to those roadmaps on main; this pull request merges after both."

**Claim:** the block lists the open pull requests this one merges after, and the paragraph says how the two ramification suppliers are obtained.

**Witness:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:407–439` and `:2454–2460` consume RamificationOfCompleteDiscretelyValuedFields §§3a.1–3a.3 and 4a.1–4a.3, a new roadmap folder in open pull request #1410 (merge-order position 2; the folder is not on main), which the block omits. The block names #248 for LFunctions, which is on main now (`TauCetiRoadmap/LFunctions`) and which the README cites only as a non-supplier (`:146–149`). The paragraph calls #1410 an amendment to a roadmap on main (it is a new folder) and says the Layer 7 reciprocity is "supplied by" #1411 (open, draft), whereas the README (`:446–455`) declares it as `What ClassFieldTheory must provide (gap:unit-filtration-reciprocity)`; the package has no `design/plan.json`, so the README is the only place the slug is declared.

**Repair:** regenerate the merge-order block so that it names #1410 (RamificationOfCompleteDiscretelyValuedFields, new folder) and drops #248; replace the "Supplier amendments" paragraph by one sentence saying that the README declares the supplier gap `gap:unit-filtration-reciprocity` on ClassFieldTheory Layer 7 and that, the package predating `design/plan.json`, the slug is declared in the README's supplier contracts only. Re-raised: R01 of the previous report (itself re-raising R01 and R03 of the two before it); the description captured for this round is unchanged.

## Previous findings

- R01 — not repaired: the description captured for this round still reads "#248 (LFunctions, roed-math)" and "supplied by the amendment pull requests #1410 and #1411 to those roadmaps on main"; written again as R01 above.
- R02 — repaired: `README.md:1507–1516` now cites Krasner's lemma as Mathlib's `IsKrasner.krasner` and, for the statement, "Darmon–Diamond–Taylor 2007, §2.1, p. 51", with the `F = ℚ` form (algebraic elements of the completion form an algebraic closure, the stabiliser maps isomorphically onto `G_{ℚ_p}`) and "the argument over a number field `F` is the same". `254f6e29…` lines 1919–1925, between the page markers of printed pp. 51 and 52, say exactly that. Deligne 1973, 3.12 is kept only at `:1533`, `:1632` and `:1643`, whose setting it fixes. `IsKrasner.krasner` is `Mathlib/Analysis/Normed/Field/Krasner.lean:63` at the pin, with its instance `IsKrasner.of_completeSpace` (`:117`) for a complete base field and an algebraic extension, which `F̄_v / F_v` satisfies; the `*Needs:*` line's `TauCetiRoadmap.LocalFieldsRamification` layer 0 is "Layer 0: local fields and their finite extensions" of `Completed/LocalFieldsRamification/README.md:72` on main. No new problem introduced.
- R03 — repaired: `README.md:5077–5078` reads "Def. 7.5.6, Rem. 7.5.8, Def. 7.5.11, pp. 198–201". `7c8d74b0…` line 9634 (printed p. 199, inside the range) is Remark 7.5.8: `ρ` is vast iff every character twist of `ρ` is vast, by Lemma 7.5.3. Rem. 7.5.4 is kept for the no-`p`-quotient sentence. No new problem introduced.

## Verified sound

**Gate, dependency check, elaboration.** The gate on this head, run as prescribed: every check `0`, `OK` (the worker's gate.md also records `build=0`). The prescribed dependency check: `depcheck: 242 roadmaps, 2378 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisRepresentations/Suggested.lean` from the pinned checkout: exit 0 in 22 s, exactly 20 `declaration uses sorry` warnings (lines 56, 66, 77, 110, 143, 158, 189, 229, 246, 260, 274, 292, 320, 331, 394, 407, 418, 427, 444, 465) and no other diagnostic; one `import Mathlib` and five `TauCeti.*` modules; 475 lines. `git diff --stat cdbe447..HEAD` touches only the README (10 lines); `git diff --stat origin/main...HEAD` outside the folder is empty. Since `Suggested.lean` is byte-identical to the file the previous report read, its signature comparison (33 declarations against the README's `*Lean:*` notes), its one-tactic padding probe (20 errors at the 20 theorem lines, nothing closes) and its headline inventory carry forward unchanged.

**The changed passages and what cites them.** §2.1 *Global closure in the local closure* is cited by the decomposition-group API (`:1529–1533`, Deligne 3.12 kept) and the local embedding (`:1628–1643`); neither cites the compositum locator, and both still read as before. §7.11 *Enormous, tidy and vast* is consumed by its Checks (`:5080–5087`) and the verification lemmas, whose locators (Lemma 7.5.9 and following, from `:5088`) are unchanged. The style scanners pass on the new sentences (no process words, no pull-request numbers, Unicode mathematics, locator in parentheses at the claim, `*Needs:*` line item by item). The `Darmon–Diamond–Taylor 2007` name matches the References entry (`:5360`) and the other full-name citations of that text (`:2843`, `:2856`, `:3044`, `:3225`).

**Supplier citations in the changed lines, resolved.** Mathlib `IsKrasner.krasner` (`Mathlib/Analysis/Normed/Field/Krasner.lean:63` at the pin); `TauCetiRoadmap.LocalFieldsRamification` Layer 0 on main (`Completed/LocalFieldsRamification/README.md:72`). RamificationOfCompleteDiscretelyValuedFields (position 2) remains earlier than this roadmap (position 42); the worker's `roadmaps resolve` found no cross-roadmap citation missing, and its 32 unresolved Lean names are this roadmap's own declarations plus the two ReductiveGroupsPartII `Building.*` names resolved at that open head by the previous report. The declared gap `gap:unit-filtration-reciprocity` (`:446–455`) is unchanged: supplier named, precise, minimal.

**Seeded sample.** The sample targets the diff touches are §2.1 (R02) and §7.11 (R03), checked above against `254f6e29…` and `7c8d74b0…`. The other thirteen seeded targets (1.2, 1.9, 2.3, 3.0, 3.6, 4.4, 4.7, 5.5, 5.6, 5.11, 5.13, 6.1, 6.3, 7.6) are untouched by the diff; their locator checks in the previous report (its sample table, read against the same cache files) carry forward.

**Computed adversarial pass.** Rows for the two changed statements are new; every other row carries forward from the previous report (its table, which gave the values; cited as "r10").

| Statement | Instances and values | Result |
| --- | --- | --- |
| 2.1 `F̄_v = F_v · ι(F̄)` (changed locator) | `F = ℚ`, `v = p`: `x ∈ ℚ̄_p` with separable minimal polynomial `f` of degree `d` over `ℚ_p`; `ℚ` dense in `ℚ_p`, so `g ∈ ℚ[X]` close to `f` has a root `β` with `\|x − β\| < min \|x − x'\|` over conjugates `x' ≠ x`; `IsKrasner.krasner` gives `ℚ_p(x) ⊆ ℚ_p(β)`, and `[ℚ_p(β):ℚ_p] ≤ d` forces equality; so `x ∈ ℚ_p · ℚ̄`. Converse inclusion `ℚ_p · ℚ̄ ⊆ ℚ̄_p`: both factors algebraic over `ℚ_p`. Split case `F = ℚ(i)`, `v ∣ 5`: `F_v = ℚ_5`, `ℚ_5(√5) = ℚ_5(ι(√5))`. Wrong model "the completion of `ι(F̄)`": `ℂ_p` is not algebraic over `ℚ_p` (uncountable degree), excluded since the README's `F̄_v` is the algebraic closure, and DDT's statement is about the algebraic elements of the completion. Automorphism of `F̄_v` over `F_v` fixing `ι(F̄)`: fixes the compositum, so the identity; the instance `IsKrasner.of_completeSpace` needs `CompleteSpace F_v` and `Algebra.IsAlgebraic F_v F̄_v`, both hold. | Retained |
| 7.11 vastness invariant under twists (changed locator) | `ρ̄` with `ρ̄(G_{F(ζ_{p^N})})` enormous, `χ : G_F → k^×`: `(ρ̄ ⊗ χ)(G_{F(ζ_{p^N})})` has the same image in `PGSp₄(k)`, and enormity depends only on that image (Lemma 7.5.3), so (E1)–(E3) transfer; for weak enormity directly: `h` with eigenvalues `(a, b, ν/a, ν/b)` becomes `(ca, cb, cν/a, cν/b)` with `c = χ(h)`, similitude `c²ν`, distinctness preserved; `ad⁰ (ρ̄ ⊗ χ) = ad⁰ ρ̄`, so the eigenvalue `1` on `W ⊆ ad⁰` and the field `L` of `ad⁰` are unchanged, hence `ζ_p ∉ L` is unchanged; the "iff" is symmetric since `ρ̄ = (ρ̄ ⊗ χ) ⊗ χ⁻¹`. Wrong model "tidiness invariant under twists": `h` with `ν(h) = 1` and no eigenvalue ratio `1` can become `ν = c²`, so tidiness is not twist-invariant; the README claims invariance only for vastness. | Retained |
| 1.2 Tate twist and determinant conventions | r10 (`χ_ℓ(Frob_p) = p`, `det M(χ) = 4`, `c = −1` on `ℤ_ℓ(1)`) | Retained |
| 1.2 conjugacy over `ℤ_ℓ` versus `ℚ_ℓ` | r10 (`(1 a; 0 1)` versus `(1 ℓa; 0 1)`) | Retained |
| 1.5 `baire_descent` | r10 | Retained |
| 1.6 `exists_integral_conj_GL` | r10 | Retained |
| 1.8 `iso_of_charpoly_eq` | r10 (`F₂`, `ℤ/2`, `(X−1)²`; `ℤ/3` over `F₄`) | Retained |
| 1.9 lattice reductions | r10 | Retained |
| 1.10 coefficient twists | r10 (`χ̄^p ≠ χ̄`, orders `p² − 1`, `p − 1`) | Retained |
| 2.1 decomposition groups | r10 (`ℚ(∛2, ζ₃)` at `5`; `ℚ(i)`; `B⁻¹AB`) | Retained |
| 2.4 `grothendieck_quasiUnipotent` | r10 | Retained |
| 2.5 local factors | r10 (`Sp(2)`: `L = 1 − q⁻¹X`; cyclic block `1 − 2X²`) | Retained |
| 2.6 monodromy filtration, weights, Jordan strings | r10 | Retained |
| 3.0 inertia and residue extension | r10 (`ℚ_2(ζ_8)`, `ℚ_2(ζ_24)`, `y^p − y = st^{−p}`) | Retained |
| 3.4 functoriality | r10 | Retained |
| 4.1 `isAbsolutelyIrreducible_of_isOddAt` | r10 | Retained |
| 4.4 `dickson_projectiveImage` | r10 (`D_n`, `p = 2`; `D_p` in a Borel; `F₀ = F'`) | Retained |
| 4.5 Serre's propositions | r10 (`F_7`, `F_11`, `F_9`) | Retained |
| 5.4 trace identity | r10 (`diag(2,3)`, `h = 1`: `0` against `25`) | Retained |
| 5.5 `imageAlgebra_isCentralSimple` | r10 (`Q₈` over `ℂ`: `ℍ`, `s = 2`) | Retained |
| 5.7 `realizable_of_charpoly_mem` | r10 | Retained |
| 5.10 `carayol_conj_of_trace_eq` | r10 | Retained |
| 5.13 function fields | r10 (`ℙ¹_{F_{Q²}}`: `0` and `2(Q²+1)` points) | Retained |
| 6.3 `multiplicative_residual_unramified_iff` | r10 (`q = ℓ^p`, `q = ℓ`) | Retained |
| 6.4a `compact_matrix_frattini_isOpen` | r10 | Retained |
| 6.6 Serre's wild bound | r10 | Retained |
| 7.1 powers and Asai | r10 (`C_{2,2}` degree `4`; `GL₂(F_2)`: `V ⊗ V ≅ V ⊕ P(1)`) | Retained |
| 7.6 `exists_linear_lift` | r10 | Retained |
| 7.9 adequacy criteria | r10 (`A = (0 4; 1 4)` over `F_5`) | Retained |
| 7.10 enormity statements | r10 | Retained |
| 7.11 `GSp₄` image conditions, Lemma 7.5.5 bounds, Lemma 7.5.18, §7.5.16 | r10 (`\|Sp₄(F_3)\| = 51840`; `δ = 2`, `N ≥ 3`/`4`; `k = F_5`) | Retained |

## Not verifiable

- Nothing in the changed lines. The previous report's items (Tate 1979 (4.1.5); Serre 1965 Thm 7; Thorne 2017 Def. 2.20; Serre, *Local Fields*, uncertified; Hartshorne, Neukirch, Fulton–Harris, Milne by locator; SGA 1 XIII at its heading; CG 2018 p. 306 matched to the arXiv text) are untouched and carry forward.
- Ownership against open pull requests: the changed lines introduce no new object; the previous report's check through `roadmaps grep` and the sibling checkouts carries forward, and pull requests the brief names without files were not searched.

## Source issues

- none new in the lines checked this round (DDT §2.1 p. 51 and BCGP21 Rem. 7.5.8 read as the README states them). The previous report's four BCGP21 and BLGG items stand.
