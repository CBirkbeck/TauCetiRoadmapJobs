# Design repair: K3 surfaces and symplectic boundedness

## F01 (P2) — applied

Direct transport of the printed conormal formula → an explicit normal-bundle self-intersection contract, an independent deformation/zero-section derivation, and computed Checks for a point, the diagonal of ℙ¹ (+2), and a line in ℙ² (+1). The all-dimensional Gauss–Bonnet contract and its plan detail remain general.

Evidence: gros-chern line 2316 defines the conormal; gros-chern line 2318 prints its Chern class. Positive divisor classes are fixed at gros-chern line 1505, dual Chern signs at gros-chern line 1946, and unchanged crystalline Chern comparison at gros-chern line 1979. These make the literal printed formula inconsistent in odd codimension. The README explains the dual omission and derives the required formula by specialization, the line-bundle Euler class and the splitting principle, rather than silently dualizing the printed symbol. The geometric deformation and projective-bundle arguments are located at gros-chern line 2373 and gros-chern line 1797. CrystallineCohomology CR.3:duality.1 supplies the supported/trace-adjoint Gysin comparison and positive diagonal Euler trace.

## F02 (P2) — applied

Unrestricted global projectivity and a duplicate descent gap → StableReduction Layer 2 polarized descent, its derived scheme criterion, local projectivity over any base, and global projectivity over a quasi-compact quasi-separated base. Deleted `gap:ample-space-scheme`; redirected §§7.3, 8.2 and 8.5 and their plan prerequisites. Three Checks distinguish line descent and projectivity conventions.

Evidence: `TauCetiRoadmap/StableReduction/README.md`, Layer 2, already owns effective étale descent with a compatible relatively ample invertible sheaf, including its section algebra, relative Proj and morphisms. Stacks gives the scheme/étale-local criteria at stacks-relative-ample line 1253, stacks-relative-ample line 1274 and stacks-relative-ample line 1306. Projectivity conventions are at stacks-projective-morphisms line 4633; proper plus ample gives local projectivity at stacks-projective-morphisms line 4688. Finite type plus a relatively ample line is quasi-projectivity at stacks-projective-morphisms line 4229; the quasi-compact quasi-separated global implication is stacks-projective-morphisms line 4764.

The non-quasi-compact Check is deliberately precise: the disjoint union of ℙⁿ over disjoint points is projective in the stated ℙ(E) convention, but admits no fixed global ℙᴺ embedding. It distinguishes the stronger embedding claim without pretending to disprove the weaker projectivity notion. Arbitrary-base K3 families remain in scope through affine base opens after choosing local line representatives.

## F03 (P2) — applied

The polarization-only finite-divisor argument → an arbitrary-section argument using locally constant d=λ²/2 and m=λ·H. Added the Hodge-index dependency and Checks for F, 2F and 0. Extended the Rizov locator through part (ii) in both design files and the manifest; the theorem's domain and name are unchanged.

Evidence: rizov line 468 states the arbitrary-section claim; rizov line 505 begins the incomplete degree argument, ending at rizov line 516. If d≠0, roots satisfy n²∣d. If d=0 and m≠0, they satisfy n∣m. If both vanish, the negative definiteness on H⊥ in SchemeAndStackFoundations §5.10 and §1.5's numerical-kernel theorem force λ=0 on every geometric fibre. The primitive locus is empty on that open-and-closed piece. On an elliptic K3 with section C, F·C=1 proves F primitive, while 2F and 0 are divisible despite square zero.

## F04 (P3) — applied

Distinct frames always give distinct Hilbert points → the Fermat-quartic stabilizer example and the precise outside-stabilizer assertion. The frame-torsor API now explicitly retains the isomorphism to the prescribed family in the stack pullback. The Hilbert PGL action retains polarized automorphisms as stabilizers.

Evidence: for the Fermat quartic over ℂ, x₀↔x₁ preserves the equation and exchanges independent sections x₀³ and x₁³ of O_X(3). Its projective action is nontrivial but preserves the cubic image. Conversely a projective transformation preserving that image restricts to a polarized automorphism, and every such automorphism acts on the complete linear system. §1.5 identifies the stabilizers of H and 3H. Thus equal Hilbert points need not be equal points of the torsor with source identification. The existing quotient-stack construction in §§7.7–8.1 remains intact.

## F05 (P3) — applied

K3 application locators used for general contracts → general genus-one canonical, Euler and fibre-type locators, general quasi-elliptic unirationality, and a normalized Čech/Thom derivation of analytic Chern naturality and intersection. Retained the application locators, full characteristic domains, wild correction terms and winding-number Check. Synchronized the gap details and source manifest.

Evidence: the 19 April 2024 author draft of Enriques Surfaces I gives the canonical formula at enriques-one line 17528, its torsion correction at enriques-one line 17540, the Jacobian formula at enriques-one line 18462, section square at enriques-one line 18465, the finite-Mordell–Weil discriminant relation at enriques-one line 18480, coherent Euler equality at enriques-one line 18646, and fibre-type comparison at enriques-one line 18799. I inspected the original PDF's printed pp.364–365, 385, 389 and 392 because its cached extraction garbles some glyphs. The theorem numbering and hypotheses agree. Liedtke's Corollary 4.2 and Definition 4.3, liedtke-surfaces line 753, retain characteristics 2 and 3; Theorem 8.3, liedtke-surfaces line 1331, gives unirationality over the rational base without a K3 hypothesis.

For complex manifolds, normalized logarithms give the integral cocycle δu; their functoriality proves holomorphic pullback compatibility. Positive winding around a holomorphic zero identifies the class with its complex-oriented Thom class. AlgebraicTopology Stage 6 duality and products give the intersection comparison, with ComplexKahlerGeometry K6.1 supplying analytic cycle integration. Huybrechts remains an application at huybrechts line 452 and huybrechts line 470. Arapura §7.5, Lemma 7.5.1 and Definition 7.5.2, p.150, is recorded as `uncertified`, not certified from a search excerpt. The author chapter URL returned 404; the sources service classified the published DOI as paywalled. This is a settled locator-only citation under the brief, with no outstanding missing-text request.

## Checks and interfaces

The required dependency command exited 0 with this exact output:

```text
candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 19 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No tooling or merge-order file was changed.

JSON and TOML parsing passed. The consistency audit passed for all 60 target names, 84 API names, 190 target Checks, 27 gap contracts and their consumer lists, the new supplier Checks, internal target ordering, source identifiers and metadata. All target dependencies point earlier, including the existing annotated reference to §4.4 `picardCycle_saturated`. No reference to the deleted gap remains in either design file or the manifest. New source records retain the service's URLs, hashes and access status; existing waived and uncertified works were not reopened. No machine paths occur in the deliverables. `git diff --check` passed.

Lean elaboration was not run: the design package has no `Suggested.lean`, none is editable, and the brief gives no executable Lean check. The affected geometric carriers remain README targets. No elaboration or implementation-proof result is claimed.

Read the main StableReduction, SchemeAndStackFoundations and ComplexKahlerGeometry roadmaps for ownership and shape, and the relevant AlgebraicTopology contracts. Read CrystallineCohomology CR.3:duality.1 at its new-roadmap head `2c8b22a1737d1660f1baf397926b41e90139a80d`; its main-branch path is absent. Read the open ArithmeticDynamics scope at `85e78c07dcc361ead6505c970a1181deee483819` and ErdosProgressionPowers scope at `42053a57c08415a9ec0808d442eb654702586215`: neither supplies or duplicates the affected K3 theory. GitHub code searches were followed by reading Mathlib's `AlgebraicGeometry.SmoothOfRelativeDimension` in `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` at pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti's native differential universal property in `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean` at pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are carriers, not the missing geometric comparison theorems. Searches for relative ampleness, crystalline self-intersection and Picard multiplication revealed no replacement interface to import at those declarations.

No theorem or API name cited by another roadmap changed. `gap:ample-space-scheme` is the only deleted contract name; its consumers now cite StableReduction Layer 2. The other supplier gaps remain requests for general supplier extensions, with their named owners and sections; their implementations are not asserted to exist. No supplier target, merge-order placement or scope decision outside this package is requested by these repairs. No commit or GitHub write was made. Independent review remains necessary.

## Adversarial mathematics pass

Each target row covers its statement, API and listed defining conventions. The pass checks mathematical substitutions and prerequisites; it does not certify unimplemented proofs. Unchanged rows record the retained hypotheses rather than add targets.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Intersection and half-norm conventions | Quartic H, rational C, zero; p=2 | B(H,H)=4, Q(H)=2; B(C,C)=−2; integer RR survives p=2 | Retained |
| Pullback and contraction conventions | Identity, two composites, e₁/e₂, p=2 | Inverse pullback is a left action; contraction gives e₂*,−e₁* | Retained |
| Tate twists and trace | Geometric point, quartic, ℓ=2≠p | Point trace 1; quartic cup-trace 4; twists retained | Retained |
| §1.1 | Empty, plane, abelian surface, quartic | Geometric integrality excludes empty; canonical and H¹ conditions discriminate | Retained |
| §1.2 | Identity, tower, purely inseparable field extension | Faithful field extension detects the two nonzero section spaces | Retained |
| §1.3 | Imperfect field; dimension three | Relative smoothness gives a regular surface; no general higher-dimensional projectivity assertion | Retained |
| §1.4 | O, quartic H, p=2 | χ=2 and 4; contraction remains invertible at p=2 | Retained |
| §1.5 | O, torsion, effective (−2)-curve | Only O is numerical kernel; an effective nonzero divisor meets an ample class positively | Retained |
| §1.6 | t=0,1; Fermat at p=2; zero-dimensional ample cut | χ=2,4; Fermat becomes a thickening; connectedness needs positive dimension | Retained |
| §2.1 | Field fibre, class jump, zero section, nonreduced base | Relative unramifiedness is not flatness; universal functions retained | Retained |
| §2.1a | Zero witness, p=2, finite versus infinite height | A nonzero Witt-kernel witness and vector-field hypothesis remain required | Retained |
| §2.2 | Zero form, Cartier iterates, p=2 | K3 closedness uses the two height branches, not arbitrary-surface degeneration | Retained |
| §2.3 | Abelian surface, characteristic zero, p=2 | H¹(O) excludes abelian surfaces; Oda's rational-point/perfect-field domain retained | Retained |
| §2.4 | Cohomological degrees 0–4 and outside; torsion candidates | Hodge h¹¹=20; rational rank 22 does not itself imply integral freeness | F01 general input repaired |
| §2.5 | Dual numbers, unmarked automorphisms | Marked tangent dimension 20; no unmarked fine moduli conclusion | Retained |
| §2.6 | O, nontrivial L, p dividing 2d | O has dimension 20; nontrivial pair locus has dimension 19; smoothness has its extra hypothesis | Retained |
| §2.7 | p=2, ramified trait | Existence permits ramification and does not specify every lift | Retained |
| §3.1 | Empty manifold, complex torus, quartic | Nonempty/connected and H¹ conditions discriminate | Retained |
| §3.2 | Projective analytic embedding; nonprojective analytic K3 | Algebraic essential image remains the projective locus | Retained |
| §3.3 | Integral torsion, quartic, unit circle | Universal coefficients/duality needed; cup square 4; normalized lift increment +1 | F05 derivation repaired |
| §3.4 | ℓ=p; ℓ=2≠p; point | Coefficient prime excluded exactly in characteristic p; point trace 1 | Retained |
| §4.1 | Identity, algebraically closed extension, Brauer obstruction | Integral Picard descent differs from rational invariant descent | Retained |
| §4.2 | Gram [4], zero, (−2)-curve, ℂ/ℝ | Even integral form; finite pushforward degree factor retained | Retained |
| §4.3 | Rank zero, closed field, rank 22 | An ample class excludes rank zero; h¹¹ is not geometric Picard rank | Retained |
| §4.4 | Multiplication by ℓ; equal rank 22; characteristic zero | Equal rank needs saturation; characteristic-zero bound is 20 | Retained |
| §4.5 | n=0,1; ℓ=2,3; I+3E₁₂ | GL₀ trivial; −1 is dyadic torsion; unipotent power has term 3mE₁₂ | Retained |
| §4.6 | Closed field, imperfect field, finite field, rational point | Degree 1 for closed base; rank descent does not imply integral equality | Retained |
| §5.1 | Identity, composition, scalar rescaling, −1 at p=2 | Kernel independent of generator; −1=1 at p=2 | Retained |
| §5.2 | Identity, scalar line isomorphisms, L versus L³ | Scalars are not extra surface automorphisms; class stabilizers agree for positive powers | Retained |
| §5.3 | Nontrivial involution, nonclosed field, p=2 | Finite étale need not be trivial or have every geometric point rational | Retained |
| §5.4 | Wehler matrices, product order, nonample cut | Determinant −12; product trace 14 and determinant 1; canonical scalar +1 | Retained |
| §6.0 | σ=0,11; p=2; rank 22 | Negative determinant; Milgram excludes both extremes with scaled evenness retained | Retained |
| §6.0a | h=1,10,11,∞ | Bounds 20,2; h=11 contradicts positivity; ∞ is not an integer argument | Retained |
| §6.0b | Rank one; F and 2F; p=2,3 | Rank threshold and primitive isotropic class matter; quasi-elliptic branch retained | Retained |
| §6.0c | Elliptic pencil without section, finite height, quasi-elliptic pencil, rank 21 | Jacobian χ=2 over ℙ¹ gives ω=O and H¹=0; the two pencil branches exclude rank 21 | F05 general sources repaired |
| §6.1 | Trivial group; involution; square determinant rank 20 | Root ranks 0 and 8; determinant 1 and 2⁸; rank-22/Jacobian prerequisites remain earlier | F05 general sources repaired |
| §6.1a | Orders 2,4,11,15 | Euler sums 24 and 72; square discriminants 121 and 225 need geometric exclusion | Retained |
| §6.2 | Identity, orders 2,7,8 | Identity excluded; fixed counts 8,3,2 | Retained |
| §6.2a | Empty wild fixed locus, κ=0/1, N=2,d=1 | Empty branch at p=2; definite versus semidefinite distinguished; no division by zero | Retained |
| §6.3 | Free C₂ at p=2, rational quotient, exceptional roots | Étale quotient has e=12 and b₂=10; rational cohomology comparison uses no integral averaging | Retained |
| §6.3a | p=11,13; quasi-elliptic pencil | Exceptional p=11 retained; no order-13 invariant pencil; small-characteristic branch preserved | Retained |
| §6.4 | p=2,13; nonsymplectic finite subgroup | Cauchy supplies order p, automatically symplectic; p=13 forces tameness | Retained |
| §6.4a | Identity, p=2, characteristic-zero degree-two involution | Full Picard action and rank 22 are essential; fixing an ample class alone is insufficient | Retained; primary waiver unchanged |
| §6.5 | Identity, ℓ=p, characteristic-2 Enriques branch | Faithfulness retains all quotient alternatives and ℓ invertibility | Retained |
| §6.6 | Trivial group; char=3; wild subgroup | Use ℓ=5 at char=3; otherwise ℓ=3; no group-order inversion needed | Retained |
| §6.7d | Identity, swap matrix mod 2, p=3 | Exact order two essential; integral involution need not be identity mod 2; quasi-elliptic alternative retained | Retained |
| §6.8 | Rank 22, discs −9/+9/−81 at p=3; rank 20 | Signed bilinear determinant distinguishes σ=1, σ=2 and wrong rank | Retained |
| §6.8a | Trivial group, C₇, order 21, exceptional surfaces | Invariant dimensions 24,6,6; no universal five-invariant assertion for exceptional case | Retained |
| §6.9 | Orders 1,2,7; wild element | Characters 24,8,3; formula only used for tame action | Retained |
| §6.10 | Trivial action, involution, order 23 | Orbit counts 24,16,2 distinguish the five-orbit requirement | Retained |
| §6.11 | Exceptional action, p=2, nonclosed field | Four-orbit exception retained; tame at p=2 means odd order; base change injects automorphisms | Retained |
| §7.1 | 0, generator, twice generator, squarefree degree | Zero fails; nonzero saturation criterion retained | Retained |
| §7.2 | n=0,3 at p=3; F,2F,0; negative nonzero d | Roots bounded by n²∣d or n∣m; d=m=0 handled separately | F03 repaired |
| §7.3 | Constant family, d=0, Picard obstruction, non-quasi-compact base | Local line data and affine opens preserve arbitrary-base families | F02 repaired |
| §7.4 | m=0,−1; quartic m=1,2,3; p=2 | Positive powers have h⁰=4,10,20; vanishing does not include m=0 or negative powers | Retained |
| §7.5 | d=1,2; p=2 | Cube embeds in ℙ¹⁰ or ℙ¹⁹; evenness excludes obstruction D²=1 | Retained |
| §7.6 | Singular degeneration; equal ranks but unequal line classes | Actual canonical Picard equality required, with base-change compatibility | Retained |
| §7.7 | Fermat coordinate swap, outside-stabilizer frame change, p=3 | Distinct frames can have equal Hilbert points; torsor retains source identification | F04 repaired |
| §8.1 | Nontrivial stabilizer, p dividing 2d | Stack retains automorphisms and all-prime atlas | Retained |
| §8.2 | Identity over DVR; punctured family without smooth extension | Extends isomorphisms of given families; DVR satisfies global projectivity hypotheses | F02 repaired |
| §8.3 | Nontrivial stabilizer; nonclosed k-forms | Coarse geometric-point bijection is not classification of k-forms | Retained |
| §8.4 | d=1; p dividing 2d | Smooth over ℤ[1/2] for d=1; bad primes excluded from smoothness only | Retained |
| §8.5 | Fixed k,d; distinct twists; actual frame | Brauer vanishing produces a line; a frame reaches each k-isomorphism class | F02 supplier redirected |

The general supplier contracts were also checked against their boundary cases. The table uses their gap slugs; the ample-space contract is now an import consequence, as recorded above.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `surface-projectivity` | Imperfect field, dimension three | Smooth proper surfaces fall within the regular surface theorem; dimension bound retained | Retained |
| `hypersurface-cohomology` | Ample quartic; (2,0) divisor in ℙ¹×ℙ²; two points | Regular ample positive-dimensional cuts connected; omitted positivity/dimension controls fail | Retained |
| `surface-arithmetic-quotient` | Degree-one and degree-two field extensions | Pullback intersection unchanged; projection with one arbitrary curve carries field degree | Retained |
| `surface-quotient-resolutions` | Trivial group, wild quotient | Quotient normality and resolution apply; no arbitrary wild rational-singularity vanishing | Retained |
| `tame-quotient-singularities` | A₁, trivial stabilizer, p dividing group order | A₁ has square −2 and determinant 2; wild linearization excluded | Retained |
| `quotient-transcendental-comparison` | Trivial quotient, ℓ dividing group order | Rational averaging remains valid; integral isomorphism not inferred | Retained |
| `ruled-surface-two-forms` | ℙ¹-bundle, point blowup | Restriction O(−2) kills global two-forms; codimension-two extension gives birational invariance | Retained |
| `matsusaka-mumford` | Identity, ruled special fibre | Uniqueness holds for given non-ruled polarized families; ruled hypothesis cannot be discarded | Retained; primary waiver unchanged |
| Ample-space import consequence | Field base, disjoint ℙⁿ family, Picard section without line | Scheme descent uses actual line data; local/global projectivity distinguished | F02 |
| `elliptic-surface-geometry` | E×C, Jacobian χ=2 over ℙ¹, χ=1 section, wild multiple fibre, quasi-elliptic base | Product χ=0; K3 Jacobian R¹O=O(−2); χ=1 section has square −1 so unimodular plane need not be even; wild T retained; rational base gives unirationality | F05 |
| `rational-surface-cohomology` | ℙ², inseparable unirational domination | Pullback–trace uses nonzero rational degree even when divisible by p; ℓ≠p retained | Retained |
| `adjoint-positivity` | r=0/1; K3 at p=2; general-type or quasi-elliptic surface | K3 meets the permitted branch; exceptional surface hypotheses and numerical bounds retained | Retained |
| `tame-lefschetz` | Identity, isolated point, wild automorphism | Euler characteristic rather than a point count for positive-dimensional fixed locus; isolated tame index +1 | Retained |
| `surface-brauer-localization` | Remove finite points; arbitrary divisor; disjoint exceptional trees | Purity does not make every divisor restriction an isomorphism; residue term retained | Retained |
| `surface-brauer-kummer` | H³ torsion zero or nonzero; trivial group action | Finite H³ term retained until K3 vanishing; standard-power description not canonically equivariant | Retained |
| `equivariant-brauer-descent` | Trivial torsor; nonvanishing units/group cohomology | Units, d₂, d₃ and edge kernels/cokernels retained | Retained |
| `integral-topology` | Trivial line; O(1) on ℙ¹; O(−1); pullback along identity | Chern degrees 0,+1,−1; normalized δu natural; positive Thom orientation | F05 |
| `oda-interface` | Algebraically closed field; absent rational point; p=2 | Rational point/perfect-field hypotheses remain explicit; algebraic closure supplies the point | Retained |
| `witt-formal-brauer` | Finite height h; additive group; purely inseparable finite flat map; point blowup | Rank h versus [p]=0 distinguishes branches; norm degree survives inseparability; blowup invariance uses coherent vanishing | Retained |
| `crystalline-gauss-bonnet` | Point; Δℙ¹; line in ℙ²; surface | Traces 1,2,1; conormal would give wrong odd-codimension signs; dimension two alone cannot test it | F01 |
| `crystalline-picard-degree-one` | Point, Picard variety zero | Rational degree-one rank zero; duality and derived reductions remain separate inputs | Retained |
| `crystalline-chern-derivative` | Trivial line; p dividing L² | Trivial class derivative zero; nontriviality and nonzero tangent obstruction not conflated | Retained |
| `artin-discriminant` | p=2, σ=11, primitive ample class | Scaled evenness at 2 required; injection is 𝔽_p-linear, not a k-linear injection of Pic/p⊗k | Retained |
| `cross-realization` | Finite-order automorphism; unipotent nonidentity linear map | Identity characteristic polynomial needs semisimplicity before concluding identity action | Retained |
| `tame-linear-groups` | Trivial subgroup; p dividing group order | Prime-to-p/characteristic-zero hypotheses retained | Retained |
| `mathieu-permutation-model` | Identity, involution, point stabilizer | Fixed-letter counts 24,8; 24·10200960=244823040 | Retained |
| `mukai-eleven-groups-recognition` | Trivial group; Q₈; p=2 | Five invariants and Sylow embedding remain hypotheses; dyadic obstruction available whenever even tame order requires it | Retained |
| `exceptional-mathieu-embeddings` | Same group order with different extensions | Specified abstract extension structure is essential; mere order is insufficient | Retained |
