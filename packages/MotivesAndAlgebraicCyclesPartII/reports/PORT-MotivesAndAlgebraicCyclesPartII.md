# PORT-MotivesAndAlgebraicCyclesPartII

## Result

- Branch: `roadmap/motives-and-algebraic-cycles-part-ii`, created from `e213fdd`.
- Head commit: `c2ddf08461e59965ae45ee01d3d46a833026a10b` (`MotivesAndAlgebraicCyclesPartII: roadmap (README, Suggested.lean, metadata)`).
- Folder: `TauCetiRoadmap/MotivesAndAlgebraicCyclesPartII/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder changed.
- Build (`lake build TauCetiRoadmap.MotivesAndAlgebraicCyclesPartII.Suggested`): `Build completed successfully (18239 jobs).` Warnings: 0. The file declares nothing, so there is no `sorry` warning either. The first build, of the package file as it was, gave one non-`sorry` warning ("imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file"); adding the `module` header line, as 79 `Suggested.lean` files on main have, removed it.
- Gate: `gate MotivesAndAlgebraicCyclesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`): `depcheck: 262 roadmaps, 2545 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Citation resolver on the ported README (`roadmaps resolve`): cross-roadmap citations found nowhere: none; Lean names found nowhere: none. The resolver reports that it read main at `799d79c` (its own index), newer than this worktree's `e213fdd`; I checked every supplier on main against this worktree's copies as well (below).

## Draft pull request body

This pull request adds the roadmap *Algebraic cycles, pure and mixed motives, Part II: Berkovich motives*. It continues MotivesAndAlgebraicCycles, whose mixed motives stop at Voevodsky's Nisnevich motives over a field, in two directions. It constructs integral étale motivic sheaves over Banach rings, archimedean and nonarchimedean alike. The construction starts from the arc-topology on Banach rings and small arc-stacks, then builds finitary derived arc-sheaves, ball-invariant effective motives with free motives and maps smooth without boundary, the reduced multiplicative group and the Tate object, transfers, and the stable category `Dmot(X)` obtained by inverting `ℤ(1)`. It also constructs the presentable category `DM_et(k, ℤ)` of integral étale motives over a field. The end theorems are:

- Tate cancellation over every small arc-stack;
- finitarity of motivic K-theory and its canonical rational Adams splitting `Kmot ⊗ ℚ ≃ ⊕_{n≥0} ℚ(n)[2n]`;
- the description of motivic K-theory over a nonarchimedean geometric point by the cofibre of the K-theory of its ideal of topologically nilpotent elements;
- the torsion and tilting comparisons;
- the six-functor formalism with proper base change;
- rigidity of `Dmot` over analytic bases of finite cohomological dimension;
- the equivalence `DM_et(k, ℤ) ≃ Dmot(k)` over an algebraically closed discrete field;
- the monodromy description of `Dmot(C)` over the completed algebraic closure of `𝔽̄_p((T))`;
- the identification of prime-to-`p` torsion motives in characteristic `p` with overconvergent étale sheaves on v-stacks.

The roadmap gives the library a single home for analytic motives on which later arithmetic and analytic roadmaps can build. RationalAnalyticPrismatization already consumes its Banach arc-site (Layer 0). `Suggested.lean` states nothing: every headline needs `Dmot`, `Kmot` or the arc-site of Banach rings, and none of these is in Mathlib or Tau Ceti at the pins. Its docstring names, for each headline, the carrier it lacks.

## Dependencies that are still pull requests

Suppliers named in the README that are not on main (all earlier than this roadmap in the merge order): TropicalAndBerkovichArithmetic, AnalyticStacks, GeneralAlgebraicKTheoryPartII, KTheoryFiniteLocalFields, RefinedTraceMethods, AnabelianGeometryAndNonabelianChabauty, DiamondEtaleCohomology, DiamondSixOperations, AdicCoefficientsAndComparisons, MotivesAndAlgebraicCycles, MotivicEtaleKTheory. ArcTopologyAndDescent (also a pull request, earlier in the order) is named only in Scope and ownership, to mark the boundary between the arc-topology on schemes and the one on Banach rings; it is not a supplier.

Suppliers on main: EnhancedDerivedSheaves, GeneralAlgebraicKTheory, SchemeKTheoryOperations, JacobianChallenge, PerfectoidSpaces, DiamondsAndVStacks, ProfiniteCohomology, AdicSpacesPartIII, SchemeAndStackFoundations, EtaleCohomologyFoundations, RepresentationTheory (LieGroups), ComplexComparisonPartII, CharacteristicClasses, MorseNovikov. The port adds AlgebraicKTheory and NewtonPolygons, both on main. EnhancedDerivedSheaves, RepresentationTheory, CharacteristicClasses, MorseNovikov and AdicSpacesPartIII have open revision pull requests (EnhancedDerivedSheaves twice). They are cited as they are on main, and every cited id was confirmed on main. No citation uses an id that only an open revision defines.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the Lean form: a module docstring naming each headline and the carrier it lacks, and no declarations. The only change is the `module` header line, which the build warning required. Its import is still the single line `import Mathlib`. No `TauCeti.*` module is imported because none is used. The `#check @name` comparison does not apply: the file declares nothing, so the scratch file would be empty.

## Supplier replacements and duplication removals

All of them are recorded in Scope and ownership and in the supplier contracts.

- **§3.1 one-units of a field.** The package stated the field-level notion and an API bullet "in an ultrametric valued field a one-unit has norm exactly 1". Both are Mathlib's: `ValuationSubring.principalUnitGroup` (Mathlib/RingTheory/Valuation/ValuationSubring.lean:631) of the valuation subring of `NormedField.valuation` (Mathlib/Topology/Algebra/Valued/NormedValued.lean:47) is the group of `u` with `‖u − 1‖ < 1`, and `ValuationSubring.principal_units_le_units` (line 650) puts it inside the units of the valuation ring. The bullet is deleted and the field case cites Mathlib. The supplier contract records what Mathlib's definition does not include:
  - membership goes through the canonical valuation of the subring, which is equivalent to `NormedField.valuation` but not equal to it;
  - Mathlib has no statement about the group under ring maps between different fields (I grepped every use of `principalUnitGroup`).

  The ring-level API (Tau Ceti Neumann estimates) and the presheaf functoriality stay.
- **Covering dimension.** It is used in the Conventions and in §§1.5, 2.1, 7.3 and 9.6, including the Hilbert-cube Check, and AlgebraicKTheory §4.3 (`HasCoveringDimensionLE`, on main) owns it. The port cites it in the Conventions, in a new supplier subsection, in those sections' *Needs* lines, in the Layers 1, 2, 7 and 9 Dependencies, and in the gap compact-hausdorff-dimension. That section's own Check also gives the Hilbert cube no finite bound, which agrees with §9.6.
- **Newton polygon root norms.** §3.5 (annulus criterion) and §4.4 (interpolation) use the root norms of a split monic polynomial. NewtonPolygons §3.3 (on main) owns the identification of slopes with root valuations. It is now cited in both sections, their Layer Dependencies and a supplier subsection.
- **Berkovich spectrum.** Scope now records that TropicalAndBerkovichArithmetic imports the complete spectrum of a Banach ring from AdicSpacesPartIII §R3.9 (on main). The README still consumes it through TropicalAndBerkovichArithmetic, whose §§0.1–0.32 add the native presentation and the further theory used here.
- **Compact assembly.** The package said that §0.1's weakly compact maps were the EnhancedDerivedSheaves notion "applied without stability". EnhancedDerivedSheaves §E5:presentability.4 defines weakly compact maps in every quasicategory with filtered colimits; only its compactly assembled categories are stable. §0.1 now says so, and Scope records §0.1 as a kept variant whose one different clause is that stability is not assumed (the category of seminormed rings is not stable).

Duplication sweep by object, after these edits, against every roadmap on main and the open pull requests (the 256 checkouts listed and `roadmaps grep` over all 455 heads):

- **Arc-stacks and `Marc(`.** These occur only in RationalAnalyticPrismatization (#412 in the order, after this roadmap). It consumes this roadmap's Layer 0 and owns nothing of it.
- **Arc-topology.** ArcTopologyAndDescent owns the scheme arc-site, a different site from the one on Banach rings.
- **No other owner** exists for `Dmot`, `DM_et`, étale motives, ball invariance, `Kmot`, motivic nearby cycles or motivic Galois stacks over `𝔽̄_p`.
- **Generalized Jacobians.** AnabelianGeometryAndNonabelianChabauty owns the characteristic-zero generalized Jacobian of a reduced boundary. §4.3 keeps the variant over an algebraically closed field of arbitrary characteristic, as before. JacobianChallengePartII mentions generalized Jacobians but owns no marked variant.
- **One-units.** ClassicalArithmeticCompletion and ColemanPowerSeries use principal units of local fields, not the arc-sheaf `U¹`.
- **Compactly assembled categories.** InfinityCategoryTheory (#2270, not in the merge order before this roadmap) treats them. It is not cited.

No duplicate owner was found, so nothing was deleted beyond the §3.1 restatement.

Ownership against open work was checked with the open-pull-request checkouts this brief lists and the `roadmaps grep`/`roadmaps show` tools. For the open suppliers missing from that list, I read the heads through `roadmaps show`: KTheoryFiniteLocalFields, AnabelianGeometryAndNonabelianChabauty, DiamondEtaleCohomology, DiamondSixOperations, AdicCoefficientsAndComparisons, MotivesAndAlgebraicCycles and VStackSheavesAndLisseCategories. No declaration of `Suggested.lean` exists, so no name can collide with another roadmap's.

## Citations and library claims checked

- **Supplier sections on main.** Every section, layer and target cited in a supplier on main exists in this worktree's copy, with the stated content where spot-checked:
  - GeneralAlgebraicKTheory §§3.2, 4.3, 8.3, 8.10, 10.10, 13.4, 13.5, 13.8c;
  - SchemeKTheoryOperations §§2.6, 2.7, 3.1, 3.3, 3.4, 3.5, 3.8, 5.2, 6.4, 6.8, 6.11;
  - ProfiniteCohomology §§9.6, 10.2;
  - SchemeAndStackFoundations §2.16;
  - EtaleCohomologyFoundations §§F.2.1, F.2.3, F.3.0;
  - PerfectoidSpaces §§P1.4, P1.19–P1.22, P1.27, P2.3, P2.7, P2.12, P2.13, P3.20;
  - DiamondsAndVStacks §§D0.22, D0.23, D1.4, D2.7, D4.7, D4.9, D6.1, D6.3, with `Perf.Spd` named in its README;
  - AdicSpacesPartIII §R3.5 and target *sheafy-tate-acyclicity-and-kiehl-gluing*;
  - ComplexComparisonPartII §C5.1 `nonempty_sheafSingularComparison`;
  - CharacteristicClasses §C5 (Euler integral of `G/T` equals `|W|`);
  - MorseNovikov §6.5 `lefschetz_fixed_point_formula`;
  - RepresentationTheory/LieGroups Layer 8 (diffeomorphism `K/T ≅ 𝐆(ℂ)/𝐁(ℂ)`);
  - JacobianChallenge: `classGroupAddEquivLineBundleClass`, `picardScheme`, `isRepresentable_picZeroSets`, `jacobianScheme`, `multiplication_isogeny`;
  - EnhancedDerivedSheaves: every cited section, and every cited name in the section the README gives for it (`cutoffRightAdjoint_compat` is in §E3.4).
- **Supplier sections at open heads.** These heads have every cited section:
  - TropicalAndBerkovichArithmetic (§§0.1–0.32 as cited, 1.1–1.6, 2.16, 3.7);
  - AnalyticStacks §§0.4–0.6, 0.9–0.10, 1.1–1.5. Its Downstream consumers section assigns §11.6 to this roadmap, as the README says;
  - KTheoryFiniteLocalFields §§1.5, 1.6, 2.1, 6.5. §1.5 states unique `p`-divisibility of `K_n` (`n ≥ 1`) of perfect `𝔽_p`-algebras, and §1.6 states `K_{2i}(𝔽̄_p) = 0`;
  - RefinedTraceMethods §§4.10, 4.20;
  - GeneralAlgebraicKTheoryPartII §1.2;
  - MotivicEtaleKTheory §2.2;
  - MotivesAndAlgebraicCycles §§4.1–4.6, 4.9, 4.11, 4.15–4.18;
  - DiamondEtaleCohomology §§C0.19, C0.24, C2.2, C2.12, C4.5, C4.13, C4.14, C9.8;
  - DiamondSixOperations §§S2.4, S4.2, S4.3;
  - AdicCoefficientsAndComparisons Layer L5 `smoothAlterationPair`;
  - AnabelianGeometryAndNonabelianChabauty, target "Generalized Jacobian of a reduced boundary".
- **Tau Ceti at the pin.** Every declaration in the contract exists with the stated hypotheses:
  - `TauCeti.unitBallIdeal` and `mem_unitBallIdeal`: `SeminormedRing`, `IsUltrametricDist`, `NormOneClass`;
  - the Neumann estimates: `NormedRing`, `NormOneClass`, `HasSummableGeomSeries`, `IsUltrametricDist`;
  - `Subring.unitClosedBall`;
  - `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`: `NormedField`, ultrametric, complete, `0 < c`;
  - `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring`: `NormedDivisionRing`, ultrametric, complete, `Finite σ`;
  - the four cohomological-dimension declarations;
  - `TauCeti.kummerIso K n hn`;
  - `AlgebraicGeometry.Smooth.exists_etale_affineSpace`, with `ULift (Fin n)` variables;
  - `TauCeti.SymmetricAlgebra.projToSpec`, `homogeneousSubmodule` and `instIsProperProjToSpec`;
  - `TauCeti.AlgebraicGeometry.projectiveLine`, its `polynomialChartι` and the range lemma;
  - `TauCeti.puncturedAffineSpace` and `TauCeti.PuncturedAffineSpace.homEquiv`;
  - `TauCeti.ExactK0`, `StableGeneralLinearGroup` and `AlgebraicK1`.

  Tau Ceti has no Berkovich or Gel'fand spectrum: "Berkovich" occurs only in adic-space docstrings.
- **Mathlib at the pin.** Every Mathlib name exists in the stated file: `GrothendieckTopology`, `NormedField`, `IsUltrametricDist`, `SSet.Quasicategory`, `continuousCohomology` (an abbrev in ContCohomology/Basic.lean), `PowerSeries.IsRestricted.subring`, `MvPowerSeries.IsRestricted.subring`, `Scheme`, `LocallyOfFinitePresentation`, `Etale`, `QuasiCompact`, `Smooth`, `AffineSpace` and `Proj` (`AlgebraicGeometry.«Proj»`, ProjectiveSpectrum/Scheme.lean:855). Mathlib's `CategoryTheory/Presentable` is 1-categorical, consistent with "no presentable ∞-category of sheaves".
- **Gaps.** The twelve gap slugs were re-searched across all roadmaps. VStackSheavesAndLisseCategories VS2 owns the Breen–Deligne resolution of abelian groups (and abelian group objects of a topos); the gap breen-deligne-resolution asks for the resolution of the group completion of a sheaf of animated commutative monoids by classifying spaces of products, which is a different statement. GeneralAlgebraicKTheoryPartII §4.8 has chromatic fracture squares of spectra, not the E∞-algebra square of gap einfty-fracture-square. No roadmap provides homotopy K-theory, its excision or cdh descent, valuation-ring K-regularity, Suslin rigidity or `K(O_C)^∧_p ≃ K(C)^∧_p`. The gaps stay as the accepted package declared them.

## Upstream-reviewer fixes to the README

1. **Introduction.** The package said MotivesAndAlgebraicCycles "stops at Nisnevich motives over fields … (its §§4.1–4.18)". That roadmap also builds pure motives, realizations, Nori motives and Tannakian reconstruction, and its Layer 4 runs to §4.20 (stable duality and Tate motives, motivic measure). The sentence now says that its *mixed* motives stop at Nisnevich motives over a field, in its Layer 4 (§§4.1–4.20).
2. **§0.4.** "Every residue field of a strict ring is … `ℂ` or an algebraically closed nondiscrete nonarchimedean field" omitted `ℂ` with `|·|^α`, `0 < α ≤ 1`. That field is a geometric Banach point, and it is strict as a ring: `|1/2|^{1/2} = 2^{−1/2} < 1`, so `1/2` is a topologically nilpotent unit, and `M = {pt}`. The statement now includes it, with TropicalAndBerkovichArithmetic §0.26 cited. The first Check now computes this case and states what a definition admitting only the standard absolute value would miss.
3. **§0.1.** The attribution of weakly compact maps and compact assembly is corrected (see above).
4. **Downstream consumers.** The package said "No roadmap in the merge order names this roadmap as a supplier". RationalAnalyticPrismatization, later in the order, consumes Layer 0. The section now says so.
5. **API labels.** The 32 standalone `API:` labels, a field-list form the house style excludes, became the prose lead-in "Prove the following API.".
6. **§3.1.** The restatement of Mathlib is replaced (above). The API now states the ring-level subgroup property with its hypothesis `|a|, |b| < 1` and the presheaf functoriality whose arc-sheafification is `U¹`.

## Adversarial mathematics pass

Each row is a statement, the instances tried, the values computed on both sides, and the result. "ok" means the computed values agree with the README.

| Statement | Instances | Values computed | Result / change |
| --- | --- | --- | --- |
| Conv.: seminormed ring axioms `|0|=0`, `|−1|≤1`, submult. | zero ring; `ℤ` with `|·|_∞` | `|1| = |(−1)²| ≤ |−1|² ≤ 1` and `|1| ≤ |1|²` give `|1| ∈ {0,1}`; zero ring `|1| = 0`; `|−a| ≤ |a|` | ok |
| Conv.: analytic ⇔ all `K(x)` nondiscrete (TBA §0.27, `A ≠ 0`) | `ℤ`; `ℚ_p`; `ℂ`; zero ring | `ℤ`: only `0` topologically nilpotent, so not analytic, and the trivial norm on `𝔽_p` is a discrete `K(x)`; `ℚ_p`: `p` is a topologically nilpotent unit, `K = ℚ_p` nondiscrete; `ℂ`: `1/2` gives `|1/2|ⁿ → 0`; zero ring: `M = ∅` and `1 = 0` is topologically nilpotent, so both sides hold | ok |
| Conv.: `A⟨f/g⟩` universal property | `f = 1 − e`, `g = e` on `C × C′` | locus `{|1−e| ≤ |e|}` = first point only (second point: `1 ≤ 0` fails); `e` unit gives `T = 0`, `e = 1`, ring `C`; `A₁₂ = C ⊗ C′ = 0`, so `F(C×C′) = F(C)×F(C′)` | ok |
| Conv.: `A⟨f/g⟩` needs unit ideal | `f = T`, `g = 0` on `C⟨T⟩₁` | relation `0·T₁ = T` gives `C⟨T₁⟩` (a disc), not the point `T = 0` | ok (README Check) |
| Conv.: `ℤ(1)` normalization | `ℂ`, `ℝ`, nonarch. | `ℂ`: `cofib(ℤ → ℤ⊕ℤ[1])[−1] = ℤ`; `ℝ`: conjugation is reflection on `S¹`, degree `−1`, so sign; nonarch.: `Ḡ_m[−1]`, degree 1 | ok |
| Conv.: `|ℓ| ≥ 1` iff archimedean or `ℓ` invertible in residue field | `|·|_q^s` on `ℤ`; trivial norm on `𝔽_ℓ`, `ℚ`; `|·|_∞^α` | `|ℓ|_ℓ^s = ℓ^{−s} < 1` and `ℓ = 0` in `𝔽_ℓ`; trivial on `𝔽_ℓ`: `0`, not invertible; trivial on `ℚ`: `1`, invertible; `ℓ^α ≥ 1` | ok |
| Conv.: mapping-formula normalization | `X = ℙ¹`, `j = 1` | `π_i = H^{−i}(ℙ¹, ℚ(1))`; `i = −2`: `CH¹ = ℚ = K₀^{(1)}`; `i = 0`: `H⁰(ℚ(1)) = 0 = K₂^{(1)}`; matches `K_{i+2j}` and CD 5.2.2 `Gr^j K_{2j−q}` with `q = −i` | ok |
| §0.1 compact assembly, Check 1 | `colim_n ℤ[T]_{r+1/n}` | colimit norm of `T` is `inf(r+1/n) = r`; at every stage `r+1/n > r`; transitions are the identity on `ℤ[T]`, so no other lift | ok |
| §0.1 Check 3 (Banach failure) | `z = Σ pⁿ x_n ∈ ℚ_p⟨x₁,x₂,…⟩` | Gauss norm `|z| = max_n |pⁿ|_p = 1/p ≤ 1`; coefficient `p^{n+1}` at `x_{n+1}` is nonzero, so `z ∉ Z_n` | ok |
| §0.1 unstable variant vs EDS §E5:presentability.4 | seminormed rings (not stable) | EDS's compactly assembled condition is for presentable stable ∞-categories; the initial object is `ℤ` and the terminal object the zero ring, so the category is not even pointed, and finite products are not coproducts (`ℤ × ℤ` against `ℤ ⊗ ℤ = ℤ`); it is not stable | wording fixed |
| §0.2 arc-cover, empty and infinite families | zero ring; `A ≠ 0` | `M(0) = ∅`, so the empty family covers; `M(A) ≠ ∅` (TBA §0.13), so maps to `0` never cover | ok |
| §0.3 `A((T))_{1/2}` norms | `A ≠ 0`; `A = 0` | `|T| = 1·2^{−1} = 1/2`, `|T⁻¹| = 2`; for `A = 0` everything is `0` | ok |
| §0.3 sum vs sup norm | `f = 1 + 2T` over `ℂ` | sup: `|f| = max(1, 2·½) = 1`, `|f²| = max(1, 4·½, 4·¼) = 2 > 1`; sum: `|f| = 2`, `|f²| = 4 ≤ 4` | ok |
| §0.3 both universal-property bounds | `u = 1/2`, `u = 1/3` over `ℂ` | `1 + 2u = 2` = sum norm; `u = 1/3`: `T^{−n} ↦ 3ⁿ > 2ⁿ = |T^{−n}|` | ok |
| §0.3 Check: trivially normed `k` | `k((T))_{1/2}` | `|a| = 1` on `k^×` (bounded both ways); `|1 + Tg|^m ≤ 2` gives `|1 + Tg| = 1`, so the only point is `2^{−ord}`: one point | ok |
| §0.4 residue fields of strict rings | `ℂ` with `|·|^{1/2}` | spectrum `{|·|^{1/2}}`; `|1/2|^{1/2} < 1` gives analytic; alg. closed, so strict, and the residue field is not `ℂ` with `|·|` | **fixed** (statement + Check) |
| §0.4 Check `ℝ` | `M(ℝ)` | `|·|^α ≤ |·|` at `x = 1/2` forces `α ≥ 1`; triangle inequality forces `α ≤ 1`; so one point, not alg. closed | ok |
| §0.4 Check trivial `k` not analytic | `k` alg. closed trivial | no element with `0 < |x| < 1` | ok |
| §0.6 quasi-pro-étale non-example | `C → C′` (Gauss point) | `|T − c| = max(1, |c|) ≥ 1` for all `c ∈ C`, so `C′ ≠ C`, while `Cont(pt, C) = C` | ok |
| §0.6 `A → A_Z` | `x ∈ Z` / `x ∉ Z` | base change `C` / `0` = `Cont(pt)` / `Cont(∅)` | ok |
| §0.8 free Banach ring `ℤ⟨T⟩_r` | `B` any Banach ring | `|Σ a_ν b^ν| ≤ Σ |a_ν|·r^{|ν|}` since `|m·1_B| ≤ |m|` | ok |
| §0.8 Check sup norm over `ℤ` | `(1+T)²`, `r = 1` | sup `1` vs `2` | ok |
| §0.8 Check radii over trivial `k` | `ρ < 1` | `k⟨T⟩_ρ` completes to `k[[T]]`, uniformization `ρ^{ord}`; value at `C` is the disc of radius `ρ`, not `k` | ok |
| §0.8 nonreduced invisible | `K[ε]/(ε²)` | strict `B` uniform: `|ε|² = |ε²| = 0` | ok |
| §0.8 doubled origin | `ϖⁿ` | `(ϖⁿ, ϖⁿ) → (0,0)`, and the limit is not in `{T₁ = T₂ ≠ 0}` | ok |
| §1.2 Check annulus `H¹` | closed annulus, `ℓ ≠ p` | units `cT^m(1+…)`, `O^×/ℓ = ℤ/ℓ`, `Pic = 0`, so `H¹ = ℤ/ℓ` | ok |
| §1.2 Check non-finitary presheaf | `S` infinite profinite | `colim_j ℤ^{S_j}` = locally constant `≠ ℤ^S` | ok |
| §1.4 `{|a| < r}` degenerate | `a = 0`; `r > ρ(a)`; `a = 1`, `r ≤ 1` | whole; whole; empty (`|1|_x = 1 ≥ r`) | ok |
| §1.5 `B(ℤ/2) → ∗` | automorphisms | `π₁ = ℤ/2 ≠ 0`, so not 0-truncated | ok |
| §1.6 arch./nonarch. split by `|2|` | `|·|^α` on `ℝ`/`ℂ`; nonarch. | `2^α > 1`; `|2| ≤ 1` | ok |
| §1.6 Example excision stalks | `[0,1]`, `U = (0,1]` | at `0`: `0 → ℤ → ℤ`; at `t > 0`: `ℤ → ℤ → 0` | ok |
| §1.7 fold map | `X ⨿ X → X` | fibre `Marc(C × C)`, `S` = 2 points | ok |
| §1.7 `ℙ¹_C` not qpé | fibre over `id_C` | Riemann sphere / Berkovich `ℙ¹`, connected and infinite, so not profinite | ok |
| §1.8 Check `Ḡ_m` not étale | Gauss-point `C′` | `T = c·u` would force `|c| = 1` and `T̄ = c̄ ∈ k`, but `T̄` is transcendental | ok |
| §1.8 Check `ℤ/n(1) ≃ μ_n` | `n` prime to `p` | binomial coefficients `binom(1/n, k) ∈ ℤ[1/n]`, `|·| ≤ 1`; `∏_{ζ≠1}(1−ζ) = n` gives `|1−ζ| = 1`; `Ḡ_m ⊗^L ℤ/n` has `H⁰ = 0`, `H^{−1} = μ_n` | ok |
| §1.8 Check complex points | `ℂ → C` contractive | nonarch. `C`: `|1/2|_C ≥ 1 > 1/2`; `|·|^α`, `α < 1`: `2^{−α} > 1/2` | ok |
| §2.1 `d(C⟨T⟩₁) ≤ 3` | `ℂ`; nonarch. | `ℂ`: disc covering dim `2` + `0`; nonarch.: tree dim `1` + scd `≤ cd + 1 ≤ 2` (Tsen gives `cd G_{C(T)} ≤ 1`, closed subgroup) = `3` | ok |
| §2.1 Check `G_m` not effective | `1 + aT`, `0 < |a| < 1` | Gauss distance to `1` is `|a| < 1`, so a unit; not constant | ok |
| §2.1 Check torsion | `ℓ ≠ p`; `ℓ = p` | `Hom(ℤ, ℤ/ℓ) = ℤ/ℓ ≠ 0`; `cofib(p) = 0` | ok |
| §2.5 degenerate free motives | `∅`, `A⁰` | `ℤmot[∅] = 0`, `ℤmot[X] = ℤ` | ok |
| §2.7 Check `ℤmot[ℙ¹]` | pushout | `cofib(ℤ⊕ℤ(1)[1] → ℤ⊕ℤ)` with `(1,−1)` and `0` gives `ℤ ⊕ ℤ(1)[2]` | ok |
| §2.7 Check non-existence | `{0} ⊂ [0,1]` | stalk at `0` of `∏ F_n` = `∏ℤ/⊕ℤ ≠ 0`, while `∏ (F_n)_0 = 0` | ok |
| §2.7(a) needs quasi-compactness | `⨿_ℕ Spec A`; `log(1+T)` | infinite fibres; `log ζ = 0` for `ζ ∈ μ_{p^∞}` with `|ζ−1| < 1` | ok |
| §2.7(c) bound | `ℙ¹_ℂ` | `d = 2 ≤ 4N = 4`; route `d(D^N) ≤ 3N`, Čech `≤ 3N + N` | ok |
| §3.1 one-units, field case | `ℚ₂`, `ℚ₃`, zero ring, `|u| ≠ 1` | `|−1−1|₂ = 1/2 < 1`; `|2|₃ = 1`; `U¹(0) = {0}`; `|u−1| = max(|u|,1) ≥ 1` | ok; restatement of Mathlib removed |
| §3.1 ring-level subgroup | `|a|, |b| < 1` | `|a + b + ab| ≤ max(|a|, |b|, |a||b|) = max(|a|, |b|)` | ok (hypothesis added to bullet) |
| §3.2 Checks | pseudouniformizer; residue unit | `|π| ≠ 1` = norm of one-units; `ū ≠ 1` | ok |
| §3.3 `ℓ`-th power on `Ḡ_m` | `ℓ = p`, `ℓ ≠ p` | `x^p ∈ 1 + C_{<1}` gives `x̄^p = 1`, so `x̄ = 1`, trivial kernel; `ℓ ≠ p`: `μ_ℓ ≅ ℤ/ℓ` | ok |
| §3.4 Checks | `ℂ`, `ℝ`, nonarch. | as Conventions row | ok |
| §3.5 annulus criterion | `T² − 1`, `T + a₀`, `T² + T/2 + 4` over `ℂ₂` | `max(1, 0) = 1`, `min over {2}` = `1`; `n = 1`: root `|a₀|`; Newton polygon `(0,2),(1,−1),(2,0)` gives slopes `−3, 1` and root norms `1/8, 2`; `min(4, 1) = 1 < 2` excludes it, `max = 4` admits it | ok (now cites NewtonPolygons §3.3) |
| §4.3 marked Jacobian | `r = 1`; `ℙ¹`, `{0,∞}` | `G_m^0` trivial; `(a,b)/scaling` gives `a/b`, so `J_Z = G_m`; Example `(t−x)/(t−y)` has values `1` at `∞` and `x/y` at `0` | ok |
| §4.3 divisibility in char `p` | `n = p` on `G_m(C)` | `C` alg. closed has `p`-th roots | ok |
| §4.4 test sections `(T−a_i)^m − ct` | roots, product coords | `ρ_i < |T−a_i| = |ct|^{1/m} < δ_i`; `|T−a_j| = |a_i−a_j| > ρ_j`; `i`-th coord `(−1)^{m+1}ct` (slope 1); `j`-th: `(−1)^m((a_j−a_i)^m − ct)`, a constant times a one-unit since `|ct| < δ_i^m ≤ |a_j−a_i|^m` | ok |
| §4.4 E10 witness | `T² − T − t` | `T₊T₋ = −t`, `(T₊−1)(T₋−1) = −t − 1 + 1 = −t`, degree vector `(1,1)` | ok |
| §4.4 Check `d` counts | open disc; open annulus | complements 1 and 2 discs, so `d = 0, 1` | ok |
| §4.6 Artin–Schreier class | `x̄^ℓ − x̄ = T` in `k[T^{1/ℓ^∞}]` | coefficients `c_{α/ℓ}^ℓ − c_α`; `c_1 ≠ 0` gives all `c_{ℓ^m} ≠ 0`; `c_1 = 0` gives all `c_{1/ℓ^m} = 1`; formal `−Σ T^{ℓ^m}` checks | ok |
| §4.6 Check additivity | `F(C × C)` | `(ℤ/ℓ)²`; the constant presheaf gives `ℤ/ℓ`, and `F(0) = 0` is forced | ok |
| §4.8 three clauses | `ℂ`, `p = 2`; `ℤ_p`; `ℤ` | `|2| = 2 ≥ 1`, both `D(ℤ)`; `|p| ≤ 1/p`; `ℤ`: both clauses fail globally | ok |
| §4.8 norm vs pointwise | `‖x‖ = 2^{−⌊v₂/2⌋}` on `ℤ₂` | `⌊(a+b)/2⌋ ≥ ⌊a/2⌋+⌊b/2⌋`; `‖2‖ = 1`; `‖2ⁿ‖^{1/n} → 2^{−1/2}`; points `c^{v₂}`, `c ≤ 2^{−1/2}` | ok |
| §4.9 Checks | `∅`; char-`p` perfectoid `K`; `ℂ_p` | tilt empty; `p = 0` forces `R♯ = R`; `μ_n(ℂ_p) ≅ μ_n(ℂ_p♭)` via `C^×/(1+C_{<1})` | ok |
| §4.9 route trace | `B_m → B_{m+1}` degree `p` | trace ∘ unit = `p`, invertible | ok |
| §5.1/5.2 Koszul sign | swap on `ℤ[1]⊗ℤ[1]` at `ℂ` | `−1` vs `+1` on `ℤ ⊗ ℤ` | ok |
| §5.4 Check `BG_m` | `ℂ` | one `ℚ` in each degree `−2n`; stage `ℙ¹` misses degree `−4` | ok |
| §6.1 Check `π₀ Kmot(C)` | `ℂ₂`, `ℂ₃` | `π₀ K(C_{<1}) = coker(O_C^× → k^×) ⊕ ker(ℤ → ℤ) = 0`, `π_{−1} = 0`, so `π₀ E_K = ℤ`, `[1/p]` gives `ℤ[1/2]`, `ℤ[1/3]`; `p·rank(1/p) = 1` impossible in `ℤ` | ok |
| §6.2 regular representation | `n = 2`; `w ≠ 1` | `U(2)/T = S²`, antipodal, `−1` on `H²`; `kwT = kT ⇔ w ∈ T`, so free, Lefschetz `0`; `dim = n!` | ok |
| §6.3 projectors | `ψ ∈ {1,2,4}` | `(−1)(−3)/3 = 1`; `−(1)(−2)/2 = 1`; `(3)(2)/6 = 1`; off-diagonal `0` | ok |
| §7.1 Check `ℚ_p` outside class | `I = pℤ_p` | `Tor₁ = I/I² = 𝔽_p ≠ 0`; `p^{1/n} ∉ ℚ_p` | ok |
| §7.1 route `B[1/T] = A` | `(p, −p) ∈ ℤ ⊕ A_{<1}` | `(p,−p)·(0,T) = (0, pT − pT) = 0`, so `T`-torsion, killed; every `a = Tⁿa/Tⁿ` | ok |
| §7.4 Check `ℚ_p` cofibre vs fibre | `KH = K` on regular rings | `π₀ KH(pℤ_p) = π_{−1} = 0`, `π₀ E_KH = ℤ`; fibre: `π₁ fib = 1 + pℤ_p`, coker `ℚ_p^×/(1+pℤ_p) ≅ ℤ × 𝔽_p^×` | ok |
| §7.4 Check uniformity | `ℓ¹` completion of `ℚ₂[T]` | `|2| = |2T| = 1/2`, `|2+2T| = 1`; uniform completion `ℚ₂⟨T⟩`: `|2+2T| = 1/2` | ok |
| §7.4 Check analytic cover | disc ∪ annulus | difference map kernel `≅ G`, image all of `G ⊕ ℚ` | ok |
| §7.5 Check fibre vs cofibre | `A = C` | `π₁ K(C_{<1}) = 1 + C_{<1}` (Matsumoto: `K₂(O_C) → K₂(k)` onto), fibre `π₀ = C^×/(1+C_{<1})`, cofibre `π₀ = ℤ` | ok |
| §7.7 gluing on `π₀` | `ℤ = ℤ[1/p] ×_{ℚ_p} ℤ_p` | arithmetic square of `ℤ` | ok |
| §8.1 Checks | `ℤ(−1)` sequence | `M_n = ℤ(n−1)`; `⊗ℤ(1)` shifts to `(ℤ(n))_n` | ok |
| §8.2 Example | `ℂ` | `f_*ℤ = ℤ ⊕ ℤ[−2]`; `⊗ ℤ(1)[2] = ℤ[2] ⊕ ℤ = ℤmot[ℙ¹]` | ok |
| §8.5 closed disc not smooth | `f_*f^!ℤ` | `ℤ(1)[2]` vs `(f_*ℤ)^∨ = ℤ`; `ℚ(1)[2] = (Ḡ_m⊗ℚ)[1] ≠ ℚ` | ok |
| §8.5 `βℕ` outside `P_B` | metrizability | compact subsets of a ball in `ℂ^N` are metrizable; `βℕ` is not | ok |
| §9.5 negative control | `E/𝔽̄_p` | intersection matrix `[[0,1,1],[1,0,1],[1,1,0]]`, det `= 0·(0−1) − 1·(0−1) + 1·(1−0) = 2`, so `dim CH¹(E×E)_ℚ ≥ 3 > 2 = dim(ℚ×ℚ)`; `n_{i,m} = 0` for `m ≠ 2i` by `K_{<0}(E) = 0` | ok |
| §9.6 Checks | `ℂ×ℂ`; `[0,1]`; Hilbert cube | `D(ℤ)²`; `RΓ_c((0,1]) = 0`; `H^n_c((0,1)^n) = ℤ` for all `n`, so `d = ∞` (AlgebraicKTheory §4.3 also gives no finite bound); `β(ℕ×D)` has dimension `2` | ok |
| §10.1 Check `p`-torsion | Artin–Schreier; Nisnevich | `ℤ/p = 0`; `k^×/p ≠ 0` for imperfect `k` | ok |
| §10.2 Checks | `𝔽̄₃`, `n = 2`; `n = 3`; `G_m` | `i ∈ 𝔽₉` with `i² = −1`; `μ₂ = ℤ/2`, `k^×/k^{×2} = 0`; `x³ − x = t` impossible (degree `1/3`); `RΓ(G_m, ℤ/2) = ℤ/2 ⊕ ℤ/2[−1]` | ok |
| §10.3 `f_*ℤ` | `K = k((T))` | `g_*ℤ = Hom(ℤ⊕ℤ(1)[1], ℤ) = ℤ ⊕ ℤ(−1)[−1]`; dual `ℤ ⊕ ℤ(1)[1] = ℤmot[G_m]`; `k((T))_{1/2}` = Laurent series with finitely many negative terms | ok |
| §10.4 Check `ℙ¹` | `j = 1` | `π_{−2} = ℚ`, `π₀ = 0` | ok |
| §10.5 Checks | `e = 2`; `X = Spec k` | length `2`, so `×2`; `[O′/u] ↦ [k] − [k] = 0`; weight-one `π₁ = (k^×⊗ℚ) ⊕ ℚ = Ḡ_m(C) ⊗ ℚ` | ok |
| §10.6 Checks | `𝔽̄_p` | `K(𝔽̄_p)_ℚ = ℚ[0]`, so `Map(ℤ(−j), ℤ)_ℚ = ℚ` iff `j = 0` | ok |
| §11.1 direction | two points | `g_*ℤ = ℤ² → ℤ`, `(a,b) ↦ a`; no map `ℤ → ℤ²` induced | ok |
| §11.3 `H = ℚ[t^±] ×_ℚ ℤ[1/p]` | `⊗ℚ`, `⊗𝔽_ℓ`, `⊗𝔽_p` | `ℚ[t^±]` (`BG_m`); `𝔽_ℓ ⊕ 0` (a point); `0` (empty); augmentation ideal `≅ ℚ[t^±]` flat, Tor amplitude `[−1,0]` | ok |
| §11.4 Check | `Hom(ℚ(i), ℚ(j)[m])` | `K_{2(j−i)−m}(𝔽̄_p)^{(j−i)}_ℚ ≠ 0` only for `i = j`, `m = 0` | ok |
| §11.5/11.6 band ring | `R[t/n]` | `t^k/m = (t/m)·t^{k−1}`, so `R ⊕ tℚ[t]`; `ℤ/2` over `R = ℤ[1/3]`: `A ⊗ ℚ = 0`, pair `(ℤ/2, 0) ≠ 0` | ok |
| §12.1 Checks | `B(ℤ/2)`; `Spa(K, O_K)` for `k = 𝔽_p(x)^{perf}` | not 0-truncated; `O_K ⊄ K⁺`; `𝔽_p` alg. closed in `k` | ok |
| §12.3 Checks | `n = 1`; `j_!` from generic point | all zero; specialization `0 → ℤ/n` not iso for `n > 1` | ok |
| Downstream consumers | grep of all roadmaps | RationalAnalyticPrismatization has a supplier subsection for this roadmap (Layer 0) and cites Layer 0 in five *Needs* lines | **fixed** (claim was false) |

Context and generality: `Suggested.lean` has no declarations, so no `variable` block can drop a hypothesis, and README generality does not have to match any Lean signature. In the README, the hypotheses checked in the pass are all in the statements themselves:

- `A ≠ 0` (for `|1| = 1`) and uniformity (for `A_{<1}` to be an ideal);
- `|p|_A < 1` against the pointwise condition;
- `n` prime to `p`;
- finite cohomological dimension (with the Hilbert-cube negative control);
- quasi-compactness in §2.7(a);
- separation in §§4.2 and 4.5.

## Unresolved

- **Gaps.** The twelve supplier gaps stay as declared: replete-postnikov, compact-hausdorff-dimension, animated-group-completion, breen-deligne-resolution, augmentation-ideal-filtration, einfty-fracture-square, the four K-theory gaps (`KH` model, excision, cdh descent, valuation-ring K-regularity), suslin-rigidity and padic-k-integers-oc. No roadmap provides them. Two neighbouring statements exist:
  - the abelian-group Breen–Deligne resolution (VStackSheavesAndLisseCategories VS2);
  - the spectrum-level arithmetic fracture square (a case of GeneralAlgebraicKTheoryPartII §4.8).

  Whether those owners take the gaps over is the intake's decision.
- **Open suppliers.** Eleven suppliers are still pull requests (listed above). This roadmap merges after them.
- **Resolver index.** The citation resolver indexed a newer main (`799d79c`) than this worktree (`e213fdd`). It found nothing missing on either.
- **Suspicious text.** None found in the package, reports or supplier texts.


Pull request: #2459 (roadmap/motives-and-algebraic-cycles-part-ii at c2ddf08)
