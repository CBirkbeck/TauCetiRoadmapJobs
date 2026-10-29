# Review of LocallyAnalyticDistributions (pull request #854 at 0441e08)

**Verdict:** needs changes

## R01 (P2) — Import the existing open-disc algebra

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:816`, with the targets at lines 833, 845 and 849: “An open-disc series F … means a native power series … restricted at every radius below one.”

**Claim:** §1.2 presents the generic open-disc predicate, convergence, multiplicative evaluation and coefficient-extension calculus as local work, with PadicFunctionalAnalysis §4.7 as its supplier. RestrictedPowerSeries already owns these objects and facts, at greater radius and coefficient generality. Its §7.1 is absent from this roadmap's supplier contracts. The comparison with native formal multilinear series can remain a distinct local target; repeating the coefficient algebra cannot.

**Witness:** `TauCetiRoadmap/RestrictedPowerSeries/README.md:704` defines restrictedness at every smaller radius and evaluation; lines 714–718 include coefficient maps. Its §2.1, lines 306–320, supplies convergent multiplicative evaluation and coefficient functoriality.

**Repair:** Add RestrictedPowerSeries §§7.1 and 2.1 to scope and exact contracts. Use that carrier and evaluation, deleting the duplicated generic targets. Retain the named comparison with `FormalMultilinearSeries.ofScalarsSum`, its radius assertion and any genuinely additional quantitative estimate. On the witness F=ΣTⁿ, H=1−T, t=3 over ℚ₃, the supplied evaluation gives E(F)=−1/2, E(H)=−2 and E(FH)=1; coefficient extension preserves −1/2. Thus the repair preserves precisely the downstream evaluation identities.

## R02 (P3) — Fix the failing TeX scanner

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:1449`: “‖u − π_{0,…,N} u‖ = p^(−N−1)”.

**Claim:** The underscore-brace expression occurs outside a code span. The worker's gate reports `tex=1` and `FAIL`; every other gate check passes.

**Witness:** The gate identifies line 1449 under its rule forbidding `_{` outside code. For the displayed diagonal operator, the omitted coordinates have norms p^(−N−1), p^(−N−2), … .

**Repair:** Put the projection notation in an ASCII code span, for example `pi_{0,...,N}`, or use Unicode notation. Keep the formula: its supremum is indeed p^(−N−1), including N=0, where the error is p⁻¹. This is a format repair, not a change to the estimate.

## R03 (P3) — Restore the specification's naming and layout contract

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:35`, lines 986–994 and 1032–1034; `TauCetiRoadmap/LocallyAnalyticDistributions/Suggested.lean:63` and 127. The README says API names “do not assert that those declarations appear in the companion file.”

**Claim:** That convention contradicts the required README/Lean contract. API paragraphs and Checks advertise many local Lean names that the nine-declaration file does not contain. API facts should be prose bullets; Checks should have no Lean counterpart labels. The file also spans Layers 0 and 4 without the required layer section comments. Imported results repeatedly appear as separate “supplier” target blocks instead of residing in scope/contracts.

**Witness:** `Cr`, `Cr_mahler`, `locallyPolynomial_dense_Cr` and `AnalyticDistributionTests.anisotropic_order_zero` do not occur as declarations in Suggested.lean. Its only declarations are five headline theorems and their four spectral definitions.

**Repair:** Remove the contrary naming convention and undeclared local-name labels; preserve the mathematical API as prose bullets and all discriminating Checks. Keep actual library/supplier names and the nine declared local names. Move supplier-only target blocks to the existing contracts. Add Layer 0 and Layer 4 comments in Lean. Do not add API padding to satisfy the names. The digit-doubling Check still yields ratios 1 versus 1/2 at p=3 and 1 versus 5/9 at p=2 after its label is removed; all five theorem signatures remain unchanged.

## Verified sound

The full folder was read against the repository's normative README and CONTRIBUTING. Main's PadicFunctionalAnalysis and RestrictedPowerSeries were read as shape/ownership examples. There are 305 named target blocks, four further Hyodo–Kato comparison blocks, five Lean headlines and four supporting definitions. The table below records finite adversarial computations, including deliberately excluded countermodels; these computations are not substitutes for the future proofs. No false mathematical target was established by this pass. R01 concerns ownership, R02–R03 concern the required form.

The head is `0441e08faed5d60f832c5ffc78ef04cd2b92c968`. The outside-folder diff is empty and the worktree was left unchanged. There is no sorry'd data, `set_option`, imported roadmap module, executable algorithm, or source-text file in the folder. No copied source passage was identified in the passages compared.

The worker's gate has 27 zero checks and the single `tex=1` failure in R02 (including `build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`, `sorry-data=0`). Its overall result is **FAIL**. The independently run dependency check returned:

```text
depcheck: 163 roadmaps, 1184 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Every Needs line and the supplier tables were read; no declared gap was supplied in this package. Neither the merge-order file nor the tooling was modified.

The named Tau Ceti import was built first. Direct elaboration of Suggested.lean then succeeded with exactly the five expected sorry warnings. A single scratch elaboration of `#check @name` for all nine declarations confirmed the complete signatures: the closed-disc theorem retains completeness, algebraic closedness and isometry; Hahn–Banach retains spherical completeness and both ultrametric hypotheses; Fréchet open mapping retains Hausdorffness, completeness, metrizability and the seminorm topologies; spectral convergence retains completeness, nontriviality, norm-one and ultrametricity; Tate compactness retains finite coefficient dimension and topological nilpotence. No binder correction was needed. The four definitions are total definitions; convergence and monicity enter the theorem rather than being silently assumed of junk inputs.

One-tactic scratch probes with `simp`, `rfl` and `infer_instance` closed none of the five headlines. The closest pinned lemmas were also inspected: `exists_extension_norm_eq` requires an RCLike field, and `ContinuousLinearMap.isOpenMap` requires normed Banach spaces; neither proves these signatures by one `exact`. No padding finding is raised for the five kept theorems.

The README's headline inventory is: closed-disc maximum principle; compact-type/tensor/strong-duality and three-space comparisons; Hahn–Banach and Fréchet open mapping; finite-piece, Stein and tower Hyodo–Kato comparison; topological Amice and nonsplitting; sharp one-variable and vector Amice–Vélu–Vishik extension, plus isotropic extension; Mellin algebra/geometric comparison; fixed-rank and operator spectral mapping; nilpotent-coordinate compactness; finite-slope perfect complexes, local windows, exact-slope rank/Euler constancy and Fréchet/torus comparisons. The five directly stated headlines are present. The module docstring identifies the missing carriers for the others, including the bounded formal-series algebra. Generic two-entire-input spectral mapping is explicitly supplied by CompactOperators. No stand-in headline was found.

Pinned library evidence (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`):

| Declaration opened | File and line at the pin | Relevant boundary |
|---|---|---|
| `Topology.IsStrictMap` | `Mathlib/Topology/Maps/Strict/Basic.lean:49` | Quotient map to its range; closed image is not part of this definition. |
| `FormalMultilinearSeries.ofScalars`, `ofScalarsSum_eq_tsum` | `Mathlib/Analysis/Analytic/OfScalars.lean:38`, 137 | Native total series evaluation; convergence is an additional assertion. |
| `AbstractMeasure.toCLMEquiv` | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:84` | Bounded measure duality, not the locally analytic strong dual. |
| `AbstractMeasure.amiceTransform`, `amiceTransformEquiv` | `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:76`, 157 | Integral bounded Amice theory, not unbounded locally analytic distributions. |
| `ZeroAtInftyContinuousMap` scalar structures | `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean:207`, 289, 478 | Algebraic scalar action exists; the normed-space instance is for a normed field, not an arbitrary Banach algebra action. |
| `Matrix.charpolyRev`, `Matrix.reverse_charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:290`, 292 | Native det(1−TM); rank must still be retained for reflecting back. |
| `exists_extension_norm_eq` | `Mathlib/Analysis/Normed/Module/HahnBanach.lean:43` | `IsRCLikeNormedField` at line 37 excludes the intended nonarchimedean theorem. |
| `ContinuousLinearMap.isOpenMap` | `Mathlib/Analysis/Normed/Operator/Banach.lean:228` | Banach, not arbitrary seminorm-defined Fréchet spaces. |
| `isCompactOperator_id_iff_finiteDimensional` | `Mathlib/Analysis/Normed/Operator/Compact/FiniteDimension.lean:26` | Requires locally compact coefficient field; supports the infinite-c₀ negative control. |
| `TauCeti.PowerSeries.isRestricted_of_abs_le`, `isRestricted_polynomial` | `TauCeti/RingTheory/PowerSeries/Restricted.lean:51`, 64 | Existing radius monotonicity and polynomial inclusion. |
| `TauCeti.PowerSeries.hasGaussNorm_of_isRestricted` | `TauCeti/RingTheory/PowerSeries/GaussNorm.lean:91` | Existing restricted-series norm comparison. |
| `TauCeti.PowerSeries.norm_eq_gaussNorm` | `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:76` | Existing Tate norm, with its native hypotheses. |
| `AdjoinRoot.norm_mk_eq_resultant` | `TauCeti/RingTheory/Polynomial/Resultant/AdjoinRoot.lean:284` | Monic finite quotient; zero-dimensional quotient has norm determinant 1. |
| `Polynomial.Monic.resultant_of_le` | `TauCeti/RingTheory/Polynomial/Resultant/Basic.lean:65` | Functional degree-bound independence, not independence of characteristic rank. |

Ownership was searched by objects with `roadmaps grep` and then resolved by reading the supplier files, including main and the provided open work. The namespace search returned the kept signatures only in this roadmap. Main and package searches for open-disc series, entire quotients, distribution duals, Hyodo–Kato Stein comparison and finite-slope complexes were checked against their actual ownership boundaries. In particular, `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/README.md:23` imports this roadmap’s curve/tower HK comparison; its higher-dimensional extension at line 576 consumes the finite-piece comparison, rather than supplying it. For example, `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:17` imports this analytic theory; its arithmetic applications do not make it the owner of this generic library. 

| Resolved supplier | Sections/targets and file locator | Boundary checked |
|---|---|---|
| PadicFunctionalAnalysis | `TauCetiRoadmap/PadicFunctionalAnalysis/README.md`, §§1.4, 2.1–2.6, 4.3–4.7 | c₀, Banach modules, stage/Mahler/Amice norms; general spherical Hahn–Banach remains local. |
| RestrictedPowerSeries | `TauCetiRoadmap/RestrictedPowerSeries/README.md:306`, 704, §7.2 | Native evaluation, open-disc algebra, entire division/resultants. R01 is the missing ownership link. |
| CompactOperators | `TauCetiRoadmap/CompactOperators/README.md`, §§0.1–0.4, 1.1–1.7, 2.4, 3.1–3.5, 4.1–4.3 | Output-row decay; Fredholm, Hasse projector, prescribed-rank transform and majorants. Fixed-rank B(0)≠0 adapters here are distinct. |
| RigidAnalyticGeometry | `TauCetiRoadmap/RigidAnalyticGeometry/README.md:581`, §§2.1–2.2, 7.2 | Shared slope carrier tests eigenvalue norm ≥r; this roadmap supplies geometric fibre and r=∣p∣^h comparisons. |
| PadicMeasuresIwasawaAlgebras | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`, §§0.1–0.2, 2.1–2.5, 2.11–2.12, 3.1, 3a.1 | Bounded operator calculus and pseudomeasures; extension to unbounded distributions is distinguished. |
| PadicLocalLanglandsForGL2Qp | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:207`, §0.1 | Discretely valued manifold/dual/projective-tensor theory. General complete coefficients and inductive tensor comparison remain local. |
| PhiGammaModulesAndIwasawaCohomology | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1458`, §§4.0–4.1 | Compact character spaces, finite components, scalar strong-dual Mellin and its exported interfaces. |
| AdicSpaces | `Completed/AdicSpaces/README.md:233`, §§0.5, 3.1, 5.1, 5.3 | Tate-ring series, rational localization, opens and gluing. |
| AdicSpacesPartII | `TauCetiRoadmap/AdicSpacesPartII/README.md:2759`, §§R0.5, R1.1, R1.7 | Banach completed tensors, rigid carrier and quasi-separated rigid/adic comparison. |
| AdicSpacesPartIII | `TauCetiRoadmap/AdicSpacesPartIII/README.md:10053`, §§R3.4, R3.6 | Quasi-Stein exhaustions and lattice complete continuity; mere density is not compact restriction. |
| AdicSpacesPartIV | `TauCetiRoadmap/AdicSpacesPartIV/README.md`, F1.5, F1.7, F1.11, target dagger-semistable-tube-finiteness | Weak completions, dagger spaces and finite-piece de Rham finiteness, with the supplier's stated inputs. |
| CrystallineCohomology | `TauCetiRoadmap/CrystallineCohomology/README.md`, §§CR.6.2, CR.6.5 | Log rigid/crystalline HK and proper comparison. Nonproper dagger comparison and topological limits are local. |
| ReductiveGroups | `TauCetiRoadmap/ReductiveGroups/README.md:432`, Layers 4 and 7 | Torus lattices, geometric characters, root datum and positive roots. |
| ReductiveGroupsPartII | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:1809`, §RG2.1.2 | Apartment pairing is negative valuation; local adapter negates it and retains the image lattice. |

The 15 seeded source targets were checked as follows. Source-line locators refer to the service's legal, line-numbered extractions, not to text copied into the repository. A “derived” target is assessed against its stated proof inputs; it is not claimed to be a verbatim theorem in that source.

| Sample target | Locator opened | Outcome and hypotheses |
|---|---|---|
| §0.0 | CDN-Stein lines 337–453, §§2.1.1–2.1.3 pp.7–10; Schneiders lines 908–999, Prop.1.2.27–1.2.29 pp.26–29; Schneider lines 4605–4636, §17 pp.113–114; Emerton lines 875–945, Lem.1.1.30/Prop.1.1.31–32 pp.18–19 | Nonseparated versus Hausdorff cokernels distinguished; π/ι comparison uses the stated Fréchet/compact-type conditions. Broader coefficient claims are explicit local extensions. |
| §0.2 | CN lines 2873–2952, Appendix A pp.58–59; Schneider lines 2074–2093 and 2181–2209, Prop.8.6/Cor.8.7 and Prop.9.2 pp.54–59 | Banach/Fréchet/compact-type extension hypotheses, spherical or countable-type alternatives, and HB norm preservation agree. |
| §1.2 | Colmez lines 1488–1535, Lem.II.2.1/Thm.II.2.2 p.30; native `ofScalars` above | Smaller-radius summability and geometric-tail derivations work; generic ownership still needs R01. |
| §1.3 | Colmez lines 1899–1930, §II.4 pp.36–37; manifold supplier §0.1 | Iterated analytic evaluation/convolution supported; nonabelian order is pinned by the S₃ test below. |
| §1.4 | Colmez lines 1820–1898, §II.4 pp.34–36 | Positive transpose derivative, coordinate derivative, Fourier normalization, φ/ψ and unit support agree. |
| §2.1 | Colmez pp.18–25, 29–34, especially lines 1615–1705, Thm.II.3.2; Pollack-Stevens lines 1244–1251, Def.6.1 printed p.27 | The degree threshold is N≥floor(r), equivalently r<N+1; growth uses all displayed moments. |
| §2.2 | Loeffler lines 190–257, Def.2.12/Rem.2.13/Thm.2.15 pp.4–5 | Literal simultaneous-difference definition fails the locally constant tensor test. The roadmap's tensor-wavelet replacement and explicit correction avoid it. |
| §3.4 | BCGP-II lines 1013–1018, Def.2.2.17 p.21, and 4196–4265, §§4.6.46–49 pp.93–95; RJW lines 1453–1500 and 2059–2070, Thm.3.43/Rem.3.47/5.22 | Character geometry is supplied separately; the geometric transport is derived, not asserted as BCGP's scalar Mellin theorem. Clearing denominators remain restricted to their nonzero domain. |
| §4.2 | Serre lines 273–350, Prop.7–8 pp.75–77; Buzzard lines 569–675, Lem.2.8–2.13 pp.17–21 | Serre is field-valued; Buzzard supplies Noetherian Banach-algebra/(Pr) extension, cyclicity and continuous base change. No norm isometry is inferred from mere continuity. |
| §4.4 | Coleman lines 790–814, A3.5–A3.7 printed pp.434–435; native norm-resultant above | Monic quotient, bounded Bézout coefficient and unit-resultant coprimality agree, including nilpotents and degree zero. |
| §4.8 | Buzzard lines 755–825, Prop.3.2 pp.22–24, plus lines 607–630 | Good root requires unit Hasse coefficient. Compact identity implies finite generation; finite (Pr) then gives projectivity, not freeness. |
| §4.10 | Coleman lines 710–745 and 820–853, A3.4/A3.9 printed pp.433,435–436; `Matrix.charpolyRev` and resultant-norm inputs | Rank reflection and arbitrary B(0) retained; Z/8 Jordan computation verifies the nonsplit/nonreduced case. |
| §4.13 | Coleman lines 820–853, A3.8–A3.9 pp.435–436; CompactOperators §3.3 | Fixed characteristic rank allows B(0)≠0; unbounded-rank convergence requires B(0)=0. Coefficientwise convergence alone is explicitly insufficient. |
| §4.15 | CHJ lines 894–921, Lem.2.23(2) pp.19–20; Pan lines 550–581, §2.2.1/Ex.2.2.2 p.13 | ON/tensor argument and nilpotent-coordinate compactness support the stated inputs. General infinite dual scalar extension is only a map, not an asserted isomorphism. |
| §4.16 | Pilloni lines 3837–3890, §13.1 pp.84–85, and 4017–4029 pp.87–88; Urban lines 875–929, §2.3 pp.23–24; BCGP-I lines 6714–6738 and 7356–7367, pp.139,152–153 | Corrected inclusive slope test, representative-dependent product, finite-window perfectness and rational exact-slope Euler statement. Source sign/endpoint errors are recorded below. |

Additional headline checks: GK lines 637–674 (Thm.3.4/Cor.3.7 pp.16–17), CDN-Stein lines 740–757 and 905–918 (Prop.3.2, Lem.3.4, Prop.3.12 pp.15–18), and CDN-Drinfeld lines 253–264 (§0.3 pp.6–7) support the nonproper dagger and completed/tower comparisons with their explicit strict-limit hypotheses. BTII lines 3240–3266 (§§4.2.5–4.2.7 pp.90–91) independently fixes the negative apartment sign.

The following table retains the seeded sample, headline results, definitions used by the Lean headlines, convention witnesses and finding witnesses. Other per-target rows are omitted for length. A locator such as L2461 identifies the statement beginning on that line of `TauCetiRoadmap/LocallyAnalyticDistributions/README.md`. “✓” means the displayed instance agrees with the claimed formula or excludes the advertised wrong model; it does not claim a proof from examples. R01's local carrier/evaluation targets remain mathematically consistent but must be imported. R02 and R03 do not alter the computed values.

| Statement | Instances | Computed values on the compared sides | Result/change |
|---|---|---|---|
| L262 | Indiscrete K, Hausdorff K | Closure(0)=K versus 0; separated quotients 0 versus K. | ✓/— |
| L270 | Finite truncations K^n | lim K^n=K^ℕ; (1,1,…) belongs, unlike c₀. | ✓/— |
| L278 | diag(p^n) on c₀ | ‖e_n‖=1, ‖u(e_n)‖=p^(−n)→0; inverse on image unbounded, hence not strict. | ✓/— |
| L286 | Dense c₀₀→c₀ | Algebraic cokernel≠0; separated cokernel=0; NACvx heart must retain the former. | ✓/— |
| L295 | e₁⊗e₁+e₂⊗e₂ | Ultrametric projective norm=1; sum-of-norms expression=2. | ✓/— |
| L304 | K×K tensor K | π and ι give K² with max norm; (1,p) has norm1 in both. | ✓/— |
| L312 | Constant finite-dimensional compact stages K | K⊗̂K=K; 1⊗p↦p, norm p⁻¹ for both topologies. | ✓/— |
| L320 | c₀, scalar extension K→C | Σp^n e_n has norm1 in both; Σe_n is in neither completion. | ✓/— |
| L328 | Finite ON modules K²,K | Banach and locally convex tensors send (1,p)⊗1 to (1,p), norms1=1. | ✓/— |
| L336 | V_n=K^n with projections | C⊗̂lim V_n=C^ℕ=lim C^n; constant sequence1 survives both sides. | ✓/— |
| L373 | F=X³−X, radius1, K=Q₃ | Gauss=1; Q₃-point supremum≤1/3, algebraically closed extension supremum=1. | ✓/— |
| L423 | 0→K→K²→K→0 | Maps a↦(a,0), (a,b)↦b: kernel=image=K×0; quotient norm ∣b∣. | ✓/— |
| L427 | Same split sequence | Middle K² complete; max(‖a‖,‖b‖) complete; zero outer spaces force middle0. | ✓/— |
| L431 | U=K(1,0)⊂K², ℓ(a,0)=a | Extension (a,b)↦a has norm1=‖ℓ‖; zero extension fails ℓ(1,0)=1. | ✓/— |
| L435 | U=c₀ even coordinates | ℓ(x)=x₀ extends by x₀, norms1=1; quotient odd c₀ remains countable type. | ✓/— |
| L445 | K²→K projection | Image of radius-r open ball is radius-r ball; kernel K×0; surjection onto0 is open. | ✓/— |
| L455 | K² split by coordinates | Section b↦(0,b) satisfies q∘s=1; replacing s by0 gives0≠1. | ✓/— |
| L459 | Product extension K^ℕ×K^ℕ | Coordinatewise complete metrizable topology; projections yield exact kernel=first factor. | ✓/— |
| L463 | C_n=K^n in degree0 | H⁰(lim C_n)=K^ℕ=lim H⁰(C_n); H¹=0=0; Roos shift solved recursively. | ✓/— |
| L473 | Constant finite-dimensional compact-type stages | K→K²→K splits; strong dual sequence K←K²←K also exact, ranks1,2,1. | ✓/— |
| L757 | Constant compact-type factors K,K | 1⊗1↦1 in π and ι; 0⊗1↦0, ruling out a zero comparison. | ✓/— |
| L775 | Point and finite two-point manifolds | Function/dual/bidual dimensions1,2 respectively; evaluations (a,b)↦a and ↦b distinguish duals. | ✓/— |
| L795 | δ₋₁; moments1/n! | Amice=(1+T)⁻¹, all D_h=1; factorial inverse has D₁=∞ and is excluded. | ✓/— |
| L820 | ΣT^n and Σ3^(−n)T^n | Native radii1 and1/3; at R=1/2 weights2⁻n versus(3/2)^n. | ✓/R01 |
| L833 | F=ΣT^n, t=3 in Q₃ | Σ3^n=−1/2; t=1 terms have norm1 and fail summability. | ✓/R01 |
| L837 | F=ΣT^n, R=1/3,S=1/2,M=1 | Tail norm3⁻N; bound(2/3)^N; at N=0 equality1=1. | ✓/R01 |
| L841 | F=ΣT^n at t=3 | E=−1/2; derivative=(1−3)⁻²=1/4; pole t=1 excluded. | ✓/R01 |
| L845 | F=ΣT^n,H=1−T,t=3 | E(FH)=1; E(F)E(H)=(−1/2)(−2)=1. | ✓/R01 |
| L849 | Q₃→C₃, F=ΣT^n,t=3 | E(map F,3)=−1/2=φ(E(F,3)). | ✓/R01 |
| L859 | f(x)=1+3x, μ=dδ₀, g=y² | f_*μ(g)=6=μ((1+3x)²); identity pushforward gives μ. | ✓/— |
| L870 | μ=ν=dδ₀ | External product on xy=1 and x²=0; zero tensor gives0 on xy and is excluded. | ✓/— |
| L878 | S₃ Dirac masses; additive derivatives | δ(12)*δ(23)=δ(123)≠δ(132); dδ₀*dδ₀(x²)=2. | ✓/— |
| L889 | Multiplier x on dδ₀ | x·dδ₀=δ₀; value on1=1, value onx=0; zero multiplier gives0. | ✓/— |
| L906 | δ₀,δ₁,δ₋₁ | Transforms1,1+T,(1+T)⁻¹; constant coefficient always1. | ✓/— |
| L914 | δ₁*δ₁ and dδ₀*dδ₀ | Transforms(1+T)² and log(1+T)²; T² coefficient in latter1. | ✓/— |
| L922 | μ=dδ₀ | A(xμ)=1; (1+T)d(log(1+T))/dT=1. | ✓/— |
| L926 | Twist x↦a^x, μ=δ₁ | Transformed value a(1+T); substitution T↦a(1+T)−1 also a(1+T). | ✓/— |
| L930 | p=2,n=1,μ=δ₁ | Even projector ((1+T)−(1+T))/2=0; odd projector gives1+T. | ✓/— |
| L934 | Positive transpose derivative on δ₀ | dδ₀(x)=1; Amice log has T coefficient1, negative transpose would give−1. | ✓/— |
| L938 | μ=δ₁, dilation p | A(φμ)=(1+T)^p; substituting (1+T)^p−1 in1+T gives same. | ✓/— |
| L942 | δ_p and δ₁ | ψδ_p=δ₁; ψδ₁=0; ψφδ₁=δ₁. | ✓/— |
| L946 | Unit-supported δ₁; δ₀ | Division sends δ₁↦δ₁ uniquely on units; adding cδ₀ gives same x-product outside that restriction. | ✓/— |
| L958 | Derivative on LA | d(x)=1, d(1_{pZ_p})=0; kernel contains nonconstant locally constant functions, not merely K. | ✓/— |
| L962 | Log multiplication | log≠0, log(ζ−1)=0 at p-power roots ζ; quotient evaluations kill log·R⁺. | ✓/— |
| L986 | Digit doubling, p=3 and2 | Quadratic ratios1 versus1/2; at p=2 ratios1 versus5/9; derivative0 but no C² Taylor coefficient. | ✓/R03 |
| L996 | d:C¹→C⁰ | d(x)=1; digit-doubling d(x) has derivative0 despite being nonconstant; kernel larger than constants. | ✓/— |
| L1000 | b_(p^k)=p^(−k²); log | First v+rℓ=−k²+r(k+1)→−∞; log v+ℓ=1, so order1, not0. | ✓/— |
| L1010 | δ₁ and dδ₀ | δ₁ moment norms≤1; derivative norms p^k unbounded, so only first is order0. | ✓/— |
| L1016 | N=1,r=2,p=2 | d²δ₀ kills LP≤1 but sends x²↦2≠0; uniqueness holds only r<2. | ✓/— |
| L1026 | r=(1/2,0), f=1⊗1_(pZ_p) | Tensor norm finite; joint-difference valuation at(m,0)=0, required normalized quantity=−m/2→−∞. | ✓/— |
| L1036 | Rectangular wavelet at depths(m,n) | Sup norm1; tensor weighted norm p^(r₁m+r₂n); constant wavelet weight1. | ✓/— |
| L1040 | Haar rectangle depths(m,n) | Mass p^(−m−n), norm p^(m+n); growth order(1,1) bound equality. | ✓/— |
| L1053 | Normalized Haar on Z₃ | Depth-m mass3⁻m; sum of three child masses=3·3^(−m−1)=3⁻m; norms3^m unbounded. | ✓/— |
| L1064 | Dirac functional on rectangular indicators | Value0 or1; bound C=1 at r=(0,0); unique extension is evaluation. | ✓/— |
| L1068 | μ=dδ₀⊗δ₀, degree test x | μ(x)=1; normalized depth-m x moment scales p^m, forcing first-coordinate order≥1. | ✓/— |
| L1072 | Chart x↦u x with ∣u∣=1 | Depth m remains m; indicator norm p^(rm) unchanged; x↦px shifts depth by1. | ✓/— |
| L1076 | r=(1,0), degrees(N₁,N₂)=(0,0) | dδ₀⊗δ₀ vanishes on all rectangle constants yet evaluates x to1; strict threshold fails. | ✓/— |
| L1090 | N=0,r<1, finite-character tests | δ₀(1)=1; zero distribution(1)=0; all Fourier coefficients determine each finite-level mass. | ✓/— |
| L1094 | d^(N+1)δ₀⊗δ₀ | On degrees≤N first-coordinate polynomials0; on x^(N+1) gives(N+1)!≠0. | ✓/— |
| L1098 | g=0 and r=0 | C^r(point)=K; for r=0 wavelet coefficients→0 gives C⁰, not all bounded sequences. | ✓/— |
| L1108 | Dirac on equal-radius balls | Mass1 on containing ball,0 otherwise; growth bound1; extension evaluates f at its point. | ✓/— |
| L1122 | Analytic monomial x₁ | Oscillation at depth m has norm p⁻m; normalized by p^(rm) tends0 exactly for r<1. | ✓/— |
| L1279 | δ_a,δ_b | M(δ_a*δ_b)=κ(a+b)=κ(a)κ(b); identity mass maps to1. | ✓/— |
| L1293 | μ=δ_g | Mμ(κ)=κ(g); at κ=1 value1, at μ=0 value0. | ✓/— |
| L1297 | δ_a*δ_b | Both Mellin values κ(a)κ(b); zero mass gives0 and identity mass1. | ✓/— |
| L1327 | Finite scalar extension K→L,δ_g | Coefficients1 map to1; evaluation κ(g) maps to same scalar in L. | ✓/— |
| L1343 | Dirac generator, rank-one t=p | Rigid section1+T evaluates1+p; corresponding adic section has same1+p. | ✓/— |
| L1353 | Two numerators for genuine pseudomeasure | 1/T=2/(2T) where T≠0; cross products2T=2T permit gluing. | ✓/— |
| L1357 | Numerator T versus1, denominator T | Orders1−1=0 and0−1=−1; quotient1 extends,1/T has simple pole. | ✓/— |
| L1471 | A=Q₃², norm M=max(∣x+y/3∣,∣y∣) | m=(1,−3) has norm1/3; a↦am has operator norm1; action constant3 restores bound. | ✓/— |
| L1503 | u=diag(p,p²) | Fredholm=1−(p+p²)T+p³T²; rank0 gives1, nilpotent Jordan block gives1. | ✓/— |
| L1511 | Σp^(n²)T^n versus Σp^nT^n | Weights p^(−n²)R^n→0 for all R; second at R=p gives1, so not entire. | ✓/— |
| L1519 | diag(p^i), i≥0 | Degree-n coefficient valuation n(n−1)/2; multiplied by R^n tends0. | ✓/— |
| L1527 | One-dimensional u=a,v=b | Degree1 difference norm∣a−b∣; Lipschitz degree1 bound is exactly∣a−b∣. | ✓/— |
| L1535 | diag(p^i) and finite truncations | Shared majorant p⁻i; tail determinant coefficients gain valuations N+1 and higher. | ✓/— |
| L1543 | diag(p,p²) with zero outside two coordinates | Finite and Fredholm determinants both1−(p+p²)T+p³T². | ✓/— |
| L1551 | diag(p,p²), swapped basis | Both characteristic series1−(p+p²)T+p³T²; equivalent norms leave coefficients unchanged. | ✓/— |
| L1559 | u=(α,β),v=(x,y)^t | uv=αx+βy; det(1−Tvu)=1−(αx+βy)T=det(1−Tuv). | ✓/— |
| L1567 | Dual-number norm change ‖ε‖:1→p | Tensor map sends ε toε; norms1 versusp, bounded constantp; determinant1−εT maps coefficientwise. | ✓/— |
| L1583 | eA, A=K×K,e=(1,0) | Retract of A; fibre ranks1,0, so (Pr) does not force globally free constant rank. | ✓/— |
| L1591 | Projection A²→A, section into second coordinate | Lift of id is a↦(0,a); composition=id, norm1. | ✓/— |
| L1599 | P=eA over K×K | P⊕(1−e)A=A; algebraic projective ranks1,0; no free rank works globally. | ✓/— |
| L1607 | P=eA, U=e | Extend by0 on(1−e)A: series1−eT; other retract choices retain that series. | ✓/— |
| L1615 | Two scalar operators a,b | P_(a⊕b)=(1−aT)(1−bT)=1−(a+b)T+abT². | ✓/— |
| L1623 | u=v=1 on K, evaluation T=1 | det((1−u)(1−v))=0=0·0; series of u+v−uv is1−T, not(1−T)². | ✓/— |
| L1631 | Same rank-one (Pr) module | Evaluated product0=0; zero module gives1=1·1. | ✓/— |
| L1639 | Two factors a=(1,p), b=(1,0) | Product difference∣p∣=p⁻¹; max telescoping bound p⁻¹; empty difference0. | ✓/— |
| L1645 | Matrix rows(p,1),(0,1) | Determinant norm p⁻¹ equals column-bound product p⁻¹·1; real rows(1,1),(−1,1) give2>1. | ✓/— |
| L1653 | diag(1,p),diag(1,0) | Determinant difference p⁻¹; δ=p⁻¹ and other-column bound1 give p⁻¹. | ✓/— |
| L1657 | Diagonal p^i and degree2 | Minor on{i,j} norm p^(−i−j)→0 off finite subsets; repeated index is disallowed. | ✓/— |
| L1665 | Majorants1,p⁻¹,p⁻²,… | After exceptional index0, n-factor product≤p^(−n(n−1)/2); n=0 product1. | ✓/— |
| L1797 | Polynomial0,1,T² | Power-series coefficients respectively0, unit at0, unit at2; each restricted at every radius. | ✓/— |
| L1807 | P=T²,Q=T−ε,ε²=0 | Entire divisibility and polynomial divisibility both hold with quotientT+ε. | ✓/— |
| L1811 | A[T]/(T²), F=1+T+T² | Analytic reduction1+α with α²=0; zero-root algebra retains rank2. | ✓/— |
| L1822 | Q=T²,F=T³ | Reduction0; F=Q·T. For F=T, reductionα≠0 and no divisibility. | ✓/— |
| L1826 | A[T]/(T²), class1+α | Representative1+T reduces to1+α; unique remainder degree<2. | ✓/— |
| L1830 | Q=T−a,F=T² | Reduced class a² equals convergent evaluation F(a). | ✓/— |
| L1834 | Q=T²,P=b+cT | Multiplication matrix diagonal b; resultant b². Q=1 gives empty determinant1. | ✓/— |
| L1842 | Q=T²,P=b+cT | Entire norm-resultant and native bounded polynomial resultant both b². | ✓/— |
| L1850 | Q=T²,P=b+cT | c²Q+(b−cT)P=b²; coefficient of P has degree<2. | ✓/— |
| L1858 | Q=T²,P=1 and T | Resultants1(unit) and0(nonunit); first coprime, second shares T. Zero quotient Q=1 gives1. | ✓/— |
| L2052 | u=1+N,N²=0,z=1,h=2 | B=1+v=1−N; uB=1−v²=1. | ✓/— |
| L2056 | Same root kernel | Inverse1−N continuous and u(1−N)=1; h=0 kernel0 admits unique endomorphism0. | ✓/— |
| L2067 | eA retract of A | i∘r=e, r∘i=id_eA; ranks1,0. Continuous retraction preserves (Pr). | ✓/— |
| L2075 | u=diag(1,2),z=1 | Root kernel K×0, projection diag(1,0); retraction composite on kernel1. | ✓/— |
| L2085 | Finite root block u=1+N | Take approximation u itself: identity error0; transported approximation rank2. | ✓/— |
| L2089 | Same block | id=u·u⁻¹ finite rank2, hence compact; infinite c₀ identity has approximation error≥1. | ✓/— |
| L2093 | Same rank2 block | Kernel generated by e₁,e₂; identity approximation error0<1. Zero-root multiplicity0 gives zero module. | ✓/— |
| L2101 | A=K×K,eA root kernel | Finite projective ranks(1,0), not globally free of a fixed positive rank. | ✓/— |
| L2189 | Zero matrix rank2 | P=1, reflect₂P=T²=χ; actual reverse(P)=1≠χ. | ✓/— |
| L2191 | Zero and scalar rank2 matrices | Degrees0≤2 and2≤2; zero ring gives polynomial0 with natDegree0≤2. | ✓/— |
| L2195 | Jordan(2,1;0,2), reduction mod8 | P=1−4T+4T² maps to1+4T+4T²; ring map need not inject. | ✓/— |
| L2199 | Diagonal a,b conjugated by swap | P before/after1−(a+b)T+abT². | ✓/— |
| L2207 | J=(2,1;0,2) over Z/8,B=Y+Y² | B(J)=(6,5;0,6); both spectral sides1+4T+4T². | ✓/— |
| L2215 | Zero 2×2 matrix,B=1 | Fixed-rank resultant=(1−T)²=det(1−TB(M)); degree-based rank0 wrongly gives1. | ✓/— |
| L2225 | Upper triangular J over Z/8 | Diagonal ofB(J)=(6,6); product(1−6T)²=1+4T+4T², off-diagonal5 retained. | ✓/— |
| L2236 | Swap two matrix indices | Diagonal entries a,b permuted; series1−(a+b)T+abT² unchanged. | ✓/— |
| L2240 | Swap J's coordinates,B=Y+Y² | ReindexedB(J)=(6,0;5,6)=B(reindexedJ). | ✓/— |
| L2424 | P=1−aT,B=T²,rank1 | Remainder B mod(X−a)=a²; resultant1−a²T unchanged by reduction. | ✓/— |
| L2428 | rank2,B arbitrary polynomial | Output product of two linear spectral factors has degree≤2; B=1 gives exact degree2. | ✓/— |
| L2432 | rank1,P=1−aT,B_j=b_j+c_jX | Coefficient−(b_j+c_j a)→−(b+ca); leading constant1 unchanged. | ✓/— |
| L2436 | Degree≤1 differences d_jT,d_j→0 | Gauss_R=∣d_j∣R→0; without fixed degree T^j has Gauss₁=1. | ✓/— |
| L2440 | rank1,P=1−aT,B entire | E=1−B(a)T; a=0 gives1−B(0)T, retaining zero eigenvalue. | ✓/— |
| L2453 | B=T²,P=1−aT | Entire and polynomial definitions both1−a²T. | ✓/— |
| L2457 | Same linear P, B_N truncations | Coefficient T=−Σ_(k≤N)b_k a^k→−B(a); constant coefficients1=1. | ✓/— |
| L2461 | Same linear P | Gauss_R difference=R·∣B_N(a)−B(a)∣→0 for every R>0. | ✓/— |
| L2465 | B=T²,P=1−aT,B(0)=0 | Once functional cutoff≥2, every padded characteristic rank gives1−a²T. | ✓/— |
| L2469 | P=1,B=1,rank n | E_n=(1−T)^n; E_(n+1)=(1−T)E_n; linear coefficient−n. | ✓/— |
| L2473 | P=(1−aT)(1−bT) | E₂(B,P)=(1−B(a)T)(1−B(b)T), including B(0)≠0. | ✓/— |
| L2477 | a=0,B=1 and B=T² | E₁=1−T and1 respectively; replacing rank1 by degree(P)=0 loses first factor. | ✓/— |
| L2481 | ρ_i=p⁻i, B=T² or0 | β_i=p^(−2i) or0; degree-k bound product p^(−k(k+1)) or0. | ✓/— |
| L2489 | R=1, β_i=p⁻i,q=p⁻¹,H=0 | Degree-k bound p^(−k(k+1)/2)≤p⁻k; k=0 gives1≤1. | ✓/— |
| L2503 | B=T²,P=1+c₁T+c₂T²+… | Output coefficient T=2c₂−c₁² for rank≥2; B=1 instead gives−rank. | ✓/— |
| L2513 | B=T and B=0 | Double-truncation limits P and1; B=1,P=1 has linear coefficient−N, not Cauchy in Q_p. | ✓/— |
| L2521 | Infinite c₀,u compact | B=T givesu; B=0 gives0; B=1 gives identity with approximation error≥1. | ✓/— |
| L2529 | u=diag(p,p²),B=T² | Both sides1−(p²+p⁴)T+p⁶T²; B=0 gives1. | ✓/— |
| L2557 | u=diag(p,p²),h=1 | Finite summand first coordinate rank1; h=2 rank2; u=0 givesrank0. | ✓/— |
| L2571 | A=K×K, stage with one coefficient | Element(1,p) norm1; two monomials give max of two coefficient norms. | ✓/— |
| L2581 | μ with values μ(e_n)=(1,2) | Bounded dual norm=max(1,∣2∣); on coefficients p^n gives((1−p)⁻¹,2(1−p)⁻¹). | ✓/— |
| L2591 | Integral lattice and p⁻¹δ₀ | δ₀ has lattice norm1; p⁻¹δ₀ normp>1 and is outside unit lattice. | ✓/— |
| L2601 | c₀(K)⊗̂A, coefficient p^n a | Maps to sequence p^n a; norm‖a‖ on both for contractive model; all-one sequence excluded. | ✓/— |
| L2605 | δ₀⊗a | Canonical extended functional f↦a f(0); values on1=a and onT=0; zero map fails if a≠0. | ✓/— |
| L2615 | A=Q₃², μ=(5,7)δ₁,j=(2,3),φ(z)=3z | Action on z²=(90,189); first/second fibre values90,189 agree with specialized formulas. | ✓/— |
| L2639 | μ(e_n)=(1,2),f_n=3^n | Before specialization value(−1/2,−1); second specialization gives−1 on both routes. | ✓/— |
| L2654 | Finite cover of character parameter affinoid | Radii requiring h=1,3 admit common h=3; γ=5 at p=2 requires principal subgroup1+4Z₂. | ✓/— |
| L2663 | Character valueχ(a)=a^k, j=a constant | Action onδ₁ sends test z^m to a^kφ(1)^m; k=0 givesφ(1)^m. | ✓/— |
| L2674 | φ_s(z)=z+1,φ_t(z)=2z, constant multipliers | Composite pullback on z gives2z+1 versus2z+2 in opposite order; cocycle fixes the required order. | ✓/— |
| L2679 | φ(z)=pz on unit Tate stage | Monomial tail operator norm≤p⁻N→0; φ(z)=z has tail1. | ✓/— |
| L2687 | Tate map T↦pS and T↦S | First coordinate powers norms p⁻n→0 gives compactness; second powers norms1 and identity not compact. | ✓/— |
| L2691 | Bounded formal coefficients1, coordinate p | Σp^n=1/(1−p); tail norm p⁻N. Coordinate1 would give nonsummable terms1. | ✓/— |
| L2701 | Complex A --S--> A | Two nonzero degrees, d²=0; choosing three identity differentials gives d²=1 and fails. | ✓/— |
| L2711 | U=a in both degrees, d=S | dU=Sa=aS=Ud; independent scalars a,b give defect(a−b)S. | ✓/— |
| L2724 | Contractible A --1--> A | Identity cochain map homotopic to0; both degree maps finite rank, hence class compact. | ✓/— |
| L2734 | Contractible two-term complex,U=a | Raw representative product(1−aT)²; zero representative product1, despite same homotopy class. | ✓/— |
| L2744 | Same complex | Constant term1 and polynomial degree2; zero complex product empty=1. | ✓/— |
| L2748 | A --1--> A,U=1 | Raw product(1−T)² versus zero-complex1; both cohomologies0. | ✓/— |
| L2752 | Scalar U=p,h=1 | Root eigenvalue norm∣p∣ equals cutoff; reciprocal root norm∣p∣⁻¹ also endpoint. | ✓/— |
| L2762 | λ=p²,h=1 | v(λ)=2>1; ∣λ∣=p⁻²<p⁻¹; reciprocal valuation−2<−1. | ✓/— |
| L2772 | U=diag(p,p²),h=1 | Projector diag(1,0); at h=2 projectorI; zero eigenvalue stays outside every finite window. | ✓/— |
| L2783 | P=(1−pT)(1−p²T) | At h=1 select1−pT; at h=2 selecting only that factor leaves forbidden endpointp² in complement. | ✓/— |
| L2793 | Same diagonal U, f=diag(a,b) | fE=Ef=diag(a,0); swap fails intertwining and need not preserve window. | ✓/— |
| L2797 | U=p,h=1 | Correct projector1; candidate0 leaves Q(U)=U−p=0 on complement, violating invertibility. | ✓/— |
| L2801 | A --S--> A,U=p,h=1 | Both projections1, dE=Ed=S; h=0 both0, selected complex0. | ✓/— |
| L2805 | U=S at rational slope a/b | On ∣S∣^b=∣p∣^a selected rank1, root norm∣p∣^(a/b); U=0 gives Q=1 andrank0. | ✓/— |
| L2820 | A --S--> A on a common finite window | Terms ranks1,1; finite-projective model is same two-term complex; Euler1−1=0. | ✓/— |
| L2830 | U=diag(p,p²),h=1 | Algebraic annihilator X−p selects first line; second evaluatesp²−p≠0, hence invertible there. | ✓/— |
| L2840 | K --0--> K,U=p,h=1 | H⁰=K,H¹=K; selecting before/after cohomology gives dimensions1,1. | ✓/— |
| L2844 | Contractible K --1--> K | Finite-window cohomology0 in both degrees; homotopy equivalent zero complex gives0,0. | ✓/— |
| L2848 | A=K⟨S⟩, complex A --S--> A at S=0 | Derived fibre K --0--> K has H⁰=K,H¹=K; underived H⁰(A-complex)=0 misses K. | ✓/— |
| L2852 | U=S, rational h=a/b | Rational annulus ∣S∣^b=∣p∣^a has exact-h rank1; outside band rank0. | ✓/— |
| L2862 | A --S--> A,U=p,h=1 | At S=0 cohomology dims1,1; at S≠0 dims0,0; alternating sums0=0. | ✓/— |
| L2872 | C=D=K,r=2,a=3,U=6,P=X/6 | Q=1/6; extension aQf=f/2; restriction2(f/2)=f. | ✓/— |
| L2876 | Same r,a, Q'=1/6+(X−6) | On U=6, aQ'=1/2=aU⁻¹; polynomial choice changes no extension. | ✓/— |
| L2894 | Same K presentation,U=p | At h=1 every finite-stage and limit slope spaceK; at h=0 all0. | ✓/— |
| L2902 | G_m and norm-one unramified torus | w(p)=1, apartment−1; w(p⁻²)=−2; norm-one torus valuation lattice0. | ✓/— |
| L2910 | SL₂ positive root α(λ(p))=p² | Pairing2; inverse pairing−2 excluded; rootless G_m has positive imageZ, including both signs. | ✓/— |
| L2918 | Rootless G_m with valuation latticeZ | λ'≤λ forces(λ−λ')(1)≥0 and its negative≥0, henceλ'=λ. | ✓/— |
| L2926 | diag(p,p²), h=1 across factored stages | Selected dimensions1=1; finite projective line becomes coherent rank1 module. | ✓/— |
| §0.CR.6.6 L485 | Dagger disc, annulus xy=π | H¹ dimensions0=0 and1=1; dlog x maps to dlog x. Ordinary rigid-disc cohomology is not substituted. | ✓/— |
| §0.CR.6.6 L532 | Exhaustion with stabilized finite-dimensional cohomology; countable disjoint multiplicative lines | Constant one-dimensional system has limit K₀; finite-component exhaustion has limit K₀^ℕ, not c₀. | ✓/— |
| §0.CR.6.6 L595 | Disc, annulus, countable disjoint multiplicative lines | Completed comparison gives0=0, C·dlog t=C·dlog t, and C⊗̂(K̆₀^ℕ)=C^ℕ. | ✓/— |
| §0.CR.6.6 L638 | Constant tower and identity/cofinal transitions | Colim(V→V→…)=V, scalar comparison C⊗̂V on both sides; zero tower gives0. | ✓/— |
| Convention1 L62 | Nonreduced A=K[ε]/ε²; bounded module action | ε≠0 but ε²=0 is allowed; the L1471 example gives operator norm1 versus vector norm1/3, requiring action bound3. | ✓/— |
| Convention2 L63 | x=a+p^h z; u(x)=(Σx_i)e₀ | Normalized coordinate z; output row norms1,0,… versus input-column norms1,1,… . | ✓/— |
| Convention3 L64 | Point and empty manifold; dual of c₀ | Function/dual dimensions1 and0; functional e_n↦1 is bounded although coefficients do not tend0. | ✓/— |
| Convention4 L65 | ΣT^n; Σp^(n²)T^n | First Gauss_R=1 for R<1 but no radius1 decay; second coefficients decay at every radius. | ✓/— |
| Convention5 L66 | dδ_a and p=2 torsion | First Amice coefficients1,a−1/2; δ₋₁ has sign-branch value−1 and principal value1. | ✓/— |
| Convention6 L67 | u=id,a=1,h=1; h=0 | P=1−T,c=−1,v=0,E=1; h=0 gives E=1−1=0 and kernel(id)=0. | ✓/— |
| Convention7 L68 | Q=1 and X−a | Norm-resultants1 andF(a); for F=T²,Q=X−a, quotientT+a and remaindera². | ✓/— |
| Convention8 L69 | r=(1/2,0), locally constant tensor | Tensor membership true, simultaneous first-difference normalized valuation−m/2→−∞. | ✓/— |
| Convention9 L70 | Contractible complex, U=p, h=1 | Raw product(1−pT)² versus1 for zero model; H=0 for both; eigenvalue slope1 and reciprocal slope−1. | ✓/— |
| Convention10 L71 | Dual-number ε with ‖ε‖=p | ε powers are0 after degree1, hence power bounded; ε is outside norm unit ball. | ✓/— |
| Convention11 L72 | p=3, finite Fourier projection of δ₁ | (1+ζ+ζ²)/3=0 for wrong residue; 3/3=1 for matching residue; results descend to Q₃. | ✓/— |
| Convention12 L73 | Characteristic3 bounded branch; characteristic0 Fourier | Integral binomial coefficients reduce mod3; p=0 makes 1/p unavailable, so Fourier target excludes this coefficient field. | ✓/— |
| Convention13 L74 | xδ₁; Hasse Δ₂T²; scalar Fredholm | (1+T)∂_T(1+T)=1+T; Δ₂T²=1 in F₂; P_a=1−aT and Res(X−a,F)=F(a). | ✓/— |
| §1.2 L816, implicit definitions | Open-disc F=ΣT^n; G=Σ3^(−n)T^n | F passes every R<1; G fails at R=1/2 with weights(3/2)^n. E(F,3)=−1/2. | ✓/R01,R03 |
| §4.1 L1449, gate witness | u=diag(p^i), N=0,1 | Error norms p⁻¹ and p⁻² equal p^(−N−1). | ✓/R02 |
| Lean L100, `IsEntire` | 0, T², Σp^nT^n | First two true at all positive radii; last false at R=p, weights1. | ✓/— |
| Lean L105, bounded resultant | n=0; n=2,P=1,B=1; zero ring | Outputs1,(1−T)²,0=1 respectively; rank is a datum. | ✓/— |
| Lean L112, total monic tail | Q=1; Q=T−a,F=T²; Q=0 | Quotients F,T+a,F respectively. Last is a junk total value, never used as division by a monic polynomial. | ✓/— |
| Lean L119, fixed-rank output | n=0,P=1; n=2,P=1,B=1 | Outputs1 and(1−T)²; equal P cannot erase specified rank. | ✓/— |

Convention14 is covered by R03 and the signature audit. Point, split and finite-coordinate examples test the maps; they do not prove nonsplitting or the full topological comparisons.

## Not verifiable

- **BGR**, *Non-Archimedean Analysis*, §§2.7, 3.7, 5.1–5.2. The source service resolved DOI `10.1007/978-3-642-52229-1` to a paywalled publisher source and recorded it as uncertified. Its text was not read and its internal numbering/content is not independently certified here. It is not entered as a new missing-text request. The accessible Buzzard and pinned/supplier statements were used where they cover the sampled mathematics.
- **Ingleton**, *The Hahn–Banach theorem for non-Archimedean valued fields*, pp.41–45. The service found DOI `10.1017/S0305004100027353` and the Cambridge abstract page, but no classified legal full text. The historical original remains unread. Schneider §9, Proposition 9.2 and Corollaries 9.3–9.4, pp.58–59, independently support the claimed theorem. This access limitation is recorded in the missing-reference file; the review is complete and is not parked for it.
- All 25 other retrieved works were obtained through the sources service from an open repository, institutional host or author page. Retrieval does not certify every theorem in those works: the source certification here is the 15-target seeded sample and the additional locators explicitly listed. Generalizations marked “derived” remain proposed theorems with the displayed inputs, not printed-source assertions.

## Source issues

- **Error** in Coleman at Lemma A3.1, printed p.432 (Coleman lines 662–670): the source says a restricted H with polynomial G and constant GH forces G constant or H zero; it should require H entire; affects a stated result.
- **Misprint** in Coleman at the proof of Lemma A3.4, printed p.433 (Coleman line 717): the source says K is the signed coefficient sum without its degree-n term; it should include the leading term Tⁿ; affects the proof.
- **Error** in Loeffler at Definition 2.12 and Remark 2.13, printed pp.4–5 (Loeffler lines 190–257): the source says simultaneous first-difference decay describes the completed tensor of one-variable spaces; it should use separate tensor-wavelet conditions, which include 1⊗1_(pZ_p) at order(1/2,0); affects a stated result.
- **Error** in Pilloni at §13.1.1, condition4, author p.84 (Pilloni lines 3846–3847): the source says to invert Q⋆(U) when Q's roots have valuation greater than h; it should test reciprocal roots of valuation at least −h, or Q(U) for eigenvalue roots of valuation at most h; affects a stated result.
- **Error** in BCGP-I at §6.1.1, printed p.139 (BCGP-I lines 6721–6723): the source says complementary invertibility tests roots of valuation strictly below h and implies uniqueness; it should include roots of valuation equal to h; affects a stated result.
- **Misprint** in Pilloni at the proof of Corollary 13.2.4.2, author p.87 (Pilloni lines 4021–4026): the source says the extension is P applied to a map between different spaces; it should be a Q(U_C) for P=XQ and U_C=r a; affects the proof.
- **Error** in BCGP-II at Remark 4.6.47, printed p.94 (BCGP-II lines 4231–4234): the source says the displayed geometric inverse works for s≥n; it should require s>n; affects the proof.

For the last error, s=n=0 gives 1−UX⁻¹ in K⟨U,X,X⁻¹⟩, which vanishes at U=X=1 and is not a unit. Taking s>n makes the geometric-series factor have norm strictly below1 and suffices for the argument. This does not affect a target here. For BCGP-I’s endpoint error, U=p^h on a line can incorrectly remain in the complement; the roadmap’s inclusive test excludes it. For Pilloni’s reciprocal error, U=1,h=1 can incorrectly remain entirely in the complement: every Q whose roots have valuation >1 has Q⋆(1)≠0, although this eigenvalue has slope 0≤1. The first six source corrections are already reflected in the roadmap's mathematics.
