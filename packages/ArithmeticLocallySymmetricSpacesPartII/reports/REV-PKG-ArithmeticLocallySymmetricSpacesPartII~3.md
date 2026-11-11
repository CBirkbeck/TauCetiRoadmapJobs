<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13108#issuecomment-6783558916 -->
Review (codex) of 8ac6e0e

Verdict: accepted
Conditional on the announced gaps: `flat-microlocalisation`, `algebraic-quotient-comparison`, `integral-central-faithfulness`, `generic-cyclic-growth`, `skew-rank`, `canonical-dimension-zero`

No findings. Acceptance is conditional on the six declared supplier gaps listed below. All four findings from round 2 are repaired. The package's two headline statements elaborate at the pins; neither is padding. No package source, Lean, metadata, manifest or design file was changed.

## Verified sound

### Previous findings, checked first

Locations in this table are in `packages/ArithmeticLocallySymmetricSpacesPartII/README.md`.

| Previous finding | Repaired passage | Status and verification |
| --- | --- | --- |
| R01: arithmetic refinement and strong approximation | :434: “at every place v′ of F above q, intersect the factor with the principal congruence kernel”; :513: “Strong approximation for SL₂ over F (AdelicAlgebraicGroups §4.2” | **Repaired.** The parent contract at :50 now includes ALS.0.7, ALS.0.11 and ALS.1.5; :52–54 supplies the new strong-approximation contract. These sections exist and have the consumed hypotheses. The Needs lines and layer dependencies include them. The same repair reaches Conventions and §5.7. Product levels are good in the parent's convention; the refinement is neat over F and after restriction of scalars to ℚ. |
| R02: Burnside-density supplier | :187: “extend scalars to an algebraic closure ℚ̄_p”; :46 names `Representation.asAlgebraHom_surjective_of_isIrreducible` | **Repaired.** The theorem was opened at the Tau Ceti pin; it requires algebraic closure and finite-dimensional irreducibility, precisely as used after extension. Its citation also occurs in §0.3's Needs and Layer 0 Dependencies. The added corestriction citations in §§4.2 and 5.7 exist at the pin and have the right direction. |
| R03: degree reused as radicand | :650: “write F=ℚ(√−u) with u>0 squarefree (u is a radicand, not the degree d=2)” | **Repaired.** The positivity proof and Check now distinguish u from d. For u=1,2,5, the discriminants are −4,−8,−20, and A/B=5/3,3,5. No remaining degree-as-radicand occurrence was found. |
| R04: empty tensor at zero weight | :426: “a tensor over the d complex embeddings whose factors `Sym^0(ℂ²)` are each one-dimensional” | **Repaired.** The actual Lean index is Hom(F,ℂ), of size d≥1. At degrees 1,2,3, zero weight gives respectively 1,2,3 factors, each of dimension 1. The genuine empty product in §0.1 remains correctly equal to 1. |

The repair report marks no finding not actionable. None is re-raised. I checked each changed passage and its other occurrences: new supplier contract and Scope sentence, Conventions' component comparison and Check, density and corestriction citations, §§3.1–3.2, the ordinary route in §4.2, §§5.6–5.7, and the affected dependency lists. The computed rows below include these changes. For unchanged text, round 2's computed adversarial rows were retained as evidence, not its unsupported summaries; all 15 newly seeded targets were checked again against the text.

### Principles, shape and completeness

Read all 30 numbered targets, their APIs, Checks and Needs lines, six mathematical layers, six gap contracts and ten source-correction sections. Consulted main's `TauCetiRoadmap/ModularForms/README.md`, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` and `Completed/Chebotarev/README.md` for upstream shape and the consumed sections.

This is an extension of ArithmeticLocallySymmetricSpaces, not a replacement. The parent owns the finite-level geometry and support theory; CompletedCohomologyPartII owns the tower theory; the package owns the weight estimates and specialized SL₂/Bianchi calculations. The layer order is forced by the displayed dependencies: torsion estimates → rank estimates and dimension shifting → arithmetic realization and descent → global upper bounds, followed by the independent boundary/type calculations needed for sharpness. It does not reproduce Fu's chapter order.

No computational algorithm, copied source passage, upward supply, prohibited supplier, sorry-defined data, `set_option`, arbitrary predicate substitute or circular proof route was found. Odd p is the domain/uniformity hypothesis for the auxiliary local group; the global assertion retains every fixed level, and §5.4 explicitly includes the dyadic ramified types. Finite coefficient extensions and the distinction between bounded-denominator rationalization and completion are preserved.

The definition blocks (§§0.1, 0.3, 2.1, 3.1, 3.3, 5.4 and the counting objects of §5.5) state their construction, API and at least three discriminating Checks. In §5.5 the count, twist-fixed count and principal-component formula supply the API in prose. Theorems retain hypotheses and locators; each layer has Examples and Dependencies. Every own backticked declaration name resolves to one of the four Lean declarations. Source symbols in formula spans are mathematical notation, not promised Lean identifiers. Publication/version dates identify sources, rather than narrating package processing. No job identifier, pull-request number, machine path, hand-off note or HTML anchor occurs in the roadmap or Lean file.

### Seeded source sample

All six manifest entries were opened at their recorded legal cached versions. No locator is marked unverified, waived or uncertified in this package. No additional source was needed, so the manifest and missing-reference list were not changed. Page numbers below are the author/preprint or printed-volume pages explicitly specified by the package.

| Sampled target | Locator and extraction witnesses | Result |
| --- | --- | --- |
| §0.3 External tensor coefficient family | fu24 §6, pp.21–22, lines 1044–1056, 1094–1115, (32) | Tensor symmetric powers, self-duality and the full rational matrix quotient are supported. The roadmap supplies an explicit density route with absolute irreducibility, rather than claiming the integral image is all lattice endomorphisms. |
| §1.2 Cyclic Iwasawa multiplicity estimate | fu24 Theorem 3.2 and proof, pp.8–11, lines 405–409, 530–554; Theorem 4.3, p.15, lines 725–747; §6, pp.22–23, lines 1116–1131; aw14 §4.6, p.11, line 491; §5.4, p.16, lines 730–743 | Nonzero cyclic generators and the comparison route match. The four analytic inputs remain declared gaps; the source's small-coordinate omission is repaired by an explicit all-weight bound. AW's positive deformation-index limitation is stated rather than hidden. |
| §1.3 Cyclic control of finite torsion modules | fu24 §6, p.23, lines 1128–1131 | Finite cyclic subquotients are dominated by principal quotients with nonzero annihilators. The roadmap correctly claims surjections, not isomorphisms. Its Ore-rank argument supplies the stated general ring version. |
| §1.4 Torsion-module weight bound | fu24 §6, pp.22–23, lines 1116–1138 | The dual-coinvariant identity and finite sum of cyclic bounds support the torsion result. Self-duality is used only after retaining W*. |
| §2.1 Free approximations with ranks | fu24 (33)–(34), pp.22–23, lines 1121–1128 | Free injection has skew rank a; presentation rank ℓ may be larger. Exact localization supplies rank N=ℓ−a and torsion cokernel. No canonical choice is claimed. |
| §2.6 Fu's local homology theorem | fu24 Theorem 1.4, p.3, lines 123–137; §6, pp.21–23, lines 1046–1056, 1121–1149 | Rank main term and multiaffine degree ≤m−1 errors agree. The roadmap explains the single polynomial for all degrees using finite global dimension 3m and finitely many syzygies. Odd p is explicit in the source's §6. |
| §2.7 Finite-dimensional multiplicity support | fu24 p.4, lines 142–143; aw13 §§10.12–10.13, p.77, lines 3598–3628 | AW's finite-dimensional criterion and its setting were read. Index zero is supplied only by the declared gap. Finite support and the length bound then follow from pairwise distinct absolutely simple W_k; no classification of all finite-dimensional modules is claimed. |
| §3.1 Archimedean weights and split-prime indices | fu24 pp.1–2, lines 29–46; marshall12 §2.1, pp.3–4, lines 118–144 | Real exponent κ−2 and paired complex exponents κ/2−1 match. The arbitrary embedding tuple in Lean is intentionally broader than an admissible place tuple, as Fu §7 and Marshall Lemma 11 allow. |
| §3.2 One auxiliary prime for a fixed level | fu24 §7, pp.23–24, lines 1150–1169; Theorem 1.2, pp.2–3, lines 89–94 | The source selects an odd split prime and product level. The arbitrary-level and neatness extension is proved using Chebotarev Layer 10, ALS.0.11 and pullback/trace, not attributed to a nonexistent source lemma. The prime and level are fixed before weights vary. |
| §3.3 Coefficient realizations | fu24 (37), p.23, lines 1158–1161; marshall12 (7), p.4, lines 171–174; §5, (29), Lemma 11, pp.15–16, lines 607–658 | Common number-field representation and the two scalar extensions support dimension comparison. Choosing p split in the normal closure makes its p-adic embedding land in ℚ_p. Flat field extension is distinguished from integral reduction. |
| §3.4 Completed-homology descent | fu24 (38), p.23, lines 1162–1169, and unnumbered bound on p.24, lines 1172–1179 | Rank-zero modules and the finite-filtration dimension inequality are supported. No spectral-sequence degeneration is asserted. The full restriction-of-scalars local group has dimension 3d. |
| §4.4 Bianchi linear upper bound | fu24 Theorem 1.2 and Corollary 1.3, pp.2–3, lines 89–98; §7, p.24, lines 1172–1181 | d=2 gives linear growth. κ=2(n+1) is preserved. Arbitrary congruence group cohomology uses the package's explicit restriction/corestriction extension; support notation is corrected rather than copied. |
| §5.3 Classical fixed-type dimension estimate | fgt10 Proposition 4.18, pp.25–26, lines 1340–1349; serre77 I §1.5.3, p.20, lines 625–627; I §4.2(c), p.52, lines 1521–1530; II §2.8, p.169, lines 5190–5196 | The displayed periodic formula has the source's coefficients. The package adds the necessary ι-stability hypothesis and proves why the cohomological calculation determines 2m(σ). The N=3 counterexample is genuine; the GL₂-type application satisfies the extra hypothesis. The readable second Serre locator resolves the first display's OCR damage. |
| §5.4 Ramified finite local types | fgt10 Definition 4.3, p.20; following Proposition 4.18 and Lemma 4.19, pp.25–26, lines 1350–1409 | Dimensions, U-invariants, central parity and S₃/S₄ traces match, including (2,2), (2,3), and ℓ=3. The minimal conductor model and restriction from GL₂ are retained. |
| §5.6 Positive linear base-change contribution | fgt10 Theorem 4.17, pp.24–25, lines 1288–1326; Proposition 4.18/Lemma 4.19, pp.25–26; Corollary 4.20, p.27, lines 1417–1421 | A_F and B_F match the source. The corrected radicand proof establishes strict positivity A_F>B_F, stronger than the source proof's stated nonnegativity. The CM and periodic terms are bounded, not discarded. |

Also reread the support and transfer passages used by the repaired routes: fgt10 lines 127–166 and 940–945, and the base-change count at lines 1181–1216. The two ordinary headlines are deductions assembled from these inputs and the supplied geometry; neither source alone is claimed to state every support and level variant.

### Computed adversarial evidence

The table covers all sampled targets, all headlines, all repair passages, and the remaining target families. For unchanged claims I also checked the applicability of round 2's computed rows. New exact arithmetic verified 4,340 proper-face monomial/input pairs, every squarefree positive radicand below 400 (243 fields), fixed-type examples, Gaussian base-change counts, and cusp Koszul ranks for n=0,…,3. These finite computations are discriminating tests, not substitutes for the general proof routes.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: Casimir and dual action | k=0,1; p=3; noncommuting g=(1 3;0 1), h=(1 0;3 1) | Δ=½k²−k+2k=½k(k+2), values 0,3/2. gh=(10 3;3 1), hg=(1 3;3 10). g⁻¹(0,1)=(−3,1), whereas g(0,1)=(3,1). | Correct signs and inverse untwisting; no change. |
| Conventions: arithmetic component | unit ideal; F=ℚ(√−5) | K=SL₂(Ô_F), Γ=SL₂(O_F); SL₂ double-coset count 1 versus GL₂ count h_F=2. For x∈SL₂(F)∩γK(𝔞), γ⁻¹x∈Γ(𝔞)⊆Γ. | Both containments and the single-component claim hold. |
| §0.1 proper-face polynomial/API | m=1; m=3, c∅=2,c₀₂=3,x=(2,5,4); empty product | B is constant for m=1; 2+3·2·4=26; D(2,4)=8 rather than 6; D(∅)=1; D(k+1) at k=0 is 1. | The full product is excluded; a quadratic term on (t,t) cannot be bounded by a fixed linear polynomial. |
| §0.2 minimum saving | B=2+3x₀+5x₁, x=(2,4),a=2; all m≤4,x_i≤4 | 28≤10·8/2=40; B(t,t)=2+8t≤10t for t≥1. Every proper monomial≤D/min in all 4,340 cases. | a≥1 excludes division by zero. |
| §0.3 family/action quotient; repaired density route | k=0,(1,2),2; p=3,k=1; torus control | dim W=1,6,3; dim End=1,36,9. I+3e and I+3f yield e,f; ef=E₁₁,fe=E₂₂, so span dimension 4=2². Torus span dimension 2<4. | Density works after algebraic closure and descends; rational, not integral, surjectivity. |
| §1.1 evaluation | M=A,W=W_(1,2); M=0; diagonal character a | Hom dimension 6=coinvariant dimension 6; zero gives 0=0; pairing transforms by a·a⁻¹=1, wrong dual by a². | Handedness and finite-dimensional duality agree. |
| §1.2 cyclic estimate | δ=1; δ=0; m=1; α=(3,3),k=(1,t) | δ=1 gives 0; excluded δ=0 gives D. For m=1 bound=2α. Small strip has D=2(t+1)≤6(t+1)+12. | Uniform bound covers infinite strips, not just a finite exceptional set. |
| §1.3 cyclic filtration | R=ℚ_p[X,Y], T=R/(X,Y), W=R/(X,Y) | One cyclic factor; R/(X)→T is onto. Hom(T,W)=1=Hom(R/(X),W), but coefficient dimensions are 1 and ∞. | A surjection is sufficient; the stronger isomorphism would be false. |
| §1.4 torsion bound | T=0; T=W₀⊕W₀ | Hom to W₀ has dimensions 0 and 2; to other W_k it is 0. Bounds B=0 and B=2 work in every m≥1. | Finite summation stays proper-face. |
| §2.1 free approximations | M=A²; R/(X); ideal (X,Y) in R=ℚ_p[X,Y] | (a,ℓ,rank N,rank T)=(2,2,0,0),(0,1,1,0),(1,2,1,0). | ℓ need not equal a; choices have actual exact maps. |
| §2.2 upper rank bound | M=A²,k=(1,2) | H₀ dimension 12=2·6+0; free positive homology 0. | Right exactness suffices; no injection on H₀ is assumed. |
| §2.3 lower rank bound | ℓ=2,a=1,D=6; rank zero | 12−(6+U_N)=6−U_N=aD−U_N; at a=0 lower side is −U_N≤0≤dim H₀. | Correct rank coefficient and allowance for negative lower bound. |
| §2.4 rank error | M=A²,k=(1,2); m=1 | abs(12−2·6)=0; total error degree≤0 for m=1. | Sum U_M+U_N dominates both errors. |
| §2.5 syzygy cancellation | ℓ=2,a=1,D=6; nonminimal free presentation | (6+U_N)−12+(6+U_M)=U_N+U_M. For A²→A by first projection, H₁(A)=0 but H₀(kernel⊗W)=D. | Shift starts at i=2; i=1 is the four-term identity. |
| §2.6 local headline | m=1,M=A²; m=2,i=7; p=2 | H₀=2(k+1), error=0, positive homology=0; 7>3m=6 gives H₇=0. At p=2, g=−I≠1 and (1−g)(1+g)=0. | Hypotheses exclude the non-domain first kernel at 2; finitely many degrees give one polynomial. |
| §2.7 finite support | M=W_(1,2); M=W₀⊕W_(1,2); M=A | Matching Hom dimension 1≤length 1≤6; second support has 2 weights, length 2≤7. A has canonical dimension 6 and infinite coefficient dimension. | No false algebraicity or semisimplicity classification is needed. |
| §3.1 place/embedding weights | (0,1),κ=6; (1,1),κ=(4,6); κ=2 | t=(2,2),D=9≤36,min x=3=6/2; t=(2,2,2),D=27≤144,min x=3≥2; D=1≤2^d at zero t. | Complex κ=3 is excluded before integer division; d counts embeddings. |
| §3.1 Lean definitions and repaired zero tensor | F=ℚ(i),γ=(i 1;−1 0); t=(1,0),(n,n),0 | det γ=1; traces i and −i give E₁ trace 1, wrong same-embedding trace −1. −I acts by −1,+1,+1 respectively. Zero t has 2 factors, dimension 1·1=1. | Actual matrix/tensor bodies determine the intended representation. |
| §3.2 repaired neat refinement | F=ℚ(i),p=5,q=3; γ=(1 1;−3 −2); ramified q | Two pro-5 factors and one pro-3 factor; gcd(5^a,3^b)=1. γ²=(−2 −1;3 1), γ³=I, det=1. Every principal-kernel filtration quotient at q is q-primary. | One pro-q Iwahori can contain torsion; two distinct characteristics remove it. All q-factors are shrunk for the ℚ restriction-of-scalars assertion. |
| §3.3 realization | Bianchi κ=6; [L:ℚ_p]=e; integral complex O --p→ O | Coefficient dimensions 9=9; dim_L L=1, dim_ℚp L=e. Over the fraction field homology is (0,0); mod p it is (1,1). | Field extension is flat; arbitrary reduction would fail. |
| §3.4 descent | imaginary quadratic d=2; total degree 2 | Local indices 0,…,6; geometric degrees 0,…,3, hence at most 28 pairs. Degree 2 uses (0,2),(1,1),(2,0); filtration dimension is ≤sum of those E² dimensions. | Finite sum of proper-face bounds; full p-product dimension 6, not 3. |
| §4.1 cusp/support comparison | signatures (0,1),(1,1); genus-zero four-cusp curve | q=1, multiplier 1; q=2, multiplier 2. Curve ordinary H¹=3, cuspidal H¹=0. | The support distinction and nontrivial-coefficient condition survive. |
| §4.2 ordinary Lean headline | t=(n,n),a=n+1 or 1; t=(n,0); t=0 | Dividing the stated inequality gives C(n+1), C(n+1)², C(n+1), C respectively. Minima are n+1, n+1,1,1. | C precedes all weights/degrees/a; finite-dimensionality is explicit, avoiding finrank's infinite-dimensional value 0. |
| §4.2 boundary hypotheses and repaired route | F=ℚ,k=10,22; 𝔞=0,1; restriction index r | Real case H¹=3,5 and unbounded, whereas claimed saved bound would be constant. 𝔞=0 gives trivial kernel; 𝔞=1 gives whole SL₂ kernel. cor∘res=r·id, r≠0 in ℂ. | Not-totally-real and nonzero ideal are necessary. Strong approximation's one factor is noncompact; no normality is needed for injective restriction. |
| §§4.3–4.4 | (1,1) parallel κ; imaginary quadratic κ=6 | κ³/κ=κ²; κ²/κ=κ; κ=6 gives n=2 and dim E₂=9. | Correct d−1 exponent and n+1 normalization. |
| §5.1 cusp complex | n=0,1,2,3; z₁=1,z₂=i | Chain dimensions (1,2,1),(4,8,4),(9,18,9),(16,32,16); differential ranks (0,0),(3,3),(8,8),(15,15); H=(1,2,1) each time; determinant −2i. | Nontrivial monodromy is essential: trivial rank-9 coefficients would give (9,18,9). |
| §5.2 support bridge | c cusps, i=1,2; n=0 | Ordinary-minus-interior≤b_i, compact-minus-interior≤b_(i−1); their difference lies in [−b_i,b_(i−1)]⊆[−2c,2c], hence abs≤3c. H_c³=1 at n=0,0 at n>0. | Safe bound and constant-coefficient exception are retained. |
| §5.3 fixed-type formula | N=1,k=2,12; N=2,k=6,8 | Level one multiplicities 0,1. For N=2, (trivial,sign,standard) multiplicities (0,1,0),(0,0,1), total dimensions 1,2. | Periodic signs and weight-two correction agree. |
| §5.3 ι-stability negative control | N=3,k=4,σ=ω or ω⊕ω̄ | Single character expression 3/12+1/4=1/2; actual multiplicities 0 and 1. Stable pair expression 6/12+2/4=1. | The extra hypothesis excludes the source counterexample and includes every type used in §5.6. |
| §5.4 local types | (ℓ,ν)=(2,2),(2,3),(3,1),(7,1) | Principal dimensions 6,12,4,8; supercuspidal dimensions 2,4,2,6. Supercuspidal traces (S₃,S₄)=(2,0),(−2,0),(−1,2),(0,−2); U-invariants 0 versus principal 2. | Dyadic cases and ℓ=3 sign agree with source. At 3, S₄ lies in Q₈ kernel of the two-dimensional S₃ quotient type, giving trace +2. |
| §5.5 base-change count | two ramified primes; Gaussian and Eisenstein corrections | 4·1/4=1 per non-CM fibre. Gaussian ν/2 at n=0,1 is 0,1/2; Eisenstein at n=0,1,2 is 0,0,1/2. Principal ideal character values +1 cancel the ℒ correction. | Normalizing denominator has at least the trivial character; periodic CM terms remain. |
| §5.6 repaired positivity | u=1,2,3,5,7; all squarefree u<400 | (disc,A,B)=(−4,5/24,1/8),(−8,3/8,1/8),(−3,1/6,0),(−20,5/4,1/4),(−7,1/3,0). Minimum slopes 1/12,1/4,1/6,1,1/3. | 243 exact tests satisfy A>B. If B>0, disc=−4u and A/B≥(5/3)3^(s−1)>1. |
| §5.7 repaired degree-two descent | Γ′=Γ(𝔞𝔭𝔮); distinct residue p,q; Q=C₂ control | Γ′⊴SL₂(O_F), Γ′⊆Γ; local factors pro-p and pro-q. cor∘res=[SL₂:Γ]. For trivial Q-module V, dim V^Q=dim(V*)^Q=1; inserting an orientation sign would give 0. | SL₂(ℂ) is connected, so its action preserves orientation and no sign twist occurs. |
| §5.8 Bianchi headline | Gaussian maximal level n=0,1,2,5,99,100 | Exact FGT base-change dimensions 0,0,0,1,32,8; leading terms at 99,100 are 100/3,101/12. E_n central sign (−1)^(2n)=1. | Threshold is necessary; parity does not justify a single limiting slope. Both ordinary degrees are covered. |
| §5.8 support variants | neat level, c cusps | Interior lower bound c₀(n+1) remains in ordinary and compact support; upper discrepancies≤2c, or safe ordinary/compact difference≤3c. | Fixed additive errors are absorbed into constants and threshold. |
| Analytic gaps | M=A,0,W_(1,2); p=3,λ=1 | Extension gives Û,0; algebraic quotient dimensions 36=36 and 6=6. μ=−1±√3 gives ½μ(μ+2)=1; v₃(3)=1 excludes a ℚ₃ square. | Named source/target maps; finite extension followed by descent is essential. |
| Rank and canonical-dimension gaps | division ring; (X,Y); M₂(ℚ_p); W_k,A | R^a has rank a; ideal rank 1 with presentation kernel rank 1; E₁₁E₂₂=0 excludes matrix ring; canonical dimensions 0 versus 3m. | Domain/nonzero hypotheses discriminate the intended objects. |
| Source corrections E1–E10 | ramification e=2; weighted coefficients p^(−n),r=1/p; large λ; α=(3,3),k=(1,t) | 0=p+(−p)∈p+𝔪²; weighted tails have norm 1; norm(Δ/λ)<1 gives a geometric-series inverse and zero quotient; 2(t+1)≤6(t+1)+12. | These source defects are not imported as assumptions. Support, square-condition, index and ι-stability controls appear above. |

### Lean acceptance test and headline coverage

Ran the prescribed `lake env lean` on `packages/ArithmeticLocallySymmetricSpacesPartII/Suggested.lean` from the pinned content checkout: **exit 0; exactly two warnings, both “declaration uses `sorry`,” at lines 70 and 89**. The used Tau Ceti object file was present; no build was necessary. The header uses the pin's module-system spelling `public import Mathlib`, followed only by the used symmetric-power module. There are two real-body definitions and two theorems, no admitted examples or data.

Elaborated a scratch copy containing `#check @` for **all four declarations**; verified its pre-check contents equal the package. Both definitions retain `[Field F] [NumberField F]` and the subgroup/embedding data. The upper theorem retains ¬IsTotallyReal, nonzero ideal and kernel inclusion; its ∃C precedes t,i,a. The lower retains IsTotallyComplex, degree two, nonzero ideal and kernel inclusion; c,C,n₀ precede n,i. No binder was lost, and no signature changed.

On another scratch copy, replaced **both** `sorry` bodies with alternatives requiring `simp`, `rfl` or `infer_instance` alone to close the goal. Neither theorem closed; both final alternatives reported that the existential goal is not a type class. Opened the near-match declarations at the pins: subsingleton-group vanishing, the Ext comparison and a bound on the norm of an individual cusp form do not imply either dimension-growth assertion. No one-lemma match, definition restatement, numerical Check or boundary-case padding was found.

| README headline | Acceptance-test coverage |
| --- | --- |
| §2.6 uniform local homology | Docstring explicitly names it as not statable: rational completed Iwasawa homology with diagonal action and classical Ore skew rank are missing. Native completed group algebra alone does not supply these. |
| §4.2 sharp global cusp-form bound and ordinary form | Ordinary form is `finrank_groupCohomology_weightRep_le`. The docstring identifies the missing adelic cusp-form carrier for the automorphic form and §§4.3–4.4 consequences. |
| §5.8 two-sided Bianchi growth | Ordinary degrees 1,2 are `bianchi_groupCohomology_linear_growth`. The docstring names missing Borel–Serre/interior/cuspidal support carriers for the remaining forms. |

### Pinned library inventory

Pins were read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declaration bodies/types were opened at those pins, including the newly cited density and transfer theorems. Paths here are relative to the corresponding library repository.

| File and line | Declarations and scope checked |
| --- | --- |
| `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:67,391,735,747` | `Finset.prod`, `Finset.prod_const_one`, `Fintype.prod_equiv`, `Fintype.prod_empty`: commutative products, empty value 1. |
| `Mathlib/Algebra/BigOperators/Group/Finset/Piecewise.lean:247`; `Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean:160` | `Finset.prod_update_of_mem`, `Finset.prod_pos`: membership and positivity assumptions. |
| `Mathlib/Data/Finset/Powerset.lean:31`; `Mathlib/Algebra/MvPolynomial/Basic.lean:80` | `Finset.powerset`, subset membership at :36; `MvPolynomial` is `AddMonoidAlgebra R (σ →₀ ℕ)`. No weight bound is part of either carrier. |
| `Mathlib/LinearAlgebra/Dimension/Constructions.lean:346,372,375` | `Module.finrank_tensorProduct`, `Module.finrank_baseChange`, with freeness, strong rank condition and scalar tower; satisfied by the finite-dimensional field instances. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183,194,202,215` | `groupCohomology` is `(inhomogeneousCochains A).homology n`; induction, `groupCohomologyIsoExt`, subsingleton vanishing. The native definition has no topology, support condition or finite-dimensionality hypothesis/conclusion. |
| `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225`; `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369` | `Matrix.SpecialLinearGroup.map`, `Matrix.SpecialLinearGroup.toGL`: entrywise map and actual matrix/inverse. |
| `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:530`; `Mathlib/Algebra/Group/Pi/Lemmas.lean:156`; `Mathlib/RepresentationTheory/Rep/Basic.lean:62` | `PiTensorProduct.mapMonoidHom`, `MonoidHom.pi`, `Rep.of`: actual endomorphism tensor and bundled action. |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:48,210` | `NumberField.IsTotallyReal`, `NumberField.IsTotallyComplex`; all infinite places real/complex. NumberField and degree hypotheses exclude vacuous field instances. |
| `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57`; `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:192` | `TauCeti.symPowerRep`, `SymmetricPower.finrank_eq`: standard GL action and multichoose dimension over finite free modules. No irreducibility on arbitrary subgroups. |
| `TauCeti/RepresentationTheory/Irreducible.lean:242` | `Representation.asAlgebraHom_surjective_of_isIrreducible`: algebraically closed field, finite-dimensional irreducible representation, surjective monoid-algebra action. |
| `TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean:98,136,165` | `TauCeti.groupCohomology.corestriction`, `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`: commutative ring, group and finite-index subgroup in one universe; restriction then corestriction is index times identity. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basic.lean:75`; `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean:96` | `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `Module.Basis.pbwBasis`: ordinary ordered PBW, not the completed central-reduction contracts. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`; `Module.lean:322` in the same directory | `completedGroupAlgebra` and compact-module action exist; the local headline still needs rational completed homology and skew rank. |
| `Mathlib/RingTheory/OreLocalization/Ring.lean:209–211` | DivisionRing instance assumes an OreSet of non-zero-divisors has already been supplied. It does not prove the noetherian-domain Ore condition or the full finite skew-rank API. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:410,420,426`; `Mathlib/NumberTheory/ModularForms/Bounds.lean:214,221` | Near matches concern SL₂(ℤ) in real positive-determinant matrices and analytic bounds on individual modular forms, not arbitrary-number-field tensor coefficients or cohomology dimensions. |

Object searches covered completed group algebras/actions, Ore localization/rank, Bianchi cohomology, algebraic action quotients, embedding tensors, cyclic torsion weight multiplicities, fixed-type dimensions and proper-face errors. No existing pinned theorem duplicates either headline. Existing products, symmetric powers, density, transfer and PBW are cited rather than redeclared.

### Supplier resolution and ownership at the available heads

Read `scratch/board-packages-index.txt` before checking existence. It lists the other board packages AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory; no absence claim relies on this checkout containing every branch. Used `roadmaps show` and object-based `roadmaps grep` over main and the supplied indexed open heads. The citation resolver returned no unresolved roadmap citations and no unresolved own Lean names; its native-library limitation was covered by the direct inspection above.

In this table each README path is repository-relative; open pull-request numbers identify the head inspected, not a proposed supplier citation for the roadmap.

| Supplier and file | Sections resolved at main/current indexed head |
| --- | --- |
| ArithmeticLocallySymmetricSpaces, #871, `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md` | §§ALS.0.7 (:1440), 0.9 (:1499), 0.11 (:1627), 1.1 (:1762), 1.5 (:1989), 1.6 (:2041), 1.7 (:2087), 1.8 (:2112), 2.5 (:2435), 2.8 (:2538), 3.6 (:2987), 4.1 (:3446), 4.5–4.7 (:3593,:3644,:3691), 5a.2 (:4060), 5b.4–5b.5 (:4383,:4459). Component decomposition, neatness, finite coefficient complexes, boundary, trace, duality and cuspidal injection are present. “Good” means neat product level (:249–254), satisfied by the constructed refinements; ALS.1.6 explicitly imports ALS.2.4's geometric cell construction. |
| AdelicAlgebraicGroups, #792, `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4580` | §4.2 semisimple strong approximation requires simply connectedness and noncompactness of each F-simple factor, not just of the whole group. SL₂/F and its restriction of scalars satisfy it. |
| CompletedCohomologyPartII, #1035, `TauCetiRoadmap/CompletedCohomologyPartII/README.md:759,1154,1277,1365,1382,1475` | §§3.1,4.2,5.1,5.6–5.7,6.3: inverse-action dual, bounded actual chain model, finite generation, specified semisimple congruence-tower torsion and completed hyper-Tor descent. Application over ℚ to Res SL₂ uses the full group of dimension 3d and twists constant coefficients once. |
| NoncommutativeAndEquivariantIwasawa, #1307, `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:271,378,435,525,626,654,969` | §§0.5,0.8,F.1,0.12,0.14,0.15,1.12: domain lifting, bounded denominators, noetherian topology, rational global dimension, inverse free twist, rational completed-Tor comparison and exact Ore localization. Analytic gaps are not falsely attributed to these sections. |
| LieHighestWeight, main, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319,405` | Layers 0 and 3: split characteristic-zero sl₂ classification/dimension and ordinary PBW interface. |
| Chebotarev, main, `Completed/Chebotarev/README.md:410` | Layer 10: identity Frobenius density, split-completely primes, infinitude, and removal of finitely many primes. |
| ModularForms, main, `TauCetiRoadmap/ModularForms/README.md:1247` | §10C: congruence-level sections and dimensions, with elliptic/cusp and parity corrections. The fixed-type calculation is an additional theorem here. |
| ModularSymbolsPadicLFunctions, indexed head, `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1161` | §0.7: Eichler–Shimura for every finite-index subgroup, compatible with normalizer actions. This includes the SL₂(ℤ/Nℤ)-action on Γ(N). |
| GL2AutomorphicRepresentationsAndTransfer, #931, `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:850,1349,2359,2379,2394,2402,2410` | §§R16.2.9,R16.6.3,R17.4.2–R17.4.6: supercuspidal type unicity; distinct totally-real determinant-twisted weight tensor; base change, all-place compatibility, descent, cuspidality and fibres. The package imports these and owns the finite SL₂ count and traces. |
| AutomorphicFormsOnReductiveGroups, #1037, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:234,765,786` | §§1.1,5.2–5.3: relative complex, specified-coefficient calculations and tempered range. SL₂(ℂ) has defect 1, giving degrees 1,2. |

The supplied `scratch/overlaps.md` reports no conflicting head, dropped cited id or revision-only id. A fresh `roadmaps overlaps` lookup cannot address this unported package by name (it reports no roadmap on main/open PR); this is not contrary evidence to the supplied package overlap calculation. I independently read the five vocabulary-near heads. BianchiModularForms #1719, `TauCetiRoadmap/BianchiModularForms/README.md:598,630`, owns GL₂ coefficient spaces and finiteness, and weight-two arithmetic, not Fu's weight bound or the FGT count. Its parameter k gives dimension (k−1)², matching this package at n=k−2 and κ=2(k−1). The arbitrary-number-field SL₂ embedding tensor here is broader and is built from the native factors. QuaternionicModularForms #934, `TauCetiRoadmap/QuaternionicModularForms/README.md:917`, owns a GL₂/quaternionic analytic comparison with central character, not these SL₂ estimates, and is not used as a supplier. The other three nearby heads are the tower, GL₂-transfer and relative-cohomology owners resolved above. No common fully qualified declaration or reciprocal ownership was found.

The required dependency command returned:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. AdelicAlgebraicGroups is at merge-order line 53 and this package at line 180. All consumed open suppliers precede the package; main suppliers are read on main. No consumer is used as an input.

### Conditional supplier contracts

All six slugs occur both in `packages/ArithmeticLocallySymmetricSpacesPartII/design/plan.json` and in the README's Exact supplier contracts, with matching needs and the named owner NoncommutativeAndEquivariantIwasawa:

- `flat-microlocalisation`
- `algebraic-quotient-comparison`
- `integral-central-faithfulness`
- `generic-cyclic-growth`
- `skew-rank`
- `canonical-dimension-zero`

The first four are assigned to Layer 0 after §0.15; the last two to §F.1. Each is a precise single-purpose mathematical contract with standing local hypotheses and explicit maps or invariants. Ordinary PBW, native Ore localization assuming an OreSet, completed-group-algebra actions, and the supplier's current rational homology are partial infrastructure, not the missing completed central comparison, Ore existence/rank or dimension-zero criterion. No supplier is `none`, no duplicated existing full theorem was requested, and the zero-deformation-index extensions are declared honestly. Acceptance does not certify fulfillment of these contracts.

## Not verifiable

- The six supplier gaps are not implemented proofs available at the pins. Their ownership, precision, minimality against the inspected APIs, source limitations and discriminating instances were checked; acceptance is conditional on them.
- Published pagination was not compared independently with the recorded author/preprint texts. The roadmap explicitly cites the versions that were read, so no source request is needed.
- The first Serre amalgam display has incomplete OCR. Its second cited locator gives the stabilizers 6,4,2 and the amalgam explicitly; the cohomology sequence is readable. Thus the mathematical input was verifiable despite that one damaged display.
- Ownership outside the supplied indexed heads and board index was not checked. The fresh standalone overlap command has no record for this unported package; the supplied package-specific overlap facts and inspected heads were used instead.

No essential cited text was unavailable, no missing-reference request is pending, and no Lean process remains running.

## Source issues

- **Misprint** in fu24 at Theorem 1.2, p.2: the source says to minimize over degree-many coordinates; it should minimize over the archimedean place weights; affects nothing.
- **Misprint** in fu24 at equation (2) and Corollary 1.3, pp.2–3: the source says the cusp comparison uses compact support; it should distinguish cuspidal/interior cohomology and transfer compact-support growth through the boundary; affects nothing.
- **Misprint** in fu24 at Proposition 3.4 proof, p.10 (fu24 line 508): the source says f raises and e lowers the h-weights; it should have e raise and f lower, with the basis ordered decreasingly for the displayed tail argument; affects the proof.
- **Gap** in fu24 at Theorem 3.2 proof, pp.8–11: the source says its displayed truncation estimate covers all weights; it should separately bound the infinite small-coordinate strips; affects the proof.
- **Error** in fu24 at equation (16), p.13: the source says bounded weighted coefficients describe the Banach completion; it should require weighted coefficients tending to zero; affects the proof.
- **Error** in fu24 at equation (17), p.14: the source says the displayed denominator set works over arbitrary finite coefficient extensions; it should use an unramified base then scalar extension, since the ramified set can contain zero; affects the proof.
- **Error** in fu24 at Theorem 5.7, p.20: the source says every stated central reduction is a domain; it should exclude parameters making the central relation invertible and the quotient zero; affects a stated result.
- **Gap** in fu24 at Theorem 5.7 proof, p.20: the source says density suffices for its quotient-filtration domain argument; it should establish separatedness or the necessary ideal contraction; affects the proof.
- **Error** in fu24 at Remark 5.8, p.21: the source says integrality characterizes induced parameters; it should also require the square condition on 1+2λ over the specified field; affects a stated result.
- **Gap** in fu24 at Theorem 1.5 discussion, p.4: the source says aw14 directly gives first-congruence faithfulness; it should supply the reduction from positive deformation index to index zero; affects the proof.
- **Error** in fgt10 at Proposition 4.18, p.25: the source says central parity suffices for its multiplicity formula; it should impose ι-stability, since an order-three type at N=3,k=4 gives one-half; affects a stated result.
- **Misprint** in fgt10 at §3.3, p.17: the source says its cohomological characterization applies to every unitary representation; it should restrict to irreducible unitary representations; affects a stated result.
- **Misprint** in fgt10 at the proof after Corollary 4.20, p.27: the source says a nonnegative linear coefficient proves positive linear growth; it should require strict positivity, which follows from the displayed coefficients; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8ac6e0e4eade88c715fa0542a7b95e9f63f1ef91", "job": "REV-PKG-ArithmeticLocallySymmetricSpacesPartII~3", "model": "gpt-6-astra", "worker": "chris-30"} -->
