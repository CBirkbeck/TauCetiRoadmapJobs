# Review of EllipticCurveModularityWild3Adic (pull request #1484 at 22bf0ae)

**Verdict:** accepted

:robot: Independent AI incremental re-review of 65 changed lines since de00219. No findings remain. This verdict concerns readiness for human final approval, not approval or merge.

## Previous findings

- R01 — repaired: README:29,101,487,583 names AbelianSchemesAndArithmeticModuli §§A6.10–A6.12/A6.21, separates prime-to-characteristic Tate polynomials from crystalline comparison, and tests rank four and unital coefficient-field rank one.
- R02 — repaired: README:94,1293,1341,1371 cites OrdinaryAutomorphicFormsAndModularityLifting §5.10 alone. The selected unramified quotient, distinct characters and extra restriction at p=3 remain explicit.
- R03 — repaired: README:678,695 postpones the rings; §§2.10–2.11 assert integral models; §§3.4/4.3 establish residual membership; §§3.8/4.6 construct the rings; §§3.9/4.7 then prove factorization.
- R04 — repaired: README:121 fixes ψ(1/3)=ζ; §0.8 uses θ=−√−3/54 and adds the trace and Gauss-sum computations at README:225–226. The original sign counterexample now gives ζ on both sides.

## Verified sound

**Scope of this round.** Only README.md changed: 35 insertions and 30 deletions. Suggested.lean and the library pins are unchanged. The review inspected the changed passages and their mathematical inputs and consumers, including the residual-membership dependency chain. Unchanged adversarial rows below are explicitly carried from [r1], not presented as new computations. All file locations in the preceding section are in `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md`.

[r1]: packages/EllipticCurveModularityWild3Adic/reports/PRREVIEW-EllipticCurveModularityWild3Adic~1.md

**Principles and ownership.** No new shortcut, re-planning, computational algorithm, copied source passage, sorry'd data, or option override is introduced. The general abelian inputs now have their existing owner; this roadmap retains the cross-prime assembly and explicit wild models. No new Lean declaration or duplicate fully qualified name was introduced. Searches by object through the roadmap service, main, board packages and supplied open heads found the abelian endomorphism/freeness owner in AbelianSchemesAndArithmeticModuli. The supplied open AbelianVarietiesOverFiniteFields README:147–156 also imports that owner, rather than providing a competing prerequisite. Its finite-field scope does not replace the local-field Weil realization assembled here. General category deformation rings remain owned by LocalGaloisDeformationRings §8.6.

**Build and gate.** The supplied head gate passed every check, including build. The fresh scanner/dependency gate also returned OK with every counter zero. The explicit targeted command `lake build TauCetiRoadmap.EllipticCurveModularityWild3Adic.Suggested` succeeded (9096 jobs); direct `lake env lean` elaboration of the specified file succeeded with exactly ten sorry warnings and no other warning. The outside-folder diff is empty, and git status is clean.

The required dependency command returned:

```text
depcheck: 204 roadmaps, 1496 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The internal order was checked separately: cubic residual membership comes from §3.4 before §3.8; quadratic membership comes from §4.3 using the integral assertion of §2.11 before §4.6. Neither existence argument uses its category-condition ring. The unchanged extended family already supplies its residual filtration in §5.6. Type-quotient surjections are established only after the corresponding category ring exists.

**Elaborated signatures and headline coverage.** A scratch copy with `#check @name` for all 16 declarations elaborated. The nonzero cube-class hypothesis, field equations, positive matrix size, discrete-target continuity, cocycle laws, characteristic zero, faithful equivariant action and ellipticity binders remain present. No signature changed or lost a hypothesis. The ten headline theorems are: cube-class coordinates; cyclic cubic Galois structure; nonabelian cubic degrees; three degree-24 field families; matrix and special-linear Hilbert 90; the equivariant icosahedral lift; and elliptic modularity in the newform formulation. All remain stated.

The module docstring still names the other headlines and their absent carriers: simple admittance; Breuil classification/wild descent; tangent bounds, weak acceptability and characteristic-three deformation rings; the general abelian cross-prime comparison; twisted-curve rationality and companions; residual modularity/comparisons; and the conductor/parametrization refinement. Moving the category-ring assertions does not make their carriers available at the pins. No new omitted statable headline or stand-in was found.

**Padding probes.** A separate scratch copy tried each of `simp`, `rfl` and `infer_instance` as a sole closing tactic on all ten admitted theorems. It elaborated with all ten sorry warnings still present: none closed. The scalar Hilbert-90 declaration was reopened; the unchanged exact-library-lemma analysis is carried from [r1]. No padding finding remains.

**Sources checked in the changed passages.** These comparisons use the supplied legal text extractions. Source lines identify passages; the descriptions below are paraphrases.

| Passage | Source locator | Verification |
|---|---|---|
| §§0.1,0.8 normalization | BCDT §3.4, pp. 867–868, lines 1213–1218 | ψ(1/3)=ζ and the negative trace coefficient agree; the auxiliary character has the asserted inverse value. |
| §1.13 general comparison | CDT Lemma B.4.1 and Proposition B.4.2, pp. 563–565, lines 2090–2092,2125–2169 | Potential good reduction, number-field action, all coefficient factors, semisimplicity by finite-index restriction and the Barsotti–Tate conclusion match. |
| §§2.5,2.6,3.8,4.6 | BCDT §4.3, pp. 874–875, lines 1564–1606 | Residual containment, scalar endomorphisms, determinant compatibility and killed-by-3 tangent self-extensions are all retained. |
| §§2.10,3.9 | BCDT §4.4, p. 875, lines 1618–1625 | Finite-flat models at all torsion levels give the point-kernel factorization; the revised roadmap orders residual existence first. |
| §2.11 (seeded and changed), §4.7 | BCDT §4.5, pp. 876–877, lines 1651–1679 | Descent/coefficient actions, determinant 3, scalar square −3 and integral operator identities agree. |
| §3.4 (seeded and changed) | BCDT Lemma 7.2.3 and Corollary 7.2.4, p. 906, lines 3038–3074 | The source explicitly exhausts all nine generic extension classes; c=0 is exactly the peu line. |
| §4.3 (seeded, changed Check) | BCDT Proposition 8.2.1, pp. 912–917, especially lines 3534–3541 | Existence comes from an elliptic 3-torsion model and the integral operator argument; uniqueness and nonzero Frobenius are retained. |
| §1.11 input to §3.4 | Manoharmayum list and Theorem 5.3.2, p. 751, lines 847–887 | The cubic families distinguish three cyclic norm lines and the nonabelian family; the generic classes used for existence are supplied. |
| §1.12 input to §4.3 | Manoharmayum Theorem 5.4.2, p. 753, lines 1004–1013 | The e=12 families include the required très ramifié residual shapes. |
| §§3.1,3.7 inputs to §3.8 | BCDT §7.1, p. 904, lines 2960–2965; §7.4, p. 910, lines 3247–3256 | Rank-one models and the nonzero-c parameter cancellation still feed the same tangent bound. |

Of this round's fifteen seeded targets, §§2.11,3.4,4.3 intersect the diff. Their source comparisons were repeated above. The source evidence and computed rows for the remaining unchanged targets (§§0.3,0.4,1.8,1.11,1.15,3.1,3.7,4.1,5.2,5.10,6.6,6.7) are carried from [r1]; the supporting §1.11/3.1/3.7 passages were additionally reopened for the repaired dependency chain. No newly marked unverified locator occurs.

**Supplier citations re-resolved.** The citation service found no unresolved cross-roadmap citation. Its fresh run did not inspect pinned library names, so that part was checked directly where relevant. The original resolver's `BarsottiTate.extend_genericFibre` lead is not a defect: README:90 attributes it to the planned supplier theorem R07.1.22, which exists, not to a pinned declaration. Supplier files below are under `TauCetiRoadmap/`; line numbers exclude the service's one-line wrapper.

| Supplier file | Sections and line witnesses | Result relevant to the repair |
|---|---|---|
| AbelianSchemesAndArithmeticModuli/README.md | A6.10:2997; A6.11:3025; A6.12:3042; A6.21:3343 | General endomorphism polynomials, prime-to-characteristic comparison, unital field freeness and Frobenius semisimplicity are exactly the new contract. |
| OrdinaryAutomorphicFormsAndModularityLifting/README.md | §5.10:683 | Distinguished residual seed with the selected quotient; ordinary unramified quotient requires that residual quotient unramified. |
| LocalGaloisDeformationRings/README.md | §1.12:1445; §3.12:2417; §8.6:3758 | Coefficient change, type-point kernels, residual-containing category condition and tangent; p=3 does not divide rank 2. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md | R07.1.22:1858; R07.1.25:2026; R07.4.27:6814; R07.4.30:6936 | Existing-model full faithfulness is distinguished from model existence; the lattice/descent theorem supplies the latter. |
| PadicHodgeTheory/README.md | §8.3:1427; §9.3:1499 | General covariant inverse-dual comparison and algebraic/crystalline good-reduction criterion, not an elliptic-only input. |
| PadicLocalLanglandsForGL2Qp/README.md | §§0.3:267,2.8:855,4.4:1447,5.13:2025 | The changed additive normalization leaves the residual normalizer/admittance conventions unchanged. |
| GL2ModularityLifting/README.md; ClassicalSerreModularity/README.md | §§5.9:1364,5.11:1406,5.14:1459,5.15:1476; §I.1:423 | Selected ordinary witness and full ordinary lifting remain distinct from the potentially Barsotti–Tate branch. |
| ArithmeticGaloisRepresentations/README.md | §§1.8:1127,4.1–4.6:2843–3011,5.1–5.4:3147–3217,6.1–6.3:3631–3870 | The imported recognition, image, determinant and elliptic reduction inputs retain their original scope. |
| ModularCurvesPartII/README.md; InverseGaloisAndArithmeticFundamentalGroups/README.md | §§4.10:1560,5.14:1936,5.15:1966,6.5:2212; §IG.2.7:2280 | Paired twists, compactification, level maps and local Hilbert specialization resolve. |
| AutomorphicGaloisRepresentations/README.md; EllipticCurveModularity/README.md | §§1.5:1134,7.3:3097; R29.3–R29.6:1019–1604 | Newform realization and conditional comparison/conductor/parametrization interfaces remain suppliers. |
| GL2AutomorphicRepresentationsAndTransfer/README.md; AlgebraicModularFormsAndSerreWeights/README.md | R16.2:678,R16.3:879,R17.5.17:2445; alias dictionary:18, Layers 3:587,5:1202,7:1513 | Types and weight-one octahedral lift resolve; the R15 aliases name the appropriate weight and lifting layers. |
| ComplexMultiplicationAndExplicitReciprocity/README.md | CM induction and compatible-system comparison:674 | The CM case remains imported. |

The main-roadmap contracts were re-resolved on main: ClassFieldTheory §§2.6 and Layers 5,7,8,11,12; LocalGaloisGroups Layer 1; LocalFieldsRamification Layers 0,2,3; EllipticCurves Layers 2,4; ModularCurves §5C; ModularForms Layers 4,9; Chebotarev through ArithmeticGaloisRepresentations §5.1; and RepresentationTheory/InductionRestriction Layer 7 (README:721). Their unchanged detailed contract assessments are carried from [r1]. No upward supplier or undeclared gap was introduced.

**Pinned library evidence.** Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Three native interfaces were reopened: Mathlib `groupCohomology.H1ofAutOnUnitsUnique` (Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:107), a finite-dimensional scalar result; Tau Ceti `HeckeRing.GL2.Newform` (TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104), with good-index eigenvalue at line 91; and `WeierstrassCurve.Affine.Point` (Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477), which includes infinity and nonsingular affine points. These do not turn the matrix targets into scalar Hilbert 90 or change the modularity point count. The twelve-entry library audit and remaining unchanged declaration checks in [r1] are carried forward.

**Computed adversarial table.** 18 fresh rows replace 15 affected rows of the previous 93-row table; 78 untouched rows follow with an explicit [r1] citation in each. This covers every changed mathematical assertion, the seeded targets and all Lean headlines. The values are tests of the statements and conventions, not substitutes for their general proofs.

| Statement | Instances tried | Computed sides / values | Result; change |
|---|---|---|---|
| 0.1 additive-character normalization | s²=−3, a=4, ψ(1/3)=ζ | N(s)=3; −θN(s)²=s/6 for θ=−s/54; 1+2ζ=ζ−ζ⁻¹; (ζ−ζ⁻¹)²=−3 | Pass. The normalization is now explicit at README:121. |
| 0.8 trace identity | x=3s and x=0 | tr(−3s²/54)=2·(1/6)=1/3, so both sides are ζ; at 0 both sides are 1. The old sign gives ζ⁻¹≠ζ | Pass. README:218,225 excludes the previous counterexample. |
| 0.8 auxiliary character | s/6=(−1/2)/s | −1/2≡1 mod 3 is a square unit; χ″(s/6)=χ″(s)⁻¹=ζ−ζ⁻¹; hence χ″(s)=(ζ−ζ⁻¹)⁻¹ | Pass. README:226 preserves the induced-type normalization. |
| 1.13 general abelian comparison | A=0,E,E×E; E:y²=x³−x over F₃ | Ranks 0,2,4; #E(F₃)=4 gives a₃=0; arithmetic polynomials 1, X²+3, (X²+3)² | Pass. General suppliers now cited; crystalline comparison remains an owned assembly. |
| 1.13 coefficient freeness | CM elliptic curve with quadratic L; projector action on E×E | Unital coefficient rank 2/2=1 in every factor; forgotten rank 2. Projector e=diag(1,0) satisfies e²=e but e≠I and has ranks 2 rather than 4 on rational Tate modules | Pass. The corner action is excluded by the unital hypothesis. |
| 1.13 semisimplicity and normalization | Finite quotient C₂; E over F₉ | Averaging divides by 2≠0 in characteristic zero; a₉=0²−2·3=−6, arithmetic polynomial (X+3)², covariant polynomial (X+1/3)² | Pass. Averaging is legitimate; inverse-dual followed by arithmetic inversion is consistent. |
| 2.5 cubic subcategory | {0}, residual V, V⊗F₃[ε]/ε² | {0} has 0 objects isomorphic to nonzero V; dim V=2 and order 9; the self-extension has dimension 4, ε-kernel/image each dimension 2 | Pass. Closure alone no longer asserts a ring or tangent at V. |
| 2.6 quadratic subcategory | F₉² with F=V=0 and γ₄=diag(j,−j); identified E[3] | Operator values F+V=0 and γ₄²+I=0; these alone do not identify a residual module. E[3] has order 9 and the specified residual identification | Pass. Ring construction now explicitly needs residual membership. |
| 2.10 cubic integral models | T/3T,T/9T; finite coefficient extension | Rank-two Z₃-lattice quotients have orders 9,81; a rank-two lattice over residue field of size 3ᶠ has first quotient order 3²ᶠ and residual filtration length f | Pass. All finite levels remain covered; no category ring is used in the model assertion. |
| 2.11 quadratic operator identities | F=[[0,−3],[1,0]], V=−F; reduction mod 3 | det F=3, F²=−3I, FV=3I, F+V=0; mod 3 F(1,0)=(0,1)≠0 and F²=0 | Pass. Identities descend to torsion; ring factorization is postponed. |
| 3.4 cubic residual membership | (c,c′)∈F₃², both δ=±1 | 9 pairs: 3 with c=0 and F=0, 6 with c≠0 and F≠0; generic Ext has 3²=9 elements, so the injective map is onto | Pass. Every normalized très class has an identified model of order 9, before §3.8. |
| 3.8 Schur hypothesis and cubic tangent | D=diag(1,2), U=[[1,1],[0,1]] over F₃; split control | Common centralizer is {0,I,2I}, size 3 and dimension 1; centralizer of D alone has size 9 and dimension 2. det D=2=ω(D), det U=1; comparison-kernel dimension 2−1=1 | Pass. Nonsplitting, residual membership and determinant compatibility supply §8.6; tangent ≤1. |
| 3.9 cubic factorization and weak acceptability | Point-kernel intersection; O[[X]]/(X²); no type points | Category ideal J is contained in every point kernel, hence J⊆I and R/J→R/I; relative tangent of O[[X]]/(X²) is 1, X²=0; empty intersection gives unit ideal and zero ring | Pass. Direction and zero case are correct; no smoothness or existence of type points follows. |
| 4.3 quadratic residual existence | Both δ=±3; identified E[3] | Full 3-torsion order 9 exceeds Frobenius-kernel order 3; F is nonzero. One-step residual filtration has length 1 | Pass. Existence uses §2.11's integral assertion, so it precedes the category ring. |
| 4.6 quadratic ring and tangent | Nonsplit versus split residual extension; both signs | End dimensions 1 versus 2; normalized determinant ω; identified residual order 9; comparison kernel dimension 1, tangent ≤1 | Pass. §4.3 and closure now precede the ring theorem. |
| 4.7 quadratic factorization | Category ideal J⊆I; 0,O,O[[X]]/(3X,X²) | Quotient arrow R/J→R/I; nonzero examples have relative tangents 0,1, with X²=3X=0 in the last; zero type quotient has no characteristic-zero point | Pass. Factorization is established after §4.6, without imposing flatness or smoothness on the category ring. |
| 6.9 ordinary seed at 3 | Split Tate curve, chosen quotient | Inertia characters take values (2,1), with 2≠1 in F₃; quotient is unramified with value 1; p=3 invokes the retained quadratic-restriction hypothesis | Pass. §5.10 alone supplies the required seed. |
| 6.12 ordinary seed and switching at 5 | Split Tate curve; Borel/exceptional images | Inertia values (2,1) in F₅ are distinct; selected quotient 1; 5≠3. Image orders 80 and 16 are both prime to 3 | Pass. §5.10 applies with the selected quotient; tame branch unchanged. |
| Conventions: odd prime, arithmetic reciprocity, matrix orientation | p = 3; p = 2; triangular (ω,*;0,1) | ω at an element of quadratic inertia is −1 at 3, but 1 at 2; subcharacter/quotient are ω/1 | Odd-prime restrictions and orientation retained. Carried from [r1]. |
| Conventions: weak acceptability | 0, O[[X]]/(X), O[[X,Y]] | Relative tangent dimensions 0,0,2; a quotient of O[[X]] has dimension ≤1 | Zero quotient is allowed; two-variable ring is excluded. Carried from [r1]. |
| 0.1 principal-series inducing models and multiplicity | ℓ = 3, a = 0,1,2 | Steinberg dimension 3; induced dimensions (3+1)3⁰ = 4 and (3+1)3¹ = 12; unramified principal congruence invariants have dimension 1+3 = 4 | Dimensions and the Hom multiplicity 1 agree. Carried from [r1]. |
| 0.3 cubic types | 4 and 1+3j; induce scalar versus restricted-scalar character | Cubic value ζ has order 3; dimensions 1·2=2 versus erroneous 2·2=4 | Definition excludes the four-dimensional wrong model. Carried from [r1]. |
| 0.4 quadratic types | −1, 4, 1+s, and negative-field 1+3s | Values −1,1,ζ,1; generated unit image has order 6, not 3 | Both signs and extra relation agree. Carried from [r1]. |
| 0.5 extended types | i=0,1,2; s²=−3 | χ(1+s)=1,ζ,ζ²; χ(1+3s)=ζ; χ(s)²=−3 | Three types; finite inertia does not imply finite Weil image. Carried from [r1]. |
| 0.6 cubic simple admittance | Très and peu classes; both cubic types | Selected σ₂,₁ has dimension 3 and multiplicity 1; total compact dimensions 12 and 6; peu classes admit additional constituents | Très hypothesis separates simple admittance. Carried from [r1]. |
| 0.7 quadratic simple admittance | Very ramified orientation (ω,*;0,1), then peu | Selected σ′₀,₀ has multiplicity 1 in the very case; the peu case has more admitting constituents | Source's simple-admittance restriction retained. Carried from [r1]. |
| 0.8 extended simple admittance | Trivial versus unramified quadratic quotient | Selected w₃ eigenvalues −1 versus +1; former multiplicity 1, latter not 1 | Full G₃ quotient condition is necessary. Carried from [r1]. |
| 1.1 cube coordinates and uniqueness | y=1,3,4,12,27/64,1/3; y=0 | Coordinates (0,0),(1,0),(0,1),(1,1),(0,0),(2,0); zero admits all 9 pairs using x=0 | Nonzero hypothesis essential; Lean matches. Carried from [r1]. |
| 1.1 pairing and restriction | Unit [4], uniformizer [3], extension Q₃(∛3) | Unramified character values 0,1; cube-class dimension 2; [3] restricts to 0 in the nongalois cubic | Normality and the missing-root hypothesis prevent the false unrestricted injectivity claim. Carried from [r1]. |
| 1.2 Eisenstein/descent data | Cyclic cubic; identity; conductor-243 wild generator | G=u²−1, c=1−u⁶; H₁=1, t₁=f₁,₁=0; wild t≡−1∓u⁶≠0 | Degree bound and correction terms discriminate the choices. Carried from [r1]. |
| 1.3 cyclic cubic and cyclicCubic_galois | π³−3π²+3=0 | Discriminant 81; σπ=π²−2π, σ²π=3+π−π², σ³π=π; e·f=3·1=3 | Degree and order-three automorphism agree. Carried from [r1]. |
| 1.4 nonabelian cubic and nonabelianCubic_finrank | π³−3π²+6=0; j²=−1 | Discriminant −324=−1·18²; root degree 3, closure degree 6, e·f=3·2=6; Galois group S₃, not C₃ | Both field-degree clauses and non-Galois clause agree. Carried from [r1]. |
| 1.4 descent polynomial | H=((j−1)u²+(3−j)u−2)/4 | Reducing πH using π³=3π²−6 gives (jπ²−π+3−3j)/2 | Agrees with γ₃π; no sign reversal. Carried from [r1]. |
| 1.5 positive quadratic and positiveQuadratic_finrank | s²=3, β²=s, α³−3α+3=0 | v₃α=1/3, v₃β=1/4, v₃(α/β)=1/12; e·f=12·2=24; γ₄²β=−β | Degree 24 and involution order 2 agree. Carried from [r1]. |
| 1.6 negative quadratic and negativeQuadratic_finrank | α³=4, β²=−s | v₃α=0; v₃(α/β)=−1/4; v₃((α−1)/β)=1/3−1/4=1/12; degree 24 | Corrected uniformizer, not the source's nonintegral one. Carried from [r1]. |
| 1.7 extended fields and extendedTypeField_finrank | i=0,1,2 | α³=3,12,21; π¹²=−3,−768,−7203; each constant has valuation 1; e·f=24 | All three cases, including i=2, pass; no out-of-range Fin index. Carried from [r1]. |
| 1.7 wild corrections | γ₃ and γ₃⁻¹ | H≡1∓u⁶, t≡−1∓u⁶ modulo the stated ideals; identity corrections 0 | Wild terms distinguished from tame zero corrections. Carried from [r1]. |
| 1.8 finite groups | GL₂(F₃), SL₂(F₃), GL₂(F₅), SL₂(F₅) | Enumerated orders 48,24,480,120; nonsplit normalizer intersection has order 12; β=ζ−ζ⁻¹ has β²=2 in F₅ | Normalizer and index-two arguments agree; nonabelian groups included. Carried from [r1]. |
| 1.9 six local forms | Tags 1 through 6 | Conductor exponents {0,1,2},4,4,3,3,5; tag-2 scalar restriction has dimension 2, not 4 | Tags are not conductor exponents. Carried from [r1]. |
| 1.10 exhaustion | Normal wild subgroup of order 3; tame subgroup | 3 divides 480 but 9 does not; a nontrivial 3-subgroup has order 3; tame branch contributes three conductor possibilities | Supports stated normalizer reduction without dropping tame cases. Carried from [r1]. |
| 1.11 e=3 curves and norms | Classes 6,3,12 in the basis [3],[4] | Coordinates (1,2),(1,0),(1,1); each generated line has size 3 in a group of size 9; norm index 3 | Cubic field norm index is not the full torsion-field degree 24. Carried from [r1]. |
| 1.12 e=12 curve table | b=4,1,2 in the first conductor-243 row; remaining rows | κ=1,2,4 respectively; row permutations (1,2,4),(2,4,1),(4,2,1); e·f=12·2=24 for the type field | Table permutations and distinct classes agree. Carried from [r1]. |
| 1.12 Frobenius lift | Matrix (2,−1;1,1) over F₅ | Trace 3, determinant 3, discriminant 2 (nonsquare); σ⁶=3I, σ¹²=−I, σ²⁴=I, σ⁸≠I | Order 24; it must not be replaced by the e=3 order-eight lift. Carried from [r1]. |
| 1.13 crystalline convention | E:y²=x³−x over F₃ and F₉ | #E(F₃)=4, a₃=0, a₉=−6; arithmetic polynomial (X+3)², covariant crystalline polynomial (X+1/3)² | Inversion is essential; conventions agree with supplier. Carried from [r1]. |
| 1.13 reduction boundary | Tate curve versus potentially good curve | Tate monodromy has rank 1 and N≠0; potentially good N=0; finite inertia of order 3 or 12 is prime to 5 | Potential-good hypothesis and faithful reduction test retained. Carried from [r1]. |
| 1.14 extended Frobenius sign | A=9, B=−3 and −12 | Δ at −3 is −16·3⁵·13; special fibre has 1 point, trace 3; B=−12 norm factor is 7, not 1 | δ=+1; the extra unit corrects the source congruence. Carried from [r1]. |
| 1.15 matrixHilbert90 | Complex conjugation; B=(i,1;0,−i); trivial group; n=1 | B⁻¹B̄=(−1,−2i;0,−1), reverse order gives +2i; c·c̄=I; trivial-group c=I | Coboundary direction and scalar boundary agree. Carried from [r1]. |
| 1.15 specialLinearHilbert90 | B=diag(i,−i); determinant adjustment | det B=1, B⁻¹B̄=−I; multiplying on left by diag(d⁻¹,1) changes determinant d to 1 and leaves c unchanged | SL conclusion is stronger than scalar Hilbert 90, not padding. Carried from [r1]. |
| 1.15 levelFiveConjugate | t=2, x=(1,1;0,1); t=1; x=−I | Upper entry 2 versus inverse-conjugation value 3; identity case unchanged; −I unchanged | Real-bodied definition fixes action and centre. Carried from [r1]. |
| 1.15 equivariantIcosahedralLift | Identity and central involution | b(1)=I; b(−I)=−I; both project to identity; replacing b by −b gives −I at 1 and is not a homomorphism | Faithfulness and uniqueness discriminate the wrong lift. Carried from [r1]. |
| 1.15 paired twist and rationality | Algebraic closure; paired E₀[5]; cusps | 480 frames, 4 primitive pairing values, 1 component after paired descent; (E₀,id) supplies a point; cusp has no elliptic fibre | Pairing condition and open elliptic locus retained. Carried from [r1]. |
| 1.16 local companions | Cubic and extended cases; extension-class lines | H¹ dimension 2 gives 4 projective lines; unit line is 1, very lines are 3; avoiding one splitting line leaves 2 | Nonsplitting over the type field is a genuine selection. Carried from [r1]. |
| 2.1 Breuil classification and monodromy | Rank 0, rank 1; noncommutative exponent-3 group | Orders 3⁰=1, 3¹=3; N(u)=u; UT₃(F₃) has order 27 and is noncommutative | Zero object included; commutativity excludes the wrong group category. Carried from [r1]. |
| 2.2 rank-one objects/morphisms | e=3, r=0 and 3; r=1→3 | μ₃ and constant Z/3 at endpoints; morphism exponent 3(3−1)/2=3; reversed exponent violates r′≥r | Contravariance and direction agree. Carried from [r1]. |
| 2.2 extension gauge | e=3,r=s=2; h=1,a=b=1 | f divisible by u; gauge increment u²−u²=0; for r=1,s=2 it is u²−u | Gauge and filtration constraint are distinct. Carried from [r1]. |
| 2.3 wild descent | Identity, coefficient conjugation, γ₃ | Identity H=1,t=f=0; over F₉, j↦j³=−j despite H=1; wild t has constant −1 | A strict semilinear group action commuting with φ₁ is not the wild construction. Carried from [r1]. |
| 2.4 model lattice and ideals | Zero model; μ₃ special fibre; F₉ descent | Zero Hom=0; μ₃ has F=0 and invertible V; γ₂(j)=−j | Semilinearity and torsion direction agree; generic identification retained. Carried from [r1]. |
| 2.7 extended ideal | γ₃(x,y)=(x+y,y), γ₂ cube, test (0,1) | (γ₃−γ₃⁻¹)γ₂=(−1,0); F=0 fails, F(x,y)=(−y³,0) gives (2,0), opposite sign (1,0) | Third generator is independent and sign-sensitive. Carried from [r1]. |
| 2.8 comparison maps | E₂₁; diag(1,−1) | (Θ₀,Θ₁,Θω)=(1,0,0), respectively (0,−1,1); trace zero gives Θω=−Θ₁ | Domains and diagonal sign agree. Carried from [r1]. |
| 2.9 exact sequence | (x,y)=(1,0),(0,1) in F₃²; peu versus very class | Images E₁₂ and diag(1,2); dimensions 2→3→1; H¹(ω) dimension 2 minus connecting line 1 gives kernel 1; unit pairing 0 versus nonunit 1 | Kernel bound holds with very ramification. Carried from [r1]. |
| 3.1 cubic rank-one models | Constant versus μ₃ weights | Constant weights 1,3; μ₃ weights 0,2; duality r↦3−r exchanges the sets | Complete rank-one range retained. Carried from [r1]. |
| 3.2 peu extensions | c=0,1,2 | Three classes; N(eω)=0,u⁶,2u⁶; c=0 split | Nonzero monodromy term tests the convention. Carried from [r1]. |
| 3.3 generic descent | Rank-two local-local cubic model | Group order 9; connected group and connected dual exclude constant rank-one and μ₃ rank-one factors as whole model | Generic descent does not assert an integral Q₃ model. Carried from [r1]. |
| 3.5 diagonal cubic extensions | (a,a′)=(1,0),(0,1) | First parameter nonzero is ramified; second-only is unramified; hγ(0)=−aH′γ(0) | Negative constants in both diagonal cases retained. Carried from [r1]. |
| 3.6 rank-three vanishing | c=1 and c=2 | bc=0 forces b=0 in each case; c=0 would leave b arbitrary | Nonsplit residual parameter is used. Carried from [r1]. |
| 3.7 diagonal vanishing | Nonabelian cubic H′(0)=(3−j)/4 | Modulo 3, H′=−j≠0; (−a+b)H′=bH′ gives a=0; H′=0 would give 0=0 | Descent matrix signs give the asserted zero comparison map. Carried from [r1]. |
| 4.1 degree-twelve rank-one descent | r=0,2,4,6,10,12 | γ₄² eigenvalue (−1)^(r/2): +1,−1,+1,−1,−1,+1 | Exactly r=2,6,10 satisfy the ideal condition. Carried from [r1]. |
| 4.2 adapted basis | M′₂,₁⊕M′₂,ω over F₉ | γ₄ eigenvalues j,−j; γ₂(je)=−je while γ₂(e)=e | Eigenvectors can descend, eigenvalues need not lie in F₃. Carried from [r1]. |
| 4.4 reverse extension vanishing | Nonzero Frobenius parameter a | Forced equation a=0 contradicts a≠0; zero reversed Ext has dimension 0 | Nonzero Frobenius is an actual input. Carried from [r1]. |
| 4.5 unramified diagonal extensions | r=2,10; Artin–Schreier c=1 | In F₉, x³−x takes only 0,j,−j, never 1; after a finite residue extension the equation has a root | Unramified splitting need not occur already over F₉. Carried from [r1]. |
| 5.1 four models: filtration/gauge | (2,6),(6,10),(2,10),(6,6) | max(0,r+s−12) gives 0,4,0,0; h degrees 2,6,8,0/4 meet divisibility; γ₄ eigenpairs (−j,−j),(j,j),(j,−j),(−j,j) | All four normal forms pass the filtration and tame-action tests. Carried from [r1]. |
| 5.1 four models: monodromy | First three; (6,6) with c′=1 | First three N=0 on displayed generator; last N(e′)=u³⁰e and u³⁶=0 | Exceptional term survives; it cannot be dropped. Carried from [r1]. |
| 5.2 classification/generic Ext | (c,c₁)=(0,0),(0,1),(1,0); (6,6) | First family split over Q₃ iff both 0, split over F′ iff c=0, peu iff c₁=0; exceptional map (c,c′)↦(c+c′,c) has determinant −1 | Full 2-dimensional Ext and the different splitting loci agree. Carried from [r1]. |
| 5.3 reverse extensions | Three nonexceptional pairs and (6,6) | Ext dimensions 0,0,0,2; exceptional parameter space has 9 elements | Exceptional reversal is not suppressed. Carried from [r1]. |
| 5.4 diagonal extensions | Weights 2,6,10; middle (c,c′)=(1,0),(0,1) | Dimensions 1,2,1; middle N=−u²⁴ versus 0, and h=u² versus u⁶; unramified line c=0 | Full middle-weight H¹ versus extreme-weight unramified lines. Carried from [r1]. |
| 5.5 coefficient actions | k=F₃ and F₉ | F₉⊗F₃ F₉≅F₉×F₉, not a field; four weight pairs unchanged | General finite coefficient field is not restricted by linear disjointness. Carried from [r1]. |
| 5.6 filtered categories | 0, ρ̄, split 1⊕ω, E[9] | Filtration lengths 0,1; split rank-two object fails; E[9] order 81, 3E[9] order 9 | Torsion exponent unrestricted; tangent still uses killed-by-3 objects. Carried from [r1]. |
| 5.7 comparison vanishing | c=1,2 in exceptional family | a₂c u² divisible by u⁶ forces a₂=0; h then has only u⁶ parameter | The very hypothesis prevents the equation becoming vacuous. Carried from [r1]. |
| 5.8 extended tangent bounds | Four weight pairs | Each maps into common kernel dimension 1 | Four upper bounds, no asserted equality from this step alone. Carried from [r1]. |
| 5.9 Artin families | N=1,2,3; c=1 | Ring sizes 3,9,27; reduction-kernel dimensions 0,1,2; 1+T is a unit; nontrivial first-order class occurs only from N=2 | Corrects source's N=1 nontriviality clause. Carried from [r1]. |
| 5.10 characteristic-three rings | D[9] element x; negative control D=(Z/9)², F(x,y)=(−3y,x) | In proof: 3Fx=0 ⇒ F²x=0 ⇒3x=0. Negative control: F²=−3 but F(3,0)=(0,3)≠0 | F kills D[3] is essential; repaired argument proves 3R=0, then R=F₃[[T]]. Carried from [r1]. |
| 5.11 exceptional selection | Type point in characteristic zero; nonexceptional R | Nonexceptional rings have 3=0, but a characteristic-zero coefficient field has 3≠0; no such ring map exists | Only (6,6) can support the type point. Carried from [r1]. |
| 5.12 extended weak acceptability | Each i=0,1,2 | All three use a tangent bound ≤1 and a quotient of Z₃[[X]] or 0 | Full G₃ very-ramified hypothesis retained. Carried from [r1]. |
| 6.1 local constancy | Smooth noncuspidal point; cusp | Prime-to-3 level-five marking exists on the elliptic locus; cusp has no E[3] fibre | Neighborhood is taken inside the smooth elliptic locus. Carried from [r1]. |
| 6.2 degree-24 cover | Ordered F₃² bases and first-vector sign quotient | 48/2=24; determinant of diag(−1,1)=−1; simultaneous −I has determinant +1 and leaves 2 pairing components | Correct sign quotient is geometrically connected. Carried from [r1]. |
| 6.2 surjectivity from irreducible fibre | Subgroup order ≥24 and cyclotomic determinant | Only possible proper index-two subgroup is SL₂ of order 24, whose determinant image has size 1; required image size 2 | Full image has order 48. Carried from [r1]. |
| 6.3 global companion | Nonempty Q₃-open set in P¹; irreducible cover fibre | Finite cusp set removed; degree-24 irreducible fibre plus determinant gives order 48; selected local torsion retains dimension 2 | Hilbert/local conditions supply the actual global companion. Carried from [r1]. |
| 6.4 six types | Tame and five wild tags | Conductor valuations 0/1/2,4,4,3,3,5; type-field inertia orders 3 or 12 in wild cases | No omission of the tame or conductor-243 branch. Carried from [r1]. |
| 6.5 lifting hypotheses | p=3,5; split local residual representation | Quadratic fields Q(√−3),Q(√5); split distinct-character centralizer dimension 2 versus required scalar dimension 1 | Local Schur and restriction hypotheses are not dropped. Carried from [r1]. |
| 6.6 weight-two residual modularity | Odd irreducible F₃ representation; Hasse alternative | Weight-one lift times weight-one Eisenstein series has weight 2; Hasse multiplication would give 1+2=3 | The stated route has the correct weight. Carried from [r1]. |
| 6.7 modularity comparisons/twists | E:y²=x³−x, quadratic twist by Q(i), p=5,7 | a₅=−2, χ(5)=1 gives −2; a₇=0, χ(7)=−1 gives 0; reducible 11a1[5] gives 1⊕ω₅ after semisimplification | Good-prime comparison is conditional, not an assumed global existence proof. Carried from [r1]. |
| 6.8 wild companion lift | Image GL₂(F₃), cyclotomic quadratic restriction | Orders 48 and 24; standard SL₂(F₃) module remains absolutely irreducible; local nonsplit distinct-character endomorphisms are scalars | Residual and local hypotheses of the imported theorem are supplied. Carried from [r1]. |
| 6.10 mod-five modularity | Complex conjugation; six local tags | det ρ̄(c)=−1=4 in F₅; global companion image at 3 has order 48; local tags exhaust six cases | Oddness follows from determinant; source theorem matches all stated inputs. Carried from [r1]. |
| 6.11 exceptional invariants | E₅₀=[1,1,1,−3,1], E₃₃₈=[1,1,1,3,−5] | (c₄,Δ,j)=(145,−800,−121945/32), (−143,−17576,1331/8) | Negative sign and isogeny formulation agree with corrected CDT. Carried from [r1]. |
| 6.11 level-75 rational points | (2,−4),(0,1),(0,−2),(2,1),(−3,1),(3/4,−7/8) | Double-cover values 0,17,8,−15,5/4,185/4; at (1,−1) scaled pole value −44 | Only the listed CM point gives the finite rational lift; modular maps remain proof targets. Carried from [r1]. |
| 6.13 ellipticCurve_modular | E:y²=x³−x over Z; singular model; p=2 | Δ=64; #E(F₃)=4 gives 0, #E(F₅)=8 gives −2; 2 divides Δ; Δ=0 fails IsElliptic | Point count includes infinity; good-index and ellipticity binders are correct. Carried from [r1]. |

## Not verifiable

- BBM, Théorie de Dieudonné cristalline II, §4.2.14 (the unchanged §2.1 input), remains settled as uncertified: no readable text is supplied and publisher access was previously restricted. Its text was not independently certified in this round.
- Serre, Corps locaux, Ch. XIV §1, Proposition 3 (the unchanged §1.1 input), remains settled as waived: no readable text is supplied.

No new source was required or requested. All source passages needed to verify the changes were readable in the supplied legal cache. The broader untouched mathematics and earlier source errata retain the limits and evidence of [r1].

## Source issues

- none

No new source mistake was identified in this incremental check. The corrected negative sign agrees with BCDT; the previous report's source errata are not reclassified as new discoveries.
