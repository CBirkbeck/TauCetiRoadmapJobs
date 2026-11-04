<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1184#issuecomment-6398905372 -->
Review (codex) of 5c5e1c7

Verdict: accepted
Conditional on the announced gaps: `finite-group-quotient-analytification`, `analytic-cycle-current-transport`, `hyperbolic-cycle-volume-comparisons`, `relative-point-ball-volume`, `hyperbolic-trigonometry`, `gonality-norm-and-base-change`, `singular-metric-li-yau`, `free-locus-and-relative-cycle`, `curve-extension-and-normalization`, `cyclic-surface-resolution-and-contraction`, `surface-contraction-intersections`

1. **F01** (P3) Height citation points to a page marker

   **Location.** `packages/GeometricFreyMazur/README.md:463`: “(BT16 §3.3, p. 721; BT16 line 537.)”

   **Claim.** The supplementary line locator identifies the definition of entrywise height.

   **Witness.** BT16 line 537 is the next page marker. The definition is at BT16 lines 533–534, on printed p.721. The section and printed page already identify the right passage.

   **Exact repair.** Change only “BT16 line 537” to “BT16 lines 533–534”. Keep the mathematical statement and the section/page locator. At the corrected passage, the all-ones matrix has height 1, while its Frobenius norm is 2; the cited definition therefore supports the package's discriminating example. No change to Suggested.lean is needed.

One non-blocking locator finding; no P1 or P2 findings. Acceptance is conditional on the eleven declared supplier contracts listed below. This review does not certify their implementation. The package inputs were left unchanged.

## Verified sound

Read all 66 numbered targets in 11 layers, all 66 Needs lines, conventions, APIs, Checks, supplier contracts, worked arguments and the three Lean declarations. The previous review contains 161 rows with computed values; its rows for unchanged targets were reused only where they actually compute values. Its summaries without values were not substituted for checks. The repair diff was inspected, every changed passage was reviewed afresh, and the four repaired patterns were searched throughout the package. The table below records fresh calculations for all fifteen seeded targets, every headline family, the repaired passages, and R01. Unchanged auxiliary targets also retain the previous review's computed evidence.

### Previous findings, checked first

| Previous finding | Repaired passage, with current location | Status and test |
|---|---|---|
| F01: supplier drift | README:70: “Section 8.4, `complexConjugationComparison`”; README:132: “A1.6, `relativeEllipticEquivalence`”; README:136: “Section 5.3 supplies λ′₁≥21/100”. | **Repaired.** Opened all three supplier targets and ModularCurvesPartII §8.5. Conjugation multiplies the determinant class by −1: 4 is square mod 5, 6 is nonsquare mod 7. The relative equivalence retains the zero section, multiplication and differentials, including over dual numbers. The spectral convention gives 21/100, with empty-small-spectrum value 1/4. Every use was repointed; §6.1 remains only for compact uniformization. |
| F02: finite analytic quotient incorrectly imported | README:114: “étale-presentation quotients”; README:116: “What ComplexComparisonPartII must provide (gap:finite-group-quotient-analytification)”. | **Repaired locally; supplier implementation remains a declared contract.** The identical slug and needs occur in the plan. For the sign action on P¹, the local quotient is z↦z², of local degree 2 and derivative 0 at zero; it is not an étale presentation quotient there. Trivial action on a dual-number point retains length 2. The repair report's “not actionable in this package” reason is correct for implementing the external comparison; it is settled and not re-raised. |
| F03: duplicate current theory requested | README:100: “proper normalization with branch weights, integration of pulled-back forms and weighted pushforward”; README:98 explicitly imports ComplexComparisonPartII C5.4. | **Repaired.** The gap now requests additional normalization, finite-map, sublevel and cusp transport. It no longer requests a second general current carrier or Poincaré–Lelong theorem. For f=1,z,z² the package and supplier conventions give masses 0,1,2; a double line integrates a unit test form to 2. All consumers use the same convention. |
| F04: procedural or repeated Checks | README:379: “the word −L(4)U(3)L(−3)U(3) equals [[8,21],[35,92]]”; README:739: “At R=10, sinh R≈11013.232875”; README:1195: “p=7 and Ψ=diag(1,3) give Weil multiplier 3”. | **Repaired.** Recomputed both matrix words, rotation displacements, square classes and Legendre values. The same-pattern edits at §§5.4,5.8,9.5,10.5 give exponents −1/100 versus +1/10, distinct versus repeated pencil fibres, faithfully flat ideal tests, and intersection values −1 versus 2. No extra Lean declarations were introduced. |

The new analytic-quotient gap is consumed at §§0.2,6.1,6.4. The current-transport repair reaches §§0.6,4.1,5.1,5.5 and the point-ball argument. Searches found no surviving use of the old conjugation, relative-equivalence or spectral aliases. The original general quotient, current calculus and scalar-level modular curve remain with their earlier owners.

### Sources and seeded sample

Read the legal cached published BT16, author erratum BTE and the five-page arXiv-v1 ABR96. The manifest distinguishes published/preprint pagination and keeps one key per work. No additional author-flagged unverified locator was found. BLR90 remains the settled uncertified exception described below. A source attribution supports the cited input, not automatically every new extension in the package.

| Seeded target | Text and locator read | Result, hypotheses and limits |
|---|---|---|
| 0.2 Diagonal quotient surface | BT16 §2.3, p.715, lines 276–286; BTE §1, p.1, lines 11–28 | Supports the coarse triple moduli and diagonal action. The fixed-pairing PSL presentation in BTE is reconciled with both scalar-level components here. General finite scheme quotients and their nonreduced analytic comparison are imported/contracted separately. No universal elliptic family is asserted on the coarse quotient. |
| 0.5 Exhaustive quotient branch locus | BT16 §2.1, p.714, lines 229–233; §2.4, p.716, lines 293–321 | Inertia types are 1,2,3,p. For p>5 their pairwise intersections are trivial except equal nontrivial types, giving the stated CM and bicusp possibilities. Matching type alone is not asserted sufficient without matching stabilizers. |
| 2.1 Entrywise height | BT16 §3.3, p.721, lines 528–534 | Maximum absolute entry, as claimed. The source defines it on SL₂(ℤ); extension of this ordinary norm to real/integral matrices is supplied by the pinned norm. The incorrect supplementary line pointer is R01. |
| 3.5 Hecke avoids anti-Heegner points | BT16 Remark 16, p.727, lines 747–749; BTE §1, p.1, lines 30–36 | The avoidance assertion is retained. The subsequent assertion that all anti-Heegner points repel is corrected by BTE and is not used. The package's scalar/eigenvalue argument retains p>3 and p∤m. |
| 4.1 Big diagonals and small Hecke curves | BT16 §4.4, p.728, lines 804–813 | Both matched coordinates occur, and the radius-r graph tube has distance threshold 2r. The conjugate variant is an explicitly real analytic extension, not a claimed Cartier divisor. |
| 4.2 Quadratic centralizers | BT16 Proposition 18, Case 2(1), pp.730–731, lines 884–899 | The quadratic versus nilpotent distinction supports the route. The package supplies its uniform unit-gap argument; it restricts to reduced two-dimensional quadratic algebras and excludes scalar and unipotent centralizers. |
| 6.5 Weighted projections | BT16 proof of Theorem 29, pp.741–742, lines 1407–1411, 1434–1435 | Projection degrees are used with multiplicities. The identities summing over slots and unordered pairs are derived here, retaining generic degrees; the distinct-fibre argument supplies nondegeneracy. |
| 8.1 Abramovich constant | ABR96 Theorem 0.1, p.1, lines 14–17; §§1.4–1.7, pp.2–3, lines 68–128 | Supports 7D/800 for effective index D, singular conformal metric, spectral bottom and area πD/3. The 21/100 input is resolved to CongruenceSpectralGap §5.3, not attributed to an absent alias. |
| 8.4 No actual self-twist | Mathlib `Matrix.SL2.commutator_eq_top`, SpecialLinearGroup.lean:804; package kernel argument | The pinned theorem requires a field and a≠0 with a²≠1, available for p>3. Surjectivity and an invertible intertwiner force the scalar character to descend to perfect SL₂ and vanish. The argument proves the stated stronger form without needing χ²=1. |
| 9.3 Geometric prime-to-p isogeny | BT16 §2.5, p.716, lines 322–325 | Supports the cyclic framed Hecke relation. The package explicitly lifts the geometric generic point, conjugates the curves by the coarse-moduli isomorphisms, and obtains f[p]=λΨ, with λ≠0 since p∤m. |
| 9.4 Actual torsion removes the twist | BT16 Theorem 1, p.710, lines 58–64; Tau Ceti Isogeny/Descent.lean:117 | The paper states the original-base result but leaves this descent implicit. The package's rank-one Hom argument fixes f under every Galois element; odd p is essential. The pinned criterion allows infinite Galois extensions. |
| 9.5 Uniformity in the constant field | BT16 Theorems 1–3, p.710, lines 55–77; §2.1, p.714, line 206 | The paper fixes k initially and then works over ℂ. Uniformity is justified by the package's additional finite-presentation descent, including the actual pencil and torsion data. Membership in a fixed H_m descends by faithful flatness. It does not embed an arbitrary k into ℂ. |
| 9.6 Full linear monodromy | BT16 remark/footnote, p.710, lines 71–74, 81–82; ABR96 Theorem 0.1 | Supports qualitative full SL₂ image and the geometric determinant convention. The explicit inequality 800N<7p is derived from the independent gonality and proper-index branch. The extension to arbitrary algebraically closed characteristic-zero k uses the supplied finite-cover invariance. |
| 10.3 Resolution and known curves | BT16 p.742, lines 1464–1469 | Cyclic charts of orders 2,3,p and rational exceptional chains agree. General resolution, transverse sections, contraction and intersection formulas remain named supplier contracts. |
| 10.4 Every rational curve is known | BT16 Corollary 32 and proof, p.742, lines 1471–1474 | Supports the classification application. The package supplies the distinction between exceptional curves and noncontracted curves, whose image normalization has genus zero; it does not confuse arithmetic genus with normalization genus. |

The worked point-ball and bicusp-shell arguments were read in full. Their claimed estimates are not inferred from an unrelated diagonal-tube theorem: the former uses the displayed Green/coarea calculation, the latter retains projection weights, signed loci and overlap cost. Source mistakes encountered during these checks are recorded at the end.

### Dependency and ownership audit

The prescribed dependency check with `--movable` exited 0:

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Every Needs line was read as well: the internal order is forward, and full monodromy/self-twist is not used to prove scalar-compatible descent. No ownership was moved to a later roadmap.

Main was checked at `e98875dbbea872d0496e323bc880e2b7fd00beb9`. Open supplier heads were ModularCurvesPartII `35be0c8`, ComplexComparisonPartII `2d50a88`, AbelianSchemesAndArithmeticModuli `71ecc01`, NeronModelsAndSemistableAbelianVarieties `3710abd`, InverseGaloisAndArithmeticFundamentalGroups `740b9cc`, and CongruenceSpectralGap `2fdf27d`. Main copies were used for existing roadmaps, rather than treating progress revisions as suppliers. Three main-branch shapes read were AlgebraicCurves, FuchsianOrbifolds and SchemeAndStackFoundations.

All roadmap references below are to `TauCetiRoadmap/<Name>/README.md`; line numbers are repository line numbers, excluding the retrieval service's header.

| Supplier | Current sections resolved and boundary of the supplied result |
|---|---|
| ModularCurves | §§0D–0E, lines 375,386: finite étale/Galois dictionary and descent. §2C, line 735: both dual-isogeny composites. §§5B–5C, lines 1313,1357: ordered full bases, pairing and twists. Projective classes are not substituted for actual torsion. |
| ModularCurvesPartII | §§1.2–1.3,2.3,3.9,3.14: pointed uniformization, lattices, polygons, frame torsors and open comparison. §§4.1,4.6–4.10: compactification, cusp stabilizers and pairing components. §§5.7,5.13,5.16,6.1: scalar/subgroup quotients and compact comparison. §8.4, line 2668, declaration at 2678: conjugation. §8.5, line 2692, declaration at 2702: generic base change. §9.13, line 3059, degree at 3067: cyclic boundary maps, correct polygon domains and ψ(4)=6. |
| SchemeAndStackFoundations | §§0.8–0.9, lines 798,848: spreading; §0.11, line 938: finite-Galois descent only. §1.17, lines 2657–2677: projective finite quotient over a Noetherian base with flat base change, without requiring the invariant degree-zero ring to equal the base. §3.2: scheme Hurwitz. §§4.11–4.13: modifications and finite normalization of integral curves; characteristic zero makes regular curves smooth here. §§5.1–5.3: cycles and weighted projection. §§5.9–5.10: intersections and adjunction. Missing surface/free-locus refinements are explicit gaps. |
| AlgebraicCurves | Layers 3–5, lines 475,527,571: divisors, norm/principal compatibility and Riemann–Roch. Layer 7, line 719: different/Hurwitz. Layer 12, lines 1085–1175: smooth proper models and function-field correspondence. General proper-target extension and the gonality package are requested separately; the existing normalization is not rebuilt. |
| FuchsianOrbifolds | Layers 0–5: effective projective actions, quotient charts, polygons, hyperbolic area, cusps and analytic curve degree. Layer 2, line 235, retains curvature −1. The marked trigonometric comparison/rotation/lens interface is the declared addition. |
| ComplexKahlerGeometry | K3, line 296: local analytic-set geometry. K6.1, lines 1274–1334: compact analytic integration and local mass inputs. The additional normalization, sublevel and cusp-density transport is distinguished from C5.4's currents. Neither relative point-ball growth nor the full two-kind tube comparison is presumed supplied. |
| ComplexComparisonPartII | C−1.1–C−1.3, lines 699,790,814: analytic spaces, nilpotents, analytification and étale-presentation quotients. C1.9 gives proper GAGA. C2.2, line 1737: coherent ideals and sections. C4.1–C4.5, lines 2153–2260 onward: proper images, algebraization and affine-curve comparison, with properness/compact-support qualifications. C5.4, lines 3020,3207,3230,3258: currents, weighted cycle integration and Poincaré–Lelong. C6.2, line 4137: Riemann existence with finite covers and deck actions. No general ramified finite-group analytic quotient is silently attributed to the étale-presentation sections. |
| RiemannianGeometry | R7.0, line 1295: nonnegative Laplacian; R8, line 1404: sphere spectral normalization. The finite-area metric with cone/cusp singularities and cutoffs is the declared Li–Yau extension. |
| AbelianSchemesAndArithmeticModuli | A1.6, line 898: relative dimension-one equivalence; A1.8, line 925: Dedekind extension. A3.1–A3.5, lines 1331–1451: finite flat isogenies, torsion, quotient and dual. A3.7–A3.8, lines 1569,1599: pairing/frames. A6.1,A6.6,A6.7, lines 2742,2848,2864: degree and Hom lattice. A6.20,A6.25,A6.34, lines 3239,3348,3621: full-level descent, normal-base extension and twists. The nonisotrivial rank-one application is owned here, not a second general Hom theory. |
| NeronModelsAndSemistableAbelianVarieties | §§1.3,1.8, lines 728,871: extension and abelian-scheme Néron models over the smooth Dedekind base. No arbitrary bad-reduction extension is asserted. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.0.3, line 652: actual finite systems. IG.1.3, line 1098 and characteristic-zero paragraph at 1265: invariance under algebraically closed extension, including nonproper finite-type schemes. IG.3.1, line 2519: punctured complex comparison. The positive-characteristic nonproper exception is not imported into the present characteristic-zero theorem. |
| CongruenceSpectralGap | §5.3, line 728: all-level bound λ′₁≥21/100, interpreting the empty discrete-small-spectrum case as 1/4. |

The citation resolver reported no unresolved roadmap/name reference among main and 363 open heads. Its external-library lookup was unavailable at the service's separate package path; the pinned library declarations were therefore checked directly, as recorded below. Resolver success alone was not used to validate the content of a section.

Object searches used the prescribed roadmap service across main and open heads, and the board index was read before any absence claim. Searches included finite group quotients, symmetric powers and norm cycles; currents, analytic-cycle integration and Poincaré–Lelong; gonality, Frey–Mazur, self-twists and monodromy; cyclic surface resolutions and contraction. The corrected searches were uncapped for their actual result size and used a word boundary for gonality, avoiding spurious orthogonality matches.

The projective modular curve/cyclic boundary correspondence, generic quotients, current calculus, curve normalization and Hom/extension theories all have earlier owners and are imported. The surface-specific diagonal quotient, signed strata and estimates, and their rigidity/descent applications are the package's distinct objects. No fully qualified name among the three Lean declarations duplicates a readable roadmap declaration. Polylogarithms §§5.1–5.2 explicitly imports the same C5.4 current theory. LogicAndDefinabilityInNumberTheory §2.10, line 497, concerns p-adic integration on rationally lifted free loci and assumes the quotient/free cover; it is not the missing complex analytic comparison. K3SurfacesAndSymplecticBoundedness's §finite-surface-quotients contract, line 96, likewise requests general surface resolution from SchemeAndStackFoundations; it does not implement a competing cyclic-resolution library. Overlap of consumer requests to the same owner is not duplicate ownership.

Four indexed board READMEs were accessible and searched: AnalyticNumberTheory `310e834`, AutomorphicCongruences `08f531f`, KatoEulerSystems `a3ba9c5`, LogicAndDefinabilityInNumberTheory `d36cfa5`. The fifteen inaccessible board heads are listed under Not verifiable; no assertion that those packages do not exist is made.

### Declared gaps

All eleven slugs appear in both the README supplier subsection and the plan's top-level gaps; every needs sentence matches exactly. All have earlier named suppliers. Each is a coherent interface with stated hypotheses and operations, rather than an unspecified appeal to “standard theory”. The review found no request to reconstruct a pinned result or an already supplied general theory. Existing partial inputs are retained, and the additional contracts are:

| Slug | Owner and additional mathematical content |
|---|---|
| finite-group-quotient-analytification | ComplexComparisonPartII C−1.3: ramified finite-group quotient comparison, invariant sheaves/local rings, orbit fibres, nilpotents and equivariant maps; distinct from étale presentations. |
| analytic-cycle-current-transport | ComplexKahlerGeometry K3/K6.1: normalization with branch weights, finite-map integration/multiplicity, sublevel Green/Stokes and zero-atom cusp transport; general currents and Poincaré–Lelong remain in C5.4. |
| hyperbolic-cycle-volume-comparisons | ComplexKahlerGeometry K6.1: point, diagonal and double-diagonal volume/multiplicity bounds with specified 4π/8π constants and cosh/sinh tube normalization, preserving weights. |
| relative-point-ball-volume | ComplexKahlerGeometry K6.1: V(r)≤C_n(1+r)e^(r−R)V(R), 1≤r≤R−2, arbitrary centre incidence; the roadmap gives the local Green/coarea route but does not re-own the general manifold transport theorem. |
| hyperbolic-trigonometry | FuchsianOrbifolds Layer 2: marked metric comparison, second cosine law, trace length, exact rotation identity and midpoint lens bound. |
| gonality-norm-and-base-change | AlgebraicCurves Layer 12 with 3–5: geometric/function-field gonality comparison, pencils, algebraically closed base change, norm monotonicity and genus bounds. Existing divisors, RR and models are inputs. |
| singular-metric-li-yau | RiemannianGeometry R7.0/R8: Friedrichs energy estimate λ_*Area≤8πgon with finite-area cone/cusp metrics and cutoff approximation. |
| free-locus-and-relative-cycle | SchemeAndStackFoundations §1.17: étale free quotient and finite-flat norm cycle to a permutation quotient, preserving fibre lengths and base change. |
| curve-extension-and-normalization | AlgebraicCurves Layer 12: extension to a proper separated target, factorization through the already supplied finite normalization, and normalization-genus comparison. |
| cyclic-surface-resolution-and-contraction | SchemeAndStackFoundations §§4.11–4.13: Hirzebruch–Jung chains, suitably transverse connected sections and smooth rational (−1)-curve contraction with Picard-rank termination. Existing normalization/Bertini fragments do not state this full surface interface. |
| surface-contraction-intersections | SchemeAndStackFoundations §§5.9–5.10: the negative continued-fraction matrix and the explicit intersection update under a smooth blowdown. |

### Pinned declarations opened and native-carrier checks

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| File and line at the pin | Declaration/content and the limitation checked |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:41` and :64 | `Matrix.ProjGenLinGroup` is the centre quotient; `mk_eq_mk_iff` is scalar equality. Lines 113,120 give the PSL-to-PGL map and injectivity, not equality of these groups. |
| `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:33` | `Matrix.ProjectiveSpecialLinearGroup` is SL modulo its centre. At p=7, PGL/PSL has two determinant classes. |
| `Mathlib/Analysis/Matrix/Normed.lean:79`, :87, :106 | Scoped entrywise supremum instance, `norm_eq_sup_sup_nnnorm`, `norm_entry_le_entrywise_sup_norm`; not the operator norm. |
| `Mathlib/GroupTheory/Index.lean:55` | `Subgroup.index` is natural cardinality, hence zero for infinite coset spaces. Finite SL₂ and proper subgroups exclude this junk value. |
| `Mathlib/Data/Sym/Basic.lean:43`, :342, :361 | `Sym` consists of multisets of cardinality n; `Sym.map` and `Sym.map_map`. This is not a scheme quotient and does not discard repeated points. |
| `Mathlib/NumberTheory/FunctionField.lean:58` | `FunctionField` supplies finite dimension over the selected `RatFunc k`. It does not itself supply algebraic closedness, characteristic zero or compatibility of a second k-action; these are explicit headline binders. |
| `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:34`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | `adjoin` is subfield closure of the scalar image and the generators. `finrank` is naturalized rank, with infinite-rank fallback zero. The gonality definition explicitly requires finite dimension for every candidate degree. |
| `Mathlib/Algebra/Module/Torsion/Basic.lean:972`, :1010; `Mathlib/Algebra/Module/ZMod.lean:81` | `AddSubgroup.torsionBy`, its `zmodModule`, and `AddMonoidHom.toZModLinearMap`: actual points killed by p, with canonical scalar action. An additive equivalence is F_p-linear here. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:823` | `WeierstrassCurve.Affine.Point.map` is coordinatewise base change, preserving zero and addition; it sends p-torsion to p-torsion. Thus the Q=σ(P) condition in the signature always has a witness. |
| `Mathlib/LinearAlgebra/Determinant.lean:173` | `LinearMap.det` uses a finite basis when one exists, otherwise returns 1. Actual elliptic geometric p-torsion in characteristic zero is rank two; arbitrary modules are not admitted by the headline. |
| `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804` | `Matrix.SL2.commutator_eq_top` requires a field and a nonzero a with a²≠1. The package restricts its use to p>3. |
| `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:595` | `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field` generates SL over every field, including F₂ and F₃. |
| `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean:120`, :133, :434 | `degree`, `FiniteHolomorphicMap`, `degree_comp`. The structure retains holomorphicity, two distinct values and finite fibres; compactness, connectedness and separation needed by results are separate hypotheses, not implicit structure fields. The multiplicativity theorem is in a section, so its cited root namespace is correct. |
| `TauCeti/Analysis/Complex/RiemannSurface/Ramification.lean:112` | `ramificationDivisor` has coefficients e−1, with the finite nonconstant compact-curve hypotheses in scope. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:64`, :72, :139, :161 | The coordinate pullback points from the target coordinate ring to the source function field; `MapsInfinity` retains pointedness; `TauCeti.Isogeny` and its identity are native carriers, not free predicates. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Descent.lean:117` | `existsUnique_map_eq_iff_galoisFixed`: genuine fixed-morphism descent under `IsGalois`; no finite-extension restriction. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Hom.lean:63` | `degree_zsmul`: multiplication by an integer scales degree by its absolute square, including zero. |

Object searches at both pins found no existing native geometric Frey–Mazur or full-monodromy theorem matching these conclusions. The gonality definition adds only a simple minimum on native field carriers; its geometric comparison remains the supplier's work. No additional generic matrix norm, quotient, multiset or isogeny definition is being planned here.

### Elaboration, headline coverage and padding

From the pinned content checkout, the required `lake env lean <absolute Suggested.lean>` command exited 0. Its only warnings were the two `declaration uses sorry` warnings at Suggested.lean:54 and :75. The individual Tau Ceti object file existed, so no build was needed. A scratch copy with `#check @name` for all three declarations also elaborated successfully. Each elaborated type was compared with README Conventions and §§9.6,9.8: no field, ellipticity, scalar-tower, characteristic, nonconstant-j, primeness or bound hypothesis was lost. No signature change was needed.

Both sorried theorems were probed on a scratch copy with separate one-tactic `simp`, `rfl` and `infer_instance` alternatives. Neither closed; the probe stopped at the two intentional failure markers. Reading the object-level library results found no single lemma giving either conclusion for an `exact` replacement. The gonality definition has a real body and is needed by both headlines. There are no admitted data definitions, free Prop stand-ins, API-padding theorems, admitted examples or `set_option`s. The sole Mathlib import and sole used Tau Ceti module satisfy the import rule. Nothing was left running.

| README headline family | Acceptance-test coverage at the pins |
|---|---|
| §§1.3–1.4,1.7: surviving witness and filling/compact systole asymptotics | Module docstring explicitly names missing scalar-level curve, marked triangle quotient and compact metric. |
| §§3.1–3.3,3.6: signed reconstruction and Heegner/bicusp repulsion | Docstring names missing framed modular points, strata and ordinary/conjugate loci. |
| §§4.3–4.4,5.8: overlap and big-diagonal bounds | Docstring names missing modular fourfold, graphs, tube geometry and weighted projection cycles. |
| §§5.2–5.4: Heegner, anti-Heegner and p-weighted bicusp multiplicities | Docstring names missing modular analytic cycles, multiplicities and canonical degrees. |
| §§7.3–7.5: wreath ramification decay and complex bounded-gonality rigidity | Docstring names missing quotient surface, scheme symmetric powers and normalized pencil pullback. |
| §8.1: Abramovich gonality lower bound | Docstring names missing compact algebraic congruence-curve carrier. |
| §§8.3,9.6: full linear monodromy | Stated by `full_monodromy` on actual geometric torsion, with 5<p and 800N<7p. |
| §9.5: uniform geometric rigidity over all algebraically closed characteristic-zero fields | Docstring names missing algebraic modular surface and Hecke loci. |
| §9.7: original-base geometric Frey–Mazur | Docstring names missing relative elliptic-scheme and finite étale torsion-isomorphism carriers; the equivalent function-field endpoint is retained. |
| §9.8: uniform function-field geometric Frey–Mazur | Stated by `geometric_frey_mazur`, with ∃M before k,K and an actual K-isogeny conclusion. |
| §§10.1–10.5: bounded genus, rational/elliptic classification and known-curve contractions | Docstring names missing quotient, cyclic resolution, strict-transform and contraction carriers. |

Both statable headline theorems are present. No statable endpoint is replaced by a scalar inequality or an arbitrary predicate. The subgroup-index and self-twist results are explicitly auxiliary README targets, not missing headline signatures.

The shape has all eleven layer-end Examples and Dependencies sections. Each retained definition/construction has its API and at least three discriminating Checks; the height subsection specializes an imported norm rather than introducing a new definition. The three Lean names occur in the README. There are no source passages copied into the package, algorithm deliverables, prohibited imports, theorem catalogues in Suggested.lean, or re-planned foundational roadmaps. Routine prose about proof routes does not create an executable algorithm target.

### Computed adversarial evidence

The 71 rows below record computed outputs, including negative controls, rather than treating a successful sorry build as evidence of truth. “Pass” means the written hypotheses exclude the stated wrong model or the values agree; no mathematical edit is proposed. Earlier unchanged auxiliary rows remain in the preceding review's 161-row table.

| Statement/convention | Instances tried | Values computed on both sides / competing model | Result; change |
|---|---|---|---|
| Gonality definition | k(t), a chosen k(t²), genus-one/hyperelliptic field, K=k | Minima 1, still 1 despite chosen degree 2, 2,2; empty candidate set gives 0 for K=k. | Pass; headlines exclude the empty case. |
| Left frame action, §0.1 | Noncommuting g=[[1,1],[0,1]], h=[[1,0],[1,1]] over F₇ | gh=[[2,1],[1,1]], hg=[[1,1],[1,2]]; h⁻¹g⁻¹=[[1,−1],[−1,2]]=(gh)⁻¹. | Pass; inverse gives a left action. |
| Components and repaired conjugation | p=5,7; scalar 2; diag(1,3) at 7 | Squares mod 5={1,4}, mod 7={1,2,4}; det(2I)=4; −1=4 or6; det diag(1,3)=3. | Pass; conjugation preserves or exchanges components according to −1. |
| 0.2 quotient, trivial/free/stabilized | Trivial action; z↦−z on P¹ | Identity quotient degree1; sign quotient w=z² degree2, derivative 0 at0; generic fibre {z,−z}. | Pass; gap explicitly includes ramification. |
| 0.2 nonreduced quotient | Trivial action on Spec ℂ[ε]/ε² | Invariant ring still has basis 1,ε, length2; reduction would have length1. | Pass; nilpotents retained. |
| 0.2 equivariant maps | Sign-equivariant z↦z³ | Descended w↦w³; both composites give z⁶. | Pass; compatibility specified. |
| 0.2 coarse versus fine | Projective frame and elliptic [−1], p=7 | [−φ]=[φ] but automorphism −1≠1; inertia contains two elements. | Pass; coarse object has no asserted universal family. |
| 0.5 exhaustive branch test | Ordered types in {1,2,3,p}, p>5 | 16 pairs: 13 have intersection order1; (2,2),(3,3),(p,p) can have order2,3,p when stabilizers agree. | Pass; mixed-type branch omitted correctly. |
| 0.6 cyclic degree and forbidden level | m=1,4,p | ψ(1)=1; ψ(4)=6 versus σ₁(4)=7; [p] on E[p] is zero, determinant0. | Pass; p∤m required. |
| Current convention, repaired F03 | f=1,z,z²; cycle 2[L] | Both normalizations give masses0,1,2; test form of reduced integral1 has weighted integral2. | Pass; no duplicated PL theory. |
| Hyperbolic area and graph radius | r→0; coordinate distance 3r/2 | a(r)/r²→π; midpoint distance3r/4<r in both coordinates, while distance3r/2>r. | Pass; graph threshold2r necessary. |
| 1.3 repaired matrix words | p=7,11 | M₇=[[8,21],[35,92]], det=736−735=1, tr=100; M₁₁=[[23,33],[154,221]], det=5083−5082=1, tr=244=2p²+2. | Pass. |
| 1.3 filling negative control | U(p)L(−p) | Matrix [[1−p²,p],[−p,1]], trace2−p²; both peripheral factors map to1 after filling, so their product maps to1. | Pass; package uses a different surviving witness. |
| 1.4/1.7 radius convention | Trace2p²+2 and compact witness coefficient | Length=2arcosh(p²+1)=4log p+O(1), radius=half=2log p+O(1); compact asymptotic coefficient27/(4π²)>0. | Pass; factor2 and nontrivial filling retained. |
| 1.6 metric signs | Cusp-distance d=1 | tanh²(1/2)≈0.213552≤h_X/h_Y≤1; inverse order would exceed the upper bound. | Pass. |
| 2.1 height and inverse | All-ones J; M=[[2,1],[1,1]] | h(J)=1, h(J²)=2=2h(J)²; Frobenius(J)=2. M⁻¹=[[1,−1],[−1,2]], both heights2. | Pass; locator-only R01. |
| 2.5 congruence exponent | δ=1/10 versus1/5 | 8δ=.8<1 versus1.6>1; a nonzero multiple p fits O(p^1.6) but not O(p^.8). | Pass; package uses δ<1/8. |
| 3.1 signed reconstruction | Q=diag(1,−1) | det Q=−1 and det(−Q)=−1; absolute degree1 but orientation remains negative. | Pass; conjugate locus required. |
| 3.2 centralizer and duplicate-point control | Gaussian/Eisenstein t₀; M_x=M_y=I | Determinants a²+b² versus a²−ab+b²; unit counts4 versus6; coincident equations have kernel dimension2, not≤1. | Pass; distinct Heegner hypothesis excludes duplicate case. |
| 3.3/3.4 corrected repulsion | Conjugate second coordinate of a CM⁺ pair | Equal eigenvalues (i,i) become (i,−i); an ordinary complex tangent (v,v) becomes (v,conj v), a real2-plane rather than a complex line. | Pass; conjugate locus has no divisor-intersection API. |
| 3.5 anti-Heegner avoidance | Gaussian opposite eigenvalues; Eisenstein conjugates | i−(−i)=2i has norm4; ζ−ζ² has norm3. For p>3 these nonzero endomorphisms cannot annihilate all E[p]. | Pass; no prime-to-p Hecke incidence. |
| 3.6 three-bicusp sign | Projective labels ∞,0,1 sent to ∞,0,−1 | Unique lift diag(1,−1), determinant−1; ordinary degree sign cannot be repaired by a scalar −1. | Pass; both signs included. |
| 4.1 simultaneous graph equations | Δ₁ in X⁴; τ₁,₁ | Δ₁ has complex dimension2; imposing only x₁=x₂ gives dimension3. Restriction x=y gives τ dimension1. | Pass; both matched equalities retained. |
| 4.1 tube identity and action | Slot swap; left actions a,b | Graph label becomes g⁻¹ under swap and agb⁻¹ under actions; matched coordinate distance d gives nearest-graph distance d/2. | Pass; fixed domains and directions. |
| 4.2 reduced quadratic centralizers | Split diagonal algebra; ℤ[i]; real unit matrix [[2,1],[1,1]] | Integral norm1 split units count2; Gaussian count4 for heights1,2,3,10; real eigenvalue(3+√5)/2≈2.618034, log-gap≈.962424. | Pass; powers of height≤p^A number O_A(log p). |
| 4.2 excluded nonreduced algebra | U(1)^n | Height=max(1,abs n); for integer H≥1 count=2H+1, polynomial rather than logarithmic. | Pass; nilpotent/unipotent algebra excluded. |
| 4.3 overlap alternatives | Signed reconstruction and cusp-centred orbit | Negative determinant gives conjugate small locus; at cusp centre all p rotations fix it, producing p overlaps rather than O(log p). | Pass; both alternatives needed. |
| 4.4 repaired rotation count | p=7,d=1,R=1/2 | D_k≈0,.980099,1.645565,1.961531,1.961531,1.645565,.980099; exactly k=0,1,6 have D_k<1. | Pass; count3 includes identity. |
| 4.4 growing radius and zero denominator | R=10; d=0 | sinh10≈11013.232875 versus10, ratio≈1101.323; d=0 gives p fixed rotations, not division by sinh0. | Pass. |
| 5.1 weighted canonical degree | Diagonal with g_X=3; degree3 parametrization; weighted node | Degree8 and area16π become24 and48π; two node branches of weight2 have multiplicity4. | Pass; pushforward weights retained. |
| 5.2 Heegner decay | δ₂=.01,δ₁=.001; m<4 | Powers−.02 and−.997 both decay; ψ(1)+ψ(2)+ψ(3)=1+3+4=8<64. | Pass; parameters fixed before p. |
| 5.3 anti-Heegner decay | ε=.1,p=101,1009 | p sinhε/sinh(log p)≈.200353,.200334; reversed fraction grows quadratically after this scaling. | Pass; correct tube ratio. |
| 5.4 repaired p-weight | Exponents−9/10 and−101/100 | Multiplication by p gives exponents+1/10 and−1/100. For δ₃=.01,δ₁=.001 the before/after powers are−1.017 and−.017. | Pass; required stronger decay retained. |
| 5.5 cusp measure | q=t^e, e=1,2; q identically0 | e² in numerator cancels e² from log²; constant coordinate contributes0. Mass inside ε=.01,10⁻⁶ equals2π/(−logε)≈1.364376,.454792→0. | Pass; no 0/0 or cusp atom. |
| 5.6 total cusped volume | p=7,11,101 | (g,s)=(3,24),(26,60),(40376,5100); area ratio=7,11/5,101/95=p/(p−6). | Pass; denominator positive for p>5. |
| 5.8 non-Hecke exclusion | Curve in T₁×T₁ | Unrestricted multiplicity/degree=3p/(p−6): 21 at7,303/95 at101, limit3≠0. | Pass; this configuration is excluded. |
| 5.8 repaired distinct-fibre Check | n=2, generic pencil fibre {b₁,b₂} | Birational image gives f(b₁)≠f(b₂), hence no quotient graph relation; repeated pair(b₁,b₁) lies on Δ₁. | Pass; generic separability and distinctness used. |
| Point-ball growth | Coordinate line; (r,R)=(1,3),(2,4) | V(r)/V(R)≈.059892,.104994; (1+r)e^(r−R)≈.270671,.406006. | Pass; test works with C₁=1. |
| Green/coarea normalization | Coordinate line, t=1,2 | N=1; V/(4π)=h′=sinh²(t/2)≈.271540,1.381098; h≈.240229,.867562; ds/dt≈1.701836,.551441. | Pass; flux and area factors agree. |
| Point-ball wrong stronger model | Curve(z,z/2), q=1/4,3/4; off-centre(a,z) | V/a=6/5 then14/13 decreases; below first off-centre level V=N=0. | Pass; no false monotonicity or centre-incidence requirement. |
| Bicusp shell and overlap route | Two or three balls; A=B=3 | Sum indicators2 or3 versus union indicator1; 2B=6>A+1=4; shell factor p^(−3δ), leaving decay after logarithmic costs. | Pass; high overlap charged to signed thin tubes. |
| 6.1 symmetric scheme fibres | n=1,2; distinct versus doubled point | Sym¹Z=Z; ordered orbit sizes2 and1, but cycles [z₁]+[z₂] and2[z] both have length2. | Pass; quotient orbit size is not cycle weight. |
| 6.1 singularity control | Swap normal coordinates of two surface factors | (u,v)↦(−u,−v); invariants a=u²,b=uv,c=v² satisfy ac=b², with all partial derivatives0 at0. | Pass; symmetric surface power not assumed smooth. |
| 6.2/6.3 normalization and pencil | Nodal cubic; simply ramified double pencil; constant f | Normalization genus0 versus arithmetic genus1; branch cycle2[f(b)] has degree2; constant f makes cycle map constant, degree0. | Pass; birational nonconstant input excludes last case. |
| 6.4 wreath cover | n=1,2,p=7; cyclic branch t=s² | Group orders336 and2·336²=225792; invariants k[[s²]]=k[[t]], local index2. | Pass; normalization not declared étale. |
| 6.4 component stabilizer | r components, W acting transitively | r·abs(H)=abs(W), deg α=abs(H), not automatically abs(W); conjugation replaces H by wHw⁻¹ without changing order. | Pass; component choice retained. |
| 6.5 pair-degree identity | n=1,2,3; C=(x₀,f(t),x₁) | Pair sums0,D,2D; in the three-slot example degrees d,d,0 sum2d=(3−1)d. | Pass; generic-degree pushforward essential. |
| 6.5 nondegeneracy negative control | C=T₁×{a}, p=7, a off T₁ | Total degree8; second slot one-cycle0; pair degree8. First is Hecke and second constant. | Pass; degree identity alone does not imply required nondegeneracy. |
| 7.1 exhaustive inertia | Two-slot element(g,g⁻¹; swap) | Fixed equations x₁=gx₂ and x₂=g⁻¹x₁ give one graph; identity permutation instead needs nontrivial slot inertia. | Pass; both ramification sources covered. |
| 7.2 only one p factor | n=2, ordersp,p; n=3, orders2,3,p | lcm(p,p)=p, bound6·2!·p=12p; after3! power order divides6p, hence original order divides36p. | Pass; local inertia cyclic. |
| 7.2 wrong noncyclic model | C_p×C_p | Group size p² but every element order p. | Pass; ambient stabilizer size cannot replace effective curve index. |
| 7.3/7.4 Hurwitz estimates | e=2,3,p; P¹ mapz²; n=2,D=20 | e−1=1,2,p−1; −2=2(−2)+2. Lower D/(2n)=5 exceeds decay allowance D/(4n)=2.5. | Pass; negative base term and positive D retained. |
| 7.5 finite uniform threshold | N=1,2,3 | Possible positive pencil degrees n<N are empty,{1},{1,2}; maximum of finitely many n-thresholds suffices. | Pass; no curve-dependent threshold. |
| 8.1 numerical constant | Effective indexD; empty small spectrum | (21/100)(πD/3)/(8π)=7D/800. Empty spectrum gives D/96≥7D/800. Wrong round area4πD gives21D/200, twelve times too large. | Pass; singular-metric input required. |
| 8.2 small primes and nonabelian groups | p=2,3,5,7 | SL₂ orders6,24,120,336; A₃⊂S₃ has index2 and Q₈⊂SL₂(F₃) index3. A permutation of fewer than p letters has no orderp. | Pass; all primes included in index theorem. |
| 8.3/9.6 numerical full image | N=2,p=229 versus227 | 800N=1600<1603=7·229; 7·227=1589 fails. Proper projective image forces gonality≥1603/800>2. A proper full-projective lift would have index2, impossible for perfect SL₂. | Pass. |
| 8.4 self-twist and negative control | Kernel element; nonsurjective cyclic example over F₅ | A=χA with A invertible givesχ=1. For D=diag(2,3), A=[[0,1],[1,0]], AD=−DA=[[0,3],[2,0]]. | Pass; surjectivity essential. |
| 9.1 repaired classifying-map checks | Legendre t=2,3; scalar aI | j(2)=1728, j(3)=21952/9, unequal; pole at0. Scalar projective class is1, det=a² square. | Pass; nonconstant map despite containment in H₁. |
| 9.2 Hom lattice | Non-CM generator f and2f; CM ℤ[i] | deg(2f)=4deg f; kernel contains E[2] of order4, so not cyclic. CM lattice rank2 has degrees a²+b² and constant j=1728. | Pass; nonisotrivial rank-one hypothesis required. |
| 9.3 Hecke lift | Degree m prime to p; m=1,id | det f[p]=m≠0; f[p]=λΨ withλ≠0. Identity gives degree1,λ=1. | Pass; actual scalar compatibility obtained. |
| 9.4 descent | p=5,σf=−f; p=2 control | Equality on torsion would give2f[p]=0 with invertible f[p], impossible at5; at2 it gives0=0. | Pass; odd p and actual torsion essential. |
| 9.5 repaired field-uniformity check | k of arbitrarily large cardinality; ideals0,(1), nonzeroI | Finitely many coefficients generate Q(t₁,…,t_s), transcendence degree≤s; base change sends0→0 and1→1; faithful flatness gives I⊗k′=0 iffI=0. | Pass; fixed H_m and threshold descend. |
| 9.6 actual monodromy control | Legendre over ℂ(t),p=229; constant E | Gonality1<2; U(2)^115=U(230)=U(1) mod229 and lower counterpart generate SL₂ of order12008760. Constant E has image order1. | Pass; nonconstant-j excludes constant counterexample. |
| 9.7 original-base extension | Isogeny degree n and dual over good-reduction U | Both composites=[n]; kernel lies in E[n] of rankn² and generic kernel rankn is retained. | Pass; smooth Dedekind base and extension supplied. |
| 9.8 native equivariance and conclusion | E′=E,e=id; P=0; general torsionP | Identity K-isogeny degree1; equivariance at0 is0=0. For everyσ, pσP=σ(pP)=0, so Q=σP exists. | Pass; implication is not vacuous. |
| 9.8 uniform quantifier and boundary | N=0,1,2 | Gonality≥1 excludes first two; N=2 admits ℂ(t). ∃M precedes all k,K,W,W′,p,e. | Pass; overall theorem nonvacuous. |
| 10.1/10.2 genus thresholds | g<N; g=0,1 | gon≤g+1≤N<N+1, so use M_(N+1); rational/elliptic gonalities1,2 are both<3. | Pass; M₃ covers both. |
| 10.3 cyclic resolution | 1/3(1,1),1/3(1,2),1/7(1,6),1/2(1,1) | Negative fractions[3],[2,2],[2,2,2,2,2,2],[2]; exceptional squares−3 or−2 chains. Matrix[[-2,1],[1,−2]] has determinant3. | Pass; off-diagonal intersection+1. |
| 10.3 known set | Exceptional component; strict transform of H₁ | Image dimensions0 versus1; H₁ normalizes to X(p)/G=P¹, genus0, and its strict transform retains genus0. | Pass; contracted and strict-transform clauses distinguished. |
| 10.4 rational curve dichotomy | Exceptional E; noncontracted rational C | Exceptional chain genus0; birational image normalization of C has genus0, even if image arithmetic genus is positive. | Pass; classification applies to normalization. |
| 10.5 repaired intersection/termination | C²=−2,C·E=1 or2; r contractions | New square−2+1=−1 or−2+4=2; Picard number decreases by r, while strict-transform normalization genus stays0. | Pass; recompute squares after each contraction. |

The quantifier, nonreduced, disconnected, zero-cycle, small-prime, constant-map and total-function controls were applied only where the relevant object exists. Fields here exclude the zero ring; characteristic zero excludes inseparable function-field extensions and p-torsion group-scheme pathologies. The analytic statements explicitly use finite-dimensional Hausdorff second-countable manifolds and compact modular components where needed. There is no asserted extension of those statements to arbitrary noncompact quotients or arbitrary characteristic-p fields.

## Not verifiable

- **BLR90:** settled `uncertified` and paywalled. Retained the author-recorded §1.2 Proposition 8, p.15 and §1.4 Proposition 2, p.19 locators without claiming to read the book or requesting it again. The corresponding supplier interfaces and pinned descent declaration were checked independently.
- **Fifteen indexed board package heads:** their supplied `packages/<Name>/README.md` paths returned HTTP 404: ArithmeticLocallySymmetricSpacesPartII; CompletedCohomologyAndLocalGlobalCompatibilityPartII; CrystallineCohomologyPartII; EndoscopicTransferAndUnitaryTraceComparisonPartII; HigherHidaAndColemanTheory; LawrenceVenkateshMethod; OrdinaryAutomorphicFormsAndModularityLiftingPartII; PELModuliPartII; PadicHodgeTheoryPartII; PadicLocalLanglandsForGL2QpPartII; RealSurfacePeriodIndex; SchemeAndStackFoundationsPartII; ShimuraVarietiesPartII; VStackSheavesAndLisseCategoriesPartII; VectorBundlesAndIsocrystalsPartII. Ownership against these inaccessible files was not checked. Available open roadmap heads were searched through the prescribed service. A failed board path is not evidence that the roadmap exists nowhere.
- **BTE scan:** the supplied five-page OCR extraction was read. No independent image transcription was performed in this review. Clear formulas and their mathematical consequences were checked; ambiguous OCR fragments were not used to manufacture further errata. The reciprocal issue below is also detected by the stated monotonicity and the ensuing p⁻¹ estimate.

No new source needed fetching, no new missing-reference request was created, and all four author source entries remain unchanged. The eleven supplier contracts are future mathematical obligations, not missing texts. Their implementation is not certified by this acceptance.

## Source issues

- **Error** in BT16 at §2.2, printed p.715: the source says scalar-framed generalized elliptic curves have a fine moduli scheme; it should say coarse moduli unless residual scalar automorphisms are rigidified; affects a stated result.
- **Error** in BT16 at Lemma 5 proof, printed p.718: the source says its trace-(2−p²) matrix supplies the filling-sensitive upper bound; it should use a witness surviving filling, since that matrix is a product of killed peripheral powers; affects the proof.
- **Misprint** in BT16 at §3.1, printed p.718: the source says the cusped radius is an infimum of geodesic lengths; it should be half that infimum, consistently with the compact convention and ensuing estimates; affects nothing.
- **Gap** in BT16 at Corollary 8 proof, printed p.720: the source says a shortest loop has at most one deep cusp visit using a 2log p length bound; it should use the 4log p length bound and control the number of visits; affects the proof.
- **Error** in BT16 at Proposition 12(a) proof, printed p.724: the source says δ<1/4 makes a p-divisible O(p^(8δ)) integer vanish; it should require 8δ<1 for that inference, hence δ<1/8; affects the proof.
- **Error** in BT16 at Lemma 15 proof, printed p.726: the source says the conjugated lift squares to −1 in both elliptic cases; it should use t²+t+1=0 and the Eisenstein norm in the order-three case; affects the proof.
- **Error** in BT16 at Proposition 14 and Remark 16, printed pp.725–727: the source says close anti-Heegner points lie on ordinary small Hecke loci and therefore always repel; it should place them on conjugate loci and restrict the ordinary statement to Heegner points; affects a stated result.
- **Error** in BT16 at Proposition 17, printed pp.727–728: the source says reconstruction always gives an ordinary small Hecke locus; it should include conjugate loci when the reconstructed determinant is negative; affects a stated result.
- **Error** in BT16 at Proposition 18(a) and Case 1, printed pp.729–730: the source says the rotation count has linear-R dependence; it should retain sinh R and an additive identity term when R grows with log p; affects a stated result.
- **Misprint** in BT16 at Proposition 18 proof, printed p.731: the source says the cusped metric is smaller than the compact metric; it should reverse that comparison, as Proposition 7 and the ensuing inequality require; affects nothing.
- **Error** in BT16 at Proposition 27, printed p.737: the source says multiplicity decay holds without restrictions on the two projections; it should exclude Hecke projection components, since T₁×T₁ gives limiting ratio3; affects a stated result.
- **Gap** in BT16 at Proposition 27 proof, printed pp.739–740: the source says diagonal-tube growth controls point-ball shells and treats bicusp overlap without the needed signed charging; it should supply relative point-ball growth and bounded-overlap charging with conjugate loci; affects the proof.
- **Gap** in BT16 at Corollary 30, printed p.742: the source says the same gonality threshold covers every small genus bound; it should enlarge to M_(N+1) when using gonality≤g+1, including genera zero and one; affects the proof.
- **Error** in BT16 at §2.5, printed p.717: the source says cyclic degree-n Hecke projections have degree σ₁(n); it should use ψ(n), giving6 rather than7 for n=4; affects a stated result.
- **Misprint** in BT16 at §2.5, printed pp.716–717: the source says both displayed polygon coordinates use ℤ/n; it should use ℤ/(pn) for the source of φ_n and ℤ/p for ξ_d; affects nothing.
- **Misprint** in BTE at Proposition 4.1 proof, p.3: the source says the small-tube bound uses sinh(ρ/2)/sinh ε; it should use sinh ε/sinh(ρ/2), which decays like p⁻¹; affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, p.4: the source says a sum of ball volumes is bounded by a tube volume without overlap cost; it should retain the cusp-count overlap factor p^(O(δ₃)); affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, p.4: the source says ordinary small Hecke loci suffice in the bicusp partition; it should include conjugate loci and their sinh-normalized tube comparison; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5c5e1c726661377bfe05162ecf4b7902a283ef9f", "job": "REV-PKG-GeometricFreyMazur~3", "model": "gpt-6-astra", "worker": "chris-8"} -->
