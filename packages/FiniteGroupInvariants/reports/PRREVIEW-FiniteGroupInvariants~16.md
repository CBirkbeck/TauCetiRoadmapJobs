# Review of FiniteGroupInvariants (pull request #3027 at 9ea672c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 27 changed lines since `74a09b7`. The change adds §10.2a (no element of order `ℓ` in `GL_n(F)` when `[F(ζ_ℓ) : F] > n`), a consumer line and six Mathlib names in the contracts; the statement, its route by the minimal polynomial, its two Checks, the Serre locator and the six declarations were checked and are correct, and the folder is accepted. One format note, not blocking, carried over from the previous review. Nothing is left for a human to decide.

## N01 — The *Needs:* line of 10.2a (line 1468) leaves out two Mathlib facts its route uses

The route passes from "the minimal polynomial divides `(X − 1)Φ_ℓ` and does not divide `X − 1`" to "an irreducible factor divides `Φ_ℓ`", and then says that a complex root of that factor is a primitive `ℓ`-th root of unity. The first step rests on `Φ_ℓ(1) = ℓ ≠ 0` (`Polynomial.eval_one_cyclotomic_prime`), the second on `Polynomial.isRoot_cyclotomic_iff`; neither is on the line. Both could be added there and to the matrices row of the contracts.

## Previous findings

- N01 (the *Needs:* line of 10.2a omits two Mathlib facts) — not repaired: the line still reads "*Needs:* Mathlib `Matrix.GeneralLinearGroup`, `Polynomial.cyclotomic_prime_mul_X_sub_one`, `Matrix.minpoly_dvd_charpoly`, …, `IntermediateField.adjoin.finrank`" (the head is unchanged since that review). Kept as N01 above; it is a format note and does not block.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 10.2a: `t = [F(ζ_ℓ) : F] > n` ⇒ no element of order `ℓ` in `GL_n(F)` | `n = 0`; `F = ℚ, ℓ = 3, n = 1, 2`; `F = ℚ, ℓ = 7, n = 5, 6`; `F = ℚ(√5), ℓ = 5, n = 1, 2`; `F = ℚ(ζ_ℓ)` | `GL₀` trivial. `ℓ = 3`: `t = 2`; `GL₁(ℚ)` torsion `±1`; `n = 2` has `[[0,−1],[1,−1]]` of order 3. `ℓ = 7`: `t = 6`, none for 5, companion of `Φ₇` for 6. `ℚ(√5)`: `t = 2`. `ℚ(ζ_ℓ)`: `t = 1`, never `> n ≥ 1` | true; an element exists exactly when `t ≤ n` | none |
| Route: `μ_g ∣ (X − 1)Φ_ℓ`, `μ_g ≠ X − 1` ⇒ irreducible `f ∣ μ_g`, `f ∣ Φ_ℓ`; `deg f = t ≤ deg charpoly = n` | `ℓ = 3`, `μ = (X − 1)²`; `g = diag(1, ζ)`-type block matrices | `Φ₃(1) = 3 ≠ 0`, so `(X − 1)² ∤ X³ − 1`; `g = 1 ⊕ C(Φ₃)` over `ℚ`: `μ = X³ − 1`, `f = Φ₃`, `2 ≤ 3` | sound in characteristic 0 (`F ⊆ ℂ`) | N01 |
| Restated Schur bound: `v_ℓ ≤ M_F(n, ℓ) = a⌊n/t⌋ + ⌊n/(ℓt)⌋ + ⋯`; all terms `0` when `t > n` | `t = 4, n = 2, ℓ = 5`; `t ≤ n` | `a·0 + 0 + ⋯ = 0`; if `t ≤ n`, `a⌊n/t⌋ ≥ 1` | agrees with serre-bounds lines 439–465 (`m` there is `a` here, `ℓ > 2`) | none |
| Check 1: `M_ℚ(n, ℓ)` is the exponent of `ℓ` in `minkowskiBound n` | `ℓ = 3, n = 4`; `ℓ = 5, n = 4`; `ℓ = 3, n = 6` | `t = ℓ − 1`, `a = 1`: `⌊4/2⌋ + ⌊4/6⌋ = 2` vs `3²` in `5760`; `⌊4/4⌋ = 1` vs `5¹`; `3 + 1 = 4` vs `∑_k ⌊6/(3^k·2)⌋ = 4` | true (sum from `k = 0`, as in the Lean definition) | none |
| Check 2: companion matrix of `Φ_ℓ` has order `ℓ` in `GL_{ℓ−1}(ℚ)`; `t > n` not weakenable to `t ≥ n` | `ℓ = 3`, `ℓ = 5` | `[[0,−1],[1,−1]]³ = 1`; `t = n = ℓ − 1` and the element exists | true; it separates `>` from `≥` | none |
| Locator: serre-bounds, §2.2, Theorem 2′, p. 9 | serre-bounds lines 426, 436, 441–456, 464–465 | page 9 opens at 426, §2.2 at 436, `t`, `m`, `M_k` at 441–456, Theorem 2′ at 464 | correct | none |
| Six Mathlib names in *Needs:* and the matrices row | `#check` of each at the pin | all elaborate: `cyclotomic p R * (X − 1) = X^p − 1`; `minpoly K M ∣ M.charpoly`; `M.charpoly.natDegree = Fintype.card n`; irreducible monic annihilator is `minpoly`; `finrank K K⟮x⟯ = (minpoly K x).natDegree` | resolve | none |
| Consumer line: HermitianFormsAndLattices §5.2 (c) from 10.2, (e) from 10.2a | its README at this head, lines 2319–2323, 2328, 2340–2342, 4539–4543 | (c) cites `card_dvd_minkowskiBound`; (e) is marked a corollary of 10.2a with `t = ℓ − 1 > n` for `ℓ` unramified, `n + 1 < ℓ` | resolves | none |
| References line: "§2.2: Theorem 2′, p. 9" | serre-bounds line 464 | same locator as in 10.2a | correct | none |
| Description sentence on §10.2a | against lines 1457–1470 of the README | description: vanishing case of Theorem 2′, proved from the minimal polynomial; head: the same | agrees | none |

- Source locators checked against the text: 1 new (serre-bounds lines 426–465), and serre-bounds lines 100–116 for the 10.2 statement that Check 1 cites.
- Library declarations opened at the pin: 8 by `#check` (the six named on the line, and `Polynomial.isRoot_cyclotomic_iff`, `Polynomial.eval_one_cyclotomic_prime` for N01).
- Cross-roadmap citations resolved: 1 (HermitianFormsAndLattices §5.2 (c), (e) and its contract block, at this head). A search of all roadmaps, open and on main, for the 10.2a statement finds only its consumers (HermitianFormsAndLattices 5.2 (e), CongruenceModulesOfThetaLifts).
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 128 roadmaps, 1417 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean` exits 0 with 53 `sorry` warnings and nothing else; the pull request does not change the file, so no signature was compared again and no one-tactic probe was needed.
- Record: 11 layers at the merge base and 11 at this head, none removed, retitled or renumbered; one section added (10.2a), no heading removed, no Lean declaration removed or added. 10.2a is a supporting result for one consumer and is not among the headline theorems of the opening overview, so its absence from `Suggested.lean` is not a defect.
- Seeded sample: none of the fifteen sampled sections (0.1, 0.4, 0.6, 0.7, 1.4, 1.5, 2.1, 5.3, 6.1, 6.7, 6.8, 7.3, 8.3, 9.2, 10.3) lies in or is affected by the changed passages; the README flags no locator as unverified.

Overlap check: read LocalFiniteGroupTheory, ArtinRepresentations, GlaubermanZStar (open) and OddOrderTheorem, PolynomialGaloisGroupsPartIII, InductionRestriction (main), searched for the object the change adds; nothing shared (the list by results and headings is empty).

Source independence: 4 passages compared with 1 source, changed passages only (the statement, the restated Schur bound, the route, the two Checks, against serre-bounds lines 436–470), none shared beyond the formula for `M_F(n, ℓ)`, which the mathematics forces; the route is not in the source. Largest share serre-bounds and isaacs, 6 each of 41 parenthesised locators; contents not compared, as the change adds, removes and reorders no layer.

Research link: Layer 10 states the Minkowski and Schur bounds for finite subgroups of `GL_n` over `ℚ` and number fields as Serre (2010 lectures) presents them, and Collins' (2007) Jordan constant; 10.2a is used by HermitianFormsAndLattices 5.2 (e) for torsion-freeness of unitary stabilisers. Rests on the README's Layer 10 and serre-bounds §2.2.

## Not verifiable

- none

## Source issues

- **Misprint** in serre-bounds at §2.1, end of the proof of Theorem 2, p. 9: the source says that `v_ℓ(N)` is strictly smaller than `d + v_ℓ(d!)`; it should be at most `d + v_ℓ(d!)`, since `N` divides `ℓ^d·d!` and Theorem 1 (ii) attains equality; affects nothing.

## For the human reviewers

- none
