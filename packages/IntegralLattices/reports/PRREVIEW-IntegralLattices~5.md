# Review of IntegralLattices (pull request #1239 at b0defd8)

**Verdict:** needs changes

Full re-review of the repaired head. The gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with 29 `sorry` warnings and nothing else, and the four findings of the previous review are repaired (table under *Verified sound*): 6D, 6H, the odd-prime value of 7C, 5A and 4F are now stated, the N1 containment carries its rank hypothesis, the locators are corrected, 7E is in house prose with a locator, and the definitions that had no Checks have them. One finding remains, and it is not blocking: the basis that the new `d16PlusGram` is said to be the Gram matrix of is not a basis of `D₁₆⁺` at all, although the matrix itself is a correct Gram matrix of `D₁₆⁺` and every statement made about it is true.

## R01 (P3) — `d16PlusGram` is not the Gram matrix of the basis named for it

**Location:** `TauCetiRoadmap/IntegralLattices/Suggested.lean:600–603` ("in the basis `h, e₁ − e₂, e₂ − e₃, …, e₁₄ − e₁₅, e₁₅ + e₁₆` … the fourteen vectors `e_i − e_{i+1}` form the `A₁₅`-type band, `e₁₅ + e₁₆` pairs to `−1` with `e₁₄ − e₁₅`") and `TauCetiRoadmap/IntegralLattices/README.md:2077–2078` (the same description, with "`(e₁₄ − e₁₅)·(e₁₅ + e₁₆) = −1`").

**Claim:** the matrix in the file is the Gram matrix of `D₁₆⁺` in the basis `h, e₁ − e₂, …, e₁₄ − e₁₅, e₁₅ + e₁₆`, whose fifteen norm-2 vectors form an `A₁₅` chain.

**Witness (recomputed exactly over `ℚ`):** the sixteen vectors named span a sublattice of index 7, not `D₁₆⁺`: their Gram matrix has the `A₁₅` chain `e₁ − e₂, …, e₁₄ − e₁₅, e₁₅ + e₁₆` (consecutive products `−1`, determinant 16) with `h` pairing `1` to its last vector, so its determinant is `16·(4 − 15/16) = 49`. The matrix in the file differs from that Gram matrix in exactly four entries: it has `−1` at `(14, 16)` and `0` at `(15, 16)` (1-based), where the named basis gives `0` and `−1`. In the file, the fifteen norm-2 rows form the `D₁₅` diagram (the chain of rows 2–15 with row 16 attached to row 14), not an `A₁₅` chain, and `h` pairs `1` with the fork leaf. That is the Gram matrix of `D₁₆⁺` in the basis `h, e₁ − e₂, …, e₁₄ − e₁₅, e₁₄ + e₁₅`: `(e₁₃ − e₁₄)·(e₁₄ + e₁₅) = −1`, `(e₁₄ − e₁₅)·(e₁₄ + e₁₅) = 0`, `h·(e₁₄ + e₁₅) = 1`, the fifteen roots span `D₁₅` on the first fifteen coordinates (determinant 4), and adding `h` gives determinant `4·(4 − 15/4) = 1`, which is the determinant I recomputed for the file's matrix (leading principal minors `4, 8, …, 60, 1`, all positive, every diagonal entry even). So the theorem `d16Plus_sameGenus_not_isometric_e8SumE8` is true as stated; its docstring and the README name a set of vectors that is not a basis of the lattice and does not produce this matrix.

**Repair:** in both places replace `e₁₅ + e₁₆` by `e₁₄ + e₁₅`, replace "the `A₁₅`-type band" by "the `D₁₅` diagram: the chain `e₁ − e₂, …, e₁₄ − e₁₅` with `e₁₄ + e₁₅` attached to `e₁₃ − e₁₄`", and replace "`(e₁₄ − e₁₅)·(e₁₅ + e₁₆) = −1`" by "`(e₁₃ − e₁₄)·(e₁₄ + e₁₅) = −1` and `(e₁₄ − e₁₅)·(e₁₄ + e₁₅) = 0`". Tested: the Gram matrix of that basis equals the file's matrix entry by entry.

## Verified sound

**Repair status of the previous review (acc5d58).**

| Previous | Passage now | Status |
| --- | --- | --- |
| R01 statable headlines absent (6D, 6H, 7C odd value, 5A, 4F) | `d16PlusGram` (`Suggested.lean:604`), `e8SumE8Gram` (624), `d16Plus_sameGenus_not_isometric_e8SumE8` (633), `gramIsometric_e8SumE8_sum_U_d16Plus_sum_U` (643), `localDensityCount_eq_of_odd_of_not_dvd` (690), `gramSameGenus_iff_of_isEven` (371), `infinite_isometry_of_isIndefinite` (353); the "not statable" bullet for 6D/6H deleted; the headline list (36–51) names 4F, 5A, 6D, 6H and the odd-prime value; README 1705, 1796, 2076–2080, 2141–2142, 2348–2350 cite them | repaired (R01 above is the one residual defect, in the basis description only) |
| R02 N1 rank hypothesis | README 1474–1478: reflection generation "in every rank", unit-square-class equality "when moreover `rank L ≥ 2`"; 1484–1488: containment "for `rank L ≥ 2`", rank ≤ 1 trivial with `localSpinorNormImage_eq_bot_of_finrank_le_one`, `⟨1⟩` excluded | repaired |
| R03 locators | Root Systems "Layer 3 §3.1" (479, 2168, 2171; main README line 506 is `### 3.1 Classification independent of a base`); Voight §3 with Definition 3.10, Lemma 3.12, Proposition 3.13(iii) (1732–1734, 3013; cache lines 230, 245, 261); "Quadratic Form Invariants Layer 6D and its Layer 5 `hilbertSymbol_productFormula`" (2254–2255); `TamagawaMeasures` gone, replaced by AdelicAlgebraicGroups AA.2.3/AA.2.4 and OTM §1.2 (476; AA's open head has `### 2.3 Rational quotients` and `### 2.4 Gauge forms and Tamagawa normalization`) | repaired |
| R04 7E form and missing Checks | 7E rewritten in Unicode prose (2408–2466) with the Boya–Sudarshan–Tilma locator; Checks at 7E (2468–2489), 5B (1867–1893), B6 (1292–1303), B7 (1343–1356) | repaired |

**Gate and build.** The worker's gate: every counter 0, `build=0`, OK. `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean`: exit 0, 29 warnings, all `declaration uses sorry` (lines 107, 207, 224, 267, 279, 324, 338, 353, 371, 393, 439, 446, 467, 480, 518, 532, 549, 566, 573, 582, 591, 633, 643, 654, 675, 690, 763, 788, 826). Dependency check:

```text
depcheck: 225 roadmaps, 2126 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The folder is on main, so it is not in the merge order; every supplier cited is on main (Completed GlobalNumberFields, RestrictedProducts, OrthogonalSpinGroups; QuadraticFormInvariants, GlobalQuadraticForms, ClassFieldTheory, RootSystems, LieGroups, DifferentialGeometry). OrthogonalTamagawaAndLatticeMass, AdelicAlgebraicGroups and GeometryOfNumbersAndQuadraticArithmetic are named only as owners in the ownership and supplier tables and consumed by no `*Needs:*` line; AdelicAlgebraicGroups' open head itself consumes IntegralLattices 2F–2G, so the supply runs one way. The diff outside the folder is empty. No `set_option`, no `lemma`, no sorry'd data, no admitted `example`; imports `Mathlib` plus 18 `TauCeti.*` modules that build; no pull-request numbers or process words in the README. Note for the author, unchanged from the previous round and OTM's own drift: OTM's open head still cites IntegralLattices §4D, §6E and §§7H/7I, labels this roadmap assigns to OTM or does not carry.

**Padding probe.** A scratch copy with every `sorry` replaced by `by first | rfl | (simp; done) | infer_instance | decide | (norm_num; done)` fails at exactly the 29 admitted declarations with `unsolved goals` and no parse error; none closes. The `#check` of `IsGenusMass`, `isometric_mem_of_sum_eq_genusMass`, `Archimedean.soEuclideanMeasure_univ`, `Archimedean.oEuclideanMeasure_univ`, `IntegralLattice.vanDerBlij`, `exists_primitiveEmbedding_iff`, `IntegralLattice.padicDiscriminant_eq_squareClass_gramDet` and `finite_genusClasses_rank_two` against the built module elaborates (the worker's signature transcript reports two of these as unknown; that is a defect of its scratch file, not of the module). Three scratch `example`s confirm `sphereArea 0 = 0` through `Real.Gamma_zero` and `orthogonalSkewBasisVolume 0 = orthogonalSkewBasisVolume 1 = 1`, as the 7E Checks say.

**Signatures.** The worker's elaborated types of the 64 declarations were compared with the README statements: none lost a binder. The five new theorems agree with the README in generality: 4F is a nondegenerate indefinite native lattice with `3 ≤ finrank ℚ V`, no definiteness or isotropy assumption; 5A is an `↔` for even nondegenerate Gram matrices on the standard basis with `signature` (the native triple) and `discriminantQuadraticModule`; 7C's odd value carries `p ≠ 2`, `¬ (p : ℤ) ∣ A.det`, `0 < n`, the `n/2` and `Icc` ranges and `legendreSym p ((−1)^(n/2) · det)` exactly as the README displays; 6D and 6H are closed statements on `Fin 16` and `Fin 18`.

**Library declarations opened at the pins.**

| Declaration | File:line | Note |
| --- | --- | --- |
| `legendreSym (a : ℤ) : ℤ` for `(p : ℕ) [Fact p.Prime]` | `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109` | 7C |
| `Real.Gamma_zero : Gamma 0 = 0` | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:340` | 7E Check `sphereArea 0 = 0` |
| `CartanMatrix.E (n : ℕ)` (Bourbaki numbering) | `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean:55` | `e8SumE8Gram`, 6C |
| `IsIndefinite := 0 < sigPos ∧ 0 < sigNeg`; `signature = (sigPos, sigNull, sigNeg)` | `TauCeti/LinearAlgebra/IntegralLattice/Signature.lean:111, 81` | 4F, 5A |
| `ofGramMatrix (b : Basis ι ℚ V) (G : Matrix ι ι ℤ) (hG : G.IsSymm)` | `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:261` | 5A |
| `discriminantQuadraticModule [L.IsNondegenerate] (hL : L.IsEven)` | `TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:184` | 5A |
| `Isometry (L M)` structure; `successiveMinimum` | `Isometry/Basic.lean:74`; `PosDef/SuccessiveMinima.lean:45` | 4F, 2F |
| `exists_localSpinorNormImage_ne_unitSquareClasses` (a rank-1 family whose image differs from the unit square classes at every odd `p`) | `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/LowRank.lean:142` | N1 Check |
| `localSpinorNormImage_eq_bot_of_finrank_le_one`; `eventually_localSpinorNormImage_integral_eq_unitSquareClasses` (`2 ≤ finrank`); `integralOrthogonalSubgroup_eq_closure_reflectionOrthogonal` (any rank); `map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses` (`[Nontrivial ι]`) | `SpinorNormImage.lean:107`; `Integral/CompactOpen.lean:160`; `Integral/SpinorNorm.lean:254, 367` | N1 as repaired |

Every backticked name the README attributes to Mathlib or Tau Ceti was found at the pins by the worker's resolver (its 15 leads are all this roadmap's own declarations, each present in `Suggested.lean`).

**Cross-roadmap citations resolved this round.**

| Citation | Resolved at | Result |
| --- | --- | --- |
| Root Systems Layer 3 §3.1 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:504–506` on main | present |
| DifferentialGeometry 12.1, 12.4 | `TauCetiRoadmap/DifferentialGeometry/README.md:915, 923` on main | present (bullet labels) |
| LieGroups matrix groups | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:32` on main | present |
| AdelicAlgebraicGroups AA.2.3, AA.2.4 (owner only) | its open head, `### 2.3 Rational quotients`, `### 2.4 Gauge forms and Tamagawa normalization` | present |
| OTM §§0.3, 1.1–1.4, 2.1–2.3, 3.1, 4.1 (owner only) | its open head | present (previous round; unchanged) |
| QFI Layer 5 `hilbertSymbol_productFormula`, Layer 6D; GQF `hasseMinkowski_equivalent`; GNF, CFT, OSG, Restricted Products names | as in the previous round; the resolver reports no missing cross-roadmap citation at this head | present |

Ownership against the open pull requests was searched by object with `roadmaps grep --lean-only` for `d16Plus`, `D₁₆⁺`, `e8SumE8Gram`, `localDensityCount`, `infinite_isometry_of_isIndefinite` and `gramSameGenus_iff_of_isEven`: the only other hits are ThetaSeries (omnibus #1187), which names `D₁₆⁺` as this roadmap's 6D and consumes it. No sibling declares these objects.

**Sources read this round.** boya-sudarshan-tilma2003 line 638–684: §6 on printed pages 16–17 (page marker at line 660–661), (6.1) the fibration, (6.2)–(6.3) the convention `−Tr[λ²] = 2` for the generators, (6.4) `vol(SO(2)) = 2π`, (6.5) `vol(SO(n)) = ∏_{d=2}^{n} vol(S^{d−1}) = 2^{n−1} π^{(n−1)(n+2)/4} / ∏ Γ(d/2)` (the exponent agrees with `∑_{d=2}^{n} d/2`), `vol(SO(3)) = 8π²` at line 670, (6.9) `vol(O(n)) = 2·vol(SO(n))` at line 684; the README's locator and convention statements are exact. voight2023 line 230 (Definition 3.10, `p ∤ disc Λ` at line 229), 245 (Lemma 3.12: equal discriminant and genus), 261–262 (Proposition 3.13(iii), `Λ(p, v)` with `p² ∣ Q(v)`). nikulin1980 (cache b0f9f2a7) line 488–494 (Theorem 1.9.1 with the exceptional case `q_θ^{(2)}(2) ⊕ q'` and the factor 5), 572–575 (Corollary 1.9.4, "determine the genus of an even lattice"), 605–610 (Theorem 1.10.1, four conditions, condition 4 "if `t₊ + t₋ = l(A_{q₂})` and `q₂ ≠ q_θ^{(2)}(2) ⊕ q'`"), 613–615 (Corollary 1.10.2).

**Seeded sample (B1–B8).** Cox Theorems 2.8, 2.13, 3.9, 7.7 and Cohen §§5.2, 5.6 are uncertified in the manifest and were not read; Conway–Sloane is waived. The mathematics was recomputed: see the rows B1–B8 of the table.

**Adversarial pass.** `⟨a⟩` has Gram `[a]`; `U = !![0,1;1,0]`; half-norm discriminant values; counts are brute force (`dens.py`, every `X ∈ Mₙ(ℤ/p^r)` with `XᵀAX ≡ A`) unless marked.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 6D `d16PlusGram` | the file's matrix; the basis named for it; the basis `h, e₁−e₂, …, e₁₄−e₁₅, e₁₄+e₁₅` | file: symmetric, even diagonal, leading minors `4, 8, …, 60, 1`, det `1`, positive definite; named basis: Gram differs at four entries, det `49` (`16·(4 − 15/16)`), index 7; corrected basis: Gram equals the file's matrix entry by entry, det `4·(4 − 15/4) = 1` | statement true; description false (R01) |
| 6D genus and non-isometry | `E₈²` vs `D₁₆⁺` | both even, det 1, signature `(16,0)`, over `ℤ₂` both `U⁸` (type II, det `≡ 1 mod 8`), over odd `p` unimodular of equal det class: same genus; root spans of index `1` and `2` (the file's fifteen roots form `D₁₅`, which cannot embed in `E₈ ⊕ E₈`): not isometric | pass |
| 6H | `E₈² ⊕ U` vs `D₁₆⁺ ⊕ U` | rank 18, det `−1`, even, signature `(17,1)`, indefinite: 6A even gives the isometry; without `U` 6D refutes | pass |
| 7C odd value (Lean formula) | `U` at 3 (`r = 1, 2`); `I₂` at 3 (`r = 1, 2`), at 5; `diag(1,2)` at 3, 5; `⟨1⟩` at 3 (`r = 1, 2, 3`); `⟨2⟩` at 5 (`r = 1, 2`); `I₃`, `U ⊕ ⟨1⟩` at 3; `A₂` at 5, 7 | counts `4, 12`; `8, 24`, `8`; `4`, `12`; `2, 2, 2`; `2, 2`; `48`, `48`; `12`, `12`; normalized `4/3, 4/3`; `8/3, 8/3, 8/5`; `4/3, 12/5`; `2`; `2`; `16/9, 16/9`; `12/5, 12/7`; the Lean formula with `ε = ((−1)^{n/2} det | p)` gives the same sixteen values (`ε = 1` for `U` at 3 although `det = −1` is a nonsquare; `ε = −1` for `I₂` at 3, `+1` at 5; `ε = (−3|5) = −1`, `(−3|7) = 1` for `A₂`) | pass |
| 7C ranges | `n = 1, 2, 3` | `Icc 1 0 = ∅` gives `2`; `Icc 1 0 = ∅` with the `ε` factor gives `2(1 − εp⁻¹)`; `Icc 1 1` gives `2(1 − p⁻²)` | pass |
| 5A | `E₈²` vs `D₁₆⁺`; `I₈` vs `E₈`; `n = 0` | `(16,0,0)` both, one genus; equal signature and trivial discriminant group but `I₈` odd, so the evenness hypothesis excludes it; zero matrices: both sides true | pass (both directions) |
| 4F | `⟨1⟩ ⊕ ⟨−2⟩`; `⟨1⟩ ⊕ ⟨−1⟩`; `x² + y² − 3z²` | infinite via `ℤ[√2]ˣ`; finite (`Δ = 1`, split); indefinite and anisotropic over `ℚ` (`x² + y² ≡ 0 (mod 3)` forces `3 ∣ x, y`), so rank 3 needs the anisotropic branch; the Lean hypothesis `3 ≤ finrank` excludes the two rank-2 cases | pass |
| N1 containment | `⟨1⟩` | `H_p = 1` at every `p` while `ℤ_pˣ(ℚ_pˣ)²` has order 2; now excluded by `rank L ≥ 2` | pass |
| 7E values | `sphereArea 1, 2, 3, 4`; `orthogonalSkewBasisVolume 0, 1, 2, 3`; `O(0), O(1)` | `2π^{1/2}/√π = 2`; `2π/1 = 2π`; `2π^{3/2}/(√π/2) = 4π`; `2π²/1 = 2π²`; `1, 1, 2π, 8π²`; `1`, `2·1 = 2`; BST (6.4), (6.5), (6.9) agree | pass |
| 7E junk value | `sphereArea 0` | `2·π⁰/Γ(0) = 2/0 = 0` in Mathlib (`Real.Gamma_zero`), confirmed by a scratch `example` | pass |
| 7E metric | `E_12 − E_21`; identity | coordinates `±1/√2` at two positions, norm `1`; identity to norm `√(n/2)`; Frobenius would give `√2` and `√n` | pass |
| 5B Checks | `(1, 0, q_1^{(2)}(2))`; `(1, 0, q_1^{(3)}(3))`; `(0, 2, q_1^{(3)}(3))`; `(0, 0, 0)` | Gauss sum `1 + i`, sign `1 ≡ 1`, `l = 1 ≤ 1`, condition 4 off (`HasCyclicTwoSummand` with `A' = 0`); Gauss sum `1 + 2e(2/3) = −i√3`, sign `6 ≢ 1`, condition 3 `(−1)^0·3 = 3 = realizationDet`; `−2 ≡ 6` and `A₂(−1)` has `q = −1/3 = 2/3` on both nonzero elements; empty filter gives `d = 1`, `Nat.card = 1`, conditions 3 and 4 live and satisfied | pass |
| B1 | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]` | norm forms `2x² − 2xy + 2y²`, `2xy`, `x² − 2y²`, `2(2x² + xy + 3y²)`: `(c, Δ) = (2, −3), (2, 1), (1, 8), (2, −23)`; `disc N_L = −4 det L` | pass |
| B2 | `Δ = 12`; `Δ = −3` | `𝔞_f = 𝔞_{f'} = 𝒪₁₂`; `x² ≡ −1 (mod 3)` impossible so `f ≁ f'`; oriented image of `f'` is `√3·𝒪₁₂`, the nontrivial narrow class (`N(2 + √3) = 1`); `h(−3) = 1` | pass |
| B3 split | `m = 5, 8, 1` | `φ(5) = 4` classes, genera `{1,4}`, `{2,3}`; `(ℤ/5)ˣ/{±1}` of order 2; `(ℤ/8)ˣ` all square to 1, quotient trivial, four genera of one class; `m = 1` trivial | pass |
| B4 | `!![4,1;1,6]`, `!![2,1;1,12]`, `A₂`, `I₂`, `U` | only `±e₁` of norm 4 so `O = {±I}`, order 2, `2·#𝒪ˣ = 4`; `(x,y) ↦ (−x−y, y)` preserves `2x² + 2xy + 12y²`, order 4; `12`; `8`; `4` | pass |
| B5 | `Δ = −3, −4, −23, −44` | reduced primitive forms: `1, 1, 3` (`(1,1,6), (2,±1,3)`), `3` (`(1,0,11), (3,±2,4)`) | pass |
| B6 | `Δ = −4, 12, 1` | `T_L(ℤ) = {±1, ±i}` (`w = 4`); `{±(2 + √3)^k}` infinite; `{±1}` for `U` with `T_L(ℤ_p) ≅ ℤ_pˣ` | pass |
| B7 | `Δ = −4, 12, 1` | `2π·1/4 = π/2` (`h⁺ = 1`); `C_L` trivial (squares in a group of order 2), `(K × ℝˣ)/Γ` with `Γ ↪ ℝˣ` has volume `1·log(2 + √3)`; `𝔸ˣ/ℚˣ ≅ ℤ̂ˣ × ℝ_{>0}` infinite, `𝔸^{×,1}/ℚˣ ≅ ℤ̂ˣ` of volume 1 | pass |
| B8 | `Δ = −3`; `Δ = −23` | `h⁺ = 1`, `w = 6`, `m = 1/12`; `h⁺ = 3`, `a = 1`, `h = 2`, `m = 1/4 + 1/2 = 3/4 = 3/(2·2)`, while `h/(2w) = 1/2` | pass |
| 4G | `L = M`; `p = 2` on `ℤ²`; `p = 5` | index `1 ≠ p`; `(1+2a)² + (1+2b)² ≡ 2 (mod 4)`; `v = (11, 2)`, `v·v = 125 ≡ 0 (mod 50)`, `(5,0) − 2(11/5, 2/5) = (3/5, −4/5)` of norm 1 | pass |
| 1H / 1I (unchanged, rechecked) | `oddCyclic 3 θ`, `θ = 1, 2`; `⟨2⟩`, `⟨−2⟩` | signs `6`, `2`; Gauss sums `1 ± i`, signs `±1 = t₊ − t₋` | pass |
| `GramSameGenus`, `IsGenusMass` at `n = 0` | zero matrices | every clause vacuous or trivially true; `IsGenusMass 0 1` with the singleton | pass |

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms* (81:14, 91:9, 92:1, 92:1a, 92:5, 93:16, 93:28–29, 101:8, 102:7, 103:4, 104:4–5, 106:13): no legal copy; checked by computation only.
- Cassels, *Rational Quadratic Forms* and *Geometry of Numbers* (2F, 4F, B4); Cohen (B2, B5; uncertified in the manifest); Milnor–Husemoller (1H, 1I, 1L, 6A, 6H); Wall (1H); Gan–Yu Theorem 7.3 (7C); SPLAG Chapters 4, 15, 16; Ebeling; Kitaoka; Kneser: paywalled or absent.
- Serre, *A Course in Arithmetic* V.1.4.3, V.2, VII.6.6 (6A, 6B, 6D) and Cox (B2, B4, B5): the sources cache holds whole-book scans of both from university course pages (cache `15cea1a5…` and `f7ad9bab…`), which are neither publisher nor author copies, so I did not rely on them; the `Γ₁₆` construction and the non-isomorphism were checked by the root-span computation above, and the Cox locators are cited as the manifest settles them, uncertified.
- Kawauchi–Kojima (1G): settled uncertified in `sources.toml`.

## Source issues

- none
