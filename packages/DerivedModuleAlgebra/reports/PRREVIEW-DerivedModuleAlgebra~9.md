# Review of DerivedModuleAlgebra (pull request #1701 at 54b43a0)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean` at `54b43a05a58064be150a25cee0c02dba13f4c746`, against the pins of `lake-manifest.json`.

- The gate passes, and the dependency check reports no problem.
- `Suggested.lean` elaborates with 22 `sorry` warnings and nothing else.
- All 15 sampled targets match their sources at the stated locators.
- There are three findings, all P3; none is blocking:
  - R01: the §1.E.1 Checks index their towers inconsistently with the `A_0` used everywhere else, and one of them starts with the zero ring.
  - R02: the downstream-consumer list leaves out five roadmaps on main that consume §§0.K.1, S.1 and 1.M.2.
  - R03: the pull-request description is still out of date (previous R04).
- The previous review's R01–R03 are repaired; its R04 is not (R03 below).

## R01 (P3) — The §1.E.1 Checks index towers from 1, or start at the zero ring, while the statements use `A_0`

**Location.**
- `README.md:2463`: “for `A_n = k[t]/(t^n)` and `M_n = A_n` in degree zero, the limit is `k[[t]]` in degree zero”.
- `README.md:2465`: “for a field `k`, `n ≥ 1`, `A_n = k[t]/(t^n)`”.
- `README.md:2471`: “The tower `A₁ = B/I = k`, `A_n = B` for `n ≥ 2`”.

**Claim.** These towers satisfy the hypotheses of the effectivity theorem, and of `ringTowerLimit_jacobson`. Both are indexed from `0`: README:2410–2412 and 2454–2455 use `A_0` and `M_0`, `Suggested.lean:392–396` uses `A : ℕ → Type u` and `π 0`, and the §1.E.0 Checks use `k[t]/(t^(n+1))` (README:2359, 2400).

**Witness.** From `n = 0`, line 2463 gives `A_0 = 0`, and `1 ∈ ker(k → 0)` is not nilpotent. The conclusion of `ringTowerLimit_jacobson` would then make `t ∈ k[[t]]` a unit. Lines 2465 and 2471 have no `A_0`.

**Repair.**
- Line 2463: `A_n = k[t]/(t^(n+1))`.
- Line 2465: drop “`n ≥ 1`”, write `A_n = k[t]/(t^(n+1))`, and replace “`H^−1(M_n) = (t^(n−1)) ≅ k`” by “`H^−1(M_n) = (t^n) ≅ k`”.
- Line 2471: “The tower `A₀ = B/I = k`, `A_n = B` for `n ≥ 1`”.

**Test.** After the repair:
- every transition kernel is `(t^(n+1))/(t^(n+2))`, `I` or `0`, so each is nil;
- `π_0` is reduction to `k`, and the units of `k[[t]]` are exactly the series with nonzero constant term, as `ringTowerLimit_jacobson` says;
- in the `B` tower, `π_0(1 + x₁) = 1` and `(1 + x₁)(1 − x₁) = 1`;
- for `M_n = [A_n --t→ A_n]`, `H^−1 = ann(t) = (t^n) ≅ k` with zero transitions, and `H^−1` of the limit `[k[[t]] --t→ k[[t]]]` is still `0`.

## R02 (P3) — The downstream-consumer list misses five roadmaps on main, and the name table has an unbackticked cited name

**Location.**
- `README.md:2603`: “The downstream consumers are EnhancedDerivedSheaves, EtaleCohomologyFoundations, PadicPeriodRings, …, ArithmeticLocallySymmetricSpaces and KhovanovHomology.”
- `README.md:75`: “`PerfectComplex.IsPerfect`, isPerfect_baseChange”.

**Claim.** The section gives the complete list of consumers, and the table lists cited Lean names.

**Witness.** On main, §0.K.1 is consumed at `AdicEtaleGeometry/README.md:489` and `PurityOfBranchLocus/README.md:32`; §S.1 at `AdicSpacesPartIV/README.md:243` and in AdicSpacesPartIII (15 citations); §1.M.2 at `RepresentationTheory/ArtinAlgebras/README.md:61`. None is listed.

**Repair.**
- Add AdicEtaleGeometry and PurityOfBranchLocus (§0.K.1), AdicSpacesPartIII and AdicSpacesPartIV (§S.1), and RepresentationTheory (ArtinAlgebras, §1.M.2) to the list at README:2603–2607.
- Write `` `isPerfect_baseChange` `` in row 75.

**Test.** I grepped main for `DerivedModuleAlgebra`. Nine roadmaps mention it:
- the three that are already listed;
- the five above;
- SchemeAndStackFoundations, which only mentions this roadmap as downstream of itself (its README:144, 7385).

So the repaired list matches main.

## R03 (P3) — The pull-request description still says the change is README only

This is the previous review's R04, and before it R06. The head does not repair it.

**Location.** The pull-request description (data): “README only; `Suggested.lean` is unchanged”, and the summary block's “Roby representability (`PD.robyRepresentability`)”.

**Claim.** The description matches the change.

**Witness.** `git diff --stat origin/main...HEAD` on `Suggested.lean` reports “343 insertions(+), 1227 deletions(-)”. `robyRepresentability` occurs nowhere in main's or the head's README and `Suggested.lean`.

**Repair.**
- Delete “README only; `Suggested.lean` is unchanged”.
- Say that the head replaces main's `Suggested.lean` by the 22 headline theorems and their definitions, and that cited names resolve through the table at README:38–76.
- Replace `PD.robyRepresentability` by `DividedPowerAlgebra.homogeneousLawEquiv`, which is at the pin (README:266).

**Test.** Re-read the description against `git diff --stat origin/main...HEAD`.

## Previous findings (review of `dca07d9`)

- **R01 (P3), `ModuleTower.Product` missing from the name table: repaired.**
  - README:62 now lists “`ModuleTower.Product`, … `ModuleTower.productMap`, `ModuleTower.limMap`, `ModuleTower.limOneMap`”, resolving to the corresponding `TauCeti.ModuleTower.*` names.
  - README:111 names “the product `TauCeti.ModuleTower.Product` of its terms”.
- **R02 (P3), GR page: repaired.** README:1421 reads “[GR], Proposition 8.1.7 and its proof, pp.219–220”.
- **R03 (P3), §0.DP.3 house style and Layer 2 dependencies: repaired.**
  - `grep '^\*Hypotheses'` returns nothing.
  - The §0.DP.3 targets open with “For a commutative ring `R` and an `R`-module `M`, with no freeness, …” (README:358, 415, 457, 486, 512, 542).
  - Lean names and formulas are in code spans (README:376–413).
  - README:1763–1767 adds “Tau Ceti symmetric powers (`ModuleCat.symmetricPower.functor`)”.
- **R04 (P3), description: not repaired** (R03 above).

## Verified sound

### Gate, dependencies, worktree

- The worktree is at `54b43a05`, unchanged.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
- My run of the gate prints every counter as 0 and `OK`. The worker's gate record for this head also has `build=0`.
- Dependency check output, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2364 edges, 0 problem(s)
```

- The only roadmap supplier is AlgebraicTopology Stage 6 item 0, which is on main (README:954). Its item 0 owns the homotopy-commuting product squares and their cone maps (README:980–983 there).
- DerivedModuleAlgebra is itself on main, so it has no merge-order position to check. No supplier gap is declared.

### Elaboration, binders, probe

- `lake env lean` on `Suggested.lean` gives exactly 22 “declaration uses `sorry`” warnings, at lines 105–442.
- I elaborated one file with `#check @` for all 32 declarations, and it gives no error.
- I compared each elaborated type with its README statement and found no lost binder and no generality mismatch:
  - §1.8 carries `hA`, `hc` and `hM` explicitly;
  - the Matlis theorems carry `[IsAdicComplete (maximalIdeal R) R]` and `he : TauCeti.IsInjectiveEnvelope e`;
  - `derivedLimit_isTriangulated` quantifies over both `HasDerivedCategory` universes.
- One-tactic probe: in a scratch copy I replaced every `sorry` by `first | rfl | infer_instance | simp | trivial | decide | aesop`. All 22 bodies fail, so no theorem is padding by that test.
- `ringTowerLimit_jacobson` does not use `hsurj`. This is noted only; it is not a finding.

### Library declarations at the pins

The declarations are those of the pins in `lake-manifest.json`, which this pull request does not change.

- **Scan.** A declaration scan of the pinned Tau Ceti and Mathlib sources finds every library name the README cites:
  - 176 qualified Tau Ceti/Mathlib names in the Tau Ceti namespaces it uses;
  - 76 further Mathlib names;
  - 8 unprefixed names (`dividedPowersBot`, `derivationToSquareZeroEquivLift`, `LinearMap.mul'`, …).
  - All 29 cited `TauCeti.*` module paths exist as files or directories.
- **Opened at the pin:**
  - `HomologicalComplex₂.columnFiltrationSpectralSequence` and `…FirstPageXIso` (`TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:442, 446`; `H_k(K.X p)` at `(−k−2p, p)`).
  - Mathlib `coreE₂Cohomological` (`Algebra/Homology/SpectralObject/HasSpectralSequence.lean:143`; differential vector `(r, 1−r)`). Together with the line above, this puts `nonempty_bicomplexSecondPageIso`'s page-3 object at the classical `E²_(p,k)`.
  - `TauCeti.IsInjectiveEnvelope` (`Algebra/Module/Injective/Envelope/Basic.lean:95`: an injective module, an injective map, an essential range).
  - `TauCeti.ModuleTower.derivedLimit` (`Tower/DerivedLimit.lean:310`) and its `CommShift ℤ` instance (`:329`).
  - `TauCeti.ModuleTower.isMittagLeffler_of_surjective` and `_of_isArtinian` (`Tower/MittagLeffler.lean:104, 113`).

### Cross-roadmap citations and ownership

- **Resolved on main:**
  - EnhancedDerivedSheaves §0.1 (README:429), §0.2 (:441), §0.3 (:455), E1.F3.H1 (:637) and E1.8.DMA.1 (:888);
  - EtaleCohomologyFoundations F.10.3 (:1295);
  - KhovanovHomology K5 (:518);
  - PerfectoidSpaces P0.19 (:2334) and P0.22 (:2747).
- **Names other roadmaps cite in this roadmap's namespaces.** `roadmaps grep` over main and the 466 open heads finds 128 distinct names.
  - Every one attributed to DerivedModuleAlgebra resolves in the head README.
  - The rest belong to DerivedDeRhamCohomology (#868, its own `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.*`), EtaleCohomologyFoundations (`PerfectComplex.lefschetzNumber`) or EnhancedDerivedSheaves.
- **Names main's `Suggested.lean` declared (131).** The only outside hits are false positives: PerfectoidSpaces' own `Perfectoid.completedColimit`, and Mathlib's `isMittagLeffler_of_surjective` cited by AdicSpacesPartIII.
- **Fully qualified names.** No other `Suggested.lean` uses the namespace `TauCetiRoadmap.DerivedModuleAlgebra`.
- **DerivedDeRhamCohomology (#868)** declares `ordinaryFlatnessFromCompleteFlatness`, Bhatt's Noetherian criterion. That is a different statement from BMS19 Lemma 4.7, which §1.8 states. Its `PD.existsUnique_dividedPowers_augmentationIdeal` is the PD structure, not §0.DP.3's ring map and ideal.
- **Overlaps.**
  - `overlaps.md` reports no other pull request changing this roadmap.
  - Its dropped ids are §1.T.1 and its anchor. They are mapped at README:34–36 to the Tau Ceti tower declarations of README:111.
- **AffineCrystalline.** The citations are unchanged since the previous review, which checked them on GitHub.

### Seeded sample (15 targets)

No locator is flagged as unverified. I fetched StacksAlg, StacksDefos, SAG, BL22, Prisms and StacksSites through the sources service into a scratch copy of the manifest; the package `sources.toml` is unedited.

| Target | Lines read | Result |
| --- | --- | --- |
| 0.2 | StacksMA 6709 (60.1, 06XZ, p.144), 6725 (60.5, 06Y2, p.144), 6741 (60.7, 064K, p.145), 6753 (60.8, 06Y3, p.145), 6781 (60.10, 06Y4, p.146), 6824 (60.12, 064L, p.147), 6846 (60.13, 064M, p.147) | Exact |
| 0.2.1 | StacksAlg 8891 (10.81.2, 058E, p.190), 8918 (10.81.4, 058G, p.191) | Exact |
| 0.4 | StacksCt 89 (3.2, 08PN, p.3), 108 (3.4, 08S9, p.3), 193–228 (4.3–4.7, pp.5–6), 360 (5.5, 08QI, p.9); BL22 10001–10013 (B.1–B.2, p.225) | Exact |
| 0.8 | StacksCt 704–707 (7.4, 08QX, p.16) | Exact |
| 0.10 | StacksCt 455–456 (§6, 08QL, p.11), 519–521 (6.2, 08QQ, p.12; the hypothesis `B ⊗^L A′ = B′`) | Exact |
| 0.12 | StacksCt 847 (9.1, 08R5, p.19), 805–811 (8.4(5), étale, 08R2, p.18), 228 (4.7, 08QH, p.6) | Exact |
| 0.14 | SAG 62288–62295 (25.2.2.2, p.1700), 62365 (25.2.3.1, p.1702), 62398–62407 (25.2.3.2–3, p.1703), 62415–62418 (25.2.3.4(2), p.1703); BL22 10001, 10042 (B.1, p.225; B.5, p.226); DoldPuppe 929–967 (4.2–4.7, pp.227–228) | Exact; the README already corrects SAG's signed coinvariants |
| 0.15 | SAG 62262 (25.2.2.1, p.1699), 62414 (25.2.3.4(1)); DoldPuppe 994 (4.10, pp.229–230) | Exact |
| 0.16 | SAG 62308 (25.2.2.3, p.1700), 62327 (25.2.2.4, p.1701), 62419 (25.2.3.4(3), p.1703); DoldPuppe 1023–1035 (4.13, (4.14), p.230) | Exact |
| 0.25 | StacksCt 1388–1414 (§16, 16.1, 08SP, p.31), 1676 (21.1, 08UZ, p.37); StacksAlg 11014–11019 (10.99.8, 051C, pp.233–234); StacksDefos 56–87 (2.1, 08S5, p.2); GR 1685 (2.5.32, p.35), 1986–2023 ((3.2.7)–3.2.11, pp.41–42) | Exact |
| 1.1 | StacksMA 10946 (89.1, 091D, p.238), 10971 (89.3, 0CQD, pp.238–239), 10983 (89.4, 0CQE, p.239), 11108 (89.10, 091J, pp.241–242), 11124 (89.11, 091K, p.242), 11133 (89.12, 091L, p.242) | Exact |
| 1.1.1 | StacksMA 8706–8731 (§15.75, 0A5W; (75.0.1) 0A63, (75.0.2) 0A64, 75.1 0A65; p.189); StacksSites 3668 (§21.35) | Exact |
| 1.3 | StacksMA 12163–12176 (93.10, 091V, p.264, Čech formula), 12293 (93.18, 0920, p.267), 12344–12365 (93.20, 0G1U, p.268, derived Nakayama), 12374 (93.21, 0AAJ, p.268) | Exact |
| 1.4 | StacksMA 12260–12269 (Situation 93.15, transitions `f^(m−n)` on `e_I`, p.266), 12293 (93.18, p.267) | Exact |
| 1.7 | Prisms 406–416 (§1.2, p.11, finitely generated `I`); BMS19 850 (4.1, p.220), 872 (4.4), 888 (4.5, p.221), 895 (4.6, p.221), 908–919 (4.7, pp.221–222), 958 (4.8, p.223) | Exact |

**Spot checks outside the sample, all exact:**
- BMS19 751–765 (Thm 3.1, assertion (1) for any `M`, p.217) and 973 (Rem. 4.9, p.223), for §1.9;
- StacksMA 9295 (068V), 8800–8804 (0658) and 13310–13325 (0CQG), for §§1.E.0–1.E.1 and `pseudoCoherent_residueCriterion`;
- StacksMA 12005–12011 (091P(4), any ideal) and 12125 (091U), for `isDerivedCompleteCohomology`;
- DoldPuppe 422, 567, 583 (Sätze 2.9 and 2.15, Bemerkung 2.16, pp.213–217), for §0.2.2.

### Adversarial table (computed in this review)

| Statement | Instances | Values on each side; wrong model excluded | Result |
| --- | --- | --- | --- |
| `nonempty_bicomplexSecondPageIso` | `K_(1,0) = ℤ --2→ K_(0,0) = ℤ`, else `0`; `k = 0` | page 2: `ℤ` at `(−2,1)` and `(0,0)`, `d₂ = ±2`; page 3: `ℤ/2` at `(0,0)` = `H_0[ℤ →2 ℤ]`, `0` at `(−2,1)` = `H_1`; abutment `H_0(Tot) = ℤ/2` | True |
| `simplicialTensorComparison` (1,1) | `x ∈ X₁`, `y ∈ Y₁`, `d = d₀ − d₁ + d₂` | `d(s₁x⊗s₀y − s₀x⊗s₁y) = s₀dx⊗y − x⊗s₀dy = ∇(dx⊗y − x⊗dy)`; the opposite sign is not a chain map | True |
| `bisimplicialDiagonalComparison` | constant `P`; `X ⊠ Y`, `X = Y = Γ₀(A[1])` | `P` in degree 0 on both sides; `A` in degree 2 on both sides | True |
| `quasiIso_whiskering_of_projective` | `f = id`; `F` constant `R′`; `Γ₀[ℤ →2 ℤ] → ℤ/2`, `F = (−)^⊗2` | `F(id) = id`; constant complex `R′`; source `H₁ = Tor₁(ℤ/2,ℤ/2) = ℤ/2`, target `0` | True; projectivity needed |
| `exteriorPower_decalage` | `N = R`, `n = 0,1,2`; `N = R²`, `n = 2`; `N = ℤ/2` | `R`; `N` in degree 1; normalized `0 → R⊗R` gives `H₂ = R = Γ²R`; `R⁴ → ∧²R² = R` onto, kernel rank 3 = rank `Γ²(R²)`; `F₂` against `Γ²_ℤ(ℤ/2) = ℤ/4` | True for flat `N` |
| `symmetricPower_decalage` | `N = R`, `n = 2`; `N = R²`, `n = 2` | `R →(unit) R` acyclic = `∧²R = 0`; `R⁴ → Sym²R² = R³` onto, kernel `R = ∧²R²` | True |
| `derivedLimit_isTriangulated` | `ℤ` with `×p`; `A_n = ⊕_(m≥n)k → V → k^n` | `H¹ = ℤ_p/ℤ`; levelwise-split diagram: zero boundary forces `⊕k → ∏k` onto, false (all-ones sequence) | Levelwise data excluded |
| `derivedCompleteness`, `…Generators`, `…Radical` | `I = 0`, `A`; `(2,3) = ℤ`; `(p²)` against `(p)` | all complete; only `0`; `M = 0`; same `f` up to powers since `A[1/f] = A[1/f^k]` | True |
| `isDerivedCompleteCohomology` | `ℤ_p ⊕ ℚ_p[−1]` over `ℤ` | `H¹ = ℚ_p` fails at `f = p`, `n = 0` (`ℤ[1/p] → ℚ_p`); the complex fails too | True for any ideal (091P(4)) |
| `isDerivedComplete_triangle` | `ℤ_p →p ℤ_p → F_p` | `F_p` complete (`lim¹` of a zero tower is `0`) | True |
| `derivedCompleteness_isRightAdjoint` | `I = 0`, `A`, `(p)` | left adjoints `id`, `0`, `ℤ ↦ ℤ_p` with `ℤ[1/p] ↦ 0`; `×2` on `ℤ[0]` has no cokernel in `D(ℤ)` (a split epi onto a summand of `ℤ`) | True |
| `IsCompletelyFlatModule` | `ℤ`, `F_p`, `ℤ_p` at `(p)` | `Tor₁ = 0` and flat; `Tor₁(F_p,F_p) = F_p`; flat | Correct |
| `isAdicComplete_of_isCompletelyFlatModule` | `A = M = ℤ/4`, `p = 2`; `A = M = ℤ_p` | `c = 2`; `1⊗2 ↦ 2` onto `M[2] = {0,2}`; `A[pⁿ] = 0 = M[pⁿ]`, `M/pⁿ = ℤ/pⁿ` flat | True (BMS 4.7(1)) |
| `isCompletelyFlatModule_of_isAdicComplete` | `ℤ/2` over `ℤ/4` | `hflat` fails at `n = 2`; `Tor₁^(ℤ/4)(ℤ/2,ℤ/2) = ℤ/2` | Hypothesis needed |
| `IsPerfect`, `IsPseudoCoherent`, `isPerfect_*` | `eA` over `k×k`; `[ℤ →2 ℤ]` | perfect, Euler ranks `(1,0)` exclude bounded free models, resolution with `e`, `1−e` is exact; `F₂ --0→ F₂` after base change | Correct |
| `ringTowerLimit_jacobson` | `k[t]/(t^(n+1))`; `B = k[x_i]/(x_i²)`; zero ring at `A_0` | `1+t` unit; `(1+x₁)(1−x₁) = 1`; with `A_0 = 0`, `hnil` fails at `n = 0` and `t` would be a unit | True; `hnil` needed (R01) |
| `pseudoCoherent_residueCriterion` | `[k[[t]] →t k[[t]]]`; `[a,b] = [0,0]`; zero ring | fibre `[k →0 k]`, so `[−1,0]` is needed and `k` is not projective; hypothesis fails at `[0,0]`; `E = 0` | True |
| `Matlis.biduality_*` | `ℤ_p`, `E = ℚ_p/ℤ_p`; `M = 0`; `ℤ_(p)` | `D(ℤ_p) = E` Artinian, `End E = ℤ_p`; `0 ↦ 0`; non-complete: `D(E) = ℤ_p ≠ ℤ_(p)` | True; completeness needed |
| 0.2 | `F_p ⊗^L F_p`; `(ℤ/4, ×2)` two-sided | `H⁰ = H^(−1) = F_p`; termwise `F₂` in every degree against derived `0` | True |
| 0.2.1 | `ℚ`; `ℤ/2` over `ℤ` | `×(e/d)` transitions, `a ↦ a/d`; `×2` injective on `ℤ`, zero on `ℤ/2` | True |
| 0.4 | `k[ε]/ε²`, char ≠ 2 and = 2; `ℤ → ℤ/2` | `[B →2ε B]`, `H^(−1) = (ε)`; zero map, `H^(−1) = H⁰ = B`; `H^(−1) = (2)/(4)`, `H⁰ = 0` | True |
| 0.8 | `ℤ → ℤ → ℤ/3`; `ℚ → ℚ[X] → ℚ[X]` | `L_(ℤ/ℤ) = 0`, second map iso on `H^(−1) = ℤ/3`; first map sends `dX ↦ dX ≠ 0` | True |
| 0.10 | `ℤ → F_p`, `A′ = F_p`; `ℤ → ℤ[X]`, `A′ = F₂` | `L_(F_p/F_p) = 0` against `F_p[1]`, `Tor₁ = F_p`; `F₂[X]dX` both sides | True |
| 0.12 | `k[ε]/ε²`; `A[X]`; no variables | `H^(−1) ≠ 0`, not smooth; `A[X]dX`; `0` | True |
| 0.14 | `ℤe`, `F₂e`, `n = 2`; `B[1]` | `∧² = 0`; signed coinvariants give `ℤ/2` (`2e⊗e = 0`); `L∧ⁿ(B[1]) = Γⁿ(B)[n] ≠ 0` | True |
| 0.15 / 0.16 | `ℤe`; `F₂e`; `F_p e` | `Sym² = ℤe²`, `Γ² = ℤγ₂(e)`, `e·e = 2γ₂(e)`; over `F₂`, `e·e = 0` in `Γ`; `e^p = p!γ_p(e) = 0`, `γ_p(e) ≠ 0` | True |
| 0.25 | `ℤ/4 → F₂`, `c = 0`, `F₂[ε]`; `k[x]/(x³) → k[x]/(x²) → k`; `k[x] → k[ε]` | kernel `F₂ε`, `JB′ = 0`, not flat; `(x²) ↦ 0` in `(x)/(x²)`, so the connecting map onto `k`; lifts `x ↦ 0, ε` | True |
| 0.7 Check | `k[x,y]/(x,y)²` | `Rel = ⟨r₁ = ye₁ − xe₂, r₂ = ye₂ − xe₃⟩`, `TrivRel = ⟨xr₁, yr₁ + xr₂, yr₂⟩`; `yr₁ ↦ 0` in `B³`, so `H^(−2) = k` | True |
| 1.1 | `×3` tower, `h(x)_n = x₀` (even `n`); `[ℤ → ℤ/p^(n+1)]` | `Σ 9^m = −1/8 ∉ ℤ`, nonzero in `ℤ₃/ℤ`; `H⁰ = p^(n+1)ℤ` not ML, `H¹(Rlim) = ℤ_p/ℤ` | True |
| 1.1.1 | `RHom(ℤ/p, ℤ)`; `RHom(ℤ[1/p], ℤ)` | `H¹ = ℤ/p`; `H⁰ = 0`, `H¹ = lim¹(×p) = ℤ_p/ℤ` | True |
| 1.3 | `ℤ` at `(p)`; `ℤ[1/p]`; `ℤ[−1]` at `I = ℤ` | `ℤ_p`; `0`; the `n = 0` test passes (negative Ext) but `f = 1`, `n = −1` gives `ℤ ≠ 0` | Correct |
| 1.4 | `(0)`; `(p)` over `ℤ` | tower `M ⊕ M[1]` with zero maps on `M[1]`, `Rlim = M`; degree `−1` transition `×p` | True |
| 1.5 Checks | `A = ℤ_p ⋉ ℚ_p/ℤ_p` | ordinary tower `R[0]`; Koszul `H^(−1) = T[pⁿ]`, `×p` onto, limit `T_p = ℤ_p`; `Hom_(D(A))(C, R[1]) = Ext¹_A(A,R) = 0` | True |
| 1.7 | `ℤ`, `F_p`, `ℤ_p` | flat, not complete; `F_p ⊗^L F_p` has `H^(−1)`; `ℤ_p/p = F_p` faithfully flat | True |
| §S.1 Check | `a, b, c, e` in `(0,1), (1,0), (1,1), (2,0)` | total matrix `[[1,1],[0,1]]` invertible; `E₂` is `R` at `(0,1)`, `(2,0)`; `d₂[a] = [−e]`; `E₃ = 0` | True |
| R01 Checks | `k[t]/(t^(n+1))`; `B`, with `A₀ = k` | kernels nil; `H^(−1)(M_n) = (t^n) ≅ k`, limit `H^(−1) = 0` | True after repair |

The computations cover the zero ring, the zero and unit ideals, characteristic 2, `n = 0, 1, 2`, non-flat modules, non-projective simplicial targets, non-complete DVRs and non-nilpotent locally nilpotent kernels. No restriction to good primes, flat inputs or finite residue fields is introduced.

## Not verifiable

- IllusieCC, Chapter II, 1.2.6.2 (§0.9): the Springer volume has no open copy. GR line 10637 shows GR uses it for the quasi-isomorphism §0.9 states.
- Outside the sample, NSW, Roby, Chenevier, Nekovář, DM and Bhatt12 were not opened this round.
- The package `sources.toml` records only BMS19, StacksMA, StacksCt, DoldPuppe and GR. The six other texts read here were fetched into a scratch manifest; this review edits no manifest.
- Ownership against open pull requests was checked with `roadmaps grep` over all 466 open heads and main, for the objects named above.

## Source issues

- **Error** in SAG at Construction 25.2.2.2, p.1700 (repeated in Proposition 25.2.3.4(2), p.1703): the source defines the exterior power as signed-permutation coinvariants and claims a free basis of the usual rank; it should take the quotient by all alternating tensors, including `x⊗x`, since over `ℤ` a rank-one module gives `ℤ/2`; affects a stated result.
- **Error** in StacksMA at the opening paragraph of §15.96, Tag 0BKH, p.275: the source says the derived completion of `A = ℤ_p ⊕ ℚ_p/ℤ_p` at `(p)` is `ℤ_p[1] ⊕ ℤ_p[0]`, computation omitted; it should restrict that splitting to `D(ℤ_p)`, since in `D(A)` every map from the completion to `ℤ_p[1]` vanishes; affects a stated result.
- **Misprint** in StacksMA at the opening paragraph of §15.96, Tag 0BKH, p.275: the source says the section's goal “is the show” agreement in the Noetherian case; it should read “is to show”; affects nothing.
