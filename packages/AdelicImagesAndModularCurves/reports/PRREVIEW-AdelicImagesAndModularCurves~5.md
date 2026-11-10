# Review of AdelicImagesAndModularCurves (pull request #1727 at 07264a8)

**Verdict:** needs changes

Two P3 findings, both wording of a route or of a quantifier; no statement of a target is wrong. The six findings of the previous review are repaired.

## R01 (P3) — 6.4: Fricke's `σ` is not an eta quotient, and the birationality step rests on a fact no supplier states

Location: `README.md:2673–2676`, “Fricke's modular functions `τ, σ` of level `N` (eta quotients, MF §0.2) satisfy `σ² = F_N(τ)` … and `j(z)`, `j(Nz)` are rational functions of `(τ, σ)` over `ℚ`”. The pull-request description repeats it: “the X₀(N) models on Fricke's eta quotients (Ligozat 1975)”.

Claim: `τ` and `σ` are eta quotients, so ModularForms §0.2 supplies them; and the map `z ↦ (τ, σ)` is birational because `j(z)`, `j(Nz)` are rational in `(τ, σ)`.

Witness:
- At `N = 21`, ligozat1975 lines 1249–1255 (§4.1, p. 41): `σ` is finite and real on the imaginary half-axis and `σ(z) = −σ(−1/(Nz))`. So `σ(i/√21) = 0`. The function `η` has no zero on the upper half-plane, so no eta quotient vanishes at `i/√21`.
- ligozat1975 lines 1281–1283 (p. 42, (4.1.0)): the rationality of `j`, `j_N` in `(σ, τ)` is quoted from Fricke 1922 without proof. No section of ModularForms, AlgebraicCurves or CanonicalModelsAndGonality states it, and the README gives neither `τ`, `σ` nor `F_N`.

Repair:
- Delete “(eta quotients, MF §0.2)” and “Fricke's eta quotients” in the description. Say instead what fixes the two functions: `τ, σ ∈ ℚ(X₀(N))` with rational `q`-expansions, the leading terms of Ligozat §4.1 (i)–(ii), p. 41 (at `N = 21`: `τ = q⁻¹ + O(1)`, `σ = q⁻² + O(q⁻¹)`, `τ ∘ W₂₁ = τ`, `σ ∘ W₂₁ = −σ`), and `σ² = F_N(τ)` with `F_N` of his table (4.2.4), p. 44. Make their existence the stated input of the two model targets; MF §0.2 is then cited only for the orders at the cusps of the eta quotients they are built from.
- Replace the step through `j(z)`, `j(Nz)` by a degree count. At `N = 21`: `τ` has exactly the two simple poles `∞` and `0`, so `[ℚ(X₀(21)) : ℚ(τ)] = 2`; `σ ∉ ℚ(τ)`, since `W₂₁` fixes `τ` and negates `σ ≠ 0`; hence `ℚ(τ, σ) = ℚ(X₀(21))`. State the same pole count at `N = 27`.
- Add the Check: `σ(i/√21) = 0`, so `σ` is not an eta quotient.

## R02 (P3) — 3.3 and 4.5: “members of the two classes are commensurable” does not say which members

Location: `README.md:2004–2005`, “With CM, members of the two classes are commensurable exactly when `End(E_{K̄}) = End(E'_{K̄})`”; `README.md:1574–1575`; the description (“with CM exactly when the endomorphism rings agree”).

Claim, read for all members: when the orders agree, every member of one class is commensurable with every member of the other.

Witness: `E' = E : y² = x³ − x` over `ℚ`, `φ = id`, the same order `ℤ[i]`. Let `H = ρ_E(G_ℚ)` in an `𝒪 ⊗ ẑ`-adapted frame and `g = [[1, 1], [0, 1]] ∈ GL₂(Ẑ)`.
- `g² = [[1, 2], [0, 1]]` is not multiplication by an element of `𝒪 ⊗ ℤ_ℓ` (that would need `y = 0` and `−n·y = 2` in the matrix `[[x, −ny], [y, x + ty]]`). So `g_ℓ ∉ N_𝒪(ℤ_ℓ)` for every `ℓ`.
- Hence `C_𝒪(ℤ_ℓ) ∩ g N_𝒪(ℤ_ℓ) g⁻¹` is a proper subgroup of `C_𝒪(ℤ_ℓ)` for every `ℓ`.
- `H` contains `∏_{ℓ ≥ ℓ₀} C_𝒪(ℤ_ℓ)` for some `ℓ₀` (4.5, first bullet). So `[H : H ∩ gHg⁻¹] ≥ 2^k` for every `k`: the two members `H` and `gHg⁻¹` of one class are not commensurable.

The proof in 4.5 shows the existential form, and the Check at `README.md:2031–2036` shows the universal negative. Only the statement is ambiguous. The previous review's suggested wording had the same ambiguity.

Repair: in 3.3, 4.5 and the description write the quantifiers.
- Without CM: every member of one class is commensurable with every member of the other.
- With CM: some member of `adelicImage E` is commensurable with some member of `adelicImage E'` exactly when the two orders agree; when they differ, no pair is.
- Add the pair `H`, `gHg⁻¹` above as a Check.

## Verified sound

**The previous review's findings (at d3857c3): 6 of 6 repaired.**

| Previous | Status | Passage at this head |
|---|---|---|
| R01 CM commensurability | repaired (quantifier: R02) | `README.md:1572–1577`; 4.5 “Isogenous curves” `2001–2016`; negative control `2031–2036` |
| R02 models passed between two roadmaps | repaired | six owned model targets `2648–2678`; scope `120–127`, `3049–3054`; CMG contract `457–461` |
| R03 `X₁(16)`, `X₁(18)` points | repaired | gaps `547–560`; 6.4 `2684–2687`; Needs `2735–2739`; both slugs in the description |
| R04 Serre weight and conductor | repaired | `1641–1648`, Needs `1650`; contracts `399`, `462–469`; table `516–518` |
| R05 BELOV Theorem 1.1 route | repaired | `2251–2285`; Check `2311–2318` |
| R06 names and locators | repaired | CMG §§2.5, 9.1 at `123`; `AlmostConjugateOfFiniteIndex` at `486`, `1402`; `Subgroup.AlmostConjugate` under “From Tau Ceti” `325–326`; BELOV entry `3246–3251` |

**Gate and dependency check.**
- The gate, rerun at this head, prints “OK” with every count `0`. The targeted build is the worker's (`build=0`).
- `git diff --stat origin/main...HEAD` outside the folder is empty. The pins equal main's (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`).
- The dependency check printed `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`: no UPWARD or CYCLE line.
- Merge-order positions: ArithmeticGaloisRepresentations 58, ModularCurvesPartII 71, AlgebraicModularFormsAndSerreWeights 99, ClassicalSerreModularity 169, EffectiveDiophantineMethods 177, EllipticCurveModularityPartII 275, ArithmeticDynamics 339, this roadmap 357. The new suppliers of this round are all earlier or on main (ModularCurves, ModularForms, AlgebraicCurves).
- Overlaps: none listed. EllipticCurveModularityImaginaryQuadratic (its l.48, 2375) and NoncommutativeAndEquivariantIwasawa (its l.4477) name this roadmap as a consumer only.

**Lean.**
- `lake env lean Suggested.lean`: 25 `sorry` warnings and nothing else.
- The file changed in three docstrings only since the previous head. I compared the 45 elaborated types of the worker's signature list with the README statements; none needs a change. `adelicTateModule` omits `[CharZero F] [IsSepClosed K]`, which the carrier does not need; `finrank_adelicTateModule` carries both.
- One-tactic probe: on a scratch copy every `sorry` was replaced by `first | rfl | simp | infer_instance`. All 25 fail, one error at each site. No padding found.
- The namespace `TauCetiRoadmap.AdelicImagesAndModularCurves` and the names `mazur_torsion`, `kenku_isogenyClassSize` occur in no other roadmap's Lean file. The same-name lead `Gamma` is Mathlib's `CongruenceSubgroup.Gamma : Subgroup SL(2, ℤ)`, a different object in a different namespace.

**Headline theorems.** Stated: the inverse-limit property of `GL₂(Ẑ)`; level, `±H`, `Γ_H`, strong approximation, density; Serre's lifting lemma in both forms; the commutator subgroup; twist and Gassmann invariance; the rank of `T̂E`; the index-two obstruction; Serre's open image theorem (almost all `ℓ`, adelic finite index) and the CM counterpart; Mazur's torsion theorem with realisation; Kenku's class sizes; `|GSp₄(𝔽_ℓ)|`. The docstring names the others with the carrier each lacks (a frame, `X_H`, the genus-two Jacobian, `PSp₄` and Mitchell's list).

**Adversarial pass.** Values computed this round; “script” means a finite enumeration.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.3 exceptional preimages | `G_{A₄}(5)`; `G_{S₄}(13)` | `480/48 = 10`, det `{1, 4}`; `2184/24 = 91`, `13 ≡ −3 mod 8` | holds |
| 0.3 Cartan orders | `N = 13`, `15` | `26208/336 = 78`, `26208/288 = 91`; `192`, `64` | holds |
| 0.2 level of `±H` | `{g ∈ Γ(2) : g₁₁ ≡ 1 mod 4}` | `−I ↦ A = I`, `A₁₁ = 1`; levels `4`, `2` | holds |
| 1.2 genus | `Γ₀(11)`, `Γ₀(13)`, `Γ₀(26)`, `Γ₀(22)`, `Γ₀(23)` | `1`, `0`, `1 + 42/12 − 2/4 − 2 = 2`, `1 + 3 − 2 = 2`, `1 + 2 − 1 = 2` | holds |
| 1.3 cusps (script) | `Γ₁(11)`, `Γ₁(13)`, `Γ₀(9)`, `X_arith(5)` | `(10, 5, {1⁵, 5})`; `(12, 6, {1⁶, 6})`; `(4, 2, {1, 1, 2})`; `(12, 2, {1, 1, 2, 4, 4})` | holds |
| 1.4 comparison | `Γ(2)`; `Γ₁(3)` | `1 + 6/12 − 3/2 = 0`; degree `4`, not `8` | holds |
| 2.1 normaliser of `C_s(2^k)` | `k = 1, 2, 3` | `6, 32, 128` against `2, 8, 32` | holds |
| 2.2, `ℓ = 2`, `SL₂` (script) | all 64 pairs of lifts of `S`, `T` to `SL₂(ℤ/8)` | each generates all 384 elements; lifts from mod 2 to `SL₂(ℤ/4)` give orders `12` or `48` | holds |
| 2.2, `ℓ = 2`, `GL₂` (script) | index-two subgroups of `GL₂(ℤ/8)` | 7 in all, 4 surject onto `GL₂(ℤ/4)` (order 96) | holds |
| 2.2 lifting route | `ℓ = 5`; `ℓ = 3` | `c = 10 ≡ 0`; `c = 1`, `[[1, 1], [−3, −2]]³ = I` | holds |
| 2.4 single commutators | `[diag(a, 1), u_y]`, `[diag(a, 1), w]`, `[s, t]` | `[[1, (a − 1)y], [0, 1]]`; `diag(a, a⁻¹)`; `[[1, −1], [1, 0]]`, det `1` | holds |
| 2.6 twists | `S_χ`; `⊤` and `det⁻¹(ker mod 3)`; `Γ₀(3)` with `ψ·(χ_q ∘ det)` | `−I ∈ SL₂`, so `−I ∈ H₁ ⟺ −I ∈ H₂`; indices `1`, `2` without full det; `ψ(−I) = −1` | holds |
| 2.7 isogeny orbits | `⊤` at `N = 2`; `Γ₀(9)` | `{(1,1,1), (2,1,1)}`; one fixed cyclic subgroup of order 9 (`(1, 3)ᵗ` needs `a ≡ d mod 3`) | holds |
| 2.8 Gassmann invariants | `Γ₁(3)` against `±[[1, b], [0, 1]]`; `C_s⁺(13)`, `C_ns⁺(13)` | `−I` fixes `0` and `8` cosets; indices `91 ≠ 78` | hypothesis discriminates |
| 3.4 level against entanglement | `Γ₀(2) ×_{ℤ/2} Γ₀(3)` | level `6 = 2·3`, index `24`, entanglement `2` | holds |
| 3.6 torsion growth list | degrees `< 24` | excluded `11, 13, 17, 19, 23, 22`; 16 degrees remain | holds |
| 4.3 step 2 | `K = ℚ(ζ₇)`, `ℓ = 7` | `χ̄₇(G_K) = 1`, image in `SL₂(𝔽₇)` | hypothesis needed |
| 4.4 step 3 | `ℓ' < ℓ₀ ≤ ℓ` | `ℓ ∤ ℓ'^a(ℓ'² − 1)` | holds |
| 4.5 isogenous CM curves | `x³ − x → x³ − 11x − 14`; `E' = E`, `g = [[1,1],[0,1]]` | `x(x² + 3x + 2) ↦ x(x² − 6x + 1) ↦ x³ − 11x − 14`; discriminants `−4`, `−16`; index `≥ 2^k` | holds; **quantifier (R02)** |
| 5.1 components | `X(5)`; `det⁻¹(ker mod 3)` | `4 × 60 = 240`; two components, total degree `2` | holds |
| 5.2 fine case | `Γ₁(3)` | `diag(1, −1)` fixes `e₁`, its twist `diag(−1, 1)` fixes `e₂` | holds |
| 5.3 `C_ns⁺(13)` | the 13 discriminants | `(D/13) = −1` exactly for `−7, −8, −11, −19, −28, −67, −163` | holds |
| 5.4 CM bullet | Abramovich | `4(ℓ − 1) < (7/1600)(ℓ² − 1)` iff `ℓ ≥ 914` | holds for large `ℓ` |
| 5.4 Theorem 1.1, step 2 | `ℓ = 5`, `a = 11`; `ℓ = 7` | `A₅ ≤ PSL₂(𝔽₁₁)`, so at `ℓ = 5` the quotient to exclude is `PGL₂(𝔽₅) ≅ S₅` (order 120), not `A₅`; `|PSL₂(𝔽₇)| = 168 ≠ 60, p(p² − 1)/2` for `p ≠ 7` | holds |
| 5.5 fibre product | `Γ₀(2) ∩ Γ₀(3)`; the twisted one | `3·4 = 12 = ψ(6)`; `24 ≠ 12` | holds |
| 5.8 bound | `X₀(11)`, `g = 1` | `p + 1 > 2√p` for `p ≥ 4`; places `⊆ {∞, 2, 3, 11}` | holds |
| 6.1 cyclic isogenies | `ℤ[i]` over `ℚ(i)`; `[2]` | `1 + i`, `2 + i` of degrees `2`, `5`; `4 = 2²·1` | holds |
| 6.2 class degree | `11.a`; `14.a`; `15.a` | `25`; `2·3² = 18`; `2⁴ = 16` | holds |
| 6.3 automorphism count | `y² = x³ − x` over `ℚ(i)` | `(x, y) ↦ (−x, iy)` swaps `x = ±1`: `3` against `2` | holds |
| 6.4 cusps of `X₁(N)` (script) | `N = 14, 15, 16, 18` | `(12, 6)`, `(16, 4)`, `(14, 6)`, `(16, 6)` cusps and rational cusps | holds |
| 6.4 `X₁(16)` substitution (exact, 76 rational `U`) | Reichert (v) | disc `= U(U + 2)(U⁴ + 6U³ + 12U² + 12U + 4)`; `4·disc/U⁶ = u(u² + 1)(1 + 2u − u²)` | holds |
| 6.4 `X₁(18)` substitution | Reichert (vii) | disc `= U⁶ h(−1/U)` | holds |
| 6.4 genus-two point lists | `u = 0, ±1`; `x = 0, −1` | `0, 4, 4`; `1, 1`; six points each | holds |
| 6.4 genus-one models | `[1,0,1,−1,0]`, `[1,1,1,0,0]`, `[1,0,0,−4,−1]`, `[0,0,1,0,−7]` | `Δ = −28, −15, 3969, −19683`; listed points lie on the curves; `x³ − 4x − 1`: 2-torsion from `(4x + 1)(x² − 4)`, eight points | holds |
| 6.4 `X₀(27)` | `(3, 4)` | `(12, 36)`, `64·(−7) + 16 = −432` | holds |
| 6.4 Fricke's functions | `N = 21` | `σ(i/√21) = 0` | **gloss false (R01)** |
| 6.4 `N = 25` | `{±1, ±7} ≤ (ℤ/25)ˣ` | `7² = −1`, index `5`; 14 cusps, 5 rational (script); four characters of order 5 | holds |
| 6.5 trees and class sizes | products of trees | degrees `6, 10, 14, 15, 21, 18, 12` in Kenku's set; `20, 22, 24, 26, 28, 30, 33, 35, 36, 45, 48, 50, 54` not; six cyclic subgroups of order 4 | holds |
| 7.3 Mitchell, `ℓ = 5` | `|Sp₄(𝔽₅)| = 9360000` | orders `28800, 31200, 960, 1440`; indices `325, 300, 9750, 6500` | holds |
| `mazur_torsion` | `ℤ/16`, `(ℤ/2)³`, `ZMod 1` | orders in the list, groups not; trivial group covered | holds |
| `mem_commutator_iff` | `GL₂(𝔽₂) ≅ S₃` | `x³ = 1` exactly for the identity and the two 3-cycles | holds |

**Source sample.** Seeded targets and every locator added since the previous head.

| Target | Opened | Result |
|---|---|---|
| 0.3 | ModularCurvesPartII §3.8 (its l.1111); ArithmeticGaloisRepresentations §§4.2–4.4 (l.3171, 3207, 3264, `GL2Subgroup.dickson_projectiveImage` l.3289) | agrees |
| 1.2, 1.4 | NoncongruenceModularForms §§2.1–2.3, 2.5 (main l.563, 609, 639, 691; formula l.644; `cuspCount_eq_card_cuspOrbits` l.600); ModularForms §10A (l.1150, 1161) | agrees |
| 2.2 | dokchitser2012 corroborated by the enumeration above; Serre, *Abelian ℓ-adic representations* not readable | holds |
| 2.6 | no external source; computed above | holds |
| 2.8 | FiniteGroupInvariants 7.1, 7.3 (its l.1175, 1214–1221); Tau Ceti `AlmostConjugate` | agrees |
| 4.3, 4.4 | serre1972 Théorème 2, p. 294 (line 1414); Théorème 3, p. 299 (line 1618, citing p. IV-19 at line 1622) | agrees |
| 5.1 | ModularCurvesPartII §§5.10–5.12 (l.1836, 1853, 1872), 6.1, 6.3, 8.3 | agrees |
| 5.2 | ModularCurvesPartII §9.7 (l.2728) | agrees |
| 5.4 | belov2019: Lemma 2.1 p. 5 (line 205), Proposition 3.2 and Lemma 3.3 p. 8 (lines 308, 316), Theorem 4.3 p. 12 (line 497), Theorem 5.1 p. 14 (line 645), Corollary 5.3 and Lemma 5.6 p. 15 (lines 661, 693), Propositions 5.7 p. 16 and 5.8 p. 17 (lines 722, 752) | agree |
| 5.6 | FiniteGroupInvariants 7.1; Prasad–Rajan not readable | see below |
| 6.1, 6.2 | FaltingsFinitenessAndIsogenyTheorems R28.6.1, R28.6.5 (its l.2654, 29) | agrees |
| 6.3 | rszb2022 Remark 2.3.2 (lines 345–350) | agrees |
| 6.4 | mazur1977 Theorem (8), p. 35 (lines 112–117, Kubert at 106); reichert1986 Theorem 1, p. 638 (lines 55–64), cases 14–18 on pp. 642–645 (lines 203–321), `E(b, c)` (line 70); ligozat1975 Lemme 4.1.1 and Corollaire, p. 42 (lines 1285–1289), (4.2.5) p. 44, (4.2.6) p. 45 with rows `21: (1, 0, 0, −4, −1)`, `27: (0, 1, 0, 0, −7)` | agree, except R01 |
| 2.5 | zywina2022 §1.4 (lines 129–135), Proposition 8.1 (lines 2029–2031) | agrees |
| 7.3 | dieulefait2002 §2.1, p. 4 (lines 73–85), §3.5 (lines 330–336) | agrees |

**Pinned declarations opened this round.** Tau Ceti (16): `tateNormalForm` (`AlgebraicGeometry/EllipticCurve/TateNormalForm.lean:104`), `existsUnique_variableChange_tateNormalForm` (:276), `exists_variableChange_tateNormalForm_iff` (:285), `existsUnique_tateNormalForm` (`…/Scheme/TateNormalForm.lean:116`), `Subgroup.AlmostConjugate` (`GroupTheory/AlmostConjugate.lean:92`), `IsConnected.eulerChar_le_two` and `two_sub_two_mul_genus` (`Combinatorics/PermutationTriple/EulerCharacteristic.lean:149, 208`), `genus_blockQuotient_le` (`…/BlockQuotient.lean:570`), `natCard_GL_fin_two` (`…/GeneralLinearGroup/Card.lean:45`), `map_intCast_zmod_surjective` (`…/SpecialLinearGroup/Basic.lean:532`), `Divisor.conorm` and `degree_conorm` (`…/Divisor/Conorm.lean:136, 360`), `nonempty_linearEquiv_tateModule` and `finrank_tateModule` (`…/TateModule/Basic.lean:73, 94`), `det_tateModuleGaloisRepresentation` (`…/TateModule/Determinant.lean:52`), `Gamma0_prime_power_index` (`…/CongruenceSubgroups/Basic.lean:763`). The Mathlib declarations are unchanged from the previous review's list at the same pin.

**Cross-roadmap citations resolved** (main at 2bbd3cb, open roadmaps at their heads):
- ModularCurves 5A (main l.2143–2170: the universal Tate normal form, `Y₁(N)`, `[Γ₁(N)]` for `N ≥ 4`), 8D (l.2793).
- ModularForms §0.2 (l.395), §4.1, §8.2, §10A, §10C. AlgebraicCurves 12C (l.1610).
- ModularCurvesPartII §§3.8–3.12, 5.8–5.17 (5.17 at l.2021), 6.1, 6.3, 8.3, 9.5–9.7, 16.2–16.3.
- CanonicalModelsAndGonality §§1.6, 2.1 (l.627, “complete” defined there), 2.5, 7.2, 7.3, 7.6 (l.1672–1685 leaves the `j`-map behaviour here), 9.1; its ownership lines l.142–151.
- AlgebraicModularFormsAndSerreWeights §§4.1–4.3 (l.959–1007), 7.6 (l.1656). ClassicalSerreModularity Layer R27.6 (l.1163–1167, `R27.6/full-classical-serre-theorem`). ArithmeticGaloisRepresentations §3.3 (`primeToPConductor`, l.2903), §§6.1, 6.4, 7.3, 7.5.
- EffectiveDiophantineMethods §§3.10, 3.11, 3.20, 3.23, 3.26–3.28. ArithmeticDynamics l.263 and l.267: the two gap sentences name the same curves and the same six points.
- EllipticCurveModularityPartII §§5.0a, 5.0b, 6.0b, 6.0d, 6.0e (trivial character only, so the gap is needed), 6.0f; `HasCyclicIsogeny`, `prime_isogeny_degrees`, `noncm_prime_isogeny_degrees`, `cyclic_isogeny_degrees` in its Lean file.
- NoncommutativeAndEquivariantIwasawa §4.0; EllipticCurveModularityImaginaryQuadratic §5.1; EisensteinIdealAndRationalTorsion §8.8.

**Ownership against open pull requests.** Searched by object: Mazur's torsion theorem, explicit models of `X₁(N)` and `X₀(N)`, the curves `y² + y = x³ − 7` and `y² + xy = x³ − 4x − 1`, isogeny class sizes. No other roadmap states Mazur's torsion theorem or any of the six model identifications. The four declared gaps are each one precise sentence, and no earlier roadmap provides them; the two point lists are shared with ArithmeticDynamics under the same slugs. AbelianVarietiesOverFiniteFields uses the prose name `isogenyClassSize` for a different object, with no Lean declaration.

## Not verifiable

- Prasad–Rajan 2003, Cor. 4 (5.6): the sources service finds only a paywalled page. The route in 5.6 through the `ℚ[G]`-module isomorphism does not depend on its wording.
- Serre, *Abelian ℓ-adic representations*, IV-19 and IV-23 Lemma 3: a book, not legally reachable.
- Mitchell 1914 and Bray–Holt–Roney-Dougal 2013, Table 8.12: not fetched. The list in 7.3 was compared with dieulefait2002 §2.1 only; its orders at `ℓ = 5` are computed above.
- Fricke 1922 (the construction of `τ`, `σ` and the `j`-expressions): not read; see R01.
- Not fetched: Kenku 1982, Mazur 1978, Lang–Trotter 1976, Zywina 2010 and 2015, Chen 1998, de Smit–Edixhoven 2000, Baran 2014, Balakrishnan–Dogra–Müller–Tuitman–Vonk 2019, Banwait–Cremona 2014, Clark–Cook–Stankewicz 2013, Abramovich 1996, Khare–Wintenberger 2009, Serre 1987, Sutherland 2016 and 2021, Jones 2010, the Experiment. Math. Lemma 2.11. `kubert1976` is waived.
- LMFDB data (curve labels and torsion of worked examples 5–9, knowl wording) were not checked against the database.
- ligozat1975 line 1264 (the `q`-expansions at `N = 27`) is garbled in the extraction and was not used.

## Source issues

- none
