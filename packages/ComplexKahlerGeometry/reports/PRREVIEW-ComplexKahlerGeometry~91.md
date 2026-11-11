# Review of ComplexKahlerGeometry (pull request #1807 at d524e59)

**Verdict:** needs changes

## R01 (P2) — The two-roadmap cycles with RealAnalyticGeometry and PseudodifferentialOperators remain (previous R01, not repaired)

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md`:
- 111–114: "RealAnalyticGeometry R0–R5 … consumes K1–K4, K5a's local estimates, K5b.0 and K6.0";
- 104–106: "PseudodifferentialOperators P1.0 … after K5a's initial density-line construction";
- the contracts at 313–317 and 331–335.

**Claim.** 3.4 and 6.4 consume RealAnalyticGeometry R1 and R5, and 5.1, 5.4 and 5.7 consume PseudodifferentialOperators P1.0. Both roadmaps also consume this one, so in each pair supply runs both ways.

**Witness.** On main, `RealAnalyticGeometry/README.md` line 22: "Consume ComplexKahlerGeometry K3.0's … K4's Chern connection … K6.0's … CK K5a's". `PseudodifferentialOperators/README.md` line 91: "From TauCetiRoadmap.ComplexKahlerGeometry. K5a supplies bundle…".

**Repair.** As in the previous review:
- Move 3.4's finite regular-piece partition, and 6.4's triangulated integral class with its integration comparison, to "ComplexKahlerGeometry, Part II", placed after RealAnalyticGeometry. Then delete the RealAnalyticGeometry contract.
- Move P1.0's differential-operator carrier, Laplace-type predicate, symbol and formal-density-adjoint maps into K5a, and have PseudodifferentialOperators P1.0 cite K5a. Then delete the PseudodifferentialOperators contract.

## R02 (P3) — K7.1 and AlgebraicTopology §4.6 each repeat Tau Ceti's Hausdorff proof on Mathlib's instance, one field each

**Location.** README 2722–2723: "Prove the four on Mathlib's instance by the same arguments, which use the topology only through the open quotient map from the nonzero vectors."

**Claim.** K7.1 now proves Hausdorffness of Mathlib's `ℙ ℂ (Fin (n+1) → ℂ)`. Its supplier, AlgebraicTopology §4.6, proves the same statement for ℝ by the same argument. The field-general statement therefore has two partial owners and no general one.

**Witness.** `AlgebraicTopology/README.md` 1836–1845 at this head: "Prove that Mathlib's quotient topology on `Projectivization ℝ (Fin (n+1) → ℝ)` is Hausdorff … Tau Ceti's argument repeated on Mathlib's instance". Tau Ceti's `instT2Space` (`Topology/Algebra/Projectivization.lean:188`) covers every field with `SeparatingDual`.

**Repair.**
- In AlgebraicTopology §4.6 (a folder of this pull request), state Hausdorffness of Mathlib's `ℙ K V` at the generality of `instT2Space`, with ℝPⁿ as an instance.
- In 7.1, replace "Prove the four on Mathlib's instance by the same arguments" with "Take Hausdorffness from AlgebraicTopology Stage 4.6, and prove the other three on Mathlib's instance by the same arguments".
- Add 4.6's Hausdorff criterion to the AlgebraicTopology contract (321) and to 7.1's *Needs:*.

## R03 (P3) — 7.1 still calls the Riemann-sphere comparison cited after telling K7.1 to restate it

**Location.** README 2778: "The Riemann-sphere comparison is Tau Ceti's and is cited:". At 2786–2787 the change adds: "this diffeomorphism is stated on Tau Ceti's copy of the topology; restate it on Mathlib's instance by the same proof". *Needs:* at 2799–2803 lists the module as consumed outright.

**Claim.** The pinned comparison cannot be used on Mathlib's instance. The restated diffeomorphism is therefore K7.1's own target, yet the paragraph opens by calling it cited.

**Witness.** At the Tau Ceti pin, `Instances/OnePoint/Projectivization.lean:10` imports `Instances/Projectivization.lean`. That file's line 10 imports Tau Ceti's `Topology/Algebra/Projectivization`, which redeclares `instTopologicalSpace` (`:90`). README 2741–2742 concedes that the module does not import with Mathlib.

**Repair.**
- At 2778, replace "The Riemann-sphere comparison is Tau Ceti's and is cited:" with "Tau Ceti proves the Riemann-sphere comparison on its own copy of the topology:".
- At 2799–2803, write "Tau Ceti's projectivization instances, affine atlas and Riemann-sphere comparison (`TauCeti.Geometry.Manifold.Instances.Projectivization`, `TauCeti.Geometry.Manifold.Instances.OnePoint.Projectivization`), whose proofs 7.1 repeats on Mathlib's instance, and its sphere-quotient model (`TauCeti.Topology.ComplexProjectiveSpace.Basic`)".

## R04 (P3) — The new 5.4 locator is for compact manifolds, but the sentence it supports is Euclidean

**Location.** README 1821–1823: "Prove continuous embeddings H^s→C^k for s>k+n/2 and supported Rellich H^s→H^r for every real r<s (Demailly, Chapter VI, (2.1)–(2.2), p. 289, in integer orders; …)".

**Claim.** This sentence is about ℝⁿ: the roadmap patches the results to compact bundles only afterwards (1826). Demailly states (2.1)–(2.2) only for bundles over a compact Riemannian manifold.

**Witness.** demailly-agbook line 14232: throughout the section, (M,g) is a compact Riemannian manifold. Line 14239: `W^k(M,F)⊂C^l(M,F)` for `k>l+m/2`. Line 14240: `W^(k+1)(M,F)→W^k(M,F)` is compact.

**Repair.** Replace the parenthesis with "(Demailly, Chapter VI, (2.1)–(2.2), p. 289, states the integer-order forms on a compact manifold, which the patching below recovers; the Euclidean and real-order forms are this roadmap's own)".

## Previous findings

- R01 — not repaired: README 111–114 is unchanged: "RealAnalyticGeometry R0–R5 … consumes K1–K4, K5a's local estimates, K5b.0 and K6.0". So are the P1.0 contract (313–317) and the R0–R5 contract (331–335). Carried as R01.
- R02 — repaired: 3359–3360 "regraded by AlgebraicTopology Stage 5.0's reindexing of decreasing filtrations, through the increasing filtration `G_t=F^(−t)`". The contract (323), *Needs:* (3386) and Layer 8 Dependencies (3528) add Stage 5.0.
- R03 — repaired: 3554–3556 "C2.4a consumes K7.1's projective atlas and C7.6 K7.1's comparison of `TauCeti.ComplexProjectiveSpace 1` with `Projectivization ℂ (Fin 2 → ℂ)`; MorseTheory uses K7.1 and K7.2, and GeneralizedCohomology K1 and K7.1."
- R04 — repaired: 2716–2723: Tau Ceti "declares the same coinduced topology a second time … no pinned library states them on Mathlib's instance". The contract (321) cites "4.6's cells of ℂPⁿ on the sphere-quotient carrier". The repair introduced R02 and R03.
- R05 — repaired: 1052–1055 (II (6.1), (4.2); I (3.28)), docstring 304, 2552–2557 (III (2.6), (2.7)), 3287–3288 (VI (4.7)). 1.2 (450–451) and 2.4 (719–720) are now "this roadmap's own". 5.4 is located, but see R04.
- R06 — repaired: `Suggested.lean` 89–94: "the pins have the quotient manifold … (Mathlib's `MulAction.instChartedSpaceQuotient`, Tau Ceti's `instIsManifoldQuotient`) … do not prove the `ProperlyDiscontinuousSMul`, `IsCancelSMul` and `ContMDiffConstSMul` instances".
- R07 — repaired: 3370–3372: "the Euler-characteristic identity `Σ_k(−1)^k b_k=Σ_(p,q)(−1)^(p+q)h^(p,q)` on every compact complex manifold … (Demailly, VI (11.7), p. 323)".
- R08 — repaired: description: "CharacteristicClasses C1.5a, C2.4a and C7.6 replace AlgebraicTopology as consumers (of C1.5's comparison, K7.1's atlas, its ℂP¹ model comparison)". This matches README 2938 and 3554–3556.

## Verified sound

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| 3.5 Hartogs across `dimℂ A ≤ n−2` (II (6.1) p. 105, (4.2) p. 91) | n=2: A={0}; A={z₁=0} | codim 2: (6.1) gives local boundedness, (4.2) the extension; codim 1: f=1/z₁ has \|f(t,0)\|=1/\|t\|→∞ | holds; locator right |
| `hartogs_extension_across_point` docstring (I (3.28) p. 28) | n=2, K={p}; n=1, f=1/z | ball∖{p} connected (real dim 4), extension; ℂ∖{0} with 1/z unbounded, excluded by `2 ≤ finrank` | holds; none |
| 5.4 embedding and Rellich (VI (2.1)–(2.2) p. 289) | n=2, k=0, s=1; r=s | u=χ·log log(1/\|x\|): ∫\|∇u\|²=2π∫dr/(r log²(1/r))<∞, u unbounded, so margin strict; identity not compact at r=s | statements hold; setting differs, R04 |
| 6.4 Lelong mass (III (2.6)) and Stokes as d[A]=0 ((2.7), p. 140) | {xy=0}⊂ℂ²; cusp (t²,t³) | mass in unit ball π+π=2π; cusp area over \|t\|<1: 2π(1+3/2)=5π; (2.7) is closedness of [A] | holds; none |
| 7.1 the four properties on Mathlib's instance | (1,2),(2,4); (1,0),(0,1); n=0 | minors 1·4−2·2=0, one point; 1·1−0·0=1, two points; ℂP⁰: `rank_ℝ ℂ=2>1`, path-connected | true; R02 |
| 7.1 Riemann-sphere comparison | pinned imports | `OnePoint/Projectivization.lean:10` → `Instances/Projectivization.lean:10` → Tau Ceti `:90`, clashing with Mathlib `:44` | must be restated; R03 |
| 7.9 Hopf surface (VI (4.7) p. 297) | z↦2z vs λ=1/2 | same Γ; `b₂(S¹×S³)=1·0+1·0+0·1=0`; Kähler needs `[ω]≠0` in H² | holds; none |
| 8.1 regrading by AT §5.0 | (p,q)=(1,0); d₁ out of (0,0) | native page 2 at (3,−2): degree 1, piece `G₋₁/G₋₂=F¹/F²`; (1,−1)→(3,−2), shift (+2,−1) = native d₂ | agrees with AT 2185–2189; none |
| 8.1 Euler identity (VI (11.7) p. 323) | Iwasawa; Hopf; ℂP² | 1−4+8−10+8−4+1=0=1−5+11−14+11−5+1; Hopf 1−1+0−1+1=0 both sides; 3=1+1+1 | holds; none |
| Hopf docstring, `Suggested.lean` 89–94 | `zpowers 2 ≤ ℂˣ` on `{v // v≠0}` | `Units.instMulActionSubtypeNeOfNat` exists; `ContinuousConstSMul` synthesizes; `IsCancelSMul`, `ProperlyDiscontinuousSMul` fail | claim right; none |
| Consumer bullet, 3554–3556 | CC, GC, MorseTheory at this head | CC 272–275 (C7.6 comparison), 1560 (C2.4a atlas); GC 420 "K1 and K7.1"; MorseTheory 479 K7.1–K7.2 | right; none |
| R01 cycles | RAG, PDO on main | RAG 22 consumes K3.0, K3, K1/K2, K4, K6.0, K5a; this README 333 consumes R1, R5; PDO 91 consumes K5a, 315 consumes P1.0 | fails; R01 |
| R02 Hausdorff ownership | AT 4.6 vs 7.1 | AT 1836–1845 proves ℝPⁿ by 2×2 minors; 7.1 2722 proves ℂPⁿ "by the same arguments"; `instT2Space` is field-general | two partial owners; R02 |

The rows for untouched statements and headline theorems stand as in the previous review, of `806b373`.

- Gate: the worker's gate at d524e59 passed (every scanner 0, depcheck 0, build 0). Rerun without the pull request's folder list, every scanner is 0. `outside-folder` lists only the 24 files of the 12 folders the brief names as this pull request's own, and `git diff --stat` excluding them is empty.
- Dependency check: `depcheck: 206 roadmaps, 1919 edges, 0 problem(s)`. It does not detect R01's two-roadmap cycles, whose roadmaps are all on main.
- `lake env lean` on `Suggested.lean`: 27 warnings, all `declaration uses sorry`, in 17 s. Only two docstrings changed, so the 36 elaborated signatures and the previous binder check stand. The four flagged definitions drop only unused instance binders.
- Source locators checked against the text (9): Demailly I (3.28) p. 28; II (4.2) p. 91 and (6.1) p. 105; III (2.6), (2.7) p. 140; VI (2.1), (2.2) p. 289, (4.7) p. 297, (11.7) p. 323.
- Library at the pins: Mathlib `Topology/Algebra/Projectivization.lean:44–85` has only the topology and the open quotient map, and Mathlib has no `T2Space`/`CompactSpace (ℙ …)` instance. Also opened: Mathlib `Geometry/Manifold/Instances/Quotient.lean:36–50`; Tau Ceti `Topology/Algebra/Projectivization.lean:90, 149, 188, 215, 251`, `Instances/OnePoint/Projectivization.lean:10, 140` and `Instances/Quotient.lean:200–242`.
- Cross-roadmap citations resolved at this head: AlgebraicTopology §4.6 (1815–1904), §5.0 (2149–2199), the Stage→Layer map (985–1017) and its consumer line 5354; CharacteristicClasses 264–275, 1555–1560, 1625–1631, 1748–1752; GeneralizedCohomology 418–421; MorseTheory 476–479. Overlaps: the merge-order block orders #1808 and #1854 after this pull request, and no id is dropped.
- Pull-request text: the ComplexKahlerGeometry bullet (consumers, the §5.0 regrading, K7.1's restatement on Mathlib's topology, locators, the Euler identity) and "ComplexKahlerGeometry's changes only in comments" match the head.
- Remark (untouched text): Layer 7 Dependencies (3326) still says 7.1 "uses … Tau Ceti's projectivization instances and affine atlas", although 7.1 now repeats their proofs.

## Not verifiable

- webster-nn, hormander-alpdo1, wells-dacm, griffiths-harris, koszul-malgrange, nomizu-nilmanifolds and raghunathan-discrete-subgroups are uncertified in the manifest, and no changed passage cites them.
- Ownership against ComplexComparisonPartII (#848) and SmoothBundlesConnections (#2127) was not checked: the index gives no checkout for either.

## Source issues

- **Misprint** in demailly-agbook at Chapter VI, (4.7), p. 297: the source requires only λ < 1 for the ratio of the homotheties generating Γ; it should say 0 < |λ| < 1, since λ = 0 and λ = −1 give no infinite cyclic group; affects nothing.
