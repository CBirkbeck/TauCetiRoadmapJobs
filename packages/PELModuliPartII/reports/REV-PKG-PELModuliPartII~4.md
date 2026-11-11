<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6783753595 -->
Review (codex) of b32b34a

Verdict: needs_changes

1. **F01** (P2) Freeness does not give disjoint Zariski neighbourhoods

   **Location:** `packages/PELModuliPartII/README.md:1730`, §9.2: “conditions (i) and (ii) hold when K^p is small enough that every intersection … is torsion free”; the inference is used at line 1734, the API at lines 1738–1739, and §9.5 at line 1797.

   **Claim:** Discreteness and torsion-free stabilizers establish condition (ii), making the arithmetic quotient map a Zariski local isomorphism before constructing the uniformization map.

   **Witness:** In the rank-three unitary example below, Γ is discrete, torsion-free and residually finite, but every neighbourhood U of x satisfies U∩gU≠∅. RZ96 line 2409 gives an algebraic-space quotient; lines 8862–8870 obtain a scheme using Θ.

   **Exact repair:** Keep the first quotient theorem under the explicitly assumed condition (ii). For the arithmetic application, construct the formal algebraic-space quotient under the hypotheses of RZ96 Proposition 2.37, including profinite separation, and prove the quotient map is an étale torsor. Do not infer (ii) from freeness or call this map a Zariski local isomorphism. Establish formal-scheme representability together with Θ in §9.5: construct Θ on the quotient sheaf, prove the deformation comparison and the isomorphism onto the stated completed basic component, and hence obtain representability by that formal scheme. RZ96 Theorem 6.23's proof, printed pp. 289–290, supplies the alternative quasi-finite representability route. Make the API distinguish the theorem assuming (ii) from this arithmetic application; update §9.5's route and dependencies without making §9.2 depend on §9.5. Add the intersecting-components example as a negative-control Check.

   **Repair tested:** The example satisfies the hypotheses for the algebraic-space quotient and étale torsor, but no longer receives the false Zariski-local conclusion. Translation on a disjoint union of copies still satisfies (ii) and retains the stronger local-isomorphism theorem. The uniformization headline is unchanged. This counterexample refutes the stated inference from local discreteness and freeness; it is not a claim that a particular global CM pair with this precise cyclic arithmetic subgroup has been constructed.

2. **F02** (P3) Correct two source pages

   **Location:** `packages/PELModuliPartII/README.md:929`, §4.4: “Remark 2.68, p. 43”; and line 1109, §5.7: “HLSY23, §2.1, p. 11”.

   **Claim:** These pages contain the cited restriction on the absolute/relative exotic comparison and the relative Krämer representability passage.

   **Witness:** LL22 line 2203 starts printed page 44; Remark 2.68 is at line 2214. HLSY23 lines 427–450 contain §2.1; printed page 10 ends at line 453 and page 11 starts at line 454.

   **Exact repair:** Change the first locator to “Remark 2.68, p. 44” and the second to “HLSY23, §2.1, p. 10”. Keep the separate Howard19 and RSZ21 citations and the stated mathematical hypotheses.

   **Repair tested:** The corrected pages lead directly to the restriction to unramified ground fields and the strict-relative representability paragraph respectively. Neither theorem needs mathematical narrowing.

Two findings: one P2 and one P3; one blocking. The three previous findings are repaired. The mathematical scope is repairable without replanning. No package input was changed.

## Verified sound

### Previous findings checked first

The previous review and repair report were read finding by finding. No item was marked not actionable. None is re-raised.

| Previous finding | Repaired passage | Recomputed witness | Status |
|---|---|---|---|
| F01, polarization arrow | `packages/PELModuliPartII/README.md:1281`: “from (A₀,ι₀,λ₀∘ι₀(3+2√2)) to (A₀,ι₀,λ₀)” | c=1+√2, c²=3+2√2, c⁴=17+12√2. Pullback of the target λ is λc², exactly the source. The inverse arrow uses c⁻¹=√2−1. | Repaired. |
| F02, μ-ordinary exclusion | `packages/PELModuliPartII/README.md:405`: “The domain of C is cut out by supersingularity, not by failure of μ-ordinarity” | Rank one is supersingular and C=id. Signature (1,1) gives slopes 0,0,1,1 and étale height 2; (1,2) gives 0,0,1/2,1/2,1,1. | Repaired. |
| F03, supplier convention | `packages/PELModuliPartII/README.md:92`: “applied to the transposed form H(x,y)=h(y,x)” | With u²=3, h(x,y)=xȳ: h(u,1)=u, H(u,1)=−u, both diagonal norms 1. For skew h=u xȳ, H(1,1)=u, whereas conjugation alone gives −u. | Repaired, including the skew case. |

The repaired patterns were searched throughout the package: exact CM arrows in §§6.3, 6.6, 7.1 and 8.1–8.2; supersingularity in §§0.4–0.5, 7.2, 7.9 and 9.7; and transpose, dual-lattice, adjoint and determinant conventions in §§1.5, 2.3, 3.6, 5.4, 5.8–5.9 and 6.7. The supplier itself was reopened: pull request #851, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:703`, §2.7, and line 769, §2.9. Transposition preserves the determinant and the dual lattice; it does not identify the two off-diagonal values.

### Coverage, shape and principles

All 75 numbered targets were read, including their API, Checks, routes and dependencies. The scratch adversarial ledger contains 75 rows of explicit controls. For unchanged text, earlier-round computations were reused only when their values were recorded; a prose assurance of soundness was not treated as evidence. The report below retains the fifteen seeded targets, the headline families, repaired passages and the targets touched by findings. Controls test claims; they do not constitute proofs of the proposed deep theorems.

There are 45 explicit API blocks, each with at least three Checks, ten layer Examples sections, ten layer Dependencies sections and 77 explicit Needs lines. Definitions retain source and target data, arrow conventions, pullback and comparison APIs. The theorem hypotheses are stated in the target or standing conventions. The few descriptive Checks were assessed with the numerical and matrix controls below. No independent missing-API or Check finding was identified.

The package extends PELModuli's good-prime and principal-unramified boundary. It does not replace that roadmap. It retains arbitrary finite p-adic ground fields where supported, relative polarizations, ramified quadratic places, almost self-dual levels, and the all-prime CM target. The unramified ground-field restriction of the absolute exotic comparison is explicit; the relative exotic theorem is not restricted to that case. The mathematics distinguishes local p>2 from the CM target at every prime.

The organisation is mathematical: relative carriers precede local spaces, the absolute comparison depends on the relative exotic construction, global data precedes integral models, and uniformization consumes those models. No layer is named for a source chapter, and there is no claim to follow a source's expository order. No copied source passage, computational algorithm, process residue, machine path, HTML anchor, sorry'd data, `set_option`, or route-specific good-prime replacement was found in the package inputs. Main-branch SchemeAndStackFoundations and ReductiveGroupsPartII were read as shape comparators.

### Seeded source sample

All 17 manifest works are present in the supplied source cache. No author-flagged unverified locator was found. No source was fetched, no entry rewritten, and no duplicate key added. The published-pagination limitations for Zhang21 and LTXZZ22 remain explicit below. The available preprint text supports the mathematical statements at its own numbering, except for the quotient inference in R01 and page slips in R02.

| Seeded target | Source locator and lines opened | Hypotheses and result |
|---|---|---|
| 1.2 Representability and smoothness | LZ22 §2.1, p.10, lines 392–408; RZ96 Theorem 3.25, printed p.88, lines 3008–3028 | Unramified quadratic L/K, strict relative height 2n, dimension n, principal exact framing and signature (1,n−1); dimension n−1. Supported. |
| 2.2 Almost self-dual deformation theorem | Cho18 Theorem 1.2, p.4, lines 136–143, field and type setup lines 69–100; LZ22 lines 2814–2818 | Arbitrary finite K/Q_p, 0<h<n, h=1 and n≥2. Regular semistable statement is over its natural coefficient DVR. Supported. |
| 3.3 Relative exotic framed space | LL22 Definition 2.3 and Lemma 2.4, p.10, lines 431–443 | Even positive rank, ramified quadratic extension, odd p, height-zero framing and exact polarization. Supported. |
| 3.5 Principal ramified CM source | LL22 pp.10–11, lines 444–468; paragraph preceding (2.25), p.43, lines 2180–2199 | Principal rank-one source, opposite CM character and O_L-linear endomorphisms. It is not a rank-one exotic object. Unique lifting uses the named strict-module supplier. |
| 4.1 Absolute exotic module category | LL22 Definition 2.59, p.38, lines 1900–1950 | Absolute height 2nf and dimension nf, distinguished wedge/spin factor, banal character factors and kernel X[u]. Unramified K/Q_p restriction retained. Supported. |
| 5.7 Krämer regularity theorem | HLSY23 §2.1, printed p.10, lines 427–450; Howard19 Proposition 2.2, p.6, lines 245–255; Krämer03 charts, lines 390–458 | Relative strict formulation and natural coefficient ring retained. Howard's absolute dimension n is consistent with relative n−1. Rank-two crossing is separately computed. R02 corrects HLSY page. |
| 6.2 Admissible CM coefficient data | LL21 Notation 5.6, p.28, lines 1303–1324; LL22 Definition 1.1, p.3, lines 136–146, Notation 4.19, p.57, lines 2883–2908 | Same-place split condition, inert pullback from the maximal unramified field, ramified local reflex fields and their compositum are retained. Supported. |
| 7.1 Localized RSZ moduli | Zhang21 Definition 6.1, cited published pp.904–905, cached pp.29–30, lines 1640–1718 | The excluded set of places, exact CM arrows, localized quasi-isogenies, common level data and Eisenstein conditions match. Published pages not independently readable. |
| 7.4 Exotic integral model | LL22 §4.5, pp.65–66, lines 3336–3361; RSZ21 Theorem 5.4(e), lines 1415–1446 | The model imposes the exotic condition on A, correcting the source's A₀ slip. Even rank and unramified ground-field hypothesis retained. |
| 7.6 Unitary local-model comparison | RSZ21 (5.5), p.23, lines 1257–1280; (5.6)–(5.7), pp.23–24, lines 1283–1310; Theorem 5.4, pp.26–27, lines 1402–1447 | Polarized multichain trivializations, full stabilizer group and matching relative dimensions. Smooth stabilizer theorem is a declared contract, not silently assumed supplied. |
| 8.1 Neat smooth unitary moduli | LTXZZ22 Definition 3.3.4, lines 1293–1299; Definition 4.2.2 and Theorem 4.2.3, cached pp.36–37, lines 1663–1741 | Odd p, stated unramified/inert degree-one conditions, self-dual local level, both neat levels and one common polarization multiplier. Period-line correction checked at lines 1755–1781. |
| 8.2 Neat almost self-dual moduli | LTXZZ22 Definition 5.2.1 through Remark 5.2.4, cached pp.55–57, lines 2591–2657 | Definite auxiliary datum, order-p² kernel, common arrow multiplier, integral local lattice and rank-one boundary retained. Supported at preprint numbering. |
| 8.7 Smooth integral geometry and tangent space | LTXZZ22 Theorem 4.2.3 and (4.2), cached p.37, lines 1718–1741 | Tangent Hom formula, relative dimension N−1, and CM factor retained. The package supplies the integral properness step instead of importing an unexplained projectivity equivalence. |
| 9.2 Quotients of formal schemes by discrete groups | RZ96 Propositions 2.34–2.37, printed pp.64–67, lines 2349–2420; proof of Theorem 6.23, pp.289–290, lines 8835–8875 | Local finiteness and absence of fixed points do not establish (ii). Proposition 2.37 gives a formal algebraic space; scheme representability uses Θ. R01. |
| 9.10 Mixed basic-locus comparison | LZ22 §13.4, pp.82–83, lines 3568–3600; §10.2, pp.64–65, lines 2854–2884; LRZ26 Theorem 14.6.2, printed pp.60–61, lines 2622–2634 | Corrected local isogeny degree q², projection degree q+1, and generic identification onto the divisor. The integral resolution is distinguished from an isomorphism. Uniformization route inherits R01. |

Additional repair checks reopened Mih19 Definition 2.2, lines 267–304, and Theorem 3.3, lines 527–536; RSZ21 exact CM arrows, lines 646–649; and LL22 Remark 2.68, lines 2203–2215. RZ96 Corollary 6.29, lines 8931–8964, was checked against the common-slope counterexample rather than accepted as printed.

### Computed adversarial table

The coefficient assumptions exclude local p=2, q=1, equal-characteristic fields, zero coefficient rings and inseparable quadratic extensions. Rank zero is outside signature (1,n−1), while n=1 is tested wherever admitted. These exclusions are not applied to the global CM all-prime theorem. Nonreduced bases, identity morphisms, empty component sets, ramified coefficient extensions and noncommuting level actions were included. Uniformizers are inverted only in rational categories, unit scalars have their inverses, and 2 is inverted only at odd p. There are no Lean total-function junk values because there are no declarations.

| Statement | Instance | Computed values on both sides or in the competing model | Result / change |
|---|---|---|---|
| Conventions and §§0.2–0.3 | [K:Q_p]=2, n=1 and 3 | Underlying (height,dimension)=(4,1),(12,3); unrestricted deformation dimensions 3,27. Rank-one Cartier dual dimension 3 versus relative dual dimension 1. | EL ambient and relative dual are essential. |
| §0.4, repaired domain Check | Signatures (1,0),(1,1),(1,2), K₀=K | Slopes (1/2,1/2), (0,0,1,1), (0,0,1/2,1/2,1,1). C=id in first case; étale height 2 in the latter two. | F02 repaired. |
| §0.6 and §6.5 | r=0,s=2; r=1,s=2; nonzero 2×2 Jordan block J | Grassmannian tangent ranks 0,2; charpoly J=T², J²=0 but J≠0. Empty embedding polynomial Q=1 forces its Lie summand to be zero. | Characteristic polynomial alone is insufficient. |
| §§1.5, 2.3, 3.6, 5.4, 5.8–5.9, 6.7 | u²=3; h=xȳ, and skew h=u xȳ | h(u,1)=u, H(u,1)=−u; diagonal 1=1. Skew diagonal H(1,1)=u, conjugation-only value −u. Norms of e,ue are 1,−3. | F03 repaired; transpose handles both signs and preserves dual lattices. |
| §1.2 headline | n=1,2,3 | Tangent ranks 1(n−1)=0,1,2 equal relative dimensions. | Pass. |
| §2.2 headline | n=2, xy=ϖ; then ϖ=t² | Original total dimension/embedding dimension 2/2, special branches 2. After base change 2/3. | Natural coefficient hypothesis is substantive. |
| §3.3 seeded definition | Same underlying framed isogeny class with height 0 or 2; multiplier 1 or 2 | Only (height,multiplier)=(0,1) satisfies the exact framed category; (2,1),(0,2) fail separate laws. | Functor determines marking and polarization. |
| §3.4 headline | n=2 exotic chart | Over O_L: special ring k[[t]], nilradical 0; over O_K: k[u]/u²[[t]], nilradical (u)≠0. | Smoothness is over the specified O_L base. |
| §3.5 seeded source | Ramified rank one | Principal source: height 2, dimension 1, kernel order 1; putative exotic source would have kernel order q=3. | Principal source correctly distinguished. |
| §3.7 headline | Types 4 and 2; n=2 | Full strata: two P¹ or two points. Fixed-sign strata: one P¹ or one point. n=2 formal relative dimension 1, reduced dimension 0. | No false full-stratum irreducibility. |
| §4.1 seeded category | f=2,n=2 | Absolute height/dimension 8/4; relative 4/2. There are two embedding blocks, one distinguished, one banal. | Absolute and relative carriers not confused. |
| §4.4, R02 | f=1; ramified degree-two ground field | f=1 unit and counit are identity; ramified degree two has one residue embedding, not two unramified idempotent factors. Locator page 43 versus actual 44. | Mathematical restriction correct; fix page. |
| §§5.6–5.7 headline | n=2, y(1+x²)=2u | At x²=−1, derivative 2x≠0; residue quadric has 2 points. Local yz=u: relative dimension 1, absolute dimension/embedding dimension 2/2. At p=2 derivative 0. | Rank-two proof works at odd p; R02 corrects page 11→10. |
| §6.2 seeded definition | Split degree-two CM embedding set | Both embeddings above one split place give counts (2,0), admissible; one above each gives (1,1), inadmissible. Unramified degrees 2 and 3 have compositum e=1, degree 6. | Same-place and coefficient conditions discriminate. |
| §6.6 headline and repair | c=1+√2 | c²=3+2√2, c⁴=17+12√2; c*λ=λc², while c*(λc²)=λc⁴. c⁻²c²=1. | Correct source/target; F01 repaired. |
| §7.1 seeded definition | F⁺=Q(√3), F=F⁺(i), p=3 | Ground ramification index 2; quadratic extension is unramified inert, not ramified. | Does not unnecessarily invert every ground-ramified prime. |
| §7.2 headline | n=2,3,4, ordinary and basic points | Relative local-model dimensions 1,2,3 in either Newton situation; CM tangent dimension 0. | Smoothness route does not misuse supersingular C. |
| §7.4 seeded model | f=2,n=2 | A factor height/dimension 8/4 versus A₀ factor 4/2. | Source's A₀ label corrected to A. |
| §7.6 seeded comparison | n=3; torsor dimension d_G | Both chart sides have dimension 2+d_G; cancellation leaves 2. Ramified xy=t² has dimension 2, embedding dimension 3. | Full smooth stabilizer gap retained; no false regularity descent. |
| §7.7 headline | n=2,f=2; n=4,F⁺=Q | Moduli dimension 1 versus abelian dimension 4. Rank-eight rational quadratic form in latter case is isotropic; signature alone does not imply compactness. | Properness conditioned on anisotropy and supplier theorem. |
| §§7.8–7.9 headlines | Wedge uv=t², Krämer yz=u; q=3 | Wedge dimension/embedding dimension 2/3; Krämer 2/2. Self-dual kernel 1, almost self-dual kernel 9. | Models and coefficient effects distinguished. |
| §8.1 seeded model | N=1 and 3; multipliers (1,2) | Relative dimensions 0,2. Distinguished period subspace rank 1, naive condition rank 3 when N=3. Multipliers 1≠2 fail common-scalar law. | Correct native moduli and period line. |
| §8.2 seeded model | N=1,p=3 | Relative dimension 0; kernel order p²=9 versus principal order 1. | Boundary retained with correct polarization. |
| §8.3 headline | N=2 crossing; N=1 | Dimension/embedding dimension 2/2 for crossing and 1/1 for coefficient DVR. | Regular semistability and boundary agree. |
| §8.7 headline | N=2; N=3 period condition | Hom(line,rank-one quotient) tangent rank 1; CM tangent 0. N=3 corrected period space rank 1 versus uncorrected rank 3. | Tangent formula and correction sound. |
| §9.1 deep theorem | Supersingular, ordinary, conjugate-CM elliptic pairs | Supersingular Hom dimensions 4=4; ordinary End dimension 2 versus Tate End 4. Conjugate CM: geometric K-Hom 0 versus ℓ-adic K-Hom dimension 2; corresponding p-slopes 0,1. | Common-slope hypothesis prevents false printed generality. |
| §9.2, R01 | Γ=〈diag(3,1/3,1)〉 on rank-three unitary space below | g*Hg=H; vertex types 3,3,1; intersection dimension 0. For every U∋x, η+∈U∩gU, whereas (ii) requires the empty set. | Refutes proof-route implication. |
| §9.2 positive/negative controls | Z translating disjoint copies; scalar {±1} | First quotient has one copy and orbit stabilizer order 1. Second action has stabilizer order 2, quotient map identity, torsor degree 1≠2. | Strong theorem with (ii) remains valid; ineffective action rejected. |
| §9.5 headline | Framing g=diag(3,1/3); two Hasse classes | gg⁻¹=id, g²=diag(9,1/9)≠id. One chosen isogeny component covers 1 of 2 classes, not both. | Framing and Z′ distinction correct; repair quotient route. |
| §9.6 headline | u²=ϖa with a a unit | v(u²/ϖ)=0; omitting ϖ⁻¹ gives valuation 1 and shifts lattice dual by ϖ⁻¹. | Normalization retained; R01 affects quotient step. |
| §9.7 headline | n=1,2; degree-two relative comparison | Local relative dimensions 0,1; comparison changes rank-one absolute dimension 2 to 1. | Relative comparison is not forgetting action; R01 affects quotient step. |
| §9.8 headline | CM moduli with two classes | Correct partition has 2 fibres; replacing CM factor by one point yields 1. | CM factor retained; R01 affects quotient step. |
| §9.9 headline | n=2 filtration | Subspace/quotient ranks 1/1, but structural and conjugate actions differ; special crossing has 2 branches. | Completed filtration retains action, not just ranks. |
| §9.10 seeded headline | q=3,n=2 | degα²=9·9=81, degα=9; degπ₁=4; π₂ generic degree 1 onto divisor, exceptional fibre P¹ of dimension 1. | No integral isomorphism asserted; R01 affects quotient step. |

For R01 the full check is short enough to reproduce. Let K=Q₃, L/K unramified quadratic, and give L³ the hermitian Gram matrix H=[[0,1,0],[1,0,0],[0,0,3]] in the basis e,f,a. Its determinant is −3. Set Λ+=O_L(3e)+O_L f+O_L a, Λ−=O_L e+O_L(3f)+O_L a, and Σ=Λ++Λ−=O_L e+O_L f+O_L a. Then:

| Lattice | Dual lattice | Length of dual quotient |
|---|---|---|
| Λ+ | O_L e+O_L(f/3)+O_L(a/3) | 3 |
| Λ− | O_L(e/3)+O_L f+O_L(a/3) | 3 |
| Σ | O_L e+O_L f+O_L(a/3) | 1 |

In each row 3Λ♯⊆Λ⊆Λ♯. The isometry g=diag(3,1/3,1) sends Λ− to Λ+. Its powers have valuations (m,−m,0), so Γ is discrete infinite cyclic, torsion-free and residually finite. RZ96 Propositions 2.34–2.35 apply. LZ22 lines 465–485 identify the type-three strata C± as irreducible curves and their intersection V(Σ) as one point x. Every open neighbourhood U of x contains both generic points η±. Since gη−=η+, the intersection U∩gU contains η+. Freeness on points, even generic points, has not furnished the disjoint neighbourhood required by (ii).

### Headline signatures, pin audit and padding

The README summary names §§1.2, 2.2, 3.4, 3.7, 5.7, 6.6, 7.2, 7.7–7.9, 8.3, 8.7 and 9.5–9.10. The module docstring lists all these families and additionally the deep Tate–Dieudonné comparison §9.1, with the missing carriers. The smoothness and semistability statements need structured relative p-divisible groups and formal schemes; CM finite étaleness and global models need abelian schemes with PEL structure and moduli stacks; the uniformizations need formal completions and discrete quotients. The abstract isocrystal does not supply the Dieudonné realization needed to state §9.1's common-slope hypothesis.

`packages/PELModuliPartII/Suggested.lean` has zero declarations. Accordingly every sorried theorem was covered by the padding audit: there are zero one-tactic probes, zero declaration-signature `#check` probes and no dropped section binders to test. No stand-in, padding, fully qualified declaration collision or unimplemented backticked name attributed to this package was found. The empty namespace is appropriate at these pins; no statable headline was identified as omitted.

The prescribed `lake env lean` elaboration was run from the content checkout on the package file: **exit 0, no output and no warnings**, including no sorry warnings. Only `import Mathlib` is present; no Tau Ceti object-file build was required. Nothing was left running.

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declarations were opened at those pins, not inferred from a newer library:

| Pinned declaration | File and line | Scope checked |
|---|---|---|
| `LinearMap.charpoly`, `charpoly_monic`, `charpoly_natDegree` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, lines 72,76 | Finite free endomorphism, commutative ring; rank condition on degree. No annihilator equation supplied. |
| `Matrix.charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140` | Determinant characteristic polynomial, agrees with Jordan control. |
| `Module.Grassmannian` | `Mathlib/RingTheory/Grassmannian.lean:66` | Quotient finite projective with constant rank, not a representing scheme; representability remains in named supplier. |
| `WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean:52` | Coefficient-sequence carrier for p-typical Witt vectors, not relative O-Witt vectors. |
| `WittVector.Isocrystal` | `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` | Abstract module and Frobenius structure; no abelian-variety realization functor. |
| `IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:52` | Local and noetherian hypotheses, embedding-dimension/Krull-dimension equality. |
| `AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean:40` | Locally affine locally ringed space; no automatic separation or noetherian condition. |
| `AlgebraicGeometry.Flat` | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42` | Flatness of scheme morphisms. |
| `AlgebraicGeometry.Smooth`, `SmoothOfRelativeDimension` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59`, line 127 | Scheme-morphism notions, not a category of formal schemes. |
| `TauCeti.AlgebraicGeometry.AbelianVariety` and its smooth instance | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, line 127 | Field base, group object, properness and geometric integrality; smoothness proved. Does not bundle a family over an arbitrary base. |
| `TauCeti.FormalScheme.Spf.carrier` | `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73` | Underlying topological space of open prime ideals. |
| `TauCeti.FormalScheme.Spf.structureSheaf` | `TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean:262` | Affine formal-spectrum structure sheaf. Not a formal-scheme category with morphisms and formal smoothness. |

Object searches in both pinned trees for formal schemes, abelian schemes, p-divisible groups and Dieudonné realizations were checked against the actual definitions. The four files in Tau Ceti's formal-spectrum directory supply affine constructions, not the missing category. This is a reason for the empty acceptance file, not permission to encode the missing moduli with arbitrary predicates.

### Supplier order, contracts and duplication by object

The board package index was read before making ownership conclusions. The current main is `5fc1aa8`; open-head checks use the supplied 439-pull-request index. The citation resolver reports no unresolved cross-roadmap citation or claimed Lean name. Its library availability diagnostic was not relied upon: the pinned files above were inspected directly.

Every Needs line and supplier citation was checked against the supplied main or open head. In the table, file paths are `TauCetiRoadmap/<supplier>/README.md`; the listed line is an anchor into the cited supplier, and the section lists record the consumed contracts rather than merely naming the roadmap.

| Supplier / available head | Resolved sections and file anchors | Ownership boundary |
|---|---|---|
| PELModuli, #966, `697b514` | `TauCetiRoadmap/PELModuli/README.md:583`: M0.4,.6,.7,.10,.16–.18,.22–.25; M1.1,.6,.7,.9,.13; M2.8,.11,.12,.14,.15; M3.1,.2,.8; M4.3,.5–.8; M5.5. Display anchor line 2607; CM anchor line 3393. | Generic PEL data and good-prime moduli remain there; relative/bad-prime extensions here. General nilpotent display equivalence remains a declared gap. |
| AbelianSchemesAndArithmeticModuli, #849 | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1838`: A4.1,.3,.7–.9; A6.10,.11,.13, starting line 3014 | Tate/de Rham, Grothendieck–Messing, effectivity, Serre–Tate and degrees imported, not rebuilt. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, #879 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:576`: R07.1; R07.2.10,.17,.20,.26, starting line 3389 | General p-divisible and Dieudonné theory imported; covariant/contravariant conversion kept distinct from relative duality. |
| EndoscopicTransferAndUnitaryTraceComparison, #999 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:2842`: §§7.6,8.3,8.10,10.2; strict deformation anchor line 3623 | Strict dimension-one classification/deformations and finite-field Tate/Honda inputs imported; higher-dimensional relative categories here. |
| IgusaVarietiesAndTorsionConcentration, #1090, `5447ef6` | `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:611`, §0.27; line 742, §0.31 | Unstructured and unramified single-self-dual framed functors, and split Drinfeld-level model imported. Here §0.2 explicitly differs by EL data and arbitrary multichains. |
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:682`, Layer F0; line 7714, R2.9 | Formal carriers and generic fibre imported; arithmetic quotient and unitary moduli are not supplied by these general carriers. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2117`, Layer 1; line 5272, Layer 4 | Descent, spaces/stacks and deformation foundations imported. R01 concerns the additional quotient theorem, not missing ordinary descent. |
| AlgebraicModuliForArithmeticGeometry, #853 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:609`, §1.3 | Grassmannian representability, Plücker and tangent Hom imported. |
| GeometryOfNumbersAndQuadraticArithmetic, #851, `3b084ef` | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:703`, §2.7; line 769, §2.9 | Lattices and local forms imported with explicit transpose conversion. |
| PadicHodgeTheory, #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:682`, §§3.3–3.5; line 1427, §8.3 | Crystalline realization and good reduction are inputs; no duplicate comparison foundation proposed. |
| ShimuraVarieties, #933 | `TauCetiRoadmap/ShimuraVarieties/README.md:492`, §1.7; §§2.5–2.7 at line 625, §4.5 at 1227, §5.10 at 1680, §6.7 at 1897 | Level category, algebraization, torus CM and canonical models imported. |
| AdelicAlgebraicGroups, #792 | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4101`, §4.1 | Weak approximation/torsors do not silently supply prescribed hermitian invariants; gap is explicit. |
| ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:4664`, RG2.3.5 | Existing GL/GSp stabilizer result does not remove the ramified unitary multichain gap. |
| ShimuraCompactifications, #1053 | `TauCetiRoadmap/ShimuraCompactifications/README.md:2344`, §7.5; line 2633, §7.18 | Good-prime projectivity/properness imported; remaining integral multichain problem is the declared supplier contract. |
| SelmerIwasawaCohomologyPartII, #1403, consumer | `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md:341`, §§2.2–2.4,2.6; §§5.2,5.4 at lines 689,713 | Balloon/ground/link strata, special-fibre correspondence and reciprocity remain downstream. This package owns their native integral moduli, not those strata. |

The four gap slugs agree between `packages/PELModuliPartII/design/plan.json` and the README's Exact supplier contracts: `zink-display-equivalence`, `hermitian-local-global`, `unitary-multichain-stabilizer`, `bad-prime-projectivity`. Each has a named supplier, precise hypotheses and a specific missing mathematical result. Comparison with those supplier sections and the pinned objects found no already-supplied duplicate. The integral multichain projectivity contract is one coherent moduli theorem; its representability, Hodge line and properness conclusions are not unrelated requests. These contracts are not findings.

The ownership search used `roadmaps grep` by mathematical object, with narrowed searches after a broad uniformization search reached its output limit. It covered strict formal modules and displays, relative duality, unitary Rapoport–Zink spaces, formal quotients, hermitian local–global existence and basic uniformization. The closest open heads were then read:

- #1005, `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:2045`, §§R18.5.12a–R18.5.12c, builds the auxiliary quaternionic PEL datum with F-valued homogeneous multipliers and the split Drinfeld factors. It does not state the CM-pair unitary theorem here. Its formal Drinfeld quotient is a specific arithmetic curve construction, not §9.2's asserted general implication.
- #1843, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:5`, Scope and ownership, concerns general complete-local Dieudonné/display comparisons; this package imports the ordinary display foundation and constructs relative strict O-structures and their unitary geometry.
- #1090, #966 and #1403 resolve as in the table. Their carriers and consumers are separated explicitly in this package's Scope and ownership.
- #1511, `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:224`, declares a basic Hodge-type uniformization input; its later use at line 2139 is conditional on that input and does not construct these integral CM-pair models.

No duplicate owned object or reciprocal ownership handoff was identified in those heads. Since Suggested.lean declares nothing, it cannot duplicate another roadmap's fully qualified declaration. The overlap facts report no conflicting head changing this package, no cited id dropped, and no citation depending only on an unnamed open revision; the listed near-neighbours were checked as above.

The prescribed dependency command completed successfully. Its output was:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line and no merge-order edit. The downstream Selmer citation is a consumer boundary, not an upward Needs edge. No forbidden supplier was used.

## Not verifiable

- Zhang21's cited published pagination, including pp.904–905 for §7.1, cannot be independently certified from the available arXiv extraction. Definition 6.1 and its mathematical content were read at cached pp.29–30. No missing-text request was created for this settled version limitation.
- LTXZZ22's published page numbers cannot be independently certified from the available arXiv v3 extraction. Definitions 4.2.2 and 5.2.1, Theorems 4.2.3 and 5.2.5, and the relevant remarks were checked at their preprint numbers and pages. The report does not claim to have read the publisher's paginated text.
- There is no additional unread source blocking the mathematical sample. No claim is made about unindexed revisions newer than the supplied open-head index.

## Source issues

- **Error** in RZ96 at Corollary 6.29, printed p.293: the source says separate isoclinicity for two polarized K-objects suffices for the ℓ-adic Hom comparison; it should require equal slopes at corresponding p-adic places; affects a stated result.
- **Misprint** in LZ22 at §13.4, printed p.82: the source says the mixed isogeny has degree q; it should have degree q², as forced by the polarization identity; affects a stated result.
- **Misprint** in LL22 at §4.5, printed p.66: the source says the rank-n exotic condition is imposed on A₀; it should be imposed on A; affects a stated result.
- **Misprint** in HLSY23 at Definition 2.2(2), printed p.10: the source says a height-zero linear quasi-isogeny suffices for the framing; it should also require pullback compatibility with the polarization up to the permitted unit; affects a stated result.
- **Misprint** in LTXZZ22 at Definition 4.2.2, preprint p.37: the source says the unitary Hecke parameter uses finite adeles of F; it should use finite adeles of F⁺, the unitary group's ground field; affects a stated result.
- **Error** in LTXZZ22 at Remark 4.2.5, preprint p.38: the source says a condition on the zero source Hodge subspace defines a line; it should restrict the image of the whole source component to the target Hodge line; affects a stated result.
- **Gap** in LTXZZ22 at Theorem 4.2.3, preprint p.37: the source says integral projectivity is equivalent to generic projectivity; it should justify integral properness in addition to quasi-projectivity; affects the proof.
- **Gap** in LL22 at §4.5, printed p.66: the source says the integral model is projective by RSZ20 Theorem 4.7; it should supply properness and an ample line, since that theorem only establishes representability, flatness, smoothness and the generic fibre; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b32b34aefa75a27730d4dfd11193e75700473ea1", "job": "REV-PKG-PELModuliPartII~4", "model": "gpt-6-astra", "worker": "chris-32"} -->
