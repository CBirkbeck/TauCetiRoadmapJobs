# Review of ChowFormsAndHeightsOfSubvarieties (pull request #2891 at d8ade8a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. The statements of 5.1, 6.1 and 6.2 were recomputed on this head, including what the repair added: the bound `(N/2)·log N` for the height of `ℙ^{N−1}`, the `d = 0` case of 5.1, the new supplier citations (all resolve and say what the contracts say), and the [FormalProof] locators (every cited file and declaration exists, and the statements opened have the sign and constant of the README). Five small corrections and one format note remain, none blocking. The human reviewers have Bost–Gillet–Soulé (not readable), the statements with no published source, and the standing of the formal proof to decide.

## C01 — The References say [FormalProof] has "the decomposition and the bound of (a7)", but 6.2 (a7) names no file or declaration of it

The Conventions (lines 21–24) say that where a target names [FormalProof], the form the proof establishes is recorded at the target. In 6.2 the proof is located for (a1), (a4), (a6) and (b) (lines 341–345, 350–353, 366–368, 371–372), but neither the statement of (a7) (lines 307–318) nor its route (lines 373–393) names it. A reader cannot tell which declaration is meant, nor whether its bound is `(N/2)·log N`. In the route of (a7), give the file and declaration as for the other parts, or remove "the decomposition and the bound of (a7)" from the [FormalProof] entry (line 569).

## C02 — Bost–Gillet–Soulé is credited for the identity of 6.1 and for the exact height of `ℙ^{N−1}` with no theorem or page

The Summary (lines 3, 5), 6.1 (lines 116–117), 6.2 (a7) (lines 316–317) and the References (line 566) name the paper without a locator, so neither attribution can be checked; no legal copy could be read for this review either, so none is proposed. When a copy is available, add theorem and page at the two claims. Meanwhile (a7) need not lean on the citation: the recursion of its own route, for `J̄ = Ō_K^N` and a basis vector `u` (so `Σ_σ log ‖u‖_σ = 0`), reads `h(ℙ^{N−1}) = h(ℙ^{N−2}) + ½·H_{N−1}`, which gives `½·Σ_{m=1}^{N−1} H_m` (`½`, `5/4` for `N = 2, 3`), and (a7) could say so.

## C03 — The parenthesis "for the sup metric the torus measure is the right one" in the first Check of 6.1 holds on `ℙ¹` only, and the bullet opens with a point of `ℙ^n`

The bullet (lines 220–224) starts with a `K`-rational point of `ℙ^n` and ends with this parenthesis, citing the Mahler formula of ArithmeticDynamics §4.29, a statement about the minimal polynomial of one algebraic number. On `ℙ¹` it is right: the torus mean of `log |au_0 + bu_1|` is `log max(|a|, |b|)` by Jensen. For `n ≥ 2` it fails: `[1:1:1] ∈ ℙ²(ℚ)` has sup-metric height `0`, and the torus Mahler measure of `u_0 + u_1 + u_2` is `0.3230…` (Smyth's value `L′(χ_{−3}, −1)`). Write "for points of `ℙ¹` with the sup metric …".

## C04 — The description's sentences on sources and on suppliers describe an earlier head

"§5.1 and §6.2 cite no published statement": at this head 6.2 (lines 348–349) says none is cited "other than the exact value of the height of `ℙ^{N−1}` in (a7)", credited to Bost–Gillet–Soulé. "Its suppliers are HeightsRationalPointsAndObstructions and SlopesOfHermitianVectorBundles, … and AlgebraicModuliForArithmeticGeometry, ArakelovGeometryAndAbelianHeights and ComplexComparisonPartII": the head adds four suppliers on main, each with a contract (lines 544–558) and in the *Needs* of 6.1 or 6.2: ComplexKahlerGeometry K7.2, Polylogarithms §§5.2–5.3, SchemeAndStackFoundations §§3.5, 5.1, 5.2 and ResolutionOfSingularitiesCharacteristicZero §5.2; it also adds §5.17f of the first supplier. Text that would be right: "§5.1 and §6.2 cite no published statement except, in 6.2 (a7), the exact value of the height of `ℙ^{N−1}`"; and add the four roadmaps to the list of suppliers on main.

## C05 — The Downstream consumers bullet for HeightsForLogSingularMetrics omits its use of 5.1

At its head that roadmap cites "ChowFormsAndHeightsOfSubvarieties §5.1" in the *Needs* of its Layer 0 (its README lines 46 and 66) and lists 5.1 in its contract with this roadmap (its line 260, for its 0.4 (b), (c)). The bullet here (line 510) names §4.3b only, so a reader concludes that 5.1 has no consumer. Add one clause: "its Layer 0 (0.4 (b), (c)) uses the change-of-metric formula 5.1".

## N01 — `Chow.properPushforward` (line 554) is in code font, but SchemeAndStackFoundations §5.2 gives it as a prose name (italic there), and no library declaration has that name; write it as that roadmap does.

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 6.1 (iii) against Philippon91 Théorème 2, p. 256 (page image; Philippon91 line 88) | sign, constant, hypothesis | Philippon: `∫log|ρ(f)/f| = ∫_V log(|U_0|/‖x‖)Ω^{r−1} + Σ_{α≤n}1/(2α)·deg V`; README: `m(F) = m(F(s,·)) − ∫log‖s‖c_1^d − ½H_n deg Z` | same identity |
| Philippon91 Corollaire 4, p. 272 (page image; line 866) | normalisation of `Ω` | `Ω = ∂∂̄log‖x‖²/(−2iπ) = (i/2π)∂∂̄log‖x‖²`; same right side as Théorème 2 | locator correct |
| GS90 Theorem 4.2.3, p. 138 (GS90 line 1639) | subject | intersection pairing of arithmetic Chow groups on a regular arithmetic variety | as the References say |
| 6.1 headline (1), `c(d,n) = ((d+1)/2)H_n` | linear `ℙ^d ⊂ ℙ^n`; `d = n`; `n = 0` | `½Σ_{m≤d}H_m − ½Σ_{k≤d+1}(ψ(k) − ψ(n+1)) = ((d+1)/2)H_n`; `d = n`: `ht(det) = −n/2`; `n = 0`: `0 = 0` | holds |
| 6.1, degree-two point | `F = u_0² + u_1²` | height `log 2`; `m = 2(½log2 − ½) = log2 − 1`; difference `1 = c(0,1)·2` | holds |
| 6.1 (i)–(iii), vertical fibre `{X_0 = pX_1}` | `s = e_0` | `E log|2×2 minor in ℂ³| = ½(−3/2 − 1/2) = −1`; `∫log‖X_0‖c_1 = log p − ½log(p²+1) − ½`; (iii): `½log(p²+1) − log p − ¼` both sides; difference `3/2` | holds |
| 6.1, conic `X_1² = 2X_0X_2` | `ht(F_Z)` | `E log|u×v|² = ψ(2) − ψ(3) = −½`; `E log|Σz_k²|` on `S⁵`: Monte Carlo `−0.5020` vs `−½`; `ht = −1`, height `2`, difference `3 = c(1,2)·2` | holds |
| 6.1, Segre quadric | `d = 2`, `deg 2` | `E log|u∧v∧w|² = −1/3 − 5/6 = −7/6`; `E log|det| = ½(ψ(1)+ψ(2)) − ψ(4) = −4/3`; `ht = −5/2`; height `1 + 2 = 3`; `c(2,3)·2 = 11/2` | holds |
| 5.1 change of metric | `ℙ¹_ℤ`, `f = |x_0|²/‖x‖²`; `f = t`; `d = 0` | `∫f·c_1 = ½` (uniform law); `f = t`: `[K:ℚ]·t·deg`; `d = 0`: `Σ_σ f(σ) = ½Σφ` with `φ = 2f`, the supplier's §1.10 identity | holds; sign fixed by `f = t` |
| 5.1 against [FormalProof] `MetricChangeStatement` | sign | formal: tensoring with the weight `h = exp(−u)` subtracts `∫u`; section norm `|s|/h` gains `e^{u}`, so `f = −u` and `+∫f` | same sign |
| 6.2 (a7), headline (3): value and bound | `N = 1..39` exactly | `½Σ_{m<N}H_m = (N/2)(H_N − 1)` and `Σ_{m<N}H_m = N·H_{N−1} − (N−1)` (exact rationals); `≤ (N/2)log N`; `N = 2`: `½ ≤ log 2` | holds |
| 6.2 (a7), bound by successive minima | roots-of-unity points | height `½log N` (`‖(ζ_1,…,ζ_N)‖ = √N`, unit at finite places), Zariski dense, so `e₁ ≤ ½log N`; `h/((d+1)deg) ≤ e₁`, `d + 1 = N` | `≤ (N/2)log N` |
| 6.2 (a5), (b), a point | `ℚ(i)`, Gram `[[2,i,0],[−i,3,1],[0,1,5]]`, `ξ = (1,−2,3)` | `det = 23`; `ξG⁻¹ξ* = 5.347826 = 123/23` at both embeddings; `0.838345`, `0.088345`; difference `¾` | holds |
| 6.2 whole-space Check | `ℤ²` Gram `[[2,1],[1,3]]`; the `ℚ(i)` bundle | `½ − ½log5 = −0.304719`; `−½log23 + 5/4 = −0.317747 = (−1 − ½log23) + 9/4` | holds |
| 6.2 (b), conic, non-diagonal metric | Gram `[[2,1,0],[1,3,1],[0,1,5]]` | quadrature: `−0.488373` (README `−0.48838`), standard `1.604601` vs `1 + π/(3√3) = 1.604600`; Monte Carlo `m_J̄(F) = −3.4869 ± 0.0014` vs `−3.48838`, `m(F) = −1.3950 ± 0.0014` vs `−1.3954` | holds |
| 6.2 Checks on lattices and places | `M′ = ℤe_1 ⊕ 2ℤe_2`, `[2:1]`; `ℚ(2^{1/3})`, `λ = 0.3` | `max(|2|_2, |2|_2) = ½`, both sides drop `log 2`; `2·0.3·2·2/3 = 0.8`, `1·0.3·2·2/3 = 0.4` | holds |
| 6.1, 6.2 (b) against [FormalProof] `FubiniStudyChowHeight`, `formHeight` | constant | formal constant `B·δ·harmonic(N−1)/2` per embedding with `B = e + 1` blocks of `N + 1` variables: `(e+1)·δ·H_N/2` | `c(d,n)·deg Z` |
| 6.1 (ii), (iii), recursion against [FormalProof] | `ChowFormSectionVertical`, `MahlerSection`, `ChowHeightRecursion` | (ii) for integral `u`: `log|f|_v − log|f(u,·)|_v = ` vertical term; (iii): `m(f(u,·)) = m(f) + δH_{n−1}/2 + ∫` (`n` variables); recursion with `vertTerm − Σ_σ∫` | as the README says |
| C03: the parenthesis in the first Check of 6.1 | `ℙ¹`; `[1:1:1] ∈ ℙ²` | `ℙ¹`: torus mean `log max(|a|,|b|)`; `ℙ²`: sup height `0` vs torus measure `0.3230…` | true on `ℙ¹` only |
| C05: consumer's use of 5.1 | HeightsForLogSingularMetrics head, lines 46, 66, 260 | cites §5.1 in Layer 0; this README line 510 names §4.3b only | bullet incomplete |
| `Suggested.lean` | elaboration; no declaration | exit 0, no message; nothing to probe with one tactic or `#check` | holds |

- Source locators checked against the text: 3 (Philippon91 Théorème 2, p. 256, and Corollaire 4, p. 272, on the page images since the recognised text garbles the formulas; GS90 Theorem 4.2.3, p. 138), and the 11 files and 20 declarations of [FormalProof] named in the README, all found in the operator's copy of the repository; seven statements opened (`MetricChangeStatement`, `FubiniStudyChowHeight`, `formHeight`, `ChowFormSection`, `ChowFormSectionVertical`, `MahlerSection`, `ChowHeightRecursion`), and the hypothesis of the theorem cited for (a6) is discharged there (`MetricLocal.full`).
- Library declarations opened at the pins: `Polynomial.gaussNorm_mul` (`Mathlib/RingTheory/Polynomial/GaussNorm.lean:277`); `AlgebraicGeometry.AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`); `MeasureTheory.Measure.toSphere` (`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`); `Polynomial.mahlerMeasure` (`Mathlib/Analysis/Polynomial/MahlerMeasure.lean:81`); `TauCeti.height2`, `TauCeti.arakelovLogHeight` (`TauCeti/NumberTheory/Height/Arakelov/Basic.lean:65`, `:127`; relative heights, hence the division by `[K:ℚ]` in (a5)); `Chow.ChowGroup` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean`). No Chow form, Hermitian vector bundle over `O_K` or arithmetic intersection number at the pins: no headline is statable, as the docstring says.
- Cross-roadmap citations resolved (24 sections): HeightsRationalPointsAndObstructions §§5.9b, 5.17a, 5.17b, 5.17f, 5.17g and SlopesOfHermitianVectorBundles §6.6 (i), (ii), (vi), §6.7a (i) at their open heads; on main AlgebraicModuliForArithmeticGeometry §§1.1, 1.6, ArakelovGeometryAndAbelianHeights §§1.1–1.3, 1.5, 1.6, 1.10, 1.12, 1.14, ComplexComparisonPartII C5.4 (three names), ComplexKahlerGeometry K7.2, Polylogarithms §§5.2, 5.3, SchemeAndStackFoundations §§3.5, 5.1, 5.2, ResolutionOfSingularitiesCharacteristicZero §5.2, ClassFieldTheory §13.1; ArithmeticDynamics §4.29 at its open head (a comparison in a Check, not a supplier); the two consumers at their heads.
- Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run on this head passed every check; not rerun apart from the dependency check and the elaboration.
- Elaboration of `Suggested.lean`: exit 0, no message (no declaration, no `sorry`, single `import Mathlib`, no `set_option`). Signature check with `#check`: not applicable.
- Outside the folder: nothing but the family index, which belongs to this pull request.
- The roadmap is new (not on main): no layer comparison with a base README applies.

Overlap check: read HeightsForLogSingularMetrics, SlopesOfHermitianVectorBundles, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation (open) and ArakelovGeometryAndAbelianHeights (main). Spherical heights, `ν`, `ht_J̄`: owner SlopesOfHermitianVectorBundles §§6.6, 6.7a, cited. The height of cycles in `ℙ(J^∨)`, its value on the whole space and the comparison with the Chow form: owner this roadmap, cited by HeightsForLogSingularMetrics §4.3b and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.18, 8.18e. The change-of-metric formula: owner this roadmap (5.1), cited by HeightsForLogSingularMetrics Layer 0; the inequality form stays with HeightsRationalPointsAndObstructions §5.17b. Hermitian vector bundles and the Arakelov degree: owner ArakelovGeometryAndAbelianHeights. Chow forms: AlgebraicModuliForArithmeticGeometry §1.6, cited here and by MultiplierIdealsOfPairsAndPointSeparation. Nothing shared with ProjectiveModelsAndPeriodBoundsOnShimuraVarieties.

Source independence: 8 passages compared with 3 sources (6.1 (iii), its route, the Chow form of the Summary and the Philippon entry with Philippon91 lines 83–90 and 862–878 and the page images; 5.1, the Gillet–Soulé entry and the docstring of `Suggested.lean` with GS90 lines 1636–1650; the [FormalProof] and [Announcement] entries with the announcement), none shared beyond what a formula forces; the route of (iii), an averaged Poincaré–Lelong formula, is not Philippon's computation. Largest share [FormalProof], 18 of 23 locators, all file paths and declaration names, in five directories of the repository; contents compared with its directory layout and with Philippon91 (§§0–3): independent, Layers 5–6 map onto no run of either. Bost–Gillet–Soulé could not be read.

Research link: 6.1 is the comparison of Bost–Gillet–Soulé (1994) between the height of a projective cycle and the height of its Chow form; its archimedean part is Philippon's Théorème 2 (1991). It feeds the Hilbert–Samuel inequalities of SlopesOfHermitianVectorBundles §6.7a in the family that follows Alpöge's formal proof (2026). Rests on the README and Philippon91 p. 256.

## Not verifiable

- Bost–Gillet–Soulé, J. Amer. Math. Soc. 7 (1994): no legal copy found (the DOI's landing page is on a host in no licence class). The identity of 6.1 and the value of the height of `ℙ^{N−1}` were checked by computation and, for (iii), against Philippon, not against this text.
- [FormalProof]: the public repository named in the References could not be fetched through the sources service (host in no licence class); the locators were checked in the operator's copy of it. The statements were read, not built, and the definitions under them (`IsSelfInter`, `gdeg`, `ptsIntegral`, `IsChowFormInt`) were not traced, so agreement of every normalisation with the README is checked for the seven statements listed only.
- [FormalProof] for (a4), `ArShift`, and for the scheme form of 5.1, `ArMetric`: found and read; their agreement with the README's normalised statements depends on the untraced definitions above.

## Source issues

- none

## For the human reviewers

- Not tested: Bost–Gillet–Soulé (J. Amer. Math. Soc. 1994), credited for the identity of 6.1 and for the height of `ℙ^{N−1}` (README lines 3, 5, 316, 566), could not be read; wording and arrangement were not compared with it.
- Scope: 5.1 (README line 50) and 6.2 (a1)–(a7), (b) (line 348) say they are proved here and cite no published statement except the value of the height of `ℙ^{N−1}`; routes and Checks were recomputed, not matched to a refereed source.
- Scope: [FormalProof] and [Announcement] (README lines 569–570) are a Lean formalization and a four-page announcement dated 20 November 2026, fetched from its author's page; neither is refereed, and 18 of the README's 23 locators point into the formalization.
- Licence: the licence of the repository behind [FormalProof] was not determined; the README takes from it file paths and declaration names only, and `Suggested.lean` declares nothing.
