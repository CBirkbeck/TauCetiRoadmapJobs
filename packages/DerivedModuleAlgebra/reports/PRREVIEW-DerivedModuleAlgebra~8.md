# Review of DerivedModuleAlgebra (pull request #1701 at dca07d9)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean` at `dca07d958004`, against the pins of `lake-manifest.json`.

- The gate passes and the dependency check reports no problem.
- `Suggested.lean` elaborates with 22 `sorry` warnings and no other message.
- The three new headlines (`quasiIso_whiskering_of_projective`, `exteriorPower_decalage`, `symmetricPower_decalage`) are true as stated. Each one's hypotheses are needed, as the instances in the adversarial table show.
- All 15 sampled targets were checked against the texts. One locator is wrong (R02).

There are four findings, all P3; none is blocking:
- R01: a dropped name that main's PerfectoidSpaces still cites has no entry in the mapping table.
- R02: a page locator in §0.9 is off by one.
- R03: §0.DP.3 does not follow the house style, and Layer 2's dependency list is missing an input.
- R04: the pull-request description is still out of date (the previous review's R06).

The previous review's R01–R05 are repaired; its R06 is not (R04 below).

## R01 (P3) — The old → new name table misses `ModuleTower.Product`, which PerfectoidSpaces on main cites

**Location.** `README.md:62`: “`CompactCoefficients.Tower.lim`, …, `ModuleTower.lim`, `ModuleTower.limOne`, `ModuleTower.shift` | Tau Ceti `TauCeti.ModuleTower.lim`, `TauCeti.ModuleTower.limOne` and the difference map `TauCeti.ModuleTower.shift`”.

**Claim.** Every name of this roadmap that another roadmap cites resolves through the table (README:38–39).

**Witness.** Main's `TauCetiRoadmap/PerfectoidSpaces/Suggested.lean:35–37` uses “DerivedModuleAlgebra §1.T.1's ordinary towers … `ModuleTower.Product`, `ModuleTower.shift`, `ModuleTower.lim`, `ModuleTower.limOne`, `ModuleTower.limMap` and `ModuleTower.limOneMap`”. `ModuleTower.Product` occurs nowhere in the head's README or Lean file.

**Repair.**
- Add `ModuleTower.Product`, `ModuleTower.limMap` and `ModuleTower.limOneMap` to the left column of row 62.
- Add `TauCeti.ModuleTower.Product`, `TauCeti.ModuleTower.limMap` and `TauCeti.ModuleTower.limOneMap` to its right column. These are, at the pin, `TauCeti/Algebra/Category/ModuleCat/Tower/Basic.lean:89` (the product `∏ F_n` on which the difference map acts), `:462` and `:516`.
- Name `TauCeti.ModuleTower.Product` in the module-tower supplier row as well (README:111).

**Test.** I scanned the 143 backticked qualified names, with prefixes `Algebra.CotangentComplex.`, `CompactCoefficients.`, `DerivedDeRham.`, `PD.`, `PerfectComplex.`, `DoubleComplex.`, `ModuleTower.` and `Matlis.`, that other roadmaps cite, on main and at the open heads. Each name that main's DerivedModuleAlgebra declares then resolves in the head README. The only miss today is `ModuleTower.Product`. `ModuleTower.limMap` and `.limOneMap` are found only as substrings of the supplier row, so they are worth listing explicitly as well.

## R02 (P3) — §0.9 gives the wrong pages for GR, Proposition 8.1.7

**Location.** `README.md:1423`: “[GR], Proposition 8.1.7 and its proof, pp.220–221”.

**Claim.** The locator points at the proposition and its proof.

**Witness.** GR line 10619 states Proposition 8.1.7 at the foot of p.219; page 220 starts at line 10620. Its proof ends at GR line 10659, still on p.220. Page 221 (from GR line 10664) carries only the proof of Theorem 8.1.8.

**Repair.** “[GR], Proposition 8.1.7 and its proof, pp.219–220”.

**Test.** §0.9 takes three things from this proof, all at GR lines 10633–10639 on p.220:
- `R• = S• ×_S R`;
- the quasi-isomorphism `L_(S/R) ≃ L^Δ`, cited there to Illusie II.1.2.6.2 (GR line 10637);
- the spectral sequence `E¹_(i,j) = H_j(L_(S_i/R_i)) ⇒ H_(i+j)(L^Δ)` (GR line 10639).

The page numbers are those of the arXiv v3 text, which the README links and whose printed numbers match its PDF pages (GR line 10572).

## R03 (P3) — §0.DP.3 is written as field lists with bare Lean names, and Layer 2's dependencies omit the new symmetric-power input

**Location.**
- `README.md:373`: “*Hypotheses.* R is a commutative ring; M is an R-module.” The same label appears at :429, 467, 497, 521, 551, 578, 600 and 628.
- `README.md:378–379`: “ε equals DividedPowerAlgebra.lift of dividedPowersBot R along the zero linear map M→R.”
- `README.md:1764`: “Layers 0–1 and Mathlib differentials, algebra extensions and derived categories.”

**Claim.** The README follows the house shape, and every layer lists its dependencies.

**Witness.**
- The house rules exclude `Hypotheses:`-style field lists. They also require library declarations in backticks and formulas in code spans.
- §0.DP.3's API bullets and proof sketches name `DividedPowerAlgebra.lift`, `dividedPowersBot`, `RingHom.ker`, `DividedPowerAlgebra.induction_on` and `LinearEquiv.ofLinearMap` without backticks. They write `ε:Γ_R(M)→R` and `dp(n,m)` as plain text.
- The new headline `symmetricPower_decalage` uses Tau Ceti `ModuleCat.symmetricPower.functor`, which no layer's Dependencies list names.
- The §0.DP.3 text is unchanged from main. It is raised now because this is a full review of the folder.

**Repair.**
1. Fold each *Hypotheses.* sentence into the opening sentence of its target. For example: “For a commutative ring `R` and an `R`-module `M`, with no freeness, finite-generation, characteristic, factorial-invertibility or nilpotence hypothesis, construct …”.
2. Put every Lean name in §0.DP.3's prose and API bullets in backticks, and put formulas such as `ε : Γ_R(M) → R`, `dp(n, m)` and `ε(3 + dp(2, m)) = 3` in code spans.
3. Add “Tau Ceti `ModuleCat.symmetricPower.functor`” to Layer 2's `### Dependencies`.

**Test.** After the edit, `grep -n '^\*Hypotheses' README.md` returns nothing. Every name in the §0.DP.3 *Needs* lines then also appears backticked in the surrounding prose.

## R04 (P3) — The pull-request description still says the change is README only

This is the previous review's R06. The head does not repair it.

**Location.** The pull-request description (data): “README only; `Suggested.lean` is unchanged”, and the summary block's “Roby representability (`PD.robyRepresentability`)”.

**Claim.** The description matches the change.

**Witness.**
- `git diff --stat origin/main...HEAD` shows `Suggested.lean | 1570 ++++-------`.
- The head's file declares 22 theorems and 10 definitions in place of main's declarations.
- `robyRepresentability` occurs zero times in main's and the head's README and `Suggested.lean`.

**Repair.**
- Delete “README only; `Suggested.lean` is unchanged”.
- Say in one sentence that the head replaces main's `Suggested.lean` by the headline theorems, and that the old names resolve through the table at README:38–76.
- Replace `PD.robyRepresentability` by `DividedPowerAlgebra.homogeneousLawEquiv`.

**Test.** Re-read the description against `git diff --stat origin/main...HEAD`. Then check that the replacement name exists at the pin (`TauCeti/RingTheory/DividedPowerAlgebra`, cited at README:266).

## Previous findings

- **R01 (P2), décalage and the resolution independence of §0.3: repaired.**
  - `Suggested.lean:152–166` states `quasiIso_whiskering_of_projective`. It is more general than the requested form: `[Ring R]`, `[Ring R']` and independent universes.
  - `Suggested.lean:174–209` states `exteriorPower_decalage` and also `symmetricPower_decalage`.
  - The docstring bullet is narrowed (`Suggested.lean:59–66`).
  - README:1121, 1624 and 1628 name the three theorems.
- **R02 (P3), the §1.3 Check: repaired.** README:1998–2001 now uses `ℤ[−1]` and explains why `ℤ[1]` is no witness.
- **R03 (P3), uncited pinned results: repaired.**
  - §0.2.2 (README:1020–1025, 1048–1049) and row 118 cite `SSet.shuffle` and `SSet.eilenbergZilberHomotopyEquiv`.
  - §0.3 (README:1114–1118) and row 119 cite `Homotopy.whiskerRight` and `Homotopy.toChainHomotopy`.
  - §§1.M.1–1.M.2 (README:2495–2507, 2543–2546, 2560–2562) and row 123 cite the Matlis declarations.
  - §1.E.0 (README:2292–2296, 2308–2310, 2422–2424) and row 124 cite `IsPseudoCoherentOver`.
- **R04 (P3), missing table rows: repaired.** Rows 56, 57 and 62 add `smooth`, `regularQuotient` and `Tower.lim/.limOne/.shift`. The further gap `ModuleTower.Product` is new (R01 above).
- **R05 (P3), broken sentences: repaired.** README:1273–1275, 1374–1376, 1711, 2147–2155 and 1073–1075 now read as complete sentences.
- **R06 (P3), description: not repaired** (R04 above).

## Verified sound

**Gate, dependencies, worktree.**
- The worktree is at `dca07d958004a18d069e62d48f667303fba138fb`, unchanged.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The gate prints every counter as 0 and ends in `OK`; the worker's build counter is also 0.
- Dependency check output, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2364 edges, 0 problem(s)
```

- The only roadmap supplier is AlgebraicTopology (Stage 6, item 0), on main at README:954. No supplier gap is declared.

**Elaboration, binders, probe.**
- `lake env lean` on `Suggested.lean` gives exactly 22 “declaration uses `sorry`” warnings.
- One scratch file with `#check @` for all 32 declarations, plus six cited library names, elaborates. I compared each type with its README statement and found no lost binder and no generality mismatch. The three new theorems elaborate as `[Ring R] (R' : Type u_2) [Ring R']`, and as `(N : ModuleCat R) [Module.Flat R ↑N]` with conclusions about `HomologicalComplex.homology K n`.
- In a scratch copy I replaced every `sorry` by `first | rfl | infer_instance | simp | trivial | decide | aesop`. All 22 bodies fail, so no theorem is padding.
- Searches at the pins find no décalage, no quasi-isomorphism invariance of levelwise functors, and no Eilenberg–Zilber theorem for arbitrary simplicial modules.

**Library declarations opened at the pins (26).**
- Mathlib:
  - `ModuleCat.exteriorPower` (`Algebra/Category/ModuleCat/ExteriorPower.lean:30`, `↧(⋀[R]^n M)`, which kills `x ∧ x`) and `.functor` (:105).
  - `AlgebraicTopology.DoldKan.Γ₀` (`DoldKan/FunctorGamma.lean:321`).
  - `SimplicialObject.Homotopy` (`SimplicialObject/Homotopy.lean:51`) and `.whiskerRight` (:102), for any functor, no additivity.
  - `.toChainHomotopy` (`SimplicialObject/ChainHomotopy.lean:157`).
- Tau Ceti, simplicial and powers:
  - `ModuleCat.symmetricPower` (`ModuleCat/SymmetricPower/Basic.lean:41`, the degree-`n` piece of the symmetric algebra) and `.functor` (:103).
  - `DividedPowerAlgebra.homogeneousSubmodule` (`DividedPowerAlgebra/Homogeneous.lean:51`).
  - `SSet.shuffle` (`SimplicialSet/Shuffle.lean:689`). Its lattice-path sign `(−1)^N` gives `+(s₁x, s₀y) − (s₀x, s₁y)` in bidegree (1,1), as at `Suggested.lean:134–135`.
  - `SSet.eilenbergZilberHomotopyEquiv` (`SimplicialSet/EilenbergZilber.lean:761`, with `hom` = Alexander–Whitney and `inv` = shuffle).
  - Tau Ceti `SimplicialObject/ChainHomotopy.lean` (`toChainHomotopy_hom_comm`), which gives no quasi-isomorphism result.
- Tau Ceti, Matlis and pseudo-coherence:
  - `injective_applyₗ_of_injective` (`MatlisDuality/FiniteLength.lean:102`; it needs `Module.Injective R E`, an injective `ι` and `Small R`), `residueFieldLinearMapEquiv` (:57), `IsInjectiveEnvelope.length_linearMap` (:139) and `bijective_applyₗ` (:155).
  - `isArtinian_of_finite_adicCompletion_linearMap` (`Artinian.lean:100`) and `exists_isInjectiveEnvelope_submodule` (`Envelope/Existence.lean:59`).
  - `Huber.IsPseudoCoherentOver` (`PseudoCoherent/Basic.lean:89`, exact up to `m`, with `⊤` the infinite resolution), `.of_isNoetherianRing` (:391) and `.exists_quasiIso_single₀` (`PseudoCoherent/ChainComplex.lean:41`, `M` and `R` in one universe).
- Tau Ceti, towers and cocones:
  - `ModuleTower.Product`, `shift`, `lim`, `limOne`, `productMap`, `limMap` and `limOneMap` (`Tower/Basic.lean:89, 160, 170, 174, 393, 462, 516`).
  - `mappingCocone.mapOfHomotopy`, `_comp` and `Homotopy` (`MappingCocone/Homotopy.lean:47, 86, 93`).

**Cross-roadmap citations, AffineCrystalline and ownership.**
- AlgebraicTopology Stage 6 item 0 resolves on main (README:954).
- DerivedDeRhamCohomology (#868) consumes §§0.3 and 0.17 (its README:506, 3539, 3557) and owns neither. Its “décalage” and that of CrystallineCohomology and AInfCohomology is the operator `Lη`, a different object.
- `roadmaps grep` finds no other owner of Matlis biduality, of Eilenberg–Zilber for simplicial modules, or of non-additive derived functors. AlgebraicModuliForArithmeticGeometry's `dvrTorsionCofiniteCriterion` is a DVR lemma, not the duality.
- No other `Suggested.lean` uses the namespace `TauCetiRoadmap.DerivedModuleAlgebra`.
- `overlaps.md` reports no pull request changing this roadmap. The §1.T.1 ids it lists are mapped at README:34–36.
- AffineCrystalline (GitHub, read-only):
  - The eight `FreeConstruction` names exist in `Envelope/FreeConstruction/DPAlgebraAugmentation.lean`, with `R` and `M` in one universe and `augmentation` built by `lift'`, as README:366–371 says. `positiveIdeal_eq_augmentation_ker` has its sides in the stated order.
  - `RawBi.augRowι_quasiIso` (from `ColumnsExact`) and `augColι_quasiIso` (from `RowsExact`) are in `Homology/TotM.lean`.
  - `RawBi.totMap_quasiIso` (columnwise `ColSurj`/`ColInj`) is in `Homology/TotQuasiIso.lean`.

**Seeded sample (15 targets, plus the new headlines).** No locator is flagged as unverified in the README. Sources outside the manifest were fetched through the sources service against a scratch copy of the manifest, so the roadmap's `sources.toml` is unedited:
- StacksAlg, StacksDefos and StacksSimp from stacks.math.columbia.edu;
- GR, Prisms and BL22 from arXiv;
- SAG from the author's IAS page.

| Target | Lines read | Result |
| --- | --- | --- |
| 0.1 | StacksCt 81 (3.1, 08PM, p.2), 144, 169, 193 (4.1–4.3, 08PS–08PU, pp.4–5), 360–367 (5.5, 08QI, p.9), 382, 395 (5.6–5.7, 08QJ, 08QK, pp.9–10) | Exact. Remark 5.5 assumes surjective `P_n → B`, which a quasi-isomorphism forces through `H₀` |
| 0.2 | StacksMA 6709 (60.1, p.144), 6725 (60.5), 6741 (60.7, p.145), 6753 (60.8), 6781 (60.10, p.146), 6824 (60.12, p.147), 6846 (60.13) | Exact |
| 0.2.1 | StacksAlg 8891 (10.81.2, 058E, p.190), 8918 (10.81.4, 058G, p.191: directed systems of finite free modules) | Exact |
| 0.4 | StacksCt 89 (3.2, 08PN, p.3), 108 (3.4, 08S9), 193–228 (4.3–4.7, 08PU, 08QE–08QH, pp.5–6), 360 (5.5); BL22 9999–10013 (B.1–B.2, p.225) | Exact |
| 0.8 | StacksCt 704–707 (7.4, 08QX, p.16) | Exact |
| 0.9 | GR 10619–10659 (8.1.7 and proof, pp.219–220), 10637 (Illusie II.1.2.6.2); BMS19 552 (§2 from p.212; §3 at 747, p.217) | Page off by one (R02) |
| 0.11 | StacksCt 108 (3.4, p.3), 779 (8.1, 08QZ, p.17), 827 (8.6, 08SF, p.19) | Exact |
| 0.13 | StacksCt 1290–1292 (14.2, 08SJ, p.29, “Koszul-regular … for example a regular sequence”), 1303–1312 (14.4, 08SL, two-term complex in the proof) | Exact |
| 0.15 | SAG 62262 (25.2.2.1, p.1699), 62365 (25.2.3.1, p.1702), 62412–62414 (25.2.3.4(1), p.1703); DoldPuppe 994–1022 (4.10, pp.229–230) | Exact |
| 0.16 | SAG 62308 (25.2.2.3, p.1700), 62327 (25.2.2.4, p.1701), 62419 (25.2.3.4(3)); DoldPuppe 1023–1035 (4.13, (4.14), p.230) | Exact |
| 0.25 | StacksCt 1408–1414 (16.1, 08SP, p.31), 1676 (21.1, 08UZ, p.37); StacksAlg 11014–11019 (10.99.8, 051C, pp.233–234); StacksDefos 56, 127, 161, 177 (2.1–2.4, pp.2–4) | Exact |
| 1.1 | StacksMA 10946 (89.1, p.238), 10971 (89.3), 10983 (89.4, p.239), 11108 (89.10, p.241), 11124, 11133 (89.11–12, p.242) | Exact |
| 1.2 | StacksMA 12005 (93.1, p.261), 12049 (93.2, p.262), 12061 (93.3), 12101 (93.4, p.263), 12115 (93.5) | Exact |
| 1.3 | StacksMA 12163 (93.10, p.264, Čech-complex formula), 12293 (93.18, 0920, p.267), 12344 (93.20, 0G1U, p.268), 12374 (93.21, 0AAJ) | Exact |
| 1.7 | Prisms 406–416 (§1.2, p.11, finitely generated `I`); BMS19 850 (4.1, p.220), 872 (4.4), 888 (4.5, p.221), 895 (4.6), 908 (4.7, pp.221–222), 958 (4.8, p.223) | Exact |
| new 0.3 | DoldPuppe 301–305 (Satz 1.15, p.209), 852–857 (Satz 3.31, p.225), 941–967 (4.4–4.7, p.228) | Exact |
| new 0.17 | SAG 62450–62453 (25.2.4.2, p.1704), 62412–62420 (25.2.3.4, p.1703) | Exact |
| new 1.E.0 | StacksMA 7500–7509 (66.4(4), 064T, p.162), 7746–7751 (66.17(3), 066E, p.167) | Exact |

**Adversarial table.** Every row below was computed in this review.

| Statement | Instances | Values on each side; wrong model excluded | Result |
| --- | --- | --- | --- |
| `quasiIso_whiskering_of_projective` | `f = id`; `F` constant `R′`; `Γ₀([ℤ →2 ℤ]) → ℤ/2` constant, `F = (−)⊗²` | `F(id) = id`; constant `F` gives `id`; source `H₁ = Tor₁(ℤ/2, ℤ/2) = ℤ/2` against target `H₁ = 0`, so a non-projective target breaks it | True; projectivity needed |
| `exteriorPower_decalage` | `N = R`, `n = 0,1,2,3`; `N = R²`, `n = 2`; `N = 0`; `F₂`, `n = 2`; `N = ℤ/2` over `ℤ` | `R` in degree 0 (`Γ⁰`); `N` in degree 1; normalized `∧²X` is the cross effect `R⊗R` in degree 2 only, `H₂ = R·γ₂`; `R⊗R⊗R` in degree 3 is `Γ³R`; for `R²`, `R⁴ → ∧²R² = R` is onto with kernel of rank 3, the rank of `Γ²(R²)`; `0`; `γ₂(1) ≠ 0` although `∧²F₂ = 0`; `H₂ = F₂` against `Γ²_ℤ(ℤ/2) = ℤ/4` | True for flat `N`; flatness needed |
| `symmetricPower_decalage` | `N = R`, `n = 0,1,2,3`; `N = R²`, `n = 2` | `R`; `N` in degree 1; bar faces `d₀(a,b) = b`, `d₁ = a+b`, `d₂ = a` give `e₁e₂ ↦ −e²`, a unit, so acyclic, matching `∧²R = 0`; ranks `1, 2, 1` with Euler characteristic `0 = rank ∧³R`; `R⁴ → Sym²R² = R³` onto with kernel `R = ∧²R²` | True |
| `simplicialTensorComparison` (1,1) | `x ∈ X₁`, `y ∈ Y₁` | `d(s₁x⊗s₀y − s₀x⊗s₁y) = s₀dx⊗y − x⊗s₀dy = ∇(dx⊗y − x⊗dy)`; the opposite sign is not a chain map; agrees with `SSet.shuffle` | True |
| `bisimplicialDiagonalComparison` | constant `P`; `Z = X⊠Y`, `X = Y = Γ₀(A[1])` | `P` in degree 0 on both sides; `A` in degree 2 on both sides | True |
| `nonempty_bicomplexSecondPageIso` | one column `C` at `p = 0`; `p = 1` | `H₀(C)` at `(0,0)` on both sides; zero at `(−k−2, 1)` on both sides | True |
| `derivedLimit_isTriangulated` | `ℤ` with `×p`; `A_n = ⊕_(m≥n) k → V → k^n` | `H⁰ = 0`, `H¹ = ℤ_p/ℤ`; derived boundary `∏k → ∏k/⊕k = lim¹A ≠ 0`, although each level is zero | True |
| `derivedCompleteness` | `I = 0`; `I = A`; `ℤ_p`, `ℚ_p` at `(p)`; `ℤ⟦−1⟧` at `I = ℤ` | `A[1/0] = 0`; `f = 1` forces `H^(−n)M = 0`; `Hom(ℤ[1/p], ℤ_p) = 0 = lim¹(ℤ_p, ×p)`, and `ℤ[1/p] ⊂ ℚ_p` is nonzero; the `n = 0` test admits `ℤ⟦−1⟧` (`Ext^(−1) = 0`), while `f = 1`, `n = −1` gives `End ℤ ≠ 0` | Correct; `n = 0` model excluded |
| `isDerivedCompleteGenerators` / `Radical` / `Cohomology` / `_triangle` | `I = (2,3) = ℤ`; `(p²)` against `(p)`; `ℤ_p ⊕ ℚ_p⟦−1⟧`; `ℤ_p →p ℤ_p → F_p` | 2- and 3-complete forces `M = 0`; `ℤ_2` is not 3-complete; same complete objects; `H¹ = ℚ_p` is incomplete on both sides; `F_p` complete (`lim¹` of a zero tower is `0`) | True |
| `derivedCompleteness_isRightAdjoint` | `I = 0`, `A`, `(p)` | left adjoints `id`, `0`, `ℤ ↦ ℤ_p` with `ℤ[1/p] ↦ 0` | True |
| `IsCompletelyFlatModule` | `ℤ`, `F_p`, `ℤ_p` at `(p)` | yes; `Tor₁ = F_p`, so no; yes | Correct |
| `isAdicComplete_of_isCompletelyFlatModule` | `A = M = ℤ/4`, `p = 2`; `A = ℚ` | `c = 2`; `M/2M = ℤ/2` flat; `1⊗2 ↦ 2`, injective onto `{0,2} = M[2]`; `n = 2` gives the identity onto `M[4] = M`; `span{2} = ⊤` forces `M = 0` | True |
| `isCompletelyFlatModule_of_isAdicComplete` | `ℤ/2` over `ℤ/4` | `hflat` fails at `n = 2`, and `Tor₁^(ℤ/4)(ℤ/2, ℤ/2) = ℤ/2` | Hypothesis needed |
| `IsPerfect`, `IsPseudoCoherent`, `IsFiniteFreeModel`, the four closure laws | `eA` over `k×k`; `[ℤ →2 ℤ]`; `ℚ` over `ℤ` | `eA` perfect, but Euler ranks `(1,0)` rule out a bounded free model, and the `e, 1−e` resolution is pseudo-coherent; finite free model with `b = 0`; `ℚ`'s top cohomology is not finitely generated, so no model | Correct |
| `IsRingTowerLimit`, `ringTowerLimit_jacobson` | `k[t]/tⁿ⁺¹`; `k[t]` with the same projections; `k[x_i]/(x_i²)` | `k[[t]]`, and `1+t` is a unit; `(Σ_(i≤n) tⁱ)` has no limit in `k[t]`; kernel locally nilpotent with `I^r ≠ 0`, and `c + nilpotent` is a unit | True; non-limit excluded |
| `pseudoCoherent_residueCriterion` | `[k[[t]] →t k[[t]]]`; zero ring; `a > b` | fibre `[k →0 k]` in `[−1,0]`; no field quotient, so `E = 0`; all fibres `0`, so `P ≃ 0` by Nakayama at the top degree | True |
| Matlis biduality (both) | `ℤ_p`, `E = ℚ_p/ℤ_p`; `ℤ_(p)` | `D(ℤ_p) = E` Artinian, and `ℤ_p → End E = ℤ_p` is bijective; `D(E) = ℤ_p`; over `ℤ_(p)`, `D(E) = ℤ_p` is not finite | True; completeness needed |
| 0.1 | `A[t] → A[t]/(t²)` constant | `H₀ = A[t] ≠ B` | Not a resolution, as the Check says |
| 0.2 | `F_p ⊗^L F_p`; `(ℤ/4, ×2)` two-sided | `H⁰ = H^(−1) = F_p`; termwise `F₂` in every degree against derived `0` | True |
| 0.2.1 | `ℚ` over `ℤ`; `ℤ/2` | transition `×e/d` and cocone `a ↦ a/d` are compatible; `×2` is injective on `ℤ` but zero on `ℤ/2` | True |
| 0.4 | `k[ε]/ε²`, characteristic ≠ 2 and = 2; `ℤ → ℤ/2` | `[B →2ε B]`, `H^(−1) = (ε)`; zero differential with `H^(−1) = H⁰ = B`; `H^(−1) = (2)/(4)`, `H⁰ = 0` | True |
| 0.7 Check | `k[x,y]/(x,y)²` | `Rel/TrivRel` is spanned by `r₁ = ye₁ − xe₂`, `r₂ = ye₂ − xe₃`; `xr₁` and `yr₂` lie in `TrivRel`, `yr₁ ≡ −xr₂` does not (degree count), and it maps to `0` in `B³`; so `H^(−2) = k` | True |
| 0.8 | `ℤ → ℤ → ℤ/3` | `L_(ℤ/ℤ) = 0`; second map an isomorphism on `H^(−1) = ℤ/3` | True |
| 0.9 | constant `ℤ → ℤ/2`; `R• = S•` | `H₁(L^Δ) = ℤ/2`; `L^Δ = 0` | True |
| 0.11 | `ℤ[X] → ℤ[X^(±1)]`; union of `A[X₁…X_n]` | relative `0`, `dX` kept; `⊕ dX_i` | True |
| 0.13 | `(p) ⊂ ℤ`; `k[X]/(X²)` | `F_p[1]`; `X² ↦ 2X dX`, zero in characteristic 2 | True |
| 0.15 / 0.16 | `ℤe`; `F₂e`; `F_p e` | `Sym² = ℤe²`, `Γ² = ℤγ₂(e)`, `e·e = 2γ₂(e)`; over `F₂`, `e²` generates `Sym²` while `e·e = 0` in `Γ`; `e^p = p!γ_p(e) = 0`, `γ_p(e) ≠ 0` | True |
| 0.17 Check | `Γ²_ℤ(ℤ/2)` | `γ₁(1)² = 2γ₂(1) ≠ 0`, `4γ₂(1) = γ₂(2) = 0`, so `ℤ/4` | True |
| 0.25 | `ℤ/4 → F₂`, `c = 0`, `B′ = F₂[ε]` | kernel `F₂ε ≅ N`; `JB′ = 0`, `B′/JB′ ≠ B`; `Tor₁^(ℤ/4)(ℤ/2, B′) = B′ ≠ 0` | Canonical `c` needed |
| 1.1 | `[ℤ → ℤ/p^(n+1)]` | `H⁰ = p^(n+1)ℤ` is not Mittag-Leffler, and `H¹(Rlim) = lim¹ = ℤ_p/ℤ` | True |
| 1.3 Check | `ℤ[1]`, `f = 2` | `Ext¹(ℤ[1/2], ℤ) = ℤ_2/ℤ ≠ 0`, so the `n = 0` test already rejects it | Check correct |
| 1.7 | `ℤ`, `F_p` (Prisms definition) | `ℤ ⊗^L N` is discrete for `p`-torsion `N`; `F_p ⊗^L F_p` has `H^(−1)` | True |
| §0.DP.3 (R03) | `R = M = ℚ`; `F₂` | `ε(dp(2,1)) = 0` against the rational PD value `1/2`; the detector sends `dp(2,1) ↦ inr(1) ≠ 0`, so `dp(2,1)` is not in `(dp(1,a))` | True |

No restriction to good primes, flat inputs or finite residue fields is introduced. The computations cover:
- the zero ring, and the unit and zero ideals;
- characteristic 2;
- `n = 0, 1, 2, 3`;
- non-flat modules, non-projective simplicial targets, and non-complete DVRs.

## Not verifiable

- IllusieCC, Chapter II, 1.2.6.2 (§0.9). The Springer volume has no open copy, so it was not fetched. GR line 10637 confirms that GR uses it for exactly the quasi-isomorphism §0.9 states.
- Sources outside the sample were not opened this round: NSW, Roby, Chenevier, Nekovář, DM and Bhatt12.
- Ownership against open pull requests was checked with `roadmaps grep` over all 466 open heads, for the objects named above.

## Source issues

- **Error** in SAG at Construction 25.2.2.2, p.1700 (repeated in Proposition 25.2.3.4(2), p.1703): the source defines the exterior power as signed-permutation coinvariants of the tensor power and claims the usual free basis; it should use the quotient by all alternating relations including `x⊗x`, since for a free rank-one module over `ℤ` signed coinvariants give `ℤ/2`; affects a stated result.
- **Error** in StacksMA at the opening paragraph of §15.96, Tag 0BKH, printed p.275: the source says the derived completion of `A = ℤ_p ⊕ ℚ_p/ℤ_p` at `(p)` is `ℤ_p[1] ⊕ ℤ_p[0]`, computation omitted; it should say the splitting holds after restriction to `D(ℤ_p)`, since in `D(A)` every map from the completion to `ℤ_p[1]` vanishes; affects a stated result.
