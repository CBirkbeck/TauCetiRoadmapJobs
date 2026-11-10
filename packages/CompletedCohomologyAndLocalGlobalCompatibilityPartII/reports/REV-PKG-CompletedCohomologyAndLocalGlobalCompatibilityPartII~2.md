# Review of CompletedCohomologyAndLocalGlobalCompatibilityPartII (package, round 2)

**Verdict:** needs changes

Two P3 locator findings; no P1 or P2 finding. The previous three requested repairs are present. The package and its sources were not edited. The findings below concern two precise citations, not the mathematical endpoints.

## R01 (P3) — The completed-action declaration is at line 322, not 344

**Location:** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:41`: “`TauCeti.IsCompactModule.completedGroupAlgebraModule` in the adjacent `Module.lean`, line 344”.

**Claim:** The named completed group algebra module structure is located at the cited line of the pinned library.

**Witness:** `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:322` defines `completedGroupAlgebraModule`; line 344 finishes the proof of `isScalarTower_completedGroupAlgebraModule`, whose statement starts at line 340.

**Exact repair:** Change “line 344” to “line 322”. If scalar compatibility is also to be cited, name `TauCeti.IsCompactModule.isScalarTower_completedGroupAlgebraModule` separately and cite line 340. The repair report's observation that line 344 proves scalar compatibility does not locate the different declaration named in the README.

**Verification of repair:** At the pin, line 322 has type `Module (completedGroupAlgebra R Γ) M`; line 340 has type `IsScalarTower R (completedGroupAlgebra R Γ) M` after introducing that module structure. The corrected locator selects precisely the first object promised by the sentence. No mathematical hypothesis changes.

## R02 (P3) — The smooth-type dimension formula is Lemma 3.21

**Location:** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:294`: “simple-type dimensions and counts are Lemma 3.20 and Proposition 3.25”.

**Claim:** EP Lemma 3.20 supplies the dimensions used in the smooth-capture growth calculation.

**Witness:** EP line 844 states the two invariant-space conclusions of Lemma 3.20. EP lines 848–850 state the dimension formula in Lemma 3.21, printed p. 356.

**Exact repair:** Replace the quoted clause by “simple-type invariant spaces, dimensions and counts are Lemmas 3.20–3.21 and Proposition 3.25”. This retains the invariant-space input and locates the dimension input correctly.

**Verification of repair:** For rank one, E=F, m=1 and n=4, the groups in the construction are J²=H²=U_E², so dim η=1 and dim V=1. Lemma 3.21 gives `(U²:U³)/(U_E²:U_E³)·1=q/q=1`. Lemma 3.20 instead gives dimensions 1 and 0 for the U⁵- and U⁴-invariant spaces. The replacement cites both different facts where used. Exact-depth counts at inadmissible n remain the source issue recorded below; the roadmap's cumulative criterion is valid.

## Verified sound

### Finding-by-finding verification of the previous repair

The earlier review is `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/reports/REV-PKG-CompletedCohomologyAndLocalGlobalCompatibilityPartII.md`; the repair report is the adjacent `FIX-PKG-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2.md`.

| Earlier finding | Repaired passage | Status and independent check |
| --- | --- | --- |
| F01, obsolete pin hashes | README:33: “Every file and line below is taken at the pinned Mathlib of the content checkout.” README:41 has the analogous Tau Ceti wording. | **Repaired as raised.** No obsolete hash remains. `lake-manifest.json` pins Mathlib at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti at `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The four corrected Mathlib lines 869, 871, 895, 901 are correct. Reopening all remaining library citations found R01, a different locator error retained by this repair. |
| F02, period inside a declaration name | README:375 and :383 now cite “Mathlib `Module.annihilator_eq_bot`.” | **Repaired.** The name is present at `Mathlib/RingTheory/Ideal/Maps.lean:901`; no backticked occurrence with a trailing period remains. |
| F03, factor-flatness attributed to suppliers that did not state it | README:191: “Hence R∞ is reduced and O-flat.” README:193: “for O-flatness, dimension and component pairs”. README:11 likewise says “The O-flatness, dimension and component-pair theorems”. | **Repaired.** LocalGaloisDeformationRings §F.0.1 and DeformationAndDerivedPatchingAlgebra §4.6 supply exactly these retained assertions. No “flat over R□” clause remains in the README. §§4.1–4.2 use contraction of minimal primes, and §5.1 uses O-flat test quotients, so the deletion loses no consumed result. |

The frozen non-gap statement in `design/plan.json` still has the deleted factor-flatness clause, as the repair report discloses. The package-stage rule forbids editing that statement; the package README is authoritative. This is not a requested repair or a re-raised finding. None of the prior findings was marked not actionable.

### Principles, coverage and shape

I read all 21 target subsections and their Checks and Needs lines, the conventions, all supplier contracts, the summary and downstream promises. The earlier review's computed rows were used only as corroborating evidence for unchanged material; the 15 seeded targets, changed passages and all seven headlines were checked again. The table below records the actual instances used, including the two findings. No source text was copied into the package or this report.

The continuation begins exactly where the parent stops: construction, type-specialised support and the union-of-components theorem are imported; arbitrary-residual local component detection and the density endpoints belong here. There is no re-planning, computational algorithm, unowned prerequisite outside the declared contracts, or route-specific weakening. The patched results retain their genuine p∤2d hypothesis; crystalline and benign density have the separate all-prime route. No forbidden supplier is cited.

The six layers are named by their mathematics. Their order serves point predicates, component and capture inputs, local faithfulness, the testing criterion, and density applications. It is not a sequence of source chapters: notably the BIP density theorem is placed after its component/faithfulness inputs, and the fixed-centre analytic argument uses DPS and EP. Independent branches have their own Needs lists. The parent imports do not depend on this continuation.

README shape was compared with `TauCetiRoadmap/ClassFieldTheory/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` on main. The package has Summary, Scope, Conventions, Exact supplier contracts, How to read, six Examples endings, six Dependencies endings, Downstream consumers, Worked examples and References. The new point-set/testing constructions in §§1.1, 3.2, 6.2 and 6.4 have API lists and respectively 5, 8, 4 and 5 Checks. Imported capture and the component theorem also have discriminating Checks. All theorem subsections state hypotheses and locators; R02 corrects one auxiliary locator. There are no job IDs, pull-request references, machine paths, HTML anchors, LaTeX delimiters, algorithms or process hand-offs in the roadmap text. All backticked identifiers were classified: library names resolve, while the remaining spans are mathematical notation or file names; no undeclared name is presented as a declaration of this roadmap.

### Seeded source verification

All fifteen sampled targets were read in the supplied legal cache, comparing theorem number, printed/version page, hypotheses and the actual assertion. No author-flagged unverified locator was found. All twelve cited works have exactly one manifest key: BIP, EP, CEGGPS, EG, DPS, ST, NAK, HP, BIPD, IYE, DEJ, CON. No fetch or manifest change was necessary. Published versus preprint pagination is identified in References and the manifest.

| Target | Text opened and conclusion |
| --- | --- |
| §1.2 | EG lines 193–196, Theorem 1.2.2, p. 3; lines 6946–6965, Definition 6.4.2 and Theorem 6.4.4(1), pp. 168–169; BIP lines 2329–2335, p. 46. Regular crystalline potentially diagonalizable lifts exist for every residual representation after finite coefficient extension. Only their use in CEGGPS patching needs p∤2d. |
| §2.1 | BIP lines 2339–2360, Lemma 6.3, p. 47. The auxiliary ring is complete local, reduced, O-flat and equidimensional; component pairs require a splitting extension. CEGGPS lines 3304–3324, Appendix A, pp. 82–83, and HP lines 2680–2759, Lemmas A.1–A.5, pp. 48–50, support the stated tensor/splitting contracts. |
| §2.2 | BIP lines 2364–2378, Lemma 6.4, p. 47. Triviality on the torsion subgroup and a finite coefficient extension are retained; the Teichmüller part and principal-unit roots give the full continuous character, including p dividing d. |
| §2.3 | BIP lines 2396–2412, Lemma 6.6, p. 48. The compact central character is δ⁻¹, with cyclotomic exponent d(d−1)/2; crystallinity gives the algebraic restriction. Fixed-centre projectivity is imported from the parent and CEGGPS Corollary 4.26. |
| §3.1 | EP lines 266–354, Definition 2.1 and Lemmas 2.2–2.10, pp. 342–344. Common-kernel capture and the scalar-action consequence agree; zero tensor factors are expressly excluded. |
| §3.2 | BIP lines 2413–2418, p. 48; EP lines 369–377, Proposition 2.11 proof, p. 345. The double Schikhof dual and rational lattice independence agree. Extension from K to finite-index H is justified by the displayed continuous induction comparison and the finite presentation, rather than by treating a nonsmooth test as smooth. |
| §3.3 | EP lines 532–607, Proposition 2.23, pp. 349–350; lines 657–749, Propositions 3.7, 3.11, pp. 352–354; lines 783–928, Propositions 3.19, 3.26, pp. 355–358. Torsion-free H, the power-compatible filtration, distinct absolute irreducibles, coefficient descent and nonzero tensor factor are retained. R02 corrects the dimension locator. The cumulative growth statement survives the source's exact-depth counting error. |
| §3.5 | BIP lines 2432–2446, Lemma 6.7, p. 49; DPS lines 1981–1997, Corollary 7.8, p. 43. Nonzero projectivity and algebraic central character are retained; arbitrary integer central exponents are realised by highest weights, not just determinant powers. |
| §4.1 | BIP lines 2448–2461, Theorem 6.8 proof, p. 49, compared with parent §5.3. The README repairs the source's unsupported containment of an entire test support in one component: it selects a component through a characteristic-zero point, where χ is unique. |
| §5.1 | EP lines 320–399, Lemmas 2.7, 2.10, Proposition 2.11 and Remark 2.13, pp. 344–346; BIP lines 2462–2476, pp. 49–50. Reduced O-flat faithful testing quotients are a sufficient specialization of the density argument. The nonfaithful version retains Σ⊆V(Ann M∞). |
| §5.3 | BIP lines 2294–2312 and 2480–2482, Theorem 6.1 and proof, pp. 46, 50; EP lines 1126–1164 and 1202–1209, Theorems 5.1 and 5.3, pp. 363–365. Weight is fixed, smooth conductors vary, and the ambient conclusion is scheme density. |
| §6.1 | BIP lines 2313–2316, Remark 6.2, p. 46; NAK lines 1356–1418, Lemma 4.2, pp. 120–122; BIPD lines 428–440, proof of Theorem 4.2, p. 10; EP lines 1320–1336, Definition 6.8 and Proposition 6.9, p. 368. NAK's framed local argument supplies benign points in admissible neighbourhoods; the all-residual/all-prime extension is expressly a supplier contract, not silently attributed to NAK's standing unframed setup. |
| §6.2 | CEGGPS lines 1651–1663, Theorem 3.7, p. 41, and lines 1950–1952, coefficient model in §3.13, pp. 48–49; EP lines 618–621, Corollary 3.2, p. 351. Recognition includes N=0 and a nonzero K-type; the latter is required for capture. |
| §6.3 | BIP lines 2313–2314, Remark 6.2, p. 46, plus the preceding CEGGPS and EP inputs. The argument fixes τ, varies every regular weight and uses local faithfulness only in its p∤2d range. |
| §6.5 | EP lines 753–843, Definition 3.12, Lemma 3.16 and Proposition 3.19, pp. 354–356; lines 899–928, Proposition 3.26, p. 358; lines 1116–1125 and 1202–1209, pp. 363–365. The extension must contain a minimal element; the chosen deep family requires n>2m and torsion-free U^(m+1). The induced-character recognition is used only for tame E. |

Additional source reads covered BIP Corollaries 3.38, 4.19, 4.21–4.22 (lines 1290–1301, 1996–2022), BIPD Propositions 2.6–2.7 and Corollary 2.8 (lines 243–317), EG Theorem 6.3.2 (lines 6816–6828), BIPD Theorem 3.3 and Lemma 5.1/Corollary 5.2 (lines 328–354, 441–465), IYE Definition 5.8 and the component argument (lines 1012–1042), ST Lemma 2.1/Corollary 2.2/Theorem 2.3 (lines 349–383, 443–447), DEJ Lemma 7.1.9 (lines 2553–2560), CON Theorem 2.3.1 and its flatness hypothesis (lines 1053–1070), and DPS Corollaries 7.5–7.8 (lines 1931–1997). Source errors are recorded below; the package does not inherit their false conclusions.

### Adversarial computations

The standing universe excludes d=0, q=1, equal-characteristic coefficient fields and noncompact H. O is the ring of integers in a finite extension of ℚ_p, so denominators inverted in rational tests are nonzero; p and ϖ have the same localization, not necessarily the same quotient. Empty families, zero tests, square-zero thickenings and nonfaithful actions were tested where admitted. The values below are calculations, not claims that elaboration proves the mathematics.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: weight and dual | d=2, k=(2,0), then k=(1,0) | a=(1,0), dual highest weight (0,−1); then a=(0,0), weight (0,0). Undualised first weight would be (1,0). | Agrees with CEGGPS and parent §5.2. | none |
| Conventions: reciprocity, central action and r_p | d=2, F=ℚ₅, ψ=1, u=2; d=1 | Exponent d(d−1)/2=1; geometric δ(2)=2, arithmetic value 1/2; compact scalar 1/2 gives dual scalar 2. Twist exponent −1/2 on diag(ϖ,1) gives q^(1/2); rank one exponent 0 gives 1. | Both inverse conventions distinguished. | none |
| §1.1 point predicates | rank one; rank-two Steinberg; coefficient embedding | Rank one: induction dimension 1 and N=0, giving Σspcd=Σprnc=Σ_k. Steinberg N≠0 excludes both subsets. Injective residue-field embedding preserves kernel exactly. | Predicates and coefficient transport agree. | none |
| §1.2 PD lift | rank one; p=d=3 | One crystalline character is already a one-summand diagonal lift. At p=d=3, 2d=6 and 3 divides 6; the lift remains available, patched endpoints do not apply, local crystalline density does. | No implicit good-prime extension. | none |
| §2.1 retained tensor assertions | A=O; A=O[[u]]; A=O[[x]]/(x²−ϖ) | Products are R, R[[u]], and a rank-two free R-module respectively. Last factor is one DVR component before extension; after a²=ϖ, factors x−a and x+a are distinct since 2a≠0. | Reduced/O-flat conclusions and splitting match suppliers; deletion of factor-flatness is harmless. | prior F03 repaired |
| §2.1 component indexing | A=O[[u,v]]/(uv); geometric domain A | Two quotients O[[u]], O[[v]] give two pairs per χ; geometric domain gives one pair per χ. For two factors of dimensions 1+r and 1+s, tensor dimension is 1+r+s=(1+r)+(1+s)−1. | Component and dimension formulas agree. | none |
| §2.2 roots | d=1; d=p, ψ(γ)=1+p; order-two t, ψ(t)=−1 | η=ψ; b^p=1+p with b≡1 gives b^x on ℤ_p; for t²=1, η(t)²=1≠−1, prohibiting a square root without the torsion condition. | Hypothesis and finite extension essential. | none |
| §2.3 central specialization | d=1, ψ=1; d=2 as above | d(d−1)/2=0 and δ=1 in rank one; in rank two compact/dual scalars are 1/2 and 2. | Correct character direction. | none |
| §3.1 capture and scalar detection | H=1, M=O; empty family; M=O/ϖ; C₃ at p=5 with nontrivial χ; ℤ/4 on ℤ/2 | Inclusion O→L has kernel 0; empty kernel intersection is M; every map from O/ϖ to a characteristic-zero vector space is 0; Hom_C₃(O(χ),L)=0; scalar 2≠0 acts by 0 on ℤ/2. | Capture, torsion and faithfulness distinguished. W=0 gives kernel O, so nonzero tensor factor needed. | none |
| §3.2 tests and continuous induction | regular M, index n=2, dim V=1; K=ℤ₅×, H=1+5ℤ₅, χ(u)=u; V=0 | Hom dimensions 2=2 in first case, 4=4 in second, and 0=0 for zero test. χ is nontrivial on every open subgroup, so a smooth-induction substitute fails. For S₃ with H=C₃ and dim V=1, the same coset calculation gives 2=2. | Both induction directions, finite topology and nonsmooth case retained. | none |
| §3.2 duality and reducedness | M=O/ϖ; M=O² with B=O[[x]] acting through B/(x²); lattice Θ→ϖΘ | First test is 0; second is M and Ann_B=(x²), with x≠0 and x²=0 in the faithful quotient. Multiplication by ϖ becomes invertible after rationalization. | General tests do not assert reduced faithful quotients; arithmetic supplier is necessary. | none |
| §3.3 numerical capture | d=1,2 principal families; anisotropic ℤ_p²; tame e=2 minimal family | d=1: q^n·1=q^n. d=2: q^(2n)·(q^n)²=q^(4n), matching index exponent 4n. Anisotropic filtration gives p^(2n) coinvariants versus predicted p^(3n/2). For e=2 even n gives zero minimal elements; odd depths have gaps 2, so cumulative sums still have the required growth. | Power-compatible filtration and cumulative count matter. | R02 |
| §3.3 dimension locator | rank one, m=1,n=4 | J²=H²=U_E²; dim η=1; Lemma 3.21 gives q/q=1. Lemma 3.20 gives invariant dimensions 1 at U⁵ and 0 at U⁴. | Different lemmas supply different inputs. | R02 |
| §3.4 fixed-centre density | trivial group, Π=L, T=L²; T=0; H=PGL₂(ℤ₂) | Evaluation L²*⊗L²→L has source dimension 4, image dimension 1, kernel dimension 3. T=0 gives image 0. PGL₂(𝔽₂)=S₃ has 6 cosets and 6 independent indicators. | Density, not injectivity, is claimed; nonzero T excludes the bad case. | none |
| §3.5 algebraic detection | d=1; d=2 central exponents ±1 | Rank one uses θ. Weights (1,0) and (0,−1) have sums 1 and −1; det^m has sum 2m and misses odd exponents. (−1,0) is not dominant. | API realises every integer central exponent. | none |
| §4.1 component through a point | L[x,y]/(xy); two auxiliary components | (1,0) lies on V(y) alone; origin lies on both axes. Choosing (χ,p₁) for each χ meets all local components but only half of the pairs when A has two components. | Correct repaired route; no full-support claim over R∞. | none |
| §4.2 local faithfulness | reduced ring; B=O[[x]]/(x²); ℤ acting on 0 and ℤ/2 | Intersection of minimal primes is 0 in reduced R; in B it is (x)≠0. Annihilators of 0 and ℤ/2 are ℤ and 2ℤ, respectively, and neither action is faithful. | Reducedness and the pinned annihilator criterion do real work. | prior F02 repaired |
| §5.1 density criterion | O[[x]]/(x²); O[[x]]/(ϖx); N=0; R=M=O | Nilpotent x vanishes at all generic points but is nonzero; in the reduced second ring x becomes 0 after inverting ϖ. Zero test has unit annihilator and empty spectrum. The O-point's generic prime is (0), whose closure is Spec O. | Both reducedness and O-flatness necessary; empty case consistent. | none |
| §5.2 crystalline density | p=2,F=ℚ₂,d=1, trivial residual; d=2 | μ₂∞={±1}: two components. x↦x^n has value (−1)^n and residual value 1. Rank-two weights (1,0) and (2,0) give regular direct sums with determinant at −1 equal to −1 and +1. | Both components met at an excluded patched prime, using local route. | none |
| §5.3 principal-series density | d=1; fixed τ and fixed weight | On ℤ_p, characters of order dividing p^n number p^n. At weight zero and trivial type the inertia character is 1, while varying weights includes nontrivial algebraic inertia. | Fixed-weight varying-type family differs from a single fixed-type quotient. | none |
| §5.4 supercuspidal density | d=1; unramified quadratic E/F | Ind dimension is 1 in rank one. For ψ=χ∘N, induction is χ⊕χη and End dimension 2; for ψ and ψᶜ distinct, End dimension 1 and induction is irreducible. | Irreducibility condition discriminates the sets. | none |
| §6.1 benign density | rank one; rank two eigenvalues 1,p with f=1; zero test | No eigenvalue pairs in rank one: all crystalline points benign. Rank-two ratio p violates the exclusion p^f=p. Zero test support is ∅. | Benignness is stronger than regular weights; closure argument uses admissible neighbourhoods. | none |
| §§6.2–6.3 prescribed type | W=0; trivial τ; rank one, μ of order p^a | W=0 gives J=R and V(J)=∅. Trivial type with all weights gives J=0. Multiplying a fixed type by σ(z)^n for n mod p^a gives all p^a torsion characters. For a=0 there is exactly one. | Nonzero type, varying weights and determinant components consistent. | none |
| §6.4 minimality and deep subset | total ramification; e=1; e=6,f=2 over ℚ₅; p=3,d=1,F=ℚ₃(ζ₃) | Uniformizer valuation 1 has gcd(e,1)=1 and residue degree 1. For e=1, residue of ϖ^nα is ξ̄. Sixth powers in 𝔽₂₅× have order 24/6=4 and lie in 𝔽₅×, so generate no quadratic residue extension. Shallow character has depth 1; permitted m≥1 requires n≥3, where it is trivial. | Minimal-element hypothesis and strict deep-subset inclusion verified. | none |
| §6.5 minimal-stratum density | p=5,d=2,E=ℚ₅(√5); p=3,d=3; d=1 unramified character | e=2,f=1, gcd(2,1)=1, 5∤4; tame case applies. Wild cubic has 3 dividing 2d=6, outside theorem. Rank-one unramified character has depth 0 and no positive stratum, though it belongs to Σspcd. | Deep density implies larger-set density by inclusion, not equality. | none |
| Native action locator | pinned `Module.lean` lines 322,340,344 | At 322 output is a Module structure; at 340 output is an IsScalarTower proposition; 344 is its final proof term. | Named object exists, locator wrong. | R01 |

The algebraic witness for the repaired §2.1 also handles ramified coefficients: for O′=O[a]/(a²−ϖ), the two distinct generic factors remain distinct even at p=2 because characteristic zero gives 2a≠0. Reducing first would merge them; the component argument correctly chooses a characteristic-zero point.

### Library and Lean acceptance-test audit

The following pinned declarations were opened, with their hypotheses, rather than relying on the resolver. Repository-relative library paths are used here.

| Pinned file | Declarations and lines | Semantic check |
| --- | --- | --- |
| `Mathlib/RingTheory/Ideal/Maps.lean` | `Module.annihilator` 869; `Module.mem_annihilator` 871; `Module.comap_annihilator` 895; `Module.annihilator_eq_bot` 901 | Kernel of the scalar representation; contraction includes Algebra and IsScalarTower; faithful-action equivalence includes Ring and AddCommGroup. |
| `Mathlib/Algebra/Module/Submodule/Ker.lean` | `LinearMap.ker` 59; `LinearMap.mem_ker` 63 | Kernel is comap of bottom; membership means f(x)=0. |
| `Mathlib/Algebra/Group/Action/Faithful.lean` | `FaithfulSMul` 47 | Equality of scalar actions on every point implies equality of scalars. No faithfulness follows from compactness alone. |
| `Mathlib/Algebra/Module/Submodule/Lattice.lean` | `Submodule.mem_iInf` 238 | Membership is the universal family of membership conditions, including the empty family. |
| `Mathlib/RingTheory/Spectrum/Prime/Basic.lean` | `PrimeSpectrum.zeroLocus` 137; `PrimeSpectrum.vanishingIdeal` 157; `PrimeSpectrum.zeroLocus_eq_univ_iff` 302 | Vanishing ideal is an intersection of primes. The last criterion is containment in the nilradical, not equality to zero without reducedness. |
| `Mathlib/RingTheory/Spectrum/Prime/Topology.lean` | `PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure` 159 | Zero locus of the intersection equals topological closure. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` | `TauCeti.completedGroupAlgebra` 145 | Inverse-limit carrier with its native algebra structure, not an arithmetic patching construction. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean` | `TauCeti.IsCompactModule.completedGroupAlgebraModule` 322; scalar tower 340; continuity 348 | Takes the compact-module witness and continuous commuting group action. It supplies no projectivity or fixed-central-character category. R01 corrects its README locator. |

Object searches in both complete pinned source trees for framed deformation rings, patched modules, potentially crystalline/semistable representations, Weil–Deligne objects, benign points and Berthelot generic fibres found no carriers for these headlines. The Berthelot hits are references in divided-power algebra files, not a rigid generic-fibre functor. Generic spectra, annihilators, completed group algebras and algebraic group foundations do exist, and are imported rather than restated. The existing abstract topological and representation carriers alone do not turn a universal arithmetic deformation ring or a patched module into a few simple definitions.

The seven README headlines and their Lean disposition are:

| Headline | README | `Suggested.lean` disposition |
| --- | --- | --- |
| Unrestricted local faithfulness | §4.2 | Named in module docstring; lacks the universal framed local ring and actual patched module/actions. |
| Regular crystalline density, all primes | §5.2 | Named; lacks arithmetic points and crystalline predicate, plus rigid generic fibre for the rigid conclusion. |
| Fixed-weight potentially crystabelline density | §5.3 | Named; additionally needs the p-adic Hodge and local Langlands/type interfaces. |
| Fixed-weight unramified-induced supercuspidal density | §5.4 | Named; additionally needs Weil–Deligne and inducing-field predicates. |
| Benign density, all primes | §6.1 | Named; lacks benign crystalline/refinement objects. |
| Density for every prescribed inertial type | §6.3 | Named; lacks inertial types and their arithmetic occurrence predicate. |
| Fixed-weight minimal-stratum density | §6.5 | Named; lacks the simple-stratum and occurrence objects. |

`Suggested.lean` has one `import Mathlib`, one module docstring, the required namespace, zero definitions, zero theorems and zero examples. Consequently the one-tactic padding probe has **0 sorried declarations to probe** and the `#check @name` binder comparison has **0 declarations to compare**; no substitute theorem or lost binder is hidden by that count. No sorry'd data, options, extra imports or padding appear.

The required `lake env lean` invocation on `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/Suggested.lean`, run in the pinned content environment, exited **0 with no output or warnings**. No Tau Ceti import needed an object-file build. No additional Lean build was run, and no Lean process remains running.

### Supplier resolution, gaps and order

Every cross-roadmap reference was reopened through `roadmaps show`, using main for existing main roadmaps and the indexed open head for new roadmaps. The file/line witnesses below refer to the README at that head, not to a remembered prior version.

| Supplier | Resolved sections and file witnesses |
| --- | --- |
| CompletedCohomologyAndLocalGlobalCompatibility, PR #1270 | `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:1852` (§5.1, patching and central projectivity), :1907 (§5.2, reduced O-flat faithful typed rings), :1941 and :1956 (§5.2a, framed trianguline and benign geometry), :1966 (§5.3, support union). The existing theorem does not claim full R∞ support merely from local irreducibility. |
| LocalGaloisDeformationRings, PR #923 | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:98` (§F.0.1, O-flat products and component pairs); :1275 (§1.1); :1549 (§1.19, character ring); :2240 (§3.1); :2291 (§3.4); :2387 (§3.9). Unrestricted arbitrary-rank BIP normal components remain the declared gap, not supplied by the fixed-type rings. |
| DeformationAndDerivedPatchingAlgebra, PR #1034 | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:281` (§1.12); :943 (§4.4); :990 (§4.6); :1005 (§4.7). Tensor component pairs retain geometric integrality; integral point detection retains reducedness and O-flatness. |
| CompletedCohomologyPartII, PR #1035 | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:183`, :201, :241, :786 resolve §§F.1, F.2, F.4, 3.2. Schikhof duality is qualified by torsion-freeness and the two dual topologies; compact tensors and analytic vectors are separate interfaces. |
| PadicLocalLanglandsForGL2Qp, PR #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`, especially :228, supplies §0.1's general p-adic Lie group analytic-vector density; :1122 is §3.6a's rank-two crystalline density and coefficient descent. |
| SmoothRepresentationsOfLocalGroups, PR #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1916`, :2571, :2710, :3840 resolve SR.2.1, SR.3.1, SR.3.2, SR.5.2. The maximal distinguished types at :3886 use simple strata, but do not state the three finite-coefficient EP/CEGGPS families requested by the contracts. |
| EndoscopicTransferAndUnitaryTraceComparison, PR #999 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4013`, :4125, :4208 resolve §§10.21, 10.26, 10.30. They retain the full WD monodromy and geometric normalization; the target transports to the CEGGPS r_p convention. |
| ModularityAndLanglandsExtensions, PR #1180 | `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:776` is §2.1, potential diagonalizability and its criteria. It does not supply the two universal lift-existence results, correctly declared as gaps. |
| ArithmeticGaloisRepresentations, PR #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:995`, especially :997–1030, supplies §1.3 continuous finite-index induction with right translation, both reciprocities, duality and the finite-transversal topology. |
| PadicHodgeTheory, PR #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:682`, :705, :732, :754 resolve §§3.3–3.6. The character classification and lift at :762–764 explicitly include the residual unramified factor. |
| ClassFieldTheory, main | `TauCetiRoadmap/ClassFieldTheory/README.md:267` maps former §2.6 to Conventions C.6, at :531. Layers 7 and 9 begin at :1204 and :1576. Thus the old §2.6 citation remains valid; the arithmetic-to-geometric inversion gives 1/2 versus 2 at u=2 over ℚ₅. |
| ReductiveGroups, main | `TauCetiRoadmap/ReductiveGroups/README.md:1949` (Layer 6, with characteristic-zero complete reducibility at :1977–1991) and :4143 (§10B, highest weights, absolute simplicity and coefficient transport). |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:909` (§1.7) uses the same native completed group algebra; the pseudo-compact projective decomposition is separately contracted. |
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:7714`, especially :7743, is §R2.9's Berthelot functor on FS_C. The arithmetic point/completion and normalization-component comparisons are separately contracted. |

The thirteen gap slugs match exactly between the README contracts and `design/plan.json`; their needs sentences also match, apart from harmless braces around ρ̄. Each has a named earlier supplier and a mathematically specified coefficient/rank setting. None has supplier `none`. The missing part of the tensor contract is reducedness, not a request to rebuild the already supplied dimension formula. The simple-character background of `minimal-stratum-types` is consumed from SR.5.2 as the Scope says; the required extension is the EP deep family with finite coefficient models and its exact occurrence recognition. No second owner of that extension was found. Local all-prime benign/component geometry is stronger than the parent's patched-range statement, hence those contracts are not redundant with it. These contracts were treated as declared prerequisites, not as defects merely because they await supply.

The dependency check was run with the requested name, order, movable and content arguments. Exact output:

```text
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. `roadmaps resolve` found no cross-roadmap citation or Lean name nowhere. Its tool report says it did not inspect pinned Lake packages; the independent pinned-file checks above supply that missing verification. Every Needs line was also read manually, including the alternate local route in §§5.2 and 6.1.

### Duplication and open-work audit

The board-package index was read before searching. The supplied overlap report lists no conflicting head, dropped cited ID or ID defined only by an open revision. ClassFieldTheory's old §2.6 is preserved by its explicit numbering map, so it is not drift.

Object searches used `roadmaps grep` over main and indexed open heads, plus the pinned library searches described above. The nearby roadmaps were read at their heads:

- PR #1270 owns the parent patching, typed modules, trianguline carrier and support union, at the cited §§5.1–5.3; this package imports those objects and extends to local component detection and general density.
- PR #1312 owns the rank-two ℚ_p crystalline/benign density special case at `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:1122`. The package explicitly identifies that specialization in its Scope and proves the arbitrary F,d theorem.
- PR #923 owns the local deformation carriers and typed ring geometry at the lines above; no second local-ring construction is introduced here.
- PR #1745, `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:7` and :1044, owns BHHMS quaternionic patching and faithful flatness of its big module under its global/generic datum. This is a different module and conclusion from unrestricted local faithfulness for the CEGGPS module.
- PR #1829, `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md:7` and :11, owns the local model, completion/flag adapters and local geometry, while explicitly importing the parent's trianguline carrier. It does not own the BIP component-detection argument or the seven density/faithfulness endpoints here.
- The additional grep lead PR #1071, `TauCetiRoadmap/GL2ModularityLifting/README.md:1858`, is dyadic faithfulness using quadratic-twist actions and a specific global patched module. Its hypotheses and object differ from §4.2 here; it is not a second owner of the general CEGGPS result.

Generic spectra, kernel intersections, annihilators, completed tensor carriers and completed group algebras are cited rather than redeclared. There are no Lean declarations here that could collide with another package's fully qualified name. No two-way ownership hand-off or new overlap finding was found.

## Not verifiable

- None of the requested sampled source texts was inaccessible. All fifteen sampled targets were checked against their legal cached texts. No missing-reference request was needed.
- The thirteen declared supplier contracts are future obligations, not proved Lean theorems at these pins. This review verifies their declaration, ownership, precision and use; it does not claim that Lean elaboration proves them or the seven arithmetic headlines.

## Source issues

- **Error** in BIP at Lemma 6.5 proof, printed pp. 47–48: the source says its algebraic-on-units character matches the residual character; it should include an unramified Teichmüller factor to match the uniformizer value; affects the proof.
- **Gap** in BIP at Theorem 6.8 proof, printed p. 49: the source says an entire algebraic-test support lies in one supported component; it should choose a supported component through a characteristic-zero fixed-determinant point; affects the proof.
- **Misprint** in BIP at Theorem 6.8 proof, printed p. 49: the source says EP Theorem 6.12 supplies the scheme-support statement; it should cite EP Theorem 6.3, with 6.12 supplying the rigid argument; affects nothing.
- **Error** in EP at Lemmas 2.6 and 2.9 and Corollary 3.2, printed pp. 343–344, 351: the source says tensor capture permits every finite-dimensional factor; it should require a nonzero factor, since tensoring with zero captures only the zero module; affects a stated result.
- **Misprint** in EP at equation (15), printed p. 352: the source says conductor n−i+1 characters are counted using quotients at depths n−i+1 and n−i; it should use depths n−i+2 and n−i+1 under its stated conductor convention; affects a stated result.
- **Error** in EP at equation (21), printed p. 355: the source says the squared Heisenberg dimension equals the index of the two hereditary-order unit groups; it should retain the U_E factor and use the J/H index, which is one in rank one; affects a stated result.
- **Error** in EP at Proposition 3.25, printed p. 358: the source says the exact-depth class count has q_E^n growth at every depth; it should restrict to depths admitting minimal elements and use bounded-gap admissible depths for cumulative capture; affects a stated result.
- **Error** in DPS at Corollary 7.7, printed p. 42: the source says evaluation is injective for every finite-dimensional tensor factor; it should assert density for nonzero factors without general injectivity, as the trivial-group dimension calculation shows; affects a stated result.
- **Error** in BIPD at Lemma 5.1 proof, printed p. 11: the source says vanishing on a Zariski-dense point set forces a function to be zero for arbitrary R; it should pass to reduced spaces or conclude nilpotence, which suffices for density; affects the proof.

For the two additional source issues, direct witnesses are: EP lines 669–676, F=ℚ₅, d=1, n₀=2,n=4, give an actual conductor-four count 125−25=100 whereas equation (15) gives 25−5=20; the growth exponent is unchanged. For BIPD lines 442–458, R=O[ε]/(ε²) has one generic rigid point, where ε evaluates to zero although ε≠0. The package's §5.2 uses reduced R, so its zero-function inference is valid. Neither issue calls for a package theorem repair.
