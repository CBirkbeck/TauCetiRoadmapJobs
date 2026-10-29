# Port report: GaloisSectionsPadicPeriodMaps

Branch: `roadmap/galois-sections-padic-period-maps`.

Head commit: 0d951ae9aa3ee64eb72e2f6adb156b3a08045836.

The clean starting checkout was `c994070`. The commit adds only `TauCetiRoadmap/GaloisSectionsPadicPeriodMaps/README.md`, `TauCetiRoadmap/GaloisSectionsPadicPeriodMaps/Suggested.lean` and `TauCetiRoadmap/GaloisSectionsPadicPeriodMaps/metadata.toml`. The top-level roadmap list, pins, tooling and merge order are unchanged. No push, pull request, issue or comment was made.

## Validation

Command: `lake build TauCetiRoadmap.GaloisSectionsPadicPeriodMaps.Suggested`.

Exact outcome lines:

```text
✔ [8954/8954] Built TauCetiRoadmap.GaloisSectionsPadicPeriodMaps.Suggested (1.6s)
Build completed successfully (8954 jobs).
```

Warning count: **0**, including **0** sorry warnings. The acceptance module has no named declarations, as the accepted package specifies. The build validates elaboration, not the mathematics of README targets.

```text
gate GaloisSectionsPadicPeriodMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate's initial runs before the commit reported only uncommitted target-folder files (`dirty=1` before staging and `dirty=3` after staging). Its content and dependency checks were already zero. The final clean-commit run is the result above.

Exact dependency-order output for the requested `--depcheck`, `--movable` invocation:

```text
depcheck: 194 roadmaps, 1219 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line for this roadmap. The invocation uses the supplied merge order and content checkout. The citation resolver checked main `c994070` and the index of 419 open roadmap heads dated 2026-10-29T03:24:56Z: no unresolved roadmap citations or Lean names. The final resolver was run with this worktree’s pinned package directory explicitly supplied and again reported no unresolved names. The library declarations were also independently read at the pins.

## Draft pull request body

Build the Galois-section obstruction from polarised abelian-by-finite families, as Part II of AnabelianGeometryAndNonabelianChabauty. The roadmap develops Selmer localisations, symplectic interpolation, filtered discrete period modules and the model-free period comparison, then combines the principal trichotomy with Kodaira–Parshin families to prove finiteness at every self-conjugate finite place. Over a number field with no CM subfield this gives finiteness of every finite-place Selmer-section image and finite-descent projection, including places above 2 and places of bad reduction.

AI assistance: Codex (GPT-6) performed the port, pinned-source and ownership searches, prose corrections, computed boundary checks and validation. The accepted package's mathematical scope and conditional supplier contracts are retained.

## Dependencies that are still pull requests

- AbelianSchemesAndArithmeticModuli
- AlgebraicModuliForArithmeticGeometry
- AnabelianGeometryAndNonabelianChabauty
- AnalyticNumberTheoryPartI
- ArithmeticGaloisDuality
- ArithmeticGaloisRepresentations
- CohomologyComparisons
- ComplexComparisonPartII
- EtaleDualityAndPerverseSheaves
- HeightsRationalPointsAndObstructions
- InverseGaloisAndArithmeticFundamentalGroups
- MordellLawrenceVenkatesh
- PadicHodgeTheory
- WeightsInEtaleCohomology

The other cited roadmap suppliers are on main, including Chebotarev and LocalGaloisGroups under `Completed/`. Their archived main files were compared with the tool's output and are identical. Revision/progress pull requests of existing roadmaps were not substituted for main versions.

## Port fidelity and upstream mathematics pass

All 59 numbered subsections, ten layers, ten Examples sections, ten Dependencies sections, definition APIs, discriminating Checks, proof routes, locators, conventions, exact supplier contracts and the opening Summary are preserved. `Suggested.lean` and `metadata.toml` are byte-identical to the accepted package. Metadata is `topic = "math.NT"`, matching the main-branch folders.

The accepted review has zero blocking findings and no new non-blocking repair requests. Its previous repairs are retained: nonempty ratio domains, equal positive fibres, richer definition APIs, local embedded-field counts, coefficient-factor root-degree bounds, the general section criterion and proper compactness.

The final README was reread as a specification, including its end hypotheses and the difference between local representations, filtered realisations and arbitrary period flags. The port makes these precise corrections:

1. In §0.2, replace the imprecise stix08 line 1068 locator by stix08 lines 1109–1122, including the proof on p. 23. The theorem and its local-field hypotheses are unchanged.
2. In the compactness supplier contract, §6.3 and Layer 6 Dependencies, point to HeightsRationalPointsAndObstructions §§2.3a and 2.11; §2.11a remains the local étale-chart input. The actual proper compact-product assertion is in §2.3a, while §2.4 states the restricted-product identification. The two-disc P¹ and unbounded A¹ examples continue to distinguish the claims.
3. In the Hermite contract, §7.2 and Layer 7 Dependencies, use ArithmeticGaloisDuality §R02.3.1 and its named bounded-degree/unramified-extension paragraph, rather than the larger §R02.3 range.
4. In the §1.7 negative control, restrict “de Rham with jumps 0,1” to places above p. The original wording applied de Rham language indiscriminately to adelic places. The global-interpolant quantifier is unchanged.
5. In §4.1, explicitly state that the sign local system of z²=t lacks a global horizontal basis on the polyannulus. Its fibre characters at 1 and 2 are different, so this is a test of the local-system/point-section dictionary, outside the transport theorem's hypotheses.
6. In Scope and ownership, distinguish ArithmeticGaloisDuality §R02.4.6's torus restricted product and real Tate norm quotients from the proper-scheme modified adelic carrier here. That object search found a neighbouring construction, not a second owner of this roadmap's carrier.

No theorem was weakened, no place was discarded and no source-supported generality was narrowed.

## Lean content and binder audit

Nothing moved from Lean to README during this port: the accepted file already contains only `import Mathlib`, its module docstring and the empty `TauCetiRoadmap.GaloisSectionsPadicPeriodMaps` namespace. It lists fourteen headline groups and identifies their missing carriers individually. The principal trichotomy, period comparison, Selmer localisation and finite-descent results all require substantial arithmetic/geometric constructions; none can be made statable by a few simple definitions at these pins. Abstract representations, isocrystals, Galois categories or a period-ring completion alone do not supply those constructions.

The mechanical declaration scan found **0** theorems, definitions, abbreviations, structures, classes, instances or opaque declarations. Therefore there are **0** elaborated declaration types to compare and no `#check @name` lines to generate; the requested binder audit is vacuous, with no disappearing hypothesis or changed signature. The targeted build elaborated the entire module. No Tau Ceti import is needed because no declaration is used in a Lean signature. No padding, API lemma, computed example, free predicate, sorry'd data or weakened stand-in was added.

## Supplier replacements and duplication removals

No additional declaration was deleted during the port. The accepted package already delegates the generic theory and has no duplicate named Lean declaration. The following ownership boundaries were verified by mathematical object, not merely by proposed declaration spelling; their deferrals and variant distinctions are recorded in Scope and ownership:

- AnabelianGeometryAndNonabelianChabauty §7.1 owns section classes, the point map, Kummer comparison and field-general injectivity. Only completion restriction and the p-adic consequence are built here.
- ArithmeticGaloisRepresentations §§1.3, 1.12 and 2.1 owns ordinary induction, Mackey and decomposition groups. The filtered discrete induction construction is new here.
- HeightsRationalPointsAndObstructions §§2.3–2.4, 2.11, 3.1–3.5 and 3.17d owns ordinary adeles, descent and its abelian-torsor application. ArithmeticGaloisDuality §R02.4.6 owns Tate-modified torus adelic groups. Neither constructs modified points of every proper finite-type scheme or the section equivalence of §§0.4–0.5.
- MordellLawrenceVenkatesh §§0.5, 0.18, 1.4–1.16, 2.1–2.4, 3.1–3.19 and LV.7–LV.11 owns its algebraic groups, good-model periods, family, Lagrangian geometry, friendly numerics, monodromy and Mordell proof. The variants here use self-conjugacy, arbitrary residue characteristic and model-free transport. No second Mordell declaration is introduced.
- PadicHodgeTheory supplies existing period functors, finite-level categories and de Rham pairs; CohomologyComparisons supplies the actual cup/trace/Chern comparison; AbelianSchemesAndArithmeticModuli supplies abelian cohomology, pairings and Weil restriction. The assembly and interpolating loci here are distinct.
- AdmissiblePairsAndPadicHodgeStructures concerns two period lattices and neutral Tannakian pairs; PadicHodgeRegulators concerns regulator maps and lattices; PeriodsAndSpecialValues concerns motivic period invariants; PadicExtensionFamilies concerns ramification polygons and field-extension families. None is a duplicate owner of filtered discrete symplectic pairs attached to curve sections.

The sweep used `roadmaps list`, repeated `roadmaps grep` searches across main and all indexed open heads, and searches through board packages. Terms included arithmetic fundamental groups, Galois/Selmer sections, modified adeles, filtered discrete modules, symplectic pairs, retwists, self-conjugate places, horizontal semistability, period-domain loci, four-Lagrangian conditions, small-orbit proportions and embedded quadratic/cubic fields. The supplied sibling-head inventory was included. Main versions, rather than revisions of existing roadmaps, were the cited suppliers. No later supplier was introduced, no ownership was moved upward, and no names collide because the Lean namespace contains no declarations.

## Resolved supplier contracts

Every roadmap citation was followed to main or to the available head of a new-roadmap pull request. This table records the mathematical range, including the distinctions that a name-only resolver does not check.

| Supplier | Verified section/target and consumed range |
| --- | --- |
| AnabelianGeometryAndNonabelianChabauty | §7.1 NC.6, the named section-class, point-map, Kummer and general-injectivity paragraphs; the section conjecture is a proposition only. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.0.3 integral compatible towers/isogeny category and pullback; IG.1.3 characteristic-zero geometric base extension. The comparison with all rational local systems on a normal Noetherian base is not used. |
| EtaleCohomologyFoundations | F.0.2 finite étale Galois category and finite-lisse monodromy on every connected nonempty scheme, without invertibility/local Noetherianity. This supplies levelwise monodromy in §1.3. |
| ArithmeticGaloisRepresentations | §§1.3, 1.12, 2.1, induction on a compact group, closed-subgroup Mackey and the closure embedding/decomposition map; geometric Frobenius is the inverse arithmetic convention. |
| HeightsRationalPointsAndObstructions | §§2.3–2.4, 2.3a, 2.11–2.11a, 3.1–3.5, 3.17d: model-independent adeles, proper compactness, local charts, torsor evaluation/twisting and finite descent. |
| PadicHodgeTheory | §§3.3–3.5, 5.1, 5.3, 7.2–7.3, 8.1–8.2: period functors, descent, algebraic-unramified pst, integral coefficients, actual de Rham pairs and comparison. The smooth pushforward input retains finite local constancy in the required degrees; abelian smooth proper base change supplies it. |
| CohomologyComparisons | §§6.4–6.7, actual natural/cup comparison, trace-normalised Tate line, duality and proper line-bundle Chern comparison. No equality with an independently chosen crystalline comparison or canonical Fontaine t is assumed. |
| MordellLawrenceVenkatesh | §§0.4–0.5, 0.9–0.12, 0.18; 1.2, 1.4–1.16; 2.1–2.4, 2.11; 3.1–3.19, 4.1–4.3; LV.7, LV.8, LV.10, LV.11. Existing periods keep their good-model/unramified range; the larger contracts are explicit below. |
| AbelianSchemesAndArithmeticModuli | A3.5, A3.7, A4.3–A4.4, A6.30–A6.31: polarised rational H¹, exterior products, Hodge sequence/connection and separable Weil restriction. Rational coefficients invert the nonzero polarisation degree. |
| AlgebraicModuliForArithmeticGeometry | §1.3 locally free quotient Grassmannians and partial flags, including the empty flag and arbitrary base change. |
| AdicEtaleGeometry | A1.1 strong sheafiness and A1.3 finite-etale-local-to-global (c), contravariant finite étale algebra/space equivalence. |
| AdicSpacesPartII | Layer R1 rigid analytification and pullback over complete nonarchimedean fields. |
| ComplexComparisonPartII | C5.2 Gauss–Manin/Betti transport; C6.0 finite CW type; C6.2 Riemann existence for finite-type schemes, including nonproper schemes. |
| EtaleDualityAndPerverseSheaves | §0.3 named smooth-curve Poincaré-duality paragraph and §0.5 cup–trace/equivariance; coefficient n invertible in the geometric field, with the dual roots-of-unity target. |
| ArithmeticGaloisDuality | R02.3.1, the named Hermite paragraph: embedded number-field extensions with fixed degree and ramification bounds. R02.4.6's torus modified adelic construction was inspected for ownership, not imported as the proper-scheme carrier. |
| WeightsInEtaleCohomology | R34.1–R34.2, geometric weights, abelian H¹ at good places, and the explicit distinction between algebraic-integral roots and rational/integer factor polynomials. |
| ClassFieldTheory | Layers 5, 7, 11: Kummer, arithmetic local reciprocity and global characters; the cyclotomic unit value is inverse norm. |
| GlobalNumberFields | Layers 2, 7, 8: finite ray class groups, congruence quotient and local-component norm formulas. Norm descent does not isolate factors by diagonal restriction. |
| LocalFieldsRamification | Layers 0–2 and 4: local extensions, the primary power-class and dyadic square-class statements, unramified extensions and tame Frobenius relation. |
| LocalGaloisGroups | Completed main, Layer 7: finite generation of the full group and rank [F:ℚₚ]+2. This is not the maximal pro-p rank statement. |
| ReductiveGroups | Main, Layers 0 and 3: affine group functors, closed groups, scalar subgroups and quotients. |
| Chebotarev | Completed main, Layers 10, 13–14: Dirichlet density, prime counting and natural density as separate statements. |
| AnalyticNumberTheoryPartI | §0.32 Siegel–Walfisz in its logarithmic-modulus range; it does not imply the polynomial least-prime contract. |

## Library pins and native declaration checks

The installed Git heads match `lake-manifest.json`: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The package's earlier review used different pins; this port reread the declarations at these pins.

| Native declaration | File and line at the pin; actual content/boundary |
| --- | --- |
| `Field.absoluteGaloisGroup` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`; algebraic-closure automorphisms, with Krull topology, no decomposition embedding. |
| `Field.absoluteGaloisGroup.map` | Same file line 87; continuous restriction after a chosen lift, no arithmetic geometric fundamental group. |
| `ContinuousMonoidHom` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57`; multiplicative homomorphism and continuous map bundled together. |
| `ConnectedComponents` | `Mathlib/Topology/Connected/Clopen.lean:510`; quotient by connected components, not a claim of finiteness. |
| `IsDedekindDomain.HeightOneSpectrum.adicCompletion` | `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:603`; wraps the valuation completion; arithmetic comparison is additional. |
| `LinearMap.IsAlt` | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286`; vanishing on the diagonal. |
| `LinearMap.Nondegenerate` | Same file line 595; left and right separation; rank-one target/perfectness are separate conditions. |
| `Matrix.symplecticGroup` | `Mathlib/LinearAlgebra/SymplecticGroup.lean:101`; exact matrix-form preservation. |
| `NumberField.IsCMField` | `Mathlib/NumberTheory/NumberField/CMField.lean:69`; totally complex and quadratic over maximal real subfield. |
| `NumberField.IsCMField.ringOfIntegersComplexConj` | Same file line 236; conjugation algebra equivalence on integers. |
| `IntermediateField` | `Mathlib/FieldTheory/IntermediateField/Basic.lean:52`; subalgebra with inverse closure. |
| `MulAction.orbit` | `Mathlib/GroupTheory/GroupAction/Defs.lean:49`; range of all translates; finiteness comes from the finite acted-on set. |
| `Nat.forall_exists_prime_gt_and_eq_mod` | `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442`; unit residue class and arbitrary lower bound. |
| `hasSum_zeta_four` | `Mathlib/NumberTheory/ZetaValues.lean:457`; real natural-indexed sum π⁴/90, with totalised n=0 term zero. |
| `TauCeti.Symplectic.groupScheme` | `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:122`; exact preservation of the standard alternating form, no independent similitude multiplier. |

Object searches included both pinned source trees, not just these declaration names. They found abstract Galois-category infrastructure and the Fontaine completion/isocrystal material, but not arithmetic curve section classes with localisation, de Rham representation/pair carriers, the algebraic-unramified filtered discrete category, or family cohomology/period domains sufficient for the headline statements. No assertion of an implemented headline is made.

## Source evidence

The four legal cached preprints corresponding to `packages/GaloisSectionsPadicPeriodMaps/sources.toml` were used. The version-specific arXiv landing pages for bs and hs were also opened to confirm identity/version. No fetched source text was executed. The substantive source checks included:

- bs line 36 and bs line 44, Selmer definition and Theorem A; bs line 66, Theorem B.
- hs line 391 and hs line 416, Theorem 2.1 and its trivial-U interpretation, all places and geometric-kernel conjugacy.
- stoll line 127, modified adeles; the definitions and descent comparisons cited in §0.4 remain the named source statements.
- stix08 line 1089, Kummer difference; stix08 line 1109 and stix08 line 1119, injectivity and its proof.
- bs line 404 and bs line 414, filtered discrete modules; bs line 464, full faithfulness; bs line 528 and bs line 576, automorphism/orbit/dimension discussion.
- bs line 632, self-conjugacy; bs line 647 and bs line 680, conjugate-place characters and consequences.
- bs line 1367 and bs line 1398, comparison compatibility; bs line 1471, horizontal transport, including the proof's residue-field descent; bs line 1666 and bs line 1882, symplectic family and retwists.
- bs line 2247, LV locus; bs line 2337 and bs line 2418, trichotomy and type loci; bs line 2451 and bs line 2553, type-(a)/(b) non-density and the common-subobject condition.
- bs line 2679, type-(c) exclusion; bs line 2694, equal-fibre map; bs line 2702, primitive tuple count; bs line 2719, dual cyclotomic pairing; bs line 2729, embedded extension counts; bs line 2739, final finiteness; bs line 2770, density comparison; bs line 2812 and bs line 2867, section interpolation.

The README uses original paraphrases and exact theorem/definition, version and page locators. Source claims taken inside proofs were checked in their stated setting; no equality with an unrelated comparison or rationality of a coefficient-field factor was inferred. No suspicious instruction requesting execution, credential use or an external write was encountered.

## Unresolved conditional supplier contracts

The accepted review explicitly conditions acceptance on seven contracts: `horizontal-pst-specialisation`, `model-free-polarised-fibres`, `model-free-period-maps`, `symplectic-faltings-finiteness`, `four-isotropic-lagrangians`, `kodaira-parshin-local-fibres` and `linnik-polynomial-least-prime`. Their precise domains and requirements remain in Exact supplier contracts. The inspected supplier sections do not provide these larger statements in full, so the port does not relabel them as completed supplier results.

The accepted README additionally contains `variable-rank-abelian-by-finite`. MordellLawrenceVenkatesh §§2.1 and 3.8 use constant rank; the locally constant-rank extension consumed here therefore remains a required contract too. It is retained exactly as in the accepted package, although it is not one of the seven slugs enumerated in `review.json`. This distinction is reported for the worker; no supplier file or review decision was changed.

There is no unresolved build, gate, dependency-direction, import, binder or declaration-collision issue. The mathematical supplier extensions above remain the accepted package's explicit conditions.

## Adversarial mathematics pass

These are computations made for this port, not an inference of truth from the Lean build. Each row identifies a statement or an individual part of its API. Identity and empty cases test functorial statements; nonexamples test the defining hypotheses. The source statements, proof inputs and supplier boundaries were read separately. The constructions remain targets, rather than claims that these examples prove them. Characteristic-zero local fields exclude equal-characteristic and inseparable countermodels in the Hodge layers. No generic algebra is silently assumed reduced or split. Finite sets used as denominators are nonempty. The rank-zero and square-zero tests below deliberately remain outside those denominator domains.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: cohomological Tate sign | Unit plus ℚₚ(−1), p=2,3 | Jumps 0,1; sum 1, average 1/2; geometric eigenvalues 1,q have weights 0,2 | Direct sum is not pure of weight 1 | None |
| Conventions: monodromy orientation | φ(e)=e, φ(f)=pf, N(f)=e | Nφ(f)=pe=pφN(f); opposite orientation compares e and p²e | Correct at 2 and 3 | None |
| Conventions: inverse transport | T=[[1,0],[1,1]], initial line e₁ | T⁻¹e₁=e₁−e₂ gives (1:−1); Te₁ gives (1:1) | Distinct even over ℚ₂ | None |
| Conventions: reciprocity | F=ℚ₃, unit 4 | χ_cyc(Art(4))=1/4; inverse character value 4 | Arithmetic convention retained | None |
| Conventions: induction is lax | Subgroup indices 1,2,3 | dim Ind 1=1,2,3; tensor squares 1,4,9 versus induced tensor 1,2,3 | Strong monoidality fails at 2,3 | None |
| Conventions: algebraic unramified constants | Unit object over unramified quadratic F | G_F-fixed scalar field has dimension 2; φ-fixed field ℚₚ has dimension 1 | Completion and algebraic union are distinguished | None |
| Conventions: nonempty finite base | Degree-one cover; empty cover | Fibre counts 1 versus 0; ratio 1/1 versus undefined 0/0 | Surjectivity excludes the empty cover | None |
| Conventions: proper scheme points see reduction | Spec K[ε]/ε² | Each field point sends ε to 0; one point before and after reduction | Nonreduced carriers allowed | None |
| §0.1 restriction and composition | Spec K; identity extension; complex completion | Splitting counts 1→1→1; G_ℂ=1 gives one target | Both composites are the unique map | None |
| §0.1 conjugacy descent | Inversion extension with section coordinate 2, conjugator −2 | 2+2(−2)=−2; generators square to identity | Raw maps differ but quotient classes coincide | None |
| §0.1 compatibility with point maps | G_m, rational unit 1 | Kummer class of 1 is 0 globally and locally; res(0)=0 | Direction of restriction correct | None |
| §0.1 naturality | Squaring G_m→G_m, a=2 | Local Kummer class of 4 equals 2 times class of 2 | Restricting commutes with the morphism | None |
| §0.2 p-adic injectivity | E:y²=x³−x; p=2,3 | Four distinct rational 2-torsion points remain four points; their section classes have cardinality 4 | Includes the dyadic place | Sharpened stix08 locator |
| §0.2 divisibility criterion | Finite quotient of exponent 6; compact profinite point group | Image of 6A is 0; an element in every nA has image 0 in every finite quotient | Hausdorffness gives the zero element | None |
| §0.2 real boundary | Two real points in one E(ℝ) component | Two distinct points map to one section class | Local-field hypothesis cannot include ℝ | None |
| §0.3 Selmer definition | Spec K; empty real point set | One class satisfies all local conditions; an empty real factor gives 0 classes | All places matter | None |
| §0.3 localisation uniqueness | Four global E[2] points, p=2,3 | κ(loc κ(y))=κ(y); four localisations are distinct | Point and section directions agree | None |
| §0.3 finite-extension functoriality | y rational, K⊂L, w over v | Both routes give the same coordinate y in L_w; 0 maps to 0 on E | Restriction preserves Selmer classes | None |
| §0.3 real component nonexample | z²−x²−y²=1; points (0,0,±1) | Two real components, geometric π₁=1, one section class | No unique real point/component asserted | None |
| §0.3 conditional section conjecture | Empty point set and a bijective κ | Bijectivity forces section count 0; image and Selmer set both empty | The conjecture is a hypothesis | None |
| §0.4 modified carrier and projection | Spec K, empty scheme, square-zero point | Ordinary/modified cardinalities (1,1),(0,0),(1,1) | Projection is surjective in all three cases | None |
| §0.4 archimedean quotient | Elliptic curve with two real components | Component factor has 2 elements; two points in one component give the same element | Distinguishes quotient from real points | None |
| §0.4 finite torsor survival | Trivial C₂-torsor over Spec K | Local fibres have size 2; image is the one base point | Twisted survival has the stated direction | None |
| §0.4 descent, diagonal and functoriality | P¹; rational point; identity morphism | Geometric π₁(P¹)=1; full modified product survives; identity preserves its points | Rational inclusion and identity law agree | None |
| §0.4 Stoll implication | Finite rational set with r points | closure has r points; closure⊂f-cov⊂f-ab=closure gives both sets r | No unconditional equality is used | None |
| §0.5 Harari–Stix equivalence | Spec K; diagonal 1 on G_m | Both matching sets have one chosen point/class; Kummer value 0 on each side | Tests both directions, including nonproper X | None |
| §0.5 finite-place projected equality | Empty local curve | Both projection and Selmer-localisation image have cardinality 0 | Equality agrees in empty case | None |
| §1.1 algebra and rational point set | ℚₚ², nonsplit quadratic field, dual numbers | Dimensions all 2; rational algebra-map counts 2,0,1 | Σ is not a geometric point count | None |
| §1.1 symplectic module and line | Standard plane; zero form; V=0,L=ℚₚ² | Standard form determinant 1; zero form determinant 0; zero module has rank 0 but candidate line rank 2 | Perfectness and rank-one line are separate | None |
| §1.1 pair morphisms and inverses | Scalar 2 on a plane, line scalar 4 | ω(2e,2f)=4=4ω(e,f); inverse scalars 1/2,1/4 compose to 1 | All three components are required | None |
| §1.1 split decomposition and induction | Two coefficient points exchanged by C₂ | Rank-two fibre induces to rank 4; invariant algebra dimension 1 | Matches permutation algebra, not a constant algebra | None |
| §1.1 restriction and tensor functor | Identity restriction; tensor of two unit lines | Rank 1 stays 1; tensor rank 1·1=1; pairing values unchanged | Identity/composition preserve pair data | None |
| §1.1 isotropic and Lagrangian | Plane e,f | ω(e,e)=0, ω(e,f)=1; line e has dimension 1=2/2 | Whole plane is not isotropic | None |
| §1.1 isomorphism classes | Two bases related by scalar 2 | Pairing entries change by 4 and line map by 4; one isomorphism class | No equality of matrices is required | None |
| §1.2 fibre pair | One elliptic fibre; two split fibres | H⁰,H¹ ranks (1,2),(2,4); Σ sizes 1,2 | Dimensions and algebra agree | None |
| §1.2 nonsplit finite base | Quadratic L/F, E/L | H⁰ geometric rank 2, invariant rank 1, H¹ rank 4 | Unlike split base with invariant rank 2 | None |
| §1.2 polarisation normalisation | Principal elliptic polarisation at p=2 | Diagonal Poincaré factor 2; multiplying by 1/2 gives 1 in ℚ₂ | Rational pairing permits division by 2 | None |
| §1.2 base change | Quadratic L/F split by E/F | E⊗_F L=E²; two geometric points and total H¹ rank 4 on both sides | Field extension preserves full pair | None |
| §1.3 relative system | Constant elliptic family; Legendre family | Ranks (1,2) in both; geometric monodromy dimensions 0 versus 3 | Ranks alone do not fix the system | None |
| §1.3 finite base monodromy | Multiplication by 2 on E, four geometric points | Regular E[2]-algebra rank 4, invariants 1, H¹ rank 8 | Constant rank-four algebra would have 4 invariants | None |
| §1.3 relative Chern class | Trivial line bundle; principal polarisation | Trivial c₁=0; polarisation coefficient 2/2=1 | Fibre and relative class normalisations agree | None |
| §1.3 lattice and pullback API | Ranks at levels p,p²; identity base change | Compatible tower ranks r,r; unrelated ranks 1,2 cannot satisfy reduction | No arbitrary rational system without lattice is used | None |
| §1.4 section pair | Constant elliptic family | Algebra/module ranks (1,2) for every section | Pullback retains fixed geometric data | None |
| §1.4 nonconstant section dependence | E×E with finite map [2], sections 0,(0,0) | H⁰ rank 4 in both; invariant dimensions 4 and 2; H¹ rank 8 | Galois action cannot be forgotten | None |
| §1.4 half-point computation | x=±i, y=±(1∓i) | At i: y²=−2i=i³−i; numerator (i²+1)²=0; four halves paired by conjugation | Two Galois orbits, not four fixed points | None |
| §1.4 conjugacy/basepoint API | Section action conjugated by P | Pρ(s)P⁻¹; P=2I has multiplier 4, with inverse giving ρ(s) | Isomorphism acts on algebra, module and line together | None |
| §1.5 local-system restriction | Point-section of y; cover z²=t at y=1 | Fibre character is trivial; two cover points fixed | The same path handles vector and set fibres | None |
| §1.6 pair interpolation | Rational elliptic fibre | Both pairs have ranks (1,2), pairing values 1,−1 | Tensor compatibility preserves the form | None |
| §1.7 adelic locus | Constant family; empty adelic set | Constant pair witnesses every adelic point; empty product locus has 0 points | One global witness is quantified first | Restricted de Rham wording to p-places |
| §1.7 isomorphism invariance | Identity family map on H⁰,H¹ | Comparison matrices I₁,I₂ preserve ranks 1,2 and pairing 1 | Locus unchanged under the stated isomorphism | None |
| §1.7 nontrivial obstruction | Nonempty p-adic curve disc, q chosen at self-conjugate v | Disc has infinitely many points; projected locus has finite cardinality r | Arbitrary separate geometric fibres need not have one global pair | None |
| §1.8 Selmer inclusion | s=κ(y); empty Selmer set | loc_v(s)=y_v; empty image cardinality 0 | Same global pair works at every place | None |
| §2.1 module operators | Rank-two monodromy example, p=2,3 | Nφ(f)=2e,3e respectively, equal to pφN(f) | Relation and absolute p are correct | None |
| §2.1 filtered comparison | Unit and Tate-one line | Ranks 1=1 on pst/dR sides; jumps 0,−1; φ scalars 1,p⁻¹ | Correct coefficient and filtration conventions | None |
| §2.1 restriction and induction | Degree-two extension, unit object | Restriction rank 1; induction rank 2; de Rham algebra is L, not F² | Induction restricts scalars on dR | None |
| §2.1 adjunction | Unit E over F and unit D over quadratic L | Hom(E restricted,D)=ℚₚ; invariant maps E→Ind D have dimension 1 | Frobenius reciprocity matches | None |
| §2.1 full faithfulness | Unit→unit; unit→Tate-one; zero→zero | Hom dimensions 1,0,0 on both sides; φ(λ)=pλ forces λ=0 by valuation | No extra period morphisms | None |
| §2.1 cohomological base change/induction | Spec L over F; L/F quadratic | H⁰ pst rank 2; H⁰ dR=L; over L it splits into two units if L/F Galois | Structural composition differs from Weil restriction of X | None |
| §2.2 endomorphism algebra | Unit over unramified quadratic F | G_F alone leaves dimension 2; φ imposes dimension 1 | Frobenius condition is essential | None |
| §2.2 automorphism functor | D=0; unit; ordinary elliptic pst | Group dimensions 0,1,2; ordinary End=ℚₚ² | Unit-group construction has correct degenerate value | None |
| §2.2 similitude functor | Rank zero; diagonal (2,3) on plane | Rank-zero GSp dimension 1; multiplier 6; scalar 2 multiplier 4 | Multiplier is independent data in rank zero | None |
| §2.2 retwist and flag action | Two-dimensional filtration; central scalar 2 | Flag variety P¹ dimension 1; multiplying a line by 2 leaves it unchanged | Central scalar acts trivially | None |
| §2.2 action quotient and inverse | Positive rank versus zero | Positive-rank scalar torus dimension 1; zero flag variety dimension 0 | No rank-zero subtraction of a scalar dimension | None |
| §2.3 orbit/isomorphism iff | Diagonal torus on P¹ | Orbits: e, f, and nonzero slopes; slopes 1 and 2 related by diag(1,2) | Three classes; both directions distinguish eigenlines | None |
| §2.3 dimension closure | G_m² action; finite union of three orbits | Group dimension 2; largest orbit dimension 1; finite union dimension 1 | Closure bound survives finite unions | None |
| §2.4 endomorphism dimension | Dimensions 0,1,2 | Bounds 0,1,4; unit End dimension 1 reaches 1² | Scalar-extension injection has correct sizes | None |
| §2.4 symplectic dimension | d=0,1,2 | Bounds 1,4,11; GSp₀=G_m, GSp₂=GL₂ | Formula includes independent multiplier | None |
| §3.1 conjugate-place definition | ℚ; ℚ(i) at 2,3,5 | All ℚ places fixed; one ramified prime at 2, one inert at 3, two exchanged at 5 | Ramified self-conjugate place need not be friendly | None |
| §3.1 symmetry and nonreflexivity | Two primes over 5 | Conjugate pairs (v,v′),(v′,v); neither (v,v) nor (v′,v′) | Not an equivalence relation | None |
| §3.1 restriction to subfields | ℚ(i) prime over 3→ℚ | One fixed prime restricts to the fixed prime (3) | Subfield restriction preserves the condition | None |
| §3.2 conjugate Hodge weights | χ_cyc⁻¹; finite-order character | 1+1=2; 0+0=0 | Self-conjugacy forces even weight | None |
| §3.2 coefficient-field boundary | CM elliptic character at inert p | Labelled jumps 0,1, pure weight 1; no integer r satisfies 2r=1 | ℚₚ-valued hypothesis is substantive | None |
| §3.3 finite-order twist | χ=ηχ_cyc⁻¹, η finite | n=2, χχ_cyc=η; η=1 gives 1 | Twist exponent has correct sign | None |
| §3.3 norm versus diagonal | Two factors α,α⁻¹ of infinite order | Diagonal product αα⁻¹=1, each factor can have infinite order | Product restriction cannot isolate a factor | None |
| §3.4 weighted-sum identity | Elliptic H¹; quadratic induction; zero V | 1=1·2/2; 2=1·2·2/2; 0=0 | Zero case is a sum, never an average | None |
| §4.1 local-system equivalence | n=0; lattice ℤₚ(1) | G_R=G_F and q∘s=id; χ∘q∘s=χ | Integral coefficients retain continuous monodromy | None |
| §4.1 cover negative control | ℚ₃, z²=t at t=1,2 | Fibre permutation traces 2 and 0; sign traces 1 and −1 | No global horizontal basis; cannot contradict transport | Made hypothesis failure explicit |
| §4.1 horizontal pst transport | Constant rank-two pair | T=I₂ at any two centres; comparison rectangle gives I₂ on both routes | Actual comparison excludes replacing T by 2I₂ | None |
| §4.1 naturality and cocycle | Constant pair, three centres | I₂I₂=I₂; tensor identity I₂⊗I₂=I₄ | Identity/composition/tensor laws agree | None |
| §4.2 residue-field reduction | 𝔽₂,𝔽₄,𝔽₈ avoiding two residues | Available choices 0,2,6; gcd(2,3)=1 | Degree-two and degree-three descent includes ℚ₂ | None |
| §4.3 horizontal uniqueness | Rank-one Tate pair, identity centre | Comparison I₁ forces T=1; competing T=2 gives 2≠1 | Uniqueness is tied to comparison | None |
| §4.4 smooth proper transport | Constant elliptic family; nonconstant filtration | pst rank 2 unchanged; filtration lines e and e+f distinct | Only unfiltered data is constant | None |
| §4.5 actual period control | Centre and retwist F¹=e with φ=diag(1,p) | Centre returns original pair; arbitrary flag has t_H(e)=1>0=t_N(e) | Arbitrary flags need not be admissible | None |
| §5.1 symplectic Hodge pair | Elliptic fibre at p=2,3 | pst/dR ranks (1,2); pairing matrix [[0,1],[−1,0]] determinant 1 | Alternation and perfectness preserved | None |
| §5.1 line and filtration | Elliptic H¹ | Hodge jumps 0,1; target jump 1; F¹ rank 1 and ω(F¹,F¹)=0 | Wrong twist fails filtration | None |
| §5.1 algebra realisations | Two F-fibres versus one fibre over quadratic L | Ranks (2,4) in both; F² has two primitive idempotents, L only one | Algebra is part of the pair | None |
| §5.1 extension comparison | E splitting L/F | E⊗L=E²; each component H¹ rank 2; total rank 4 | Pairing and comparison commute with extension | None |
| §5.2 retwist definition | Ordinary elliptic slopes 0,1; lines e,f,e+f | e gives (t_H,t_N)=(1,0); f gives stable-line pairs (0,0),(1,1); e+f gives (0,0),(0,1) | All flags exist; only latter two weakly admissible | None |
| §5.2 coefficient-linearity | A=F²; graph of diag(1,−1) | Trace-form pairing 1+(−1)=0; (1,0)(v,Dv)=(v,0) leaves graph for v≠0 | Trace Lagrangian is not automatically A-linear | None |
| §5.2 isotropy condition | Φ=span(e₁,f₁) in dimension 4 | dim Φ=2 but ω(e₁,f₁)=1; target F²=0 | Half dimension alone fails filtered pairing | None |
| §5.2 orbit criterion | e versus f versus e+f | Three diagonal orbits, hence three retwist classes | Same criterion as §2.3 on actual pair | None |
| §5.3 period map and pair comparison | Constant family; centre | Period is Φ₀ for every point; M(Φ₀)=original ranks (1,2) | Inverse used only on the essential image | None |
| §5.4 product decomposition | Split elliptic plus abelian surface | Component H¹ ranks 2,4; B=6; period dimension 1+3=4 | Locally constant rank is necessary | None |
| §5.4 Weil restriction | Elliptic components of degrees 1,2 | Total H¹ rank 2+4=6; period dimension 1+2=3 | Full field degrees supply the factors | None |
| §5.4 dimension-zero factor | Zero-dimensional abelian component plus elliptic | H¹ ranks 0,2; period dimensions 0+1=1 | Zero factor contributes a point | None |
| §6.1 S-goodness | Elliptic H¹, Tate-twisted H¹, unit⊕Tate-minus-one | Weights 1,−1,and mixed 0/2; jumps (0,1),(−1,0),(0,1) | Hodge jumps alone do not imply purity | None |
| §6.1 monotonicity and isomorphism | S⊂S′; scalar basis change 2I | Outside-S′ tests form a subset; characteristic polynomial unchanged | Same witness remains S′-good | None |
| §6.1 finite-extension restriction | Elliptic Frobenius roots α,β, local degree 2 | Roots α²,β²; absolute values q rather than √q; weight still 1 for cardinality q² | Purity normalisation agrees | None |
| §6.1 coefficient-fibre integrality | Roots √2,−√2 | Total polynomial X²−2; factors X∓√2 not rational, root degrees 2 | Bounded root degree survives, integer coefficients need not | None |
| §6.1 zero module | Dual numbers, V=0, trivial action | Polynomial 1; rank 0; one rational algebra point versus algebra dimension 2 | S-good and Artin do not imply split | None |
| §6.1 finite-image algebra counterexample | ℚ₇[ε]/ε², ε↦ζ₃ε | Trace 1+ζ₃ is nonrational; action order 3 | Finite image is not a rational permutation representation | None |
| §6.2 local LV definition | Constant elliptic family; conic x²+y²+z²=0 at 2 | Constant pair witnesses every local point; primitive conic square-sum mod 4 is 1,2,3, never 0 | Empty local case gives cardinality 0 | None |
| §6.2 Artin equality | Split coefficient algebra with two factors | Algebra automorphism group S₂ order 2; same algebra retained under restriction | Local interpolation forces finite algebra image | None |
| §6.2 algebra and pairing sensitivity | F² versus quadratic field; two nonsquare-scaled summand forms | Idempotent counts 4 versus 2; form comparison requires a₁²=c a₂² | Neither structure may be discarded | None |
| §6.3 period locus definition and centre | Constant family of positive dimension | Centre Φ₀ belongs; period image dimension 0<1 | Density hypothesis fails for the constant family | None |
| §6.3 finite-cover route | P¹(F), A¹(F), points p⁻ⁿ | Two compact coordinate discs cover P¹; abs(p⁻ⁿ)=pⁿ is unbounded | Properness supplies global compactness | Precise compactness supplier subsection |
| §6.3 automorphism/monotonicity API | Scalar 2; S⊂S′ | Φ unchanged, multiplier 4; membership 1→1 | Same interpolant works | None |
| §6.4 global S-goodness | Diagonal rational elliptic fibre | Local algebra/module ranks 1,2 everywhere; jumps 0,1 at p-places; good-place weight 1 | Uses one pair at all places | None |
| §6.5 rational inclusion | Constant family, one or two copies | Interpolant ranks (1,2),(2,4) agree globally and locally | No rational-point finiteness used | None |
| §6.6 nonsymplectic locus | Rank-two representation | Determinant line rank 1, ∧²f is required line map | Elliptic loci coincide | None |
| §6.6 two summands | Absolutely irreducible W₁,W₂, nonsquare c | b=a₁²=c a₂² would give c=(a₁/a₂)² | Forms non-isomorphic equivariantly | None |
| §6.6 forgetting Galois action | Scale f₂ by c⁻¹ | c·ω(e₂,c⁻¹f₂)=1; other block unchanged | Underlying forms are isometric | None |
| §6.6 family dimensions | g=3, q=11,23 | (3−1/2)·10=25; (3−1/2)·22=55 | Numerical comparison retained | None |
| §6.7 coefficient points | Degree-four field fibre, including totally ramified | Four geometric points in one orbit; index 4 even if residue degree 1 | Index means full extension degree | None |
| §6.8 trichotomy singleton/empty | A=ℚₚ; A=0 | (c): 1≥1/(d+1); 0≥0 | Empty Σ is meaningful in cardinality form | None |
| §6.8 nonsplit/nonreduced boundary | A=ℚₚ[ε]/ε³,d=1 | #Σ=1, dim A=3; 1≥1/2 true versus 1≥3/2 false | General theorem uses #Σ | None |
| §6.8 averaging inequality | m=2,N=10, small count s=4 or 3 | 10≤3+8=11 gives 12≥10; s=3 gives 10≤19/2 false | Threshold is nonvacuous | None |
| §6.9 three locus definitions | Constant degree-one elliptic family | Eligible index-≥4 points 0; memberships (a,b,c)=(0,0,1) | Global and local witnesses are distinguished | None |
| §6.9 local type (b) | Ordinary elliptic line, coefficient index 1 or 4 | Unramified line jump 0<1/2; split weight-one line jump 1≥1/2 | Weight and index conditions are separate | None |
| §6.9 type (c) ratio iff | Zero algebra, singleton, transitive quintic, d=1 | 0≥0 versus undefined ratio; 1≥1/2 in both forms; 0≥5/2 and 0≥1/2 both false | Nonzero split qualification is needed | None |
| §7.1 finite class set definition | δ=1; dimensions 1,2 over a split degree-two base | L=K in degree 1; variable-rank B=2+4=6 versus erroneous 2d₁δ=4 | Fixed total degree bound retained | None |
| §7.1 class/orbit API | Matching versus mismatching discrete module | One matching class gives one orbit; mismatch gives zero flags | Finite union has the stated pieces | None |
| §7.2 finiteness inputs | K=ℚ,S={2,∞},degree≤2 | Fields ℚ,ℚ(i),ℚ(√2),ℚ(√−2): count 4; discriminants 1,−4,8,−8 | Hermite counts embedded fields with fixed bounds | Precise Hermite supplier subsection |
| §7.2 GSp-irreducibility negative control | W=H¹(E), E:y²=x³−x, p=3, V=W⊕W∨(−1) | #E(𝔽₅)=8, trace −2; V polynomial (X²+2X+5)²; stable isotropic rank 2 | Rank 4 pair meets remaining arithmetic conditions | None |
| §7.3 dimension inequality | (d,r)=(1,4),(1,3),(2,4) | Orbit/domain bounds 3<4,3=3,10<12 | Strictness starts at r=4 by this route | None |
| §7.4 definition/nonempty example | Constant quartic base, non-CM elliptic E; degree-one base | Ranks (4,8), eligible index 4; degree-one eligible count 0 | Locus is not defined to be empty or full | None |
| §7.4 automorphism, monotonicity, disc API | Φ₀, scalar 2, S⊂S′ | Φ₀ fixed, multiplier 4, same global witness; constant disc maps to Φ₀ | All three operations retain membership 1 | None |
| §7.4 non-density | Quartic elliptic factor | Orbit closure dimension at most 3<4 domain dimension | No full-monodromy hypothesis needed | None |
| §7.5 type-(a) finiteness | Empty local curve; constant period map boundary | Empty locus size 0; constant period image dimension 0 | Finiteness route uses full monodromy and compactness | None |
| §7.6 common-subobject condition | Four lines e,f,e+f,e+2f | Pairwise determinants 1,1,2,−1,−1,1; intersection dimensions 0 | No one nonzero line meets all four | None |
| §7.6 nonempty exceptional locus | Four copies of line e | W=e intersects each in dimension 1≥1/2 | Exceptional set is proper, not empty | None |
| §7.7 type-(b) positive example | ℚ₅, unramified quartic base, CM E:y²=x³−x | #E(𝔽₅)=8, a₅=−2; stable weight-one line has dim F¹=1, index 4 | Actual Hodge point belongs | None |
| §7.7 negative example | Same four distinct lines; degree-one base | Common witness count 0; degree-one eligible count 0 | Separate per-embedding witnesses would be wrong | None |
| §7.7 automorphism/disc API | Constant CM family, scalar 2 | W remains dimension 1, F¹ dimension 1; Φ(y)=Φ₀ | Same actual local pair gives membership | None |
| §7.8 type-(b) finiteness | Empty local curve; positive-dimensional constant family | Empty locus size 0; constant image dimension 0 | Full-monodromy condition excludes the misleading constant case | None |
| §8.1 proportion definition/range | Trivial set, quintic orbit, orbits of sizes 3+4 | Ratios 1,0,3/7, all in [0,1] | Threshold counts points, not orbits | None |
| §8.1 equal-fibre monotonicity | Two copies of a 3+4 orbit set→one copy | Ratios 6/14=3/7 and 3/7; constant fibre size 2 | Valid equality case | None |
| §8.1 unequal-fibre boundary | Four fixed points plus C₄→one fixed point plus C₄ | Fibre sizes 4,1,1,1,1; proportions 1/2>1/5 | Surjectivity alone is insufficient | None |
| §8.1 nonabelian action | Regular S₃-set; S₃/C₂ | Ratios 0/6=0 and 3/3=1 | Whole-group orbit sizes matter | None |
| §8.1 weighted union/zero boundary | 3+4 orbits; empty first summand | (3·1+4·0)/7=3/7; empty contribution gives numerator 0 and denominator 4 | Does not define size(∅) | None |
| §8.2 local subfield count | ℚ₅,ℚ₇,ℚ₂ | Counts 3+4=7,3+4=7,7+4=11 | Embedded conjugates retained | None |
| §8.2 isomorphism-class boundary | Three ramified cubics over ℚ₅ | Three subfields, one ramified isomorphism class; total 7 versus erroneous 5 | Correct counting convention | None |
| §8.2 generator bound/closure independence | F=ℚ₅ or ℚ₂; degree 2,3 | t=3 gives 2³+6³=224≥7,11; closure isomorphism permutes 7 or 11 fields | Bound and invariance agree | None |
| §8.3 isotropic fixed classes | g=2,k=5,q_v=7 | gcd(5,6)=gcd(5,48)=gcd(5,342)=1; k^g=25 | Pairing on fixed vectors is zero | None |
| §8.3 small-orbit union bound | Same case | n_v k^g=7·25=175 versus total k^(2g)=625 | Includes globally fixed classes | None |
| §8.3 pairing Frobenius | q_v=5,k=41 | 5⁻¹=33 modulo 41; 5·33=1 modulo 41 | Dual cyclotomic direction correct | None |
| §8.4 exclusion numerics | g=2,q_v=5,q=83 | k=41,d=123,82≥63; odd forbidden divisors 3,5,31 divide neither 82 nor k | Hypotheses hold | None |
| §8.4 strict final bound | Same case | (9/8)·7/41²=63/13448<1/124; 4k=164>124 | Strictly excludes type (c) | None |
| §8.4 primitive denominator | g=2,k=5; k=1 boundary | Primitive count 5⁴−1=624>625/ζ(4); k=1 gives 4=4 in final denominator comparison | q−1≥9n_v rules out k=1 | None |
| §8.5 prime choice | q_v=2, initial q=11 | Forbidden odd primes 3,7; q−1=10 divisible by neither; 10<9·11=99 over ℚ₂ | Size condition still needs larger q | None |
| §8.5 CRT unit class | Moduli 4,3,7 | q≡3,2,2 respectively; each residue coprime to its modulus | Dirichlet applies to an unbounded unit class | None |
| §8.6 genus-three minima | q=11,23 | d=25,55; improved bound 0.01627749<1/26; original bound 0.00305738<1/56 | Good-reduction comparison consistent | None |
| §8.6 small-prime exclusions | q=3,5,7,11,13,17,19 | q−1 values 2,4,6,10,12,16,18; 4 or 3 or 5 divides each except 2; q=3 size estimate >4>1/6 | Original minimum cannot be below 23 | None |
| §8.6 field-dependence control | ℚ(√5,ζ₁₁+ζ₁₁⁻¹) | Residue classes satisfy q_v²=1 mod 5,11 when prime to these; otherwise q_v=0 | q=11 or 23 is excluded everywhere as stated | None |
| §8.6 density distinction | Fixed cyclotomic unit classes | Cyclic group has at most φ(1)+⋯+φ(7)=18 elements of order≤7; bad fraction≤18/(r−1) | Natural-density input is named separately | None |
| §9.1 LV finiteness | Two finite sets of sizes a,b; empty type-(c) set | Union cardinality≤a+b+0 | Trichotomy closes without excluding bad places | None |
| §9.2 Mordell consequence | Empty local curve; elliptic positive-rank boundary | Empty global set size 0; an elliptic positive-rank group is infinite | Genus≥2 belongs to the conclusion | No duplicate Mordell declaration |
| §9.3 self-conjugate Selmer finiteness | ℚ(i) at 2,3,5 | Covered fixed-place counts 1 at 2 and 3; two exchanged places at 5 | General number field, restricted place condition | None |
| §9.4 Theorem A | ℚ, primes 2,3; empty Selmer set | No CM subfield, so both places qualify; empty image size 0 | All finite places retained | None |
| §9.5 Theorem B | Empty finite-descent projection; conditional r rational points | Projected and localisation image sizes 0; under Stoll both images have at most r points | Equality used is Harari–Stix, not Stoll | None |
| §9.6 comparison with original range | ℚ, place 2; a good odd place | Original condition fails at 2; new self-conjugacy holds at 2; density-one set may omit finitely many places | Comparison does not narrow Theorem A | None |
| Supplier: finite-level monodromy | Constant towers of rank 1 and incompatible ranks 1,2 | Compatible reductions 1→1; rank 2 cannot reduce to rank 1 | Uses ECF on arbitrary connected bases | None |
| Supplier: cohomological trace/Tate line | Degree-one divisor on P¹; two components | Trace values 1 and 1+1=2; twist comparison uses inverse a | Normalisation is the actual comparison's | None |
| Supplier: Weil restriction and flags | Quadratic separable field; empty flag | One line restricts to dimension 2 and splits into 1+1; empty flag variety is a point | No inseparable splitting claim | None |
| Supplier: local finite generation | F=ℚ₂,ℚ₃ | Full-group generator bound t=3; finite-target homomorphism bounds 8,216 | Full group differs from maximal pro-p quotient | None |
| Supplier: local field squares/tame relation | ℚ₂ and residue cardinality 5 | Square-class count 8, hence 7 quadratic fields; στσ⁻¹=τ⁵ | Dyadic and arithmetic-Frobenius conventions agree | None |
| Supplier: generic versus symplectic finiteness | Rank-four hyperbolic pair from §7.2 | Stable isotropic dimension 2; polynomial degree 4 but root degree 2 | Existing semisimple finiteness alone is not falsely relabelled symplectic finiteness | Conditional contract retained |
| Supplier: four versus five Lagrangians | Plane with four distinct lines | Pairwise intersections 0; repeated line has intersection 1 | Stronger four-input contract is explicit | Conditional contract retained |
| Supplier: polynomial least prime | Modulus 3, unit class 2 | Least prime is 2; a universal bound requires constants uniform in modulus, unlike a fixed/logarithmic modulus range | Does not infer Linnik from Siegel–Walfisz | Conditional contract retained |
| Supplier: locally constant rank | Elliptic plus surface over two components | Ranks 2,4; sum 6, not free constant rank giving 8 | Required extension remains explicit | Conditional contract retained |
| Universe and vacuity conventions | Zero object, empty isomorphism class locus | End(0)=0; empty locus size 0; positive-rank averages omit rank 0 | No free condition fields or assumed conclusions occur | None |


Pull request: #1739 (roadmap/galois-sections-padic-period-maps at 0d951ae)
