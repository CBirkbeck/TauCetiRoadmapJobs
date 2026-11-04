# Repair report: EllipticLegendreCharacterInterfaces

## F01 (P2) — applied

Missing squareclass-character contract → ClassicalArithmeticCompletion §§1.7, 1.8, 1.51 and its named API. Updated both character targets, dependencies and references; retired the exhausted top-level gap. Main §1.51 explicitly supplies prime values, primitivity, conductor parity, squarefree odd part and the trivial class. Conductors of 3, −3, 6, −6 recompute to 12, 3, 24, 24.

## F02 (P2) — applied

Bundled local-reduction gap → pinned coefficient, invariant and valuation inputs, with the local glue stated here. Updated §§1.2–1.3 and every remaining reference to that gap, and retired its plan entry. Mathlib Reduction.lean:139,148,274,323,328, Weierstrass.lean:477 and PadicNumbers.lean:1063 supply the inputs. Section 1.3 now explains minimality by maximal multiplicative discriminant valuation 1.

## F03 (P2) — applied differently

Rational normalization → every field with 2≠0; prime-field subgroup → every odd finite field; Legendre-only trace → normal-form quadratic-twist trace. Added the character-sum route input in §5.1. The trace identity also includes d=0 and singular equations; good Euler factors retain ellipticity hypotheses. Updated signatures, Summary, scope, dependencies and finite-extension Checks; renamed the trace headline accordingly.

## F04 (P2) — applied

Deleted the four named supporting declarations from Suggested.lean: unit-model good reduction, explicit minus-one half, absence of order eight, and the conic witness. Their mathematics remains in README §§1.3, 3.2, 3.6, 4.1. Removed their backticked names and headline wording throughout. The acceptance test now has seven headline theorems and two necessary coefficient definitions.

## F05 (P2) — applied

Deleted the character-support stand-in from Suggested.lean and its README declaration-name claim. Section 1.4 remains a supporting target; §1.5 remains the conductor headline. The module docstring identifies the missing actual elliptic-conductor carrier and reduction comparison. No discriminant or bad-prime predicate replaces that headline in Lean.

## F06 (P3) — applied

Removed redundant parameter exclusions from the good-prime headline: ellipticity and the model equality imply them. Removed u≠0 from symmetric-cubic counting. The generalized twist theorem needs neither d≠0 nor ellipticity. README statements and Checks now include the cusp and singular λ=0 examples. The deleted character-support declaration needs no replacement binders.

## F07 (P3) — applied differently

Invariant Checks claiming to detect a₂'s sign → coefficient and root-membership Check at λ=2. Removed repeated Checks in §§0.1 and 3.2, and consolidated the repeated conic Checks in §4.1. Recalculation also distinguishes the printed conic point that fails membership from the other printed point that is the negative of the chosen witness and satisfies membership.

## F08 (P3) — applied differently

Unsupported BS20 attributions → Silverman locators for invariants, two-torsion and split descent; Koblitz p.41 for symmetric-cubic trace zero; native CRT/quotient constructions for §§2.1, 2.3. Added S09 and K84 through the sources service, both uncertified. Corrected descent and order-four locators to BS20 lines 554, 659, 666–671, 710, 715; removed the repeated citation sentence throughout.

## F09 (P3) — applied differently

Misassigned ownership → ModularCurves §4C for the universal family, this roadmap §§0.1, 0.4 for its coefficient specialization and invariants, and §0.9 for full-K-rational-two-torsion normalization. Updated scope and downstream contracts. Repointing the other roadmaps is not actionable in this package: their files are outside the edit allowance. Their precise affected sections are recorded below.

## F10 (P3) — applied

Repeated targets → parent APIs: §0.7 into §0.2; §0.11 into §0.10; §§2.2, 2.4 into §§2.1, 2.3; §§3.3–3.5 into §3.2; §§4.2–4.4 into §4.1. Preserved the proof inputs, formulas and distinguishing Checks, updated all internal consumers, and removed the repeated proof-introduction sentence. Remaining section numbers and layer order are unchanged.

## F11 (P3) — applied

Title “elliptic curves, part ii” → “legendre models, descent and character interfaces”. The introduction still explains its extension of EllipticCurves. No alias, merge-order entry or neighbouring package was edited.

## Verification outcomes

- Suggested.lean elaboration: exit 0, exactly seven warnings, each “declaration uses `sorry`”; no errors or other warnings. Run from the pinned content checkout with the required `lake env lean` command. Both used Tau Ceti module objects existed, so no targeted build was needed. An initial run exposed a missing explicit DecidableEq binder on the generalized trace theorem; adding it repaired the failure.
- Elaborated binders: appended `#check @name` for every one of the nine retained declarations to one scratch copy and elaborated it once successfully. Compared every resulting type with the README. No section hypothesis disappeared. Normalization retains arbitrary K, decidable equality, 2≠0, ellipticity and kernel cardinality four. The subgroup retains finite F, decidable equality and its two parameter exclusions. The twist retains finite F, decidable equality, 2≠0 and the actual IsCharNeTwoNF instance. The good-reduction hypothesis is on the minimal local equation. The deliberate hypothesis deletions are those in F06.
- Native API check: 73 named library declarations elaborate at the pins in a separate scratch file, with exit 0 and no warnings. The scratch file explicitly imports each used native module, including Affine.FinitePoint. The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, as recorded by the content manifest.
- Dependency check: exit 0. Exact output: `depcheck: 51 roadmaps, 583 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Citation resolver: exit 0; no unresolved cross-roadmap citations and no unresolved roadmap Lean names. It searched main 5f173a7 and the indexed 362 open heads. Its external-library scan was unavailable; the separate pinned-library elaboration above supplies that verification.
- Source service: BS20 remains certified publisher-open content. S09 and K84 resolved only to paywalled publisher editions and are recorded as uncertified, cited by locator without their texts. No source was copied into the repository; there are no outstanding missing-reference requests. K84's p.41 locator is independently identified by BS20 line 464.
- Structure and scope checks: every retained Lean name occurs in the README; the five deleted names and replaced trace name leave it. There is one import Mathlib, two used individual Tau Ceti imports, no sorry'd data, no examples or API padding, and no set_option. Every retained definition has its API and at least three discriminating Checks. TOML and JSON parse. Comparing the plan with the original confirms that only its top-level gaps list changed. `git diff --check` passes.
- No gate failures were supplied separately in the brief. The two exhausted supplier gaps were removed; no unresolved prerequisite was hidden or converted into an invented supplier declaration.

## Source and ownership audit

Read the shape of the main roadmaps TauCetiRoadmap/ComplexTori/README.md, TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md and TauCetiRoadmap/LocalGaloisGroups/README.md before editing. Source statements were checked against the legal BS20 extraction: equation (17) at BS20 line 513, normalization at BS20 line 515, the six ratios at BS20 line 544, Lemma 6.2 at BS20 line 526, Lemma 6.3 at BS20 line 547, descent at BS20 line 657, its kernel at BS20 line 659, its product at BS20 line 661, Lemma 6.5 at BS20 line 663, its half and first-coordinate calculation at BS20 lines 668–671, twist trace at BS20 line 705 and the conic point at BS20 lines 718–720. Generalizations beyond those prime-field or semistable statements are explicitly derived from the native inputs and the proofs in the README.

Checked ClassicalArithmeticCompletion §§1.7, 1.8, 1.51 on main, rather than importing its progress revision. Checked EllipticCurves Layers 4–5 and ModularCurves §§4C, 9E on main. Checked NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g and ArithmeticGaloisRepresentations Layer 3 at their available roadmap heads, including the actual conductor and its bad-reduction equivalence. Checked the cited sections of ErdosProgressionPowers, EllipticCurveModularityPartII, ArithmeticDynamics, MordellLawrenceVenkatesh and ComputationalNumberTheory at their indexed heads. The ownership searches used the roadmap service across main and open heads, the board packages and both pinned libraries, by split cubic, Legendre equation, halving, two-torsion and point-count objects.

The native definitions have precise limits. Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366 makes IsElliptic the assertion that Δ is a unit. NormalForms.lean:107 makes IsCharNeTwoNF exactly the two coefficient equalities; it does not assert ellipticity or characteristic different from two. TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73 counts all affine solutions plus O, including singular solutions; its line 86 comparison with the point group assumes ellipticity. The native twist coefficients are in QuadraticTwist/Basic.lean:169. The native root and nonroot descent representatives are in MordellWeil/XSubT.lean:558,566, its kernel theorem at line 961, and the two-torsion cardinality theorem in MordellWeil/TwoTorsion.lean:57. These generic carriers and theorems stay imported. Their ordered coefficient specializations and the general trace comparison are this package's targets; no second generic descent or conductor is constructed.

## Adversarial mathematics pass

The table records statements individually, including API facts, conventions and the identities used by changed proof routes. Values are exact rational or finite-field arithmetic. In a squareclass triple, 1 denotes the square class, and “nonsquare” the other nonzero class. In 𝔽₉, i²=−1. Tests of an implication record the premise and the resulting conclusion; excluded instances record the failed hypothesis. These computations supplement the mathematical arguments and source audit; they do not certify the admitted theorems.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Ring convention and native ellipticity | zero ring; ℚ, λ=0 | zero ring Δ=0=1 and IsUnit 0 holds; over ℚ Δ=0 is not a unit | Distinguishes the carriers | Retained ring generality |
| Normal-form convention | L(2); y²+y=x³ | first has (a₁,a₃)=(0,0); second has (0,1) | Second fails the native predicate | Made predicate explicit for trace |
| Field ellipticity criterion and characteristic exclusions | 𝔽₂; 𝔽₃, λ=2 | in characteristic 2, Δ=0; in 𝔽₃, Δ=1 and c₄=j=0 | Characteristic three included | Clarified 2≠0 restriction |
| Squareclass convention | ℚ: 0,1,2,4 | 0 is a field square but not a unit; [1]=[4]=1, [2]≠1 | Correct domain and nontriviality | Retained |
| Coordinate-change direction | roots (3,5,9), r=3 | old coefficients (−17,87,−135) become (−8,12,0), with roots (0,2,6) | New-to-old direction correct | Retained |
| Rational valuation normalization and total zero | p=3; 0,3,1/3 | v₃(0)=0, v₃(3)=1, v₃(1/3)=−1 | Zero cannot imply a unit | Nonzero operands retained |
| Curve-level versus equation-level reduction | good L(−1) at 3, then root scale 9 | Δ=64 has v₃=0; Δ=3¹²·64 has v₃=12 | Isomorphic curve, second equation nonminimal | Native minimal local hypothesis retained |
| Trace and Euler signs | 𝔽₅, λ=3, d=1,2 | counts 4,8 give 6−4=2, 6−8=−2; coefficients of T are −2,+2 | Correct signs | Reused in §5.2 |
| §0.1 coefficient definition | λ=2,−1 | (a₂,a₄)=(−3,2),(0,−1) | Chosen coefficients determined | New sign Check |
| §0.1 affine equation | λ=2, x=2,−2 | factored and expanded cubics both give 0,−24 | Membership distinguishes sign | Wrong model rejected |
| §0.1 coefficient functoriality | ℤ→𝔽₅, λ=3 | coefficients (−4,3) reduce to (1,3), equal to L(3)'s | Equality holds | Retained |
| §0.1 injective parameterization | λ=2,3; λ=2 twice | a₄ values 2≠3 and 2=2 | Both directions of equality detected | Retained |
| §0.1 normal form | λ=0,1,2 | a₁=a₃=0 for all three, including singular models | Normal form does not imply smoothness | Retained |
| §0.1 nonreduced base | 𝔽₅[ε]/ε², λ=2+ε | Δ=4+2ε and (4+2ε)(4+3ε)=1 | Unit identity holds | Recomputed |
| §0.2 scaled coefficient definition | d=2, λ=1/2; d=0 | (a₂,a₄)=(−3,2); (0,0) | Correct scalar powers | Retained |
| §0.2 scaled affine equation | d=2, λ=1/2, x=3 | x(x−2)(x−1)=6=27−27+6 | Coefficients and roots agree | Retained |
| §0.2 unscaled specialization | d=1, λ=1/2 | both equations have (a₂,a₄)=(−3/2,1/2) | Equality holds | Retained |
| §0.2 base-change API | ℤ→𝔽₅, d=2, λ=3 | (−8,12) maps to (2,2), also L(2,3)'s coefficients | Equality holds | Retained |
| §0.2 twist identity and twisting discriminant | d=2; n=−d/4 versus n=−2 | n=−1/2 gives D=2; n=−2 gives D=8; coefficients scale by D,D² | Factor four fixed | Absorbed §0.7 |
| §0.2 twist ellipticity API | d=0,1, λ=−1 | Δ=0,64 respectively | Unit criterion gives false,true | Absorbed §0.7 |
| §0.3 tuple definition and label order | λ=3 | (3,1/3,−2,−1/2,3/2,2/3) on both descriptions | All six labels retained | Recomputed |
| §0.3 exceptional repetitions | λ=−1,2,1/2 | tuples (−1,−1,2,1/2,1/2,2), (2,1/2,−1,−1,2,1/2), (1/2,2,1/2,2,−1,−1) | Repetitions required | Retained |
| §0.3 admissibility API | λ=3; boundaries 0,1 | six valid entries at 3; total boundary tuples (0,0,1,1,0,0), (1,1,0,0,0,0) | Boundary entries are not parameters | Retained |
| §0.3 inverse-pair API | λ=3 | 3·(1/3)=(−2)·(−1/2)=(3/2)·(2/3)=1 | All three products correct | Retained |
| §0.3 field-map API | 𝔽₃(s)→𝔽₃(t), s↦t³ | first pair (s,1/s) maps to (t³,1/t³); complement maps to 1−t³=(1−t)³ | Also permits an inseparable extension | Retained general fields |
| §0.4 discriminant formula | λ=−1,2,1/2,3,0,1 over ℚ | Δ=64,64,1,576,0,0 from both formulas | Singular endpoints detected | Recomputed; citation corrected |
| §0.4 c₄ formula | same inputs | c₄=48,48,12,112,16,16 | Native invariant and formula agree | Citation corrected |
| §0.4 j formula | λ=−1,2,1/2,3 | j=1728,1728,1728,21952/9; c₄³/Δ gives these values | Denominators nonzero | Citation corrected |
| §0.4 ellipticity equivalence | λ=0,1,2 over ℚ | Δ=0,0,64 gives false,false,true; parameter conditions give the same | Both directions hold | Retained |
| §0.5 scaled Δ formula | (d,λ)=(2,1/2),(2,3),(0,3) | Δ=64,36864,0; exactly d⁶ times unscaled Δ | Power six correct | Citation corrected |
| §0.5 scaled c₄ formula | same inputs | c₄=48,448,0; exactly d² times unscaled c₄ | Power two correct | Citation corrected |
| §0.5 scaled j and ellipticity | d=2, λ=1/2,3; d=0 | j=1728,21952/9 agrees with unscaled; d=0 has Δ=0 | No j at the singular boundary | Retained |
| §0.6 ordered cross-ratios | roots (3,5,9), (0,1,−1) | tuples (3,1/3,−2,−1/2,3/2,2/3), (−1,−1,2,1/2,1/2,2) | Root order agrees with labels | Retained |
| §0.6 denominator condition | roots (0,0,1) | first denominator 0 and total quotient 1/0=0, outside admissible parameters | Distinctness essential | Retained |
| §0.8 split normalization | roots (3,5,9) | d=2, λ=3, C•W coefficients (0,−8,0,12,0)=L(2,3) | Exact model, including direction | Recomputed |
| §0.8 twist versus unscaled isomorphism route | d=2 over ℚ | required coordinate scale would satisfy u²=2, with no rational u | Unscaled route fails | Retained twist scalar |
| §0.9 full-two-torsion normalization | ℚ and 𝔽₃: y²=x³−x | kernel has 4 points; d=1, λ=−1 or 2 respectively; coefficients identical to normalized model | General-field instance exists | Generalized |
| §0.9 insufficient rational two-torsion | ℚ: y²=x³−2x | only root 0; kernel cardinality 2≠4 | Hypothesis fails | Added negative control |
| §0.10 labelled-root definition and coordinates | (d,λ)=(1,−1),(2,1/2) | labelled x-coordinates (0,1,−1),(0,2,1); all y=0 | Origin is a separate point | Retained |
| §0.10 doubling API | same rational models | 2(0,0)=2(d,0)=2(dλ,0)=O | Each nonzero root point has order 2 | Retained |
| §0.10 tuple injectivity and nonzero API | d=2, λ=1/2 | x-values 0,2,1 pairwise distinct; three affine constructors all differ from O | Injective tuple of nonzero points | Retained |
| §0.10 exhaustion and kernel cardinality | L(−1)/𝔽₃ | kernel={O,(0,0),(1,0),(2,0)}, cardinality 4; there are no other points | Both inclusions | Absorbed §0.11 |
| §0.10 root sum | d=1, λ=3 over ℚ | (0,0)+(1,0)=(3,0); adding (3,0) gives O | Horizontal-line sign correct | Retained |
| §1.1 negative parameter valuation | λ=1/3, p=3 | (a,b,v₃(j))=(−1,−1,−2); 2a=−2 | Formula holds | Recomputed |
| §1.1 positive parameter valuation | λ=3, p=3 | (1,0,−2); −2a=−2 | Formula holds | Recomputed |
| §1.1 positive complement valuation | λ=−2, p=3 | (0,1,−2); −2b=−2 | Formula holds | Recomputed |
| §1.1 integral j consequence | λ=−1, p=3 | (a,b,v₃(j))=(0,0,3) | Integral j, without unit j | Retained |
| §1.1 dyadic negative control | λ=2, p=2 | (a,b,v₂(j))=(1,0,6) | Implication fails without oddness | Retained |
| §1.1 nonvanishing numerator | λ=1/2,3 | λ²−λ+1=3/4,7; j=1728,21952/9 | Valuation operands nonzero | Retained |
| §1.2 good-prime units and local glue | F=L(−1), p=3; six labels | j=1728 with v₃=3≥0; parameter valuations for −1,2,1/2 and complements are all 0 | Curve-level theorem gives units | Removed redundant binders |
| §1.3 unit-discriminant minimality | λ=3, p=5 | Δ=576≡1, v₅(Δ)=0, multiplicative valuation=1 | Integral equation attains maximal value 1 | Explicit native proof step |
| §1.3 nonsingular residues | λ=3 at p=5 and p=3 | residues (λ,1−λ)=(3,3),(0,1); Δ mod p=1,0 | First satisfies, second fails hypotheses | Retained |
| §1.3 residue-field-two boundary | λ̄ a nonzero element of 𝔽₂ | λ̄=1, 1−λ̄=0 | Cannot have two nonzero parameter residues | Retained |
| §1.4 primitive prime values | radicand 3, primes 5,7,11 | character values and Legendre values both (−1,−1,1) | Correct actual character | Imported §1.51 |
| §1.4 character conductor parity | radicands 3,−3,6,−6 | conductors 12,3,24,24; v₃(radicand)=1 in every case, odd support {3} | Parity and squarefree odd part agree | Gap retired |
| §1.4 trivial and dyadic classes | radicands −1,1,−2,2 | conductors 4,1,8,8, all odd parts 1 | Includes conductor 1 | Retained |
| §1.4 squareclass identification | radicands 2 and 8/9 | squarefree part 2 for each; conductor 8 for each | Rational denominator is accounted for | Imported owner |
| §1.4 uniqueness diagnostic | characters of 3 and −3 at prime 7 | values −1 and +1; respective primitive levels 12 and 3 | Distinct primitive characters cannot satisfy the same prime values | Imported §1.8 |
| §1.4 support consequence | F=L(3), p=3 | v₃(j)=−2, so good reduction impossible; attached odd support {3} | Conductor prime lies among bad primes | README supporting target |
| §1.5 conductor divisibility | F=L(−1), M=32; all four ω | four odd character conductors=1, and 32/1=32 | Divisibility includes trivial class | Actual conductor retained |
| §1.5 nontrivial odd factor | λ=3, ω=1 | N=12, odd part 3; v₃(j)=−2, so actual conductor is divisible by 3 | Uses bad-prime comparison, not Δ as conductor | Retained |
| §2.1 ordered CRT definition | (d,λ)=(2,3) | θ↦(0,2,6); X+1↦(1,3,7); X²↦(0,4,36) | Ordered evaluations determine the adapter | Absorbed §2.2 |
| §2.1 polynomial-evaluation API | h=1,X+1,X² | outputs (1,1,1),(1,3,7),(0,4,36), exactly the direct evaluations | Constants and nonconstants agree | Retained |
| §2.1 equality-detection API | h=X²−8X+12 and k=12−8X+X² | both evaluate to (12,0,0); h−k=0 | Agreement holds in both descriptions | Retained |
| §2.1 native root API | roots (0,1,−1),(0,2,1) | θ outputs (0,1,−1),(0,2,1) | No root permutation | Retained |
| §2.1 units API | X; constant 1 | evaluations (0,2,6) and (1,1,1); X is nonunit, 1 is unit | Detects zero evaluation | Retained |
| §2.1 inverse interpolation denominators | roots (0,2,6) | derivative products 12,−8,24, all nonzero | Inverse defined on whole product | Retained |
| §2.3 squareclass-equivalence definition | constants 1,4,2,0 over ℚ | outputs (1,1,1),(1,1,1),([2],[2],[2]); 0 excluded | Nontrivial class retained | Absorbed §2.4 |
| §2.3 unit-reading API | constant 2 | unit evaluations (2,2,2) give ([2],[2],[2]) | Quotient respects units | Retained |
| §2.3 identity API | constant 1 | image (1,1,1) | Identity preserved | Retained |
| §2.3 triviality equivalence | constants 4,2 | [4]=1 and all three images trivial; [2]≠1 and all three nontrivial | Both directions detected | Retained |
| §2.3 multiplicativity and inverse | constants 2 and 2 | [2]²=[4]=1; componentwise image products=(1,1,1); inverse recovers [4] | Correct equivalence | Retained |
| §2.5 nonroot descent | L(−1)/𝔽₅, P=(2,4) | representatives (2,1,3), product 1=y²; classes (nonsquare,1,nonsquare) | Correct ordered differences | Locator corrected |
| §2.5 origin and excluded root branch | O; T₀ | O↦(1,1,1); uncorrected T₀ tuple starts with 0, a nonunit | Separate branch required | Retained |
| §2.6 derivative correction at T₀ | d=2, λ=3 over ℚ | tuple (12,−2,−6); own component f′(0)=12, product 144=12² | Root correction correct | Locator corrected |
| §2.6 derivative correction at T_d | same inputs | tuple (2,−8,−4); f′(2)=−8, product 64=8² | Signs correct | Locator corrected |
| §2.6 derivative correction at T_dλ | same inputs | tuple (6,4,24); f′(6)=24, product 576=24² | Third coordinate correct | Locator corrected |
| §2.6 minus-one specializations | d=1, λ=−1 over 𝔽₅ | raw tuples (4,4,1),(1,2,2),(4,3,2), with class patterns (1,1,1),(1,nonsquare,nonsquare),(1,nonsquare,nonsquare) | All nine entries agree | Recomputed |
| §2.6 conic specialization | 𝔽₅, d=2, λ=3 | last root tuple (1,4,4) consists entirely of squares | Last root is divisible | Retained |
| §2.7 product theorem, all branches | O, P=(2,4), three roots at d=2,λ=3 | products 1,1,144,64,576, each a nonzero square | Product class=1 in each case | Retained |
| §2.8 halving iff at root zero | L(−1) over ℚ and 𝔽₅ | differences (0,−1,1): false; (0,4,1): true, half (2,4) | Both directions and zero field square | Citation corrected |
| §2.8 nondivisible root | L(−1)/𝔽₅, (1,0) | differences (1,0,2), last nonsquare; no half among all 8 points | False on both sides | Retained |
| §2.8 nonroot negative control | L(−1)/𝔽₅, (2,4) | differences (2,1,3) include nonsquares; no half | False on both sides | Retained |
| §3.1 nonsquare-minus-one branch | 𝔽₇, η=2 | P=(3,1), 2P=(1,0), T=(0,0), orders 4 and 2; generated size 8 | Independent subgroup | Generalized |
| §3.1 square-minus-one branch | 𝔽₅, η=2 | P=(2,1), 2P=(0,0), T=(1,0); count and generated size 8 | Missing branch valid | Added Check |
| §3.1 extension-field branch | 𝔽₉, η=i | λ=−1, P=(i,1−i), 2P=(0,0), count 16 | Contains subgroup of order 8 | Added Check |
| §3.1 vacuity and parameter boundary | 𝔽₃; η=0,±1 | no admissible η in 𝔽₃; excluded parameters have Δ=0 | Hypotheses identify smooth cases | Retained |
| §3.2 explicit half membership | p=5, i=2,3; p=17,i=4 | y²=cubic=1,4,9; 2y=3,1,11, all nonzero | Native tangent branch valid | Consolidated Checks |
| §3.2 doubling API | same points | all doubles equal (0,0) | Correct chosen root | Absorbed §3.3 |
| §3.2 exact-order API | p=5, i=2,3 | 2P=(0,0)≠O and 4P=O; order 4 | Exact, not merely dividing four | Absorbed §3.4 |
| §3.2 first descent API | p=5,i=2,3; p=17,i=4 | first representatives 2,3,4 have characters −1,−1,+1 | Prime congruence needed for nonsquareness | Absorbed §3.5 |
| §3.2 field-map API | Frobenius on 𝔽₉ | (i,1−i)↦(−i,1+i), equal to the witness at i³=−i | Chosen parameter transported | Retained |
| §3.6 unique divisible root | p=5,13,29 | among nonzero two-torsion, only (0,0) has a half | Descent tuples distinguish other roots | Retained |
| §3.6 no order eight | p=5,13,29; negative control p=41 | point orders respectively {1,2,4},{1,2,4},{1,2,4,5,10,20}; at 41, order of (6,13)=8 | Congruence essential | Supporting target only |
| §3.7 exact two-part | p=5,13,29 | counts 8,8,40; v₂=3,3,3; odd quotients 1,1,5 | Exact valuation | Retained headline |
| §3.7 finite-abelian inference | ℤ/2×ℤ/4 versus ℤ/4×ℤ/4 | orders 8,16; both doubling kernels have 4 points, but 1 versus 3 nonzero kernel elements are divisible | Distinguishes the order-16 alternative | Retained |
| Finite-group proof's commutativity requirement | S₃ | (12)²=(23)²=1 but ((12)(23))²=(132)≠1; squaring kernel has 4 elements and is not a subgroup | Cannot use abelian theorem on S₃ | Native abelian group retained |
| §4.1 conic and auxiliary identities | 𝔽₅,t=v=2,i=3 | 2t²+2v²=1; λ=3,r=4,s=2, r²=1=2λ,s²=4=2λ−2,r²−s²=2,rs=3 | All signs agree | Recomputed |
| §4.1 corrected membership definition | same inputs | P=(4,3), factors (4,2,3), product 4=y² | Correct witness | Retained |
| §4.1 printed-point negative control | same t,v, i=3 versus i=2 | printed (4,4): y²=1≠4; printed (3,1): y²=1=cubic, negative of chosen (3,4) | Membership failure is choice-dependent | Check corrected |
| §4.1 nonvanishing denominator | 𝔽₅,t=v=2,i=3 | r+s=1,rs=3; 2rs(r+s)=1≠0 | Tangent division legal | Consolidated proof |
| §4.1 doubling API | 𝔽₅,i=3,2 | slopes 1,2 respectively, both doubles (1,0)=(2λ,0) | Correct double | Absorbed §4.2 |
| §4.1 exact-order API | same points | 2P=(1,0)≠O,4P=O, hence order=4 | Exact order | Absorbed §4.3 |
| §4.1 third descent API | 𝔽₅,i=3,2 | triples (4,2,3),(3,1,2); third entries 3,2 equal 4itv and both nonsquare | No unintended trivial class | Absorbed §4.4 |
| §4.1 characteristic-three membership and double | 𝔽₉,t=v=1 | λ=2,P=(1+i,1−i),y²=i=cubic,2P=(1,0) | General field statement | Recomputed |
| §4.1 field-map API | Frobenius on the preceding 𝔽₉ tuple | P↦(1−i,1+i), equal to the witness at (1,1,−i) | Both coordinate formulas commute | Retained |
| §5.1 square-root counting input | 𝔽₅, values 0,1,2 | root counts 1,2,0 = 1+characters 0,1,−1 | Includes zero and nonsquares | Explicit route target |
| §5.1 normal-form character-sum count | 𝔽₅,L(3); cusp | sums −2,0 give counts 6−2=4,6+0=6 | Singular solution included | Explicit route target |
| §5.1 trace as negative character sum | 𝔽₅,L(3); 𝔽₉,y²=x³+x+1 | sums −2,6 give traces 2,−6 | Integer trace normalization | Explicit route target |
| §5.1 odd-cubic cancellation | p=7,u=2 | characters (0,1,0,1,−1,0,−1); paired sums all 0 | Sum zero | Recomputed |
| §5.1 symmetric-cubic headline | p=3,u=1; p=7,u=2; p=3,u=0 | counts 4,8,4 = p+1; traces 0,0,0 | Zero scalar included | Removed hu |
| §5.1 congruence negative control | p=5,u=1 | sum 2, count 8≠6, trace −2≠0 | p≡3 mod4 needed | Retained |
| §5.1 characteristic-two negative control | 𝔽₂,y²=x³+1 | actual count 3 versus predicted 4 using quadraticChar | Odd characteristic needed | Added Check |
| §5.2 normal-form twist identity | 𝔽₉,W:y²=x³+x+1,d=1+i | d nonsquare; twist coefficients (a₂,a₄,a₆)=(0,2i,1−i); counts 16,4, traces −6,6; 6=(−1)(−6) | Beyond Legendre and prime fields | Generalized headline |
| §5.2 cubic scaling step | 𝔽₅,W=L(3),d=2,z=2 | f(2)=3, d³f(2)=4; twisted f_d(4)=4 | Substitution direction and power three | Explicit proof |
| §5.2 character power identity | 𝔽₅,d=2,4,0 | characters of d³ and d are respectively −1,1,0 on both sides | Cube gives same character | Zero handled separately |
| §5.2 square and nonsquare twists | 𝔽₅,λ=3,d=2,4 | traces −2,2 = χ(d)·2; counts 8,4 | Both twist classes | Retained Checks |
| §5.2 singular parameter | 𝔽₅,d=2,λ=0,1 | unscaled counts 5,5; scaled counts 7,7; traces −1=(−1)·1 | No ellipticity needed | Removed exclusions |
| §5.2 zero scalar | 𝔽₅,d=0,λ=3 | cusp count 6, trace 0; χ(0)·2=0 | Zero on both sides | Included separate proof |
| §5.2 good Euler consequence | 𝔽₅,λ=3,d=1,2 | 1−2T+5T² and 1+2T+5T²; at d=0, Δ=0 | Correct factors only in elliptic cases | Ellipticity retained for consequence |

Exhaustive finite checks separately compared actual affine solution enumeration with the proposed formulas: 4,023 normal-form equations over prime fields 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃, and all 46,309 choices of a twist scalar, including zero; 729 normal-form equations and 6,561 twists over 𝔽₉. There were zero mismatches. For 266 nonsingular split cubics over those prime fields, all 2,982 affine points satisfied both directions of the halving criterion, and each doubling kernel had exactly the labelled four points. All 24 admissible square parameters had independent two-by-four subgroups. The valuation formulas and integral-j implication held in 3,120 rational/prime instances. The tables also record independent negative controls; none of these enumerations is a roadmap algorithm or a substitute for the general proof.

## Maintainer consequences

- Repoint MordellLawrenceVenkatesh §6.4's coefficient model, Δ and j to §§0.1, 0.4 here; its universal family remains ModularCurves §4C. ArithmeticDynamics §§6.35, 6.111 and ErdosProgressionPowers §2.1 should consume these same coefficient interfaces. These packages are later in the merge order; no reverse dependency was introduced.
- ErdosProgressionPowers §2.1 can consume the general-field normalization and all-odd-finite-field subgroup theorem directly; its extensions of the narrower versions are no longer needed. ComputationalNumberTheory §3.17 can consume the mathematical character-sum input from §5.1 here. EllipticCurveModularityPartII §5.1 can cite §0.9 when it needs normalization after its rational two-torsion predicate. Changing those files is not actionable within this package.
- The new Lean trace name is quadraticTwistOf_frobeniusTrace, replacing scaledLegendre_frobeniusTrace. Its Legendre specialization is a README consequence of §0.2. The five supporting Lean names listed in F04–F05 are deleted; their mathematics remains in the README. The normalization and subgroup names are unchanged but have more general binders.
- Section-location changes are exactly the consolidations listed under F10. In particular labelled two-torsion exhaustion is now part of §0.10, and native scalar-twist identity is part of §0.2. Consumers using the old subsection locators need the parent locators.
- Both original plan gaps are exhausted. Only the permitted top-level gaps list was changed; all design nodes, requests and audit records remain untouched. The board alias was not modified. No commits, pushes, issue edits or pull-request edits were made.
