# Review of AbelianVarietiesOverFiniteFields (pull request #1720 at e6d7112)

**Verdict:** accepted

Incremental re-review of the 93 lines changed since `da079ae` (the diff of `README.md` and `Suggested.lean`; no file outside the folder changed). The previous report's three findings are accounted for under `## Previous findings`; the changed passages, the suppliers and pinned declarations they name, the gate, the elaboration and the padding probe were checked as in a full review. One P3 note remains; nothing blocks.

## R01 (P3) — 8.4 cites the proper-ideal lemma where the pin states the Gorenstein fact itself

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1423–1424` ("an order in a quadratic field is Gorenstein (Tau Ceti `Quadratic.lean`, `isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two`: proper ideals are invertible)") and the `*Needs:*` line at 1434.

**Claim:** the quadratic Gorenstein statement is consumed from the pinned proper-ideal criterion.

**Witness:** the pinned `TauCeti/NumberTheory/NumberField/Global/Orders/Gorenstein.lean:454` states `NumberFieldOrder.isGorenstein_of_finrank_eq_two : Module.finrank ℚ K = 2 → O.IsGorenstein` outright, derived from the `Quadratic.lean:143` criterion applied to the trace dual. The cited lemma is correct and does imply the claim (the trace dual is proper, hence invertible), but the pin already has the theorem as stated.

**Repair:** cite `isGorenstein_of_finrank_eq_two` (`Gorenstein.lean`) for the quadratic Gorenstein fact in 8.4 and in the supplier contract at line 249, keeping `isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two` for the proper-ideal equivalence where 8.4 uses it. Tested: `#check` of both names elaborates at the pin (the `Quadratic.lean` name from the pinned file, the `Gorenstein.lean` name read at its line 454).

## Previous findings

- R01 — repaired (in this folder): line 507 now reads "§1.0's `IsWeilPolynomial q P_A ∧ IsWeilSymmetric q g P_A`", line 1060 "the elevation of `P_A` defined in §1.0"; no "sibling" remains, and the README cites CurvesOverFiniteFields only as a downstream consumer (line 2123). This roadmap is the owner of §1.0 by merge direction: CurvesOverFiniteFields at its open head (`1e1b4ad`, lines 174–179 and 227–232) consumes this roadmap's §§4.6, 5.3–5.6 and 10.6, so it sits after this roadmap and cannot supply it. The sibling's text still says the opposite (its lines 29 and 174–179) and still plans the same objects in its Layer 4 (lines 504–719); that is the sibling's finding to repair in its own review, and nothing in this folder depends on it.
- R02 — repaired: lines 245–263 now cite pinned declarations by file, each confirmed at the pin (`Gorenstein.lean:124,372`, `Lattice.lean:70,75`, `Quadratic.lean:143`, `Discriminant.lean:107`, `Picard.lean:34`, `Basic.lean:228`, `Comparison.lean` docstring line 20, `Supersingular.lean:86,91`, `Trivial.lean:111,169`); `Module.End.IsSemisimple` written at lines 194, 1573, 1608; EllipticCurves Layer 3 (main, line 741 trace criterion, 685 finiteness, 769 zeta function) and Layer 1 (line 527 ordinary order) cited by section; GlobalNumberFields Layer 11 (Completed, lines 571, 592–593) for the conductor-prime maps; ArithmeticStatisticsPartI cited by its heading "Finiteness of an isogeny class and of unpolarized classes" (its line 2550 under "Supporting constructions", 2518); line 38 now says the Layer 8 files are new beside the pinned ones. No name of this round's contract is missing at the pin.
- R03 — repaired: no line of `Suggested.lean` exceeds 100 columns (`WeakEquiv` and `weakEquiv_iff_one_mem` rewrapped, lines 85–90); the duplicated "FunctionFieldArithmetic §§5.3–5.4" is gone from the `*Needs:*` lines of 1.5 (line 550) and 7.4 (line 1237); §9.1 has one `**Checks.**` block (line 1611, eight bullets).

## Verified sound

**Scope of this round.** The diff touches: the suggested-home paragraph (33–40), the Tau Ceti and section-level supplier contract (245–263), §1.0's attributions at 507 and 1060, the `*Needs:*` lines of 1.5 and 7.4, 1.6's dimension-zero citation, 6.3's pinned predicate and trace criterion, 8.3's and 9.6's elliptic-order comparison, 8.4's quadratic citation, 9.1's semisimplicity name and merged Checks, 9.4's finiteness citation, and the two reformatted Lean declarations. Every one was read in context and checked below. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.

**Gate and build.** The worker's gate at `e6d7112`: every counter `0`, `build=0 OK`. My own gate run from the worktree reports every counter `0` except `depcheck: NOT IN ORDER: AbelianVarietiesOverFiniteFields (insert it after its last supplier)`, which comes from main's merge order not listing the roadmap yet; the brief says that is not a finding. The required dependency check against the candidate order (which lists the roadmap at line 370, after HyperellipticCurves at 369):

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Both manifests (the worktree's and main's) pin Tau Ceti `358314d4` and Mathlib `f6090c70`; every declaration was checked at that pin.

**Elaboration.** A scratch copy of `Suggested.lean` with `#check @name` for all 15 declarations elaborated with `lake env lean` in 13 s with exactly four `sorry` warnings (lines 38, 89, 115, 148) and no other diagnostic. Elaborated types agree with `scratch/signatures.md` and with the README: `weakEquiv_iff_one_mem` carries `[Module.Finite ℚ E] [IsReduced E] (hΛ : IsOrder E Λ)` and both `IsFractionalIdeal` hypotheses (8.6's statement); the four "dropped `[Algebra ℚ E]`" leads (`colon`, `multiplierRing`, `IsInvertible`, `WeakEquiv`) are definitions whose bodies do not use the ℚ-structure, as last round. Nothing changed in the file beyond line wrapping, so no type changed.

**Padding probe.** Each of the four admitted theorems, on a scratch copy, with `first | rfl | simp [all nine definitions] | infer_instance | decide | aesop`: all four leave unsolved goals (lines 46, 91, 117, 148 of the probe). No padding.

**Headline inventory** unchanged from the previous report: Waterhouse (4.6), the weak-equivalence criterion (8.6), the Gorenstein criterion (8.4) and Picard finiteness (8.2) are stated; the others need `AbelianVariety.frobenius`, `End.charpoly`, canonical lifts, duals and polarizations or the Jacobian functor, none pinned (`AbelianVariety/` at the pin: `Basic`, `End`, `Hom`, `Isogeny`, `MorphismGroup`, `Product`, `Trivial`, `Albanese`, `TangentSpace`), and the module docstring names each.

**Cross-roadmap citations the diff touches, resolved at main or the named head:**

| Citation | Resolved |
|---|---|
| EllipticCurves Layer 3 (main) | heading line 683; finiteness of `E(𝔽_q)` 685; `frobeniusTrace` 689; `IsSupersingular E ↔ ringChar F ∣ frobeniusTrace E` 741; zeta function 769 |
| EllipticCurves Layer 1 (main) | heading 423; "`End(E)` is an order in `ℚ(π_q)` containing `ℤ[π_q]`" 527, with the `y² = x³ + x` over `𝔽₅` example `ℤ[2i] ⊊ ℤ[i]` at 525–526 (the same instance as 8.3's) |
| GlobalNumberFields Layer 11 (Completed) | heading 571; conductor 574; extension and contraction between invertible ideals prime to the conductor and maximal-order ideals 592–595 |
| ArithmeticStatisticsPartI (#1171, via `roadmaps show`) | `### Supporting constructions` 2518; "Tate's theorem over a finite field" 2544; "Finiteness of an isogeny class and of unpolarized classes" 2550, stating finitely many `𝔽_q`-isomorphism classes in an isogeny class |
| FunctionFieldArithmetic §§5.3–5.4 (rev/1474) | 1807, 1838 |
| JacobianChallenge Layer E (main) | 332 |
| CurvesOverFiniteFields (rev/1729, consumer only) | lines 174–179, 227–232 consume this roadmap's §§4.6, 5.3–5.6, 10.6 |

**Pinned declarations opened this round** (file and line at Tau Ceti `358314d4`, Mathlib `f6090c70`): `Orders/Gorenstein.lean:124` (`traceDual`), `:372` (`structure IsGorenstein`), `:394` (`isGorenstein_iff_forall_isUnit`), `:454` (`isGorenstein_of_finrank_eq_two`); `Orders/Lattice.lean:63,70` (`Module.Finite ℤ I`, `Module.Free ℤ I` instances), `:75` (`span_rat_eq_top`); `Orders/Quadratic.lean:143` (`isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two`, hypothesis `Module.finrank ℚ K = 2`); `Orders/Discriminant.lean:107` (`discr_eq_index_sq_mul : O.discr = O.index ^ 2 * NumberField.discr K`); `Orders/Picard.lean:34` (`abbrev Pic O := ClassGroup O.toSubalgebra`); `Orders/Basic.lean:228` (`maximalNumberFieldOrder` with `toSubalgebra := integralClosure ℤ K`, so `Pic` of it is `ClassGroup` of `𝓞 K` by unfolding `NumberField.RingOfIntegers`); `Algebra/CrossedProduct/Comparison.lean` (`brauerCohomologyEquiv`, docstring line 20); `EllipticCurve/Supersingular.lean:86` (`IsSupersingular p W := torsionBy (W.baseChange K̄).Point p = ⊥`), `:91` (`IsOrdinary`); `AbelianVariety/Trivial.lean:111` (`def trivial`), `:169` (`dim_trivial : (trivial K).dim = 0`); `Mathlib/LinearAlgebra/Semisimple.lean` (`Module.End.IsSemisimple`, `#check` elaborated; no `LinearMap.IsSemisimple` exists at the pin). The pinned `IsSupersingular` is the `p`-rank-zero predicate, which is 6.1's formulation for `g = 1`; 6.3's parenthetical is correct as written.

**Ownership against open work.** The only overlap found by object remains CurvesOverFiniteFields Layer 4 (R01 above, resolved in this roadmap's favour by merge direction). No `Suggested.lean` of a readable sibling declares a name in `TauCetiRoadmap.AbelianVarietiesOverFiniteFields`. Open pull requests without a checkout in the brief were not checked.

**Source sample.** Of the seeded targets, those falling in the changed passages are 1.5 and 7.4 (their `*Needs:*` lines only: FunctionFieldArithmetic §§5.3–5.4 and JacobianChallenge Layer E, resolved above), 8.3 and 9.6 (the elliptic-order comparison, EllipticCurves Layer 1 line 527, and `discr_eq_index_sq_mul` at `Discriminant.lean:107`). The other seeded targets (1.4, 2.8, 4.6, 5.3, 6.4, 7.2, 7.3, 8.1, 10.5, 10.6, 11.2) are untouched by the diff; their locators were checked in the previous report (1.4 Milne AV II Thm 1.1 p. 76; 4.6 Waterhouse Thm 4.1 printed 537; 8.1 ClassicalArithmeticCompletion §§7.4, 7.21, 7.49; 9.6 Waterhouse Thms 4.2, 4.5 printed 539–540; 10.5, 10.6 computed; the rest by instance) and carry forward.

**Adversarial pass.** Rows for untouched statements carry forward from the previous report (its tables "Adversarial pass (README)" and "(Lean)", 46 rows, all recomputed there with exact arithmetic); the rows below are the changed statements, recomputed now. `E₅`: `q = 5`, `P = T² − 2T + 5`, `π = 1 + 2i`; `E₂`: `q = 2`, `P = T² − 2T + 2`; `R = ℤ[2i]`, `O = ℤ[i]`.

| Statement | Instances | Values | Result |
|---|---|---|---|
| `WeakEquiv`, `weakEquiv_iff_one_mem` (rewrapped) | `I = O`, `J = 2O` over `R`; `I = R`, `J = O` at `𝔪 = (2, 2i)` | `(O : 2O) = ½O`, `(2O : O) = 2O`, product `O ∋ 1`, and `O ≅ 2O` locally everywhere; `(R : O)(O : R) = 2O · O = 2O ∌ 1`, and `O/𝔪O` has dimension 2 against `R/𝔪` dimension 1 | both directions agree; unchanged type |
| 6.3 pinned predicate is the `g = 1` case | `E₂`; `E₅` | `E₂`: trace 2, `2 ∣ 2`, slopes `{½, ½}`, `p`-rank 0, `E[2](K̄) = 0`; `E₅`: trace 2, `5 ∤ 2`, slopes `{0, 1}`, `p`-rank 1, `E[5](K̄) ≅ ℤ/5` | the three predicates agree on both, in both directions |
| 1.6 dimension-zero variety | `AbelianVariety.trivial` | `dim = 0`, `P = 1`, `L = 1`, `P(1) = 1` point over every `L` | consistent with 1.2's count `#A(K) = P_A(1)` |
| 8.3 elliptic order comparison | `E₅` | `ℤ[π] = ℤ[2i]`, `V = 2 − π ∈ ℤ[π]`, so `ℤ[π, V] = ℤ[π]`, index 2 in `End E = O` | agrees with EllipticCurves line 525–527 and 8.3's "equality for `g = 1`" |
| 8.4 quadratic orders Gorenstein | `R = ℤ[2i]`; `ℤ[ε] ⊂ ℚ[ε]/ε²` | `R^∨ = ½ℤ + (i/4)ℤ = (i/4)R`, invertible; `ℤ[ε]^∨ = ℤε`, not invertible (non-reduced control) | pinned `isGorenstein_of_finrank_eq_two` states it (R01) |
| 9.1 `Module.End.IsSemisimple` | `F = ·(1 + 2i)` on `ℚ(i)`; `F = [[0,1],[0,0]]` on `ℤ²` | minimal polynomial `T² − 2T + 5` squarefree, semisimple; `T²`, not semisimple, and not Weil (root 0) | the name is the pinned one; the condition is not implied by the other two (the control is excluded by the Weil condition, so semisimplicity matters only for non-squarefree Weil `charpoly`, e.g. `(T² − 2T + 5)²` with a Jordan block, which the predicate rejects) |
| 9.1 merged Checks | the eight bullets | `V = 2 − F`, `FV = 5`; dual of `(ℤ[i], 1 + i)` has polynomial `T² − 2T + 2`; `ICM(ℤ[2i]) = {ℤ[2i], ℤ[i]}`, quotients `ℤ/4`, `(ℤ/2)²`; `(ℤ[√2], √2)`: constant −2; `(ℤ, 2)` at `q = 2`: `|2| ≠ √2`; `(ℤ, 2)` at `q = 4`: rank 1; reciprocity `5 = 5, −10 = −10, 25 = 25`; `(T − 2)²` at `q = 4`: constant 4 | no bullet repeats another; all agree with 9.1's theorems |
| 9.4 finiteness citation | `E₅` class; `E₂` class | 2 isomorphism classes; 1 | finite, as the ArithmeticStatisticsPartI target states |
| supplier contract: `Pic (maximalNumberFieldOrder K)` | `K = ℚ(i)` | `toSubalgebra = integralClosure ℤ ℚ(i)`, `ClassGroup` trivial, `#Pic = 1` | agrees with `Picard.lean:34` |

## Not verifiable

- Unchanged from the previous report: LMFDB knowls behind a browser challenge (`av.fq.newton_elevation`, `av.fq.weak_equivalence_class`, `av.fq.order`, `av.fq.galois_group`, `av.fq.number_field`, `av.fq.honda_tate`, `av.fq.frobenius_angles_correctness`, `av.fq.endomorphism_ring_notation`, `av.fq.singular_dimensions`, `av.fq.zfv_rel_disc_norm`, `av.fq.zfv_real_index`, `av.fq.max_cohen_macaulay_type`, `av.fq.one_rational_point`, `av.geometrically_squarefree`); Weil 1957; Neukirch, Reiner, Mumford, Tate 1966 by locator. None is touched by this round's diff.

## Source issues

- none (no new source passage was read this round; the Marseglia Theorem 5.4(a) sign issue stands as recorded in the previous report).
