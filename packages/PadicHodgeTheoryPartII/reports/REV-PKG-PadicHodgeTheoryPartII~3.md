<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13046#issuecomment-6782558612 -->
Review (codex) of 303c17e

Verdict: needs_changes

1. **F01** (P3) Replace the nonexistent VB0 supplier label

   **Location:** `packages/PadicHodgeTheoryPartII/README.md:67`: “Layer VB0 supplies”. The same label occurs at lines 19, 43, 172, 193, 246, 357 and 407.

   **Claim:** The four named finite-isocrystal inputs belong to a layer called VB0 in VectorBundlesAndIsocrystals.

   **Witness:** At open pull request #1205, `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:209` is “Layer 1: Finite isocrystals and division algebras”; lines 213, 255, 279 and 295 contain the four named inputs. There is no VB0 occurrence or numbering alias.

   **Exact repair:** Replace all eight occurrences of `VectorBundlesAndIsocrystals VB0` / `Layer VB0` with `VectorBundlesAndIsocrystals Layer 1` / `Layer 1`, retaining the four exact subsection titles in the contract and the more specific titles in §§0.4–0.5. Do not reconstruct the supplied classification here.

   **Repair verification:** The four titles at line 67 match those actual Layer 1 headings. With E=Q_(p^s), its coefficient Frobenius is the q-power Frobenius, q=p^s, hence σ^s as required. Its D(1,2) has rank 2 and slope 1/2; the unit has rank 1 and slope 0. Thus this replacement resolves the locator without changing the degree or fibre calculations below. This is P3, rather than an unowned prerequisite: the contract already identifies the existing inputs by their exact titles. No missing theorem, new supplier or supply-order change is required.

One P3 locator finding; no P1 or P2 finding. All three findings from round 2 are repaired. The mathematical statements checked below survive the adversarial pass. The dependency check passes, and Suggested.lean elaborates without output or warnings. A package requires zero repairs for acceptance, so the stale supplier label prevents acceptance this round.

## Verified sound

### Previous findings checked first

- **Round-2 R01 — repaired.** `packages/PadicHodgeTheoryPartII/Suggested.lean:40` now requires a period representation “whose image meets `G_der(ℚ_p)` in an open subgroup of `G_der(ℚ_p)`”. Lines 35–38 separately retain the unconditional component formula, and lines 42–45 distinguish reached components from all components under transitivity. README line 500 adds the trivial-GL₂ counterexample. For ξ=1, the stabilizer is 1; the matrices [[1,p^n],[0,1]] converge to 1 inside SL₂ and are nonidentity, so the new hypothesis excludes precisely this counterexample. For a torus the derived group is 1 and openness remains automatic.
- **Round-2 R02 — repaired.** README line 113 says “Layer 1 uses Layer 0's jump predicate in §1.1, its full-period degree sum in §1.5 and its tested-vector sets in §1.6”. The §1.1 Needs clause at line 260 includes §0.1; line 351 lists the same three dependencies. Count: three Layer-1-to-Layer-0 edges, zero in the opposite direction. No old assertion of independence remains.
- **Round-2 R03 — repaired.** Suggested.lean line 28 says “The topological group `G(ℚ_p)` and its closed subgroups are pinned”. README line 49 gives the native topology, topological-group, closed-embedding and integral-points inputs. Lines 47 and 447 import `mapPointsFunctor_derivedMap_app_surjective` and `faithfullyFlat_derivedMap`. Opened their actual pinned signatures: finite type and injective coordinates are retained, as are algebraic closedness for surjectivity and the reduced-target hypothesis for faithful flatness. For GL₂→PGL₂ the derived map has dimension 3→3 and kernel μ₂; for a torus it is 0→0 in dimension. Over Q_p, diag(p,1) does not lift to SL₂, which correctly prevents replacing algebraically closed points by rational-point surjectivity.

No prior finding was marked not actionable, and none is re-raised. The additional repair-stage inventory changes are correct: reductivity and point-representation categories exist, whereas the represented flag scheme and crystalline period geometry needed for the headlines do not. All changed Needs clauses, the new §3.4 proof paragraph and the new §4.2 Check were reviewed. The remaining stale supplier label R01 is separate from these repaired findings.

### Principles, organisation and shape

Read all 25 numbered targets, 25 Needs clauses and 83 Check bullets, including their APIs and proof routes. The six definitions in §§0.1–0.5 and §1.1 have API lists and at least three discriminating Checks each. All five layers end with Examples and Dependencies. Compared the form with the main READMEs of ReductiveGroups and SchemeAndStackFoundations.

This extends PadicHodgeTheory at §§3.6 and 5.5 rather than replanning it. Period functors, B(G), slope classification, reconstruction, flag schemes and period towers retain named suppliers. The new work is the generic-filtration/degree argument, its monodromy consequences and the compact-image torsor specialization. The dependency graph forces the arithmetic and representation inputs before generic admissibility/monodromy, and those before the open-image and stabilizer results. No layer is named after a source chapter and the text does not say it follows a source's arrangement.

The scope retains ramified and nonquasisplit connected reductive groups, arbitrary cocharacter type and p=2. Characteristic zero is explicit where highest-weight semisimplicity, smooth subgroup arguments or p-adic fields are used; the elementary filtration definition allows general fields. No computational algorithm, route-specific restriction, copied source passage, sorry'd data, set_option, machine path, HTML anchor or process handoff appears in the authored files. The mathematical discussion of an error in a cited proof is source criticism, not process residue. The topic-only metadata is valid. All five referenced works have one manifest entry each, and all five cached texts were readable. No source or manifest edit was necessary.

### Seeded source verification

Read the source text at every one of the 15 seeded locators, including the proof when the target is a proof step rather than a separately numbered theorem. No author-flagged unverified locator occurs in the package. GLX26 uses the arXiv v3 numbering explicitly specified in the manifest; Chen14 uses printed journal pages. The general reductive-group extension is supported by GLX26, not inferred from Chen's unramified setting.

| Target | Locator and cached text opened | Hypotheses and support |
|---|---|---|
| 0.2 | GLX26 (5.4), p.33, line 1312 | Exactly s iterates, indexed 0 through s−1. The README's arbitrary-set definition is the elementary finite-sum abstraction; positivity is imposed only in its arithmetic application. |
| 0.4 | Chen14 §3.1, pp.739–740, line 781; Definition 3.3.1/Lemma 3.3.2, p.742, lines 930–943; GLX26 ¶14, p.32, line 1289 | Positive s, slope denominators dividing s, and normalized φ^s-fixed spaces give the finite-field fibre. Admissibility is required for the filtered Tannakian restriction, not the unfiltered construction. |
| 0.7 | Chen14 Proposition 3.2.3, pp.741–742, line 896; Proposition 3.3.3 and proof, pp.742–743, lines 946–954; GLX26 ¶14, p.32, line 1289 | Chen's group is the full closure. The fibre comparison restricts to the ambient G-functor, producing conjugation in G(B_cris); normality and faithfully flat descent then give derived containment. An abstract inner-form identification alone is insufficient. |
| 1.2 | GLX26 Proposition 5.7, pp.36–37, lines 1501–1584; orbit decomposition, p.35, line 1464 | The package explicitly corrects the nonnormal-reflex-field indexing. The minimum over the entire Γ_k-orbit, or its distinct Γ_E-orbits, proves both directions. |
| 1.3 | GLX26 (5.23)–(5.29), p.38, lines 1622–1646 | The convex average must weight refined orbits by their cardinalities. The package supplies that correction and retains the nonzero occurring-component hypothesis. |
| 1.4 | GLX26 Theorem 5.8 proof, p.39, lines 1649–1654 | The semilinear twist sends O to σ_0(O); multiplication by b preserves each isotypic part. The package gives the same two steps. |
| 1.5 | GLX26 (5.30)–(5.36), p.39, lines 1655–1685 | The inverse exponent belongs in each individual pairing; reindexing a full positive period identifies the sums. The package does not claim termwise equality with the positive exponent. |
| 1.7 | GLX26 Theorem 5.8(2) proof, p.40, lines 1703–1710 | Every simple-coroot coefficient is strictly positive. The package supplies the highest-weight argument from zero coroot pairings to a geometric one-dimensional simple. |
| 2.2 | Chen14 proof of Theorem 5.0.6(1), pp.750–751, lines 1333–1361; GLX26 p.38, lines 1605–1608 | A fixed descended subobject is used. Hodge degree increases under specialization; the total degree is constant. The quotient-bundle rank formula explains upper semicontinuity with the correct direction. |
| 2.4 | GLX26 Theorem 5.8(2), pp.37–40, lines 1591–1711 | Decency, genericity, acceptability and HN irreducibility are retained. The argument tests every representation and every coefficient line, rather than just one faithful standard representation. |
| 3.1 | GLX26 Lemma 5.10, p.40, lines 1727–1736; Stacks 054L line 3743, 02GL line 3577, 03WT line 3611, 01UA line 2128 | The generalization to a nonempty smooth geometrically integral finite-type E-variety is justified by the given étale-chart argument. Quasi-compactness makes the étale field fibre a finite disjoint union; nonemptiness permits choosing a component. |
| 3.2 | GLX26 Proposition 5.9, p.40, lines 1712–1726; Theorem 5.2, p.32, line 1287; Serre79 §1.1 line 42 and Theorem 1, p.158, line 125 | HN irreducibility and the acceptable local datum are retained; no minuscule restriction is introduced. The Sen contract has algebraically closed residue field, as required by Serre's standing hypotheses. |
| 3.4 | MilneiAG Proposition 8.20/Corollary 8.21, p.131, lines 5283–5301; GLX26 Proposition 6.7, p.47, line 1991 | Commutator generation, image compatibility and connectedness support the route. The revised proof correctly uses the pinned derived-image input after algebraic closure, then centrality and dimension. |
| 3.5 | GLX26 Proposition 6.6(1), pp.45–46, lines 1920–1950; Proposition 6.7 crystalline step, p.47, lines 1991–2000 | The comparison is for specified lifted period data after reflex-field base change. The repaired mathematical route uses closure/derived containment and Sen openness; it never assumes the whole lifted image is derived or that the rational derived map is onto. |
| 4.2 | GLX26 Lemma 6.12, pp.50–51, lines 2142–2176 | The source uses an open-derived-image point and equivariance. The package states transitivity separately and otherwise restricts the conclusion to reached components. |

Also opened Chen14 lines 1008–1056 for the coefficient classification and strict Hom argument, lines 966–979 for the all-representations criterion, and GLX26 lines 2158–2171 for the torsor-orbit argument. Milne is a proof-route locator for §3.4, not a claim that its proposition literally states this complete central-lifting theorem. The source errors below are avoided by the package.

### Computed adversarial pass

The table covers all sampled targets, all headline groups, all changed mathematics and R01; with only 25 targets, it also records a row for every numbered target. Untouched elementary API cases additionally rely on the round-2 table only where that table contains computed values. No prose-only assurance was used as mathematical evidence. The values below were recomputed against the present formulas. Tests in positive characteristic apply to the elementary definitions, not to the characteristic-zero arithmetic theorems. All orbit cardinalities used as denominators are nonzero and every arithmetic period is positive.

| Statement | Instances tried | Values on both sides or negative control | Result; change |
|---|---|---|---|
| Conventions and supplier signs | Q_p(1); basic and ordinary GL₂, p=2,3 | Tate line: φ=p⁻¹σ and t_H=t_N=−1. For b=[[0,1],[p,0]], b²=pI, ν=(1/2,1/2), μ−ν=(1/2)α∨. Ordinary b=diag(p,1) has μ−ν=0. | Signs and strictness agree; retain. |
| 0.1 jump and API | Two jumps 2,−1; zero; F₂ | deg(e₁)=2, deg(e₂)=deg(e₁+e₂)=−1=min(2,−1). Zero lies in every step and has no jump. Over F₂, e₁+e₁=0 is excluded from the nonzero-sum inequality. | Retain. |
| 0.2 full-period sum | s=0,1; identity; two- and three-cycles | d₀=0, d₁=d; identity gives sd. Cycle (1,−1) has d₂=0 versus the wrong value 2. Cycle (2,0,−5) has d₂=2 and d₃=−3=2+(−5). | Retain, including empty index set. |
| 0.3 Newton–Hodge tested sets | Rank-one weights a,h; GL₂ diag(p,1); zero | Equations give k=sa and k=sh, hence membership iff these agree. e₁ gives (1,1), e₂ (0,0); e₁+e₂ is not a Newton eigenvector. Zero has no degree. | Retain nonzero set carrier. |
| 0.4 fibre functor; R01 | Unit; slope-1/2 block, s=2; φ=pσ; zero | Unit fibre rank=1; half-slope block φ²=pσ² gives Q_(p²)² of rank 2. Unnormalized fixed vectors for pσ have rank 0, normalized fibre rank 1. Zero fibre rank 0. | Mathematics retained; supplier label changes to Layer 1. |
| 0.5 coefficient classification/Hom | s=1; s=2 jumps (1,−1); wrong wrap; inadmissible projection | s=1 has t_H=t_N=k. At s=2, Σd_i=0=v_p(det swap); stable lines have t_H=−1≤0=t_N. Wrap p gives t_N=1≠0. In the inadmissible torus example projection changes degree 0→1. | Retain exact degree equality and admissibility for the Hom statement. |
| 0.6 all invariant lines | G_m, μ=m≠0; trivial pair; direct sums | Standard line is preserved by every scalar, so H=G_m, whereas vector fixing gives 1. For μ=0, b=1, lines in V⊕1 force the scalar to be 1. Individual powers of a faithful character have dimension 1; 1⊕χ has dimension 2. | Retain all representations and scheme-theoretic line stabilizers. |
| 0.7 ambient comparison | Trivial pair; nonzero cyclotomic power; frame h | Trivial pair: H=H_cris=1. Nonzero χ^(−m): both groups are G_m, dimension 1. Conjugation sends H to hHh⁻¹ and G_der to itself. | Retain full closure and ambient conjugation. |
| 1.1 generic filtration | GL₂ standard and determinant; nonnormal cubic torus | Standard Fil¹_gen=0, Fil⁰_gen=V: K(1,t)∩k²=0 for transcendental t, but the rational flag gives ke₁. Determinant jump=1. Cubic torus weights (1,0,0) give generic jump 0. | Retain; new §0.1 dependency is correct. |
| 1.2 threshold, both directions | Cubic E=Q₅(5^(1/3)); GL₂; trivial orbit | Refined orbit sizes (1,2), pairings (1,0), m_O=0: V_O occurs in Fil⁰ and not Fil¹. Gal(E/k)={1} would incorrectly give 1. GL₂ standard threshold 0, determinant 1. Repeating the singleton trivial orbit twice gives 2v≠v. | Corrected formula retained. |
| 1.3 orbit average | Sizes (1,2), pairings (0,3); cubic torus | min=0≤(0+2·3)/3=2; unweighted mean=3/2≠2. Cubic torus: degree 0≤threshold 0≤average 1/3. | Retain cardinality weights. |
| 1.4 Frobenius transport | Quadratic restriction-of-scalars torus; split G | (x,y) goes to (σ(y),σ(x)); e₁ moves to the e₂-factor. Split σ₀=1 fixes every factor; b alone preserves factors in both cases. | Retain. |
| 1.5 full-period bound and direction | G_m; basic GL₂; a three-cycle σ₀e_i=e_(i+1) | Rank one d₁=m=m. Basic GL₂ d₂=0≤0, while tested Newton exponent is 1. For λ=e₁, μ=e₂: ⟨σ₀λ,μ⟩=1=⟨λ,σ₀⁻¹μ⟩, but ⟨λ,σ₀μ⟩=0. Both full three-term sums are 1. | Retain inverse exponent and full-period reindexing. |
| 1.6 lowest Newton weight | GL₂ ν=(a,b), a≥b; torus | Newton exponent/s is a or b; lowest value b≤a,b. Torus has the equality ⟨χ,ν⟩=k/s. Zero has no occurring weight and is excluded. | Retain. |
| 1.7 strict positivity | SL₂ λ=n>0; ordinary GL₂; torus; λ=0 | SL₂ gives 0≤−cn, impossible for c,n>0. With c=0, 0≤0≤0 permits coroot pairing 1. λ=0 gives dimension 1; SL₂ λ=1 gives dimension 2. Empty root set has derived dimension 0. | Retain strict positivity and geometric simple. |
| 2.1 uniform descent; R01 | Unit; simple slope a/h; diag(p,1) | Unit stable lines have rational bases; simple coprime block has subobject ranks only 0,h. Diagonal p,1 has two slope lines descending to Q_p. Base extension preserves each rank. | Retain mathematics; correct the supplier label. |
| 2.2 Hodge semicontinuity | Fixed line L in a plane; whole/zero; square-zero control | At flag L, dim intersection=1 and quotient-map rank=0; elsewhere they are 0 and 1. Thus t_H(L) drops 1→0 at the generic point. Whole-plane t_H=1, zero=0. Multiplication by ε on k[ε]/ε² has geometric rank 0 but minor ε≠0. | Retain fibre-value assertion and scheme-theoretic rank loci. |
| 2.3 generic admissibility | Ordinary and basic GL₂; G_m | Ordinary slope-zero line at bad flag: 1>0; at generic flag: 0=0. Basic standard object total t_H=t_N=1 with no proper subisocrystal. Rank one is admissible iff h=m. | Retain; HN irreducibility is not needed here. |
| 2.4 generic derived monodromy | Basic versus ordinary GL₂; torus | Basic coefficient c=1/2 forces central tested weights, yielding SL₂ of dimension 3 in H°. Ordinary c=0 permits a slope-zero weakly admissible line and a reducible representation, so SL₂ containment fails. Torus derived dimension=0. | Retain HN hypothesis and all-representations criterion. |
| 3.1 generic field-valued points | P¹_E; n=0; algebraic coordinate | Transcendental t has kernel 0 in E[T] and trdeg 1; algebraic t has a nonzero kernel. At n=0, X=Spec E and K=FE; the empty parameter family has trdeg 0. The chosen étale component has positive finite degree. | Retain nonempty smooth geometric-integrality hypotheses. |
| 3.2 open-image point | Basic GL₂; finite field restriction; unacceptable norm-one torus | H contains dimension-3 SL₂; an open subgroup of H intersects it openly. Finite restriction gives finite index. For the torus with μ=0, κ=1 mod 2 gives 1≠0, so there is no admissible point. | Retain acceptability and strict-field Sen input. |
| 3.3 density | 1+pZ_p in G_m; SO₂ in O₂; diagonal compact subgroup | Infinite 1+pZ_p has closure dimension 1=dim G_m. SO₂ is open in O₂ but misses its second component. Diagonal compact subgroup has closure dimension 2<4=dim GL₂. | Retain connectedness and openness, including p=2. |
| 3.4 central lifting; repaired input | GL₂→PGL₂, J=GL₂, SL₂,T; det map | First two give derived dimension 3→3 with μ₂ kernel. Torus has image dimension 1<3. det with J=T has target derived dimension 0 but J misses SL₂ dimension 3: its kernel is not central. At Q_p-points diag(p,1) has nonsquare determinant and no SL₂ lift. | Retain theorem and new pinned inputs with algebraically closed value fields. |
| 3.5 z-extension, both directions | GL₂→PGL₂, p odd and p=2; G×G_m | SL₂ rational image has index 4 for odd p, 8 for p=2, so is open and proper. Extra central character has nontrivial determinant while derived openness is unchanged. Upward closure lifting and downward étale openness both apply to the specified period data. | Retain; no rational surjectivity claim. |
| 4.1 components and nonabelian stabilizers | ξ=1; C={1,diag(1,−1)}; finite transitive quotients | ξ=1 gives stabilizer 1. For g=[[1,1],[0,1]], gCg⁻¹ contains [[1,−2],[0,−1]], not in C even at p=2. Each transitive finite quotient descends to one connected cover, rather than one component per geometric point. | Retain cosets gC and conjugated stabilizers. |
| 4.2 repaired conditional headline | Trivial GL₂; Y a point; free extra summand; torus | Trivial GL₂ stabilizer dimension 0 is not open in SL₂ dimension 3; unipotents tend to 1. Point stabilizer is all G. Free summand has stabilizer 1, so needs the reached-component restriction. Torus derived group 1 is open in itself. | Prior R01 repaired; retain. |
| Revised topology contract | GL₂(Z_p), SL₂(Q_p); first congruence subgroup | SL₂ is cut out by det−1=0 and has the subspace topology. The congruence subgroup index in GL₂(Z_p) is (p²−1)(p²−p): 6 at p=2 and 48 at p=3. Both integral groups are compact open. | Native declarations supply the claimed input. |
| Revised build guide | Cross-layer dependency count | 1.1→0.1, 1.5→0.2, 1.6→0.3 give 3; reverse edges give 0. | Prior R02 repaired. |
| Declared supplier gaps | Split and cubic restriction-of-scalars groups; strict-field cyclotomic line; rank 0 | Split orbit size 1; cubic orbit size 3 gives a 3-dimensional k-module and three geometric lines. Strict-field cyclotomic closure is G_m, dimension 1; rank-zero image/closure are both 1. | Precise extensions, not unowned prerequisites. |

### Supplier resolution and ownership

The content main commit is `5fc1aa8f`. Read current open heads using `roadmaps show`, and searched by object with `roadmaps grep`, not just declaration names. File lines below refer to the README itself, excluding the tool's added header.

| Supplier | Files and sections actually resolved |
|---|---|
| PadicHodgeTheory, #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:682,705,754,894,1071`: §§3.3,3.4,3.6,4.4,5.5. Read the filtered degree/HN argument, group-valued functor, perfect-residue equivalence and period-torsor neutrality. Sen §4.4's finite-K zero-operator theorem is not the declared strict-field openness theorem. |
| Filtered-module suppliers, #879/#1312 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4582,4655` and `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:240`: carrier, invariants and exact-category API over general perfect residue fields. `FilteredPhiNModule.IsWeaklyAdmissible` is explicitly supplier notation at line 4659, not a nonexistent pinned declaration. |
| VectorBundlesAndIsocrystals, #1205 | `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:209,213,255,279,295`: Layer 1 and the four named inputs, including q-Frobenius, finite rank, algebraically closed residue and tensor/dual slope rules. Content matches; VB0 is the locator defect R01. |
| MotivesAndAlgebraicCycles, #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1116,1130,1149,1229`: §§6.1–6.3,6.8. Abstract neutral reconstruction, closed-immersion/subquotient criterion and fibre torsors with scalar extension and conjugation are present. |
| BunGAndNewtonStrata, #1241 | `TauCetiRoadmap/BunGAndNewtonStrata/README.md:374,399,450,509,693,1026`: §§1.7–1.9,1.12,1.23,1.43. Integral Kottwitz data, averaging, positive-period decency, dominant representative, acceptability and bounded z-lifting are present. |
| HeckeStacksAndLocalShtukas, #1252 | `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:1440,1486,1530,1580,1646`: HS2.11–13,15–16. Checked the μ↦μ⁻¹ conversion, finite-extension classical fibres, the Kottwitz condition, adjoint comparison, nonemptiness and the extra finite-level openness hypothesis for general transitivity. |
| ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:590,852,2446`: RG2.0.2,RG2.0.4,RG2.1.5. Smooth local-point maps are open, characteristic-zero smooth groups have analytic charts, Q̆_p has the stated Frobenius/transcendence property, and the z-extension has induced central torus and simply connected derived group. |
| ArithmeticGaloisRepresentations, #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:779,4861`: §§1.1,7.6. Continuous representations and closure/image/base-extension comparisons are present. The algebraically closed image comparison is applied after base change and descended, not interpreted as surjectivity on Q_p-points. |
| Flag/bundle/rank suppliers, #1038/#1069/#853 | `TauCetiRoadmap/ShimuraData/README.md:534` gives parabolicTypeVariety, projective over the field bases used here; `TauCetiRoadmap/AutomorphicBundles/README.md:533` gives associatedCoefficient; `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:976` gives rankLocus. The frame convention produces L from χ and L∨ from χ⁻¹. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:967,996`: §0.8 and etale_coordinates. Smoothness and relative dimension are explicit. |
| ReductiveGroups, main | `TauCetiRoadmap/ReductiveGroups/README.md:1030,1230,1262,1949,2253,4143`: Layers 1,2,3,6,7 and 10B. Representation/comodule, Lie/subgroup, derived structure, absolute root/Galois action and split highest-weight theory supply the listed objects. The quasisplit orbit gap is not already the split classification. |
| DiamondsAndVStacks, #820 | `TauCetiRoadmap/DiamondsAndVStacks/README.md:1058,5441,7082,8395,9035`: D0.6,D3.10,D5.3,D5.16,D6.5. Spectral clopens, locally profinite torsors, qcqs small cofiltered limits, the restricted quotient-component theorem and analytic étale comparison support §4.1. |
| DeligneWeightsAndPurity, #929 | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1092`: §2.2 is the symplectic special case of §3.3, as the scope paragraph says. |

Ownership searches covered generic/intersection filtrations, filtration jumps, full-period sums, coefficient fibres, crystalline monodromy, subisocrystals, central derived lifting and compact torsor components, in main, indexed open heads and the board packages. The native topology and derived-image statements are now imported. No package Lean declaration duplicates another fully qualified name because this file has no declarations.

Read the closest open scopes: #1511 `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:3,7` owns two-lattice Hodge structures and bi-analytic Ax–Lindemann; #2131 `TauCetiRoadmap/ReductiveGroupsPartIII/README.md:28` owns arithmetic conjugacy quotients and global tori; #1843 `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:3,7` owns integral displays and adapted lifts. Their constructions are different from the rational generic crystalline argument here. The other closest roadmaps are the resolved BunG, Hecke and PadicHodge suppliers. The board search's ScholzeFunctorAndModpCohomologyOfTheLubinTateTower match at README line 13 concerns a noncompact continuous-cohomology/Shapiro comparison, not component stabilizers.

The supplied overlaps report lists no conflicting head, dropped cited ID or revision-only citation. The manual resolution nevertheless detects R01: the existing subsection titles resolve, but their stated VB0 layer does not. There is no ownership handoff cycle, no duplicated target and no new revision dependency in the repairs. The board package index was read before absence checks. At their indexed heads, `packages/AnalyticNumberTheory/README.md:3` is an index to analytic-number-theory owners and `packages/LogicAndDefinabilityInNumberTheory/README.md:3,7` owns logic, definability and counting. Neither owns these constructions. The unavailable third board package is recorded below.

Both declared gaps have the same slug and precise needs in `design/plan.json` and README lines 55 and 109: `quasisplit-highest-weights` has supplier ReductiveGroups Layer 10/10B; `serre-sen-openness` has supplier PadicHodgeTheory §4.4. They are minimal missing extensions with the necessary field hypotheses, not demands to rebuild pinned results. They are not findings. After the locator repair, acceptance can remain conditional on those two contracts.

The prescribed dependency check returned:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The citation resolver also returned no unresolved names; its statement that it did not inspect Lake packages was handled by opening the pinned files directly. Its clean output is not substituted for the manual locator check.

### Pinned declarations and headline coverage

Pins read from the content manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

Opened these actual declarations and their hypotheses:

- `Mathlib/Algebra/Module/Submodule/Defs.lean:39`: Submodule extends additive and scalar-closure data; it supplies no exhaustion or separation.
- `Mathlib/RingTheory/WittVector/Isocrystal.lean:112,179`: Isocrystal adds a Frobenius-semilinear equivalence, not finiteness or a filtration. isocrystal_classification assumes algebraically closed residue and finrank 1.
- `Mathlib/RingTheory/AlgebraicIndependent/Defs.lean:53`: AlgebraicIndependent is injectivity of multivariable evaluation.
- `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:43,142`: Scheme.Hom.isOpenMap and UniversallyOpen.of_flat retain universal openness, flatness and local finite presentation respectively.
- `Mathlib/RingTheory/Etale/Field.lean:194`: Algebra.FormallyEtale.iff_exists_algEquiv_prod assumes EssFiniteType; the étale finite-type fibre used here gives the finite field factors.
- `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean:101`: exists_finite_subcomodule_exteriorPower_line_stabilizer requires a finitely generated defining ideal and compares every commutative value algebra, including nonreduced ones.
- `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188` and `Tannaka/GroupFunctor.lean:138`: fgPointTensorIsoEquiv and pointsFunctorIsoTensorAutFunctor reconstruct points of an already given Hopf algebra; they do not construct the filtered crystalline category.
- `TauCeti/Algebra/AlgebraicGroup/Derived/Basic.lean:69`, `Derived/Functoriality.lean:68`, `Derived/Connected.lean:153`, `Isogeny/Basic.lean:78`: derivedDefiningIdeal, derivedDefiningIdeal_map_le, connectedSpace_derived and IsCentralIsogeny match the README's contravariant-coordinate conventions. Connectedness uses an algebraically closed field and finite type; central isogeny means finite faithfully flat with central kernel.
- `TauCeti/Algebra/AlgebraicGroup/Derived/Image.lean:97,113`: mapPointsFunctor_derivedMap_app_surjective and faithfullyFlat_derivedMap have exactly the finite-type/injectivity/algebraic-closure/reduced-target hypotheses discussed above.
- `TauCeti/Topology/Algebra/PointTopology/Basic.lean:83,110`, `Group.lean:102`, `Functoriality.lean:110`, `IntegralPoints.lean:102,116`: topology, instTopologicalSpaceWithConv, isTopologicalGroup, isClosedEmbedding_comap_of_surjective, isOpenEmbedding_mapValue_integer and isCompact_range_mapValue_integer. No separation is required for the evaluation topology itself; T1 is required for the closed-embedding theorem. Finite type gives openness of integral points; the local-field assumptions give compactness.
- `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71`, `Representation/Comodule/Cat.lean:47`, `Parabolic/Basic.lean:82`: reductiveCommHopfAlgProperty, PointRepresentationCat and IsParabolicOverAlgClosed exist. The last is a smooth-subgroup/Borel-containment predicate, not represented G/P.
- `Mathlib/RingTheory/Grassmannian.lean:185` supplies the module Grassmannian functor and `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` supplies BDeRhamPlus. Neither supplies the reductive B_dR-affine Grassmannian and its admissible crystalline fibres. Object searches at these pins did not find the filtered crystalline or diamond carriers needed for the headlines.

All backticked identifiers attributed to suppliers were resolved as declarations or explicitly supplied roadmap notation. The package introduces no backticked own Lean declaration. Arithmetic formulas in code spans are mathematical notation, not undeclared API names.

The headline list in README line 7 is covered as follows:

| README headline | Suggested.lean docstring | Missing carrier at these pins |
|---|---|---|
| Generic admissibility, §2.3 | lines 10–19 | Represented Fl_μ and filtered G-isocrystals with weak admissibility and B(G) invariants. |
| Generic derived monodromy, §2.4 | lines 20–24 | The crystalline realization of that filtered pair and its B_cris comparison. |
| Open-derived-image period point, §3.2 | lines 25–31 | Admissible B_dR-affine Grassmannian and classical crystalline fibre. Rational-point topology is present. |
| z-extension comparison, §3.5 | lines 32–34 | Those period data for both groups and their lifting/comparison. |
| Components and stabilizers, §§4.1–4.2 | lines 35–48 | Diamonds, Spd K and locally profinite torsors over it. The conditional openness hypothesis is now explicit. |

No statable headline is omitted or replaced by a free predicate, scalar stand-in or boundary theorem. Supplying the missing categories and period geometry would be substantial construction, not a few simple definitions on native carriers.

Ran `lake env lean` on the package's Suggested.lean from the pinned content checkout: **exit 0, no output and no warnings**. It has one `import Mathlib`, one module docstring and the required namespace. It has **0 sorried theorems and 0 declarations**. Thus the exhaustive one-tactic padding probe has 0 candidates, and the `#check @name` signature/binder audit has 0 candidates; there is no declaration on which a section hypothesis can be lost. No Tau Ceti import required building. No Lean process remains running. No authored package file was changed.

## Not verifiable

- The published GLX26 version was not opened. All mathematical locators explicitly use the readable arXiv v3 text, so no assertion here depends on published numbering.
- `packages/LawrenceVenkateshMethod/README.md` at the board-index head `9ee7ac3`, board pull request #345, returned HTTP 404. Ownership against that unavailable package could not be checked. The other indexed board package heads were read.

All five cited texts were available from the supplied legal source cache. There is no missing-reference request. No suspicious instruction in fetched data was followed.

## Source issues

- **Misprint** in Chen14 at Lemme 3.3.5, p.744: the source says the underlying object is a sum of coefficient-field lines; it should be a sum of K₀-lines carrying the indicated coefficient action; affects nothing.
- **Error** in Chen14 at Proposition 3.3.4(2) and Proposition 3.3.6(2), pp.743–745: the source says individual mixed powers of one faithful representation suffice for the line criterion; it should allow finite sums, or use all representations as in part (1); affects a stated result.
- **Error** in GLX26 at Proposition 5.7 and equation (5.29), pp.36–38: the source says reflex-field automorphisms index the refined weight components; it should use all distinct Γ_E-orbits inside the Γ_k-orbit, with cardinality weights for averages; affects a stated result.
- **Gap** in GLX26 at Proposition 6.7, step (4), p.47: the source says openness transfers for a lifted image lying in the derived group; it should first establish derived containment of the lifted closure and apply Sen openness; affects the proof.

The numerical witnesses are respectively the rank-s coefficient model, G_m with faithful χ and the trivial pair, the cubic torus with refined pairings (1,0), and a GL₂ crystalline lift with nontrivial cyclotomic determinant. The package corrects all four. The positive versus negative Frobenius exponent is harmless after summing a full period; no error in that full-sum identity is asserted. The different full-versus-neutral monodromy terminology alone is not evidence of a false crystalline result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "303c17e9089901340713beb0c25b3b10c79a927f", "job": "REV-PKG-PadicHodgeTheoryPartII~3", "model": "gpt-6-astra", "worker": "chris-6"} -->
