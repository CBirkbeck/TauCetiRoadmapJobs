# Review of ReductiveGroups (pull request #1676 at 8ab2906)

**Verdict:** needs changes

## R01 (P1) — Weyl conjugation does not preserve the specified Levi action

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1784–1786`: “the common-Levi isomorphism is the conjugation isomorphism”.

**Claim:** The GL₂ Check identifies the fixed-Levi bimodule isomorphism of §7e with conjugation by the Weyl element. Conjugation changes the T-action. The correctly stated conjugation comparison at lines 1766–1771 includes precisely this twist; the Check drops it.

**Witness:** Over 𝔽₃ take w=[[0,1],[1,0]] and t=diag(2,1). Then wtw⁻¹=diag(1,2)≠t. The cosets twU⁻ and wtU⁻ are distinct: their second columns are (2,0) and (1,0).

For the left-G-equivariant map gU⁺↦gw⁻¹U⁻, right multiplication by t on the source becomes right multiplication by wtw⁻¹ on the target. Conjugation of both actions is also not a map of bimodules with the original actions fixed.

**Repair:** Replace this Check by the displayed twisted conjugation comparison, and explicitly distinguish it from common-Levi independence with the identity identification of T. Use §7e's averaging intertwiner for that latter assertion. Retain the 𝔽₃ matrix as a negative control. On this instance the twisted actions both give twU⁻, while the untwisted actions give the two distinct cosets above.

## R02 (P1) — Two internal dependency cycles remain

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1862–1863,2680–2681,2760–2769,2916–2925`: “Layer 9's pinned groups and special isogenies”; “Layer 7g's Steinberg endomorphisms”; “integration … of10A”.

**Claim:** The repair broke the old classification/construction cycle, but the written build still has 7g→9B→7g and 9C→10A→9C. The second is explicit: 9C integrates contraction using 10A's interface, while 10A differentiates and constructs that interface through 9C. The roadmap-level dependency checker does not inspect this graph.

**Witness:** The pairs of prerequisite edges are (7g,9B),(9B,7g) and (9C,10A),(10A,9C). Each pair has a directed path back to its start; neither pair admits a topological ordering.

**Repair:** Separate 9B's carrier construction from its fixed-point applications; construct carriers first and put their 7g applications afterwards. Split 9C into distribution construction and contraction of rational modules: order distributions → 10A integration → contraction. Give these targets separate Needs lines and update the layer summaries. The two cycles then become the acyclic supply chains 9B→7g and distributions→integration→contraction. Do not merely remove prerequisites from the prose while retaining their use in the proof route.

## R03 (P1) — The Weyl/based factorization is attributed to a nonexistent supplier section

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:2148–2151`: “RootSystems4A … actual Weyl/based factorization”.

**Claim:** The full lift comparison consumes a supplied factorization without a corresponding supplier target. There is no declared gap.

**Witness:** Main's `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:296–319` is Layer 4, about chambers and the longest element; Layer 5 starts at 321. There is no 4A or stated automorphism factorization there.

The earlier RootSystemsPartII was also searched: its targets concern dominance and folding, not this purported 4A. A revision of the existing RootSystems roadmap is not a substitute for its main-branch contract.

**Repair:** Cite RootSystems Layer 4 for simple transitivity on chambers, then state the needed factorization adapter explicitly here, including its hypotheses and uniqueness: use the unique Weyl element carrying the image base back to the specified base, and compose to obtain a based automorphism. Alternatively consume a correctly declared supplier gap for that precise result. The A₁ automorphism −1 must factor as Weyl element −1 and based automorphism 1; the empty root system on its root span gives (1,1). Retain the separate full-Y action rather than inferring it from the root span.

## R04 (P2) — The companion Lean files still violate the acceptance-file rules

**Location:** `TauCetiRoadmap/ReductiveGroups/SpecialLinearCoordinateTargets.lean:16–20`, `SignedADETargets.lean:141–145`, `FoldingADETargets.lean:190–194`, `SpectralWeylTargets.lean:63–64`; prohibited imports also start `CoverLiftTargets.lean:1`, `OrbitGeometryTargets.lean:1` and `IntegralRationalTargets.lean:1`.

**Claim:** The brief applies the Lean form rules to every listed Lean file. Passing the build of Suggested does not certify these files. They retain admitted data, import other roadmap modules, and duplicate targets now correctly stated or explicitly omitted in Suggested. Several lack the mandatory `import Mathlib` or import Mathlib submodules.

**Witness:** `coordinatePresentation` is an algebra equivalence defined by `sorry`; `fixedIntegralBasis` is a basis defined by `sorry`; `centerHomeomorph` is a homeomorphism defined by `sorry`. Suggested's existential coordinate theorem already replaces the first correctly.

The eight companions are BruhatCoordinateTargets, CoverLiftTargets, FoldingADETargets, IntegralRationalTargets, OrbitGeometryTargets, SignedADETargets, SpecialLinearCoordinateTargets and SpectralWeylTargets. CoverLiftTargets also uses `CoverLifts.LiftGroup` without supplying that construction, and privately reconstructs the native bilinear-form isometry subgroup. SpectralWeylTargets supplies admitted operations that Suggested's docstring correctly says are unavailable.

**Repair:** Delete the obsolete companion acceptance catalogues, preserving their mathematical targets and discriminating examples in the README. Any genuinely statable headline still needed belongs in Suggested as a theorem with `sorry`, using a few real definitions on pinned carriers. Keep unavailable constructions in its docstring. On the SL example, Suggested already gives an existential algebra equivalence with generator equations, including n=0, without an admitted data definition. The folded basis and cameral homeomorphism remain construction targets, not fabricated data.

## R05 (P2) — Rational cohomology and cotensor induction are planned twice

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:17–18,399–480,3491–3492`: “Layer 1.1 owns rational cohomology and cotensor induction”.

**Claim:** This repeats an earlier supplier's arbitrary-base theory and reverses its direction of supply by declaring the supplier a consumer. Renaming ownership here does not change the other roadmap.

**Witness:** `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1145–1174,1209–1224`, at its indexed open head, constructs enough injectives, the same cofree complex, coefficient-order comparison, cotensor equalizer, reciprocity and antipode conversion over flat Hopf algebras.

This is equality of objects, hypotheses and maps, not similarity of topic. The supplier is earlier in the merge order and §0.7 does not depend on ReductiveGroups for these constructions.

**Repair:** Consume IntegralHeckeAndGaloisDeterminants §0.7 in the exact supplier contracts. Remove the duplicate generic construction and the reversed downstream claim; retain the rational group-scheme adapters and reductive applications. Test the import on H=ℤ[t,t⁻¹], weight one: d⁰(1)=t−1 and d¹d⁰(1)=0 in both conventions; for H=ℤ and M=ℤ/2, H⁰=ℤ/2 and Hⁿ=0 for n>0. Those are already supplier cases, not a new generality extension.

## R06 (P2) — The classical complex-point carrier also has an earlier owner

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:19–22,728–773,3492–3495`: “Layer 3A.5 owns the classical topology and smooth complex-manifold charts”.

**Claim:** Classical topology, smooth charts, Hausdorffness and properness are reconstructed even though ComplexComparisonPartII supplies them on the same points, at at least this generality. Forgetting its analytic ring sheaf does not create a different object to own.

**Witness:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:773–803`, C−1.1 at its indexed open head, supplies classical X(ℂ), arbitrary affine gluing, products, smooth charts, étale local inverses, separated/Hausdorff and proper comparisons, including nonreduced schemes.

**Repair:** Import C−1.1's underlying topology and smooth-chart comparisons, remove their reconstruction and the reversed downstream assertion, and retain ReductiveGroups' algebraic-orbit smoothness, stabilizer and tangent/group comparisons. The dual-number point remains a singleton topologically while its ring has ℂ-dimension 2; the doubled line retains its two nonseparable origins. Both tests already hold on the supplier's carrier. No proper-GAGA theorem is needed for this import.

## R07 (P2) — Closed-subgroup stability of diagonalizability is already proved

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:904–909`: “stability of diagonalizability under subgroups and quotients”.

**Claim:** Consuming the native anti-equivalence repairs the earlier finding only partly at the object level: the closed-subgroup part of this retained target is also a pinned theorem.

**Witness:** `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/ClosedSubgroup.lean:56,67` proves `groupLikeSpannedProperty.of_surjective` and `.quotient`; these identify diagonalizable closed subgroups, including Hopf-ideal quotients, over every field.

Here a quotient *coordinate algebra* describes a closed *subgroup*, not a quotient group. This finding does not claim that the separate quotient-group or Galois-descent statements are supplied by those two declarations.

**Repair:** Add these exact declarations to the Tau Ceti contract and delete the corresponding construction target. Retain the genuinely additional exactness, quotient-group and multiplicative-type/Galois comparisons. For μ_p⊂𝔾_m in characteristic p, k[t,t⁻¹]→k[t]/(t^p−1) is surjective, the target is still group-like-spanned, and its length is p although it has one geometric point. The existing theorem covers precisely that nonreduced test.

## R08 (P3) — Deep construction blocks still lack exact source locators

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:2015–2058,2977–2989,3244–3253,3384–3387`: “References … include Brieskorn's … presentation, Salvetti's face/chamber model”.

**Claim:** The signed ADE bracket/Jacobi construction, algebraic Steinberg theorem and finite-arrangement presentation have no theorem/section/page locator at their claims. Naming an author or proof method does not supply one. This is the unresolved part of previous R12, despite the repaired Dudas–Michel and Borel locators.

**Witness:** The Steinberg paragraph states Δ((p−1)ρ)≃L((p−1)ρ)≃∇((p−1)ρ) and its dimension without a locator. The arrangement block promises completeness of the braid relations, but gives only authors' names later.

**Repair:** Add exact, legally checkable locators, identifying a proof passage when a step is not a separately stated theorem. Distinguish the source's hypotheses from any generalization proved here. Recheck against A₂'s opposite-root sign −1, SL₂ at p=2 (Steinberg dimension 2), and rank-one arrangement (π₁=ℤ, square-cover monodromy mod 2). Keep the statements in the author's own words.

## R09 (P3) — Companion declarations include one-tactic padding

**Location:** `TauCetiRoadmap/ReductiveGroups/SpectralWeylTargets.lean:85–86`, `FoldingADETargets.lean:329–331`, `BruhatCoordinateTargets.lean:119–121`.

**Claim:** Quotient-map continuity, fixed-submodule-as-kernel, and evaluation of the just-defined covering homeomorphism are API facts, not roadmap acceptance headlines.

**Witness:** Scratch elaboration closes `continuous_forgetOrder` by `exact continuous_quotient_mk'` and `fixedCartan_eq_kernel` by `exact LinearMap.fixedSubmodule_eq_ker _`. The covering evaluation is already proved by `rfl` in the submitted file.

**Repair:** Delete these declarations from the acceptance files; if consolidating into Suggested, delete them from `Suggested.lean` rather than moving or proving them there. Keep relevant README API statements and Checks. At n=2 the quotient sends (0,1) and (1,0) to the same point; at γ=−1 on ℤ both fixed submodule and ker(γ−1) are zero. Neither computation needs a new headline.

## Previous findings, checked before the full review

These are the thirteen findings at e861250, assessed against this head. No applicable repair report marking one of them “not actionable in this package” was supplied. The present brief expressly includes the companions.

| Previous finding | Current passage and assessment |
|---|---|
| R01 schematic centre/radical | **Repaired.** README:1031–1036 uses “maximal central torus” and “(Z(G)_red)°”; SL_p's centre μ_p no longer becomes its radical. |
| R02 GL/O convention | **Repaired.** README:1261–1265 uses “g↦ggᵀ” on right cosets and gives the upper-triangular matrix control. |
| R03 classification cycle | **Repaired for that cycle.** README:1918 says “not existence for a given root datum”; 9D now proves classification after construction. Other cycles are R02 above. |
| R04 Lang proof in characteristic p | **Repaired.** README:1443–1457 uses the twisted-action dimension/fixed-point argument, with Milne 17.96, not the characteristic-zero orbit differential comparison. |
| R05 companion acceptance files | **Not repaired.** `coordinatePresentation … := by sorry` remains at SpecialLinearCoordinateTargets:16–20; see R04 above. |
| R06 rational cohomology ownership | **Not repaired.** README:17 says “Layer 1.1 owns rational cohomology”; the earlier owner still constructs it. See R05. |
| R07 analytic carrier ownership | **Not repaired.** README:19 says “owns the classical topology”; C−1.1 still supplies it. See R06. |
| R08 relative reductivity duplication | **Repaired.** README:185–191 consumes `reductiveCommHopfAlgPropertyOver` and its base change, including nonreduced bases. |
| R09 absent plane-braid headline | **Repaired.** Suggested:239 and :245 state `plane_braid` and `permutation_nonsplit` on the actual configuration quotient/native braid group. |
| R10 S₃ characteristic | **Repaired.** README:490–496 states ℂ and explicitly tests the characteristic-two/three failures of the semisimple decomposition. |
| R11 diagonalizable anti-equivalence | **Repaired as stated.** README:192–198 consumes `schemeEquivalence`. The residual closed-subgroup duplication is the narrower R07 above. |
| R12 missing/wrong locators | **Partly repaired.** README:1624 now cites Definition 9.2 and Proposition 9.4, and the fixed-coset locator is 7.6(i). Blocks in R08 remain unlocated. |
| R13 boundary Checks | **Repaired.** README:926 specifies ℚ; :1062 excludes n=0; :1872 says “positive-dimensional” and handles the trivial group separately. |

## Verified sound

Read the whole 3,549-line README and all nine listed Lean files, not only the 753 changed lines. Read the repository's normative writing rules and contribution rules, and main-branch examples including RootSystems, ReflectionInvariantTheory and InductionRestriction. The review covers the supplied head only. The existing main roadmap was also checked as the baseline: this is a revision of its reductive-group scope, not a second independently owned roadmap. The duplicate generic foundations identified below are repairable by restoring supplier contracts. No PR file was changed.

### Mechanical evidence and acceptance signatures

- The supplied gate reports **OK**, with every counter zero, including targeted build, imports, sorry-data, stray-files and outside-folder. There are no gate failures to report. Its coverage must not be confused with the manual findings on the companion files.
- The targeted build `lake build TauCetiRoadmap.ReductiveGroups.Suggested` completed. Direct `lake env lean` on the absolute Suggested path subsequently exited 0 with **10 warnings, all `sorry`**. No bare build, dependency update or cache download was run.
- A scratch copy printed **23 `#check @name` signatures**: all definitions and theorems in Suggested. The five orbit results retain algebraic closedness, affine/smooth/quasi-compact G and separated finite-type X; `exists_closed_orbit` retains the explicit nonempty point hypothesis. The reductivity implication retains `CharZero`; the Borel predicate itself supplies algebraic closedness. The coordinate presentation quantifies over every n, and nonsplitting retains 2≤n. No dropped standing hypothesis was found in these signatures.
- Each of the **10 sorried Suggested theorems** was tested in a copy with `rfl`, `simp` and `infer_instance` alternatives: none closed. Pinned declarations were also inspected for an exact-lemma replacement. The separate exact-lemma probe for the two padding facts in R09 exited 0. This is evidence against padding in Suggested, not a proof of its ten headlines.
- Git head matches 8ab29060b3405bc8d62afdf3bc56ef19258ef6ee. The outside-folder diff is empty and the worktree remains clean.

Required dependency-check output:

```text
depcheck: 204 roadmaps, 1596 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line for the inter-roadmap graph. Every Needs line and supplier citation was inventoried. The internal target cycles in R02 are additional manual findings, not a contradiction of that output. No declared supplier gap was found.

### Seeded source sample

Two texts were obtained through the sources service from legal hosts. No source passage was copied into the roadmap or this report. The README contains no additional locator marked unverified.

| Sample | Locator and evidence read | Hypotheses and conclusion checked |
|---|---|---|
| 1.1 enough injectives | Jantzen, **1985 Part I preprint**, §3.9, printed p.60; `jantzen line 1688` through 1707 | Flat affine group scheme over a commutative ring; arbitrary rational coefficient module. Module embedding followed by cofree adjunction supplies enough injectives. |
| 1.1 derived invariants/cofree complex | §§4.2,4.7(a),4.14–4.16, printed pp.69–70,72–73,77–79a; `jantzen line 1923`, 1994, 2102, 2137, 2153 | Derived fixed points and cofree acyclicity do not require flat M. Read the page-77 scan as well: first coface is coefficient coaction, interior cofaces coproduct, last coface appends 1, with signs (−1)^i. |
| 1.1 induction | §§3.3–3.7, printed pp.53–57; `jantzen line 1507`, 1537, 1548, 1569 | Subgroup induction uses f(gh)=h⁻¹f(g), left translation and counit evaluation. The README explicitly identifies the arbitrary-Hopf-map equalizer extension as its own argument; it does not misattribute that extension to a subgroup theorem. |
| 8.1 split data | Conrad, Definition 5.1.1, printed p.136; `conrad line 5651` through 5659 | Nonempty base, specified split maximal torus, constant roots/coroots and free root lines. Central lattices and nonreduced bases are retained. |
| 8.2 pinning | Conrad, Definition 6.1.1 and Remark 6.1.2, printed pp.186–187; `conrad line 7725` through 7751 | Constant positive system plus generators of simple-root lines. The remark distinguishes arbitrary componentwise Borels on disconnected bases, as the README now does. |

Source versions: Jantzen's cited 1985 institutional preprint has different pagination from later books; the README explicitly identifies it. Conrad is the linked author copy. The author copy's p.134 was also visually inspected to confirm the source error recorded below.

### Pinned definitions and ownership evidence

Pins checked: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The following are concrete pin checks, not assertions about a newer library:

| File at the pin | Declaration/definition opened and relevant limit |
|---|---|
| `TauCeti/Algebra/AlgebraicGroup/Borel/Basic.lean:148` | `HopfIdeal.IsBorelOverAlgClosed` is `IsAlgClosed k ∧ Minimal (IsBorelCandidate k H) I`; minimal ideals mean maximal subgroups. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:70` | `reductiveCommHopfAlgProperty` uses smoothness, geometric connectedness and absence of smooth connected normal geometric unipotent subgroups; it does not demand a smooth centre. |
| `TauCeti/Algebra/AlgebraicGroup/LinearlyReductive.lean:64` | `linearlyReductiveCommHopfAlgProperty` tests complete reducibility of finite-dimensional comodules in the base universe. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38,55,82` | Relative predicate, isomorphism-invariance instance and `baseChange`; arbitrary commutative base rings, not only reduced ones. |
| `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Equivalence.lean:110,138,154` | Scheme category, `schemeEquivalence`, forward-functor comparison; finitely generated character groups, including torsion. |
| `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/EssentialImage.lean:64,77` | Group-like spanning is the coordinate-ring essential image. |
| `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/ClosedSubgroup.lean:56,67` | Surjective coordinate maps and Hopf-ideal quotients preserve that property. This is R07. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean:161,344` | Surjectivity requires coefficients **and antipode images**; the dual formulation uses V together with V*. Coefficients alone need not generate inverses. |
| `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:156` | `integralForm` is the restricted integral-valued bilinear form. |
| `TauCeti/LinearAlgebra/IntegralLattice/Rationalization.lean:91,118,187` | `rationalizationIsometry`, `ofIntegralForm`, `ofIntegralForm.carrierIsometry`; the construction uses a symmetric form on a finite free integral module. |
| `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:151,304,308,394` | Generator exponent sum 1; `permHom`, its generator transposition, and `pureSubgroup` as its kernel. No configuration-space comparison is inferred from these algebraic definitions. |
| `Mathlib/LinearAlgebra/FixedSubmodule.lean:31,42` | Fixed submodule means f(x)=x; `fixedSubmodule_eq_ker` identifies ker(f−id). |
| `Mathlib/Topology/Constructions.lean:742` | `continuous_quotient_mk'` gives continuity from the quotient topology, with no separation hypothesis. |

Ownership was searched by objects with `roadmaps grep`/`roadmaps show`, in main, indexed open heads and board-package READMEs. Full declaration namespaces in Suggested were also searched. No collision with a different roadmap's fully qualified Suggested names was identified. Same-folder revisions were not treated as new suppliers. The serious overlaps are R05–R07; the generic isometry subgroup in CoverLiftTargets is included in R04. The group-specific signed ADE extension, integral fixed-Lie comparison, Chevalley group realization and spectral quotient remain this roadmap's work, while combinatorial folding is distinguished from RootSystemsPartII's orbit-sum construction.

Resolved cross-roadmap contracts (paths are repository-relative; main means the supplied main checkout):

| Supplier | Text inspected and resolution |
|---|---|
| SchemeAndStackFoundations, main | `README.md:755–788` §0.7 dimension; :818–820 étale coordinates; :2071–2082 §1.1 descent; :2167–2177 §1.5 quotient sheaves; :2418–2515 §§1.13–1.15 actions/stabilizers/torsors; :3443–3454 §2.6 projective sections/coherent finiteness; :5625–5629 §4.12 Chow. No universal quotient representability is supplied. |
| ModularCurves, main | `README.md:386–425` §§0E–0F: effective affine descent and affine Weil restriction for finite locally free base maps and affine finitely presented source, including base change. |
| SmoothBundlesConnections, main | `README.md:221–251,315–344,421–493` B1.0/B1.1/B1.4: regular fibres, principal charts and homogeneous quotients. Its real smooth results do not by themselves assert holomorphicity; the latter comparison remains in the group-specific argument. |
| RootSystems, main | `RepresentationTheory/RootSystems/README.md:218–389` Layers 1–6: root combinatorics, Coxeter presentation, chambers and numbered classification; exception R03. |
| RootSystemsPartII, supplied open head | Scope and Layers 2–4: integral dominance and orbit-sum folding; no supplied Weyl/based automorphism factorization. Its root-row convention is distinguished from the H-row convention for the fixed Lie algebra below. |
| LieHighestWeight, main | `RepresentationTheory/LieHighestWeight/README.md:405–566,931–1196`: PBW/highest weights and Layer 7; :1158–1179 explicitly retains the Serre injectivity target and its characteristic-zero, Killing/simple hypotheses. The reductive group comparison must retain central directions. |
| IntegralLattices, main and pin | `README.md:833–838` agrees with the native integral-form/rationalization dictionary listed above. Used the explicit main checkout where the index returned a shorter snapshot. |
| InductionRestriction, main | `RepresentationTheory/InductionRestriction/README.md:346–382`: finite-group fixed-coset count identity and `Gassmann.almostConjugate_iff_permutation_equiv`. The latter is a roadmap target, not a missing pinned theorem. |
| GroebnerGeometry, main | `README.md:394–425`, G5: first-column flag minors, polynomial straightening and invariant algebra. Scheme/section comparisons remain consumers. |
| ReflectionInvariantTheory, main | `README.md:40–105`: finite reflection invariants, including fixed central degree-one directions and crystallographic dictionary. |
| AlgebraicVectorBundles, main | `README.md:215–267`: sheaf tensor/dual interfaces. The concurrently cited projective H⁰ input comes from SchemeAndStackFoundations §2.6, not an invented theorem here. |
| LieGroups, main | `RepresentationTheory/LieGroups/README.md:275–298,407–446`, Layers 2,7,8: finite-dimensional closed subgroups, complexification and flag cells. |
| DGFloer, main | `README.md:494–521`: based fibration boundary and low-degree exactness with actual fibre/component conditions. “Layer1.2” resolves to item 2 of Layer 1. |
| AlgebraicTopology, main | `README.md:289–324`, Stage 1: based van Kampen/presentation consequences. |
| IntegralHeckeAndGaloisDeterminants; ComplexComparisonPartII, indexed open heads | Their §0.7 and C−1.1 contracts were read directly; see R05 and R06. Both precede ReductiveGroups. |

The resolver's 21 leads are not 21 findings: the acceptance names resolve in Suggested; the Gassmann name resolves in its supplier as above. Downstream mentions such as CFSGStatement, SchubertGeometry and ReductiveGroupsPartII are not read as upward supplier edges. No premise here may be silently taken from their later applications.

### Headline inventory and adversarial calculations

The README's endpoints are the native-model comparisons; rational cohomology/induction; orbit local closedness, reduced models, strict boundary dimension and closed orbits; Jordan/torus/unipotent/Levi structure; characteristic-zero linear reductivity; homogeneous quotient affineness; Borel conjugacy and Bruhat structure; Lang–Steinberg and Harish–Chandra comparisons; split pinned classification; integral Chevalley–Demazure/PBW, signed ADE/folding and special isogenies; distributions/Frobenius contraction; rational highest weights and Steinberg modules; plane braids, finite Weyl arrangements and regular-semisimple spectral monodromy.

Suggested states ten acceptance theorems: the five orbit results, characteristic-zero reductivity implication, Borel conjugacy, the SL coordinate presentation, plane-braid equivalence and permutation nonsplitting. Its docstring names the missing group/root, rational-module, quotient-comparison, integral/folded and spectral carriers for the other endpoints. The generic cohomology and topology endpoints must be supplied as in R05–R06. The SL and plane-configuration statements use real native carriers and definitions, not free predicates. The eight companion catalogues cannot be counted as additional valid acceptance coverage.

The 167 rows below record actual values, including negative controls. A successful instance is not a proof of a universal theorem. “Retain” means no defect was exposed by that calculation, not that the future proof has been supplied. R04 applies throughout companion constructions: their intended mathematics was read, but an admitted data operation has no value to evaluate until constructed.

| Statement | Instances tried | Values on the two sides / positive and negative controls | Result | Change |
|---|---|---|---|---|
| 0 convolution on additive points | 𝔾_a, a=2,b=3 | Δ(t) evaluates to 2+3=5; pointwise product would be 6 | Distinguishes convolution | Retain |
| 0 convolution on multiplicative points | 𝔾_m/ℚ, a=2,b=3 | Product evaluates to 6; counit 1; antipode at 2 is 1/2 | Group laws agree | Retain |
| 0 noncommutative points | Upper/lower GL₂ transvections | AB=[[2,1],[1,1]], BA=[[1,1],[1,2]] | Points are not GroupLike | Retain |
| 0 affine dictionary | 𝔾_a and elliptic curve | Γ(𝔾_a)=k[t], Spec Γ=𝔾_a; Γ(E)=k, Spec Γ(E)=point≠E | Affineness is necessary | Retain |
| 0 universes/base change | 𝔾_a over ℤ→𝔽₂; zero test algebra | t-point 3 maps to 1; at zero algebra exactly one algebra map and one group element | Native functor law, including zero algebra | Retain |
| 1 rational representation/coaction | Weight-one 𝔾_m line | ρ(1)=1⊗t; evaluation at 2 acts by 2; trivial coaction would act by 1 | Object determined | Retain |
| 1 finite subcomodule/coefficients | Regular k[t,t⁻¹], element t²+t⁻¹ | Span{t²,t⁻¹} has dimension 2 and contains the element; both weights stable | Locally finite, not globally finite-dimensional | Retain |
| 1 faithful matrix coefficients | Standard 𝔾_m line | Coefficient algebra k[t]≠k[t,t⁻¹]; adding antipode t⁻¹ gives all O(G) | Native criterion needs antipode/dual | Retain supplier |
| 1 tensor/dual/Tannakian transport | Weights 2 and −3 | Tensor weight −1; dual of weight 2 has weight −2; evaluation has weight 0 | Signs and group law agree | Retain |
| 1 semisimple S₃ Check | ℂ regular representation | 1²+1²+2²=6=dim ℂ[S₃]; in char 2 or 3, 6=0 so Maschke division fails | Repaired characteristic | Retain |
| 1.1 enough injectives | Trivial group, ℤ/2 | Underlying module embeds into ℚ/ℤ; cofree for trivial group leaves that module unchanged | No coefficient-flatness hypothesis needed | Import R05 |
| 1.1 derived invariants | Trivial group, M=ℤ/2 | d⁰=0,d¹=id,d²=0; H⁰=ℤ/2, H¹=H²=0 | Cohomology convention correct | Import R05 |
| 1.1 cofree acyclicity vs injectivity | Trivial group, N=ℤ | H⁰=ℤ, Hⁿ=0 for n>0; extension of 2↦1 would require 2f(1)=1 | Acyclic≠injective | Import R05 |
| 1.1 coface signs/d² | Weight-one 𝔾_m line | d⁰(1)=t−1; t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1=0 | d¹d⁰=0 | Import R05 |
| 1.1 tensor-order comparison | Same weight line | (1⊗(t−1)) maps to (t−1)⊗1, sign +1 | No extra sign | Import R05 |
| 1.1 zero/regular coefficients | M=0 and M=H | Zero complex gives 0 in every degree; regular cofree gives H⁰=R,H¹=0 | Nonflat/zero boundary handled | Import R05 |
| 1.1 coefficient functoriality | ℤ→ℤ/2, trivial group | 3↦1 in H⁰; degree-one differential sends 3↦3 then 1, or 3↦1 then 1 | Square commutes | Import R05 |
| 1.1 induction/reciprocity | 1⊂C₂, trivial ℤ | Induction rank 2; generator swaps δ₁,δ_s; counit of constant 1 is 1 | Right adjoint maps agree | Import R05 |
| 1.1 antipode/coset convention | C₂⊂S₃ | Rank 3; inverse sends C₂(123) to (132)C₂ | Both side and inverse needed | Import R05 |
| 1.1 identity/transitivity | Identity map, integral sign line | Rank 1, nonidentity acts −1; evaluating and recoacting returns the same signed vector | Identity comparison correct | Import R05 |
| 1.1 nonsurjective Hopf map | ℤ→ℤ[t,t⁻¹] | Induction of weight one is 0; of trivial line is ℤ | Surjectivity is unnecessary | Import R05 |
| 2 tangent/cotangent | α_p and 𝔾_m | α_p has tangent dimension 1 but scheme dimension 0; 𝔾_m has both dimensions 1 | Smoothness cannot be inferred from tangent size alone | Retain |
| 2 bracket | E₁₂,E₂₁ in gl₂ | EF−FE=diag(1,−1); reverse bracket is its negative | Lie sign fixed | Retain |
| 2 differential | Frob on 𝔾_a in char p | d(t↦t^p)=0; Lie ker(Frob)=Lie α_p=k=ker dF | Scheme kernel needed | Retain |
| 2 adjoint action | diag(t,1), E₁₂ | gE₁₂g⁻¹=tE₁₂; opposite root has t⁻¹ | Root weight direction fixed | Retain |
| 3 Hopf ideals | (tⁿ−1), versus (t−2) over ℚ | ε(tⁿ−1)=0; ε(t−2)=−1 | Subgroup/non-subgroup separated | Retain |
| 3 normality | SL₂ and upper Borel in GL₂ | det(wgw⁻¹)=det(g); wB⁺w⁻¹=B⁻≠B⁺ | Adjoint invariance has content | Retain |
| 3 fppf quotient | 𝔾_m/μ₂ over ℚ | Quotient point 2 has no ℚ-lift; √2 lifts after extension and squares to 2 | Sheaf, not pointwise surjectivity | Retain |
| 3 monomorphism/closed immersion | μ_p→𝔾_m and Frob 𝔾_a→𝔾_a | First has kernel 1; second has scheme kernel α_p of length p despite one geometric kernel point | Geometric injectivity insufficient | Retain |
| 3 components | μ₃/ℚ | Coordinate ring ℚ×ℚ(ζ₃): 2 rational connected pieces, 3 geometric points; identity component one point | π₀ retained as finite étale scheme | Retain |
| 3 connected/geometrically connected | SO₂/ℝ and Spec ℂ/ℝ | SO₂ base changes to connected 𝔾_m; Spec ℂ splits into 2 geometric points and has 0 real points | Rational identity matters | Retain |
| 3A action/orbit maps | G acts on itself; trivial group on point | Orbit map at e is id_G; trivial orbit is singleton | Domain/basepoint fixed | Retain |
| 3A orbit locally closed | 𝔾_m on ℙ¹, point 1 | Orbit ℙ¹∖{0,∞}, open; closure ℙ¹ | Actual nonclosed orbit | Retain |
| 3A reduced orbit model | Trivial group on Spec k[ε]/ε² | Image singleton; reduced model Spec k, immersion has that image; local ring dimension drops 2→1 as k-vector spaces | Reduced image, not arbitrary thickening | Retain |
| 3A boundary_dimension_lt | Same ℙ¹ orbit | dim boundary{0,∞}=0<1=dim orbit | Strict inequality | Retain |
| 3A empty boundary dimension | Trivial point orbit | dim empty=⊥<0=dim point; replacing ⊥ with 0 gives false 0<0 | Native WithBot convention necessary | Retain |
| 3A exists_closed_orbit_in_closure | 𝔾_m on ℙ¹ | Either {0} or {∞} is closed and contained in orbit closure ℙ¹ | Nonempty witness | Retain |
| 3A exists_closed_orbit | Empty X versus a point | Empty X has 0 points/orbits; point X has 1 closed orbit | Explicit Nonempty hypothesis retained | Retain |
| 3A disconnected group | Constant S₃ acting regularly | Orbit has 6 reduced points, dimension 0, empty boundary | Connectedness not accidentally assumed | Retain |
| 3A orbit dimensions need not be minimal globally | 𝔾_a action t·(x,y)=(x,y+tx) | x≠0 fibres are closed 1-dimensional orbits; x=0 gives closed 0-dimensional points | “Closed”≠globally minimum dimension | Retain |
| 3A GL₂ vector/projective orbit | GL₂ on 𝔸² and ℙ¹ | Nonzero vector orbit dim2, boundary dim0; ℙ¹ one closed orbit; H⁰(O(1)) dim2 | Projective restriction is nonzero | Retain |
| 3A classical topology | 𝔸¹, D(t), dual numbers | ℂ, ℂ*, singleton; dual-number analytic ring length2 versus reduction length1 | Same carrier as C−1.1 | Import R06 |
| 3A Hausdorff/proper hypotheses | Doubled line, ℙ¹, 𝔸¹ | Two origins have no disjoint neighbourhoods; ℙ¹ compact; sequence n in ℂ unbounded | Required separation/properness | Import R06 |
| 3A smooth charts/étale inverse | z↦z² | d at1=2 invertible; d at0=0; point⊔line has dimensions0,1 | Fixed dimension is extra data | Import carrier R06 |
| 3A orbit/stabilizer comparison | GL₂ on ℙ¹ | dim_C GL₂=4, stabilizer B dim3, orbit dim1=4−3 | Group-specific comparison remains | Retain |
| 4 Jordan factorization | [[2,1],[0,2]]/ℚ | (2I)[[1,1/2],[0,1]] equals original in either order | Multiplicative Jordan parts | Retain |
| 4 perfect-field boundary | Same matrix/F₂; [[0,1],[a,0]]/F₂(a) | First det0, not invertible; second semisimple part √a I not over k | Repaired Check and perfectness | Retain |
| 4 diagonalizable classification | M=0,ℤ,ℤ/p | D(M)=1,𝔾_m,μ_p; last coordinate length p, one geometric point | Torsion retained | Native supplier |
| 4 closed-subgroup stability | μ_p⊂𝔾_m | Group-like monomials span k[t]/(t^p−1), dimension p | Already proved at pin | R07 |
| 4 exact character sequence | Multiplication n>0 on ℤ | Cokernel ℤ/n; dual kernel μ_n; t↦tⁿ | Contravariant direction correct | Retain additional comparison |
| 4 torus pairing | χ=t³, λ=t⁻² | χ∘λ=t⁻⁶; pairing −6=3·(−2) | Sign/integrality | Retain |
| 4 nonsplit torus | Norm-one torus/ℝ | Character rank1; conjugation −1 versus +1 for split 𝔾_m | Rank alone does not imply split | Retain |
| 5 unipotence | 𝔾_a,α_p,μ_p,SL₂ | α_p tangent1 and unipotent; μ_p has weight-one comodule with invariants0; SL₂ has no characters but standard invariants0 | Geometric point test/characters insufficient | Retain |
| 5 Lie–Kolchin | Standard upper-triangular group | Fixed flag 0⊂ke₁⊂k²; lower transvection sends e₁ outside ke₁ | Connected solvable hypothesis has content | Retain |
| 5 unipotent radical | B⊂SL₂ and SL₂ | R_u(B)=U dimension1; R_u(SL₂)=1 dimension0 | General structure comparison | Retain |
| 5P exponential/log | N=E₁₂, and N=E₁₂+E₂₃ | exp first=I+N; second=I+N+(1/2)E₁₃; log reverses | Characteristic0 denominators necessary | Retain |
| 6 reductive radical | SL_p in char p | Centre μ_p length p; reduced neutral centre 1; radical1 | Old counterexample repaired | Retain |
| 6 reductive vs linearly reductive | 𝔾_m,μ_p,char0 SL₂ | Torus weights split; μ_p graded and linearly reductive but nonsmooth; char0 SL₂ modules semisimple | No false equivalence without smoothness/char0 | Retain |
| 6 characteristic-zero implication | Trivial group, 𝔾_m, SL₂/ℂ | Invariant complements dimensions respectively full, weight-zero summand, irreducible block decomposition | Native predicates align | Retain headline |
| 6 positive-characteristic control | SL₂/F₂ on Sym² | Stable span{x²,y²} dim2 inside dim3 module, no reductive⇒complete-reducibility assertion | CharZero matters | Retain |
| 6A Levi semidirect product | 𝔾_a⋊𝔾_m, weight1 | (1,2)(3,4)=(7,8); the direct-product formula would give (4,8) | Action/convention discriminated | Retain |
| 6A cocycles/sections | b(g)=g−1 | b(gh)=gh−1=(g−1)+g(h−1); db=0 | Cocycle sign | Retain |
| 6A Levi conjugacy/nonuniqueness | Direct product 𝔾_a×𝔾_m | Central U fixes every Levi under conjugacy, so conjugators not unique | Conjugacy does not imply unique conjugator | Retain |
| 6B affine reductive quotient | GL₂/O₂, g=[[1,1],[0,1]], h=diag(1,−1) | ggᵀ=(gh)(gh)ᵀ=[[2,1],[1,1]]; gᵀg offdiag1, (gh)ᵀ(gh) offdiag−1 | Right-coset map repaired | Retain |
| 6B nonreductive subgroup control | SL₂/U | Quotient 𝔸²∖{0}; global functions k[a,c], Spec includes extra origin | Affineness needs reductive H | Retain |
| 7 Borel conjugacy | B⁺,B⁻⊂SL₂, torus/trivial group | wB⁺w⁻¹=B⁻; torus and trivial group have B=G | Headline has correct direction | Retain |
| 7 root datum/isogeny | SL₂ versus PGL₂ | SL₂ root=2ω, coroot primitive; PGL₂ root primitive, coroot=2y; both pairing2 | Dynkin diagram alone insufficient | Retain |
| 7 parabolics/Levi | SL₂ B and G | B=T⋉U, dimensions1+1=2; G/G quotient point | Boundary subsets included | Retain |
| 7 Bruhat partition | SL₂/𝔽₂ | G has6 points; B-cell2 and BwB-cell4, sum6 | Disjoint finite check | Retain |
| 7C ordered root coordinates | A₂ x₁₂(a)x₂₃(b) | Product has (1,3) entry ab; reversing order gives 0 there | Ordered factors matter | Retain |
| 7C rank-one open-cell relation | x₊(1)x₋(1)/ℚ | Matrix[[2,1],[1,1]], diagonal parameter2; inverse parameter1/2 | Denominator requires big-cell open | Retain with open condition |
| 7C contraction-cover step | Connected nonempty cover of simply connected point | Total fibre one point, map1→1; empty total space would be0→1 | Chosen e₀ excludes empty cover | Retain mathematical route |
| 7a Lang surjectivity | 𝔾_a/F₂, θ²+θ+1=0 | F(θ)−θ=1; on constant C₂, F(g)=g and Lang=1 only | Connectedness essential | Retain |
| 7a finite fixed points | SL₂/F₂ | Fixed group order6; B order2, flags3 | q must be a prime power, not1 | Retain |
| 7a fixed-coset lifting | 𝔾_m/μ₂, quotient2/ℚ analogy | Point lifts only after √2 extension; connected finite-field Lang hypothesis removes its obstruction in stated case | No universal rational lift | Retain |
| 7b intersections | Opposite Borels of SL₂ | B⁺∩B⁻=T dim1; U⁺∩U⁻=1 dim0 | Reductive versus unipotent parts separated | Retain |
| 7c averaging/idempotents | U=C₂, Λ=ℤ[1/2] | e=(1+s)/2, e²=e; over F₂ denominator2 is not a unit | p invertibility needed | Retain |
| 7c biadjunction/dimension | SL₂(F₂), trivial T module | Induced dimension3; U-invariants dimension2 (two U-orbits on flags) | Not a spurious dimension1 assertion | Retain |
| 7d Mackey double cosets | S₃ with B=C₂ | Double coset sizes2 and4; total6; two Mackey terms | Includes nonabelian control | Retain |
| 7e intertwiner units | S₃, two reflection subgroups | On trivial block e_Ue_Ve_U eigenvalue1; on U-fixed standard line eigenvalue1/4 | Only powers of2 inverted here | Retain instance |
| 7e conjugation Check | GL₂(F₃), t=diag(2,1) | twU⁻ second column(2,0); wtU⁻ second column(1,0) | False as written | R01 |
| 7e common-Levi nonconjugate parabolics | GL₃(F₂) | Group168; each parabolic24; indices7=7; line and plane stabilizers not conjugate | Independence is stronger than conjugacy | Retain |
| 7f Gassmann fixed-coset identity | S₃, H=C₂, transposition s | Fixed cosets1, times order H2 gives2; centralizer2 times class∩H size1 also2 | Both counts agree | Retain supplier comparison |
| 7g power-Frobenius | τ²=Frob₂, σ=τ³ | σ²=Frob₂³=Frob₈ | Positive power condition checked | Reorder R02 |
| 7g graph twist | SL₃, σ=graph∘Frob_q | σ²=Frob_(q²); fixed unitary form | Distinct from split fixed group | Reorder R02 |
| 7g identity boundary | Positive-dimensional G; trivial G | First fixed set infinite; trivial fixed set one and id=Frob | Repaired exception | Retain |
| 8.1 split data | Torus rank0,1 | X=Y=0 or ℤ; Φ empty; dim0 or1 | Central directions retained | Source verified |
| 8.1 isogeny distinction | SL₂,PGL₂ | Root indices2 and1 in X; same A₁ matrix[2] | Full root datum needed | Source verified |
| 8.1 nonreduced base/fibre | SL₂/ℤ→F₂,ℤ/4 | Relative dimension3; F₂ centre μ₂ length2; Lie basis E,F,H persists | No smooth-centre/reduced-base restriction | Source verified |
| 8.1 empty base | Base ∅ | All group fibres absent; every root datum would have same empty family | Nonempty necessary for recovery | Source verified |
| 8.2 pinning | SL₂ parameters t and2t over ℚ | Tangents E₁₂ and2E₁₂; only first matches specified vector | Rescaling distinguished | Source verified |
| 8.2 nonreduced parameter | SL₂/ℤ/4 | x(t)=I+tE₁₂ has derivative E₁₂, a free generator | Base change preserves pinning | Source verified |
| 8.2 torus/empty simple set | 𝔾_m | Number of chosen root vectors0; no extra root data | Legitimate rank-zero semisimple part | Source verified |
| 8.2 disconnected base | SL₂ over k×k | Borel choices (+,−) versus constant (+,+) | First not a single constant positive system | Source verified |
| 9A ADE root shell | A₁,A₂,empty | Norm-two vectors counts2,6,0; root ranks1,2,0 | Finite shell includes boundaries | Retain |
| 9A sign cocycle | Ordered A₂ simple roots | ε(α₁,α₂)=1, ε(α₂,α₁)=−1; commutator−1 | Ordered sign convention | Locator R08 |
| 9A central extension/splitting | A₁ and A₂ | A₁ simple lifts commute; A₂ bond lifts have commutator τ≠1 | Splitting iff no bonds test | Retain target |
| 9A inverse versus negative section | A₂ a=α₁+α₂ | ε(a,−a)=−1; u_a u_−a=τ, not1 | Negative section is not inverse | Retain target |
| 9A root-line quotient | Two lifts e,τe | Relation [τe]=−[e]; quotient rank1, not rank2 or zero | Correct signed line | R04 data form |
| 9A signed bracket | A₂ composite roots | [E₁₃,−E₃₁]=−(E₁₁−E₃₃)=−H_(α₁+α₂) | Opposite-root sign agrees | Locator R08 |
| 9A integral Jacobi | a,−a,c with B(a,c)=1 or−1 | Cyclic terms (g,0,−g) or(0,−g,g), sums0 | No division by2 | Retain target |
| 9A full-Y central directions | Root-free rank1 | Lie carrier ℤH, all brackets0; coroot-only model would have rank0 | Full lattice necessary | Retain |
| 9A cover-lift kernel/faithfulness | A₁/A₂ overℤ andF₂ | Character-kernel orders2/4; sign−1 acts nontrivially overℤ, equals+1 overF₂ | No all-base faithfulness claim | Retain |
| 9A Weyl/based factorization | A₁ root reflection | g=−1, w=−1, based part1; w·1=g | Missing supplier, not false mathematics | R03 |
| 9A diagram covariance | D₄ triality | Forward outer indices1→3→4→1; inverse sends3→1 | Coroot contravariance handled | Retain |
| 9A signed-cycle fixed vectors | Negative one-cycle | Overℤ, −x=x gives x=0; overF₂ gives allF₂ | Ann(μ−1), not flat-base-only formula | Retain target |
| 9A component cycles | Three permuted A₁ components | Fixed vectors (x,x,x); rank3 fixed Lie algebra versus ambient rank9 | Return-map construction handles cycles | Retain |
| 9A A₃ folding | Outer orbit then middle | H-row Cartan [[2,−2],[−1,2]]; projected-root-row Cartan is its transpose | Transpose is explicit; orbit-sum and projected roots differ | Retain |
| 9A even-A folding | A₄ outer orbit then adjacent inner | H-row Cartan [[2,−1],[−2,2]]; projected-root-row Cartan is its transpose | Not the orthogonal-orbit formula | Retain |
| 9A triality folding | D₄ outer orbit then centre | H-row Cartan [[2,−3],[−1,2]]; root-row transpose; fixed algebra dimension14 | Correct G₂ direction | Retain |
| 9A exceptional folding | E₆ involution | Fixed dimension52 versus original78; rank4 versus6 | F₄ target distinguished | Retain |
| 9A integral even-A saturation | A₂ reversal | In fixed basis e,f,h, normalized generators e,2f,2h span index4 | Rational isomorphism≠integral equality | Retain |
| 9A general toral action/Smith kernel | γ=[[0,−1],[1,−1]] | det(γ−I)=3; fixed rank0 overℚ, fixed line overF₃ generated(1,−1) | Bad-prime kernel retained | Retain |
| 9A divided powers | SL₂ E^(1) squared | E^(1)E^(1)=2E^(2); E²/2 overℚ is E^(2) | Integral basis not ordinary powers | Retain |
| 9A opposite-root PBW | SL₂ a=b=1 | EF−FE=H | Toral correction present | Retain |
| 9A full toral binomials | 𝔾_m weight3 | binom(H,2) acts by3; root-free form still infinite rank | Not merely ℤ | Retain |
| 9B integral open cells | SL₂(ℤ/4), exhaustive 4⁴ tuples | 48 determinant-one matrices; a-unit cell32,c-unit cell32, union48 | Nonreduced base check | Retain |
| 9B pointwise versus sheaf open cover | [[2,1],[3,2]]/ℤ | det1; neither a=2 nor c=3 unit, but (2,3)=ℤ | Cover need not contain each R-point in one chart | Retain |
| 9B central quotient | SL₂→PGL₂/ℚ | diag(2,1) projective class has determinant squareclass2; no SL₂ lift overℚ | fppf surjectivity, not pointwise | Retain |
| 9B characteristic-two kernel | SL₂→PGL₂/F₂ | μ₂ has length2 and tangent dim1, but one geometric point | Scheme kernel retained | Retain |
| 9B elementary subgroup boundary | SL₂/ℤ chart matrix above | a and c nonunits but determinant1 | No global elementary factorization inferred merely from chart cover | Retain |
| 9B special isogeny | B₂ at p=2 | τ*:α↦β,β↦2α; square sends each root to2 times itself | Square is Frobenius action | Retain |
| 9B short-root ideals | G₂,p=3; F₄,p=2 | Relevant structure constants3 and2 become0; outside those characteristics nonzero | Bad primes are included, not discarded | Retain |
| 9B exceptional carriers | G₂,F₄,D₄ | Carrier dimensions7,26,24=8+8+8; triality cycles three D₄ summands | Single spin summand cannot carry triality | Retain |
| 9C distributions/jets | 𝔾_a overℤ | O/I^(n+1)=ℤ[t]/t^(n+1), rank n+1; order1 convolution squared gives2 times order2 | Integral jet/PBW normalization | Retain |
| 9C Frobenius | Root distributions in char p | Dist(F)(E^(1))=0, Dist(F)(E^(p))=E^(1) | Not ordinary derivative alone | Retain |
| 9C Frobenius kernel | SL₂, p=2 | Exponents a,b,c<2 give8=2³ basis elements | Restricted algebra finite, full Dist infinite | Retain |
| 9C μ₀ projector | Torus, integer weights0,1,p | binom(−1,p−1)=1 modp; binom(0,p−1)=0; weightp gives1 | Selects pX | Retain |
| 9C section into corner | Torus p=2 | φ(1)=μ₀≠1 on weight1; Dist(F)(μ₀)=1 | Corner unit differs from ambient unit | Retain |
| 9C contraction/Frobenius pullback | Weightλ=1 torus module | Pullback weightp; contraction relabels p→1, dimension1 | Right inverse on rational modules | Reorder R02 |
| 9C nonmonoidality | Weights1,p−1 | Individual contractions0,0; tensor weightp contracts to dimension1 | No tensor-functor overclaim | Retain |
| 9D classification | SL₂,PGL₂,𝔾_m | Distinct full lattices despite A₁ diagram; torus has no roots but rank1 | Data before construction before classification | Retain repaired order |
| 9D relative reductivity | SL₂/ℤ→ℤ[ε]/ε² | All geometric fibres reductive of dimension3; base itself nonreduced | Native predicate applies | Native supplier |
| 9D forms/Galois descent | Split and norm-one rank-one tori | Galois characters +1 and−1; both become𝔾_m overℂ | Descent data distinguish forms | Retain |
| 9D pseudo-reductive boundary | Weil restriction along purely inseparable degree p | Geometric dimensionp, geometric unipotent radical dimension p−1; k-unipotent radical0 | Pseudo-reductive≠geometrically reductive | Retain |
| 10A rational weights versus Lie weights | 𝔾_m in char p | Integer weights0 andp both have differential0; characters1 andt^p differ | Dist/T interface retains X | Reorder R02 |
| 10A tensor/dual characters | Weights2,3 | Tensor character e⁵; dual of e² is e⁻² | Integral character labels | Retain |
| 10B induced/Weyl convention | SL₂ weight1 | ∇(1) has highest line ky, torus weight+1; dual generating functional δ_x also weight+1 | Opposite Borel and dual consistent | Retain |
| 10B highest-weight classification | SL₂ weight0 | Δ(0)=∇(0)=L(0)=k, dimension1 | Includes zero weight | Retain |
| 10B Steinberg | SL₂,p=2 or3 | Weight p−1=1 or2; dimension p=2 or3 | All-prime test | Locator R08 |
| 10B central descent restriction | PGL₂,p=2 | ρ=ω not in X=2ℤω; (p−1)ρ still absent | Simply connected cover condition matters | Retain |
| 10C binary rational action | g=diag(t,t⁻¹) | x↦t⁻¹x, y↦ty; yⁿ has weight n | Formula matches B⁺ convention | Retain |
| 10C positive-characteristic simple socle | n=4,p=3 | Base-p digits(1,1); dim L(4)=2·2=4 versus dim R₄=5 | Not falsely simple | Retain |
| 10C Frobenius submodule | n=2,p=2 | span{x²,y²} dim2 inside R₂ dim3; xy outside | Nonsemisimple control | Retain |
| 10D algebraic Peter–Weyl | 𝔾_m/char0 | O(G)=⊕_(n∈ℤ)ktⁿ; product t²t⁻³=t⁻¹ | Direct sum, not completed product | Retain |
| 10D polynomial monoid extension | GL₂ determinant characters | det extends polynomially; det⁻¹ undefined at zero matrix | Polynomial condition has content | Retain |
| 10D right-U invariants | SL₂, right upper U | First column(a,c) fixed; O(SL₂)^U=k[a,c]; quotient misses origin | Right versus left fixed | Retain |
| 10D torsor charts | a=c=1 | s_a=[[1,0],[1,1]], s_c=[[1,−1],[1,0]]=s_a n(−1) | Transition sign−1 | Retain |
| 10D Cartan/flag-minor multiplication | SL₂ degrees1+1 | Products a²,ac,c² span degree2 dimension3; a·c=c·a | Matches first-column supplier | Retain |
| 11A ordered configuration/action | n=3, cycle(012), z=(0,1,2) | σ·z=z∘σ⁻¹=(2,0,1); using σ gives(1,2,0) | Left action convention fixed | Retain |
| 11A plane-braid equivalence | n=0,1,2 | Configuration quotients point,ℂ,ℂ×ℂ*; π₁=1,1,ℤ; B₀=B₁=1,B₂=ℤ | Headline boundary cases agree | Retain |
| 11A permutation nonsplitting | n=2 | B₂=ℤ→C₂ is parity; order-two lift must satisfy2m=0, hence m=0, parity0≠1 | Concrete obstruction | Retain |
| 11A centering | n=2,z=(0,2); n=0 | Centroid1, centred(−1,1); for n=0 centroid totalizes to0 but point≄ℂ×point | Positive n needed for homeomorphism | R04 data form |
| 11A covering/permutation normalization | Two strands exchanging once | Generator exponent1, permutation(01); full pure turn exponent2, permutation1 | Square/pure normalization | Retain |
| 11B finite Weyl arrangement | A₁ | V_reg=ℂ*, quotient by ±1 is square map; π₁ bothℤ, inclusion multiplier2 | Artin generator and monodromy agree | Locator R08 |
| 11B rank zero/central direction | Φ empty, V=ℂʳ | Complement V, quotient V; π₁=1, Artin group1 | Central directions contractible | Retain |
| 11B non-simply-laced relations | B₂,G₂ | Alternating braid lengths4 and6, versus A₂ length3 | No simply-laced shortcut | Retain |
| 11C adjoint invariant quotient | sl₂ diag(t,−t) | Characteristic polynomial X²−t², discriminant4t²; at t=1 gives4 | Base complement excludes0 | Retain |
| 11C regular versus regular semisimple | GL₂ Jordan nilpotent | Centralizer matrices[[a,b],[0,a]], a≠0: ℂ*×ℂ, dimension2, not torus | Regular alone insufficient | Retain |
| 11C reductive centre | gl₂=ℂI⊕sl₂ | Dimensions1+3=4; Killing form vanishes on centre, trace gives degree-one invariant | Semisimple supplier not applied to whole gl₂ | Retain |
| 11D spectral fibration | SL₂ | Fibre G/T retracts to S², π₁=0; base ℂ*, total π₁=ℤ | Simply-connected fibre comparison | Retain target |
| 11D Weyl lift versus Weyl group | SL₂ w=[[0,−1],[1,0]] | w²=−I, but image in W has square1 | No false normalizer splitting | Retain |
| 11 spectral monodromy | sl₂ loop in discriminant base | Lift t along square root ends at−t; permutation is nontrivial C₂ element | Geometric normalization | Retain |
| Worked SL coordinate presentation | n=0,1,2 | Relations0,x−1,ad−bc−1; ringsℤ,ℤ,ℤ[a,b,c,d]/(ad−bc−1) | Headline includes n=0 correctly | Retain |
| Companion quotient continuity | n=2 configurations | (0,1),(1,0) have equal unordered image; quotient topology makes map continuous | One native lemma | R09 |
| Companion fixedCartan identity | γ=−1 onℤ, γ=id | Fixed/ker(γ−1) both0, respectively bothℤ | One native lemma | R09 |
| Companion covering evaluation | Identity covering ℝ→ℝ, e₀=0 | Constructed map at2=2=original p(2) | Definitional equality | R09 |

### Shape and limits of the clean checks

The sampled §§1.1,8.1,8.2 have explicit APIs and at least three discriminating Checks. The general structure keeps nonsmooth μ_p/α_p, imperfect fields, bad primes, root-free centres, full character/cocharacter lattices and nonreduced base rings. No good-prime restriction was used to excuse those cases. The repaired radical and right-coset statements survive their original counterexamples. The main Suggested file has one Mathlib import, individual Tau Ceti imports, no `set_option`, no admitted data and no admitted examples.

No computational program or large computation is needed for the mathematical targets reviewed here; the small finite enumerations above are review witnesses. The principal shape defects are the companion catalogues, missing exact locators, duplicated ownership and internal ordering, rather than a need to shrink the general theory.

## Not verifiable

- The seeded source sample is fully readable; no missing-source request is needed for it. Source checking outside that sample is not a certification of every theorem in the bibliography. In particular the unlocated signed ADE, Steinberg-module and Salvetti proof passages in R08 cannot be matched to an exact passage until locators are supplied.
- The eight companion files were read, but they are not certified by the successful Suggested build or by the 23-signature probe. Their admitted data do not denote constructed mathematical maps, so their intended value equations cannot serve as independent computed evidence. R04 records this blocking form defect; the report does not claim they elaborate merely because the gate passed.
- The supplied/indexed open-head ownership corpus and board packages were searched. This is not a claim about unlisted private work, unavailable pull-request files or subsequent heads.

## Source issues

- **Error** in conrad at Exercise 4.4.5(ii), printed p. 134 (`conrad line 5592`–5594): the source says the nonsplit unitary group's centre is the split multiplicative group; it should be the norm-one torus of the quadratic extension for positive rank; affects nothing.
