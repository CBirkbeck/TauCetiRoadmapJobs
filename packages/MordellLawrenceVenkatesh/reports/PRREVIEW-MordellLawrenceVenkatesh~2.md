# Review of MordellLawrenceVenkatesh (pull request #1231 at 99154a7)

**Verdict:** needs changes

## R01 (P2) — Import the existing orbit-map and local-closedness construction

Location: `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:688`, proof at 690: “its image is constructible (Chevalley) and homogeneous, hence open in its closure”.

Claim: §0.18 constructs the geometric orbit and proves local closedness again, citing only ReductiveGroups Layer 3 as background. This portion already has an owner on main.

Witness: `TauCetiRoadmap/ReductiveGroups/README.md:264` and 279, §§3A.1–3A.2 on main, construct the orbit map, stabilizer fibre, reduced locally closed orbit, and algebraically closed base-change comparisons. Their construction includes openness in the orbit closure.

Repair: put those precise supplier sections in Scope and ownership and Exact supplier contracts, and consume them in §0.18. Remove the repeated orbit construction/local-closedness proof. Retain the additional stabilizer-dimension formula, transporter theorem and finite-union bounds, explicitly saying how these extend the supplied interface; retain geometric base change over a nonclosed field. This is an import from main, not a dependency on a revision of ReductiveGroups.

Test of repair: GL₂ acting on A² has nonzero orbit A²∖{0}, open in its closure A², with stabilizer dimension 2 and orbit dimension 4−2=2. The zero orbit has dimension 4−4=0. The supplier supplies the two orbit models; the retained dimension formula gives the same numbers. No generality or application is lost.

## R02 (P3) — Use prose for implementation names absent from the acceptance test

Location: `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:1100`, also 1885, 1977, 2548, 2655 and 2657: “construct `integralGaussManin`”.

Claim: these backticked local declaration names denote constructions/results in `Suggested.lean`, as required by the README/Lean name contract.

Witness: `Suggested.lean` declares five names; none is `integralGaussManin`, `closedSurface_polygonModel`, `closedSurface_cyclicCentralizer`, `integralSymplectic_transvection_generation` or `branchedTransfer_deckSum`.

Repair: replace these five identifiers with mathematical prose and references to §§2.1a, 5.14a, 5.21a and 9.3. Keep the mathematical targets and Checks. Do not add heavy definitions or API padding to `Suggested.lean` merely to satisfy the name contract.

Test of repair: the constant connection still has ∇1=0; the genus-two polygon still has total angle 8·π/4=2π; integral rank-two shears still have determinant 1; for a hyperelliptic double cover of the sphere the transfer/deck identity remains 0=I+(−I). Only the undeclared identifier references disappear.

## Previous findings: disposition at this head

All seven previous findings are repaired. These are checks of the present text against the previous witnesses, not reliance on a prior verdict.

| Previous finding | Present passage and location in `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md` unless noted | Disposition and recomputed witness |
|---|---|---|
| R01, Jacobian sign | 142–145: “form is `E = −î`, with `E(Jx,x) > 0`”; §§8.11–8.12, 2519–2546 | Repaired. For a=1,b=i: intersection(a,b)=1, E(a,b)=−1, E(Ja,a)=1. At q=3 quotient intersection 2 gives Prym E=−2/2=−1. |
| R02, polarization degree | 2486–2490: “polarization degree `m` and isogeny degree (kernel rank) `m²`” | Repaired. Restricting the product with O_E(2[0]) gives polarization degree 2 and kernel rank 4, unchanged by restriction. |
| R03, fibration LES ownership | 310–313: “DGFloer Layer 1 item 2: the Serre-fibration homotopy exact sequence” | Repaired. Duplicate §5.14 is gone; the evaluation/configuration targets consume DGFloer. In the Hopf bundle the supplied boundary ℤ→ℤ has absolute degree 1 and cokernel 0. |
| R04, arbitrary transvection sets | 716: “`S ⊆ V` any set of vectors”; 718–722 finite-support/path reduction | Repaired. The infinite star {e}∪{f+ne} has pairings 1 with e, spans dimension 2 and generates Sp₂ of dimension 3. |
| R05, constant family over nontrivial cover | 1466–1468: “has finite permutation monodromy on the summands”; 1475–1483 | Repaired. Over t=u² the swap has order 2 and image dimension 0, versus required product dimension 6. Only the trivial-cover case asserts Γ=1. |
| R06, stale supplier names | 332–365: “§§R28.5.1–R28.5.2”, “§3.2 supplies the mean Hodge weight”; 387–403 and 2506 | Repaired. Fresh supplier reads resolve Faltings, Hodge weight, subgroup closure and Jacobian contracts. Pic⁰(E)=E has degree 1; the trivial filtered line has mean 0; closure of powers of 2 in G_m has vanishing ideal 0. |
| R07, Lean headings | `Suggested.lean:5`: “target signatures”; layer comments at 36, 74, 86, 99 | Repaired. Four required layer headings, five declarations and four admitted theorems; signatures and elaboration unchanged. |

## Verified sound

Reviewed all 166 numbered targets, their API paragraphs and Checks, all Needs lines, the 15 seeded targets, the headline inventory, the pinned declarations and the worker's gate. The table below records computed instances for every numbered target, including all sampled targets and both new findings' targets. These are discriminating tests, not proofs of the general theorems. R01 is an ownership defect despite correct instance values; R02 is a name-contract defect.

The head is `99154a70bb62c36f288fb7f904cc203a24232a22`. The outside-folder diff is empty. The worker's gate passes all reported scanners, dependency checking and targeted build: imports, no sorry'd data, no set-option, no stray files, no outside-folder edits, and build all report zero failures. Independent dependency checking returned:

```text
depcheck: 205 roadmaps, 1661 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No supplier gaps are declared. R01's correct supplier is on main and adds no upward edge. The scope is a substantive additional proof route, rather than replanning the existing heights or subspace-theorem roadmap. No computational algorithm, copied source passage, sorry'd data or free-predicate replacement was found.

The targeted build of `TauCeti.AlgebraicGeometry.Cohomology.Genus` succeeded. Direct `lake env lean` elaboration of the target succeeded with exactly four sorry warnings. A separate scratch file with `#check @name` for every declaration elaborated successfully. The centralizer retains the scalar tower, finite-dimensionality, fixed-field, finite-order and bijectivity binders. Mordell retains smoothness, properness, geometric connectedness, finite-dimensional H¹(O), dimension one and genus at least two. The S-unit set is a Finset; the Schönflies hypotheses are embeddings, with arbitrary homeomorphism of the ranges. No dropped-hypothesis repair is needed.

The one-tactic probes rfl, infer_instance and simp failed on each of the four admitted theorems. Object-based pinned-library searches found no one-lemma exact proof of them. No padding finding is made. The five declarations comprise one real centralizer definition and four substantive headlines.

The six end theorems are §§4.5, 6.10, 7.9, 10.9, 10.10 and 11.6. S-unit and Mordell finiteness are stated on native carriers. The four others are named in the module docstring with the absent period-map, abelian-by-finite family, surface or lifted-action interfaces. Centralizer dimension and Schönflies extension are also stated. The docstring accounts for the deeper intermediate representation finiteness, friendly-place identities, transport, period density, Hurwitz/Prym construction, normal form and algebraic monodromy results (§§1.2, 1.11, 1.13, 1.15, 2.11, 3.18–3.19, 4.4, 8.7, 8.13, 9.11, 0.21, 0.26). No statable omitted headline was identified. All 35 explicitly labelled definition/construction sections have API statements and at least three Checks. The only new form defect found is R02.

Pinned interfaces opened (pins match `lake-manifest.json`):

| Pin and file | Declaration or native content checked | Boundary retained |
|---|---|---|
| Mathlib `6b7abb3`, `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65` | `Set.integer` | Valuations ≤1 outside the actual set |
| Same file:108 | `Set.unit` | Units of the field with valuation exactly 1 outside the set; no built-in finiteness of the set |
| Mathlib, `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:41` | `FundamentalGroup.mul_def` | `p*q=q.trans p` |
| Mathlib, `Mathlib/RingTheory/Grassmannian.lean:66` | `Module.Grassmannian` | Finite projective quotient of fixed rank at every prime, not merely total dimension |
| Tau Ceti `a91d3aa`, `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64` | `AlgebraicGeometry.Scheme.genus` | Explicit finite-dimensional `H¹(O)` guard; smoothness/properness are not in this definition |
| Tau Ceti, `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:207` | `Set.unit_fg_of_units` | Finite set and finitely generated base-ring units |
| Tau Ceti, `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/TorusGeneration.lean:145` | `GLSymplecticFin.eq_top_of_root_subgroups` | Every field, all root groups |
| Tau Ceti, `TauCeti/Algebra/AlgebraicGroup/Symplectic/Connected.lean:124` | `geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` | Geometric connectedness of the coordinate group |
| Tau Ceti, `TauCeti/Geometry/Hodge/WeightOne/RiemannForm.lean:80` | `AlmostComplexStructure.IsRiemannForm` | Positivity is `E(Jx,x)>0` |
| Tau Ceti, `TauCeti/Geometry/Hodge/WeightOne/Standard.lean:174` | `almostComplexStructure` | `(x,y)↦(−y,x)` |
| Same file:195 | `riemannForm` and `riemannForm_apply` at 204 | `(x,y),(x′,y′)↦yx′−xy′` in rank two |
| Same file:225 | `isRiemannForm_riemannForm` | Positive standard example, excluding the opposite form |

Cross-roadmap citations were resolved against main or the supplied open head, rather than inferred from a declaration's name. The worker's six unresolved-name leads were inspected, not treated as six defects. For example, `Sheaf.derivedPushforward` is present in SchemeAndStackFoundations §2.1 at line 3286; the base-linear realization comes from DerivedDeRhamCohomology §5.8. DiophantineApproximationAndTranscendence §2.4 and its `Suggested.lean:1384` supply the general unit equation, and HeightsRationalPointsAndObstructions §§5.12, 6.4 supply the Mordell statement. The local signatures use this roadmap's namespace and introduce no fully qualified name collision.

Resolved supplier witnesses include the following. Locations are in `TauCetiRoadmap/<supplier>/README.md`, except where stated; sections disambiguate minor line shifts in tool-rendered open-head copies.

| Supplier, file `TauCetiRoadmap/<name>/README.md` unless noted | Locator read | Contract/convention verified |
|---|---|---|
| DGFloer, main | 131–133, 481–521 | Existing fibration LES owner |
| MetaplecticAutomorphicForms | §0.9a, 180–192; §3.2, 598–604 | Adapted basis versus prescribed basis; transitivity supplied; local inverse-transpose extension is distinct |
| FaltingsFinitenessAndIsogenyTheorems | §§R28.5.1–R28.5.2, 2018–2078 | Weil-polynomial finiteness and uniform Frobenius test set; conjugates needed to span image algebra |
| ArithmeticGaloisRepresentations | §§1.3, 1.6–1.8, 1.12; §7.6, 4507–4541 | Continuous induction, lattices, semisimplification/trace comparison, subgroup closure |
| PadicHodgeTheory | §§3.2–3.3, 665–703; §§8.1–8.3, 1378–1443 | Filtration jump −1 on `ℚ_p(1)`; inverse-dual Tate-module Frobenius; rational comparison |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | §§R07.3.1–R07.3.2, 4582–4671 | `t_H`, negative jumps, `N=0` subcategory; no extra filtration–Frobenius compatibility |
| AbelianSchemesAndArithmeticModuli | §§A0.1–A0.2, A1.1, A1.6; A2.5, 1197–1215; A3.7, 1628–1645; A4.3–A4.4, 1899–1961; A5.1–A5.7 | Actual abelian-scheme carrier, base change, polarization degree and sign, H¹ dual to Tate module |
| AlgebraicModuliForArithmeticGeometry | §§1.3, 601–619; 1.7, 968–988; 7.9, 9806–9824; 9.1, 10274–10295 | Quotient Grassmannian; minors on nilpotents; identity component over reduced base; coordinate supplier |
| JacobianChallengePartII | §§1.2–1.4, 211–278 | Unpointed relative Jacobian, arbitrary base change, canonical principal polarization |
| HeightsRationalPointsAndObstructions | §§5.12, 2586–2594; 6.4, 2928–2936 | Native Mordell statement, independent proof route |
| DiophantineApproximationAndTranscendence, main | §2.4 | Existing general unit-equation owner |
| RestrictedPowerSeries, main | §2.4, 364–384 | Strassmann on a closed ball, including complete isometric extensions |
| FuchsianOrbifolds, main | Layer 2, 235–259 | Polygon side identifications, angle cycles, local finiteness |
| NeronModelsAndSemistableAbelianVarieties | §5.1, 2933–2953 | Prime-to-residue-characteristic Tate module; not unramified p-adic cohomology at p |
| DeligneWeightsAndPurity | §§0.1–0.2, 560–608; §1.4, 959–967 | Integral purity separate from Weil modulus; geometric H¹ versus arithmetic Tate Frobenius |
| DerivedDeRhamCohomology | §§2.12–2.13, 3250–3302; §5.8, 4509–4614 | Ordinary base-linear complex and strict filtered sheaf realization |
| ComplexComparisonPartII | §§C0.4, C4.5, C5.1–C5.2; §C6.2, 4126–4147 | Analytic/de Rham comparison; Riemann existence beyond smooth curves |
| InverseGaloisAndArithmeticFundamentalGroups | §§IG.1.2–IG.1.3; IG.3.1, 2554–2574 | Peripheral inertia, base extension, normalization of punctured covers |
| EtaleDualityAndPerverseSheaves | §§0.5–0.7, 668–918 | Curve trace, Tate line and coefficient conditions |
| EllipticLegendreCharacterInterfaces | §§0.1, 65–86; 0.4, 145–159 | Native equation, Δ, c₄, singular parameters and ellipticity |
| ReductiveGroups, main | §§3A.1–3A.3, 264–324 | Orbit maps and local closedness already owned; new R01 |
| NumberFieldArithmetic, main | §§1.5, 602; 2.3, 647; 5.3, 1393; 5.6, 1493 | Unramified composita, Artin symbols, semilocal tensor factors and decomposition groups |
| Chebotarev, main | Layer 10, 410–423 | Infinitely many primes in each Frobenius class, finite avoidance |
| HeightsAndUnits, main | §4.2, 439–454 | Finite-set S-unit rank and finite generation; native result consumed |
| AlgebraicTopology, main | Stages 1–6 and 8, 289, 326, 471, 499, 849, 946, 1602 | Groupoids, chains, duality, unbranched transfer and relative homotopy; branched transfer is additional here |
| EtaleCohomologyFoundations, main | F.0.A1, 284; F.0.A2, 368; F.2.1–F.2.2, 508–524 | Actual decomposition/inertia, arithmetic exact sequence, proper/smooth base change with coefficient hypotheses |
| WeightsInEtaleCohomology, main | R34.1–R34.2, 122–292 | Geometric H¹ weight 1, Tate-module inverse roots, separate integrality condition |
| AlgebraicCurves, main | Layer 12E, 1640–1657 | Smooth proper geometrically connected case of function-field/cohomological genus comparison |
| ModularCurves, main | Layer 4C, 1100–1109 | Legendre equation over the ring with 2, λ and λ−1 inverted |


The ownership audit used `roadmaps grep` by object, `roadmaps show`, the main checkout, board package material, and supplied sibling heads. Searches covered orbit maps, unit groups, Lagrangians, Gauss–Manin connections, Hurwitz spaces, reduced Pryms, primitive homology, symplectic generation, S-unit equations and curve finiteness. The new collision is R01. The integral Gauss–Manin extension differs from the field-valued supplier; branched transfer differs from the supplied unbranched transfer; connected-graph generation differs from generation by all root groups. The prescribed-basis extension differs from the supplied existence of an adapted basis. GaloisSectionsPadicPeriodMaps, supplied head, lines 81–95, consumes this roadmap's constructions and adds ramified/model-independent variants; it is not a supplier here. Main-roadmap shape was compared with RestrictedPowerSeries, DGFloer and ClassFieldTheory. Additional open folders absent from the brief were not used as authoritative ownership witnesses.

All 15 seeded locators were checked against readable text. None of the target README's locators is explicitly labelled unverified. The LV20 locators below are arXiv version 3 with its own page numbers. Each mathematical source entry is paraphrased.

| Target | Source and locator read | Hypotheses and support |
|---|---|---|
| 0.8 | LV20 lines 1959–1963, §8.3, p.42 | Prime q; identity, nonzero translation, and nontrivial multiplier have exactly the three asserted types. |
| 0.12 | LV20 lines 1277–1282, proof of Theorem 5.4, p.28 | Perfect finite-abelian pairing and isotropic subgroup; annihilator cardinality gives the stated square bound. The README supplies the general duality argument. |
| 2.6 | LV20 lines 772–780, §3.3, pp.16–17 | Integrable connection over the integral coefficient ring, characteristic-zero fraction field, specified initial value. The README retains factorial denominators rather than asserting integral solution coefficients. |
| 2.7 | LV20 lines 777–789, §3.3, p.17 | Factorial valuation bound gives convergence on the stated residue disk for unramified coefficients and p>2. The p=2 exponential test fails exactly as recorded below. |
| 3.3 | MetaplecticAutomorphicForms §0.9a, README 180–192 | Supplied Lagrangian transitivity over every field, including characteristic two; not the half-matrix formula requiring 2 invertible. |
| 5.18 | FM12 lines 1681–1692, Theorem 1.14, printed p.45 | Hamstrom theorem for finite-type surfaces with the listed exceptional surfaces; the roadmap's χ<0 range excludes them. |
| 5.24 | Hat02 lines 2723–2725 and 2758–2760, Propositions 1.33–1.34, printed pp.61–62 | Lifting criterion uses path-connected, locally path-connected domain; uniqueness fixes the lifted basepoint. Inverse lifts account for deck ambiguity. |
| 8.3 | LV20 lines 1750–1765, proof of Lemma 7.4, p.38 | Surjectivity and centre-free finite G give unique inverse stabilizer element. The roadmap spells out passage to the overgroup action. |
| 8.7 | LV20 lines 1607–1624, Proposition 7.1, pp.34–35 | Smooth projective curve of genus at least two, finite centre-free G, nontrivial peripheral monodromy; finite étale Hurwitz parameter space and specified equivariance. |
| 9.3 | LV20 lines 1832–1848, §8.2, pp.39–40 | Primitive kernel is the transfer-orthogonal complement. The general branched form is supported by the README's peripheral-loop quotient argument from supplied unbranched transfer. |
| 9.6 | LV20 lines 1965–1982, Lemmas 8.2–8.3, p.42 | The source omits necessary curve/power restrictions; the roadmap explicitly requires nonseparating curve and positive multiple of monodromy order. Its corrected formula is rank=k−1. See Source issues. |
| 10.3 | LV20 lines 2178–2180 and 2250–2264, Lemma 8.10 and its proof, pp.48,50–51 | Signed primitive representatives, rank at least two. The general affine-span step is expanded in the roadmap by the annihilator argument, not assumed for rank one. |
| 10.8 | LV20 lines 2108–2109, §8.5, p.46 | Normal subgroup step in an almost-simple product; characteristic zero and noncentral projections retained, using §0.17. Finite central subgroups remain possible. |
| 10.9 | LV20 lines 1878–1908, Theorem 8.1, pp.40–41 | Genus at least two, prime q at least three, common finite-index stabilizer, actual point-pushing action on the primitive spaces. |
| 10.10 | LV20 lines 1916–1938, §8.2.3, p.41 | Equivariant Prym/primitive comparison and isogeny identify factors; dualization and the nonzero polarization scalar preserve the symplectic groups. |

All 15 works in References were submitted to the source service or read from its legal cache. Thirteen yielded readable text; BO78 and Fal83 limitations are below. The Stacks relative-de-Rham PDF contains Tags 0FMM–0FMN. No source file was copied into the repository or report.

Adversarial values follow. “Retain” means the displayed instance requires no mathematical change; it does not certify the entire theorem. The extra convention rows fix order, duality and positivity.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 | E=ℚ(i), splitting field ℂ; inseparable negative control | E⊗ℂ≅ℂ², dimensions 2=1+1; inseparable degree-p tensor has nilpotents, not p distinct factors | Pass; separability matters | Retain |
| 0.2 | E=k², M=k²⊕k; empty index | e₁M=k², e₂M=k, dimensions 3=2+1; empty sum=zero module | Pass | Retain |
| 0.3 | E=ℂ/F=ℝ, σ=conjugation, φ=σ on one coordinate; φ=0 | Multiplication by a commutes iff a=ā; centralizer ℝ has dimension 1. For φ=0 all ℂ-linear endomorphisms commute | Pass; bijectivity belongs to the dimension theorem | Retain |
| 0.4 | Same example; σ=id on k² with φ=id; V=0 | dim centralizer 1≤1²; 4=2²; 0=0² | Pass; Lean headline | Retain |
| 0.5 | A=k, k×k, k[ε]/ε² | Unit conditions a≠0; ab≠0; a≠0 for a+bε, respectively; dimensions 1,2,2 | Pass; nilpotents retained | Retain |
| 0.6 | Unramified coefficient extension of degree 8, rank 2; rank 0 | Centralizer bound ≤4 independent of 8; rank-zero bound 0 | Pass; ramified extension is outside hypotheses | Retain |
| 0.7 | Aff(5), (2,1),(3,4); Aff(2) | Composition (1,4); order 5·4=20, order Aff(2)=2 | Pass; permutation convention fixed | Retain |
| 0.8 | Aff(5): identity, translation, multiplier −1, multiplier 2 | Cycle lengths (1,1,1,1,1), (5), (1,2,2), (1,4) | Pass | Retain |
| 0.9 | Aff(3)=S₃; q=2 negative control | Centre and permutation centralizer have order 1; normalizer order 6. At q=2 the centre has order 2 | Pass; q≥3 essential | Retain |
| 0.10 | q=3, two commutators | Fibres at translations 0,1,2 have sizes 486,405,405; nonzero total 810, quotient by 6 gives 135 | Pass; direct finite computation | Retain |
| 0.11 | k=2,N=6; k=4,N=2; N=1 | Counts 24=36(1−1/4)(1−1/9), 15=16(1−1/16), 1=1 | Pass | Retain |
| 0.12 | M=(ℤ/5)², standard pairing; B a line or whole M | Line size 5, square 25=#M, pairing zero; whole M size 25, square 625>25, pairing(e,f)=1/5 | Pass; isotropy separates models | Retain |
| 0.13 | Reducible symplectic plane; irreducible plane excluded | Minimal invariant line has dimension 1=2/2; an irreducible plane has no proper nonzero invariant line | Pass | Retain |
| 0.14 | ω(e,f)=1; v=e, r=2; v=0 | T_e²(f)=f+2e; N²=0; inverse parameter −2; T₀=id | Pass | Retain |
| 0.15 | ℤ and 2ℤ in G_a; disconnected finite subgroup | Both closures G_a, dimension 1; finite image has identity component of dimension 0 | Pass; finite index compares components | Retain |
| 0.16 | n=1,2,3; n=0 excluded; opposite characteristic | Dimensions 3,10,21 equal n(2n+1); n=0 gives zero algebra, not simple | Pass at stated char 0; source basis typo below | Retain |
| 0.17 | Sp₂; zero space excluded | Centre {I,−I}, order 2; Lie centre 0. Sp(0) has order 1 | Pass | Retain |
| 0.18 | GL₂ acting on a nonzero vector; zero vector | Orbit dimensions 2=4−2 and 0=4−4 | Values pass; ownership overlap | R01: import orbit construction/local closedness |
| 0.19 | Powers of T_e over ℚ; characteristic-p negative control | T_e^n=I+nN, infinite parameters; in char p, T_e^p=I and at most p parameters | Pass; char 0 essential | Retain |
| 0.20 | e,f in a symplectic plane; parallel vectors | Pairing 1 gives upper/lower root groups and dim SL₂=3; pairing 0 gives only one root group, dim 1 | Pass | Retain |
| 0.21 | Two orthogonal symplectic planes; add e₁+e₂; infinite star S={e}∪{f+ne} | Graph components 2→1, closure dimensions 6→10; infinite star pairs with e by 1 and spans ℚ², giving Sp₂ dimension 3 | Pass | Retain |
| 0.22 | sl₂ diagonal versus full product | Surjective projections in both cases; dimensions 3 versus 6; kernels 0 versus sl₂ | Pass; both alternatives realized | Retain |
| 0.23 | sl₂×sl₂ | Four factor ideals have dimensions 0,3,3,6; diagonal dimension 3 is not an ideal: bracket with (e,0) leaves diagonal | Pass | Retain |
| 0.24 | Three sl₂ factors; pairwise diagonal identification | Full product dim 9, total diagonal dim 3; pairwise onto fails on each diagonal pair | Pass | Retain |
| 0.25 | Sp₄×Sp₄ with (transvection,I) | Fixed-space dimensions 3 and 4; product dimension 20, graph dimension 10 | Pass; unbalanced pair excludes graph | Retain |
| 0.26 | One factor and two factors; diagonal negative control | One factor conclusion dim 3; two independent Sp₂ factors dim 6; diagonal dim 3 fails pairwise test | Pass | Retain |
| 1.1 | Trivial rank-two rep versus nontrivial unipotent extension | Both traces 2 on every element; image-algebra rank bound 2d²=8; representations need not be isomorphic | Pass; target compares traces without assuming semisimplicity | Retain |
| 1.2 | Rank 0; rank-one weight-zero integral pure characters; nonsemisimple extension | Rank-zero class count 1; rational weight-zero eigenvalues ±1; trivial/unipotent rank-two traces both 2 | Pass; semisimplicity retained | Retain |
| 1.3 | ℚ, ℚ(i) | Conjugation identity on ℚ; i↦−i has order 2 on ℚ(i), fixed subfield degree 1 | Pass | Retain |
| 1.4 | ℚ(i); ℚ(∛2); ℚ | Maximal CM-or-real fields ℚ(i), ℚ, ℚ; degrees 2,1,1 | Pass | Retain |
| 1.5 | K=ℚ(i), primes 2,3,5 | 2 ramified; 3 inert with residue degree 2 and friendly; 5 split with degree 1 and not friendly | Pass | Retain |
| 1.6 | Embeddings of ℚ(i), exponents (0,1); totally real ℚ | Conjugate sums 1=1; over ℚ the relation is 2m=w, so w=1 has no integral solution | Pass | Retain |
| 1.7 | F=ℚ_p, u=1+p; uniformizer p | χ(Art(u))=(1+p)⁻¹; χ(Art(p))=1, not p⁻¹ | Pass; units/inertia distinction | Retain |
| 1.8 | Trivial global character and a principal idele | Every local factor 1, product 1; principal idele's global Artin value 1 | Pass | Retain |
| 1.9 | K=ℚ(i), inert place over 3, place-constant exponents | Both exponents m, conjugate sum 2m=w; w=2 gives m=1; w=1 impossible | Pass | Retain |
| 1.10 | χ_cyc⁻¹ and its dual | Exponents 1,1 sum 2=weight; dual exponents −1,−1 sum −2 | Pass | Retain |
| 1.11 | χ_cyc⁻¹, unit u and uniformizer p | On units η²Art(u)=u²=Norm(u)²; on p left 1, proposed unrestricted right has valuation 2 | Pass as written on units; source error below | Retain |
| 1.12 | Jumps −1,+1; zero space; nonstrict bijection | t_H=−1+1=0, mean 0/2=0; rank 0 has no mean; identity from jump 0 to jump 1 has 0<1 | Pass | Retain |
| 1.13 | H¹ of a good elliptic curve; ℚ_p(1) | H¹ jumps 0,1: t_H/rank=1/2=w/2; twist gives −1=−2/2 | Pass | Retain |
| 1.14 | Induction of the unit from degree-r extension | Rank r, de Rham dimension r; filtration concentrated at 0, t_H=0 | Pass; crystalline variant needs unramified extension | Retain |
| 1.15 | Degree-two extension, unit representation; induced twist | Weighted sums 0=2·0; for twist, −2=2·(−1) | Pass; local degrees supply multiplicities | Retain |
| 1.16 | Elliptic H¹; dimension-zero abelian variety | Ranks 2 and 0; elliptic Hodge jumps 0,1; determinant has weight 2 and pairing target ℚ_p(−1) | Pass | Retain |
| 2.1 | Fixed elliptic A over split degree-two cover; empty cover | Geometric fibre A⊔A, H¹ rank 4=2·1·2; empty fibre rank 0, not A×A as a fibre | Pass | Retain |
| 2.1a | Constant line, coordinate t; square-zero base | ∇(t·1)=dt while t∇1=0; curvature d²=0; dε need not vanish though ε²=0 | Values pass | R02: replace undeclared identifier with prose |
| 2.2 | Legendre λ=0,2 over ℤ[1/2]; doubled-origin control | Δ(0)=0, Δ(2)=64 a unit after inverting 2; two extensions at the doubled special point violate separatedness | Pass | Retain |
| 2.3 | Constant elliptic family with discriminant −64 | Inverting 2 makes Δ a unit; enlarging S again retains the identical generic family | Pass | Retain |
| 2.4 | Degree-two split cover, elliptic fibres | E=k², E-rank H¹=2, k-rank=4; F¹ ranks (1,1), total 2 | Pass | Retain |
| 2.5 | A¹ over ℤ_p at reduction 0; two coordinates | Residue fibre pℤ_p, not all ℤ_p; m=2 gives (pℤ_p)², reduction identically (0,0) | Pass | Retain |
| 2.6 | y′=y, y(0)=1; zero initial value | Coefficients 1/n! and 0; recurrence (n+1)a_(n+1)=a_n | Pass; characteristic-zero denominators | Retain |
| 2.7 | exp(z), p=3; p=2, n=2^k | v₃(3^n/n!)≥n/2→∞; v₂(2^(2^k)/(2^k)!)=1, so terms do not tend to zero | Pass; p>2 is used | Retain |
| 2.8 | y′=y over ℂ | Ratio of successive absolute terms at z is abs(z)/(n+1)→0; unique normalized solution exp(z) | Pass | Retain |
| 2.9 | Constant connection; scalar equation y′=y | T(a,b)=1 or exp(b−a); T(b,c)T(a,b)=exp(c−a), T(a,a)=1 | Pass | Retain |
| 2.10 | Noncommuting A=[[1,1],[0,1]], B=[[1,0],[1,1]] | AB=[[2,1],[1,1]]; (AB)⁻¹=[[1,−1],[−1,2]]=B⁻¹A⁻¹ | Pass; opposite-group convention | Retain |
| 2.11 | Constant crystalline family; unit Tate line | Transport 1 gives φ_yT=Tφ_0=φ_0; ℚ_p(1) has φ=p⁻¹σ | Instance passes; BO78 locator unread | Retain |
| 3.1 | Symplectic plane, a line and the whole plane | Line dimension 1 and orthogonal dimension 1; whole plane dimension 2, pairing(e,f)=1 so not isotropic | Pass | Retain |
| 3.2 | Prescribed vector 2e; characteristic two | ω(2e,f/2)=1; inverse-transpose formula PᵀP⁻ᵀ=I also in char 2 | Pass; differs from unprescribed adapted basis | Retain |
| 3.3 | Lines ke,kf in k² | Matrix [[0,−1],[1,0]] has determinant 1 and sends ke to kf | Supplied result, not a new proof | Retain |
| 3.4 | Graphs in k² and k⁴ | In rank one every 1×1 matrix symmetric; [[0,1],[0,0]] has antisymmetric defect [[0,1],[−1,0]]≠0 | Pass | Retain |
| 3.5 | d=1, axes and diagonal | Charts transverse to ke and kf cover ℙ¹; diagonal intersects each axis in dimension 0 | Pass | Retain |
| 3.6 | d=0,1; dual-number graph | LGr=Spec k or ℙ¹; graph slope ε over k[ε]/ε² differs from slope 0 despite equal geometric points | Pass; actual functor retained | Retain |
| 3.7 | d=0,1,2,3 | Dimensions 0,1,3,6 equal d(d+1)/2; standard charts have those parameter counts | Pass | Retain |
| 3.8 | E=k², V=E²; W=k²×0 | Correct component ranks (1,1), total 2; W has ranks (2,0), same total 2 but is rejected | Pass | Retain |
| 3.9 | E=k²,d=1; degree-3 field factor | Period dimensions 2=2·1 and 3=3·1; split varieties (ℙ¹)² and (ℙ¹)³ | Pass | Retain |
| 3.10 | A¹_ℂ and two disjoint copies | Algebraic and analytic component counts 1 and 2 respectively | Pass | Retain |
| 3.11 | Constant A over t=u²; zero family; Legendre | Nontrivial double cover gives image C₂ of dimension 0<6; trivial cover gives image 1; zero family gives Sp₀=1; Legendre closure dimension 3 | Pass | Retain |
| 3.12 | Constant transported filtration; changing frame | T=1 gives Φ(y)=F¹, Φ(y₀)=h₀; T sends T⁻¹F¹ back to F¹ exactly | Pass | Retain |
| 3.13 | Same constant family; backward deck transport | Period constant h₀; equivariance uses B⁻¹A⁻¹, not A⁻¹B⁻¹, for the two matrices above | Pass | Retain |
| 3.14 | Constant frame; scalar horizontal exp series | Coefficients (1,1,1/2,1/6,…) are the same over ℂ and K_v; different evaluations use the same coefficients | Pass | Retain |
| 3.15 | Constant family | Orbit of h₀={h₀}; period-image closure={h₀}, both dimension 0 | Pass; no unconditional density | Retain |
| 3.16 | f=z₁; zero series | Nonzero f at (a,0,…)=a≠0 for nonzero small a; zero series evaluates to 0 everywhere | Pass; an open polydisk is essential | Retain |
| 3.17 | Formal map z↦(z,z²) | Relation Y−X² evaluates to 0 over both fields; image closure is the same parabola of dimension 1 | Pass | Retain |
| 3.18 | Full Sp₂ action; constant-family negative control | Orbit ℙ¹ dimension 1 versus constant orbit dimension 0; full-monodromy hypothesis distinguishes them | Pass | Retain |
| 3.19 | f=z(z−p) on pℤ_p; m=2 control f=z₁ | Zero set {0,p}, size 2; two-variable zero set {0}×pℤ_p infinite | Pass; curve hypothesis matters | Retain |
| 4.1 | Elliptic good reduction; ℚ_p(−1) trace line | H¹ dimensions 2=2, filtration dimensions 2,1,0; trace line has jump 1 and φ=pσ | Pass | Retain |
| 4.2 | Constant filtration, φ diagonal | T=id gives identical φ and filtration on both sides; changing filtration alone changes the filtered object | Pass | Retain |
| 4.3 | Rank-two φ with distinct eigenvalues | Centralizer dimension 2; scalar φ gives dimension 4; both ≤2² | Pass | Retain |
| 4.4 | Local degree 8,d=1; constant family control | c≤4<8=period dimension; constant period closure dimension 0 cannot satisfy c<dim Z | Pass; headline criterion | Retain |
| 4.5 | d=4 with simple Frobenius spectrum; scalar control | Centralizer dim 8<10=dim LGr₄; scalar centralizer dim 64 fails inequality | Pass; headline hypotheses discriminate | Retain |
| 5.1 | Disk, annulus, punctured torus | Types (0,1,0),(0,2,0),(1,0,1); χ=1,0,−1 | Pass; puncture differs from boundary chart | Retain |
| 5.2 | Unit circle, identity and reflection | Plane extensions z↦z and z↦z̄ restrict exactly; reflections reverse orientation but remain allowed homeomorphisms | Pass; Lean headline | Retain |
| 5.3 | Tetrahedral sphere; triangulated disk | Sphere V−E+F=4−6+4=2, every edge has two faces; disk has boundary edges in one face | Pass | Retain |
| 5.4 | Sphere, torus, pair of pants | χ=2,0,−1; formula 2−2g−b gives 2,0,−1; boundary counts 0,0,3 distinguish types | Pass | Retain |
| 5.5 | Torus and annulus | Torus matrix [[0,1],[−1,0]], determinant 1; annulus rank-one H₁ has zero form and radical rank 1 | Pass; E=−intersection in Jacobian comparison | Retain |
| 5.6 | g=2 closed; g=1,b=1; g=0,b=3 | H₁ ranks 4,2,2; radical ranks 0,0,2 | Pass | Retain |
| 5.7 | Torus cut along a nonseparating curve; separating sphere equator | Torus becomes annulus, χ stays 0; sphere becomes two disks, total χ=2 | Pass | Retain |
| 5.8 | Torus slopes (2,3) and (2,0) | gcds 1 and 2: first primitive embedded loop, second cannot represent nonzero embedded class | Pass | Retain |
| 5.9 | Disk, annulus, three-punctured sphere | Mapping class groups 1, ℤ, S₃; pure three-punctured group 1 versus full group order 6 | Pass | Retain |
| 5.10 | Two primitive torus classes e and 2e+3f | gcds 1,1; matrix [[2,1],[3,2]] determinant 1 sends e to 2e+3f | Pass | Retain |
| 5.11 | One annular twist; inverse orientation | Lifted angle displacement across annulus 1; inverse twist displacement −1; boundary points fixed modulo ℤ | Pass | Retain |
| 5.12 | Torus a,b, î(a,b)=1; separating curve | T_b(a)=a+b; T_a(b)=b−a; matrices as README; separating class gives zero intersection contribution | Pass | Retain |
| 5.13 | (2,3),(2,0),(0,0) in torus H₁ | gcd 1,2,0; first represented, second not; zero excluded from the iff | Pass | Retain |
| 5.14a | g=1 square; g=2 regular octagon | Vertex angle sums 4·π/2=2π and 8·π/4=2π; χ=0 and −2 | Values pass | R02: replace undeclared identifier with prose |
| 5.15 | Torus, annulus, disk; sphere negative control | Universal covers ℝ², strip, disk have π₂=0; sphere has π₂=ℤ | Pass | Retain |
| 5.16 | Once-punctured torus and closed genus two; torus control | Centres of F₂ and genus-two group are 1; torus centre ℤ², χ=0 excluded | Pass | Retain |
| 5.17 | Evaluation at a marked point; local translation supported in a disk | Identity evaluates to that point; supported translation moves it by vector v and is identity outside the disk | Pass; local sections discriminate evaluation from constant map | Retain |
| 5.18 | Closed genus two; torus control | χ=−2 gives contractible identity component, π₁=0; torus identity component has π₁=ℤ² | Pass; χ<0 needed | Retain |
| 5.19 | Trivial loop and nontrivial push | Trivial loop gives identity mapping class; conjugation by a noncentral loop differs from identity on a crossing generator | Pass; basepoint/loop direction retained | Retain |
| 5.20 | Genus-two simple push; noncommuting loop pair | Push is T_left T_right⁻¹; on closed H₁ homologous curves give equal and opposite contributions, net 0 | Pass; kernel of forgetful map, not trivial marked mapping class | Retain |
| 5.21 | Annulus cap; three-punctured sphere | Boundary twist integer 1 maps to disk class 0; full puncture permutations give S₃→1 after forgetting all | Pass; kernel not asserted trivial | Retain |
| 5.21a | Rank-two symplectic lattice | Elementary shears [[1,1],[0,1]], [[1,0],[1,1]] have determinant 1; field-only generation does not supply integral Euclidean reduction | Values pass | R02: replace undeclared identifier with prose |
| 5.22 | Genus one; genus zero | Image SL₂(ℤ)=Sp₂(ℤ); rank-zero target Sp₀=1 | Pass | Retain |
| 5.23 | Configuration of two points on genus-two surface | Base π₂=0, punctured fibre π₁=F₄; kernel injection follows from 0→F₄ term | Pass; use base π₂, not fibre π₂ | Retain |
| 5.24 | Degree-n circle cover; degree-one cover | Lift exists iff subgroup nℤ is preserved; deck ambiguity ℤ/n, trivial when n=1 | Pass; general lifting mechanism tested | Retain |
| 5.25 | Degree-r lift of annulus twist, r=3 | T_base³ lifts to T_lift¹; exponent 1/r is avoided by divisibility | Pass | Retain |
| 5.26 | Constant family of labelled covers over a disk | Base π₁=0, monodromy image 1; continuation around a nontrivial base loop permutes labels by its covering action | Pass | Retain |
| 6.1 | ℚ, S={2}; adjoin μ₈ | Solutions t=−1,2,1/2 remain solutions after extension; m≥8 in the enlarged field | Pass; finite generation is supplied | Retain |
| 6.2 | K=ℚ(ζ₈), adjoining an eighth root of ζ₈ | Extension ℚ(ζ₆₄), degree φ(64)/φ(8)=32/4=8; only prime 2 ramifies | Pass | Retain |
| 6.3 | Cyclic degree-8 extension, generator Frobenius | Order 8 gives one local factor of degree 8; identity Frobenius instead gives eight factors of degree 1 | Pass; inertness condition discriminates | Retain |
| 6.4 | λ=−1,1/2,0; char 2 | (Δ,c₄,j)=(64,48,1728),(1,12,1728); Δ(0)=0; char 2 gives Δ=0 | Pass; supplied coefficient model | Retain |
| 6.5 | Legendre generators U=[[1,2],[0,1]], L=[[1,0],[−2,1]] | Both unipotent, fixed dimensions 1; independent upper/lower root directions give closure dim 3; integral group excludes −I | Pass | Retain |
| 6.6 | Two SL₂ factors, (U,I) | Fixed dimensions 1 and 2 exclude graph; product dimension 6 versus graph 3 | Pass | Retain |
| 6.7 | Cyclic Legendre variant m=8 | Eight Sp₂ factors, total dimension 24; each individual factor dim 3 | Pass | Retain |
| 6.8 | λ=−2 and 4 | j-values 21952/9 and 35152/9, distinct; numerator/denominator computation retains bad parameters separately | Pass; nonconstant j supports finite exceptional fibres | Retain |
| 6.9 | Local degree m=8,d=1 | Centralizer bound 4<8=period dimension; m=1 would give 4<1 false | Pass | Retain |
| 6.10 | ℚ, S=∅ and S={2} | Solution counts 0 and 3; latter pairs (−1,2),(2,−1),(1/2,1/2) | Pass; native Lean S-unit headline | Retain |
| 7.1 | Empty set; 7-cycle; 8-cycle; fixed point plus 8-cycle | size=0,1,0,1/9 respectively | Pass; threshold is strictly less than 8 | Retain |
| 7.2 | Split quadratic and unramified quadratic local algebra | Orbit lengths (1,1) versus (2), equal to local degrees | Pass | Retain |
| 7.3 | k[ε]/ε²→k on spectra; degree-two A¹ map | Dimensions 0=0 and 1=1; nilpotents do not change Krull dimension | Pass | Retain |
| 7.4 | d=1,r=5, all lines equal versus distinct e,f | Bad locus small diagonal dim 1<5; no line W equals both ke and kf | Pass | Retain |
| 7.5 | d=1,r=5, φ^r with distinct eigenvalues | At most two invariant lines; descended ambient bad locus may have dimension 1<5 rather than dimension 0 | Pass; no false claim that bad locus itself is finite | Retain |
| 7.6 | d=1, one fixed point plus one 8-cycle; empty control | size=1/9<1/2; contradiction inequality would require 1≥8; empty has size 0 but n=0 excluded | Pass | Retain |
| 7.7 | Identity cover and empty cover | Identity size=1, fails <1/(d+1); empty degree=0 fails n≥1 | Pass; prevents vacuous generic simplicity | Retain |
| 7.8 | d=1, local degree 8; d=2, degree 8 | Dimension comparisons 4<8 and 16<24 | Pass | Retain |
| 7.9 | Identity cover; empty cover on ℙ¹; q=107 KP dimensions | Identity subset empty since 1≥1/(d+1); empty cover n=0 excluded; KP cutoff 1/160 | Pass on boundary hypotheses | Retain |
| 8.1 | ℙ¹, elliptic curve, genus-two curve | H₁ ranks 0,2,4 equal 2g; Euler characteristics 2,0,−2 | Pass | Retain |
| 8.2 | Γ=G=S₃, φ=id, a a 3-cycle | Stabilizer pair (a,a⁻¹) acts trivially; (a,a) induces nontrivial conjugation by a, since a²≠1 | Pass; inverses and opposite group necessary | Retain |
| 8.3 | Overgroup equal to Γ; centre-free S₃ | Extension restricts to original action; stabilizer inverse h=φ(γ)⁻¹ is unique; centralizer size 1 | Pass | Retain |
| 8.4 | Punctured-disk cover z↦z³ | Normalized extension has one point over 0 of ramification index 3; unramified off 0 | Pass | Retain |
| 8.5 | q=3,g=2 | 810 surjections, free conjugation orbits of size 6, hence 135 geometric Hurwitz points | Pass | Retain |
| 8.6 | Peripheral 3-cycle, cyclotomic exponent 2 | c↦c² stays nontrivial of order 3; exponent divisible by 3 would send c to 1 and is not a unit | Pass | Retain |
| 8.7 | Aff(3), g=2, inertia 3 | Degree-6 Galois fibre: 2g_Z−2=6·2+2·2=16, so g_Z=9 | Pass | Retain |
| 8.8 | q=3 permutation and regular representations | e-image dimensions 1 and 2=q−1; e acts as 1 on (2,−1,−1) for its point stabilizer and kills constants | Pass | Retain |
| 8.9 | ε=0, [n], and product projection; m=2 polarization | Connected kernels A,0,E×0; restricted polarization degree 2=2, isogeny kernel rank 4=4 | Pass | Retain |
| 8.10 | Trivial G-action; q=3,g=2; genus-zero curve | e=0 gives connected kernel 0; KP Prym dimension 3; genus 0 fails stated supplier range | Pass; supplier sections resolved | Retain |
| 8.11 | C=ℂ/(ℤ+iℤ), a=1,b=i | H₁ rank 2=2; intersection(a,b)=1; E(a,b)=−1 and E(Ja,a)=1>0, as the pinned positivity requires | Pass | Retain |
| 8.12 | q=3,g=2 | Quotient genus 5; primitive dimension 10−4=6; pushforward multiplier 2; quotient intersection 2 corresponds to Prym E=−2/2=−1 | Pass | Retain |
| 8.13 | q=3,g=2 and q=107,g=2 | Relative Prym dimensions (3·2)/2=3 and (3·106)/2=159; finite-cover fibre count 135 for q=3 | Pass | Retain |
| 8.14 | q=3,g=2, linear-part quotient | Nonzero classes in H¹(Y,ℤ/2): 2⁴−1=15; 135 Hurwitz points give constant fibre size 9 | Pass | Retain |
| 9.1 | q=3,g=2; connected cyclic triple cover control | Degree-3 quotient genus 5; cyclic monodromy order 3≠6=Aff(3), hence excluded | Pass | Retain |
| 9.2 | Identity cover; disconnected double cover | Primitive kernel 0; double-cover kernel {(x,−x)}, dimension equals base H₁ rank | Pass | Retain |
| 9.3 | Trivial double cover; hyperelliptic double cover of sphere | push·tr(x)=2x; kernel pairing is 2·intersection; hyperelliptic transfer to H₁(S²)=0 gives tr·push=0=I+(−I) | Values pass | R02: replace undeclared identifier with prose |
| 9.4 | Identity mapping class; finite common stabilizer | Identity acts I on every primitive factor; passing to index k subgroup leaves connected Zariski closure unchanged | Pass; image not arbitrary data | Retain |
| 9.5 | q=3, identity permutation versus 3-cycle | Numbers of lifted components 3 and 1; independent component classes have those ranks in the stated nonseparating case | Pass | Retain |
| 9.6 | q=5 types identity, translation, orders 2,4; separating disk boundary control | k=5,1,3,2 gives ranks 4,0,2,1 for admissible curves; disk boundary has k=q but all lifted classes 0, excluding the unrestricted source formula | Pass with nonseparating hypothesis | Retain |
| 9.7 | q=3, fixed sheet plus one 2-cycle | Primitive v=e⁺−(1/3)tr(e), push(v)=e−e=0; unique fixed sheet specifies e⁺ | Pass | Retain |
| 9.8 | q=3 and ω(v,x)=1; two distinct sheets | Lift action x+3î(x,v)v=x−3v=T_v^(−3)x; projected intersection 0−1/3=−1/3 | Pass; sign recomputed | Retain |
| 9.9 | Genus-one surface with two boundaries | H₁ rank 3, radical rank 1; quotient Sp₂=SL₂, radical shears have two integer parameters | Pass | Retain |
| 9.10 | Covector (2,2) modulo 3; rank-one control modulo 5 | Lift (5,2), gcd=1 and reduction (2,2); 2 mod5 has no rank-one primitive lift ±1 | Pass; rank≥2 needed | Retain |
| 9.11 | q=3,g=2 | Trivial-cover genus-one part has three sheets; total H₁ rank 10, base rank 4, primitive rank 6 | Pass | Retain |
| 9.12 | q=3 affine normal form, multiplier 2 and translation 1 | Multiplier has cycles (1,2), translation (3); the q+1=4 curves form a basis of H₁ of the covered genus-one piece, rank 4 | Pass | Retain |
| 10.1 | q=3,g=2 | 3I−J on three sheet classes has eigenvalues 0,3,3 and rank 2; full unipotent has N²=0 and fixed dimension 6−2=4 | Pass | Retain |
| 10.2 | q=5, c₁=2,c₂=3, cancel first with m=3 | Translation parameters 2+3=0 and 3+3=1 mod5; cycle types (1⁵) and (5) | Pass; factor distinction | Retain |
| 10.3 | All eight sign choices of e₁,e₂,e₁+e₂; rank-one control | Difference determinant s₁s₂−s₂s₃−s₁s₃ is −1 or 3, never 0; rank-one single representative has affine dimension 0 | Pass; arbitrary signs distinguished | Retain |
| 10.4 | ℓ₁(x,y)=x, ℓ₂(x,y)=y, B=10; zero-form control | w=(11,12), gcd=1, values 11,12>10; zero form value 0 cannot exceed 10 | Pass | Retain |
| 10.5 | q=3,g=2; same/different sheet coefficients | Primitive dimension 6; intersection coefficients 1−1/3=2/3 and −1/3 are both nonzero; finite connecting paths keep spanning rank 6 | Pass | Retain |
| 10.6 | q=3,g=2; any finite-index subgroup | Closure Sp₆ dimension 3·7=21; nonzero parameter −3 has infinite integer multiples in characteristic zero | Pass | Retain |
| 10.7 | q=3,g=2, 135 factors | Product dimension 135·21=2835; diagonal two-factor dimension 21 versus product 42 is excluded by unequal fixed dimensions | Pass | Retain |
| 10.8 | Normal subgroup product of selected factors; finite centre | Connected factors have dimensions 21 each; finite centre has dimension 0, with at most 2^N geometric points | Pass | Retain |
| 10.9 | q=3,g=2 | Each factor contains noncentral unipotent of rank(N)=2; connected normal projection therefore dimension 21, total 2835 | Pass; headline reduction | Retain |
| 10.10 | Same KP family | 135 Prym factors of H¹ rank 6; required full-monodromy product has dimension 2835, matching §10.9 | Pass; headline comparison | Retain |
| 11.1 | K=ℚ,g=2,q=107 | q−1=106=2·53, d=159; 64/106²=16/2809<1/160 since 2560<2809 | Pass | Retain |
| 11.2 | K=ℚ,p=373, modulo 53 | 373≡2; ord₅₃(2)=52≥8; p odd and unramified in ℚ; avoidance of S remains an explicit condition | Pass | Retain |
| 11.3 | Rank-two piece modulo 5, multiplier q_v⁻¹ for q_v=2 | Pairing(e,f)=1, arithmetic multiplier=3 rather than 2; diag(1,3) gives pairing 3 | Pass; inverse Tate twist | Retain |
| 11.4 | N=106,g=2; exact 8-cycle boundary | Fixed-kernel bound 2²·106²=44944, total 106⁴=126247696; an 8-cycle contributes 0 to size | Pass; source endpoint corrected | Retain |
| 11.5 | q=107,g=2 | Stated size upper bound 64/106²=16/2809<1/(159+1); denominator positive 160 | Pass | Retain |
| 11.6 | Smooth genus-two curve; elliptic and nonreduced controls | dim H¹(O)=2 gives 2≤2; elliptic genus 1 fails; square-zero thickening fails smoothness over the field | Headline hypotheses pass; no enumeration asserted | Retain |
| Conventions: path order | Noncommuting transport matrices A,B of §2.10 | B⁻¹A⁻¹=[[1,−1],[−1,2]]; A⁻¹B⁻¹=[[2,−1],[−1,1]], unequal | Pass; opposite-group order distinguishes them | Retain |
| Conventions: Tate duality | Elliptic H¹, its Tate module, ℚ_p(1) | Hodge jumps (0,1), (−1,0), (−1); geometric weights 1,−1,−2 | Pass | Retain |
| Conventions: positivity | Square lattice a=1,b=i, Ja=b | E(a,b)=−1; E(Ja,a)=1>0; Q(a,b)=1 | Pass; same sign in §§8.11–8.12 and supplier | Retain |

## Not verifiable

- **BO78, Corollary 7.4, p.7.4**, used in §2.11: the sources service could not retrieve a readable legal copy. Title lookup found none; the Boston University institutional link failed certificate validation; the previous round also records a Hawaii institutional 404. No certificate bypass was attempted. The crystalline/connection supplier contracts were inspected, but this source locator remains uncertified. The missing-reference record is retained; this review is finished, not parked.
- **Fal83, §6, proof of Satz 5, pp.362–363**: the DOI resolved as paywalled/uncertified; the previous round records a Digizeitschriften PDF 404. No claim is made to have read those pages. LV20 Lemma 2.3 and the actual Frobenius-test/Weil-polynomial supplier statements were available. No renewed request is made for this uncertified text.
- **GX13 edition identity**: the legal author PDF available is dated January 2025, rather than the cited 2013 edition. The read revision has Theorem E.1 on printed p.160 and E.3 on pp.161–163, matching the roadmap's locators; complete identity of the two editions was not certified.
- Ownership against additional open roadmap folders for which the brief supplies no checkout was not checked. Search-index hits alone were not treated as evidence of a competing owner.

## Source issues

- **Misprint** in Mil-LAG at Example C_n, printed p.94: the source says the displayed M/P/Q list is a basis, omitting M_ii and making P antisymmetric; it should be the list including M_ii and symmetric upper-right entries; affects the proof.
- **Error** in LV20 at Lemma 2.8, printed p.12: the source says the finite-order-times-norm identity holds on the whole local multiplicative group; it should be an identity on units, leaving an unramified factor unrestricted; affects a stated result.
- **Misprint** in LV20 at proof of Theorem 5.4, printed pp.27–28: the source says the fixed-space estimate applies through i=8 although the multiplier may have order eight; it should be applied for 1≤i≤7, covering orbits of size less than eight; affects the proof.
- **Misprint** in LV20 at proof of Lemma 7.4, printed p.38: the source says vanishing π₂ of the punctured fibre gives injectivity of its fundamental group; it should be vanishing π₂ of the closed base Y; affects the proof.
- **Gap** in LV20 at Lemma 2.3 and proof of Proposition 3.4, printed pp.9,20: the source says the cohomological representations satisfy finiteness requiring unramifiedness outside S, while the chosen p lies outside S; it should be applied with S enlarged by the places above p; affects the proof.

These are source issues, not additional roadmap findings: §1.2 already enlarges the ramification set, §1.11 uses units, and §11.4 uses the strict short-orbit range. For the Milne basis slip, n=1 gives only one nonzero displayed vector instead of dimension 3; correcting the diagonal range and upper-right sign gives the usual three-dimensional sl₂ basis. For the LV endpoint slip, on (ℤ/17)² the similitude diag(1,2) has multiplier of order 8 and T⁸=I, so ker(T⁸−I) is the whole nonisotropic plane. Source locations are Mil-LAG line 3914–3923; LV20 line 549–554, 1270–1288, 1776–1779 and 425–437 respectively.

- **Error** in LV20 at Lemmas 8.2–8.3, printed p.42: the source says unrestricted simple closed curves have independent lifted classes and rank determines their cycle type; it should be restricted to nonseparating curves and positive powers divisible by the monodromy order; affects a stated result.

For the last error, LV20 lines 1941–1947 define simple closed curves without an essential/nonseparating restriction. A disk boundary avoiding the branch point has identity sheet permutation, q lifted null-homologous circles and rank 0, not q−1 (lines 1965–1978). A nonseparating translation curve also has rank 0 but a q-cycle. The roadmap's §§9.5–9.6 already include the restrictions, so this is not an additional roadmap defect.
