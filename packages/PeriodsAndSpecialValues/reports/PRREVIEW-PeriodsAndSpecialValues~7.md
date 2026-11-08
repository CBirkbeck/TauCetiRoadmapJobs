# Review of PeriodsAndSpecialValues (pull request #1496 at 723667b)

**Verdict:** accepted

:robot: Independent AI incremental re-review of 52 changed README lines since 23c20c7 (41 inserted, 11 deleted; `Suggested.lean` byte-identical; nothing changed outside the folder). Both P3 notes of the previous review are repaired at this head, the new target PS.3.3a (Borel's theorem as the proved case of Beilinson rationality for h⁰(Spec F)(j), j ≥ 2) is correct on every instance computed below, its supplier citations resolve at their heads, and the gate, the dependency check and the Lean elaboration pass. No finding. This review changes no pull-request file.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:585` now reads “viewed at level Γ₁(33)”, where σ₀(3) = 2 oldforms f(q), f(q³) and parabolic dimension 4 are the right numbers; the fine full level Γ(33), which gave 6 and 12, is no longer claimed.
- R02 — repaired: `README.md:571` now reads “the product over the places λ | ℓ of E of (primitive K_μ-summand of §6.1) ⊗_(K_μ) E_λ, μ the restriction of λ to the coefficient field K_f of §6.1, each of E_λ-dimension two”, exactly the requested wording; the undefined “K_λ” is gone.

Neither repair introduced a new problem (the surrounding Checks at README:582–586 are unchanged and still agree with the construction).

## Verified sound

**Scope and evidence.** Head confirmed as 723667bb266e437ad2c3156d7f7326e7e2d02c13, worktree clean, `git diff --stat origin/main...HEAD` outside the roadmap folder empty, `Suggested.lean` unchanged since 23c20c7. The diff is: the Summary sentence (README:3), two Scope bullets (README:11, 29), the Theorems-and-predicates line (README:37), the BorelRegulators contract (README:142–144), PS.1.6's completion sentence and level-33 Check (README:571, 585), one sentence of PS.3.2a (README:854), the new PS.3.3a (README:887–915), the Layer PS.3 Dependencies (README:924) and the Burgos reference line (README:2621). Review was confined to these passages, what cites them, and the full gate and elaboration.

**Gate and elaboration.** The worker's gate at this head passes every rule including `build=0`. The gate rerun here prints `gate PeriodsAndSpecialValues: set_option=0 … outside-folder=0 source-material=0 OK`, exit 0. Direct `lake env lean` elaboration of `TauCetiRoadmap/PeriodsAndSpecialValues/Suggested.lean` ends with exactly 13 `declaration uses sorry` warnings and no other diagnostic. The `#check @name` probe for all 38 declarations elaborates (exit 0) and prints 38 signatures identical to the worker's list; no binder is lost. The file is unchanged, so the one-tactic probe of r2 (carried through r4–r6) stands: none of the 13 headline theorems closes by `simp`, `rfl`, `infer_instance` or one library lemma.

The dependency check prints exactly:

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Merge-order positions: MotivesAndAlgebraicCycles 72, ArithmeticKTheory 126, MotivicEtaleKTheory 127, BorelRegulators 284, PeriodsAndSpecialValues 303; NumberFieldArithmetic is under `Completed/` on main. Every supplier the new passage names precedes this roadmap.

**Headline coverage.** PS.3.3a is a Layer PS.3 fundamental-line theorem (its carriers are a motive with marked realizations, rationalized K_(2j−1)(O_F) with the Borel regulator and the virtual determinant line). The module docstring of `Suggested.lean` (lines 16–22) already names the “fundamental-line, number-field regulator … theorems (PS.3–PS.6)” as not statable at the pins for exactly these missing carriers, so no Lean statement is owed and none was forced through a stand-in. Mathlib's `NumberField.dedekindZeta` (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49` at the pin) and `NumberField.discr` exist and are cited only as the analytic and discriminant carriers; the regulator side has no carrier.

**Changed citations resolved** (open suppliers read at their heads through the roadmaps tool; sources at the cache lines):

| Changed input | Resolved text and result |
|---|---|
| BorelRegulators §1.1 (README:142–144) | `TauCetiRoadmap/BorelRegulators/README.md` §1.1 at head 44ba1943 (line 171): V_n(F) = conjugation-equivariant functions on embeddings with values in (2πi)^(n−1)ℝ; divided coordinates, one per real embedding in odd n and one per complex pair; coordinate Haar measure of covolume one on C_n. Matches the contract's parenthesis word for word in substance. |
| BorelRegulators §5.3 (README:144, 915) | §5.3 (line 640): Λ_n(F) = r_Bo(K_(2n−1)(O_F)) discrete and spanning, R_Bo(F,n) = its covolume for the §1.1 measure, positive, equal to the absolute determinant on a ℤ-basis of the torsion-free quotient, equal to 1 when d_n = 0. Matches. |
| BorelRegulators §5.4 (README:144, 887, 898, 915) | §5.4 (line 662): R_Bo ∈ ℚˣ·ζ_F*(1−n) and ∈ ℚ_>0·√Δ_F·π^(d_n−Nn)·ζ_F(n); the signed determinant on any ordered rational K-basis in Tate-divided coordinates lies in ℚˣ·√Δ_F·π^(d_n−Nn)·ζ_F(n). All three clauses the README imports are stated there; the README's “rank-zero case” is §5.4's R = 1 specialised to d_n = 0. The supplier's own Checks give ℚ(i): 2ζ_F(2)/π³ at n = 2, which README:907 quotes. |
| BorelRegulators §§6.1–6.2 (README:915) | §6.1 (line 772): P_(n−1)(z) = (z + (−1)^(n−1) z̄)/2, the selected generator (2πi)^(n−1) has coordinate 1; §6.2 (line 795): r_Bo = −2·r_Be, det ratio (−2)^(d_n) including the empty determinant. Unchanged contract, re-read for the new use. BorelRegulators' Downstream consumers (line 845–849) name PeriodsAndSpecialValues for §§5.3–5.4 and 6.1–6.3. |
| BorelRegulators measure convention (README:907 “2 dx dy”) | BorelRegulators Conventions (line 29) and §3.1 (line 367): “dx over ℝ and 2dxdy over ℂ”. The Check's remark that this changes the integral-basis determinant by the rational 2^(r₂) is right. |
| MotivesAndAlgebraicCycles MC.2 and §6.10 (README:891, 915, 924) | At its open head via the roadmaps tool: “## Layer 2 (MC.2): classical realizations and normalized comparisons” (line 340) and “### 6.10 Artin and pure Tate acceptance cases” (line 1265): Artin motives over k ⊂ ℂ with fibre ℚ^(Hom_k(X,ℂ)) and an ℓ-adic realization agreeing with finite-étale permutation representations. This is exactly what README:891 consumes for h⁰(Spec F). |
| Burgos, Theorem 9.12, printed p. 80 (README:887, 2621) | Burgos line 3256–3257, under the page header “80 9. BOREL'S REGULATOR” at Burgos line 3248: Borel's theorem R′_Bo,p ∼ π^(−d_p)·lim_(s→1−p) ζ_k(s)(s+p−1)^(−d_p). The π^(−d) is the unrenormalized-lattice factor that BorelRegulators §5.4 removes (R_Bo = (2π)^(d_n)·ε·R′_Bo); the README cites it only as the source of §5.4. |
| Deligne (0.5.3), p. 4; 5.2(a), p. 17; §6.3, p. 20 (README:891) | Deligne line 147 (p. 4): H_ℓ of the restriction of scalars is the induced representation; Deligne line 643–645 (p. 17): Z_v(M,t) = det(1 − F_v t | H_λ(M)^(I_v))⁻¹; Deligne line 776–783 (p. 20): Artin motives, Betti realization the underlying space, ℓ-adic realization V ⊗ ℚ_ℓ with H*(X(ℚ̄), ℚ_ℓ) = ℚ_ℓ^(X(ℚ̄)). All three support the sentences they are attached to. |
| Deligne §3.1, pp. 13–14 and PS.0.5 (README:353, used by the j = 2 Check) | README:353: δ(ℚ(n)) = (2πi)^n, F_∞ acts on ℚ(n) by (−1)^n, Hodge type (−n,−n). The B⁺ dimensions and the α-coordinates of PS.3.3a follow from exactly these three conventions (table below). |
| PS.1.1's Euler factor (README:415–436, used by README:891) | P_v(T) = det(1 − T·Fr_v | (ker N_v)^(I_v)) with Fr_v geometric. PS.3.3a's P_v and its product over v | p are this definition applied to the induced module. |

**Ownership.** The roadmaps tool was grepped over main and all 462 open heads for “Beilinson … Dedekind/number field”, “h⁰(Spec F)(j)”, “LeadingTermRational” and “Borel … fundamental line”: the only hit outside this roadmap is a reference entry in ColemanIntegration (the p-adic Beilinson conjecture, a different statement). BorelRegulators §5.4 owns Borel's theorem and names this roadmap as the consumer that places it in the fundamental line; Polylogarithms consumes the same sections for polylogarithmic rows, not for the motivic fundamental line. PS.3.3a adds no Lean declaration, so no fully qualified name can collide.

**Seeded sample.** The two sampled passages are unchanged at this head (README:1956 “Fixed-fibre projective map”, README:1969 “Residue coordinates and the small prime”) and their anchors were reopened: Park Definition 4.8 at Park line 1173, Theorem 4.11 at Park line 1233 (hypotheses v_p(γ) ≤ 1/(p−1), v_p(ℏ) > 0), Corollary 4.12 at Park line 1345 (smooth complete intersection), Proposition 5.2 at Park line 1568; SH Lemma 4.8 at SH line 271; SG Lemma 5.6 at SG line 1082 (p > dim V). Locators and hypotheses agree with the README; the residue matrix row is carried below. No locator is flagged unverified in the README.

### Computed adversarial table

Rows for every changed statement, with values; finite instances test scope, signs and wrong models, not general proofs. N = [F:ℚ], d_j = r₁ + r₂ (odd j), r₂ (even j), Δ_F = |disc F|.

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result | Change |
|---|---|---|---|---|
| PS.3.3a: L_fin(h⁰(Spec F)(j), s) = ζ_F(s+j), ramified primes included | F = ℚ(i), j = 2, p = 2 (ramified, e = 2, f = 1), p = 3 (inert, f = 2), p = 5 (split, f = 1, 1) | I_p-orbits on D_p/D_v number f_v, so dimensions 1, 2, 1+1; char. polys 1 − 2^(−2)T, det(1 − 3^(−2)[[0,1],[1,0]]T) = 1 − 3^(−4)T², (1 − 5^(−2)T)²; Euler factors (1 − 2^(−2−s))⁻¹, (1 − 9^(−2−s))⁻¹, (1 − 5^(−2−s))⁻²; their product over all p is ζ_(ℚ(i))(s+2). Wrong model “dimension e_v f_v” gives (1 − 2^(−2−s))⁻² at 2; wrong model “drop ramified v” gives ζ_F(s+2)·(1 − 2^(−2−s)) | Correct | Retain |
| PS.3.3a: order 0 = predicted order, L* = ζ_F(j) > 0 | j = 2, 3 any F; control j = 1 | ζ_F(j) converges absolutely for j ≥ 2 (Re(s+j) > 1 at s = 0), positive Euler product, order 0; rr(H_f¹(M^∨(1))^*) − rr(H_f⁰(M^∨(1))^*) = 0 − 0 since K_(1−2j)(F) = K_(2−2j)(F) = 0. Control j = 1: ζ_F(s+1) has a pole (order −1) and M^∨(1) = h⁰(Spec F)(0) has H_f⁰ = ℚ, prediction 0 − 1 = −1: the formula is consistent there too, and j = 1 is excluded as the README's Check says | Correct | Retain |
| PS.3.3a: dim B⁺ = N − d_j and the α-coordinates (from PS.0.5: F_∞ = (−1)^j on ℚ(j), δ = (2πi)^j) | real place, j even/odd; complex pair, j = 2, 3 | Real place: F_∞-invariants of (2πi)^j ℝ e_σ are all (j even, killed axis, coordinate ±(2π)^j) or 0 (j odd, surviving axis with generator (2πi)^(j−1), coordinate ±(2π)^(j−1)). Complex pair: (2πi)^j(e_σ + (−1)^j e_σ̄) spans one real axis of ℂ (real axis for j even, imaginary for j odd), coordinate ±(2π)^j; the other axis survives with (2πi)^(j−1), coordinate ±(2π)^(j−1). Total: N − d_j killed, d_j surviving, power of 2π equal to j(N−d_j) + (j−1)d_j = Nj − d_j | Matches README:893 | Retain |
| PS.3.3a: structure ratio e_dR ∈ ℚˣ·√Δ_F·π^(d_j−Nj)·e_B | ℚ, j = 2; ℚ, j = 3; ℚ(i), j = 2; ℚ(i), j = 3; ℚ(√5), j = 2 | ℚ, 2: e_dR = 1/(2πi)² = −1/(4π²), e_B = 1 (empty), ratio ∈ ℚˣπ^(−2) (d−Nj = −2) ✓. ℚ, 3: e_dR = 1, e_B = (2πi)² = −4π², ratio −1/(4π²) ∈ ℚˣπ^(−2) (d−Nj = 1−3) ✓. ℚ(i), 2: det(1, i) = 1 = √4/2, α(b) = −4π² e_x, e_B = 2π e_y, e_dR = −e_y/(4π²) = e_B/(−8π³) ∈ ℚˣ·2·π^(−3) ✓. ℚ(i), 3: α(b) = −8π³ e_y, e_B = −4π² e_x, e_dR = e_x/(8π³) = e_B/(−32π⁵) ∈ ℚˣ·2·π^(−5) (d−Nj = 1−6) ✓. ℚ(√5), 2: det(1, (1+√5)/2) = −√5, both axes killed by −4π², ratio −√5/(16π⁴) ∈ ℚˣ·√5·π^(−4) ✓ | All five agree with the formula | Retain |
| PS.3.3a: det r_Be on a rational basis against e_dR lies in ℚˣ·ζ_F(j) | ℚ, j = 3; ℚ(i), j = 2; general d_j | ℚ, 3: §5.4 gives t ∈ ℚˣζ(3)/π² in divided coordinates, r_Bo(k) = −4π²t ∈ ℚˣζ(3), r_Be(k) = −r_Bo(k)/2 ∈ ℚˣζ(3), λ = r_Be(k)/e_dR = r_Be(k) ∈ ℚˣζ(3). ℚ(i), 2: det_B(r_Bo) ∈ ℚˣ·2ζ_F(2)/π³ (supplier Check), × (−2)^(−1), ÷ ratio (ℚˣ·2π^(−3)) gives ℚˣζ_F(2). General: √Δ_F·π^(d−Nj) cancels exactly between §5.4 and the structure ratio, leaving (−2)^(−d_j)·ℚˣ·ζ_F(j). Wrong model “take Borel's divided value t as the de Rham determinant” at ℚ, 3 predicts ζ(3)/π² ∈ ℚˣζ(3), i.e. π² ∈ ℚ, false | Correct; the wrong model is excluded by README:906 | Retain |
| PS.3.3a: θ_∞(ξ) = λ⁻¹ and the predicate θ_∞⁻¹(ζ_F(j)⁻¹) ∈ Ξ_ℚ(M) | ℚ, j = 2 (rational factor); inverse-scalar control | ξ = ((2πi)²)⁻¹ ⊗ 1 ↦ ω/α(b) = (2πi)⁻² = −1/(4π²); ζ(2)⁻¹ = 6/π² = −24·(−1/(4π²)) ✓ factor −24. With (2πi)⁻² as Tate scalar, θ_∞(ξ) = (2πi)² = −4π² and ζ(2)⁻¹/(−4π²) = −3/(2π⁴) ∉ ℚ ✓ (README:905's value) | Correct | Retain |
| PS.3.3a Check ℚ(√5), j = 2: ratio −600 | ζ_(ℚ(√5))(2) = ζ(2)·L(2, χ₅) | L(2, χ₅) = 4π²/(25√5) ≈ 0.7062 (partial sums to n = 19: 0.7061); ζ_F(2) = (π²/6)(4π²/(25√5)) = 2π⁴/(75√5) ≈ 1.1617 ✓; ζ_F(2)⁻¹ = 75√5/(2π⁴); θ_∞(ξ) = −√5/(16π⁴); quotient = 75·16/(2·(−1)) = −600 ✓. Wrong model “embedding coordinates as the ℚ-structure” drops √5 and needs 75√5/2 ∈ ℚ, false ✓ | Correct | Retain |
| PS.3.3a Check ℚ(i), j = 2 | as README:907 | det(1, i) = 1 = √Δ/2 ✓; e_dR = e_B/(−8π³) ✓ (row above); supplier §5.4 Check gives 2ζ_F(2)/π³ ✓; quotient ℚˣζ_F(2) ✓; the 2dxdy measure changes 1 to 2 = √Δ ✓ | Correct | Retain |
| Contract: §5.4's two forms are consistent through the functional equation (not asserted by the README, checked as a sanity control) | ℚ, n = 2 and 3 | ζ*(−1) = −1/12 vs π^(0−2)ζ(2) = 1/6: ratio −2 ∈ ℚˣ; ζ*(−2) = ζ′(−2) = −ζ(3)/(4π²) vs π^(1−3)ζ(3): ratio −1/4 ∈ ℚˣ. General: the Γ-factor ratio of Λ(n) = Λ(1−n) is a rational times π^(d_n−Nn) (even n: π^(−n) per real place, π^(1−2n) per complex; odd n: π^(1−n) per real, π^(1−2n) per complex) and Δ^(n−1/2) = √Δ·Δ^(n−1) | Both forms of §5.4 agree | Retain |
| Contract: d_n and B⁺ dimensions versus Borel's ranks | n = 2j−1 for j = 2, 3 | j = 2: 2j−1 = 3 ≡ 3 mod 4, rank r₂ = d₂; j = 3: 5 ≡ 1 mod 4, rank r₁ + r₂ = d₃ (ArithmeticKTheory §3.4 as quoted at README:139); dim coker α = N − dim B⁺ = d_j ✓ | Consistent | Retain |
| j = 1 exclusion Check (README:909) | F real quadratic | d₁ = r₁ + r₂ = 2 but rank O_F^× = 1 = r₁ + r₂ − 1; ζ_F(s+1) pole at 0 ✓ | Correct | Retain |
| Rational-factor Check (README:910) | ℚ, j = 2 | lattices ℤξ and 2ℤξ have the same ℚ-line; factor −24 in one, −12 in the other: the predicate is unchanged ✓ | Correct | Retain |
| R01 repair (README:585) | Γ₁(33) versus Γ(33) | Γ₁(33): divisors of 3 are 1, 3: 2 oldforms, parabolic dimension 4, newspace 2 ✓ as now written; Γ(33) would need 6 and 12 and is no longer claimed | Repaired | None |
| R02 repair (README:571) | E = ℚ(√5), K_f = ℚ; ℓ = 11 (split), ℓ = 2 (inert) | ℓ = 11: two E_λ = ℚ₁₁ over μ = 11, each dimension 2, total 4 = 2[E:ℚ]; ℓ = 2: one E_λ = ℚ₄ of dimension 2, ℚ₂-dimension 4; E-rank 2 in both ✓ | Repaired | None |
| Scope/contract/Needs/Dependencies mirror | the added sections | “5.3–5.4” occurs at README:29, 142, 144, 915, 924 and “MC.2 and §6.10” at README:891, 915, 924; Scope line 11 names PS.3.3a's theorem, line 37 lists it as the proved case of the two PS.3.3 predicates | Consistent | Retain |
| Sample: residue coordinates (README:1969) | R = diag(1,−1,2,−6)·D | diagonal (1,1,2,6), det R = 12, det D = 1; v₃(12) = 1, v_p(12) = 0 for p ≥ 5 | Unchanged, consistent with Park/SH anchors | Retain |
| Sample: fixed-fibre map (README:1956) | s = 0,…,3 | (−1)^s s! = 1, −1, 2, −6; charge-zero relation |u|+|α| = 5(s+|β|) gives total degree 6s on top forms | Unchanged, consistent | Retain |

### Carried-forward adversarial evidence

The 13 computed rows of `packages/PeriodsAndSpecialValues/reports/PRREVIEW-PeriodsAndSpecialValues~6.md` for PS.1.6 and its three suppliers stand with their values (two of them are superseded by the R01/R02 rows above). Its carried rows from `…~5.md` (15 rows) and the 119 rows of `…~4.md` and `…~2.md` for every untouched statement of Layers PS.0–PS.9 and all 38 Lean declarations, including PS.3.1–PS.3.3's determinant conventions and the PS.3.3 predicate's orientation against BF §4.3 Conjecture 4 (BF line 1625–1639), retain their computed values and are not repeated here; the Lean file and those README passages are byte-identical to the heads they were computed on.

## Not verifiable

- BG remains settled as uncertified and Tate-legal as waived; neither was requested and neither unseen text is certified here.
- BorelRegulators and MotivesAndAlgebraicCycles are open pull requests; they were read at their current heads through the roadmaps tool and the sibling checkout, not on main, and their section numbers may move before merge.
- The unchanged full mathematical and one-tactic audits are inherited from r6/r5/r4/r2 as labelled; this incremental review does not claim a fresh audit of every untouched target.

## Source issues

- none
