# Review of ArithmeticLocallySymmetricSpacesPartII (package, round 2)

**Verdict:** needs changes

Four findings: one P1 supplier-contract defect and three P3 citation/notation/Check defects. The two Lean headlines elaborate, and no counterexample to either headline was found. The six declared supplier gaps remain valid contracts, not findings. No roadmap, Lean, metadata, source-manifest or design file was changed.

## R01 (P1) — Supply the arithmetic refinement and strong-approximation inputs explicitly

**Location:** `packages/ArithmeticLocallySymmetricSpacesPartII/README.md:428–432,505,509`. The routes use “shrink its away-p part to an admitted neat level, using the parent’s standard levels” and “By strong approximation”.

**Claim:** The cited arithmetic contracts supply the neat refinement preserving the prescribed p-factor and the single-component adelic identification used in the ordinary-cohomology headline.

**Witness:** ArithmeticLocallySymmetricSpaces §ALS.0.10 constructs standard subgroups, not neat refinements. Its §ALS.0.11 supplies the missing criterion. AdelicAlgebraicGroups §4.2 supplies strong approximation; neither input is cited here.

The precise current-head witnesses are `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:1534` and `:1627`, and AdelicAlgebraicGroups, pull request #792, `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4580`. ALS.0.9 assumes neatness; it does not produce it. The existing contract at package line 49 and the Needs lines at 434 and 509 omit these inputs. The latter parent also supplies the component and group-cohomology comparisons at §§ALS.0.7 and ALS.1.5, which should be named directly where used.

**Exact repair:** Add AdelicAlgebraicGroups §4.2 to Scope, Exact supplier contracts and §4.2's Needs/Layer 4 Dependencies. State that its semisimple simply connected theorem is applied with every simple factor noncompact at infinity. Add ArithmeticLocallySymmetricSpaces §ALS.0.11 to the parent contract and §3.2's Needs/Layer 3 Dependencies: shrink at an additional finite place of residue characteristic different from p to a principal pro-unipotent subgroup, keeping the p-factor G. Cite §§ALS.0.7 and ALS.1.5 in the parent contract and §4.2 for the component and group-cohomology identifications. Use the same neat-refinement input in §5.7. These are existing owners; do not add a new gap or re-plan strong approximation.

**Repair tested:** For F=ℚ(i), p=5 splits and gives two factors, of total dimension 6. An away-5 pro-3 factor gives the second residue characteristic required by ALS.0.11; simultaneous 5-power and 3-power eigenvalue torsion has order 1. Strong approximation for SL₂/F away from infinity gives one finite-adelic double coset, and hence the required Γ′ component. Over ℚ, `Res_{F/ℚ}SL₂` is ℚ-simple with noncompact real points SL₂(ℂ), so the stronger factorwise hypothesis is satisfied. AdelicAlgebraicGroups is at ORDER line 53, this package at 180. A scratch-only dependency probe adding the named suppliers returned `depcheck: 236 roadmaps, 2141 edges, 0 problem(s)`, with no upward edge or cycle. This is an absent prerequisite contract, not an objection to the mathematical conclusion.

## R02 (P3) — Name the pinned Burnside-density input

**Location:** `packages/ArithmeticLocallySymmetricSpacesPartII/README.md:182,195`: “Apply finite-dimensional density to the absolutely irreducible W_k”.

**Claim:** The rational action-quotient proof uses the general finite-dimensional density theorem, but its exact pinned supplier is absent from both the Tau Ceti contract and the Needs line.

**Witness:** `TauCeti/RepresentationTheory/Irreducible.lean:242` declares `Representation.asAlgebraHom_surjective_of_isIrreducible`, assuming an algebraically closed field, finite dimension and irreducibility, and concluding surjectivity onto all linear endomorphisms.

**Exact repair:** Cite that declaration and file under From Tau Ceti and in §0.3's Needs. Say that it is applied after scalar extension to an algebraic closure of ℚ_p, using absolute irreducibility, and that the finite-dimensional image descends by faithful scalar extension. Keep the compact-open/Iwasawa specialization as this roadmap's target. No additional import in Suggested.lean is needed: its statements do not use this proof input.

**Repair tested:** At p=3, m=1, k=1, the matrices I+3e and I+3f give e and f by subtracting I and dividing by 3; ef and fe are the two diagonal matrix units. The image has dimension 4=2². At k=0 the image has dimension 1=1². A diagonal-torus restriction has only a two-dimensional diagonal image, and fails the irreducibility hypothesis. Thus the cited theorem has exactly the hypotheses the route needs; it does not assert density for arbitrary subgroup restrictions.

## R03 (P3) — Do not reuse the field degree as a discriminant radicand

**Location:** `packages/ArithmeticLocallySymmetricSpacesPartII/README.md:642`: “has discriminant −4d”. The standing convention at line 17 is d=[F:ℚ].

**Claim:** The positivity proof silently uses d as a squarefree radicand although its established meaning is the field degree.

**Witness:** For F=ℚ(i), d=2 and B_F=1/8≠0, but disc(F)=−4, whereas −4d=−8. The slopes 1/12 and 1/3 remain correct.

**Exact repair:** Introduce a different letter: “Write F=ℚ(√−u) with u>0 squarefree. If every odd ramified prime is 1 modulo 4, then u is 1 or 2 modulo 4, so disc(F)=−4u and 2∈R.” Retain the subsequent ratio estimate and add this radicand distinction to the positivity Check.

**Repair tested:** u=1 gives discriminant −4, ν₂=2 and A_F/B_F=5/3; u=2 gives discriminant −8, ν₂=3 and ratio 3; u=5 gives discriminant −20 and ratio 5. All exceed 1. This corrects notation in the proof, not the stated positive lower bound.

## R04 (P3) — The zero-weight tensor is not indexed by an empty set

**Location:** `packages/ArithmeticLocallySymmetricSpacesPartII/README.md:420`: “an empty tensor of one-dimensional factors”.

**Claim:** The zero weight changes the tensor index set to an empty set.

**Witness:** For F=ℚ(i), Suggested.lean:59 tensors over its two embeddings even at t=0: there are two factors of dimension 1, giving 1·1=1. There are zero factors only for an empty index type.

**Exact repair:** Replace the parenthesis by “a tensor over the d complex embeddings, each factor one-dimensional”. Keep the trivial-representation Check. Distinguish it from the genuinely empty finite product D=1 in §0.1.

**Repair tested:** F=ℚ gives one factor, F=ℚ(i) two, and a cubic field three; the dimensions are respectively 1, 1·1 and 1·1·1. The dimension statement survives, but its explanation now agrees with the actual carrier.

## Verified sound

### Previous findings, checked individually

All five findings from `reports/REV-PKG-ArithmeticLocallySymmetricSpacesPartII.md` are repaired. None is re-raised, and the repair report contains no finding marked not actionable.

| Previous finding | Repaired passage | Verification and status |
| --- | --- | --- |
| F01, stale pins/lines | README:39: “Declarations are consumed at the Mathlib pinned by the content repository's manifest”; analogous text at :45 | **Repaired.** Old hashes and library line locators are gone. Current pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Named declarations were opened again; see inventory below. |
| F02, nonexistent NEI names and domain citation | README:57: “§§0.5 and 0.8 for the domain property in the uniform case”; “§0.15 for the rational-homology-as-Tor comparison” | **Repaired.** Current NEI §§0.5, 0.8, F.1, 0.12, 0.14, 0.15 and 1.12 were read. The three nonexistent names are gone, including elsewhere in the package. Domain citations were also corrected in §§1.3, 2.1 and Layer 2 Dependencies. |
| F03, Fu equation/page slips | README:301: “pp. 22–23, equation (33) and its following inequality”; :462 and :503: “equation (38) and the unnumbered bound following it” | **Repaired.** fu24 line 1122 is (33) on p.22; lines 1135–1138 are on p.23. Line 1168 is (38), p.23; lines 1172–1179 are unnumbered on p.24. No (39) remains. |
| F04, cache locator in References | README:786: “as in fu24's bibliography entry [Mar12], p. 24” | **Repaired.** fu24 lines 1214–1215 identify the published work. The roadmap no longer cites an extraction line number. |
| F05, aw14 deformation index | README:75: “aw14 covers deformation index n≥1 directly, and the first congruence kernel has index zero”; :784: “with deformation index n≥1” | **Repaired.** aw14 lines 730–737 require n>0. For G₁, L_G=p·sl₂ and p⁻¹L_G=sl₂, giving n=0; for G₂, n=1. The declared index-zero contract is unchanged. |

The modified import header was also checked. The file has exactly the allowed import targets Mathlib and `TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower`, using the pinned module-system spelling `public import`. It introduces no mathematical assumption. A scratch test removing `public` while retaining the exposed public declarations fails because Field is then privately imported; the package's actual header elaborates without that failure.

### Principles, scope and organisation

Read all 30 numbered targets, their APIs, Checks, routes and Needs lines, all six supplier contracts and all ten source-correction sections. Read main's ModularForms, LieHighestWeight and completed Chebotarev for upstream shape. This is a Part II extension: its local weight estimates and SL₂ specialization are not a replacement for the finite-level or completed-cohomology roadmaps. No algorithm, source transcription, sorry'd data, set_option, free predicate stand-in or arbitrary carrier substitution occurs. Odd p is a local uniform-domain hypothesis, not a restriction to good primes in a global theorem: the auxiliary prime is chosen independently of level and weight, and dyadic ramified finite types remain included in §5.4.

The six mathematical layers follow their Needs edges: torsion before rank errors, rank errors before dimension shifting, local bounds before descent, descent before the upper bound, and base-change counting before lower bounds. They do not reproduce Fu's chapter sequence; the analytic foundations are supplier contracts rather than re-planned chapters. Every layer has Examples and Dependencies. The substantive definition blocks have prose APIs and at least three Checks; §5.5 states the APIs of its counting objects in the theorem paragraph. Apart from R03–R04, the explicit sign, dual, central parity, support and weight conventions agree with their computations. R01–R02 identify the remaining supplier-contract omissions. No process narrative, issue number, machine path, or HTML anchor was found in the roadmap or Lean file.

### Source sample at the text

All six manifest works were readable from their recorded legal cached copies. All 15 seeded targets were reread, including hypotheses and proof passages, not just searched by theorem number. No locator is flagged unverified in the package. The “unresolved” reference at §1.2 points to the explained source-proof defect E3, not to an unread source. Sources.toml has one key for each cited work and records the author/preprint versions used; no fetch or manifest amendment was necessary.

| Sampled target | Text and locator checked | What the text supports |
| --- | --- | --- |
| 0.1 | fu24 Theorem 1.4, p.3, lines 120–137; Theorem 3.2, pp.8–11, lines 405–409, 530–554 | Multiaffine errors of degree ≤m−1. The nonnegative shifted majorant is the roadmap's elementary coefficientwise deduction, not a quotation of a separate source theorem. |
| 0.2 | fu24 Theorem 1.2, pp.2–3, lines 89–94; §7, pp.23–24, lines 1150–1181 | The minimum-weight saving and diagonal exponent. The explicit proper-subset proof justifies the stronger displayed elementary inequality. |
| 0.3 | fu24 §6, pp.21–22, lines 1044–1056, 1094–1115, equation (32) | Actual tensor coefficient family, rational self-duality and full rational action quotient. No integral full-endomorphism assertion is imported. R02 supplies the named density theorem used by the alternative proof. |
| 1.1 | fu24 §6, p.22, line 1120 | Hom/dual-coinvariant identity, with W* before self-duality. General finite W is justified by evaluation and the imported continuous Tor comparison. |
| 1.2 | fu24 §6, pp.22–23, lines 1116–1131; Theorem 4.3, p.15, lines 725–746; Theorem 3.2, pp.8–11 | Nonzero cyclic torsion reduction. Its analytic requirements are four declared gaps. The all-weight strip bound repairs the source's large-coordinate proof. aw14 §4.6, p.11, line 491 and §5.4, p.16, lines 730–742 have the repaired positive-index limitation. |
| 2.1 | fu24 §6, pp.22–23, lines 1121–1128, (33)–(34) | Free injection of skew rank a, finite presentation with possibly larger ℓ, and torsion cokernel. Localization supplies rank N=ℓ−a. |
| 2.2 | fu24 §6, pp.22–23, lines 1122, 1132–1138 | Upper estimate through right exactness; no injectivity of H₀ is assumed. Repaired page span is correct. |
| 2.4 | fu24 Theorem 1.4, p.3, lines 130–137; §6, p.23, lines 1135–1148 | Two-sided rank error. U_M+U_N is a valid common nonnegative majorant. |
| 2.7 | fu24 p.4, lines 142–143; aw13 §§10.12–10.13, p.77, lines 3598–3628 | Canonical dimension zero implies finite dimension; converse in aw13. Its positive-index setting is extended to index zero only through the explicit gap. Finite multiplicity support then uses distinct absolutely simple W_k. |
| 3.1 | fu24 pp.1–2, lines 29–46; marshall12 §2.1, pp.3–4, lines 118–144 | Real exponent κ−2, complex conjugate exponents κ/2−1, and place versus embedding indexing. The arbitrary-t version used in Lean is consistent with Fu §7 and Marshall Lemma 11. |
| 3.3 | fu24 (37), p.23, lines 1158–1161; marshall12 (7), p.4, lines 171–174; (29) and Lemma 11, pp.15–16, lines 607–658 | A common Galois-closure coefficient realization and dimensions after field extension. The chosen prime splits in that closure. The roadmap correctly avoids nonflat integral reduction and a fictitious field isomorphism ℂ≃ℚ_p. |
| 4.1 | fu24 (2), p.2, lines 80–87; marshall12 (4), pp.3–4, lines 123–129 | Factor 2^r₁ and the nontrivial coefficient condition. Marshall's c is an interior subspace, not compact support; the roadmap corrects Fu's ambiguous support notation. |
| 5.5 | fgt10 (3.9)–(3.10), p.17, lines 978–985; (4.4), p.19, lines 1064–1073; Definition 4.3, p.20, lines 1092–1099; Propositions 4.10–4.11, pp.22–23, lines 1185–1216 | The three local classes, weighted descent count, exceptional CM factors, twist-fixed counts and principal-component cancellation. The formula includes the field-unit congruences on n. |
| 5.6 | fgt10 Theorem 4.17, pp.24–25, lines 1288–1326; Proposition 4.18 and Lemma 4.19, pp.25–26, lines 1340–1409; Corollary 4.20, p.27, lines 1417–1421 | Exact A_F and parity coefficient B_F. The package's extra ι-stability hypothesis corrects Proposition 4.18. Positivity is stronger than merely nonnegativity and was recomputed below; R03 concerns only the radicand notation. |
| 5.8 | fu24 Corollary 1.3, p.3, lines 95–98; fgt10 Corollary 4.20, p.27; §1, pp.3–4, lines 127–166; restriction/transfer, pp.16–17, lines 940–945 | Two-sided growth is assembled from upper bound, base-change lower bound, finite-index injectivity, interior duality and bounded boundary errors. Neither source alone states the entire four-support, arbitrary-congruence formulation. The roadmap supplies those extensions. |

Serre's extra locators were also opened: serre77 I §1.5.3, printed p.20, lines 625–627; I §4.2(c), p.52, lines 1521–1530; II §2.8, p.169, lines 5190–5196. The OCR of the first amalgam display is imperfect, but the second explicitly identifies the stabilizer orders 6,4,2 and the amalgam; the cohomology sequence is readable.

### Computed adversarial table

These rows cover all sampled targets, all headlines, every finding and the other target groups. The earlier round's unchanged computed rows were used as corroboration, not its unsupported summaries. New exact-arithmetic calculations also checked 4,340 proper-face monomial/input pairs for m=1,…,4 and x_i=1,…,4, and the cusp Koszul ranks for n=0,…,3. Finite tests supplement the displayed algebraic arguments; they are not proofs of the global existence assertions.

| Statement | Instances tried | Values on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: left action and Casimir | p=3; g=(1 3;0 1), h=(1 0;3 1); k=0,1 | gh=(10 3;3 1), hg=(1 3;3 10); g⁻¹(0,1)=(−3,1). On highest weight k: ½k²−k+2k=½k(k+2), values 0,3/2 | Inversion and ef signs agree; neither abelianization nor same-action untwisting works. |
| 0.1 proper-face definition/API | m=1; m=3, c_empty=2,c_{02}=3,x=(2,5,4); m=2,x=(1,t) | B constant; 2+3·2·4=26; 7x₁=7t. D(2,4)=8≠6; D(empty)=1; D(0+1)=1 | Full monomial excluded. On x=(t,t), t²/(1+t)→∞ excludes a fixed proper-face bound for the full product. |
| 0.2 saving | m=2, B=2+3x₀+5x₁,x=(2,4),a=2; diagonal t | B=28≤(2+3+5)·8/2=40; B(t,t)=2+8t≤10t | Division is by a≥1. The general omitted-coordinate product is ≥a, giving each monomial≤D/a. 4,340 finite cases passed. |
| 0.3 coefficient family and action quotient | k=0,(1,2),2; torus vs full first-congruence subgroup | dimensions 1,6,3; quotient dimensions 1,36,9. Standard torus image dimension 2; full congruence image 4 | Rational assertions sound; R02 names Burnside. Integral action at p=3 is not asserted to fill all lattice endomorphisms. |
| 1.1 evaluation | M=A,W=W_(1,2); M=0; diagonal character a | Hom dimension 6=H₀ dimension 6; 0=0. Dual character is a⁻¹, so evaluation gives a·a⁻¹=1 | Both directions of the evaluation correspondence hold; wrong dual gives a². |
| 1.2 cyclic estimate | δ=1; δ=0; m=1; α=(3,3),k=(1,t) | 0≤B; excluded δ=0 gives D(k+1); m=1 bound 2α. Strip: 2(t+1)≤6(t+1)+12 | No finite-exception shortcut. |
| 1.3 torsion filtration | R=ℚ_p[X,Y],T=R/(X,Y) | R/(X) has infinite ℚ_p dimension; T has dimension 1; a surjection exists, not an isomorphism | Correct cyclic control and finite generation. |
| 1.4 finite torsion sum | T=0; two torsion factors with bounds B₁,B₂ | 0≤0; Hom dimension≤B₁+B₂ by left exactness | Finite sum stays proper-face; m=1 gives a constant. |
| 2.1 free approximations | M=A²; M=A/Aδ; ideal (X,Y) | (a,ℓ,rank N,rank T)=(2,2,0,0),(0,1,1,0),(1,2,1,0) | Chosen generators need not equal rank; exact maps are required and specified. |
| 2.2 upper estimate | M=A²,k=(1,2); torsion M | H₀=12=2·6+0; a=0 gives H₀≤U_M | Right exactness sufficient; no left exactness assumed. |
| 2.3 lower estimate | ℓ=2,a=1,D=6; a=0 | 12−(6+U_N)=6−U_N=aD−U_N; second case −U_N≤H₀ | Correct leading coefficient and possibly negative lower bound. |
| 2.4 absolute error | M=A²,k=(1,2); m=1 | abs(12−2·6)=0≤0; degree bound m−1=0 | Combining errors gives U_M+U_N; no full-product term. |
| 2.5 degree-one cancellation | ℓ=2,a=1,D=6 | H₁=H₀(N)−12+H₀(M)≤(6+U_N)−12+(6+U_M)=U_N+U_M | Main terms cancel. For free M and a nonminimal presentation, H₁=0 whereas H₀(N) can be nonzero, excluding an i=1 shift isomorphism. |
| 2.6 local headline | m=1, free M=A²; m=2,i=7; p=2 | H₀=2(k+1), error 0, higher homology 0; cutoff 3m=6, so H₇=0. At p=2, g=−I gives (1−g)(1+g)=0 with nonzero factors | Odd-p and m≥1 retained; finitely many syzygies give one polynomial for all i. |
| 2.7 finite support | M=W_(1,2); M=W₀⊕W_(1,2); M=A | Hom to matching simple has dimension 1≤length 1≤6; support of second M has two weights, length 2≤dimension 7; A has canonical dimension 6, infinite coefficient dimension | No semisimplicity/classification of all finite-dimensional modules is assumed. |
| 3.1 κ convention | signatures (0,1),κ=6; (1,1),κ=(4,6); κ=2 | t=(2,2),D=9≤Δ=36,min x=3=κ/2; t=(2,2,2),D=27≤144,min x=3≥2; D=1≤2^d | κ=3 at a complex place excluded before division; d counts embeddings, not places. |
| embeddingStdRep and weightRep | F=ℚ(i),γ=(i 1;−1 0); t=(1,0), t=0 | det γ=1; traces i,−i; E₁ trace 1 versus wrong same-embedding −1. −I acts by −1 at (1,0), by +1 at (n,n). At t=0 there are two factors, dimension 1·1=1 | Bodies encode actual entrywise action and conjugate embeddings. R04 repairs empty-index wording. |
| 3.2 neat refinement; 4.2 component; R01 | F=ℚ(i),p=5,away-p prime 3 | full p-product dimension 6; gcd(5^a,3^b)=1; strong-approximation double-coset count 1 | Existing owners supply both inputs, but contracts must name them. No weight-dependent prime or index. |
| 3.3 realization/base change | κ=6 Bianchi; a degree-e field extension; O --p→ O | coefficient dimensions 9=9; one-dimensional L-space has ℚ_p dimension e, not 1. Over a field p is invertible: homology (0,0); mod p differential 0 gives (1,1) | Flat field comparison only; no integral-reduction overclaim. |
| 3.4 descent | imaginary quadratic, d=2, geometric dimension 3 | i=0,…,6 and j=0,…,3: at most 28 E² terms; e.g. total degree 2 sums terms (0,2),(1,1),(2,0) | Finite sums of proper-face errors control the filtration; no E² degeneration asserted. |
| 4.1 cuspidal comparison | signatures (0,1),(1,1) | q=1, multiplier 1; q=2, multiplier 2. For a genus-zero four-cusp curve ordinary H¹ has dimension 3 but cuspidal dimension 0 | Support distinction retained; dim V>1 required for the cited identity. |
| 4.2 ordinary Lean headline | t=(n,n),a=n+1 or a=1; t=(n,0); t=0 | after dividing: H^i≤C(n+1), or C(n+1)²; unbalanced case ≤C(n+1), min=1; trivial coefficients ≤C | C precedes t,i,a in Lean. FiniteDimensional is in the conclusion, so finrank does not conceal infinite dimension. |
| 4.2 negative controls | F=ℚ,Γ=SL₂(ℤ),k=10,22; ideal 𝔞=0 or 𝔞=1 | H¹ dimensions 3,5 and unbounded in k, versus a putative constant C after division; 𝔞=0 gives trivial kernel and does not force finite index; 𝔞=1 gives kernel=whole SL₂ | Not-totally-real and nonzero-ideal hypotheses are explicit; unit ideal is allowed correctly. |
| 4.3,4.4 | signature (1,1), parallel κ; Bianchi κ=6 | κ³/κ=κ²; κ²/κ=κ; κ=6 gives n=2, coefficient dimension 9 | Degree drop d−1, no epsilon loss or asserted limit. |
| 5.1 cusp torus | n=0,1,2,3; z₁=1,z₂=i | chain dimensions (1,2,1),(4,8,4),(9,18,9),(16,32,16); differential ranks (0,0),(3,3),(8,8),(15,15); all cohomology (1,2,1). Change determinant −2i≠0 | Recomputed exact ranks. Trivial rank-9 monodromy would give (9,18,9), excluding that model. |
| 5.2 support bridge | c cusps, i=1,2; n=0 connected | H_c^i−H^i in [−b_i,b_(i−1)]⊆[−2c,2c], hence abs≤3c; H_c³ dimension 1 at n=0, 0 at n>0 | Correct safe bound; degree-two boundary cokernel 1 is retained at n=0. |
| 5.3 fixed-type count | N=1,k=12 and 2; N=2,k=6 and 8 | 11/12−1/2+1/4+1/3=1; 1/12−1/2−1/4−1/3+1=0. S₃-type multiplicities (trivial,sign,std)=(0,1,0),(0,0,1), total dimensions 1,2 | Signs and weight-two term correct; N and σ fixed. |
| 5.3 ι-stability | N=3,k=4,σ=ω or ω⊕ω̄ | single-character expression 3/12+1/4=1/2, while actual multiplicities are 1 and 0; stable pair expression 6/12+2/4=1 | The extra hypothesis excludes the source counterexample; odd-weight stable dimension-two type gives multiplicities 0 at k=3, 1 at k=5. |
| 5.4 local types | (ℓ,ν)=(2,2),(2,3),3,7 | PS dimensions 6,12,4,8; sc dimensions 2,4,2,6. sc (S₃,S₄) traces (2,0),(−2,0),(−1,2),(0,−2) | Dyadic cases retained. At ℓ=3, S₄ lies in Q₈ kernel of the dimension-two S₃ quotient representation, so trace +2, not −2. |
| 5.5 normalized count | non-CM fibre with two ramified primes; Gaussian and Eisenstein CM terms | 4·(1/4)=1; Gaussian ν/2 at n=0,1 is 0,1/2; Eisenstein at n=0,1,2 is 0,0,1/2; principal character evaluations all +1 cancel the ℒ correction | Matches Propositions 4.10–4.11; denominator abs X≥1. |
| 5.6 slopes; R03 | discriminants −4,−8,−3,−7,−20 | (A,B)=(5/24,1/8),(3/8,1/8),(1/6,0),(1/3,0),(5/4,1/4); minimum slopes 1/12,1/4,1/6,1/3,1 | Strict positivity survives. For B≠0, ratio≥(5/3)·3^(s−1)>1. Only the d notation changes. |
| 5.7 restriction and degree-two descent | index 1 or r; finite orientation-preserving Q; orientation reversal as negative control | cor∘res=1 or r≠0; dim(V*)^Q=dim V^Q. For Q=C₂,V=trivial, orientation twist would change invariant dimension 1 to 0 | Actual SL₂(ℂ) action preserves orientation, so degree-two descent is valid. No inference of lower bounds at arbitrary larger adelic level. |
| 5.8 Bianchi headline | Gaussian maximal level, n=0,1,2,5,99,100 | full FGT base-change formula gives 0,0,0,1,32,8; leading terms at 99,100 are 100/3 and 101/12. −I acts by (−1)^(2n)=1 | A threshold is essential; parity prevents a universal leading coefficient for the base-change part. Both ordinary degrees are covered by the duality route. |
| 5.8 four supports | neat Γ, fixed cusp count c | cusp=interior; ordinary and compact support differ from interior by bounded terms≤2c, and from each other≤3c | Additive constants are absorbed by larger C and n₀. No assertion of equal dimensions across all supports. |
| Analytic contracts | M=A,0,W_(1,2); p=3,λ=1 | scalar extension gives Û,0; action-quotient dimensions 36=36 and 6=6; μ=−1±√3 solves ½μ(μ+2)=1, v₃(3)=1 | Exact source/target maps specified. Finite coefficient extension is needed, then descended. |
| Generic growth gap | m=1,k≥α; m=2,α=(3,3),k=(1,t) | 2α−α²/(k+1)≤2α; 2(t+1)≤6(t+1)+12 | Large-coordinate telescoping and small-coordinate strips both covered, with α_i≥1. |
| Skew-rank and canonical-dimension gaps | division ring; ideal (X,Y); M₂(ℚ_p); W_k vs A | ranks a; 1 with kernel rank 1; E₁₁E₂₂=0 excludes matrix ring; canonical dimensions 0 vs 3m | Hypotheses discriminate rank from coefficient dimension and exclude zero/non-domain misuse. |
| E1–E4,E7 | one-cusp neat Bianchi boundary; p=3,λ=1; polynomial completion; signature (1,1); index r | boundary H¹ dimension 2, restriction image 1; 1+2λ=3 nonsquare; ideal (1−px) proper in ℚ_p[x] but unit in Tate algebra; two place weights versus three embeddings; normalized trace r⁻¹r=1 | Support, parameter, separatedness, indexing and level-refinement repairs remain mathematically valid. R01 supplies the missing named refinement input. |
| E5,E8,E9 | norm(Δ/λ)<1; r=1/p,coefficients p^(−n); ramification e=2 | geometric-series inverse makes quotient zero; weighted terms all have norm 1, so tails do not tend to 0; p=uϖ² implies 0∈p+𝔪² | Source errors do not get imported into the gap statements. |

### Pinned declarations, signatures and padding

`lake env lean` was run from the pinned content checkout on the package Suggested.lean: **exit 0, exactly two warnings, both declaration uses sorry**, at lines 70 and 89. The imported Tau Ceti object's olean was already present, so no build was needed. No Lean process remains running.

A separate scratch copy appended `#check @` for all four declarations and elaborated successfully. Both definitions retain Field and NumberField, the subgroup and actual embeddings. The upper theorem retains not-totally-real, nonzero ideal and kernel containment. The lower theorem retains IsTotallyComplex, degree two, nonzero ideal and kernel containment. Constants occur before weights and degrees. No standing hypothesis was dropped and no declaration changed.

Both sorried theorems were tested on a scratch copy with one-tactic alternatives simp, rfl and infer_instance, requiring the tactic to close the goal. Both failed; infer_instance reports a non-class existential goal. The near-match candidates were opened at the pins: `isZero_groupCohomology_succ_of_subsingleton` is only for a subsingleton group, `groupCohomologyIsoExt` only changes the model, and `CuspFormClass.exists_bound` bounds a single classical function rather than a cohomology dimension. None is a one-lemma proof of either target. Neither target restates a definition, computes a small value, or merely mirrors a Check. No padding was found.

All four own backticked names resolve to the four declarations of Suggested.lean. The headline list is exactly README:13:

| Headline | Lean coverage |
| --- | --- |
| §2.6 uniform local homology theorem | Named in module docstring as unavailable: completed rational Iwasawa homology with its diagonal-action comparison and skew rank are missing. Native completed group rings alone are insufficient. |
| §4.2 sharp global cusp-form bound and ordinary-cohomology version | Ordinary version is `finrank_groupCohomology_weightRep_le`. Adelic cusp-form version and its §§4.3–4.4 consequences are named in the docstring with missing adelic carrier. |
| §5.8 two-sided Bianchi bounds | Ordinary degrees 1,2 are `bianchi_groupCohomology_linear_growth`. Cuspidal/interior/compact-support versions are named with missing Borel–Serre support carriers. |

The following native declarations were opened, rather than inferred from names. Paths are inside the indicated pinned library repositories.

| Pinned file and line | Declarations and relevant content |
| --- | --- |
| `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:67,391,735,747` | Finset.prod, prod_const_one, Fintype.prod_equiv, prod_empty; commutative products, empty value 1. |
| `Mathlib/Algebra/BigOperators/Group/Finset/Piecewise.lean:247`; `Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean:160` | prod_update_of_mem and prod_pos; membership/positivity hypotheses retained. |
| `Mathlib/Data/Finset/Powerset.lean:31`; `Mathlib/Algebra/MvPolynomial/Basic.lean:80` | powerset with subset membership; MvPolynomial as AddMonoidAlgebra on finitely supported natural exponent vectors. Neither supplies the roadmap's weight-error theorem. |
| `Mathlib/LinearAlgebra/Dimension/Constructions.lean:372,375` | Module.finrank_tensorProduct, Module.finrank_baseChange; native tensor and scalar-tower assumptions, specialized here to fields. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183,194,202,215` | groupCohomology is inhomogeneousCochains homology; induction, Ext comparison and subsingleton vanishing. No topology, support condition, finite-dimensionality or arithmetic bound is built into the definition. |
| `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225`; `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369` | SpecialLinearGroup.map applies a ring map to matrix entries; toGL retains the matrix and its inverse. |
| `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:530`; `Mathlib/Algebra/Group/Pi/Lemmas.lean:156`; `Mathlib/RepresentationTheory/Rep/Basic.lean:62` | mapMonoidHom, MonoidHom.pi, Rep.of assemble the actual representation. |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:48,210` | IsTotallyReal/IsTotallyComplex classify all infinite places; degree two and total complexity give the intended imaginary quadratic case. |
| `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57`; `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:192` | symPowerRep is the symmetric power of stdRep; finrank_eq requires finite free module and strong rank condition, yielding n+1 in dimension two. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basic.lean:75`; `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean:96` | pbwFiltration and Module.Basis.pbwBasis on a linearly ordered basis over a commutative ring. These are ordinary PBW, not the missing completed central-reduction contracts. |
| `TauCeti/RepresentationTheory/Irreducible.lean:242` | Native algebraically closed finite-dimensional Burnside density: R02. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`; `Module.lean:322` in that directory | Native completedGroupAlgebra and compact-module action. These do not by themselves supply the local headline's completed Tor/skew-rank comparison. |
| `Mathlib/RingTheory/OreLocalization/Ring.lean:209–211` | A DivisionRing instance exists assuming a domain and an already supplied OreSet of non-zero-divisors. The noetherian-domain Ore theorem and complete skew-rank package are still additional input; the gap must build on this native instance. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:410,420,426`; `Mathlib/NumberTheory/ModularForms/Bounds.lean:214,221,493` | Near matches concern SL₂(ℤ) in real positive-determinant matrices, individual modular-form norms and Fourier coefficients. None owns the arbitrary-number-field embedding tensor or either dimension-growth headline. |

### Current suppliers, overlap and ownership

Read the board package index first. Its three other packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. No claim of global nonexistence is based on the local board checkout alone. Used `roadmaps show`, `roadmaps grep` and `roadmaps resolve` against main and the indexed open heads, and object searches at both library pins.

The current citation resolver reports no unresolved cross-roadmap citations or own Lean names. Its output says it did not inspect native libraries on its host; that limitation was covered by the direct pinned-file inspection above. Name resolution does not detect R01's omitted contracts or R02's omitted native citation.

| Supplier | Sections resolved and consumed |
| --- | --- |
| ArithmeticLocallySymmetricSpaces | README:1499,1534,1762,2041,2087,2112,2435,2538,2987,3446,3593,3644,3691,4060,4383,4459: §§ALS.0.9–0.10, 1.1, 1.6–1.8, 2.5, 2.8, 3.6, 4.1, 4.5–4.7, 5a.2, 5b.4–5b.5. Manifold/local-system, finite-model, coefficient, boundary, trace and cuspidal-injection contracts exist. Their neatness, dual and orientation assumptions are retained. §ALS.0.10 does not supply refinement: R01. |
| CompletedCohomologyPartII, #1035 | README §§3.1,4.2,5.1,5.6–5.7,6.3 (current-head lines 759,1154,1277,1365,1382,1475): inverse-action dual, constant-coefficient completed chains, finite generation, rank-zero torsion and diagonal completed-Tor descent. Applying over ℚ to Res SL₂ makes the full local product dimension 3d; no one-prime-of-F substitution. |
| NoncommutativeAndEquivariantIwasawa, #1307 | README §§0.5,0.8,F.1,0.12,0.14,0.15,1.12 (lines 271,378,435,525,626,654,969): graded domain lifting, rational bounded-denominator rings, noetherian topology, rational global dimension, inverse untwisting, rational homology and exact Ore scalar extension. The repaired citation is accurate. |
| LieHighestWeight on main | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319,405`: sl₂ irreducibility, classification, dimensions and the ordinary PBW interface. |
| Chebotarev on main | `Completed/Chebotarev/README.md:410`: Layer 10 gives density and infinitude for the identity Frobenius class, stable under removing finitely many primes. |
| ModularForms on main | `TauCetiRoadmap/ModularForms/README.md:1247`: §10C constructs automorphy sheaves and dimensions, using the analytic Riemann–Roch input of §10B. It does not supply the fixed-isotypic multiplicity calculation owned here. |
| ModularSymbolsPadicLFunctions | README §0.7, line 1161 at the head: equivariant Eichler–Shimura for every finite-index subgroup, including normalizer actions; matches the Γ(N) use in §5.3. |
| GL2AutomorphicRepresentationsAndTransfer, #931 | README §§R16.2.9,R16.6.3,R17.4.2–R17.4.6 (lines 850,1349,2359,2379,2394,2402,2410): type unicity; distinct totally-real determinant-twisted tensor; all-place base change, descent, cuspidality and fibres. These do not state the specialized FGT count or parity slopes. |
| AutomorphicFormsOnReductiveGroups, #1037 | README §§1.1,5.2,5.3 (lines 234,765,786): relative cochains, specified coefficients, real discrete-series contribution and complex tempered range. For SL₂(ℂ), defect 1 gives degrees 1 and 2. |
| AdelicAlgebraicGroups, #792, needed repair | README §4.2, line 4580: semisimple simply connected strong approximation, with noncompactness of each simple factor; current owner for R01. |

The overlap file reports no conflicting head, dropped cited id or id supplied only by an open revision. Its five vocabulary-near roadmaps were inspected at their heads. BianchiModularForms #1719 owns GL₂ Γ₀-level carriers and weight-two arithmetic, and its §1.3 allows higher-weight coefficient spaces; its §§1.2–1.4 concern boundary kernels and finiteness, not Fu's sharp weight bound or the FGT all-weight base-change count. This roadmap uses a broader arbitrary-number-field SL₂ embedding tensor and computes the coefficient-dependent cusp Koszul complex; the common constant-coefficient instance does not create a second generic boundary-triangle owner. QuaternionicModularForms #934 owns quaternionic and GL₂ coefficient/analytic comparisons, not the SL₂ weight-aspect estimates. It is not cited as a supplier. CompletedCohomologyPartII supplies the tower theory rather than rebuilding these weight estimates. GL2AutomorphicRepresentationsAndTransfer supplies transfer/type theory; AutomorphicFormsOnReductiveGroups supplies archimedean cohomology. No shared fully qualified Lean declaration was found.

Object searches included proper-face/multiaffine weight errors, cyclic Iwasawa multiplicities, action quotients, embedding tensors, Bianchi growth, fixed-type dimensions and base-change counts. Other hits concerned different objects (for example geometric proper faces and Bianchi mass equidistribution), not these bounds. Ownership against open heads was checked through the provided indexed tools; unprovided, unindexed work was not searched.

The required dependency check on the untouched package returned:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every declared supplier is earlier in ORDER or is on main; no prohibited supplier is named. R01 is an omitted prerequisite, which an edge checker cannot detect until it is cited.

All six gaps have identical slugs in design/plan.json and Exact supplier contracts, with NoncommutativeAndEquivariantIwasawa as owner: flat-microlocalisation, algebraic-quotient-comparison, integral-central-faithfulness, generic-cyclic-growth, skew-rank, canonical-dimension-zero. Their stated inputs and outputs are precise and single-purpose. Native Ore localization and PBW are partial infrastructure, not replacements for the missing theorems. No gap has supplier none, and none requires accepting a false input in this review. A future accepted verdict will remain conditional on these six contracts.

## Not verifiable

- Published journal pagination was not independently compared with the author/preprint copies. The package explicitly uses the recorded preprint/author locators, all of which were readable; this does not create a missing-source request.
- Serre's OCR partly loses the first amalgam formula; the same construction and stabilizers are legible at I §4.2(c), and the cited cohomology sequence is readable.
- The six declared supplier gaps are not proofs already present at the pins. Their contracts, mathematical test instances and source limitations were checked; fulfillment belongs to their named supplier.
- No inspection of open work outside the supplied indexed heads is claimed. No source essential to this review was unavailable, and no needs-references file was necessary.

## Source issues

- **Misprint** in fu24 at Theorem 1.2, p.2 (fu24 line 90): the source says to minimize over degree-many coordinates; it should be over the archimedean place weights; affects nothing.
- **Misprint** in fu24 at equation (2) and Corollary 1.3, pp.2–3 (fu24 lines 80–98): the source says compact support for the cusp-form comparison; it should be cuspidal/interior cohomology, with compact-support growth transferred using the boundary; affects nothing.
- **Gap** in fu24 at Theorem 3.2 proof, pp.8–11 (fu24 lines 537–554): the source says the displayed quotient estimate establishes all weights; it should separately bound the infinite small-coordinate strips by the dimension of W_k; affects the proof.
- **Error** in fu24 at equation (16), p.13 (fu24 lines 665–675): the source says bounded weighted coefficients describe the Banach completion; it should require weighted coefficients tending to zero; affects the proof.
- **Error** in fu24 at equation (17), p.14 (fu24 lines 686–696): the source says the displayed Ore set works over arbitrary finite coefficient extensions; it should use an unramified base followed by scalar extension, since ramification can put zero in that set; affects the proof.
- **Error** in fu24 at Theorem 5.7, p.20 (fu24 lines 975–1009): the source says every central reduction is a domain; it should exclude parameters for which the central relation is a unit and the quotient is zero; affects a stated result.
- **Gap** in fu24 at Theorem 5.7 proof, p.20 (fu24 lines 989–1008): the source says density suffices for the quotient-filtration domain argument; it should justify separatedness or the necessary ideal contraction; affects the proof.
- **Error** in fu24 at Remark 5.8, p.21 (fu24 lines 1014–1016): the source says integrality characterizes induced parameters; it should additionally impose the square condition on 1+2λ, which fails at p=3, λ=1; affects a stated result.
- **Gap** in fu24 at Theorem 1.5 discussion, p.4 (fu24 lines 168–171): the source says aw14 directly yields first-congruence faithfulness; it should supply the reduction from its positive deformation-index hypotheses to index zero; affects the proof.
- **Error** in fgt10 at Proposition 4.18, p.25 (fgt10 lines 1340–1347): the source says the multiplicity formula applies to every central-parity-compatible σ; it should impose ι-stability, since an order-three character at N=3,k=4 gives one-half; affects a stated result.
- **Misprint** in fgt10 at §3.3, p.17 (fgt10 lines 974–977): the source says any unitary representation with nonzero H¹ is the designated principal series; it should restrict that characterization to irreducible unitary representations; affects a stated result.
- **Misprint** in fgt10 at the proof after Corollary 4.20, p.27 (fgt10 lines 1420–1421): the source says nonnegativity of the linear coefficient suffices for a positive linear lower bound; it should require strict positivity, supplied by the displayed coefficients; affects the proof.
