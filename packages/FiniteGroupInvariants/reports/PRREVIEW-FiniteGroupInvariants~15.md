# Review of FiniteGroupInvariants (pull request #3027 at 7e87b98)

**Verdict:** accepted

**Summary.** This is an incremental re-review of the 16 lines changed since `477bb48`, and it accepts the folder. The new route for §10.2a, by the minimal polynomial, is correct. It needs only Mathlib, and all six declarations it names exist at the pin with the statements it uses, so the earlier blocking point is settled. The new consumer line and the corrected description match this head. One format note remains, and it does not block. Nothing is left for a human to decide.

## N01 — The *Needs:* line of 10.2a (line 1468) leaves out two Mathlib facts its route uses

The route uses two facts that the line does not name. First, the complex roots of `Φ_ℓ` are exactly the primitive `ℓ`-th roots of unity (`Polynomial.isRoot_cyclotomic_iff`). Second, `Φ_ℓ(1) = ℓ ≠ 0` (`Polynomial.eval_one_cyclotomic_prime`), so `X − 1` and `Φ_ℓ` are coprime. That coprimality is what takes the route from "does not divide `X − 1`" to "an irreducible factor dividing `Φ_ℓ`". Both could be added to the line and to the matrices row of the contracts.

## Previous findings

- R01 — repaired: "Route, by the minimal polynomial and without Schur's bound: let `g` have order `ℓ`. Its minimal polynomial over `F` divides `X^ℓ − 1 = (X − 1)Φ_ℓ` … Hence `t ≤ n`." The *Needs:* line now names only Mathlib declarations, and 10.2 is no longer among them.
- C01 — repaired: the description now reads "in FiniteGroupInvariants §10.2a only the vanishing case of Schur's bound (Serre, Theorem 2′): no element of order ℓ in `GL_n(F)` when `[F(ζ_ℓ) : F] > n`, proved there from the minimal polynomial".
- N01 — repaired: "HermitianFormsAndLattices consumes Minkowski's bound 10.2 for its §5.2 (c) and 10.2a for its §5.2 (e)" (line 1603).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 10.2a: no element of order `ℓ` in `GL_n(F)` when `t > n` | `n = 0`; `F = ℚ(√5), ℓ = 5, n = 1, 2`; `F = ℚ(√2), ℓ = 5, n = 2`; `F = ℚ, ℓ = 7, n = 5, 6` | `GL₀` is trivial. `ℚ(√5)`: `t = 2`; for `n = 1` the torsion of the real field is `±1`, for `n = 2` the companion matrix of `X² + ((1−√5)/2)X + 1` has order 5. `ℚ(√2)`: `t = 4 > 2`, none. `ℚ, ℓ = 7`: `t = 6`; `n = 5` none, `n = 6` the companion matrix of `Φ₇` | true; the order-`ℓ` element exists exactly when `t ≤ n` | none |
| Route step: `μ ∣ (X − 1)Φ_ℓ`, `μ ∤ X − 1` ⇒ an irreducible factor divides `Φ_ℓ` | `ℓ = 3`, `μ = (X − 1)²`; characteristic `ℓ` | `Φ₃(1) = 3 ≠ 0`, so `(X − 1)² ∤ (X − 1)Φ₃`; in characteristic `ℓ`, `Φ_ℓ = (X − 1)^(ℓ−1)` and the step fails, but `F ⊆ ℂ` excludes this | sound in characteristic 0 | N01 (name the coprimality) |
| Route step: `f = minpoly_F(ζ)`, of degree `t` | `F = ℚ(√5), ℓ = 5`: `Φ₅ = (X² + aX + 1)(X² + bX + 1)` with `a, b = (1 ∓ √5)/2` | `a + b = 1`, `ab = −1`, so the product is `X⁴ + X³ + X² + X + 1`; `deg f = 2 = [F(ζ₅) : F]` | sound | none |
| Changed sentence: every term of `M_F(n, ℓ)` is `0` when `t > n` | `t = 4, n = 2, ℓ = 5`; converse with `t ≤ n` | `a⌊2/4⌋ + ⌊2/20⌋ + … = 0`; if `t ≤ n` then `⌊n/t⌋ ≥ 1` and `a ≥ 1`, so `M_F ≥ 1` | true; `M_F = 0` exactly when `t > n` | none |
| Locator: serre-bounds §2.2, Theorem 2′, p. 9 | serre-bounds lines 426, 436, 439–456, 464–465 | page 9 opens at 426, §2.2 at 436, `t`, `m`, `M_k` at 441–456, Theorem 2′ at 464 | sound | none |
| *Needs:* and the contracts row: six Mathlib names | `#check` of each at the pin | all six elaborate; the statements match the route's uses (`X^p − 1` factorisation, `minpoly ∣ charpoly`, `natDegree = card n`, irreducible monic ⇒ minpoly, `finrank K⟮x⟯ = deg minpoly`) | resolve | none |
| Consumer line: HermitianFormsAndLattices §5.2 (c) from 10.2, (e) from 10.2a | its README at this head, lines 2321–2323, 2328, 2340, 2348, 4541–4543 | (c) uses `card_dvd_minkowskiBound`; (e) is a *Corollary of:* 10.2a with the same hypotheses | resolves | none |
| Description sentence on §10.2a | against this head | description: vanishing case of Theorem 2′, proved from the minimal polynomial; head: the same | agrees | none |

The rows for untouched statements stand as in the previous review, of `477bb48`.

- Source locators checked against the text: serre-bounds lines 100, 109–111, 148, 189–192 (10.1, 10.2, seeded) and 426–465 (10.2a).
- Library declarations opened at the pin: `Polynomial.cyclotomic_prime_mul_X_sub_one` (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:372), `Matrix.minpoly_dvd_charpoly` (Mathlib/LinearAlgebra/Matrix/Charpoly/Minpoly.lean:43), `Matrix.charpoly_natDegree_eq_dim` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:115), `minpoly.eq_of_irreducible_of_monic` (Mathlib/FieldTheory/Minpoly/Field.lean:136), `IntermediateField.adjoin.finrank` (Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:495), `Matrix.GeneralLinearGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43); also `Polynomial.isRoot_cyclotomic_iff` (Cyclotomic/Roots.lean:98) and `Polynomial.eval_one_cyclotomic_prime` (Cyclotomic/Eval.lean:32) for N01.
- Cross-roadmap citations resolved: HermitianFormsAndLattices §5.2 (c), (e) and its FiniteGroupInvariants contract at this head. A search of every roadmap for the 10.2a statement and Schur's bound finds only consumers (HermitianFormsAndLattices, CongruenceModulesOfThetaLifts) and an unrelated eigenvalue bound.
- Automatic checks: all passed on this head. A run by hand without the list of the pull request's own folders flags those folders' files as outside the folder; the diff against the merge base confirms that no file outside the pull request's own folders changes. Dependency check: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 53 `sorry` warnings and nothing else. The file has not changed since `477bb48`.
- Record: the README at the merge base and at this head both have 11 layers. None is removed, retitled or renumbered, and main has not changed this folder since the merge base.
- Seeded sample: 10.1, 10.2 and 10.2a fall in or are cited by the changed passages, and were checked. 0.3, 1.3, 1.4, 2.1, 3.7, 4.1, 4.3, 4.4, 5.1, 6.5, 6.7 and 9.4 lie in untouched text that the change does not affect. The README flags no locator as unverified.

Overlap check: the lists are those of the previous review: LocalFiniteGroupTheory, ArtinRepresentations and GlaubermanZStar (open), and OddOrderTheorem, PolynomialGaloisGroupsPartIII and InductionRestriction (main). The change adds no object, only a route and a consumer line, and none of these roadmaps states 10.2a or Schur's bound. The list by results and headings is empty.

Source independence: 3 passages compared with 1 source, changed passages only: the restated Schur sentence, the new route and the consumer line, against serre-bounds lines 436–470. At most 4 consecutive words are shared ("finite ℓ-subgroup of GL"), and the statement forces them. The route is not in the source, which gives Schur's argument instead. Largest share: serre-bounds and isaacs, 6 each of 47 parenthesised locators (the change adds none). Contents were not compared, because no layer is added, removed or reordered.

Research link: Layer 10 states the Minkowski–Schur bounds for finite subgroups of `GL_n` over `ℚ` and over number fields, as Serre (2007) presents them, and Collins' optimal Jordan constant (2007). 10.2a feeds HermitianFormsAndLattices 5.2(e), where it serves the torsion-freeness of unitary stabilisers. This rests on README Layer 10 and serre-bounds §2.2.

## Not verifiable

- The end of the pull request's description, past the start of its list of `Suggested.lean` changes, was not available to this review. The part that names FiniteGroupInvariants was read and agrees with this head.

## Source issues

- **Misprint** in serre-bounds at §2.1, end of the proof of Theorem 2, p. 9 (line 429): the source says that `v_ℓ(N)` is strictly smaller than `d + v_ℓ(d!)`; it should be at most `d + v_ℓ(d!)`, since `N` divides `ℓ^d·d!` and strictness would contradict the sharpness of Theorem 1 (ii); affects nothing.

## For the human reviewers

- none
