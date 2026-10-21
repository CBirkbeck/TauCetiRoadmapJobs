# Design repair report

## F01 (P2) — applied

Rational-rank comparisons followed by torsion elimination → the Hodge diamond, de Rham degeneration and universal coefficients alone. Removed both unused crystalline gaps, their prerequisites, contract Checks and reference bullets. Recorded Gros and Illusie entries retain provenance with empty `cited_for`. Added `crystalline_torsion_control` and named the pinned Witt coefficient-ring facts. The target statement and hypotheses are unchanged.

Verification: Deligne Proposition 1.1 explicitly deduces crystalline freeness and ranks from the de Rham dimensions and universal coefficients (deligne-lift lines 29–57, especially lines 52–57). CrystallineCohomology CR.3.2, **Proper smooth crystalline perfectness and reductions**, item (3), supplies finite generation, Tor-amplitude [0,4] and reduction to every W_n(k). CR.2.3, **Smooth-lift comparison and PD filtration**, item (1), applied with base k and zero PD ideal, identifies the n=1 reduction with de Rham cohomology. These statements were read at supplier commit `2c8b22a1737d1660f1baf397926b41e90139a80d`.

Writing Mⁱ for crystalline cohomology, the exact sequence is 0→Mⁱ/pMⁱ→Hⁱ_dR→M^(i+1)[p]→0. The zero de Rham groups in degrees 3 and 1 kill M³ and M¹ by finite generation and Nakayama, and kill the p-torsion of M⁴ and M². Degree −1 kills M⁰[p]; this also covers the bottom-degree boundary. The even de Rham dimensions then give ranks 1,22,1. Over W(k), absence of p-torsion implies absence of torsion, and finite torsion-free modules are free. This works at p=2 and p=3 without a lift or crystalline duality. The new negative control detects a W/p summand in degrees 2 or 0 through de Rham degrees 1 or −1.

The §2.4 Needs line now consumes only CR.2.3 and the specified CR.3.2 item from the crystalline supplier. Layer 2 retains crystalline duality and the other crystalline contracts needed by §2.6. The unused diagonal-Euler clause was also deleted from the general supplier paragraph. No new Gauss–Bonnet consumer was invented.

## F02 (P3) — applied

Two unused Huybrechts reference clauses → deleted. Trimmed the corresponding Chapter 2 theorems from `huybrechts.locator` and removed its stale §7.4 `cited_for` entry. The Chapter 2 genus-one-pencil locators remain. No theorem target changed.

Verification: huybrechts lines 815–818 state the characteristic-zero nef-and-big vanishing; lines 913–943 concern powers of an ample K3 line bundle and the characteristic-two extension. Neither locator is used by a retained target. §§7.4–7.5 instead cite Rizov, Terakawa and AlgebraicModuliForArithmeticGeometry §9.10. The repair removes unused references rather than creating another supplier contract.

## F03 (P3) — applied

Joined prose tokens such as `the24-letter`, `rank9d+2`, `Proposition2.4` and `lines336–341` → spaced words and numerals throughout the README and its mirrored plan prose. Kept mathematical identifiers, section codes, source IDs and URLs intact. All existing target signatures, hypotheses and API statements are unchanged modulo whitespace.

## Checks and evidence

- Dependency gate: exit 0. Exact output:

```text
candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

- No UPWARD or CYCLE line.
- Final spacing scan: passed; no joined prose-word/numeral tokens remain in the audited vocabulary. Machine-path scan: passed for all edited files and this report.
- `git diff --check`: exit 0, no output.
- JSON and TOML parsing: passed. README/plan audit: 8 layers, 60 targets, 84 API entries, 191 target Checks and 25 gaps. All target, API and Check names occur in the README; all target and Check statements agree, allowing §2.1's universal-functions statement to appear separately in its named interface. Every definition/construction retains at least three Checks. Every target prerequisite points backwards, and each gap's declared consumers match its target prerequisites exactly.
- Semantic comparison against the original plan: all target statements, hypotheses, names and API entries agree modulo whitespace. Only §2.4 changes its proof, prerequisites and Checks mathematically. Both deleted gap slugs are absent from the design files. The two deleted reference works have empty manifest `cited_for` lists; both unused Huybrechts theorem locators are absent.
- Pinned library verification: GitHub code search located the Witt-vector files; the declarations were read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. `WittVector.isDiscreteValuationRing` in `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean` (line 148) retains the perfect-field and characteristic hypotheses. `WittVector.quotientPEquiv` in `Mathlib/RingTheory/WittVector/Complete.lean` (line 105) identifies W(k)/(p) with k. Both are consumed, not restated as targets. The native line-bundle class and its equality/tensor/triviality API were also read in `TauCeti/AlgebraicGeometry/LineBundle/Class.lean` at Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the repairs introduce no parallel Picard carrier.
- Read the main-branch ComplexTori and HeightsAndUnits roadmaps for shape. Read the ArithmeticDynamics and ErdosProgressionPowers package scopes: neither supplies the crystalline argument or an overlapping K3 target. No supplier ownership or merge-order change is needed.
- Lean elaboration: not run. There is no `Suggested.lean` in this design package, no Lean file is editable in this repair, and the brief supplies no design-stage Lean command. The additional Check uses the planned crystalline carrier and remains a README/plan Check; no Lean example or successful elaboration is claimed.
- No new source was needed or fetched. No missing-reference request is outstanding. Waived and uncertified citations remain settled at their recorded locators. No source passage was copied. The supplied review was treated as claims to verify; no instruction from fetched material was followed.

## Adversarial mathematics pass

The rows include each target's subordinate API identities. “Unchanged” means no mathematical change; the spacing repair may still affect its prose. This is a mathematical boundary audit, not a Lean proof or an independent acceptance review.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: intersection and half-norm | H²=4; rational curve square −2; characteristic 2 | Q(H)=2, Q(C)=−1; integer RR never divides in k | Unchanged |
| Conventions: inverse pullback and contraction | Composite f∘g; frame e₁,e₂; p=2 | Pullback reverses composition; contraction gives e₂*,−e₁*, with plus sign at p=2 | Unchanged |
| Conventions: cup-trace and twists | Quartic; point class | Cup square has trace +4; point trace +1; Tate twists retained | Unchanged |
| Conventions: Mathieu action and cube dimensions | Identity; involution; d=1,2 | Character 24,8; section ranks 11,20 and projective dimensions 10,19 | Unchanged |
| 1.1 K3 predicate and API | Empty surface; ℙ²; E×E; smooth quartic | Integrality excludes empty; canonical class excludes ℙ²; h¹=2 excludes E×E | Unchanged |
| 1.2 field extension | Identity; tower; purely inseparable extension | Flat base change and faithful descent retain both directions, including canonical triviality | Unchanged |
| 1.3 projectivity | Imperfect field; dimension 3 control | Relative smoothness gives a regular surface; no higher-dimensional claim | Unchanged |
| 1.4 RR and contraction | O; quartic H; characteristic 2 | χ(O)=2, χ(H)=4; frame sign matches conventions | Unchanged |
| 1.5 numerical kernel | O; torsion; effective (−2)-curve | Only O is in the kernel; RR contradicts a nontrivial numerically zero line | Unchanged |
| 1.6 quartics | t=0,1; Fermat over 𝔽₂; two-point divisor in ℙ¹ | Euler values 2,4; Fermat becomes nonreduced; positive dimension is essential to connectedness | Unchanged |
| 2.1 relative Picard and API | Field; nonreduced base; zero class | Universal functions supplied first; unramified need not be flat; field fibres are étale | Unchanged |
| 2.1a differential kernel and API | Zero witness; finite height; p=2 | Witness must be nonzero; finite height uses a different branch; no division by 2 | Unchanged |
| 2.2 closed forms | Zero form; Cartier iterates; p=2 | Both height branches retained; no general surface degeneration asserted | Unchanged |
| 2.3 tangent vanishings | Abelian surface; algebraic closure; p=2 | h¹ excludes abelian control; closure supplies Oda's rational point | Unchanged |
| 2.4 Hodge and crystalline ranks | Degrees −1 through 5; M⁰ or M² with W/p torsion; p=2,3 | Odd and negative de Rham vanishing exclude torsion; even ranks 1,22,1 | Replaced proof and added torsion Check |
| 2.5 formal deformations | Dual numbers; marked versus unmarked | Tangent dimension 20; prorepresentability applies to marked functor | Unchanged |
| 2.6 line deformation divisor | O; nontrivial L; p dividing 2d | O is excluded; bad-degree branch gives flatness, good-degree branch smoothness | Unchanged |
| 2.7 polarized lift | p=2; finite ramified trait | Finite extension of W(k) is allowed; no claim of a lift over W(k) itself | Unchanged |
| 3.1 analytic predicate and API | Empty manifold; complex torus; quartic | Nonemptiness and h¹ distinguish controls; canonical section dimension 1 | Unchanged |
| 3.2 GAGA comparison | Projective and nonprojective analytic K3 | Essential image is precisely projective locus | Unchanged |
| 3.3 integral topology | Torsion in H²,H³; O(1), O(−1); winding loop | Picard torsion-freeness and duality remove torsion; Chern degrees +1,−1 | Unchanged |
| 3.4 integral étale cohomology | ℓ=p; ℓ=2≠p; point trace | ℓ=p excluded; ℓ=2 permitted; trace +1 | Unchanged |
| 4.1 Picard base change | Identity; closed overfield; nonzero Brauer obstruction | Injection and geometric invariance; integral invariant descent remains conditional | Unchanged |
| 4.2 Picard lattice and API | O; Gram [4]; (−2)-curve; ℝ⊂ℂ | Half-norms 0,2,−1; discriminant 4; projection formula puts degree factor on pushforward side | Unchanged |
| 4.3 ranks and API | Rank 0; geometric rank 22; extension of closed fields | Ample class excludes rank 0; rank 22 need not equal h¹¹=20 | Unchanged |
| 4.4 rank bounds and saturation | Multiplication by ℓ; rank 22; characteristic zero | Kummer saturation excludes nontrivial finite index; bound 20 needs characteristic zero | Unchanged |
| 4.5 congruence theorem and depth API | n=0,1; ℓ=2,3; I+3E₁₂ | Trivial rank-zero group; −1 breaks ℓ=2; odd-prime powers increase depth exactly once | Unchanged |
| 4.6 bounded descent | Closed k; finite k; imperfect k; rational point | Degree 1 over closed k; Brauer and inseparable obstructions retained for integral descent | Unchanged |
| 5.1 symplectic predicate and API | Identity; composition; scalar rescaling; −1 in characteristic 2 | Kernel is generator-independent; inverse pullback is multiplicative | Unchanged |
| 5.2 polarized stabilizer and API | Scalar line isomorphisms; L and Lⁿ | Scalars give no extra arrows; torsion-freeness gives equal stabilizers | Unchanged |
| 5.3 finite étale automorphisms | Nontrivial involution; nonclosed field; p=2 | Zero tangent gives étaleness; finite étale character kernel retains geometric forms | Unchanged |
| 5.4 Wehler example | Each deck involution; their ordered product | Gram determinant −12; product trace 14, determinant 1, eigenvalues 7±4√3 | Unchanged |
| 6.0 supersingular discriminant | σ=0,11; p=2 | Signature (1,21) forbids even unimodularity; rescaled dyadic evenness remains supplied | Unchanged |
| 6.0a height bound | h=1,10,11,∞ | Bounds 20,2,0; ample class excludes h=11; ∞ is not an integer input | Unchanged |
| 6.0b genus-one pencil | Rank 1; F and 2F; p=2,3 | Rank threshold and primitivity essential; quasi-elliptic case retained | Unchanged |
| 6.0c height/pencil rank and Jacobian API | No section; finite height; quasi-elliptic; rank 21 | Jacobian comparison retains no-section case; rank 21 forces 22 | Unchanged |
| 6.1 tame quotient | G=1; involution; rank-20 square determinant | Root rank 0 and determinant 1; 8A₁ determinant 2⁸; rank-20 contradiction uses genus-one/Jacobian inputs | Unchanged |
| 6.1a cyclic arithmetic and API | n=2,4,11,15 | 24=8·3; 72=4·15+2·2·3; excluded rank-20 determinants 121,225 | Unchanged |
| 6.2 fixed-point table | Identity; orders 2,7,8; wild element | Identity excluded; tame counts 8,3,2; no wild application | Unchanged |
| 6.2a wild fixed loci and API | Empty set at p=2; κ=0,1,2; N=2,d=1 | Enriques branch retained; κ=0 negative definite versus fibre radical at κ=1; inequality 0≤2 gives no prime bound | Unchanged |
| 6.3 wild quotients | Rational; K3; free characteristic-2 Enriques | Enriques Euler number 12 and b₂=10; no unowned equality ρ=b₂ | Unchanged |
| 6.3a wild refinements and API | p=11,13; quasi-elliptic; elliptic with section | Exceptional p=11 retained; p=13 excluded; stronger torsion-section assertion keeps section hypothesis | Unchanged |
| 6.4 wild-prime bound | p=2,13; arbitrary finite subgroup | Order-p element is symplectic; p≤11 without a symplectic subgroup hypothesis | Unchanged |
| 6.4a Picard faithfulness and API | Identity; p=2; degree-two deck involution in characteristic zero | Rank 22 and fixing all Picard classes are essential; one ample class is insufficient | Unchanged |
| 6.5 étale faithfulness | ℓ=p; tame kernel; rational, Enriques and K3 wild quotients | Coefficient exclusion retained; Enriques gives 10<22; K3 exceptional rank gives contradiction | Unchanged |
| 6.6 universal finite bound | G=1; characteristic 3; wild G | Use ℓ=5 at characteristic 3; integral congruence applies without averaging | Unchanged |
| 6.7d involution pencil | Identity; swap matrix modulo 2; p=3 | Exact order 2 essential; integral splitting not assumed; quasi-elliptic branch retained | Unchanged |
| 6.8 Artin-invariant predicate and API | p=3, rank 22, disc −9,+9,−81; rank 20 | Only rank 22 and −9 passes; signed determinant and exponent 2 matter | Unchanged |
| 6.8a invariant dimensions and API | G=1; C₇; nonabelian order 21; both Artin invariant 1 | Dimensions 24,6,6; universal lower bound five excludes double-exceptional branch | Unchanged |
| 6.9 Mathieu character | n=1,2,7; wild element | Character 24,8,3; empty product 1; wild formula not asserted | Unchanged |
| 6.10 characteristic-zero bound | Trivial group; cycle type 1⁸2⁸; 23-cycle | Orbit counts 24,16,2; last fails five-orbit condition | Unchanged |
| 6.11 tame bound | Exceptional group; p=2; nonclosed field | Four orbits allowed; p=2 tameness means odd order; geometric base change injects automorphisms | Unchanged |
| 7.1 primitivity and API | 0; generator; doubled generator; squarefree d | Zero and double fail; nonzero saturation clause retained; n² divides d | Unchanged |
| 7.2 multiplication/root loci | n=0; n=p=3; F,2F,0 | Positive n essential; finite root bounds use square or ample intersection; zero locus entirely nonprimitive | Unchanged |
| 7.3 polarized families and API | Constant family; d=0; Picard section without global line | Positive degree essential; étale representatives suffice; scalars are not arrows | Unchanged |
| 7.4 vanishing and polynomial | m=0,−1; d=2; p=2 | H²(O)=k excludes m=0; positive h⁰ values 4,10,20 | Unchanged |
| 7.5 cube embedding | r=0,1; d=1,2; p=2 | 2L failure violates divisibility; 3L failure forces impossible odd square 1; dimensions 10,19 | Unchanged |
| 7.6 Hilbert K3 locus and API | Smooth quartic; singular degeneration; equal ranks with unequal classes | Canonical-class equality and smoothness are indispensable | Unchanged |
| 7.7 Hilbert atlas and API | Cube root at p=3; Fermat coordinate swap | Closed Picard root locus used; distinct frames may give same Hilbert point; source identification retained in torsor | Unchanged |
| 8.1 moduli stacks and API | Involution stabilizer; p dividing 2d | Arrows retained; finite-type existence over every prime | Unchanged |
| 8.2 separation | Generic identity; ruled special-fibre control | Isomorphism extends uniquely between given families; non-ruledness necessary | Unchanged |
| 8.3 coarse spaces | Nontrivial stabilizer; k-forms | Only geometric classes identify with geometric points | Unchanged |
| 8.4 smoothness | d=1; p dividing 2d | Smoothness over ℤ[1/2] at d=1; no bad-prime claim | Unchanged |
| 8.5 finite-field finiteness | Twists; nontrivial obstruction over general fields; fixed d | Finite-field Brauer vanishing yields a line and a rational frame for each form | Unchanged |

The supplier-gap interfaces were also checked against their degenerate cases; no ownership is moved.

| Contract | Instances tried | Result | Change |
| --- | --- | --- | --- |
| surface-projectivity | Imperfect field; dimension 3 | Relative smooth surface hypothesis retained | Unchanged |
| hypersurface-cohomology | Quartic; nonample (2,0) divisor; dimension-zero ample divisor | Positivity and positive final dimension separate connectedness controls | Unchanged |
| oda-interface | Perfect closed field; absent rational point; p=2 | Perfectness and rational point remain explicit | Unchanged |
| surface-arithmetic-quotient | Degree-one and degree-two extensions | Intersection of pulled-back divisors unchanged; pushforward includes degree | Unchanged |
| tame-linear-groups | Trivial group; characteristic dividing order | Classification is prime-to-characteristic only | Unchanged |
| elliptic-surface-geometry | Product E×C; K3 pencil without section; wild and quasi-elliptic fibres | Torsion in R¹f_*O retained; Jacobian and quasi-elliptic clauses remain explicit | Unchanged |
| artin-discriminant | p=2; σ=11; primitive ample class | Evenness of B/p is separate from p-elementarity; de Rham injection is only 𝔽_p-linear | Unchanged |
| witt-formal-brauer | Finite height h; additive group; inseparable finite flat map; point blowup | Rank h, [p]=0 on additive group, norm degree and birational H² comparison compatible | Unchanged |
| crystalline-chern-derivative | Trivial line; square divisible by p | Derivative may vanish; no unrestricted smoothness conclusion | Unchanged |
| cross-realization | Finite-order and unipotent operators | Semisimplicity used only for finite order | Unchanged |
| integral-topology | O,O(1),O(−1); identity pullback | Chern degrees 0,+1,−1 and naturality agree | Unchanged |
| tame-lefschetz | Identity; tame isolated point; wild element | Euler trace at identity, local index +1, wild excluded | Unchanged |
| surface-quotient-resolutions | G=1; wild quotient | Canonical/coherent comparison maps do not assert wild vanishing | Unchanged |
| tame-quotient-singularities | A₁; E₈; wild group | Determinants 2,1; wild groups excluded from local linearization | Unchanged |
| quotient-transcendental-comparison | G=1; ℓ dividing group order | Rational comparison permits division by group order; no integral averaging | Unchanged |
| ruled-surface-two-forms | ℙ¹-bundle; point blowup | Fibre O(−2) has no sections; birational comparison preserves two-forms | Unchanged |
| mathieu-permutation-model | Identity; involution; 23-cycle | Fixed letters 24,8,1; 24·10200960=244823040 | Unchanged |
| mukai-eleven-groups-recognition | Quaternion group; even tame order; p=2 | Rational/ℚ₂ obstruction retains coefficient hypotheses | Unchanged |
| matsusaka-mumford | Identity; ruled special fibre | Non-ruledness remains essential | Unchanged |
| adjoint-positivity | r=0,1; characteristic 2 K3; general-type control | Surface restrictions and numerical bounds retained | Unchanged |
| exceptional-mathieu-embeddings | Equal orders with different group extensions | Abstract group structure, not order, is required | Unchanged |
| surface-brauer-localization | Deleted points; general divisor; rational exceptional trees | Residue term retained until its vanishing is justified | Unchanged |
| surface-brauer-kummer | H³ torsion zero or nonzero; G=1 | Finite torsion contribution retained in general contract | Unchanged |
| equivariant-brauer-descent | Trivial torsor; nonzero units cohomology | Units and differentials are not silently dropped | Unchanged |
| rational-surface-cohomology | ℙ²; inseparable dominant rational map | Nonzero degree remains invertible in ℚ_ℓ even when divisible by p | Unchanged |
| Unused crystalline Gauss–Bonnet and degree-one Picard contracts | §2.4 with only derived reduction and de Rham dimensions | No retained target needs either contract | Deleted under F01 |

## Maintainer notes

No headline or API name cited by another roadmap changed. `IsK3.hodgeAndCrystallineRanks` keeps exactly its original signature and characteristic range. The supplier request list shrinks from 27 gaps to 25: CrystallineCohomology need not add the proposed Gauss–Bonnet or Picard-degree-one Part II sections for this consumer. Its existing CR.2.3 and CR.3.2 contracts suffice here. Other consumers may independently need those theories; no supplier file was edited and no such need is asserted or cancelled on their behalf.

The only new Check name is `crystalline_torsion_control`. The three Checks belonging exclusively to the deleted Gauss–Bonnet contract leave the README and plan together. The source manifest preserves the two unused works' certified provenance. Only the three authorized design/source files and this requested report are changed; no commit, push, pull-request edit, tooling change or merge-order change was made.
