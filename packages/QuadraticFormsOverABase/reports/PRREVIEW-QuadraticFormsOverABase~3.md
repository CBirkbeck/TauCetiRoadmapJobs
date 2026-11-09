# Review of QuadraticFormsOverABase (pull request #1930 at 9cca719)

**Verdict:** needs changes

All five findings are P3: library citations, one Dependencies line and one Check. Nothing is false or blocking. The previous review's P1 (R01, the route of 3.3) is repaired, and the new route is correct (adversarial rows 26–29).

## Previous findings (review of cdc1c9f)

| Id | Status at 9cca719 | Passage |
|---|---|---|
| R01 | repaired | `README.md:642–674`: "The route is infinitesimal lifting, which needs no flatness criterion". It has three bullets: the `P⁻¹β` correction, the `μ₂` retract, and the trace-zero correction through `N = ker λ` with Conrad's tangent count and Nakayama. Every step checks (rows 26–29). |
| R02 | repaired, one line missed | Scope 79–82, contract 205–209, and the 3.1 comparison 579–590 with `mem_constantForm_polarMatrix_iff` (`Suggested.lean:260–268`). The `x² + 4y²` Check is at 613–616. The `ℤ[1/2]` Check is explained by `C⁻¹ = C` (606–607). The Layer 3 Dependencies still list only §0.1a: see R04. |
| R03 | repaired | 704–705: "*Needs:* 2.4, 3.1, 3.2, 3.3; SchemeAndStackFoundations §1.1 …". The flatness sentence is at 700–702, the contract at 221–225, and the Dependencies at 728. |
| R04 | repaired | 848: "Prove that, for `n ≥ 1` and `f : R[X]` …", with no Lean name. |
| R05 | repaired | (a) 501–505 cite Conrad 2014, Definition C.1.2 (p. 303) and the proof of C.1.4 (p. 305). (b) 422–427 and 898 cite GeometryOfNumbersAndQuadraticArithmetic §6.8 `arfInvariant`, and Arf 1941 is gone from the References. (c) The Conrad 2015 sentence and its reference are gone. |
| R06 | repaired | 321–323: "homogeneous of degree `n` for every `n`, and that, for `n` odd, it is the only polynomial `d` with `2d = univDisc n`". |

## R01 (P3) — The route of 1.4 re-derives two Tau Ceti lemmas and claims their cases as its own

- **Location.** `TauCetiRoadmap/QuadraticFormsOverABase/README.md:383–391`:
  - "the first-order term of `det(P − t Uᵀ)` gives `det K ≡ (1 − n) det P (mod 4)` … finally `(−1)^(n/2) ≡ 1 − n (mod 4)`";
  - "The universal form over `ℤ[U]`, the case `n ≡ 2 (mod 4)` and the sign are proved by the route."
- **Claim.** The mod-4 step and the square step belong to this roadmap.
- **Witness.**
  - Tau Ceti `Matrix.four_dvd_neg_one_pow_mul_det_add_transpose_sub_det_sub_transpose` (`TauCeti/LinearAlgebra/Matrix/Determinant/Skew.lean:106`): for `S` of size `2k` over any commutative ring, `4 ∣ (−1)^k det(S + Sᵀ) − det(S − Sᵀ)`.
  - `Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero` (`:62`): over a field, a skew matrix with zero diagonal has square determinant.
- **Repair.**
  - In 1.4, replace the first-order step and the sign step with: "Tau Ceti's `Matrix.four_dvd_neg_one_pow_mul_det_add_transpose_sub_det_sub_transpose` at `S = U`, `k = n/2`, gives `(−1)^(n/2) det(U + Uᵀ) ≡ det(U − Uᵀ) (mod 4)` in `ℤ[U]`".
  - Cite `Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero` over the fraction field of `ℤ[U]` for the square.
  - Change the last sentence to "The hafnian step (`r ∈ ℤ[U]`, `r ≡ B (mod 2)`) is proved by the route".
  - Add both names to the *Needs:* line of 1.4 and to the Tau Ceti contract (`TauCeti/LinearAlgebra/Matrix/Determinant/Skew.lean`).
  - Tested at `n = 2`, `S = U`: `−det(U + Uᵀ) − det(U − Uᵀ) = −4U₀₀U₁₁ + 4U₀₁U₁₀`, which is divisible by `4`.

## R02 (P3) — The route of `mem_constantForm_polarMatrix_iff` re-derives Tau Ceti's coordinate criterion

- **Location.** `README.md:586–588`: "Route: when `2` is invertible, `Q_A(x) = ½ polar Q_A(x, x)`, so `g` preserves `Q_A` exactly when `gᵀ C g = C`, that is `g⁻ᵀ C g⁻¹ = C`".
- **Claim.** The equivalence `g ∈ O(Q)(A) ↔ gᵀ C g = C` is proved here.
- **Witness.**
  - Tau Ceti `TauCeti.QuadraticMap.mem_orthogonalGroup_iff_toMatrix` (`TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Coordinate.lean:35`, under `[Invertible (2 : R)]`): `g ∈ orthogonalGroup Q ↔ Aᵀ (Q.toMatrix b) A = Q.toMatrix b`.
  - Tau Ceti `QuadraticForm.toMatrix_polarBilin` (`…/QuadraticForm/Matrix.lean:29`): the polar matrix is `2 • Q.toMatrix b`.
- **Repair.**
  - Rewrite the route as: "`TauCeti.QuadraticMap.mem_orthogonalGroup_iff_toMatrix` in the standard basis (`QuadraticMap.coe_orthogonalToGeneralLinear`) and `QuadraticForm.toMatrix_polarBilin`, with `2` a unit, give `g ∈ O(Q)(A) ↔ gᵀ C g = C`. Then put `h = g⁻ᵀ` and apply `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`."
  - Add both names to the *Needs:* line of 3.1 and to the Tau Ceti contract.
  - Tested on the 3.1 Check: `Q.toMatrix = diag(1, 4)`, and `gᵀ diag(1, 4) g = diag(1, 4)` for `g = !![0, 2; 1/2, 0]`.

## R03 (P3) — `δ'` is never compared with Mathlib's discriminant `QuadraticForm.discr'`

- **Location.**
  - 1.2 (`README.md:340–346`) defines `halfDisc`, and 1.3 (360–368) gives its transformation rules.
  - Neither the Mathlib contract (143–165) nor the Scope (56–64) names `QuadraticForm.discr'`.
- **Claim.** `halfDisc` has no library counterpart to compare with.
- **Witness.** Mathlib `QuadraticForm.discr'` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1242`) is `det Q.toMatrix'`, under `[Invertible (2 : R)]` (line 1159). Its `discr'_comp` (`:1250`, factor `(det f)²`) and `discr'_smul` (`:1247`, factor `aⁿ`) are 1.3's rules when `2` is a unit.
- **Repair.**
  - Add to 1.2: "When `Invertible (2 : R)`, `2 δ'(Q) = 2ⁿ QuadraticForm.discr' Q` (`two_mul_halfDisc` with Tau Ceti `QuadraticForm.det_toMatrix_polarBilin`, `…/QuadraticForm/Matrix.lean:39`). So `δ'(Q) = 2^(n−1) discr' Q` for `n` odd, and 1.3 restricts to `discr'_comp` and `discr'_smul`."
  - Add the Check: at `q₃` over `ℚ`, `discr' = det !![0, ½, 0; ½, 0, 0; 0, 0, 1] = −1/4` and `2² · (−1/4) = −1 = δ'(q₃)`; halving `discr'` instead would give `−1/8`.
  - Add `discr'`, `discr'_comp` and `discr'_smul` to the Mathlib contract.
  - Add to the Scope: "`halfDisc` is `discr'` up to `2^(n−1)` and needs no unit `2`".

## R04 (P3) — The Layer 3 Dependencies omit two suppliers that 3.1 now uses

- **Location.** `README.md:726–728`: "Layers 0–2; Tau Ceti `GeneralLinear`, `HopfIdeal`, `RootsOfUnity`, `TauCeti.QuadraticMap.orthogonalGroup`; OrthogonalTamagawaAndLatticeMass §0.1a; SchemeAndStackFoundations §§1.1, 1.15, 2.3."
- **Witness.** The *Needs:* line of 3.1 (592–597) lists `TauCeti.ConstantForm.definingHopfIdeal`, `TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff` and "OrthogonalTamagawaAndLatticeMass §0.1 and §0.1a".
- **Repair.** Change the line to: "Layers 0–2; Tau Ceti `GeneralLinear`, `HopfIdeal`, `ConstantForm`, `RootsOfUnity`, `TauCeti.QuadraticMap.orthogonalGroup` and its coordinate criterion (R02); OrthogonalTamagawaAndLatticeMass §§0.1, 0.1a; SchemeAndStackFoundations §§1.1, 1.15, 2.3."

## R05 (P3) — A Check of 2.4 is false at the zero algebra

- **Location.** `README.md:540–542`: "Over `𝔽₂(t)`, `t x²` is smooth and not isometric to `x²` over any étale `𝔽₂(t)`-algebra (that needs `√t`)".
- **Witness.** The zero algebra is étale over `𝔽₂(t)`, and over it both forms live on the zero module and are isometric. `exists_etale_isometryEquiv_standard` excludes it only through `Module.FaithfullyFlat`.
- **Repair.** Write: "…not isometric to `x²` over any nonzero étale `𝔽₂(t)`-algebra: an isometry is a unit `u` with `t u² = 1`, so every factor field, separable over `𝔽₂(t)`, would contain the inseparable `√t`…".
  - Tested: `S = 0` is excluded.
  - For `S = L₁ × ⋯ × L_r` with each `Lᵢ` separable, `t` is not a square in any `Lᵢ`.

## Verified sound

### Gate, build and dependency check

- **Worker's gate** (`scratch/gate.md`, at 9cca719): every check is 0, including `build=0`.
- **My re-run of the gate.** All 27 other checks are 0. It reports `depcheck: NOT IN ORDER: QuadraticFormsOverABase (insert it after its last supplier)`, because the public order file does not list this roadmap yet. The candidate merge order places it at line 392, right after HyperellipticCurves (391), so this is not a finding.
- **The brief's depcheck command** prints `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`: no UPWARD line and no CYCLE line.
- **Suppliers in the candidate order.** GeometryOfNumbersAndQuadraticArithmetic 54, LefschetzPencilsAndVanishingCycles 66, OrthogonalTamagawaAndLatticeMass 148, QuadraticFormInvariantsPartII 386, HyperellipticCurves 391. SchemeAndStackFoundations and QuadraticFormInvariants are on main. The pull request's "Depends on" list names all five open suppliers.
- **Changes outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.AG"`).
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 13.8 s. Its 22 warnings are all `declaration uses 'sorry'`.
- **Mechanical signature check.** One scratch file holds `#check @name` for all 39 declarations and elaborates with exit 0.
  - Every elaborated type matches its README statement.
  - `mem_constantForm_polarMatrix_iff` carries `[Invertible 2]` in its own signature, with `A : Type u`, as `mem_orthogonalGroup_iff_le_ker` does.
  - The other hypotheses are as before: `Odd n`, `Even n`, `3 ≤ n`, `IsSmooth Q`, `Even n ∨ IsUnit 2`, `Ideal.span {2, b₁, b₂} = ⊤`.
  - Nothing changed.
- **One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | (norm_num; done) | (simp_all; done) | decide | (aesop; done)`. All 22 theorems fail to close, so there is no padding.
- **Form.**
  - One module docstring, which names the five headlines that cannot be stated at the pins with the carrier each lacks: the 0.2 `extendScalars` comparison, the 2.1 ordinarity comparison, the 3.1 §0.1a comparison, 3.4, and 6.1 (`formDiscr`).
  - No `set_option`, no `lemma`, no sorry'd data.
  - The imports are `import Mathlib` plus four Tau Ceti modules, each of which exists at the pin.

### Headline theorems

- Every end theorem of the Summary that is statable at the pins is stated: 1.1–1.4, 2.2, 2.4, 3.1–3.3, 4.1, 5.1 and 5.2.
- 3.4 and 6.1 are named in the docstring as not statable, with their missing carriers.
- The new `mem_constantForm_polarMatrix_iff` is a comparison with a real proof obligation (polarisation with a unit `2`, plus transposition), not a restated Check.

### Sources read at their locators

The seeded sample is 0.2, 1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 2.4, 3.1, 3.2, 3.3, 3.4, 4.1, 5.2 and 6.1. The texts were fetched legally through the sources service into a scratch manifest: Conrad's author page, and arXiv for the rest.

- **0.2, 3.4 and 6.1** name no source, so their routes were checked as proofs (table).
- **Conrad2014**, Appendix C, author's version:
  - §C.1, p. 302, lines 12394–12411: non-degeneracy, "ordinary" (2.1). Remark C.1.1, line 12422, cites Knus IV 3.1.
  - p. 303, lines 12435–12439: `O(q)` is a finitely presented closed subgroup (3.1).
  - Definition C.1.2 and "elementary to check", lines 12451–12461 (2.3).
  - Paragraph before C.1.4, lines 12476–12487, and Proposition C.1.4 (1)–(3), lines 12491–12501, p. 304 (1.1, 1.3, 2.2).
  - Proof of C.1.4, p. 305: `disc′(qₙ) = (−1)^m` at line 12525 (2.3, Layer 1 Examples), and the Witt-vector lift at lines 12527–12542 (2.2).
  - Theorem C.1.5, p. 305, lines 12550–12554 (3.3).
  - Step 1, pp. 306–307: tangent space `B_q(x, T x) = 0` at lines 12587–12591, and `dim = n(n−1)/2 + (δ² + δ)/2` at line 12605 (the route of 3.3).
  - Step 2, p. 307, lines 12607–12617: `(det g)² = 1` and `O = μ₂ × SO′` (3.2).
  - Step 3, p. 308, lines 12643–12659.
  - Lemma C.2.1, p. 309, lines 12685–12695 (2.4).
  - Remark C.2.3, p. 310, line 12753, with the idempotent at line 12764 (Layer 4 Examples).
  - Proposition C.2.4, pp. 311–312, lines 12806–12819 (4.1).
  - Exercise 1.6.10, p. 50, lines 2131–2147 (2.2).
  - Theorem C.2.11 and Remark C.2.12, p. 318, lines 13075–13090.
- **Voight2011** (arXiv v5): (3.2) on p. 9, line 407 (1.1 Check); §4, p. 17, lines 790–793, Azumaya iff semiregular (4.1); standing Noetherian hypothesis at line 17, as the README says.
- **Voight2016** (arXiv v3): Construction 3.12 and (3.13), p. 16, lines 741–747; Theorem A (iii), line 160 (5.2).
- **ChaputRomagny2010** (arXiv v1): Remark 4.1.2, p. 20, lines 914–919 (3.1 Check).
- **AuelBieselVoight2023** (arXiv v2): Proposition 3.10, line 431; Proposition 3.20 and Lemma 3.21, p. 10, lines 559–565; Remark 3.25, line 586 (1.4).
- **Wood2011** (arXiv v1): Key Construction, p. 7, line 299, `τ² = −bτ − ac` (1.4 Check).

All of these support the statements as written. Dieudonné 1955 and Biesel–Gioia 2016 are cited only in Examples and the Research context, outside the sample, and were not re-read this round.

### Library declarations opened at the pins (86)

72 names were checked by `#check` (exit 0), and these were read in source:

- **Tau Ceti:**
  - `RootsOfUnityGroup.coordinateRing_smooth_iff` (`Algebra/AlgebraicGroup/RootsOfUnity/Smooth.lean:44`; over a field, on `k[ℤ/n]`).
  - `ConstantForm.definingHopfIdeal` (`Algebra/AlgebraicGroup/ConstantForm/Basic.lean:247`), `groupScheme` (`:324`), and `mem_definingPointsSubgroup_iff` (`:414`, row convention `M C Mᵀ = C`).
  - `CommHopfAlgCat.quotientPointsSubgroup` (`Algebra/AlgebraicGroup/HopfIdeal/Points/Basic.lean:180`).
  - `QuadraticMap.orthogonalToGeneralLinear` and `coe_orthogonalToGeneralLinear` (`LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:758, 783`).
  - `QuadraticMap.mem_orthogonalGroup_iff_toMatrix` (`…/OrthogonalGroup/Coordinate.lean:35`, R02).
  - `QuadraticForm.toMatrix_polarBilin` and `det_toMatrix_polarBilin` (`LinearAlgebra/QuadraticForm/Matrix.lean:29, 39`).
  - `Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero`, `four_dvd_neg_one_pow_mul_det_add_transpose_sub_det_sub_transpose` and `IsSymm.neg_one_pow_mul_det_modEq_zero_or_one` (`LinearAlgebra/Matrix/Determinant/Skew.lean:62, 106, 149`, R01).
- **Mathlib:**
  - `QuadraticMap.Nondegenerate` (`LinearAlgebra/QuadraticForm/Radical.lean:115`): radical `⊥` and polar kernel of rank `≤ 1`.
  - `QuadraticForm.discr'`, `discr'_smul` and `discr'_comp` (`…/QuadraticForm/Basic.lean:1242, 1247, 1250`, under `[Invertible (2 : R)]`, R03).
  - `Algebra.Smooth.baseChange` (`RingTheory/Smooth/Basic.lean:572`), `IsLocalRing.map_tensorProduct_mk_eq_top` (`RingTheory/LocalRing/Module.lean:71`), `surjective_of_isLocalized_maximal` (`RingTheory/LocalProperties/Exactness.lean:64`).
  - Mathlib has no retract lemma for `Algebra.FormallySmooth` (searched `RingTheory/Smooth/`). The one-line argument of 3.3's converse (lift through the retraction, compose with the section) is complete as written.

### Cross-roadmap citations resolved

- **OrthogonalTamagawaAndLatticeMass** (open head):
  - §0.1 at README line 122: `TauCeti.ConstantForm.groupScheme K n C`, nondegenerate `C`, characteristic `≠ 2`, smoothness.
  - Conventions at line 16: `M B Mᵀ = B` is transported by `M ↦ M⁻ᵀ`.
  - §0.1a at line 146; the §0.2 Check at line 181 uses the same `M⁻ᵀ` witness.
  - The Gram matrix there is that of `B` with `Q(x) = B(x, x)/2`, which is `polarMatrix Q`.
- **GeometryOfNumbersAndQuadraticArithmetic** (#851 head): §6.8, README line 2768, defines `arfInvariant q` as the class of `Σ q(eᵢ) q(fᵢ)` in `K/℘(K)`, independent of the symplectic basis.
- **SchemeAndStackFoundations** (main): §1.1 `qcoh_fpqc_descent` (lines 2071–2074), §1.15 `IsTorsor` (2502–2504), §2.3 `NonabelianH1`, `NonabelianH1.mk`, `mk_eq_one_iff` (3330–3338).
- **LefschetzPencilsAndVanishingCycles** (#873 head): §2.1 at line 1440, §2.2 at line 1500, `evenClifford_center_etale_azumaya` at `Suggested.lean:99`.
- **QuadraticFormInvariantsPartII**: §0.2 at line 484, with `extendScalars` at `Suggested.lean:101`.
- **HyperellipticCurves**: §0.1 at line 541, with `formDiscr` at `Suggested.lean:86`.

### Ownership and overlaps

- **Search by object.** `roadmaps grep` over main and the 466 open heads, for: half-discriminant, hafnian, discriminant algebra, orthogonal group scheme and `orthogonalIdeal`, `ConstantForm.groupScheme`, smoothness of `O`/`SO`.
- **Results.**
  - Only this roadmap owns 1.1–1.4, 3.1–3.3, 4.1, 5.1–5.2 and 6.1.
  - The IntegralLattices hits, on main and in the revisions #1411 and #1797, mention orthogonal group schemes of lattices without owning them.
  - OrthogonalTamagawaAndLatticeMass §§0.1, 0.1a are credited in the Scope.
- **Overlaps.** `overlaps.md` lists no pull request that changes this roadmap and no dropped id that it cites. No roadmap cites QuadraticFormsOverABase, which matches "Downstream consumers: None."

### Adversarial pass

| # | Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|---|
| 1 | Conventions `coeffMatrix`, `polarMatrix` | `ax²+bxy+cy²`; `x²` on `Fin 1 → 𝔽₂` | `!![a,b;0,c]`, `!![2a,b;b,2c]`, det `4ac−b²`; polar `!![0]` vs coefficient `!![1]` | holds | none |
| 2 | `standard` (Lean body) | `n = 0,1,3,4` | empty; `(0,0)` → `x₀²`; `(0,1),(2,2)` → `x₀x₁+x₂²`; `(0,1),(2,3)` | matches README | none |
| 3 | 0.2 evaluation law | `xy`, `ℤ → ℤ/6`, `(2,3)` | `6 ↦ 0` / `2·3 = 0` | holds | none |
| 4 | 0.2 `mapCoeffs_eq_baseChange` | `x²`, `A = R[t]`, `t e₀` | `t²` / `t²` | holds | none |
| 5 | 1.1 `two_mul_univHalfDisc` | `n = 1,3,5`; `n = 2` | 1/18/1110 terms, 0 odd coefficients; coefficient `−1` at `U₀₁²` | odd `n` needed and stated | none |
| 6 | 1.1 Voight check | `½ det !![2a,w,v;w,2b,u;v,u,2c]` | `4abc+uvw−au²−bv²−cw²` = Voight2011 line 407 | holds | none |
| 7 | 1.2 `two_mul_halfDisc` | `q₃`; `ax²` | `det = −2 = 2·(−1)`; `2a = 2·a` | holds | none |
| 8 | 1.2 against Mathlib `discr'` | `q₃` and `x²+y²+z²` over `ℚ` | `discr' = −1/4`, `4·(−1/4) = −1 = δ'`; `discr' = 1`, `4·1 = 4 = δ'` | holds; comparison absent | R03 |
| 9 | 1.3 `halfDisc_comp` | `g = 2` on `x²`; `g = 0`, `n = 1`; `diag(−1,1,1)` on `q₃` | `4 = 2²·1`; `0 = 0·a`; `−1 = 1·(−1)` | holds for every matrix | none |
| 10 | 1.3 `δ'(aQ)` | `a = −1`, `q₃` | `½ det(−P) = ½(−1)³(−2) = 1 = (−1)³(−1)` | holds | none |
| 11 | 1.4 `four_dvd_univSignedDisc_sub_sq` | `n = 0,2,4`; sign flipped | 0/1/99 terms, all `≡ 0 (mod 4)`; flipped: 1/2/12 coefficients fail | holds | none |
| 12 | 1.4 route against Tau Ceti `Skew.lean:106` | `n = 2`, `S = U` | `−det(U+Uᵀ) − det(U−Uᵀ) = −4U₀₀U₁₁ + 4U₀₁U₁₀` | Tau Ceti step | R01 |
| 13 | 1.4 `discr_discAlgebra` | `n = 2`; `n = 0` | `b² + 4(−ac) = b² − 4ac`; `1 + 4·0 = 1` | holds | none |
| 14 | Layer 1 Example (Arf) | `vᵢ = e_{yᵢ}/bᵢ`; `ω = Bt` | polar `(uᵢ,vᵢ) = 1`, `f(uᵢ)f(vᵢ) = aᵢcᵢ/bᵢ²`; `t² = t + Σ aᵢcᵢ/bᵢ²` | agrees with GeometryOfNumbersAndQuadraticArithmetic §6.8 | none |
| 15 | 2.1 `IsSmooth` | `x²+yz`, `x²+y²+z²` over `𝔽₂`; `x²+ty²` over `𝔽₂(t)`; `n = 0` | radical 0; radical = plane `x+y+z = 0` over `K̄`; rational radical 0, `x = √t y` over `K̄`; vacuous | correct | none |
| 16 | 2.1 against `Nondegenerate` | characteristic 2, polar kernel `W` | radical 0 over `K̄` ⇔ `dim W ≤ 1` and `Q ≠ 0` on `W` ⇔ Mathlib's two fields | holds both ways | none |
| 17 | 2.2 unit criteria | `x²+yz`, `x²+y²+z²`, `xy`, `x²+y²` over `𝔽₂`; `x²+y²` over `ℤ`; zero ring | `δ' = 1, 0`; `det = 1, 0`; `det = 4`, not smooth at 2; both sides true | holds | none |
| 18 | 2.3 standard forms | `q₁…q₄`; `q₀` | `δ' = 1, −1`; polar `det = −1, 1`; `det = 1`; Conrad2014 line 12525: `disc(qₙ) = 2(−1)^m` | holds | none |
| 19 | 2.4 `isSmooth_iff_exists_faithfullyFlat` | zero ring; `x²+y²` over `ℝ`; `tx²` over `𝔽₂(t)` | `S = 0`, both sides true; `(x+iy)(x−iy)`, `det = −2i`; needs `√t` | holds | none |
| 20 | 2.4 odd step and Check | `T = S[t]/(t²−λ⁻¹)`; `S = 0` over `𝔽₂(t)` | `λ(ty)² = y²`, `discr = 4λ⁻¹`; `tx² ≅ x²` on the zero module | the Check fails at `S = 0` | R05 |
| 21 | 3.1 relations | `x₀x₁`, `X = !![a,b;c,d]`; `Q = 0` | `ac`, `ad+bc−1`, `bd`; `ad` idempotent, so two families over a connected `A`; ideal `⊥` | holds | none |
| 22 | 3.1 `mem_constantForm_polarMatrix_iff` | `x²+4y²`, `C = diag(2,8)`, `g = !![0,2;½,0]` | `gᵀCg = diag(2,8)`; `gCgᵀ = diag(32,½)`; `M = (gᵀ)⁻¹ = !![0,½;2,0]`, `Mgᵀ = 1`, `MCMᵀ = diag(2,8)` | holds | none |
| 23 | 3.1 route against Tau Ceti `Coordinate.lean:35` | the same `g` | `gᵀ diag(1,4) g = diag(1,4)` | Tau Ceti step | R02 |
| 24 | 3.2 `det_sq_eq_one` | `Q = 0` on `ℚ¹`, `g = 2`; swap for `x₀x₁` | `4 ≠ 1` (needs smoothness); `(−1)² = 1` | holds | none |
| 25 | 3.2 `existsUnique` | `q₃`, `g = −I`; swap at `n = 2` | `ζ = −1`, `h = I`; `det(ζh) = ζ² = 1 ≠ −1` | odd `n` needed and stated | none |
| 26 | 3.3 lifting, from `n` even or `2 ∈ Rˣ` | `𝔽₂[ε]`, `x₀x₁`, `g̃ = !![ε,1;1,0]` | `Q∘g̃ − Q = εx₀²`, `T = !![0,0;ε,0]`, `g̃(1+T) = !![2ε,1;1,0] = !![0,1;1,0]` | lifts | none |
| 27 | 3.3 converse (retract) | `n` odd; `x²` over `𝔽₂`; `R = 0` | `det(ζ·1) = ζⁿ = ζ`; `𝔽₂[t]/(t−1)²` not smooth; `IsUnit 2` true | holds | none |
| 28 | 3.3 `smooth_specialOrthogonal` route | `q₃` over `ℤ`, `ℚ`, `𝔽₂` | `∇δ'`: `∂_{x₂²} = −1`, `∂_{x₀x₁} = −2`; `λ(Q,0) = −3 = 3δ'`, `λ(0,1) = 2`; `λ∘Φ = −2T₂₂ − 2(T₀₀+T₁₁) + 2 tr T = 0`; `Φ` onto `N` over `ℤ` (solved); rank 6, kernel 3 | holds | none |
| 29 | 3.3 Conrad tangent count | `n = 3`, `δ = 1` | `nδ + (n−δ)(n−δ−1)/2 = 4 = 3 + 1` (Conrad2014 line 12605) | holds | none |
| 30 | 3.3 non-smooth Check | `(x+y)²` over `K̄` | `c = 1+a`, `d = 1+b`, `det = a − b`; dimension 2 ≠ 1 | holds | none |
| 31 | 3.4 Checks and flatness | `H¹(ℝ,O(q₂))`; `H¹(ℤ,μ₂)`; `E₈`; `μ₂` over `ℤ` | 3 signatures; `ℤˣ/ℤˣ² = {±1}`, `Pic ℤ = 0`; polar `det = 1`, definite vs indefinite; `ℤ[t]/(t²−1)` free of rank 2 | holds | none |
| 32 | 4.1 `isAzumaya_even_iff` | `0·x²` (`n = 1`); `x²+y²+z²` over `ℤ`; `q₃`; ideal `rC₁` | `C₀ = R` Azumaya with `δ' = 0`; Lipschitz order, `δ' = 4`; `M₂(ℤ)`, `δ' = −1`; `(rc)(rc′) = −r²cc′ = 0` | `n ≥ 3` needed and stated | none |
| 33 | Layer 4 Examples | `x²+xy+y²`, `x₀x₁`, `x²+y²` over `𝔽₂` | `t² = bt − ac`: `t²+t+1`; `t² = t`; `t² = 1` | hold | none |
| 34 | 5.1 `etale_discAlgebra_iff` | `xy`; `x²+xy+y²`, `x²+y²` over `𝔽₂`; `n = 0` | `ω² = ω`; `ω² = ω+1` (`𝔽₄`); `ω² = 1`, not étale; `QuadraticAlgebra R 0 1` | holds | none |
| 35 | 5.2 `exists_productHom` | `ℤ[i]²`; golden²; split `A₂`; Voight (3.13) | `a = 4, b = 0`, 16, `i⊗i ∉ ⟨1, 2i⊗i⟩`; `a = 6, b = −1`, 25; `a = a₁, b = −b₁`; `ω′ = w − b₁b₂` gives `ω′² = a − b₁b₂ω′` | holds | none |
| 36 | 6.1 formal-degree identity | `n = 2`; `c + bX` at `n = 2`; `n = 1`; `X³ − X` | `a(b²−4ac)` both sides; `0 = 0`; `a₁ = a₁` (also at `0`); `1·4 = (−1)³(−4)` | holds | none |

The symbolic rows (5, 11, 12) were computed by an exact pure-Python polynomial expansion of the universal determinants and hafnians. Rows 22 and 23 use exact rational matrix products.

## Not verifiable

- **Knus 1991, Chapter IV, (3.1).** Springer, paywalled. It is cited only through Conrad's Remark C.1.1, and Conrad2014 line 12424 confirms the citation.
- **Bichsel–Knus 1994.** AMS Contemporary Mathematics, not fetched. It is cited only to exclude line-bundle-valued forms from scope.
- **Grothendieck, Montpellier fonds, folder 77, p. 68** (Research context). It is an image-only manuscript, and OCR is not available on this worker.

## Source issues

- **Misprint** in Wood2011 at §2, Key Construction, p. 7 (arXiv v1): the source says "we we construct", with a doubled word; it should be "we construct"; affects nothing.
- **Misprint** in AuelBieselVoight2023 at Remark 3.19, p. 10 (arXiv v2): the source says "once wishes to prove an equality"; it should be "one wishes"; affects nothing.
