<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1744#issuecomment-6399957432 -->
Review (codex) of 07fd530

Verdict: accepted
Conditional on the announced gaps: `eisenstein-local-dictionary`, `complementary-heegner-twists`, `quadratic-analytic-factorization`, `cgls-ordinary-control`, `rational-three-isogeny-count`

1. **F01** (P3) Correct the arithmetic-family section numbers

   **Location.** `packages/RankZeroOneBSDPartII/README.md:89`, also lines 15, 366, 383, 424, 472 and 510. The contract places “Family defined by local conditions”, “Positive squareclass denominator” and “Squarefree integers in residue classes” in §0.5.

   **Claim.** ArithmeticStatisticsPartI §0.5 supplies all four named family/counting inputs.

   **Witness.** `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md:462` places local conditions in §0.2; line 1240 places residue counts in §0.6; line 1950 places the positive denominator in §0.15. The squareclass family really is in §0.5.

   **Exact repair.** Keep §0.1 for density and §0.5 for squareclasses/twist height. Cite §0.2 for local-condition families, §0.6 for squarefree residue counts, and §0.15 for the positive squareclass denominator. Correct the supplier contract and the corresponding Needs, scope and layer dependency lines individually. Use the named targets as well as their section numbers.

   **Repair check.** The §0.6 formula at q=3 gives, relative to all positive squarefree integers, `(1/3)/(1−1/9)=3/8` for either coprime residue. Applying it to each sign gives the package's signed-squarefree density 3/8. Section 0.15 gives a strictly positive denominator for an inhabited compatible local rectangle, exactly as §4.2 needs. These endpoints exist in the named supplier; this is a locator correction, not an unowned prerequisite or a new gap.

2. **F02** (P3) Cite the owner of local ratio attainability

   **Location.** `packages/RankZeroOneBSDPartII/README.md:101`, also lines 374, 383 and 424. The contract assigns “the required instances of the latter local table” to Part VII §5.10.

   **Claim.** Section 5.10 supplies the local twist choices with ratio one at every prime away from three, including two, and the relevant ordinary differential table.

   **Witness.** `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md:2336`, §5.32, “Attainable local three-isogeny ratios”, explicitly supplies the away-three existence statement, the dyadic case, and the Kodaira/twist/differential tables. Section 5.10 supplies ratios, strata and statistics.

   **Exact repair.** Add ArithmeticStatisticsPartVII §5.32 “Attainable local three-isogeny ratios” to the exact contract, §4.2 Needs and Layer 4 dependencies. Keep §5.10 for the ratio definition, Tamagawa formula, stratum density, parity and restricted Selmer bounds. Attribute the tables and the away-three twist-existence input to §5.32.

   **Repair check.** With each away-three factor chosen as 1 by §5.32, the finite product is the fixed three-adic factor, 1 or 3. Multiplying by the real factors 1 and 1/3 gives `(1,1/3)` or `(3,1)`, hence respectively signed exponents `(0,−1)` or `(1,0)`. This preserves the selected admissible three-adic class. The needed theorem already has an earlier owner; no new gap or duplicate target is needed.

Acceptance is conditional on the five declared supplier contracts listed below. There are two P3 locator findings and no P1/P2 findings. The next stage should apply the citation corrections. No authored package file was changed. This is the first package review; the design review was treated as context, not as a substitute for checking the package.

## Verified sound

Reviewed all 17 numbered subsections, all four newly specified definitions, their APIs and Checks, the conventions, all 17 Needs lines, all six layer dependency blocks, the supplier contracts, metadata, source manifest and both Lean declarations. All 15 seeded targets were checked against the cached texts. There are no additional locators marked unverified in the package. The three manifest entries identify the copies actually read; none was rewritten or added.

The restrictions to good odd Eisenstein primes and to families with a good-at-three twist are explicit hypotheses of these theorems. They do not narrow the generic elliptic, Selmer or local-reduction theories imported from their owners. The package neither substitutes a residual-irreducible theorem for this branch nor adds a class-number restriction. It does not re-plan the CM or Skinner converse branches. No computational algorithm, copied source passage, sorry'd data, set_option, arbitrary Prop stand-in, or duplicate fully qualified Lean declaration was found.

### Source verification

The locators below use the manifest's published CGLS author copy, the 25-page BKLOS author copy, and the corrected 32-page PS author copy. Page markers and the printed page labels were checked; the versions' differing pagination was not conflated.

| Package targets | Text read and exact support | Outcome |
|---|---|---|
| §0.1, conventions | CGLS line 79, printed pp.518–520; line 2145, Theorem 5.2.1 p.574 | Good odd prime, reducible residual representation, both local character exclusions, split Heegner primes and discriminant conditions agree. No residual splitting or parity-at-infinity hypothesis is added. |
| §0.2 | CGLS lines 2188–2193, Corollary 5.2.2 p.575; PS lines 64–74, p.2; lines 132–144, pp.3–4; Theorem 5 line 425, p.10; Corollaries 6–7 lines 456–462, p.11 | Coefficient comparison requires rational p-torsion vanishing. The elliptic pairing is alternating modulo divisible radicals. The supplier's finite reduced-primary decomposition supplies the paired elementary divisors; no finiteness of whole Sha is presumed. |
| §§1.1–1.2 | CGLS lines 2151–2177 and 2181–2187, Theorem 5.2.1 proof pp.574–575 | Both complementary branches and infinitude are explicitly used. Corank is obtained from the known auxiliary twist before the main-conjecture application. The general nonvanishing input remains a declared contract. |
| §2.1 | CGLS lines 1847–1853, Corollary 3.4.2 p.566; lines 2165–2169, p.574 | The augmentation torsion valuation vanishes under corank one. The package correctly exposes the finite-error/control argument as a supplier contract instead of inferring integral surjectivity from these short source arguments. |
| §2.2 | CGLS lines 1934–1963, Remark 4.1.3, equations (4.4)–(4.5), pp.568–569 | The full trace removes the Artin translates and gives the squared stabilization factor; the Howard factor compares projections, not an asserted exact scalar between the full tower classes. |
| §2.3 | CGLS lines 2001–2011, Corollary 4.2.3 p.570; lines 2165–2172, p.574 | Rank-one characteristic equality is rational, retains augmentation, and is invoked only after establishing (Sel). Gross–Zagier then detects a simple central zero. |
| §§3.1–3.3 | CGLS Theorem 5.2.1 lines 2145–2148, p.574; Corollary 5.2.2 lines 2191–2193, p.575 | Both ranks 0 and 1, the finite-Selmer implication, and finite whole Sha match the source with its standing good-prime hypotheses. |
| §4.1 | CGLS lines 2198–2205, p.575; BKLOS §2 lines 94 onward, pp.2–3 | The admissible family explicitly tracks the local hypothesis needed for conversion. Squareclass height and local conditions agree with BKLOS. The family is a defined restriction, not an assertion that every twist is admissible. |
| §4.2 | BKLOS Proposition 10.1 line 674, p.14; Theorem 10.5 lines 713–741, pp.15–16; Proposition 10.7 lines 764–766, p.17; §11 lines 800–811, p.18 | The local-to-global argument works with the good admissible three-class fixed. The connected/étale alternatives and both real signs give the required strata. |
| §4.3 | BKLOS Theorem 2.5 lines 156–163, p.4; §§9.1–9.2 lines 643–661, p.14 | Absolute versus signed exponent conventions agree. The restricted-family mean argument gives 1/2 and 5/6. Conversion uses actual Selmer dimension only after the torsion correction vanishes. |
| §4.4 | CGLS Corollary 5.2.3 lines 2198–2205, p.575; BKLOS Theorems 2.5–2.6 lines 159–173, p.4 and §11 p.18 | Positive lower proportions follow under the package's explicit good-twist hypothesis. The unrestricted printed conversion needs the additional justification recorded under Source issues. |
| §§5.1–5.2 | CGLS Remark 5.2.4 lines 2206–2215, p.575; BKLOS lines 180–186, p.4 and §9.2 p.14 | The equation and printed percentages were located. The local admissible density is the package's independently checked diagnostic, not a theorem attributed to that remark. |
| §5.3 | CGLS line 79, p.518 and lines 2198–2205, p.575; native invariant formulas | The source supplies the hypothesis and proof being tested. The obstruction is an original explicit example, verified below; it is not falsely presented as an example appearing in CGLS. |

### Computed adversarial pass

Each row records explicit values or formulas evaluated on test inputs. Conditional algebra/module examples test the implications and conventions; they are not claims to have computed actual Selmer groups or analytic ranks of unspecified curves. The arithmetic theorems additionally rely on the source and supplier checks above. “Retain” means no mathematical change is requested.

| Statement | Instances tried | Computed sides/values | Result and change |
|---|---|---|---|
| Conventions: character determinant and duality | p=3; η nontrivial unramified; trivial and cyclotomic alternatives | On inertia/Frobenius, η has values `(1,−1)`; ωη has nontrivial inertia. η·ωη=ω; dualizing twice gives η. For φ=1 or ω one factor is trivial. | Exclusion is symmetric, genuine and local. Retain. |
| Conventions: projectors and coefficient domain | c eigenvalues +1,−1; p=3 and p=2 | `(1+c)/2,(1−c)/2` give `(1,0)` and `(0,1)`; over F₂, 2=0 so the integral projector is unavailable. | Odd p is needed for this integral split. General nonabelian groups are not claimed as the quadratic Galois group. Retain. |
| Conventions: rationalization and involution | Λ=Z₃[[T]]; torsion module Z/3 and module Λ/(T) | Inverting 3 kills Z/3 but leaves `(Λ/(T))[1/3]=Q₃`; T maps to `−T/(1+T)` with T-order 1. | Augmentation remains available; replacing it by inversion of T would lose the test. Retain. |
| Conventions: height | h_(O)(P)=1; 2P; zero | h_x(P)=2, h_x(2P)=8; `(8−2−2)/2=2=h_x(P)`; at zero all heights are 0. | Matches the supplied x-height and half polar form. Retain. |
| Conventions: local measure | Classes 1,2,3,6 at three | Masses `(3/8,3/8,1/8,1/8)`, sum 1; unit mass 3/4; 18/2=9 is a square. | Nonuniform squarefree weighting and one count per class are correct. R01 changes only locators. |
| §0.1 hypothesis predicate and API | η, ωη, 1, ω; p=2; multiplicative reduction; identity/composite diagram transport | Accepted characters η,ωη; rejected 1,ω. At p=2 the inequality 2>2 is false. Bad reduction fails the good-reduction conjunct. Identity gives φ; composites give the same transported kernel action. | Four distinct positive/negative controls, actual kernel rather than chosen constituent. Retain. |
| §0.2 low finite Selmer comparison | S=(Q₃/Z₃)^c⊕M⊕M, dim M[3]=s; `(c,s)=(0,0),(1,0),(1,1),(0,1)` | dim S[3]=c+2s gives `0,1,3,2`; coranks are `0,1,1,0`. Dimension 0/1 forces s=0. | Claimed implication holds only in the stated range; dimension 2 already separates it from arbitrary corank equality. Retain. |
| §0.2 alternating-pairing negative control | Cyclic Z/9; paired `(Z/3)^2` | Alternation gives b(g,g)=0, so every value on cyclic Z/9 is 0. On `(Z/3)^2`, matrix `[[0,1/3],[-1/3,0]]` is perfect, order 9, p-torsion dimension 2. | Square order alone does not give the required pairing. Retain. |
| §1.1 auxiliary-field branches | r=0 and 1; splitting illustration D=−71 at 2,3,19 | `(w(E), twist order)=(+1,1),(−1,0)`. D≡1 mod8, D≡1 mod3, D≡5 mod19 and 9²≡5 mod19; D is odd fundamental and below −4. | Branch/sign conditions are consistent. The example tests splitting, not nonvanishing; infinitude/nonvanishing are the declared input. Retain. |
| §1.2 corank over K | r=0 and 1; local split completions | `0+(1−0)=1`, `1+(1−1)=1`; each split p-completion equals Q_p, with p-torsion dimension 0. | Forward theorem is used on the known auxiliary twist; no conclusion about E is smuggled into the hypothesis. Retain. |
| §2.1 augmentation control | R=Q₃[[T]]; X=R, R⊕R/(T), R⊕(R/(T²))² | Coinvariant dimensions `1,2,3`; torsion lengths `0,1,4`. A finite nonzero torsion summand has residue dimension at least 1. | Dimension 1 excludes augmentation torsion. The third example tests the paired structure as well as length versus residue dimension. Retain. |
| §2.1 compact specialization | S=R and map reduction modulo T; zero class | Kernel TR, quotient Q₃; 1 maps to 1, T maps to 0. An extra target summand can enlarge cokernel without changing kernel. | Correct consequence of the declared kernel contract; no surjectivity follows or is claimed. Retain. |
| §2.2 trace factor | Formal two-term trace P+σP, σ²=1; scalar a=α⁻¹ | Tr((1−aσ)P)=(1−a)(P+σP); two factors give `(1−a)² Tr(P)`, not one factor. | Full trace is essential. Retain. |
| §2.2 root/factor normalization | p=3,a_p=2, modulo 9, u_K=1 | α=5 solves α²−2α+3≡0; α⁻¹=2, β=6. Traced factor `(1−2)²=1`; Howard factor `5²(6−1)²=4` mod9; product 4. | Both units but different normalizations. At α≡1 mod3 the traced factor is 0 mod3, correctly excluded. Retain. |
| §2.3 nonzero specialization | S=R, κ=1 versus κ=T | For κ=1, quotient length 0 and bottom 1. For κ=T, quotient length 1, squared characteristic ideal `(T²)`, bottom 0 despite κ≠0. | Characteristic equality at augmentation, not tower nonvanishing alone, forces the bottom. Retain. |
| §2.3 height/central order | Nonzero rational Kummer class; L(1)=0, L′(1)=c≠0 | Kummer detects a nonzero free point component; positive height times a nonzero normalization is nonzero; first Taylor coefficient c≠0 gives order 1. | Full chain uses named Kummer, Northcott and Gross–Zagier inputs. Retain. |
| §3.1 p-converse | r=0,1; outside-range r=2 negative control | `1=0+1` and `1=1+0`; subtractions give 0 and 1. For natural r=2, 1−2=0 would not be complementary order −1. | Explicit r∈{0,1} prevents truncated-subtraction abuse. Retain. |
| §3.2 ranks and finite Sha | Known analytic order 0 or 1; primary-only negative control | Imported forward output rank equals 0 or 1. Abstract `⊕_(ℓ≠3) Z/ℓ` has trivial 3-primary group but infinite total size. | Full Sha finiteness comes from the forward theorem, never from one finite primary component. Retain. |
| §3.3 finite-Selmer converse | Finite Selmer dimensions 0 and 1; paired finite correction | `0=c+2s` forces `(c,s)=(0,0)`; `1=c+2s` forces `(1,0)`. A hypothetical finite cyclic correction alone would wrongly allow `(c,dim finite)=(0,1)`. | Pairing step is necessary and supplied. Retain. |
| §4.1 family and API | Good ordinary rational kernel; classes 1,2,3,6; initial twist by 2; W with v₃(j)=−3 | Membership vector `(false,true,false,false)`; in the 2-twisted family identity becomes admissible and class 2 becomes excluded since 2·2=4. Dual gives the same vector; for W all four entries are false. | Squareclass invariance, twisting iff, duality iff and local dependence tested in both directions. Retain. |
| §4.2 positive strata | Finite-place products 1 and 3; two real signs | Products `(1,1/3)` or `(3,1)`, signed exponents `(0,−1)` or `(1,0)`. Positive local masses have positive finite product. | Meets zero and absolute-one strata without modifying the three-class. R02 corrects ownership locator. |
| §4.3 proportions | Even support {0,2}; odd support {1,3}; densities 1/8,1/4 | Mean bound `2(1−q)≤1` gives q≥1/2; `q+3(1−q)≤4/3` gives q≥5/6. Absolute bounds `1/2·1/8=1/16`, `5/6·1/4=5/24`. | Correct lower bounds, not equalities or limiting analytic densities. Retain. |
| §4.3 lower-limit and empty denominator | Conditional ratios alternating 1/2,1; stratum density β=1/4; empty stratum | liminf conditional=1/2; product liminf=1/8. Empty stratum has counts 0 and no asserted conditional proportion. | Count identity followed by liminf multiplication by a convergent positive factor justifies the use; the supplier's ordinary density theorem alone would not assert a limit for the analytic subset. Retain this distinction. |
| §4.4 absolute positivity | Positive stratum masses a,b; obstruction family empty | Lower bounds a/2>0 and 5b/6>0; for W, admissible mass 0 and the good-twist hypothesis is false. | No unqualified positive-density theorem is inferred for W. Retain. |
| §5.1 model/invariant API | Tuple `(0,1,1,1,0)`; coefficient map, zero-ring target | b=(4,2,1,0), c₄=−32,c₆=8, Δ=−19; c₄³−c₆²=−32832=1728Δ; j=32768/19. Into the zero ring all coefficients are 0. | Exact coefficients distinguish the model; ring-map claim does not assert a map Q→F₃. Retain. |
| §5.1 points/tangent/twist | x=0,1,2 over F₃; tangent at (0,0); d=2 | y-counts `(2,2,1)`, total 6, trace 4−6=−2. Substituting y=x leaves −x³. Twist discriminant `−19·8⁶=−4980736`, versus `−19·2⁶=−1216`. | Nonidentity flex, good ordinary reduction and native trace/norm scaling all agree. Retain. |
| §5.2 nineteen-a3 density | Local unit classes; d divisible by 3; full-family percentage | Trivial kernel becomes η only in class 2; classes 3,6 are ramified/bad. Density `(3/4)/2=3/8=37.5%`; 41.6% exceeds this by 4.1 percentage points. | Correct ceiling for the conversion set, not for the full rank-one set. R01 changes only locator. |
| §5.3 obstruction model/API | Tuple `(1,0,3,0,0)` and tangent at (0,0) | b=(1,3,9,0), c₄=−71,c₆=−1837, Δ=−2160; c₄³−c₆²=−3732480=1728Δ; j=357911/2160. Tangent y=0 leaves −x³. | Elliptic over Q and nonidentity rational 3-torsion point, hence quotient 3-isogeny. Retain. |
| §5.3 and Lean headline | d=1,3,0 in Q₃; arbitrary d≠0 | v₃(Δ_raw)=3,9 for d=1,3; j-valuation always `3v₃(−71)−v₃(−2160)=−3`. Scaling adds 6v₃(4d) to both numerator and denominator valuations, cancelling. d=0 gives Δ=0 and is excluded. | Minimalization preserves j; good reduction would give v₃(j)≥0, contradicting −3. This is the actual quantified Lean statement. Retain. |

The defining APIs have discriminating checks: §0.1 has permitted/forbidden characters, bad reduction, p=2 and a nonsplit extension; §4.1 has the four local classes, square-rescaling, an empty family and the reversed initial-twist example; §5.1 has invariants, point count, twist scaling and tangent; §5.3's coefficient definition has tangent, valuation and singular-parameter controls. Zero modules, finite paired modules, p=2, p=3, unit/nonunit factors and empty denominators were tested where they belong. Equal-characteristic DVRs, inseparable extensions, arbitrary nonabelian groups and singular curves are not silently admitted by statements restricted to Q, Q_p and actual elliptic Kummer data.

### Pinned-library and duplication audit

The library revisions match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The content checkout equals its origin/main at `198a2803230ce19e672234ed72cf637f8ea58e35`. The three main-branch supplier texts also match the copies returned by the roadmap service.

These declarations were opened, rather than inferred from their names. Paths in this table are relative to the respective pinned library repository.

| Pinned file and line | Declaration/body inspected | Consequence for the review |
|---|---|---|
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:120` | c₄, c₆ and Δ at lines 120,124,131; five native coefficient fields above them | The two model computations use the actual formulas. No new curve carrier is needed. |
| Same file, line 366 | `WeierstrassCurve.IsElliptic` has field `isUnit : IsUnit W.Δ` | Over fields nonzero suffices; over arbitrary rings it does not. The package states this correctly. |
| Same file, lines 388,401,455 | j from inverse discriminant unit; field formula; ellipticity under map | j is not a total quotient on arbitrary singular curves. Explicit nonzero Δ supplies the instance here. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:299` | `minimal` chooses a variable change with minimal model | The statement tests a minimal equation, not raw discriminant divisibility. |
| Same file, lines 323,328 | `HasGoodReduction` extends `IsMinimal`; multiplicative discriminant valuation equals 1; reduction iff | The package correctly distinguishes multiplicative valuation 1 from additive valuation 0. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169` | `quadraticTwistOf`; c₄ formula line 229, Δ formula line 239 | Parameter is t²−4n, hence 4d here, with powers 2 and 6. |
| Same file, lines 299,306 | ellipticity iff parameter a unit and original ellipticity; `j_quadraticTwistOf` requires both ellipticity instances | d≠0 over Q₃ validates the twist; j is invariant. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139` | `TauCeti.Isogeny`: contravariant coordinate pullback and `mapsInfinity` | Existing nonzero-isogeny carrier, not arbitrary point maps. |
| `Mathlib/NumberTheory/Height/NumberField.lean:431` | `NumberField.finite_setOfPred_logHeight₁_le` | Number-field Northcott is supplied. |
| `Mathlib/NumberTheory/Height/EllipticCurve.lean:116` | `WeierstrassCurve.Affine.finite_naiveHeight_le`, under Northcott on field height | The x-coordinate finite-fiber comparison is required and available. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:260` | canonicalHeight_nonneg; zero iff finite additive order at line 332 | The latter explicitly requires Northcott on canonical height. The README retains it. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:121` | `WeierstrassCurve.Affine.fg_point_of_numberField` | Generic Mordell–Weil finite generation already exists; no new such target is introduced. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:84` | `WeierstrassCurve.LSeries` is the Dirichlet-series expression from its arithmetic coefficients | No continued analytic-order interface is supplied by this declaration. |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71` | `ContinuousCohomology.tateShafarevich` is an intersection of restriction kernels for supplied fields and TopRep | It does not construct elliptic geometric points, local Kummer comparison or classical elliptic Sha on its own. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104` | `selmerGroup₂` uses norm-kernel squareclasses and local conditions | This is 2-descent, not the missing odd-primary/p-infinity elliptic interfaces. |

Object searches covered the full pinned trees, main roadmaps, the indexed open-head roadmap texts and the board packages available here. Searches used Selmer/Kummer/Sha, Heegner normalization, augmentation control, actual elliptic L-functions, local kernel characters, ratio strata and twist proportions, as well as the two exact Lean names. Both exact Lean names have no match on main or in any indexed open roadmap pull request. The board package index was read before resolving absent names.

The definitions, generic comparisons, pairing, statistical averages and main-conjecture equality are imports. This package owns the fixed-isogeny predicate, their specific Eisenstein-converse assembly, the admissible conversion and its local diagnostics. The exact traced factor here differs from HeegnerPointEulerSystems §8.32's near-trivial finite-coefficient congruence; §8.13's unit-line comparison is explicitly imported. CMRankZeroConverse's shared implication is not defined again. No new fully qualified name collides with a readable supplier or package.

### Supplier resolution and direction

Read the main-branch shapes of EllipticCurves, ModularForms and PadicMeasuresIwasawaAlgebras. Other suppliers in the following table are new-roadmap folders at the indexed open heads, not revisions substituted for a main-branch dependency. The service's extra header is excluded from the file line numbers below.

| Supplier citation | Resolved endpoint and scope |
|---|---|
| EllipticCurves Layers 1–2,4–5,7 | `TauCetiRoadmap/EllipticCurves/README.md`: quotient by a stable finite subgroup at line 548; Layer 2 line 647; local reduction and j-integrality in Layer 4 line 793 onward; twists line 1154; Selmer/Sha line 1262. Generic constructions remain here/the pins. The additional actual-character dictionary is a declared gap. |
| EllipticCurveModularity R29.3–R29.6 | `TauCetiRoadmap/EllipticCurveModularity/README.md`: layers at lines 1006,1249,1464,1598; cusp-normalized modular parametrization around line 1510; actual continuation around line 1910. This supplies π(∞)=O through the imported parametrization construction; translating π arbitrarily is not an allowed normalization. |
| ModularForms Layer 7 | `TauCetiRoadmap/ModularForms/README.md:708`, Euler products and completed functional equation. |
| SelmerIwasawaCohomology §§2.9–2.12a | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md`: compact/rational carriers line 562, contragredient dual line 589, coranks line 617, elliptic p-infinity exact sequence line 645, abelian/local comparison and finite-cotype decomposition line 671 onward. |
| Same, §§3.9–3.11 | Lines 1522,1547,1567: local correction, derived specialization, actual localization-image restriction diagram. These are general diagrams, not the undeclared assertion that every error vanishes; the CGLS instance is explicitly requested as a gap. |
| Same, §§4.26,4.28,4.29 | Lines 2323,2367,2502: rational Kummer comparison; quadratic character decomposition at line 2460; elliptic alternating reduced-primary pairing within §4.29. The family parity theorem is not used as elliptic root-number parity. |
| HeegnerPointEulerSystems §§8.5–8.6a,8.13,8.24,8.31,8.34 | `TauCetiRoadmap/HeegnerPointEulerSystems/README.md`: source class at line 1418, primitive lattice/factors line 1441, unit comparison line 1546, tower nonvanishing line 1708, weaker localized bound line 1814, augmentation bound line 1850. Class-number shifts and fixed parametrizations are retained. |
| Same, §§8b.2,8b.10 | Lines 2056,2142: p>3 integral and odd-p rational branches are distinguished; Eisenstein equality has its independent elliptic-unit/Katz and reciprocity contracts. Those inputs are not derived from this converse. The package uses the rational branch at p=3. |
| PadicMeasuresIwasawaAlgebras Layer 4 | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2328`: finite-module structure, height-one DVRs, pseudo-null errors, characteristic ideals and Iwasawa coordinate. |
| GrossZagierAndArithmeticHeights §§0.1,8.14,8.17–8.19 | `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md`: height dictionary line 303; explicit formula line 5022; classical specialization line 5064; trace non-torsion line 5092; cusp-normalized elliptic height identity line 5106. No squarefree-conductor restriction is introduced. |
| ModularIwasawaMainConjectures §6.1 | `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:1936`: interface conventions, not a proof of the anticyclotomic equality. Its displayed setting has p>3; the package's p=3 proof imports the separate rational HPES endpoint, not a theorem from this interface. |
| ArithmeticStatisticsPartI | §0.1 lines 258,318 for ratios and density tower; §0.5 line 1118 for twist family. Other exact locations are R01. The tower count identity also proves the liminf product used here without assuming existence of an analytic-rank density. |
| ArithmeticStatisticsPartVI | `TauCetiRoadmap/ArithmeticStatisticsPartVI/README.md:2277`, “Heegner logarithm and low rank”, explicitly includes the forward Q theorem for every curve with modular comparison data, despite its preceding narrower p-adic setup; “Elliptic p-parity” at line 2331 includes p=3/reducible residual cases. |
| ArithmeticStatisticsPartVII | §5.10 at line 1287; ratios 1291, local formula 1321, strata 1351, corrected parity 1413, restricted bounds 1478 and 1493. The local attainability endpoint is §5.32 as in R02. |
| ArithmeticStatisticsPartIII | `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md:2272`, “Windowed cubic counting contract”, defines C with seven items; its theorem remains conditional. This package requests the rational instance rather than silently dropping C. |
| CMRankZeroConverse C.0; RankOneConverse PC.0–PC.6 | Available design locators: `packages/CMRankZeroConverse/design/README.md:63`, shared implication at line 71; `packages/RankOneConverse/design/README.md:50` and subsequent PC sections. Both names are earlier in ORDER. The citation resolver's RankOneConverse warning is therefore not evidence that the direction or owner is nonexistent. See the limitation below concerning package-stage text. |

Mechanical dependency check, run with the prescribed name, order and movable flag:

```text
depcheck: 52 roadmaps, 592 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No order file or supplier was edited. Internal target edges follow the displayed build; §2.1's use of §1.2 is expressly for the selected-field application, not a prerequisite on every statement of the control theorem.

### Declared gap audit

All five slugs occur both in the plan's top-level gaps array and verbatim in the README's named-supplier contracts. None has supplier `none`. Their combined clauses specify coherent arithmetic interfaces, not arbitrary assertions to assume as hypotheses of the final theorems.

| Slug | Supplier and precise remaining obligation | Minimality check |
|---|---|---|
| eisenstein-local-dictionary | EllipticCurves Layers 2,4,5; actual fixed isogeny characters, good odd-prime ordinary/local torsion consequence and three-adic good/bad twist dictionary | Generic twist, reduction and character constructions are imports. The native twist polynomial does not establish this arithmetic local classification. |
| complementary-heegner-twists | ArithmeticStatisticsPartVI supporting low-rank section; both sign branches, every finite splitting set, infinitely many odd D<−4 | Its specialized auxiliary-value construction does not state this full two-branch contract. No full analytic-rank assumption on E is requested. |
| quadratic-analytic-factorization | EllipticCurveModularity R29.6; actual continued elliptic/twist base-change comparison, bad factors, finite orders and split-level sign | R29.6's one-curve continuation alone is insufficient. GrossZagierAndArithmeticHeights §0.8 already supplies the coprime-level genus-character newform product; that input is reusable, but is not itself the full actual-elliptic carrier comparison requested here. |
| cgls-ordinary-control | SelmerIwasawaCohomology §§3.9–3.11; finite discrete errors and rational compact kernel, with local/H²/Tor terms retained | Existing diagram statements require verification of arithmetic errors. They do not already discharge this CGLS instance. |
| rational-three-isogeny-count | ArithmeticStatisticsPartIII, windowed cubic contract; rational unweighted finite-local families/strata, isogeny and dual | Part VII's conditional means do not prove C. The family, height and local mass normalizations are specified. |

### Headline coverage and Lean checks

The README has 14 theorem-level endpoints relevant to acceptance: §0.2 low finite-Selmer comparison; §§1.1–1.2 complementary fields and corank one; §§2.1–2.3 augmentation control, traced normalization and non-torsion point; §§3.1–3.3 the three converse/rank outputs; §§4.2–4.4 positive strata, quantitative conversion and positive absolute proportions; §5.2 nineteen-a3 admissible density; §5.3 no good three-adic twist.

The module docstring names the first 13 and the missing interfaces. Native odd-primary elliptic Kummer/Selmer/Sha comparisons, ordinary arithmetic tower classes, actual continued elliptic analytic order, and the local isogeny-character/ratio family are not supplied by the raw native L-series, topological cohomology kernel or 2-Selmer group. Encoding free predicates or residue sets would not state those theorems. The one fully statable endpoint is `no_good_three_twist`; its only auxiliary definition is the concrete native model `scopeObstructionCurve`.

The prescribed `lake env lean` elaboration of `packages/RankZeroOneBSDPartII/Suggested.lean` from the content checkout exited 0. The individual Tau Ceti import's object file was already present, so no build was necessary. The sole diagnostic was the warning that `no_good_three_twist` uses sorry. The file has one `import Mathlib`, one actually used individual Tau Ceti import, one real definition, one sorried theorem, a matching namespace/docstring and no set_option.

I also elaborated a scratch copy with `#check @` for both declarations. The definition has type `WeierstrassCurve Q`. The theorem quantifies over every `d : Q_[3]`, retains `d ≠ 0`, and negates `HasGoodReduction Z_[3]` of the minimal model of the mapped curve's trace-zero, norm-minus-d twist. No section binder was lost and no signature change is needed.

The one-tactic scratch probes for the sole sorried theorem failed as follows: simp made no progress; rfl rejected the negation goal as not a reflexive relation; infer_instance rejected it as not a class goal. The object search found no single pinned theorem proving this concrete universal twist obstruction. Its proof requires the explicit nonintegral j calculation, twist/variable-change invariance and the good-reduction integral-j consequence. It is not a restatement of its coefficient definition or a boundary-case computation. No padding deletion is recommended.

## Not verifiable

- The historical stopping point of the base RankZeroOneBSD asserted in README line 7 could not be independently compared with a base README: no such folder is in the supplied main checkout, the indexed open roadmap heads or the board package index. Other readable roadmaps and the designs reference that name. This package uses named available suppliers and declared gaps for its actual mathematical inputs, so this historical limitation is not treated as an unowned proof dependency or evidence of re-planning.
- CMRankZeroConverse and RankOneConverse have readable design READMEs here, but no package README in this checkout or entry in the supplied board-package index. Their stated design sections were checked; a later package-stage renumbering cannot be verified from unavailable files. No new owner or missing-gap finding is inferred from that absence.
- No cited source text was inaccessible, and no missing-reference request is necessary. The five declared obligations are future supplier work, not unreadable sources. Acceptance does not claim their proofs already exist.

## Source issues

- **Gap** in CGLS at Corollary 5.2.3 proof, printed p.575: the source says character twisting suffices to apply the good-prime converse throughout every three-isogeny family; it should be require a good-at-three twist for this proof or supply another argument for families without one; affects the proof.
- **Gap** in CGLS at Remark 5.2.4, printed p.575: the source says unrestricted nineteen-a3 Selmer percentages transfer to analytic ranks; it should be track admissible intersections or supply another conversion, since this admissible set has density three eighths; affects the proof.
- **Misprint** in CGLS at proof of Theorem 5.2.1, condition (d′), printed p.574, CGLS line 2177: the source says central order of the twist L-value with its argument already fixed to one; it should be central order of the twist L-function with variable argument s; affects nothing.
- **Misprint** in BKLOS at proof of Corollary 10.10, author p.17, BKLOS line 782: the source says the local ratio identity is Lemma 10.2; it should be Proposition 10.2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "07fd530e96f72c15f631980806623f1fcf65fb87", "job": "REV-PKG-RankZeroOneBSDPartII", "model": "gpt-6-astra", "worker": "chris-32"} -->
