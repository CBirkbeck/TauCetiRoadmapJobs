# Design repair: K3 surfaces and symplectic boundedness

## F01 (P1) — applied differently

Implicit Artin, pencil and Brauer inputs → four earlier K3 targets (§§6.7a–6.7d), three distinct Brauer supplier gaps, complete formal-Brauer requirements and explicit consumers in §6.8a. Meyer uses GlobalQuadraticForms §5.5 and QuadraticFormInvariants Layer 6D. Pencils retain the quasi-elliptic alternatives in characteristics 2 and 3. Each new target has hypotheses, locators and three Checks.

Evidence: artin-supersingular line 40 requires projective lifting for the height inequality; §2.7 supplies it. The elliptic height-to-rank theorem is artin-supersingular line 192. Huybrechts' smooth elliptic formulation excludes characteristics 2 and 3 (huybrechts line 7879), while huybrechts line 1127 explains the quasi-elliptic alternative. The latter has a separate unirational-surface argument in §6.7c. Brauer localization, Kummer and equivariant descent occur at dolgachev-keum lines 599–647; formal-group pullback and trace occur at dolgachev-keum lines 652–661.

The source's general integral-involution assertion at dolgachev-keum line 643 is false: the matrix exchanging two basis vectors has order two and remains nonidentity modulo two. The new target does not assume that assertion or integral splitting into rational eigenspaces; `involution_mod2_control` records the counterexample. The K3 rank theorem remains a theorem target, requiring the integral Kummer and descent argument with its extension terms retained.

The three general Brauer theorem families are declared as gaps of EtaleCohomologyFoundations, proposed Part II §§surface-Brauer-localization, surface-Brauer-Kummer and equivariant-Brauer-descent. This package does not claim that the supplier already states them.

## F02 (P1) — applied

Unowned rational/Enriques algebraicity claims → a general rational/unirational-surface cycle supplier gap and a finite étale quotient-invariants gap. The Enriques branch now computes Euler characteristic 12 and second Betti number 10, without identifying Picard rank. Updated §§6.2a, 6.3 and 6.5, and added `enriques_betti_not_picard`.

Evidence: keum line 321 makes the original argument depend on transcendental vanishing; keum line 802 identifies the free characteristic-two branch. For its degree-two étale torsor, tangent pullback and Chern projection give 24=2·deg c₂(Y). EtaleCohomologyFoundations F.6 gives e(Y)=12. Rational quotient descent and §3.4 give H¹(Y)=H³(Y)=0, so b₂(Y)=10. The rational-surface input is covered by Shioda's general dominant-map comparison (shioda-unirational-primary lines 104–140).

The rational/unirational theorem is assigned to SchemeAndStackFoundations, proposed Part II §birational-surface-cohomology; quotient invariants are assigned to EtaleCohomologyFoundations, proposed Part II §finite-etale-quotient-cohomology. Both are supplier gaps, not assertions about existing supplier targets.

## F03 (P2) — applied

Two-item `artin-discriminant.needs` → all four consumed requirements: p-elementarity, crystalline index, integral even rescaling including p=2, and nonzero primitive ample (1,1) class for Artin invariant greater than one. README and plan now agree. The Picard-mod-p injection is explicitly 𝔽_p-linear, avoiding an incorrect k-linear dimension assertion.

Evidence: huybrechts lines 14328–14341 distinguish p-elementarity, index parity and the even rescaling argument. Dolgachev-keum lines 737–755 supply the (1,1) input. The requested rescaling parity is not inferred from p-elementarity alone.

## F04 (P2) — applied

Rational-only `mukai-eleven-groups-recognition.needs` → rational and compatible ℚ_ℓ forms, including invariant dimension, Sylow-2 embedding and the faithful two-dimensional quaternion obstruction over ℚ₂ when the group order is even. The README mirrors the same contract; the rational form still serves §6.10.

Evidence: dolgachev-keum lines 793–808 explain exactly where the rational argument must be replaced by a 2-adic obstruction. If p=2, tameness makes the group order odd; the argument never requires unavailable 2-adic cohomology in characteristic two.

## F05 (P3) — applied

Formal-Brauer and genus-one `needs` sentences → explicit pullback/trace and fibre-lattice index requirements. The tame-linear-groups contract now owns only local group classification; ADE discriminants and quaternion obstructions point to their distinct contracts. All affected `neededBy` lists and README contracts agree.

Evidence: dolgachev-keum lines 656–660 use pullback and trace; dolgachev-keum lines 424–443 give the vertical root-lattice index relation. Resolution discriminants belong to `gap:tame-quotient-singularities`; representation obstructions belong to `gap:mukai-eleven-groups-recognition`.

## F06 (P3) — applied differently

Continuity plus finite-field Brauer gap → cohomological Brauer comparison only. §4.6 derives continuity from §4.1 and finite generation. Removed the gap from §4.1; retained it only at §§4.6 and 8.5. Added the pinned algebraic finite-field Brauer theorem to the exact Tau Ceti contract.

The missing-comparison diagnosis is correct, but algebraic finite-field Brauer vanishing already exists: `TauCeti.subsingleton_brauerGroup_of_finite [Finite K] : Subsingleton (BrauerGroup K)` in `TauCeti/Algebra/BrauerGroup/Trivial.lean` at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read after GitHub object search, this proves the algebraic vanishing directly. The general theorem therefore is imported, not requested again. The remaining gap identifies this group with H²_fppf(Spec k,G_m).

For continuity, a class defined over a finite extension has an open stabilizer; over an imperfect field its finite separable part suffices because automorphisms fixing the base also fix purely inseparable elements. Intersect the stabilizers of finitely many generators. This is precisely the finite-descent argument at huybrechts lines 14042–14054. `littleWedderburn` and its alias were also read at Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a` in `Mathlib/RingTheory/LittleWedderburn.lean`.

## F07 (P3) — applied

Secondary remark alone → distinct primary entries and API locators for Rudakov–Šafarevič (1976), §2 Theorem 5 and Corollaries 1–2, and Shioda (1974), §2 Lemma and Corollary 2. Both texts were fetched legally and read. Added References entries and the general surface supplier input; the 1981 Picard-faithfulness reference is preserved.

Evidence: rudakov-shafarevich-inseparable lines 481–486 give the unirationality reduction; lines 489–497 give the rank and pencil consequences. Shioda-unirational-primary lines 104–140 prove dominant-map monotonicity of the transcendental dimension and its unirational corollary. Lang-nygaard lines 126–127 identify the 1976 paper. The correct Shioda reference here is *An example of unirational surfaces in characteristic p*, rather than the different 1977 paper on supersingular surfaces.

The rank calculation in §2.1a explicitly uses general surface cohomology, Noether and étale Gauss–Bonnet. It does not consume the later K3 Betti, crystalline or lattice targets, avoiding a dependency back into the no-vector-fields proof.

## Adversarial mathematics pass

These are mathematical substitutions and proof-interface checks, not Lean elaboration or claims that theorem targets have been implemented. A row includes its target's bundled API and displayed identities. Existing targets outside the findings retain their statements.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: intersection and half-norm | Quartic H; rational curve C; zero | B(H,H)=4, Q(H)=2; B(C,C)=−2; B(0,0)=0 | None |
| Conventions: inverse pullback and contraction | Identity; two composed maps; basis e₁,e₂; p=2 | Composition reverses under pullback; contraction sends e₁ to e₂* and e₂ to −e₁* | None |
| Conventions: twists and primitivity | Geometric point; quartic; doubled class | Trace of a point is 1; cup square 4; a doubled class is not primitive | None |
| §1.1 native K3 predicate and API | Empty scheme, plane, abelian surface, quartic | Only quartic satisfies all five conditions | None |
| §1.2 transport | Identity and inseparable extension | Relative smoothness and flat coherent comparison retain the hypotheses | None |
| §1.3 projectivity | Quartic and imperfect base | Uses the declared full surface supplier, not descent of an arbitrary geometric embedding | None |
| §1.4 RR and contraction | O, quartic hyperplane, characteristic two | Integer identities give 4 and 8 for 2χ; contraction remains invertible | None |
| §1.5 numerical kernel | O, p-torsion, a (−2)-curve | Only O can be numerically zero | None |
| §1.6 quartic | t=0,1; Fermat at p=2 | χ values 2,4; the characteristic-two Fermat equation is nonreduced | None |
| §2.1 Picard space and API | Geometric field, jumping family, zero class | Field fibre is étale; relative jumping does not imply relative flatness | None |
| §2.1a differential kernel and reductions | x=0, p=2, finite height | Needs a nonzero kernel witness; finite height has a distinct proof | Primary citations and acyclic rank proof made explicit |
| §2.2 closedness | Zero form; p=2 | No division by two; no assertion for arbitrary surfaces | None |
| §2.3 no vector fields | Abelian surface; p=2 | K3 H¹(O) condition excludes the abelian example | None |
| §2.4 Hodge/crystalline ranks | Degrees 0–4 and outside; zero higher exterior powers | Euler sum 24; rational rank alone does not imply freeness | None |
| §2.5 marked deformations | Dual numbers; nontrivial unmarked automorphism | Tangent dimension 20; marking matters | None |
| §2.6 line-class divisor | L=O; p divides 2d | Zero class must be excluded; bad primes do not get smoothness | None |
| §2.7 polarized lift | Ramified trait; p=2 | Ramification permitted; no good-prime restriction | None |
| §3.1 analytic predicate and API | Empty manifold, torus, quartic | Nonemptiness and H¹(O)=0 discriminate | None |
| §3.2 analytification | Projective and nonprojective analytic K3 | Algebraic image retains the projective criterion | None |
| §3.3 integral Betti and exponential comparison | Euler sum; quartic; unit circle | 24, cup square 4, exponential increment +1 | None |
| §3.4 integral étale cohomology | ℓ=p; ℓ=2≠p; point trace | Equal characteristic coefficient excluded; prime two otherwise retained | None |
| §4.1 base change and descent | Identity; closed base; invariant class with obstruction | Rational descent does not imply unconditional integral descent | Removed unrelated finite-field Brauer gap |
| §4.2 lattice and API | Gram [4]; zero class; rational curve | Evenness does not imply unimodularity; rank zero cannot be geometric K3 | None |
| §4.3 rank and API | Closed base; characteristic-p rank 22 | Rank is independent of closure and is not h¹¹ | None |
| §4.4 cycle saturation | Equal-rank multiplication by ℓ; characteristic zero | Equal rank plus injection is insufficient; saturation supplies the isomorphism | None |
| §4.5 congruence kernel and power-depth API | n=0,1; ℓ=2,3; transvection | −1 disproves the dyadic analogue; odd-prime result survives | None |
| §4.6 bounded descent | Closed field; imperfect base; finite field; no rational point | Open stabilizers yield finite image; integral descent still needs obstruction control | Continuity derived from §4.1 |
| §5.1 symplectic kernel and API | Identity, products, scalar −1 at p=2 | Actual action on the volume line, with inverse-pullback convention | None |
| §5.2 polarized stabilizer and API | Identity; representative rescaling; Lⁿ | Scalar line isomorphisms are not extra automorphisms | None |
| §5.3 finite étale stabilizer | Nonidentity involution; nonclosed field; p=2 | Geometric and rational points differ; zero tangent is retained | None |
| §5.4 infinite symplectic example | Two deck involutions and their product | Determinant −12; product trace 14 and determinant 1; volume scalars multiply to 1 | None |
| §6.1 tame quotient | G=1; involution; wild group | Empty root lattice determinant 1; eight A₁ factors determinant 256; wild input excluded | None |
| §6.1a cyclic arithmetic and API | n=2,4,11,15 | Euler equations give 24 and 72; the last two square determinants require exclusion | None |
| §6.2 fixed-point table | Identity; orders 2 and 7 | Identity excluded; 8 and 3 fixed points | None |
| §6.2a wild alternatives and API | Empty locus; κ=0,1; D²=2,d=1 | Characteristic-two free branch retained; denominator N−d−1 may vanish | Rational-resolution cycle input named |
| §6.3 quotient cohomology | Rational resolution; free C₂ quotient at p=2 | Rational branch algebraic; free branch e=12, b₂=10 | Enriques Picard claim replaced by Betti calculation |
| §6.3a wild refinements and API | p=11,13; quasi-elliptic p=2,3 | Pencil reduction has exceptions; genus-one includes quasi-elliptic | None |
| §6.4 wild-prime bound | p=2,13 | Wild characteristic two retained; at 13 finite groups are tame | None |
| §6.4a Picard faithfulness and API | Identity; p=2; characteristic-zero deck involution | Fixing an ample line is weaker than fixing full rank-22 Picard group | None |
| §6.5 cohomological faithfulness | Identity; ℓ=p; characteristic-two Enriques | Wrong coefficient excluded; free quotient has too few invariants for trivial action | Quotient inputs made explicit |
| §6.6 uniform finite-group bound | G=1; p=3; wild group | Choice ℓ=5 at p=3 avoids equal characteristic; averaging not needed | None |
| §6.7 supersingular discriminant | σ=0,11; p=2; signature (1,21) | Signed determinant negative; even rescaling is necessary for the σ=11 contradiction | Precise parity contract synchronized |
| §6.7a height inequality | h=1,10,11; infinite height | Bounds 20,2,0 respectively; h=11 contradicts positive rank; infinity is not an integer height | Added target and boundary Checks |
| §6.7b rank-five pencil | Rank one; F versus 2F; p=2,3 | No rank-one isotropic class; multiples do not define a primitive pencil; smoothness not automatic | Added target and boundary Checks |
| §6.7c elliptic height-to-rank | No section; finite height; quasi-elliptic branch | Section unnecessary; height hypothesis essential for elliptic assertion | Added target with separate quasi-elliptic deduction |
| §6.7d involution pencil | Identity; swap matrix mod 2; p=2,3 | Identity and wild p=2 excluded; source's general mod-2 assertion fails; p=3 keeps genus-one alternative | Added target and negative controls |
| §6.8 Artin-one predicate and API | Rank 22, p=3, determinants −9,+9,−81; rank 20 | Only rank 22 and −9 satisfies the predicate | None |
| §6.8a invariant dimensions and API | G=1,C₇,C₇⋊C₃; both Artin-one | Dimensions 24,6,6; five not asserted in exceptional branch | Explicit earlier height/pencil dependencies |
| §6.9 character formula | n=1,2,7; wild element | Empty prime product 1; values 24,8,3; wild formula excluded | None |
| §6.10 characteristic-zero recognition | Trivial group; involution; 23-cycle | Orbit counts 24,16,2 discriminate the five-orbit condition | Rational contract retained |
| §6.11 tame positive-characteristic recognition | p=2; even-order group; exceptional branch | At p=2 tame groups are odd; otherwise ℚ₂ obstruction available when needed | ℚ_ℓ supplier contract synchronized |
| §7.1 primitivity and API | Zero, generator, doubled generator | Zero and double fail; squarefree d prevents n² dividing d | None |
| §7.2 root loci | n=0,3; characteristic three | n=0 excluded; no division by three for the root locus | None |
| §7.3 polarized family and API | Constant family; d=0; obstructed section | Positive degree and Picard-section formulation discriminate | None |
| §7.4 ample powers | m=0,1,−1; d=2 | m=0 cannot have vanishing; positive section dimensions 4,10,20 | None |
| §7.5 cubing | d=1,2; p=2 | Projective dimensions 10,19; polynomial coefficients 9,18 | None |
| §7.6 Hilbert K3 locus and API | Quartic; singular degeneration; trivial versus merely rank-one canonical line | Smoothness and actual Picard-class equality are necessary | None |
| §7.7 Hilbert atlas and API | Characteristic three; changed frame; obstructed cube root | Root locus and Picard section retain all primes and twists | None |
| §8.1 stacks and API | Polarized involution; p divides 2d | Stabilizer prevents fine-scheme replacement; atlas still over ℤ | None |
| §8.2 separatedness | Identity on trait; punctured family with no supplied smooth extension | Extends isomorphisms of given families, not arbitrary families | None |
| §8.3 coarse spaces | Nontrivial stabilizer; distinct k-forms | Geometric point correspondence is not a bijection on k-forms | None |
| §8.4 smooth open | d=1; p divides 2d | Base ℤ[1/2] for d=1; bad-prime smoothness not asserted | None |
| §8.5 finite-field forms | Fixed k,d; distinct twists; obstructed representative | Cohomological Brauer comparison yields the line representative needed for frames | Uses narrowed gap and pinned algebraic Brauer vanishing |
| Formal-Brauer supplier contract | Finite height h; additive formal group | Dieudonné rank h; both-direction Hom vanishing follows by composition with [p] | Functoriality and group-theoretic requirements explicit |
| Brauer localization, Kummer and descent contracts | Punctures, exceptional rational trees, arbitrary divisor, nontrivial units terms | Residue/differential/finite-torsion terms retained; no unconditional restriction isomorphism | Three separate gaps |
| Rational/unirational surface contract | Plane, inseparable dominant cover, rational resolution | Degree is nonzero in ℚ_ℓ; pullback–pushforward proves cohomology algebraic | General theorem assigned to surface owner |
| Finite étale invariants contract | Free C₂ action in characteristic two; ℓ divides group order | Rational averaging is valid; integral averaging need not be | Explicit rational-coefficient gap |
| Elliptic surface index contract | a=1,2 | Determinant multiplier 1,4 distinguishes the finite-index correction | Included in needs |
| Artin (1,1) contract | σ>1; primitive versus p-divisible class | Primitive class has nonzero 𝔽_p-linear image; k-linear injection is not requested | Included in needs |
| Mathieu and tame-linear contracts | Trivial group, Q₈, odd-order groups at p=2 | Recognition and local classification have distinct premises and owners | Contracts synchronized without overlap |

## Checks and maintainer notes

Dependency gate: exit status 0. Exact output:

```text
candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after JacobianChallengePartII (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order file was edited.

Structural validation: JSON and TOML parse. The 60 unique plan targets match the 60 README target subsections in order. All 11 changed/new targets match the README statement, proof sketch, named API and Checks; each has at least three Checks. All 30 gap identifiers, target `Needs`, plan `neededBy` and README `Required by` lists agree. All local target prerequisites precede their consumers. The 11 changed/new gap contracts match their `needs` and `detail` text exactly. All gaps name a supplier and section.

Source validation: 18 manifest records have the required metadata and valid target identifiers. Every certified source has its hash. The three new primary works are certified legal-cache texts; no source text was copied into the repository. There is no unresolved missing-reference request. Existing waived references remain settled.

Pinned/sibling checks: the finite-field algebraic Brauer theorem and Mathlib's finite-division-ring theorem were searched and then read at the stated pins. Read main-roadmap contracts for GlobalQuadraticForms §5.5, QuadraticFormInvariants Layer 6D, IntegralLattices and EtaleCohomologyFoundations F.2/F.6, alongside the existing Picard and surface suppliers. ArithmeticDynamics and ErdosProgressionPowers have no supplier role or overlap with these repairs; their open-roadmap material adds no premise here.

`git diff --check`: exit status 0, no output. No machine paths occur in the deliverables. No `Suggested.lean` exists at this design stage, and none was created or edited; no Lean elaboration command applies to these prose/plan changes. No commit or GitHub write was performed.

The four new theorem names are `IsK3.artinHeightInequality`, `IsK3.genusOnePencil_of_rank_ge_five`, `IsK3.ellipticSupersingular_rank22` and `IsK3.symplecticInvolution_genusOnePencil`. Existing endpoint names are unchanged. `tameInvariantDimension.involutionPencil` now promises a genus-one pencil, explicitly including the characteristic-three quasi-elliptic alternative; `tameInvariantDimension.supersingularTransfer` consumes the new targets. No existing cross-roadmap citation name was deleted.

The five new gaps are supplier requests, not implementations or amendments of those roadmaps. Their proposed Part II sections require supplier follow-up outside this package. Added direct mathematical imports are GlobalQuadraticForms §5.5 and QuadraticFormInvariants Layer 6D, both on main. All original endpoint families and all-prime moduli scope remain unchanged.
