# Review of MorseNovikov (pull request #1690 at c4378eb)

**Verdict:** accepted

## R01 (P3) — Delete the coordinate-only companion

**Location:** `TauCetiRoadmap/MorseNovikov/AbelianCoverHomologyTargets.lean:1,14–42`. Quote: “These integer maps calibrate the proposed geometric covering map”.

**Claim:** both reviewed Lean files satisfy the acceptance-test form.

**Witness:** the companion imports two Mathlib submodules and contains only doubling and reduction-mod-2 calculations. Its five names are absent from the README; its three theorems have no docstrings. It elaborates, but states no geometric headline.

**Repair:** delete this companion, as requested by the preceding review's R06/R08. The general repair is “delete it from `Suggested.lean`”, not prove padding in place; here the padding occupies a separate file. Keep the coordinate computations in README §2.3. The existing Checks already compute 0,1 ↦ 0,2 upstairs and 0,1 ↦ (0,0),(0,0) downstairs, so deleting the file loses no mathematical specification. The passing automated gate did not detect these companion-file violations.

## R02 (P3) — Record the references in a source manifest

**Location:** `TauCetiRoadmap/MorseNovikov/README.md:1419–1428`, and absent `TauCetiRoadmap/MorseNovikov/sources.toml`. Quote: “## References”.

**Claim:** cited works have the required persistent source records.

**Witness:** the folder has no source manifest. The README cites ten mathematical publications/pages and Kim's development; none has a recorded source key, retrieval status or locator/version metadata in this folder.

**Repair:** add the prescribed source manifest, using one key per work and the locators actually used. Record the legal copies checked below; distinguish Turaev's uncertified book and the two unavailable background texts. Do not copy source text into the repository. Test the record against, for example, rt3 Choice 1.2 on printed p.211 and Definition B.1 on p.241, rather than PDF page numbers 3 and 33.

Both findings are P3. There is no P1/P2 finding, and the supplied gate passes. Under this review's verdict rules the folder is ready for a human's final approval, with the source limitations below disclosed. This is an independent AI review, not a GitHub approval.

## Previous findings, checked individually

The comparison is with the supplied review at 9637d5e. No supplied repair report marks a finding “not actionable in this package”. The whole revised folder was reviewed, not just these repairs.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01 inconsistent admitted ring | Suggested:12–13: “completion and universal property lack the period-controlled completed group ring and topology” | Repaired. No admitted data remain in Suggested; README:215 retains the transported-unit negative control. |
| R02 failing build | Suggested:3: `public import Mathlib` | Repaired. Direct elaboration has precisely two sorry warnings and no other diagnostics; the supplied targeted gate passes. |
| R03 constructions replacing headlines | Suggested:8–10: “the nondegenerate Lefschetz fixed-point formula and the nondegenerate vector-field Poincaré–Hopf theorem” | Repaired. Three real definitions, two theorems, and an explicit missing-carrier account replace the former admitted constructions. |
| R04 absent Lefschetz theorem | Suggested:54: `theorem lefschetz_fixed_point_formula` | Repaired on native derivative and singular-homology carriers. Reflection gives 2=2; rotation gives 0=0. |
| R05 duplicated return germ | README:813: “Apply HeegaardFloer §2.8 (F0.6)'s local return germ” | Repaired. Main HeegaardFloer:1711–1725 owns the generic construction and expressly assigns this application to MorseNovikov. |
| R06 import form | Suggested:3: `public import Mathlib`; companion:1: `import Mathlib.Data.ZMod.Basic` | Partly repaired. Suggested conforms; the companion still does not. R01 above. |
| R07 historical supplier URL | README:961: “HeegaardFloer §1.5 (M.5)” | Repaired. The relative link resolves to the maintained ordinary Cerf-family supplier. |
| R08 API/coordinate padding | Companion:24: `theorem doubling_injective` | Partly repaired. Suggested's old API catalogue is gone; the companion's coordinate tests remain. R01 above. |
| R09 shape, locators and Checks | README:89: “Exact supplier contracts”; :209: “Checks.”; :217: “Needs:” | Substantially repaired: seven ordered layers, per-section dependencies, APIs/Checks and matching Suggested names. The missing source manifest remains R02. Companion name/docstring defects are included in R01. |
| R10 inverse Milnor convention | README:624–625: “it is the inverse of Milnor's multiplicative convention” | Repaired. Differential 2 gives 1/2 here and 2 in Milnor; basis changes 3,5 give 3/10 here. |

## Verified sound

All 1,428 README lines and both Lean files were read. HEAD is the requested c4378eba86752c2e0d1c0fe22d5150ea9f5db896. The outside-folder diff is empty. This is a revision of the existing MorseNovikov development on main, with the same completion/trajectory/torsion/Euler scope; it does not start a competing roadmap. No computational deliverable, route-specific coefficient restriction, admitted data, free condition standing in for geometry, or set_option occurs in Suggested. General noninjective and dense periods and torsion deck groups remain in the plan.

The supplied gate reports:

```text
gate MorseNovikov: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I independently ran the requested dependency command:

```text
depcheck: 204 roadmaps, 1544 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines. All 30 numbered subsections' Needs lines and the supplier contracts were read. N4's component algebra precedes the N3 application in §4.6; N5 consumes N4 norms; unrefined N6 precedes Euler-refined N7. References to Euler representatives in N6 permit fixed critical lifts instead, so they do not require N7. No declared gaps were supplied.

**Lean and pins.** Mathlib is f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti is 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a, matching the manifest and installed checkouts. Direct `lake env lean` of Suggested succeeded with only the two expected sorry warnings. The companion also elaborated without diagnostics. A scratch copy with `#check @name` for all five Suggested declarations was elaborated. Every required compactness, Hausdorff, finite-dimensional, second-countable, boundaryless, smoothness and nondegeneracy binder occurs in the two theorem signatures. The three definitions deliberately allow more general input; their geometric laws in the README restore the geometric hypotheses. No binder repair is needed.

Both sorried theorems were independently tried with each of `simp`, `rfl` and `infer_instance` in scratch copies; all six attempts failed. Object searches found no pinned theorem furnishing either conclusion by one `exact`. The companion needs no such probe: its already-proved statements compute the README's coordinate Checks. Elaboration was used to check signatures, not as evidence of truth.

**Pinned declarations opened.** The paths below are relative to their respective library repositories. These 18 entries distinguish the available objects from the missing constructions.

| Object | Declaration and pinned file:line | What was checked |
|---|---|---|
| Finite coefficients | Mathlib `AddMonoidAlgebra`, `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64` | Finite coefficient carrier; not the finite-below completion. |
| Hahn support | `HahnSeries`, `Mathlib/RingTheory/HahnSeries/Basic.lean:52` | Fields include `coeff : Γ → R` and `isPWO_support'`. A well-ordered real support can have infinitely many terms below 1. |
| Laurent series | `LaurentSeries`, `Mathlib/RingTheory/LaurentSeries.lean:100` | Abbreviation for Hahn series on ℤ. Bounded-below integer support has finite sublevels. |
| Localization | `IsLocalization.injective`, `Mathlib/RingTheory/Localization/Defs.lean:938` | Injectivity requires the denominator submonoid to lie in nonzerodivisors. Does not establish Novikov field components. |
| Complex | `HomologicalComplex`, `Mathlib/Algebra/Homology/HomologicalComplex.lean:59` | Native differential and square-zero carrier, not a based determinant-volume theory. |
| Quotient cover | `IsAddQuotientCoveringMap`, `Mathlib/Topology/Covering/Quotient.lean:26` | Quotient map, continuous action, orbit fibers and disjoint translates; no connectedness or nonemptiness field. |
| Manifold derivative | `mfderiv`, `Mathlib/Geometry/Manifold/MFDeriv/Defs.lean:336` | Target is T_(f x)M; zero junk value when nondifferentiable. Fixed-point transport and smoothness in Suggested are necessary. |
| Field pullback | `VectorField.mpullback`, `Mathlib/Geometry/Manifold/VectorField/Pullback.lean:105` | Inverse derivative applied to the field; zero if not invertible. Inverse extended charts are local diffeomorphisms at the tested points. |
| Homology | `AlgebraicTopology.singularHomologyFunctor`, `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52` | Actual functor from singular chains through native homology. |
| Trace | `LinearMap.trace`, `Mathlib/LinearAlgebra/Trace.lean:75` | Finite-basis trace, zero otherwise; the finite-triangulation route supplies finiteness. |
| Critical points | Tau Ceti `IsManifoldNondegenerateCriticalPoint`, `TauCeti/Geometry/Manifold/Morse/Basic.lean:59` | Coordinate Hessian condition; definition alone does not assert smoothness/boundarylessness. |
| Morse index | `manifoldMorseIndex`, `TauCeti/Geometry/Manifold/Morse/Index.lean:74` | Coordinate negative inertia index, with geometric comparison hypotheses separate. |
| Morse chart | `MorseChart`, `TauCeti/Geometry/Manifold/Morse/Lemma.lean:63` | Quadratic potential has factor 1/2 and signed weights. |
| Chart field | `MorseChart.field`, `TauCeti/Geometry/Manifold/Morse/PseudoGradient/Existence.lean:162` | Pullback of the descending linear field; does not supply arbitrary closed-form moduli. |
| Riesz dual | `Riemannian.Tensor.rieszDual`, `inner_rieszDual`, `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean:74,82` | Finite-dimensional fibers, actual inner-product duality. |
| Local flow | `exists_contMDiffAt_localFlow`, `TauCeti/Geometry/Manifold/IntegralCurve/SmoothFlow.lean:58` | Finite-dimensional boundaryless local result, not global completeness. |
| Dynamics and transversality | `stableSet_eq_biUnion_orbit_localInvariantSet_Ici`, `TauCeti/Analysis/Calculus/Morse/LocalToGlobal.lean:187`; `isMeagre_image_criticalPoints_of_isFredholm`, `TauCeti/Analysis/Fredholm/SardSmale.lean:451` | Lipschitz gradient and convergence in the first; separable Banach domain and regularity at least (dim ker)²+1 in the second. README retains these boundaries. |
| Euler–Poincaré | `TauCeti.finsum_finrank_singularHomology_of_finite_cwComplex`, `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:141` | Finite CW and finite-dimensional coefficients. This is the algebraic Euler input, not already Poincaré–Hopf. |

**Ownership and resolved citations.** I read main's completed UniversalCovers and OrthogonalL2Bases roadmaps for shape. I searched by completion, period support, return germ, local fixed-point index, Euler structures, simplicial chains, Lefschetz and Poincaré–Hopf, using `roadmaps grep`, `roadmaps show`, the board packages and pinned sources. Main is fa41b3747f56d4e77bd69e7099c1be4f2e4959ba. Open revisions of existing suppliers were not substituted for main. The resolver found no missing roadmap/name citation; its library-search omission was supplemented by the pin inspection above.

| Cited roadmap/object | File and lines resolved | Ownership result |
|---|---|---|
| MorseTheory M1–M4,M6 | `TauCetiRoadmap/MorseTheory/README.md:90,124,430,458,649` on main | Local Hessians/handles, approximation, inequalities and convergence exist. N2 adds period-controlled closed-form geometry. |
| HeegaardFloer Lane M and M.5 | `TauCetiRoadmap/HeegaardFloer/README.md:216,262,284,319,349,402` on main | Stable dynamics, ordinary moduli/orientations, comparison and relative continuation/Cerf families. No closed-form completion is imported implicitly. |
| HeegaardFloer F0/F0.6 | Same file:1185,1690,1711–1725 | Banach/parameter adapters and the exact return-germ/conjugacy contract. N5 is now an application, not a second owner. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md:268,311,341,371,503,782,816,877,910` on main | Forms, primitives, orientations, flows, integration, cohomology, smoothing/period comparison, degree and metrics. §8.3:836–844 supplies relative smooth-simplex approximation; §10:890–895 supplies continuous degree extension. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:289,326,471,499,849,946,1573` on main | Relative chains, excision, cellular chains, covers/local systems, orientation coefficients and Euler characteristic. Stage4:512–528 gives homology/chain-homotopy naturality, not a strict natural chain map. |
| DGFloer | `TauCetiRoadmap/DGFloer/README.md:442,453–460,1142,1360` on main | Natural π₁ abelianization/H₁ is the input. Its §7.C and §7.T are consumers of Novikov coefficients/torsion, not suppliers of those objects. |
| UniversalCovers | `Completed/UniversalCovers/README.md:98,111,116` on main | Pointed classification and regular-cover deck quotient; connectedness/basepoints remain explicit. |
| GeometricTopology | `TauCetiRoadmap/GeometricTopology/README.md:177,357,409,519,831,868–880,930` on main | Gluing, compact smooth-family topology, knot/surgery data, simplex-cell structure, signed boundary and cellularity, smooth/PL comparison. N6 supplies the completion/equivariant torsion application and finite chain adapter. |
| AlgebraicTopologyPartII | `TauCetiRoadmap/AlgebraicTopologyPartII/README.md:392–394,1211` at supplied head | Its §13.3 consumes this Lefschetz theorem; there is no reverse input. |
| K3SurfacesAndSymplecticBoundedness | `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:194–198` at supplied head | MorseNovikov contract consumes N6 local-index/trace comparison. |
| SymplecticReidemeisterTorsionModSquares | `TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/README.md:15` at supplied head | Explicitly assigns Novikov total-quotient torsion to MorseNovikov; its self-dual square-class invariant is different. |
| FukayaTheory/GromovWittenTheory | `TauCetiRoadmap/FukayaTheory/README.md` coefficient contracts; `TauCetiRoadmap/GromovWittenTheory/README.md:30,108,162` at supplied heads | Consume generic N1, then add their geometric support and coefficient specializations. |
| Kim's prior work | `kim-novikov-series line 24`, `line 32`, `line 108` | Finite coordinate index, real additive-submonoid exponents and positive-weight support. The specified arbitrary abelian/noninjective-period extension and comparison do not reproduce its carrier. |

No distinct roadmap in the supplied open work was found to own the same retained headline declaration. Other open revisions of MorseNovikov are the same roadmap, not a separate supplier. The indexed search's unrelated étale/automorphic Lefschetz and Lusin–Novikov hits do not duplicate these objects. No change to merge order or ownership is proposed.

**Seeded source sample: all 15 requested targets.** Source-service retrieval used author pages, the open AMS archive and an institutional Milnor copy. Printed pagination was checked against extraction page markers. None of the README's targets is explicitly flagged “unverified”. Generalizations are distinguished below from what the cited text actually establishes.

| Sampled target | Exact text opened | Scope/result |
|---|---|---|
| 1.1 Completion coefficients and convolution | rt3 §1.2, p.211; `hutchings-rt3 line 137` | Integral finite-below support, convolution and group-ring inclusion. Arbitrary commutative R and finite-sum ring proofs are explicitly this roadmap's extension. |
| 1.2 Filtration, completion and functoriality | rt3 §1.2 p.211, §3.4 pp.226–227; `hutchings-rt3 line 137`, `line 1063`; filtration at `line 604`, p.220 | Source supplies support topology and cyclic restriction/norm setup. General period-compatible pushforward/universal property are owned extensions, with the finite-fiber-on-support argument specified. |
| 1.3 Positive series and convergent operations | rt3 §1.3 (1.1)–(1.2), Remark1.4 p.212; `hutchings-rt3 line 176`, `line 209` | Strict positivity, log/exp and primitive product. README correctly uses the rational-coefficient completion rather than the source's too-small tensor product. |
| 1.5 Completed orbit modules | rt3 §1.4 pp.212–213; `hutchings-rt3 line 216`, `line 219` | Critical lifts, finite-above potential support and lift bases. General finite free orbit modules/matrix bounds are the stated extension. |
| 2.2 Periods and connected abelian covers | rt3 Choice1.2 p.211; `hutchings-rt3 line 133` | Connected abelian cover, exact pullback, H₁ surjection and lifted-loop kernel. No injective upstairs H₁ assertion is imported. |
| 2.4 Cutoff trajectory spaces | rt3 §1.4 p.213, Lemma2.2 pp.218–219; `hutchings-rt3 line 243`, `line 538` | Compactness/count support and parameter bijections with absence of degenerations/breakings. Full cutoff compactification, gluing and orientations are stronger explicit targets, not asserted as the text of Lemma2.2. |
| 3.3 Completed cellular and controlled singular comparison | rt3 (1.4) p.213; `hutchings-rt3 line 247` | Completed cellular homology comparison. Does not itself state the stronger controlled singular-chain equivalence; README:570 acknowledges this and specifies its construction. |
| 3.4 Naturality and top degree | rt3 (1.4) p.213 and Appendix A pp.239–240; `hutchings-rt3 line 254`, `line 1835` | These give comparison and finite field-complex algebra. Top integral vanishing is a derived orientation/local-system target, not a theorem printed there. Nonzero period makes the relevant signed deck relation invertible. |
| 4.2 Abelian total quotient components | rt3 LemmaA.4 p.240; `hutchings-rt3 line 1900` | Finitely generated abelian group; finite cyclotomic/free components and compatible inclusion. No extension to characteristic p or arbitrary non-finitely-generated H is claimed. |
| 4.5 Partial acyclicity and lift ambiguity | rt3 A.1/A.3 pp.239–240, §1.5 pp.213–214; `hutchings-rt3 line 1851`, `line 1886`, `line 266` | Scalar zero only in nonacyclic field components; ±deck ambiguity and Euler refinement. Subdivision comparisons are supplied as separate construction targets. |
| 4.6 Novikov inequalities | rt3 (1.4), Appendix A; `hutchings-rt3 line 254`, `line 1835` | The inequality is not a separately numbered source theorem. It follows for the specified finite field complexes by c_i=b_i+r_i+r_(i+1); the partial alternating difference is r_(q+1)≥0 and the top one is 0. |
| 5.1 Closed-form return germ | rt3 §1.1 p.210; `hutchings-rt3 line 67`; main HeegaardFloer:1711–1725 | Normal derivative/section independence in the source; generic germ construction belongs to the named supplier. Zero-dimensional transverse space is allowed. |
| 6.5 Native Lefschetz signature | Hatcher §2.C proof2C.3 pp.180–181; `hatcher-at line 7829`, `line 7862` | Finite-complex chain/homology trace proof. Source's stated theorem is fixed-point existence when the Lefschetz number is nonzero, not the full local-index equality. README correctly builds the stronger equality in §§5.2/6.4. |
| 7.1 Euler chains and vector-field index | rt3 DefinitionB.1 p.241, `hutchings-rt3 line 1951`, `line 1983`; Milnor §6 p.35, `milnor-differentiable-viewpoint line 1042` | Euler torsor uses connectedness and χ=0; field-index theorem requires neither orientability nor χ=0. Milnor allows isolated zeros; nondegenerate zeros specialize its indices to determinant signs. |
| 7.2 Determinant volumes and refined equality | rt3 B.3/B.4 pp.241–242 and TheoremB p.215; `hutchings-rt3 line 2009`, `line 2050`, `line 338` | Equivariant refinement modulo ±1. README explicitly repairs the zero-complex literal-basis issue using determinant volumes. |

Additional checks: the Klein-bottle presentation is in Hatcher §1.2 pp.51–52 (`hatcher-at line 2338`); Milnor's inverse torsion convention is in §3 p.365 (`milnor-whitehead-torsion line 258`, `line 270`); cyclic norm hypotheses are in rt3 Lemma3.5/Proposition3.6 pp.227–228 (`hutchings-rt3 line 1090`, `line 1146`); self-slide divisibility and leading signs are in Lemmas3.7–3.10 pp.229–231 (`line 1277`, `line 1289`, `line 1336`); circle/mapping-torus formulas are Examples1.7–1.9 pp.215–216; surgery is rt2 Example1.4 p.372 (`hutchings-lee-rt2 line 150`). The family correction is `hutchings-erratum-family line 23` and `line 27`. rt1 was retrieved as background, not treated as an interchangeable numbering of rt2/rt3.

**Adversarial mathematics.** The 163 rows below each record an actual value or support/kernel calculation, not an elaboration result. “Pass” means that instance agrees; it is not a claim that finite examples prove a general theorem. The table covers every numbered subsection, the sampled targets, both headlines, their supporting definitions, the important API/sign conventions, and the companion touched by R01. API repetitions use the row for their mathematical assertion.

| Statement | Instances tried | Computed left/object | Computed right/control | Result; change |
|---|---|---|---|---|
| Conventions: N=−P | Angular period-one circle, downward generator h=−1 | P(h)=−1; N(h)=1 | −∫γ α=1 | Pass; none |
| Conventions: potential action | f̃(s)=s, deck +1 | f̃(s+1)−f̃(s)=1 | P(1)=1 | Pass; none |
| Conventions: normalized angular form | Unit angular loop, DG integral 2π | (2π)/(2π)=1 | Period-one convention 1 | Pass; none |
| 1.1 trivial group completion | H=0, R=ℤ; zero coefficient ring | One arbitrary integer coefficient; empty support in zero ring | ℤ; singleton zero ring | Pass; none |
| 1.1 finite-below support, strict/non-strict | Σ(k≥0)t^k, N(k)=k | Below 3: {0,1,2}; at most 3: {0,1,2,3} | Cardinalities 3,4, both finite | Pass; none |
| 1.1 least period | t⁻²+3+t³ | Minimum −2 | Lower bound −2 attained | Pass; none |
| 1.1 coefficient equality/additive operations | 1+2t, −1−2t over ℤ; over zero ring | Sum coefficients (0,0); all zero in zero ring | Zero series coefficients (0,0) | Pass; none |
| 1.1 finite convolution | (Σt^k)², coefficient of t² and t⁻¹ | 1+1+1=3; empty sum 0 | Pair counts 3,0 | Pass; none |
| 1.1 associativity cutoff | (Σt^k)³ at t² | (1·3)+(1·2)+(1·1)=6 | Triples (2,0,0) and (1,1,0), 3+3=6 | Pass; none |
| 1.1 monomial units | e²e⁻² | e⁰, coefficient 1 | Multiplicative identity | Pass; none |
| 1.1 finite inclusion onto iff N=0 | H=ℤ, R=ℤ | N=0 allows only finite support; N=id admits Σt^k | Onto / not onto | Pass both directions; none |
| 1.1 nontrivial-ring hypothesis | Zero ring, N=id | Both coefficient carriers singleton; inclusion onto | N≠0 | Correctly excluded from iff; none |
| 1.1 kernel ties | H=ℤ², N(a,b)=a | Support {(1,b):b∈ℤ} gives infinitely many below 2 | {0,(0,1)} gives 2 below 1 | Pass; none |
| 1.1 transported coefficient operations | ℤ ring transported by negation | Unit coefficient −1 | Original coefficient +1; difference 2 | Pass: operations must vary; none |
| 1.2 filtration separation | t², zero | t²∈U₂; t²∉U₃; zero in every U_C | Intersection U_C={0} | Pass; none |
| 1.2 density/completion | Partial sums Σ(k=0,…,m)t^k | At cutoff 3, tail=0 for m≥2 | Coefficients 1,1,1 stabilize | Pass; none |
| 1.2 continuous multiplication | a∈U₃, multiply by t² | Minimum period ≥5 | Product in U₅ | Pass; none |
| 1.2 positive rescaling and reversal | N,2N,−N on ℤ | Σt^k admitted for first two; not third | Σt⁻ᵏ admitted for −N | Pass; none |
| 1.2 arbitrary-kernel pushforward | (a,b)↦a; 1+e^(0,1) | Coefficient at 0 is 1+1=2 | Finite fiber within support despite infinite kernel | Pass; none |
| 1.2 pushforward multiplicativity | Same map on (1+e^(0,1))² | 1+2+1=4 | 2²=4 | Pass; none |
| 1.2 scalar change and composition | Reduce ℤ→𝔽₂ after that pushforward | 2↦0 | Reduce each coefficient then sum: 1+1=0 | Pass; none |
| 1.2 period-scaled continuity | φ(k)=2k, N'=id, c=2, a=t³ | Image t⁶∈U'₆ | c·3=6 | Pass; none |
| 1.2 precomposition not a ring map | ℤ⊕C₂→ℤ, constant monomial 1 | Pullback 1+g; its square 2+2g | Pullback of 1² is 1+g | Correct distinction; none |
| 1.2 failure without period compatibility | φ:ℤ→0 on Σt^k | Fiber at 0 has infinitely many nonzero terms | Required coefficient is not a finite sum | Excluded; none |
| 1.3 positive ideal | t,t² versus constant 1 | Orders 1,2; order of 1 is 0 | Positive threshold excludes 1 | Pass; none |
| 1.3 geometric inversion | (1−t)(1+t+t²+⋯) | Degrees 0,1,2: 1,0,0 | Identity coefficients 1,0,0 | Pass; none |
| 1.3 positivity needed for inversion | a=1 in ℤ | 1−a=0 | No b with 0b=1 | Correct exclusion; none |
| 1.3 rational exponential/logarithm | t over ℚ, truncate degree 2 | exp(t)=1+t+t²/2; log(1+t)=t−t²/2 | log(exp t)=t+0t² | Pass; none |
| 1.3 characteristic restriction | R=𝔽₂ | 2=0, no inverse of 2 | Rational denominator 1/2 unavailable | Correct exclusion; none |
| 1.3 infinite products | Π(k≥1)(1+t^k) below degree 3 | 1+t+t² | Factors k≥3 contribute 0 below 3 | Pass; none |
| 1.4 Laurent comparison | t⁻²+3+t³ | Coefficients at −2,0,3: 1,3,1 | Native Laurent coefficients 1,3,1 | Pass; none |
| 1.4 Hahn versus Novikov | Exponents 1−1/(k+2), k≥0 | Well-ordered increasing support; infinitely many below 1 | Novikov condition false at C=1 | Proper subring; none |
| 1.4 split kernel comparison | N(a,b,c)=a+√2b, 1+e^(0,0,1) | Period-zero kernel coefficient 1+z | Two original coefficients both 1 | Pass; none |
| 1.4 domain leading terms | (1+z)t²·(1−z)t³ over ℤ[z,z⁻¹] | Leading coefficient 1−z²≠0, period 5 | 2+3=5 | Pass; none |
| 1.4 torsion obstruction to domain | H=C₂, R=ℤ | (1−g)(1+g)=1−g²=0 | Both factors have nonzero coefficients | Correctly outside torsion-free case; none |
| 1.5 completed orbit module | One orbit with F(s)=0; no orbits | F(t^k s)=−k; Σt^k s allowed; empty gives 0 | Ring support k≥0; rank 1 or 0 | Pass; none |
| 1.5 lift matrix | Replace s by t²s | New basis [t²] | Coordinate change [t⁻²]; product [1] | Pass; none |
| 1.5 uniform matrix extension | Matrix diag(t²,t⁻¹), input in U₃² | Outputs in U₅ and U₂ | Uniform output bound U₂² | Pass; none |
| 2.1 local primitive independence | x²/2 and x²/2+7 | Hessians 1,1; indices 0,0 | Same form x dx | Pass; none |
| 2.1 nondegenerate zero/transversality | x dx and x² dx at 0 | Section derivatives 1 and 0 | Nondegenerate / degenerate | Pass; none |
| 2.1 Hessian/dual signs | Potential −x²/2 | Hessian −1; index 1; V=−x | −V=x, unstable direction dimension 1 | Pass; none |
| 2.1 coherent incidence | Cosine circle with chosen unstable orientation | Two paths with signs +1,−1 | Incidence coefficient 0 | Pass; none |
| 2.2 period exactness | Trivial cover of circle, α=dθ; universal cover | Period kernel ℤ has value 1 / kernel 0 has value 0 | Not exact / primitive s exists | Pass both directions; none |
| 2.2 H₁ exactness | Universal cover ℝ→S¹ | 0→ℤ→ℤ, second map identity | Image first=0=kernel second | Pass; none |
| 2.2 exactness does not mean first injective | Klein cover C in §2.3 | H₁(C)=ℤ→ℤ⊕C₂ is zero | Image=0=kernel of subsequent isomorphism | Pass; none |
| 2.2 abelianization algebra control | Normal A₃⊂S₃ | C₃→C₂ is zero, C₂→C₂ identity | Image 0=kernel 0 | Pass; H itself remains abelian |
| 2.3 commuting deck maps | A(s,y)=(s+1,−y), B(s,y)=(s,y+1) | AB y=−y−1; BA y=−y+1 | Difference −2=0 in ℝ/2ℤ | Pass; none |
| 2.3 freeness/properness | A^nB^e, e=0,1 | Fixed s forces n=0; fixed y forces e=0 | Identity stabilizer only; bounded s permits finitely many n | Pass; none |
| 2.3 cover subgroup | Fiber generator on length-two circle | b² in π₁, integer coordinate 2 | 2[b]=0 in C₂ | Pass; none |
| 2.3 larger versus minimal period cover | H=ℤ⊕C₂, P(n,e)=n | ker P=C₂; cover subgroup ⟨b²⟩ | Minimal period cover kills b, deck ℤ | Pass; none |
| 2.3 geometric zero divisors | t=A⁻¹, g=B | N(t)=1; (1−g)(1+g)=0 | Both torsion coefficients survive in ℤ[C₂]((t)) | Pass; none |
| 2.4 trajectory dimension | Indices (1,0), (0,0) | Quotient dimensions 0,−1 | Rigid paths / no transverse nonconstant paths | Pass; none |
| 2.4 bounded-drop cutoff | Circle t^k contributions, fixed lifts | Drop k<C permits finitely many nonnegative k | At C=3: k=0,1,2 | Pass support direction; none |
| 2.4 exact-form closed orbit exclusion | α=df, nonconstant closed orbit | ∫γ df=0 | Downward trajectory would give −∫γ df>0 | Contradiction excludes it; none |
| 2.4 boundary signs and constant trajectories | Compact interval; constant path | Boundary +1−1=0; constant stabilizer ℝ | Square-zero cancellation; quotient not free for constant path | Pass; none |
| 3.1 differential | Circle with one critical pair | Matrix ±(1−t); following differential 0 | d²=0 | Pass; none |
| 3.1 lift/orientation change | Change lower lift by t; flip upper orientation | New matrix t⁻¹(1−t); then its negative | Based conjugation and sign rule | Pass; none |
| 3.1 empty complex | No critical points | All chain groups/homology 0 | Empty determinant torsion 1 | Pass; none |
| 3.1 exact specialization/augmentation | Exact circle, d=1−t | At t=1, differential 0 | Ordinary circle incidence 0 | Pass; no augmentation of arbitrary completed series claimed |
| 3.2 identity/composition | Constant one-generator family; lift t² and inverse | [1]; [t²][t⁻²]=[1] | Identity continuation | Pass; none |
| 3.2 homotopy endpoint signs | Parameterized oriented interval | Endpoint sum +1−1=0 | Difference of induced homology maps 0 | Pass; none |
| 3.2 genericity correction | Persistent critical point, index decreases | Constant continuation path persists for every metric | Expected dimension negative | Fixed arbitrary function-path argument excluded; none |
| 3.3 cellular completion, exact circle | ℤ[t,t⁻¹] —(1−t)→ ℤ[t,t⁻¹] | Kernel 0; cokernel ℤ | H₁=0,H₀=ℤ | Pass; none |
| 3.3 cellular completion, nonzero circle | Same matrix in ℤ((t)) | Inverse 1+t+t²+⋯ | H₀=H₁=0 | Pass; none |
| 3.3 controlled support | Translates at potential −k versus +k | Finitely many above C / infinitely many above 0 | Allowed / forbidden | Pass; none |
| 3.3 controlled subdivision/prisms | One oriented interval [0,1], midpoint m | ∂([0,m]+[m,1])=[1]−[0] | ∂[0,1]=[1]−[0]; images remain in interval | Pass local support/sign control; none |
| 3.3 large-gradient comparison | Circle α=a dθ, f=cos θ, C>|a| | α+Cdf=(a−C sin θ)dθ has 2 zeros, one each index | Perturbed df has same two index types; no nonstationary circle orbit through zeros | Pass; none |
| 3.4 top vanishing and exact control | Nonzero-period circle / exact circle with trivial cover | H₁^Nov=0 / H₁=ℤ | Nonzero-class hypothesis distinguishes them | Pass; none |
| 3.4 orientation-twisted top relation | Deck h with N(h)>0; sign ε=±1 | (1−εe^h)⁻¹=Σ(k≥0)ε^k e^(kh) | Product 1 | Pass for either orientation character; none |
| 3.4 coefficient/homotopy naturality | Scalar change of d=2, ℤ→ℚ; identity map | Differential stays 2; H after field change=(0,0) | Native scalar map/identity chain map | Pass; no flatness-free homology tensor claim |
| 4.1 determinant torsion | ℚ —2→ ℚ, degrees 1,0 | τ=1/2 | rt3 convention 1/2; Milnor 2 | Pass; none |
| 4.1 basis transformation | A₀=3,A₁=5,d=2 | New d=10/3; τ=3/10 | (1/2)·3·5⁻¹=3/10 | Pass; none |
| 4.1 boundary/lift independence | Choose boundary basis 2 or 6 in same complex | Lift in degree1 is 1 or 3; determinant ratio 1/2 or 3/6 | Both 1/2 | Pass; none |
| 4.1 zero extension | Differential 0, ranks (1,1); zero complex | Homology ranks (1,1), τ=0; empty τ=1 | Nonacyclic versus acyclic empty complex | Pass; none |
| 4.1 projection minor | d(1)=(1,1), project to e₁ coordinate | Projected matrix [1], determinant 1 | d(1) is not in span(e₁) | Pass; projection retained |
| 4.1 direct sum/Koszul sign | Two complexes d=2,d=3 with concatenated bases | d=diag(2,3), τ=1/6 | (1/2)(1/3)=1/6; interchanging one basis gives −1/6 | Pass; sign retained |
| 4.1 exact-sequence homology correction | A=ℚ[0], B=(ℚ —2→ ℚ), D=ℚ[1] | τ(B)=1/2; connecting H₁D→H₀A is ×2 | Its assigned degrees 3→2 give torsion 1/2; τ(A)τ(D)=0 is wrong | Pass determinant-line distinction; none |
| 4.1 chain-equivalence warning | Two-term d=2 versus d=1 | Both contractible; torsions 1/2 and 1 | Ratio 1/2≠1 | Pass: cone correction needed |
| 4.2 total quotient trivial group | H=0 | Q(ℤ)=ℚ | One characteristic-zero field | Pass; none |
| 4.2 torsion components | H=C₂,N=0 | g↦(1,−1); 1−g↦(0,2) | Q(ℤ[C₂])=ℚ×ℚ | Pass; none |
| 4.2 characteristic-p negative control | 𝔽₂[C₂] | (1+g)²=1+g²=0; 1+g≠0 | Nonzero nilpotent; not product of fields | Excluded; none |
| 4.2 nonzero-divisor preservation | 2 and 1−g over ℤ[C₂] | 2↦(2,2), both nonzero; 1−g↦(0,2) | First regular, second zero divisor before/after completion | Pass; none |
| 4.3 inverse continuity | 2+t^m, m>0 | Inverse−1/2 begins −t^m/4, order m | Perturbation order m | Pass; none |
| 4.3 nonacyclic-stratum boundary | d=t^m→0 | τ=t⁻ᵐ; τ(0)=0 | t⁻ᵐ does not tend to 0 | Correctly excluded; none |
| 4.3 fixed components | d=(0,2+t^m) | τ=(0,(2+t^m)⁻¹)→(0,1/2) | Fixed nonacyclic first component | Pass; none |
| 4.4 finite free cyclic extension | ℤ→ℤ/2,s=t² | Basis 1,t; m_t=[[0,s],[1,0]] | Rank 2 | Pass; none |
| 4.4 norm and trace | Same m_t | Trace 0; determinant −s; det(1−m_t)=1−s | Tr(t)=0; Norm(t)=−s; Norm(1−t)=1−s | Pass; none |
| 4.4 trace coefficient restriction | 1+t² | Trace 2+2s | 2·restriction=2(1+s) | Pass; none |
| 4.4 logarithmic norm | x=−t, double cover | log Norm(1−t)=−s−s²/2−⋯ | Tr(−t−t²/2−⋯)=−s−s²/2−⋯ | Pass; none |
| 4.4 torsion-annihilation hypothesis | H=C₂→C₂ identity; idempotent (1,0) | Norm(1,0)=0 | Input nonzero | Correctly excluded from nonvanishing theorem; none |
| 4.4 torsion norm | Two-term d=1−t | Norm(τ)=(1−s)⁻¹ | Torsion of restricted multiplication matrix=(1−s)⁻¹ | Pass; none |
| 4.5 partial acyclicity | d=1−g over ℤ[C₂] | Component homology nonzero/zero; torsions (0,1/2) | Not global zero | Pass; none |
| 4.5 ambiguity action | Zero; a≠0; lifts in degree0/1 | 0 fixed; a↦±t^k a; τ↦tτ or t⁻¹τ | Unit action cannot change 0 to 1 | Pass; none |
| 4.5 simple subdivision | Add elementary acyclic pair with d=1 | Extra torsion factor 1 | Original torsion unchanged modulo sign | Pass; none |
| 4.6 weak/strong inequalities | c=(1,1),d=2 over ℚ | b=(0,0); alternating b at q=0,1: 0,0 | Alternating c:1,0 | 0≤1 and 0=0; none |
| 4.6 rank splitting | c_i=b_i+r_i+r_(i+1) | Partial alternating difference r_(q+1) | Nonnegative rank; at top r_(n+1)=0 | Pass general algebra; none |
| 4.6 zero-dimensional and zero-differential controls | Point; ranks(1,1) with d=0 | b=(1); b=(1,1) | c=(1); c=(1,1) | Equalities, distinct from d=2; none |
| 5.1 section conjugacy | P(x)=2x,h(x)=3x | hPh⁻¹=2x; DP=2 | det(1−DP)=−1 in both sections | Pass; none |
| 5.1 circle/critical controls | Nonstationary circle; equilibrium | Normal dimension0, det=1 | Equilibrium speed0 violates germ hypothesis | Pass; none |
| 5.2 multiplicity versus time | Primitive real period7 and double | Multiplicities1,2; times7,14 | Log weights1,1/2, not 1/7,1/14 | Pass; none |
| 5.2 local nondegenerate index | P=x/2; P=2x | det(1−DP)=1/2,−1 | Indices +1,−1 | Pass; none |
| 5.2 degenerate index conservation | P=x+x²−ε | ε>0: signs +1,−1; ε<0: empty | Total0 on either side | Pass; none |
| 5.2 chart reversal | P=2x,h=−x | Conjugate derivative2 | Index −1 unchanged | Pass; none |
| 5.2 partial-domain commutativity | f:ℝ→ℝ², x↦(2x,0); g(u,v)=u | gf derivative2, index−1 | fg derivative diag(2,0), det(I−D)=−1 | Pass, different ambient dimensions; none |
| 5.3 orbit/iterate cutoff | Primitive class t, N(t)=1 | Below C=3: iterations1,2 only | Two terms, weights1,1/2 | Pass; none |
| 5.3 circle logarithm/product | ε_k=1 | log ζ=t+t²/2+t³/3+⋯ | ζ=(1−t)⁻¹=1+t+t²+⋯ | Pass; none |
| 5.3 attracting/repelling multiplier | λ=1/2 or 2 | ε_k=+1 always or −1 always | Factors (1−t)⁻¹ or (1−t) | Pass; none |
| 5.3 negative multiplier | λ=−2 | ε₁=+1,ε₂=−1,ε₃=+1 | log(1+t)=t−t²/2+t³/3 | Pass; none |
| 5.3 eigenvalue block formula | λ=−1/2; complex pair 2i,−2i | Signs +1 for all iterates in either case | i₊=i₋=0 gives +1 | Pass; none |
| 5.3 ambient dimension parity | Surface attracting λ=1/2: n=2,i₀=1 | Correct exponent (−1)^(2−1)=−1 | Incorrect −(−1)^1=+1 | README corrects source; none |
| 5.3 period doubling identity | Negative multiplier model | (1+t)/(1−t²) | (1−t)⁻¹ | Equal; none |
| 5.3 integrality and constant coefficient | Factors 1+t and (1−t)⁻¹ | Integer coefficients, constant1 | Zero series has constant0 | Pass; none |
| 5.3 cyclic cover zeta | Double circle, s=t² | Norm((1−t)⁻¹)=(1−s)⁻¹ | One primitive lifted orbit has coefficient1 at s | Pass; none |
| 6.1 dynamical product | Critical-free circle / critical-pair circle | 1·(1−t)⁻¹ / (1−t)⁻¹·1 | Same I=(1−t)⁻¹ | Pass; none |
| 6.1 fold normalization | x³/3−εx, ε=1 or −1 | For1, roots ±1, Hessians ±2; for−1, no root | Indices1,0 or empty | Pass; none |
| 6.1 ordinary slide/cancellation | [[1,a],[0,1]]; opposite rigid paths | Determinant1; count +1−1=0 | Torsion factor1; unchanged differential | Pass; none |
| 6.2 coprime quotient family | h=(2,1), d=2,k=3 | μ(n,e)=2n mod3; μ(h)=4=1 | Surjective image C₃ | Pass; none |
| 6.2 all-index norm quotient | Same h,d, k=2 | ν(n,e)=n mod4; ν(nh)=2n mod4 | Zero iff 2 divides n | Pass both directions; none |
| 6.2 chain conjugation/torsion factor | p degree1, x=1+t,d=2 | New d=2(1+t); τ=1/[2(1+t)] | τ_old x⁻¹=(1/2)(1+t)⁻¹ | Pass; none |
| 6.2 leading zeta sign | i=1 and2, x=1+t | y=x or x⁻¹; b₁=+1 or−1 | (−1)^(i+1)a₁=+1 or−1 | Pass; none |
| 6.2 product cancellation | Same i,x | x⁻¹y=1 or xy=1 | Invariant factor1 | Pass; none |
| 6.2 higher-coefficient elimination | z=1+c₂t²+O(t³),d=k=2 | Degree2 of log Norm(z)=4c₂ | Zero forces c₂=0 over ℚ | Pass; no good-prime restriction |
| 6.2 split-homology case | One zero-differential generator p | d_+=d_-=0 for every unit x; τ=0 | I_+=I_-=0 | Pass; no cancellation of zero |
| 6.3 cutoff exhaustion | Event drops1,2,3,… | Below3 exactly2 events | Globally infinitely many | Pass; no finite-global-list assumption |
| 6.3 fixed-stratum limit | d=2+t^m | τ→1/2 | Limit d=2, τ=1/2 | Pass; none |
| 6.3 excluded limit | d=t^m→0 | τ=t⁻ᵐ does not converge to0 | τ(limit d)=0 | Acyclic-limit comparison indispensable; none |
| 6.3 topological equality | Circle cellular d=1−t | τcell=(1−t)⁻¹ | I from either geometric model=(1−t)⁻¹ | Pass; none |
| 6.4 mapping-torus cone | Fiber a point; φ=id | Cone(1−t) has τ=(1−t)⁻¹ | H₀ determinant exponent−1 gives same | Pass; none |
| 6.4 homological zeta | Circle φ reflection / identity | det H₀=1−t; det H₁=1+t or1−t | ζ=(1+t)/(1−t) or1 | Pass; raw degenerate iterates not counted |
| 6.4 simplicial boundary/scalar adapter | Oriented triangle [012] | ∂=[12]−[02]+[01]; ∂²=0 | Vertex coefficients cancel 0,0,0; mod2 signs all1 still cancel | Pass; none |
| 6.4 vertex order and degenerate maps | Swap0,1 in edge; collapse edge to point | Orientation sign−1; collapsed 1-chain0 | Boundary reversal −([1]−[0]); degenerate map degree0 | Pass; none |
| 6.4 subdivision and last vertex | Edge [01], barycenter m | Sd=[0m]+[m1]; last vertex sends first edge to[01], second to0 | λ#Sd=[01] | Pass; none |
| 6.4 subdivision homotopy | Last vertex m↦1 on subdivided edge | At m, id−Sdλ=m−1 | Boundary of oriented [1,m] equals m−1 | Pass; none |
| 6.4 Hopf local sign | Reflected oriented interval simplex | q=1, ε=−1 gives (−1)ε=+1 | Actual fixed derivative−1 gives sign det(1−D)=+1 | Pass; none |
| 6.4 trace versus homology | Contractible two-term field complex, identical scalar λ in both degrees | Alternating chain trace λ−λ=0 | Homology trace0 | Pass; none |
| 6.4 knot surgery | Unknot; trefoil | Δ=1; Δ=t⁻¹−1+t | τ=(1−t)⁻²; (t⁻¹−1+t)/(1−t)² | Matches stated expressions; none |
| 6.4 inversion ambiguity | Either symmetric Δ above | τ(t⁻¹)=t²τ(t) | Same modulo ±t^ℤ | Pass; none |
| 6.5 fixedPointDerivative | f=−x or2x at0 | Endomorphism −1 or2 | det(I−D)=2 or−1 | Pass; none |
| 6.5 derivative of iterates | f=2x at0, k=2 | D(f²)=4 | (Df)²=4 | Pass; none |
| 6.5 zero-dimensional determinant | Tangent space0 | Unique map=0=id; det(I−D)=1 | One isolated fixed point contributes1 | Pass; none |
| 6.5 positive-dimensional identity | f=id on S¹ | det(I−D)=0 | Nondegeneracy false | Correctly excluded; none |
| 6.5 rationalHomologyMap | Two-point swap; constant map | H₀ matrices [[0,1],[1,0]], [[1,1],[0,0]] | Traces0,1 equal fixed counts0,1 | Pass; none |
| 6.5 homology identity/composition | Two-point swap squared | Matrix square I₂ | Trace2; two fixed points | Pass; none |
| 6.5 Lefschetz headline | Circle reflection; nontrivial rotation | Fixed sums2;0 | Homology traces1−(−1)=2;1−1=0 | Pass; none |
| 6.5 empty/point controls | Empty manifold; one point | Fixed sums0;1 | Trace sums0;1 | Pass; none |
| 6.5 noncompact negative control | Translation x↦x+1 on ℝ | Fixed count0 | H₀ trace1 | Excluded by CompactSpace; none |
| 6.5 nonorientable control | Constant self-map of RP² | One fixed point, derivative0, sign+1 | Rational Betti ranks(1,0,0), trace1 | Pass; orientation unnecessary |
| 7.1 Euler-chain existence | Circle sinθ field; sphere height gradient | Circle zero-cycle [+0]−[π], augmentation0; sphere augmentation2 | Circle is a boundary; sphere not a boundary | Pass; χ=0 used only for Euler chains |
| 7.1 H₁ torsor | Nonsingular circle field | Zero chain and k times fundamental circle are classes indexed by k∈ℤ | Difference classes form H₁(S¹)=ℤ | Pass; no canonical field-independent origin |
| 7.1 comparison cocycle | Move a +zero along arc a then b | Transport adds [a]+[b] | Concatenated transport adds [a+b] | Equal; constant path adds0 |
| 7.1 vector-field index | V=sinθ ∂θ | Derivatives+1,−1; sum0 | χ(S¹)=1−1=0 | Pass; none |
| 7.1 Morse positive-dual convention | Hessian diag(−1,1) | det dV=−1; index1 | (−1)^index=−1 | Pass; none |
| 7.2 empty-complex determinant volume | CN=0 on circle, shift h | Volumes1,e^h | Ordinary empty basis remains the singleton; volumes distinguish shifts | Pass repaired model; none |
| 7.2 alternating lift action | Change degree0/degree1 lift by t | Volume and τ multiply by t/t⁻¹ | Exponents +1/−1 | Pass; none |
| 7.2 refined equality | Critical-free circle ξ₀ and ξ₀+h | τNov·ζ=(1−t)⁻¹ and t(1−t)⁻¹ | Same cellular values; different modulo ±1 | Pass; none |
| 7.3 vectorFieldChartDerivative | V=x,−x,x² at0 | Derivatives1,−1,0 | Signs+1,−1; degenerate third excluded | Pass; none |
| 7.3 chart reversal at a zero | V(x,y)=(−x,y), chart diag(−1,1) | Conjugated derivative diag(−1,1), determinant−1 | Original determinant−1 | Pass; none |
| 7.3 Poincaré–Hopf headline | S² height gradient | Two signs+1,+1, sum2 | Rational Euler sum1+1=2 | Pass; none |
| 7.3 empty/dimension-zero headline | Empty; two-point0-manifold | Zero counts0;2, determinants1 | H₀ dimensions0;2 | Pass; none |
| 7.3 nonorientable headline | Morse gradient on RP², one critical point per index0,1,2 | Signs+1,−1,+1 sum1 | Rational Euler sum1 | Pass; none |
| 7.3 noncompact negative control | Constant nonzero field on ℝ | Zero count0 | H₀ rank1 | Excluded by CompactSpace; none |
| Companion doubling | n=0,1,−1 | 0,2,−2; kernel{0} | Injective integer multiplication by2 | True Check, not headline; R01 deletes file |
| Companion fiberMap | n=0,1,−1 | (0,0),(0,0),(0,0) | Zero map; 0≠1 have same image | True Check, not headline; R01 deletes file |

There is no denominator use at a zero field component: zero-extended torsion is handled separately, logarithms use a ℚ-algebra, and geometric inversion uses strictly positive support. For the nonreduced coefficient test R=ℚ[ε]/(ε²), the algebra still works: (1−εt)⁻¹=1+εt, whereas the domain and field-component assertions do not apply to R. The source algebra also allows characteristic3, where the coefficient3 of (Σt^k)² at t² becomes0; coefficient reduction agrees. Nonabelian groups are not silently admitted as exponent groups; the S₃ test above concerns the fundamental group before abelianization.

**Headline inventory and completeness.**

| README headline group | Acceptance-file disposition |
|---|---|
| N1 completion, universal property and coefficient comparisons | Named as unavailable in module docstring: the completed ring/topology construction is missing. |
| N2 closed-form cutoff compactification and gluing | Named as unavailable: no cutoff trajectory-space carrier. |
| N3 continuation, completed cellular/controlled singular comparison, top-degree vanishing | Named as unavailable: no Novikov complex or controlled chain carrier. |
| N4 component torsion, transformation laws and Novikov inequalities | Named as unavailable: no Novikov ring/based torsion carrier. Generic linear-algebra inequalities alone would not be this headline. |
| N5 integral dynamical zeta, product and cover-norm formula | Named as unavailable: no orbit-counting series and completion. |
| N6 dynamical invariance, cellular equality, mapping-torus/knot formulas | Named as unavailable: torsion/zeta constructions missing. No zero-valued stand-in remains. |
| N6 nondegenerate Lefschetz | Stated in Suggested:54 with three geometric finiteness/separation hypotheses, finite-dimensionality, boundarylessness, smoothness and nondegeneracy all retained. The derivative/homology definitions have real native bodies. |
| N6 continuous local-index strengthening | Named as unavailable: local fixed-point index carrier missing. |
| N7 Poincaré–Hopf | Stated in Suggested:83 on actual smooth tangent fields and rational singular homology, with its real coordinate derivative. |
| N7 Euler-refined equality | Named as unavailable: Euler torsor and determinant-volume normalization missing. |

The README has the required Summary, scope, conventions, contracts, build order, seven layers, Examples/Dependencies, downstream discussion and references. The three retained supporting definitions each have APIs and at least three discriminating Checks. The long simplicial/local-index construction in §6.4 spells out the source, target, homology identification and orientation convention; the table above additionally tests its basic boundary, degenerate map and subdivision operations. The remaining form exceptions are R01/R02. No file was edited in the pull-request worktree.

## Not verifiable

- `turaev-combinatorial-torsions`, *Introduction to Combinatorial Torsions* (2001): the source service classified the publisher DOI as paywalled and returned **uncertified**. No readable text was obtained; the README supplies no chapter/page. This settled uncertified item is not requested again.
- `turaev-euler-structures`, *Euler structures, nonsingular vector fields, and torsions of Reidemeister type* (1990), pp.627–662: the source service reached the MathNet DOI landing page but found no PDF link. I did not certify that text.
- `pajitnov-circle-valued`, *Circle-valued Morse Theory* (2006): the source service reached the de Gruyter bibliographic landing page and obtained no legal text. No precise chapter/page for the stronger controlled-chain statement is supplied.
- The last two works are recorded together in the scratch missing-reference request. Resolved Milnor requests were removed after legal texts were obtained. This review was completed rather than parked; the missing texts are background references, not unread sources for the 15 requested sample checks.
- rt3 (1.4) certifies the homology comparison, not all the stronger controlled chain, prism, subdivision and top-degree constructions. Their stated routes and examples were reviewed, but a full proof of each new construction was not produced here. Similarly, Hatcher 2C.3 supplies the trace argument, not a proof of the entire new Hopf local-index adapter.
- rt3 Proposition3.13 explicitly suppresses orientations in its proof. The roadmap retains the oriented gluing as work to prove. The displayed local fold and determinant factors were tested; the full oriented birth/death gluing proof is not independently certified.
- The PR description does not identify the separate lecture-notes passage allegedly asserting an injective upstairs H₁ map. The actual rt3 Choice1.2 checked here makes only the valid surjection/kernel assertion. The Klein-bottle counterexample is valid independently of that attribution.

## Source issues

- **Error** in hutchings-rt3 at §1.3, printed p.212 (line 189): the source places logarithmic orbit series in the rational tensor of the integral completion; it should use the rational-coefficient completion, which permits unbounded denominators; affects the proof.
- **Error** in hutchings-lee-rt2 at equation (2), printed pp.371–372 (line 119): the source uses exponent −(−1)^i₀ in every dimension; it should use −(−1)^(i₊+i₋), equivalently (−1)^(dim X−i₀); affects a stated result.
- **Misprint** in hutchings-rt3 at Lemma3.10 proof, printed p.231 (line 1363): the source reverses divisibility for the difference of lift indices; it should say k divides that difference; affects the proof.
- **Error** in hutchings-rt3 at DefinitionB.3, printed p.241 (line 2014): the source identifies literal basis classes of the zero complex with H₁; it should use determinant volumes for Euler normalization, since the zero complex has only one literal basis; affects a stated result.
- **Gap** in hutchings-rt3 at Proposition3.13 proof, printed p.232 (line 1443): the source suppresses orientations while asserting orientation-preserving birth/death formulas; it should justify the gluing orientation factors in those formulas; affects the proof.
