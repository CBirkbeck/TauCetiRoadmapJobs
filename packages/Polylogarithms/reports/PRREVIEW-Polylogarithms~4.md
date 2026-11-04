# Review of Polylogarithms (pull request #1424 at fc00043)

**Verdict:** accepted

No P1 or P2 finding. The gate passes, the dependency check is clean, and the four notes below are P3 (the author's to take or leave).

## R01 (P3) — `zagierExistence_totallyRealEven` restates a supplier's headline

**Location:** `TauCetiRoadmap/Polylogarithms/Suggested.lean:246–251`; `TauCetiRoadmap/Polylogarithms/README.md:717` (“Prove `zagierExistence_totallyRealEven`: the rational-existence assertion of §4.4 holds with the empty family”).

**Claim:** With `ι = Fin 0` the determinant is the empty determinant, so `normalizedPeriod n σ c` unfolds to `π^(n·[F:ℚ]) / √|disc F|` and the theorem reads `π^(nN)/√|disc F| = q·ζ_F(n)`, `q ≠ 0`. That is exactly the statement BorelRegulators already states in its own acceptance file, with `q` replaced by `1/q`.

**Witness:** `TauCetiRoadmap/BorelRegulators/Suggested.lean:104–109` (head of #1461): `exists_pos_rat_dedekindZeta_of_isTotallyReal`, hypotheses `[IsTotallyReal F] (hn : 2 ≤ n) (hev : Even n)`, conclusion `√|disc F| · ζ_F(n) = q · π^(n·finrank ℚ F)` with `0 < q`. The README's own supplier contract (line 116) imports it from BorelRegulators §5.1. Values: over ℚ, `n = 2`: `π²/ζ(2) = 6`; `n = 4`: `π⁴/ζ(4) = 90`; over ℚ(√2), `n = 2`: `(π⁴/√8)/ζ_F(2) = 24` — all computed from the supplier's statement alone, with `det (0×0) = 1`.

**Exact repair:** Delete `zagierExistence_totallyRealEven` from `Suggested.lean` (the README keeps §4.7's target and cites the supplier's declaration by name, `BorelRegulators.exists_pos_rat_dedekindZeta_of_isTotallyReal`, as the input). The docstring sentence “totally-real even-weight existence” then moves to the README's list of what the supplier proves. The eight other headlines are unaffected.

## R02 (P3) — Say who owns the weight-two Bloch–Wigner/Borel scalar against PadicHodgeRegulators

**Location:** `TauCetiRoadmap/Polylogarithms/README.md:191–201` (§2.3, `weightTwoRegulator_borel`, `borelCalibration_two`) and `:1565–1569` (Downstream consumers).

**Claim:** PadicHodgeRegulators §4.7 (open pull request #1498) declares itself “the single owner of … the Suslin–Bloch–Wigner evaluation on Suslin's Bloch classes with its scalar κ₂” and writes that “Polylogarithms §2.3 consumes the Suslin–Bloch–Wigner evaluation and the computation of κ₂”. That is the same object as §2.3's comparison of the descended `D` with Borel's regulator and its scalar. The merge order makes that direction impossible: Polylogarithms is line 283 and PadicHodgeRegulators line 304 of `ORDER.txt`, so Polylogarithms cannot consume from it and is the owner.

**Witness:** PadicHodgeRegulators README (as printed by `roadmaps show`) line 8 (scope) and lines 1033–1039 (§4.7: `reg_σ(s_F⁻¹ b) = κ₂·Σ nᵢ P₂(σxᵢ)` via Hurewicz, configuration map and “the class of the composite of the configuration map with D_BW is a nonzero multiple of the Borel class”); `ORDER.txt:283` versus `:304`. Polylogarithms' README never names PadicHodgeRegulators (0 occurrences).

**Exact repair:** One sentence under Downstream consumers: PadicHodgeRegulators §4.7 consumes §2.3's weight-two comparison and its scalar (the Tate/Borel coordinate conversion and the cocycle of §2.2 stay here). The reverse edit, in #1498, is for its author: its ownership sentence points the wrong way in the merge order. Nothing in §§2.1–2.3 changes.

## R03 (P3) — Supplier names that the suppliers do not declare, and one phantom consumer

**Location and claim**, each with its witness at the cited head:

- `README.md:1543`: “PolylogarithmFunctions §4.8 supplies this formula and `hasFDerivAt_singleValued_three_one`”. The supplier states the zero derivative at 1 (its §4.8, README line 669 of #1320) but declares no such name in its README or `Suggested.lean`.
- `README.md:40` and `:1098`: “the supplier's `cubicalOrientationChange J_q`”. MotivicEtaleKTheory §1.1 (#1470, README lines 125 and 133) calls the involution `Jₙ = (−1)ⁿ` and has no declaration of that name; its boundary is written `∂□ = Σ(−1)^(i−1)(∂ᵢ⁰ − ∂ᵢ^∞)`, which equals the README's `∂_M` formula, so only the names drift.
- `README.md:122`: `complexSchemeAnalytification.map` and `complexSchemeAnalytification.fibreProduct`. ComplexComparisonPartII §C-1.1 (#848, lines 774–778) declares the functor and states the fibre-product compatibility in prose; neither dotted name exists.
- `README.md:980`: “especially `proper-pushforward`”. SchemeAndStackFoundations §5.2 (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:6653–6655`) names it `Chow.properPushforward`.
- `README.md:1356`: “§10.12's Milnor base-change identity `res N = sum_(g in G) g_*`”. K2SymbolsBrauer §10.12 (#1302, line 1953) is the general base-change formula `res ∘ N = Σ eᵢ Nᵢ ∘ resᵢ`; the Galois-sum form is §10.23 (line 2173).
- `README.md:1567`: “EllipticRegulators” as a downstream consumer. No roadmap of that name exists on main, in the merge order, among the board's packages or among the 441 open pull requests (the string occurs only inside other READMEs' consumer lists).

**Exact repair:** Cite the four supplier facts by section and prose (or by the suppliers' real names `Jₙ`, `Chow.properPushforward`), add §10.23 beside §10.12, and either drop “EllipticRegulators” or name a roadmap that exists.

## R04 (P3) — Two hypotheses the Lean statements do not need

**Location:** `Suggested.lean:118` (`blochWigner_lobachevsky`, `hz : 0 < z.im`) and `:150` (`blochWigner_kummer`, `z ≠ 0`, `z ≠ 1`).

**Claim:** Under Lean's total conventions (`arg 0 = 0`, `0⁻¹ = 0`, `Real.log 0 = 0`) both identities hold for every `z : ℂ`. Instances: for `Im z < 0` the three arguments are the negatives of those of `z̄`, and `lobachevsky` is odd, so the right side is `−D(z̄) = D(z)`; at `z = 0, 1`, real `z < 0`, `0 < z < 1` and `z > 1` both sides of the Lobachevsky identity are `0` (e.g. `z > 1`: args `0, π, 0` and `Λ(π) = 0`); for Kummer at `z = 0` all three arguments evaluate to `0, 1, 1` and at `z = 1` to `1, 0, 0`, giving `0 = D(0)` and `0 = D(1)`; at real `z = 2.5, −0.7` both sides are `0` numerically.

**Exact repair (optional):** drop the hypotheses, or keep them as the README's geometric reading (“for `Im z > 0` … three positive angles summing to π”). Either is consistent with the README.

## Previous findings

Both reviews read the same head `fc00043`; the repairs of r3's findings live in the board package, not in the pull request:

- r3 R01 (P2, obsolete supplier-gap requests in `plan.json`): **repaired**. `packages/Polylogarithms/design/plan.json` now has `gaps: []` (board commit 297e28e8 “retire the three obsolete supplier gaps”), matching the README, which declares no gap.
- r3 R02 (P3, BOL/BNM/RSR not in the manifest): **repaired**. `packages/Polylogarithms/sources.toml` has 22 records; BOL (arXiv 2108.11862v4, sha256 207fe334…), BNM (2404.06271v2, 9696b5dd…) and RSR (1511.00520v3, 82a8f43d…) are recorded as `certified` (board commit 746bbe4b), and their cache texts match the files this review read.

## Verified sound

**Gate and build.** The worker's gate at `fc00043` passes every scanner, the dependency check and the targeted build. My own elaboration of `TauCetiRoadmap/Polylogarithms/Suggested.lean` with `lake env lean` exits 0 with exactly nine warnings, all `declaration uses sorry` (lines 118, 139, 145, 150, 162, 221, 232, 246, 274). The outside-folder diff `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Polylogarithms'` is empty. Imports: the single `import Mathlib`; no `set_option`, no `lemma`, no `#eval`, no sorry'd data; one proved `example` (linear independence of `unitVector 2, 3, 5` through 2-, 3- and 5-adic valuations), which tests the rational unit carrier and is kept.

**Dependency check** (run with the supplied order, `--movable`, and main as content):

```text
depcheck: 204 roadmaps, 1657 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `ORDER.txt` lists Polylogarithms at line 283 after every cited supplier (StableHomotopyKTheory 13, GeneralAlgebraicKTheory 14, IntegralIwasawaTheory 25, AlgebraicModuliForArithmeticGeometry 32, SchemeKTheoryOperations 34, K2SymbolsBrauer 37, PolylogarithmFunctions 38, ComplexComparisonPartII 39, KTheoryFiniteLocalFields 68, MotivesAndAlgebraicCycles 70, ArithmeticKTheory 122, MotivicEtaleKTheory 123, K3BlochGroups 124, ColemanIntegration 125, EndoscopicTransferAndUnitaryTraceComparison 134, BorelRegulators 279) and before its consumers (ZagierConjecturePolylogarithms 300, PadicHodgeRegulators 304, HabiroNahmSeries 315). The main-branch suppliers DGFloer, AlgebraicTopology, AlgebraicCurves, DifferentialGeometry, ComplexKahlerGeometry, GeometricCurrents, GeometricTopology, SchemeAndStackFoundations, AlgebraicVectorBundles are on main. Every `*Needs:*` line was read; none cites a later roadmap.

**Signatures.** A scratch copy with `#check @name` for all 24 declarations elaborated; each elaborated type agrees with the README statement (rows are embeddings, columns symbol families; `normalizedPeriod` requires `NumberField F`, `Fintype ι`, `DecidableEq ι`; the lattice definitions carry `DiscreteTopology Λ` and `IsZLattice ℝ Λ` explicitly; the two weight-three headlines quantify over an equivalence `Fin (r₁+r₂) ≃ InfinitePlace F`). No section binder was lost, and no signature change is required.

**Padding probe.** Every `sorry` was replaced by `first | (simp; done) | rfl | sorry` on the scratch copy; all nine theorems still report `sorry`. No pinned declaration closes any of them by a single `exact` (the pin has no polylogarithm, dilogarithm, Lobachevsky or Clausen function: `grep -i` over `Mathlib` finds none).

**Headlines.** From the README: weight-three existence and every-family rationality (§3.8), the totally-real even-weight case (§4.7; see R01), the Lobachevsky angle formula, ideal-volume finiteness and `volume = D` (§2.4), Kummer reduction (§2.5), the explicit trilogarithm relations (§3.1), elliptic-kernel summability (§5.18): all stated. Not statable at the pins and named as such in the docstring: the descent/Borel comparisons (§§2.1–2.3), configuration comparison and cycle lifting (§§3.5–3.8), the current/Deligne regulators and comparisons (Layer 5), strong and next-to-Milnor reciprocity (§§4.7, 5.14) and the elliptic Fourier pairing. I found no statable headline absent and no stand-in.

**Pinned library declarations** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`):

| Declaration | Where at the pin | What was checked |
| --- | --- | --- |
| `bernoulli_one : bernoulli 1 = -1/2` | `Mathlib/NumberTheory/Bernoulli.lean:204` | `singleValued` coefficients `1, −1, 1/3` (Zagier's β₂ = 1/3, G00 line 143) |
| `NumberField.dedekindZeta` | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49` | actual ideal-count L-series; `.re` taken in the headlines |
| `discr_ne_zero`, `discr_rat` | `…/Discriminant/Defs.lean:41`, `:89` (alias) | `√|disc|` nonzero; ℚ has `disc = 1` |
| `nrRealPlaces`, `nrComplexPlaces`, `card_eq_…` | `…/InfinitePlace/Basic.lean:437`, `:441`, `:447` | row count `r₁+r₂` |
| `InfinitePlace.embedding`, `mk_embedding` | `…/InfinitePlace/Basic.lean:102`, `:105` | one embedding per place (so per conjugate pair) |
| `integral_log_sin_zero_pi` | `Mathlib/Analysis/SpecialFunctions/Integrals/Log.lean:85` | `Λ(π/2) = Λ(π) = 0` normalization |
| `hasStrictFDerivAt_log_real` | `…/Complex/LogDeriv.lean:45` | needs `slitPlane`; README differentiates only the real single-valued functions across the cut |
| `IsZLattice`, `ZLattice.covolume`, `covolume_pos` | `Mathlib/Algebra/Module/ZLattice/Basic.lean:433`, `Covolume.lean:72`, `:98` | `A > 0` in `ellipticCharacter` |
| `Distribution.delta`, `lineDerivCLM` | `Mathlib/Analysis/Distribution/Distribution.lean:201`, `:234` | §5.1 Dirac and derivative conventions |
| `AlgebraicCycle.map` (needs `QuasiCompact`) | `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:69` | weighted pushforward cited in §5.3 |
| `TauCeti.HasContinuousLogOn` | `TauCeti/Analysis/Complex/ContinuousLog/Basic.lean:19`, `:119` | predicate and `.mul`, `.inv`, `.union` APIs |
| `TauCeti.IsFunctionField`, `.essFiniteType`, `.trdeg_eq_one`, `.finiteDimensional_adjoin` | `TauCeti/FieldTheory/FunctionField/Basic.lean:49`, `:91`, `:123`, `:62` | finite over `k(x)`, as §4.7 states |
| `TauCeti.Place.residueUnit` (takes `hf : P.ord f = 0`), `residueUnit_mul`, `residueUnit_inv` | `…/Place/Residue.lean:113`, `:185`, `:208` | reduction only after valuation zero |
| `TauCeti.Place.finite_setOf_ord_ne_zero` (needs `IsFunctionField`) | `…/Place/Zeros.lean:461` | finite residue support in §4.7 |
| `hasSum_log_of_mem_unitFiltration_one`, `continuous_log_unitFiltration`, `valuation_log_sub_log` (`e < (p−1)i`), `log_unitFiltration_injective` | `TauCeti/NumberTheory/LocalField/Logarithm.lean:97`, `:165`, `:256`, `:285` | §6.1 depth hypothesis, `p = 2` included |
| `TauCeti.riemannianVolume` | `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76` | §2.4's volume input |

**Supplier citations resolved** (every section named in the README was located at the cited head; a line number is of the README printed by `roadmaps show` or of the `rev/` checkout):

| Supplier (head) | Sections found | Note |
| --- | --- | --- |
| PolylogarithmFunctions (#1320) | `polylog` 110–116 (same integral, lower boundary on the cut, line 47), `singleValued` 545–552 (`B₁ = −1/2`, line 51), `blochWigner` 702, §4.5 607–614, §4.8 659–669, §5.2 724 (`L₂ = D`), §5.4 759–762 (`dD = η(z,1−z)`), §7.2 1021–1025, `singleValued_inv` 630, `blochWigner_fiveTerm` 811–814 | five-term stated with only `x ≠ 0`, `y ≠ 0`, which is stronger than the README's and true; see R03 for the unnamed §4.8 derivative |
| K3BlochGroups (rev/1430) | §3.3 598–606 (five-term, `[1]` imposed), §3.4 676, §3.5 707–714 (`[x] ↦ x∧(1−x)`), §3.6–3.7 755–786 (`P(𝔽₃)` cyclic on `[−1]`), §§3.13–3.16 952–1045, Layer 4 1087, §4.20 1685, §4.21 1701–1709 (all four names) | the README's differential is the negative of §3.5's, as stated |
| BorelRegulators (rev/1461) | §2.3 287, §3.4 387–389, §5.1 597–599, §5.3 640, §5.4 662–664 | see R01 |
| MotivicEtaleKTheory (rev/1470) | §1.1 121–133 (`∂□`, `Jₙ`), §§1.3–1.4 171–185, §§2.1–2.4 262–328, §§3.3–3.4 397–420, §§4.1–4.2 452–473, §5.1 497, §5.2 519, §5.3 541–560 (`Aₚ`, `Aₚ,S`, `Hₚ`, the three arrows and their names in BFT), §5.4 564, §§6.1–6.3 588–626, §§7.1–7.4 650–705 (divisor representative `−log|f|`, unit `+log|f|`) | §5.3 says explicitly that `D_AH` and `β` are Polylogarithms' constructions |
| ArithmeticKTheory (rev/1418) | §3.3 1138, §3.4 1190–1196 (`borel_rank_order`, `borel_rank_centralSimple`: `r₁+r₂` in degree 1 mod 4, `r₂` in degree 3 mod 4) | gives `d₃ = r₁+r₂`, `d_even = r₂` |
| GeneralAlgebraicKTheory (#1212) | §3.12 616, §3.13 630, §3.14 646–658 (inverse transpose then inversion; 𝔽₅ example), §5.11 1118 | |
| StableHomotopyKTheory (#1227) | §3.37 1428–1430 (finite type), §4.14 1648, §6.1 2257, §6.2 2290, §7.19 2568–2572 | |
| IntegralIwasawaTheory (#1306) | §2.2 309–319, §4.1 543–545 (`leopoldtLogMap`, `d×r` matrix, `leopoldt_iff_logMatrix_fullRank`), §4.4 573–575 (`abelianLeopoldt`) | |
| ColemanIntegration (#1043) | L0.F 128–139, L0.15 455, L0.16 489, L0.17 503, L0.18 519 | |
| K2SymbolsBrauer (#1302) | §5.4 509, §7.2 1222, §§8.2–8.3 1310–1333, §9.5 1490, tame convention line 31 (`∂{π,u} = ū⁻¹`), §§9.11–9.16 1603–1696, §10.5 1820, §10.9 1902, §10.12 1953, §10.23 2173, §10.24 2183, §§10.29–10.30 2322–2349, §11.3 2534, §11.5 2579 | |
| KTheoryFiniteLocalFields (#1281) §3.0a 513–534; MotivesAndAlgebraicCycles (#1313) §4.8a 712, §4.14 816; AlgebraicModuliForArithmeticGeometry (#853) §1.6 875, Layer 9 10263, §9.7 10448, `localIsomorphismResolution` 10385; ComplexComparisonPartII (#848) §C-1.1 724–778, §C5.4 3015–3258 (`CurrentCalculus`, `closedCurrentExtension`, `AnalyticCycleIntegration`, `lelongPoincareSection`); EndoscopicTransfer… (#999) §6.2 2098–2102; SchemeKTheoryOperations (#1229) §3.3 901, §4.5 1469, §5.1 1787, §5.2 1813, Layer 6 2051, §6.8 2569 | | |
| Main: DGFloer Layer 1 item 4 (650–671), AlgebraicTopology Stages 1–5, 8 (289–1602), AlgebraicCurves 12B–12C (1597–1625), DifferentialGeometry Layers 0–2, 5–6, 8 (268–816), ComplexKahlerGeometry K5a (570–646), GeometricCurrents G1 (137–176; `∂T(ω) = T(dω)` at 55), GeometricTopology Layer 7 (627–652, `TauCeti.riemannianVolume`), SchemeAndStackFoundations Layer 5 (6535–6929), AlgebraicVectorBundles L0C (254–266), Hyperfunctions HF2 (251) | | |

**Ownership.** Searches over main and the open heads (`roadmaps grep`) for Lobachevsky, ideal tetrahedron, Kummer reduction, Chow dilogarithm, Suslin reciprocity, trilogarithm, Bigrassmannian/Gale duality, Wang forms/Goncharov's regulator, Deninger, Siegel–Klingen and `ζ_F(3)` found no second constructor of Polylogarithms' objects except the two cases in R01 and R02; PolylogarithmFunctions (#1320, line 19) states that it constructs no Bloch group, symbol complex or regulator; GeometricTopology's hits are the regular-tetrahedron volume constant; HabiroNahmSeries and HabiroNumberFields consume Bloch–Wigner values from PolylogarithmFunctions. No other readable `Suggested.lean` declares a `TauCetiRoadmap.Polylogarithms.*` name.

**Seeded source sample.** Each locator was opened in the cache text (line numbers are the cache's; printed page = page marker, except Z07 +2, Z90 +390, G95 +196, MIL +154, G00 −1, D96 −1):

| Target | Source lines read | Result |
| --- | --- | --- |
| 2.1 Descent and embedding regulators | Z07 843–866 (§5, pp.18–19); G04 1528–1530, 1901, 2053–2252 | descent through the Bloch group and one embedding per conjugate pair with covolume in `ℚ·|d|^{1/2}ζ_F(2)/π^{2r₁+2r₂}`; matches the README's selected-row convention. G04's pp.47–51 are its §§5.6–5.8, not §5.5 (locator one subsection off; the content cited is there) |
| 2.4 Ideal tetrahedra and Lobachevsky | MIL 23–33 (definition), 64–76 (Lemmas 7.1.2–7.1.3), 88–93 (7.1.4), 160 (Thm 7.2.1), 171 (Lemma 7.2.2); Z07 413–428 (series), 581–590 ((7)–(8)) | all as stated; `Λ(2θ) = 2Λ(θ)+2Λ(θ+π/2)` is Lemma 7.1.4 at `n = 2` |
| 3.1 Relations and the weight-three group | G95 324–357 (Thms 1.3–1.4), 405–429 ((1.16)–(1.17), OCR-garbled); GR 324–339 ((19)), 2379–2438 (Q3, Lemmas 5.1–5.2, (106)–(110), Prop 5.4), 2486–2507 ((114)) | (19) and the three-term/inversion generators match; the 22-term display is unreadable in the scan, so the README's coordinate form was tested numerically instead (table below): it is a functional equation of `L₃` and its sign-flipped variant is not |
| 3.5 The three signed configuration maps | G95 483–509 (Def 1.5 (R1)–(R3), Lemma 1.7), 2156–2162 (p.263), 2204–2215 (§3.2), 2255–2275 ((3.5), Prop 3.8), 2813–2850 (§5.2 (a)–(e), Prop 5.3, Lemma 5.4), 2974–2984 (Theorem A, (5.20)), 3315–3321 (Thm 8.1, (8.1)); G94 801 ((3.3)), 1105–1126 (Thm 3.12); GR 2970–2987 ((142), (144)) | Definition 1.5's three relations and the factor 3 are as the README states; §5.2(e) does print `Σ(−1)^i M₃(…, a)` with `a` last, which with (R2) forces `2M₃ = 0`, so the README's negated sign is right; Theorem A's identity maps in the two lower degrees and Theorem 8.1's `M₃(C*)+M₃(C) = 0` match |
| 4.4 Three Zagier assertions | Z90 841–896 ((33)–(36), Prop 3), 960–997 (§8 Main Conjecture, both versions), 1486–1494; GR 114–120 (Thm 1.1), 196–200 (Thm 1.2: existence plus “for any yⱼ … `q ∈ ℚ`”); G95 245–258 (Thm 1.1, existence) | the three assertions are the README's; `Pₘ` has `β₁ = −1`, `β₂ = 1/3` |
| 5.1 Test forms and currents | DEM 498–560 (§2.A, (2.1)–(2.3)), 649–690 (§2.C, (2.11)–(2.15)) | dimension-`p` = degree-`m−p` currents dual to compactly supported forms with the inductive-limit topology; direct image for proper-on-support maps |
| 5.2 Analytic cycles, resolutions, Poincaré–Lelong | DEM 869 (Thm 2.24), 1288 (Lemma 3.29), 6928 (Thm 2.3), 7027 (Thm 2.7), 7049–7076, 7172–7212 ((2.15), `dᶜ = (1/2iπ)(d′−d″)`, `ddᶜ = (i/π)d′d″`); BFT 99–134 ((2.1)–(2.2)), 266–330 (Prop 4.3, Thm 4.7, (4.8), `β`) | `(i/π)∂∂̄ log|f| = [div f]`; `(2πi)^{−d}∫ω∧α`; `d(α₁,α₂,α₃) = (−dα₁, dα₂+g₁α₁, dα₃−ρα₁)` and `β(α) = (0,0,α)` exactly as in the README |
| 5.3 Admissible loci and Green forms | G04 1030–1046 (§3.1); SV 512–520 (Def 3.1.3), 2008–2011 (Thm 4.2.2), 2734–2750 (Thm 4.4.11, Lemma 4.4.12), 2802–2807 (Cor 4.4.13); BUR 3056–3070 (Def 4.2, Thm 4.3), 3092–3100 (Lemma 4.5) | all as cited; the `αᵢ|Dᵢ` separately `∂`- and `∂̄`-closed condition is Lemma 4.5 |
| 5.5 Raw Deligne and simplex regulators | G04 84–96 ((3)–(5)), 441–463 (Prop 2.1, Lemma 2.2), 516 (Thm–Constr 2.3), 892–900 (Def 2.11), 932 (Thm 2.12) | `P^{2n−i}(Y) = (2πi)^{n−i}π_X* r_{i−1}`; the structural `X → Spec F → Spec ℚ` construction of (5) |
| 5.8 The cubical regulator | BFT 62, 149, 333–345 ((5.1)–(5.2), Prop 5.3), 821–832 ((6.3), Lemma 6.4) | `P_c : Z^p_c(X,m)₀ → τD^{2p−m}_D(X,p)`, chain map by Thm 5.23 |
| 5.11 Chow polylogarithm forms | G04 529–534 ((13), with the printed bound `2j+1 ≤ 2m+1`), 588–602 (Thm 2.4, (18)), 821–825 (Cor 2.9, (26)), 1047–1070 (Thm–Constr 3.1 (37)–(39)), 1102–1112 (Thms 3.3–3.4, Remark) | degree `q−p−1`, the `2πi` residue factor and the torus invariance only at `p = q−1` are as stated |
| 5.14 Chow dilogarithms and reciprocity triangles | G04 2535–2556 (Lemma 6.9, (83)–(85)); G00 141–143 (β's), 767–771 (Prop 4.1, (28)); BOL 130–172 (Def 1.2, Remark 1.3, Prop 1.4), 208–262 (Def 1.6 with `−δ₂`, Thm 1.8, Remarks 1.10–1.12, Cor 1.11 `P₂ = −L̃₂∘H`) | the README's `ρ₂`, its current equation and every sign transport agree; I re-derived `d[ρ₂] = 2πΣ v_x(g)D(f(x))δ_x + [r₂((1−f)∧f∧g)]` from the README's own `r₂` formula (table row) |
| 5.18 Elliptic trilogarithms and Fourier pairing | D96 30–39 ((1), character `(x,γ)`), 766–797 (Thm 3.3, (26)–(28)), 799–826 (Thm 3.4, (29)–(31)) | source leaves `c₃ ∈ ℚ*` unspecified; the README's `−4/3` and `iA³/(4π²)` were re-derived (table) |
| 6.1 Completed units and the p-adic matrix | SHA 879–934 (Prop 1.5.6, Thm 1.5.7, Defs 1.5.9–1.5.10, Remark 1.5.11) | kernel of `log_p` on `O_E^×` is `μ(E)`; `log_p(p) = 0`; defect definition |
| 6.2 Exact differential of `L₃` | G00 141–143, 767–771; Z90 841–896 | `β₂ = 1/3`; the displayed derivative verified against finite differences at eight points (table) |

Also read for §4.7: RSR 61–116 (Rudenko's presentation with `[0]=[1]=[∞]=0` and omitted indeterminate terms), 179–208 (Conj 1.1, Thm 1.2 for every field and `n ≥ 3`, Cor 1.3 for perfect fields, Cor 1.4), 288–294 (the `st` quotient equals the README's `T(F,n)` first term); BNM 88–91, 416 (characteristic zero), 1389–1435 (Prop 6.1, Def 6.2, Thm 6.3).

**Adversarial computations.** Rows give the values computed on each side. Numerical rows use a tanh–sinh quadrature of the Lean integrals (so they test the file's definitions, not a library); exact rows use rational arithmetic. `G = 0.915965594177`, `ζ(3) = 1.202056903160`.

| Statement | Instances tried | Values computed on both sides | Result |
| --- | --- | --- | --- |
| `polylog` (Lean integral) | `n=2`, `z = 1, −1, 2` | `Li₂(1) = 1.644934066848 = π²/6`; `Li₂(−1) = −0.822467033424 = −π²/12`; `Im Li₂(2) = −2.177586090304 = −π log 2` | lower boundary value on the cut, as documented |
| `singleValued` | `n=3`, `z = 1, −1, 0`; `n=2`, `z = 1, −1, 0.3+0.7i` | `L₃(1) = 1.202056903160 = ζ(3)`; `L₃(−1) = −0.901542677370 = −3ζ(3)/4`; `L₃(0) = 0`; `L₂(1) = L₂(−1) = L₂(0) = 0`; `L₂ − D = 0.0e0` at `0.3+0.7i` | parity projection and `B₁ = −1/2` confirmed |
| `blochWigner` | `z = i, −i, 2, 0, 1` | `D(i) = G`, `D(−i) = −G`, `D(2) = 0` (needs `Im Li₂(2) = −π log 2` against `arg(1−2)·log 2 = +π log 2`; the upper boundary value would give `2π log 2`), `D(0) = D(1) = 0` | cut convention consistent |
| `lobachevsky` | `θ = π/2, π/4, π, 3π/4` | `Λ(π/2) = −1.3e−15`, `Λ(π/4) = 0.457982797089 = G/2`, `Λ(π) = −1.5e−14`; duplication residual `Λ(π/2) − 2Λ(π/4) − 2Λ(3π/4) = 3.7e−15`; with `log|sin t|` instead the values at `0.7` and `0.7+π` are `0.9689` vs `3.1097` (not periodic) | factor 2 inside the logarithm is essential |
| `blochWigner_lobachevsky` | `z = i, 0.3+0.7i, −2+0.5i, 3+4i, 0.5+0.1i` | angle sums `/π = 1.000000000000`; `D` and `ΣΛ`: `0.915965594177`, `0.981810571427`, `0.154094234426`, `0.459308331303`, `0.271074446899` (each pair equal to 12 digits) | pass; see R04 for `Im z ≤ 0` |
| `idealRegion` | `z = i`, column over `w = (1+i)/4` | `c = (1+i)/2`, `R² = 1/2`, `|w−c|² = 1/8`, minimal height `√(3/8) = 0.612`: `h = 1, 2/3` in; `h = 0.1, 0.6` out | matches the README Check |
| `idealTetrahedron_volume` | `z = i, 0.5+0.8i, −i` (1500² midpoint grid of the column integral `1/(2h_min²)`) | `0.917178` vs `D(i) = 0.915966`; `1.012613` vs `1.012875`; `−i`: `−0.917178` vs `−0.915966` | agreement to the grid error (0.1%); sign for `Im z < 0` right; diagnostic only, not a proof |
| `idealRegion_finiteVolume` | cusp at a finite vertex; cusp at ∞ | near a vertex `h_min² ≈ 2Re(w c̄) ≳ |w|`, so `∫ dh/h³ = 1/(2h_min²) ≲ 1/|w|`, integrable in the plane; at ∞ `∫_H^∞ h⁻³ = 1/(2H²)` | finite |
| `blochWigner_kummer` | `z = i, 0.3+0.7i, −2+0.5i, 3+4i, 0.5−0.4i, 2.5, −0.7` | both sides equal to 12 digits at all seven points (e.g. `0.981810571427`, `−0.827876239722`); the variant with the middle argument inverted gives `0`, `0.0658`, `−0.5426`, `1.0681`, `0.1516` instead | the displayed three arguments are the right ones |
| Five-term relation (`FiveTermFunction` shape) | `(x,y) = (2+i, −0.5+0.3i)`, `(0.3, 0.8)` | residuals `−5.3e−15`, `−7.5e−15` | pass |
| `TrilogRelationFunction`: inversion, three-term | `x = 2+i, 0.3−0.7i, 2, −1` | `L₃(x) − L₃(1/x) ≤ 1.1e−14`; `L₃(x)+L₃(1−x)+L₃(1−1/x) − ζ(3) ≤ 1.5e−14` | pass |
| `TrilogRelationFunction`: 22-term block | `(a,c,d) = (2+i, 0.3−0.7i, −1.5+0.4i)`, `(2,2,2)`, `(1,1,1)`, `(0.5+0.5i, 3, −2+i)`, `(−1, 2, 1/2)` | residuals `8.2e−14`, `3.8e−14`, `1.3e−14`, `2.5e−13`, `−7.8e−15`; with `+b(acd)` in place of `b(−acd)` the first instance gives `−0.9058` | the Lean's relation is a true functional equation of `L₃` |
| §3.1 raw sums (exact) | `R(1,1,1)`, `R(2,2,2)`, `R(1,1,3)` | `R(1,1,1) = 3[1]+4[−1]` (period `3ζ(3) − 3ζ(3) = 0`); `R(2,2,2)`: `+3` at `3, 3/4, 2, 1/2, −2`, `−3` at `3/2, 1/4, 1`, `+1` at `−8`; `R(1,1,3)` mod inversion `= 4[3]+4[−3]−[9]` | all three README Checks exact |
| `IsCycle3`, `unitVector` | `[1]`, `[3]`, primes 2, 3, 5 | `u(1) = 0`, so `[1]` is a cycle; `[3]` has boundary `(u₂∧u₃)⊗u₃`, detected by valuations; the valuation matrix on `u(2), u(3), u(5)` is `I₃` (the file's proved example) | predicate neither vacuous nor universal |
| `normalizedPeriod` | ℚ, `n=3`, `c = 2[1]`; ℚ(i), `n=3`, `c = [1]`; ℚ `n=2,4`; ℚ(√2) `n=2` | `2.404113806319 = 2ζ(3)`; `Z₃/ζ_{ℚ(i)}(3) = 16.0` (uses `ζ_{ℚ(i)}(3) = ζ(3)π³/32`); `π²/ζ(2) = 6.0`, `π⁴/ζ(4) = 90.0`; `(π⁴/√8)/(π⁴/(48√2)) = 24.0` | exponents `n(N−d)` and `√|disc|` right |
| Row/exponent conventions | odd `n`: `d = r₁+r₂`; even: `d = r₂` | `n(r₁+2r₂−r₁−r₂) = nr₂`; `n(r₁+2r₂−r₂) = n(r₁+r₂)` | matches §4.4 Check |
| `zagierExistence_totallyRealEven` | unfold at `ι = Fin 0` | `det = 1`, statement `π^{nN}/√D = qζ_F(n)`; supplier's `√D·ζ_F(n) = q′π^{nN}` with `q′ = 1/q` | identical statements (R01) |
| `ellipticCharacter` | square lattice; `γ = 1, i`; `z = i/4, 1/4, 0.3+0.2i`, `+ (2−3i)` | `χ₁(i/4) = i`, `χᵢ(1/4) = −i`, `χ₁(1+i/4) = i`; `χ_{1+i}(0.3+0.2i) = 0.809−0.588i` before and after translating by `2−3i` | unitary and lattice-periodic |
| `ellipticTrilogSummand` | triad `(1, i, −1−i)`, `x=y=z=0` | `(conj(−1−i) − conj(i))/(1·1·2) = (−1+2i)/2`, norm `1.118033989 = √5/2` | matches the Check |
| `ellipticTrilogKernel_summable` | largest scale `R`, smallest `s ≤ R` | second-largest `≥ R/2` (sum zero), so summand `≤ 2R/(s²R²R²/4) = 8/(s²R³)`; `O(s²R²)` triads; `O(1/R)` per pair, `O(log R/R)` per `R`; `Σ(j+1)2^{−j} = 4` | converges |
| §2.3 trace calibration (exact) | `X=E₁₂, Y=E₂₁, Z=E₂₂`; `X,Y` swapped | `Alt₃Tr = −3` (nonzero terms `Tr(XZY)=Tr(YXZ)=Tr(ZYX)=1` with sign `−`); swapped `+3`; `C₂ = −3/2`, `Φ₃ = 1/2` | G04's claimed value `1` for `⟨C₂,E₂⟩` fails |
| §2.2 normalized plus/Q | units of 𝔽₅ | inverse transpose `2 ↦ 3`, inversion `3 ↦ 2` | GeneralAlgebraicKTheory §3.14 agrees |
| §2.5 partial sums | `S₃(i)`, `S₆(i)` | `8/9`, `209/225` | pass |
| §3.4 projected ratio (exact) | moment curve `t = 1,2,3,5,7` | `r(1|2345) = 6/5`; last two swapped `5/6` | order pinned |
| §3.5 triangle parameter (exact) | `(e₂,e₁,e₃,e₁+e₂,e₁+e₃,e₂−z e₃)`, `z = 2, 1` | determinants `(2,−2,2,−1)`, parameter `2`; at `z=1`: `(1,−1,1,−1)`, parameter `1` | matches |
| §3.5 `r₄` witness (exact) | `(1,8,2),(7,3,11),(1,3,2),(9,4,3)` | determinants `−15, 591, 75, −201`; `−3·Alt₄(u|123|∧u|124|∧u|134|) = 18·u(5)∧u(67)∧u(197)` | coefficient `18` as stated |
| §3.5 lower deletion square (exact) | moment curve `1,2,3,5,7` | `δr₅ = 36·u(2)∧u(3)∧u(5)`; `r₄∂ = Σᵢ(−1)^i r₄(delete i) = 36·u(2)∧u(3)∧u(5)` | `δr₅ = r₄∂` with coefficients `1` and `−3` |
| §3.5 triple ratio (exact) | `(1,2,3,5,7,11)`; `(e₁,e₂,e₃,(1,1,1),(1,2,3),(1,3,2))` | `10/9`; `1` | the generic tuple with `T = 1` exists |
| §3.6 Gale dual (exact) | `(I₂|B)`, `B = ((1,1),(2,3))` | `(I₂|B)·(−B; I₂) = 0₂`; dual columns `(−1,−1),(−2,−3),(1,0),(0,1)` | matches |
| §4.7 Rudenko presentation over 𝔽₃ | pair `(x₁,x₂) = (2,2)` | `x₃ = (1−2)/2 = 1`, `x₄ = (2+2−1)/4 = 0`, `x₅ = 1` so the relation is `2[2]+[1]+[0]+[1] = 2[2]`; `[−1] = 0` rationally; supplier's `P(𝔽₃) = ℤ[−1]` | the adapter is needed exactly as stated |
| §5.13 tame symbols | `f = t`, `g = t−a` on ℙ¹ | at `0, a, ∞`: `(−a)⁻¹`, `a`, `−1`; signed product `1`, unsigned `−1` | pass |
| §5.14 residue | `t∧(t−1)∧(t−3)` | residues at `0, 1`: `0` (torsion), at `3`: `u(3)∧u(2)`, at `∞`: `0`; total `−u(2)∧u(3) ≠ 0` | a Bloch-kernel-valued `h` cannot satisfy the first triangle |
| §5.14 current identity (symbolic) | `a = log|1−f|`, `b = log|f|`, `c = log|g|` | `dρ₂` smooth part `= −a dθ_f∧dθ_g + b dθ_{1−f}∧dθ_g − (2/3)c da∧db + (1/3)(a db − b da)∧dc`; the README's `r₂((1−f)∧f∧g)` expands to the same using `da∧db = dθ_{1−f}∧dθ_f` on a curve; Dirac part `2πΣ v_x(g)D(f(x))δ_x` | `d[ρ₂] = 2πΣ v_x(g)D(f(x))δ_x + [r₂]` holds with the README's `r₂` (and `P₂ = Σ v_x(g)D(f(x))`) |
| §5.18 Fourier coefficient | `γ ≠ 0` | `Δχ_γ = −4π²|γ|²/A²·χ_γ`, `Δlog|f| = 2πΣnᵢδ_{aᵢ}`, `δ_a` has `μ`-coefficients `χ̄_γ(a)` and density factor `1/A`: `c_γ = −A·div(f)(χ_{−γ})/(2π|γ|²)` | matches |
| §5.18 pairing constants | one triad `γ₁+γ₂+γ₃ = 0` | `∂χ_γ = (πγ̄/A)χ_γ dz`; `dz∧dz̄ = −2iA μ`; product of three coefficients `−A³/(8π³)`; total `(−2πi)(−A³/(8π³))(γ̄₃−γ̄₂)/Π|γ|² = iA³/(4π²)·(kernel coefficient)` after `γ ↦ −γ` and antisymmetry in the last two slots; `×(−4/3) = −iA³/(3π²)` | matches both displays |
| §5.18 factor `−4/3` (Stokes) | `ω = dz`, `g` holomorphic | `darg g∧dz = i dlog|g|∧dz`; `∫D(f)darg g∧dz = −i∫log|g| dD(f)∧dz`; `dD(f)∧dz = −iα(1−f,f)∧dz`; so `∫D(f)darg g∧dz = −∫log|g|α∧dz`, plus `−1/3` | `−4/3` |
| §6.1 Leopoldt witness | `ℚ(√2)`, `p = 7` | `10² ≡ 2 (49)`, `11⁶ ≡ 15 (49)`, `v₇(ε⁶−1) = 1` | `log ε ≠ 0` |
| §6.2 derivative formula vs finite differences | `(z,v) = (1/2,1), (2,1), (−1,1), (i,i), (i,1), (0.3+0.7i,1), (0.3+0.7i,i), (−2+0.5i, 0.6−0.8i)` | formula / central difference: `0.640604019/0.640604027` (`= (4/3)log²2`), `−0.160151005/−0.160151005` (`= −(1/3)log²2`), `0/1e−9`, `0/−1e−9`, `0.915965594/0.915965590`, `1.203080508/1.203080502`, `−0.524388596/−0.524388601`, `−0.106623968/−0.106623967` | PolylogarithmFunctions §4.8's formula as restated holds |
| §6.2 `ρ₂({z}₂⊗z) = −dL₃(z)` | term by term | `D(z)Im(v/z)` matches; `−(1/3)log|z|(log|1−z|Re(v/z) − log|z|Re(v/(z−1)))` matches the second term of `−dL₃` | identity |
| R01 | see above | | duplicate of the supplier's statement |
| R02 | `ORDER.txt` | Polylogarithms 283 < PadicHodgeRegulators 304 | ownership direction fixed by the order |
| R04 | `z` with `Im z < 0`; `z = 0, 1, 2.5, −0.7` | Lobachevsky identity by oddness and the junk values listed; Kummer right side `0` at `z = 0, 1` and at real `z` | hypotheses superfluous for truth |

## Not verifiable

- G95 (1.16)–(1.17), the coordinate 22-term relation, and (1.6), (3.5), the §3 restatement at p.263 and diagram (5.20) are OCR-garbled in the only legal copy (author's scan). The relation itself was verified numerically as a functional equation of `L₃` (five instances, residual ≤ 2.5e−13) and GR §5.1 states its equivalence with relation Q3; the misprint the README attributes to p.263 (an extra `(1/3)η` term) cannot be read in the scan.
- G95 §9.2's parenthetical (“Unpleasant computation of higher differentials … shows that `ker(ℚ[P¹] → B₂(F)⊗F*)` maps to `H₅(PGL₃(F),ℚ)`”, lines 3481–3485) is the source's only support for cycle lifting; the roadmap owns that computation in §3.8 and marks the every-family headline as resting on it. This review did not verify the lifting; it verified that the README states exactly what the source does and does not display.
- D96 Theorem 3.3 leaves `c₃ ∈ ℚ*` unspecified; the README's `−4/3` was derived here, not read.
- The exact Borel scalar of §2.3 (`borelCalibration_two`) and §3.7 (`rationalRegulatorCalibration_three`), the Green/Wang integrability estimates and the common logarithmic regularization of §5.18 are proof obligations the README names; the computations above check their stated witnesses, not the obligations.
- Ownership was checked against main, the sibling checkouts and the 441 open pull requests the roadmaps service indexes; unpublished board designs other than ZagierConjecturePolylogarithms (a package in the merge order) were not inspected.

## Source issues

- **Misprint** in G04 at equation (13), printed p.14: the source bounds the sum by `2j+1 ≤ 2m+1`; it should be `2j+1 ≤ m` (otherwise nonexistent arguments and negative factorials); affects a stated result.
- **Error** in G04 at Theorem 5.7, proof, printed p.45: the source says the cocycle `C₂ = (1/2)Alt₃Tr` takes the value `1` on `e₁₂∧e₂₁∧e₂₂`; with its own definition (64) the value is `−3/2`; affects the proof.
- **Error** in G04 at Lemma 6.9, printed p.57: the source states `∫r₂((1−f)∧f∧g) = −Σ v_x(g)L₂(f(x))` while its (84) integrates to `−2πΣ v_x(g)L₂(f(x))`; a factor `2π` is missing; affects a stated result.
- **Misprint** in G95 at §5.2 case (e), printed p.287: the source defines `M₃` on a generic tuple by `Σ(−1)^i M₃(…, a)` with `a` last; together with relation (R2) this forces `2M₃ = 0`; the coefficients should be `−(−1)^i` (or `a` placed first); affects the proof.
- **Gap** in G95 at §9.2, printed pp.310–311: the source asserts that the higher differentials of the configuration spectral sequence give the lift of every cycle to `H₅(PGL₃(F),ℚ)` without displaying them; it should justify the higher differentials and degenerate rows; affects the proof.
- **Misprint** in BFT at (6.15), printed p.20: the source gives the mixed regulator the degree `2p−m`; it should be `2p−n−m`; affects a stated result.
- **Misprint** in BFT at (4.8), printed p.8: the source writes the cycle map as `ρ(z) = (f₁(z),0,0)` although `f₁(z)` lies in the second summand `H_p`; it should be `(0,f₁(z),0)`; affects nothing.
- **Misprint** in D96 at equation (28), printed p.21: the source writes `d arg|f|` and `d arg|1−f|`; it should be `d arg f` and `d arg(1−f)`; affects nothing.
