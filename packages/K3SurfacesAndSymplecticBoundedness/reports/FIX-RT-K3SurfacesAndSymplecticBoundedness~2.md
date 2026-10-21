# Repair report

The first four finding sections address review r2a; the fifth addresses review r2b. Their earlier-finding tables describe previously repaired findings; the five new findings below are settled once each.

## F01 (P2) — applied

In `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json`, the genus-one gap's incomplete definition → the README's proper flat surjective definition with geometrically integral arithmetic-genus-one generic fibre. Properness of the base remains explicit for global comparisons. The ruled projection has genus zero and canonical restriction O(−2), so is excluded. Evidence: enriques-one line 17390; its relative-minimality convention is enriques-one line 17427.

## F02 (P3) — applied

In `packages/K3SurfacesAndSymplecticBoundedness/README.md` §5.2, three nondiscriminating Checks → those Checks plus realized positive, negative and symplectic-intersection Wehler controls. Finite projections make both hyperplane classes ample; σ₁ fixes H₁ and moves H₂. Determinant −12 proves independence. Its canonical scalar −1 excludes symplectic membership. Evidence: huybrechts line 12221; rizov line 610; §5.4's column matrices.

## F03 (P3) — applied

In `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`, Lemma 44.13 p.105, lines 4764–4777 → p.104, lines 4764–4775. Evidence: stacks-projective-morphisms line 4731 and line 4776 bracket the page. In the plan's existing ruled-surface gap, p.52 → pp.52–53: Lemma 17.2 begins at stacks-surface-resolution line 2390, after the page marker at line 2384.

## F04 (P3) — applied

In README §6.7d, one shared dependency entry → separate entries for `IsK3.tameInvolutionLift` and `IsK3.symplecticInvolution_genusOnePencil`, with the latter explicitly consuming the former. Lifting uses equivariant deformations and crystalline variation; the pencil uses complex algebraicity and specialization. Evidence: deligne-lift line 308 and line 510; huybrechts line 11901 and line 14132. The existing supplier gaps remain unchanged.

## F01 (P3) — applied

In `packages/K3SurfacesAndSymplecticBoundedness/Suggested.lean`, bare `norm_num at hentry` → `norm_num [ZMod.neg_one_eq_one_iff] at hentry`. At Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/Data/ZMod/Basic.lean:522` supplies the rewrite to `3 = 1 ∨ 3 = 2`; `Mathlib/Tactic/NormNum/Eq.lean:22` requires characteristic zero for distinct-numeral refutation. The example's mathematical statement is unchanged. Elaboration remains unavailable.

## Adversarial mathematics pass

Each numbered row covers that subsection's targets, defining conditions, interface laws and Checks. These are mathematical boundary checks of proposed statements, conditional on the declared supplier contracts, not an independent acceptance or a Lean build. Excluded cases test the necessity of hypotheses. Unchanged theorem targets remain targets.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: intersection, half-norm, twists | Quartic H²=4, Q(H)=2; rational curve square −2; point trace 1 | Positive cup-trace and bilinear determinant agree; twists retained | None |
| Conventions: composition and contraction | Two noncommuting Wehler matrices; σ(e₁,e₂)=1; characteristic 2 | Pullback reverses order; contraction sends e₁,e₂ to e₂*,−e₁* | None |
| Conventions: orders and polarization | Identity, characteristic 2, d=0, cubic system | Identity character 24; degree positive; cubic rank 9d+2 | None |
| §1.1 K3 predicate and canonical comparison | Empty scheme, plane, elliptic-product surface, smooth quartic | Nonemptiness, canonical triviality and H¹ each discriminate | None |
| §1.2 isomorphism and field extension | Identity, tower, purely inseparable extension, rescaled volume form | Faithful coherent base change detects both inverse-line section spaces | None |
| §1.3 projectivity | Imperfect field; dimension three excluded | Relative smoothness supplies regularity for the surface theorem | None |
| §1.4 RR and contraction | L=O; quartic H; characteristic 2; volume rescaling | 2χ=4 and 8 respectively; contraction remains invertible | None |
| §1.5 numerical and torsion kernels | Trivial line, p-torsion candidate, effective nonzero divisor | Ample intersection and RR exclude a nontrivial numerical kernel | None |
| §1.6 quartics | t=0,1,−1; Fermat at 2; zero-dimensional ample divisor | χ=2,4,4; Fermat at 2 is nonreduced; positive dimension retained | None |
| §2.1 relative Picard space | Field, nonreduced base, Picard jumping, Brauer obstruction | Unramified need not mean relatively étale; arithmetic obstruction retained | None |
| §2.1a infinite-height kernel | p=2; zero versus nonzero kernel witness; finite height | Contradiction requires a nonzero vector field and nonzero Witt kernel witness | None |
| §2.2 closed one-forms | Zero form; finite and infinite height; p=2 | Separate height branches; no division by 2 | None |
| §2.3 tangent vanishings | Abelian surface; characteristic zero; p=2; imperfect base | H¹ excludes the abelian example; geometric descent retains all fields | None |
| §2.4 Hodge/crystalline ranks | Degrees −1 through 4; hypothetical W/p summands; perfect versus imperfect k | Universal coefficients exclude torsion; crystalline claim requires perfect k | None |
| §2.5 formal deformations | Dual numbers; marked versus unmarked object | Tangent dimension 20; marking removes global automorphism ambiguity | None |
| §2.6 line deformation divisor | O, L=M^p, p dividing L², good degree | O gives dimension 20; normalization handles divisible Chern classes; smoothness has its degree hypothesis | None |
| §2.7 polarized lift | p=2, ramified trait, specified arbitrary lift | Existence allows finite ramification and does not assert every lift works | None |
| §3.1 analytic K3 predicate | Empty manifold, two-torus, projective quartic | Dimension, nonemptiness and H¹ distinguish the objects | None |
| §3.2 GAGA | Projective and nonprojective analytic K3s; rescaled volume form | Essential image is the projective locus | None |
| §3.3 integral Betti and Chern comparison | nx=0 with n>0; quartic H; positive winding on O(1) | Picard torsion eliminates integral torsion; cup-square 4, Chern degree +1 | None |
| §3.4 integral étale cohomology | ℓ=p excluded; ℓ=2 allowed when invertible; characteristic-zero field too large to embed in ℂ | Spread precedes complex comparison; integral ranks and perfect pairing retained | None |
| §4.1 Picard base change and specialization | Identity extension; inseparable extension; skew conjugate real quartic lines; constant trait | Relative and absolute Galois groups differ; specialization injective and intersection-preserving | None |
| §4.2 Picard lattice | Zero class; Gram [4]; rational curve; ℝ→ℂ | Even half-norm, negative curve sign and residue-weighted projection formula agree | None |
| §4.3 ranks | Algebraically closed extension; real Fermat quartic; rank zero | Geometric rank stays fixed while arithmetic rank can increase; ample class excludes zero | None |
| §4.4 rank bounds and cycle saturation | Ranks 1,20,22; ℓ≠p; multiplication by ℓ on ℤ_ℓ | Equal rank gives an isomorphism only with the stated saturation | None |
| §4.5 congruence theorem and depth laws | n=0; −1 at ℓ=2,3; I+3E₁₂; positive coprime powers | Odd prime excludes finite torsion; prime 2 has a nontrivial involution | Explicit residue rewrite in Lean |
| §4.6 bounded rank descent | Trivial Galois image; finite field; characteristic zero with point; inseparable classes | Bound concerns rational rank; integral descent needs the stated extra conditions | None |
| §5.1 symplectic predicate and representation | Identity, volume rescaling, product/inverse, scalar −1 | Inverse pullback is multiplicative; scalar −1 fails outside characteristic 2 | None |
| §5.2 polarized stabilizers | Full-Aut substitution; Wehler σ₁ with H₁,H₂; canonical scalar −1 | Positive and negative class membership now distinguished; intersection also tested | Three geometric Checks added |
| §5.3 finite étale stabilizers | Wild subgroup; infinitesimal identity; line-isomorphism scalars | Zero tangent gives étaleness without excluding small characteristic | None |
| §5.4 Wehler example | Both deck involutions; opposite product orders; Gram determinant | SᵢᵀBSᵢ=B; det B=−12; S₂S₁ has trace 14 and determinant 1 | None |
| §6.0 supersingular discriminant | σ=0,1,11; p=2 | Signature difference −20 excludes even unimodularity; scaled evenness at 2 is a supplier premise | None |
| §6.0a height inequality | h=1,10,11; infinite height | Rank bounds 20,2; h=11 contradicts positivity; infinity is not an integer input | None |
| §6.0b genus-one pencil | Rank-one [4]; primitive F versus 2F; quasi-elliptic fibre | Rank threshold, primitive pencil and arithmetic genus retained | None |
| §6.0c height/rank and Jacobian | Pencil without section; finite height; quasi-elliptic case; rank 21 | Jacobian comparison retains missing-section and small-characteristic cases; rank 21 excluded | None |
| §6.1 tame quotient lattice | G=1; involution; rank-20 square discriminant | Root determinants 1 and 2⁸; rank-20 exclusion uses Jacobian and p-divisibility | None |
| §6.1a cyclic arithmetic | n=2,4,9,12,14,16; candidate determinants 121,196,225 | Order 14 satisfies subgroup arithmetic and is excluded by discriminants; 9,12,16 fail divisibility | None |
| §6.2 tame fixed points | Identity, orders 2 and 7, wild element | Identity excluded; counts 8 and 3; wild formula not asserted | None |
| §6.2a wild fixed loci | Empty set at p=2; nodal versus fibre matrix; D²=2,d=1 | Enriques branch retained; inequality 0≤2 yields no prime bound | None |
| §6.3 wild quotients | Free C₂ action at p=2; rational resolution; nonzero exceptional lattice | e(Y)=12 and b₂(Y)=10; algebraic and transcendental comparisons kept distinct | None |
| §6.3a wild refinements | p=11 exception; p=13; quasi-elliptic p=2,3 | Exceptional prime retained; invariant pencil at 13 excluded; torsion theorem scoped to elliptic K3 | None |
| §6.4 wild-prime bound | Characteristic 2; p=13 | Cauchy gives an order-p element; p=13 forces every finite subgroup tame | None |
| §6.4a rank-22 Picard faithfulness | Identity; p=2; degree-two characteristic-zero deck involution | Rank 22 and action on all classes are essential | None |
| §6.5 cohomological faithfulness | Identity; rational quotient; free characteristic-2 quotient; K3 resolution | Separate rank-22 rigidity, invariant dimension 10 and exceptional-rank contradictions | None |
| §6.6 universal bound | Trivial subgroup; characteristic 3; wild subgroup | Use ℓ=5 at p=3 and ℓ=3 otherwise; no group-order averaging needed | None |
| §6.7d involution lift | Trace 6; L=M^p; p=2 | Invariant rank 14, tangent 12; normalized class and exact invariants give flatness; p=2 excluded | Separate prerequisite entry |
| §6.7d involution pencil | Exact involution versus identity; anti-invariant classes; p=3 | Eight algebraic classes plus an independent ample class give rank ≥9; specialization preserves the bound | Explicit lift dependency |
| §6.8 Artin-one predicate | Rank 22/disc −9 versus −81 at 3; rank 20; Fermat at 3,7,5 | Sign, characteristic and rank distinguish the cases; height one excludes Fermat at 5 | None |
| §6.8a invariant-dimension calculation | G=1,C₇, order 21; nonflat A₁ quotient; both surfaces Artin-one | Averages 24,6,6; trace uses resolved proper duality; exceptional case excluded from five-invariant claim | None |
| §6.9 Mathieu character | n=0,1,2,7; wild element | Values 0,24,8,3; only positive n represents an element order | None |
| §6.10 characteristic-zero bound | Trivial action; involution type 1⁸2⁸; 23-cycle | Orbit counts 24,16,2; last violates five-orbit condition | None |
| §6.11 tame bound | Four-invariant exceptional branch; p=2; nonclosed field | Exceptional containment retained; tame at 2 means odd order; geometric inclusion is faithful | None |
| §7.1 primitive class | Zero, generator, double, squarefree d | Zero and double fail; n² divides d for a multiple of an ample class | None |
| §7.2 multiplication/root loci | n=0; n=3 at p=3; F,2F,0 | Zero multiplication excluded; square-zero classes use ample intersection to bound roots | None |
| §7.3 polarized families | Constant family; d=0; absent global representative; scalar choices | Picard sections and Cartesian arrows preserve the intended family object | None |
| §7.4 ample cohomology | m=0,1,2,3,−1; d=2 | Positive powers give 4,10,20 sections; H²(O) excludes m=0 from vanishing | None |
| §7.5 cube embeddings | d=1,2; p=2; hypothetical separation failure | Projective dimensions 10,19; evenness excludes the forced D²=1 | None |
| §7.6 Hilbert K3 locus | Quartic cube embedding; singular degeneration; equal line ranks with unequal classes | Canonical-class equality, smoothness and H¹ each remain necessary | None |
| §7.7 atlas and projective bundle | Characteristic 3 root; coordinate swap; nonsplit real quartic; L⊗f*N | Projective cocycle descends despite vector-bundle obstruction; frame torsor retains source identification | None |
| §8.1 moduli stacks | Polarized involution; primes dividing 2d | Stabilizers remain; finite-type existence covers every prime | None |
| §8.2 separation | Generic identity; family without smooth extension | Extends isomorphisms of given families, not arbitrary families | None |
| §8.3 coarse spaces | Stabilizers; distinct k-forms of one geometric object | Geometric-point bijection does not identify arbitrary k-forms | None |
| §8.4 smooth base | d=1; p dividing 2d | Base ℤ[1/2] at d=1; no bad-prime smoothness assertion | None |
| §8.5 finite fields | Fixed k,d; twists; projective frames | Brauer vanishing supplies line representatives and a surjection from finite H_d(k) | None |

The Lean-specific boundary pass also checks the explicit signatures: there are no ambient section variables, and all three admitted theorem propositions explicitly retain primality, oddness and finite-order/finite-subgroup assumptions. None of the three definitions or six examples is admitted.

| Lean statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `firstCongruenceKernel` and its two examples | GL₀; GL₁ at 2 and 3 | Native homomorphism kernel; −1 is inside only at 2 | Residue-3 proof fixed |
| `rank0_kernel` | Empty matrix indices | Extensionality eliminates a `Fin 0` index | None |
| `unipotent_two_term` | m=0,1,2; induction step | Off-diagonal entries 0,3,6; square-zero term gives linear powers | None |
| `GeneralLinearGroup.oddCongruenceKernel_torsionFree` | Rank 0, rank 1; unipotent; excluded prime 2 | Minimum valuation increases by one under an odd-prime power | None |
| `finiteSubgroup.reduction_injective` | Trivial subgroup; two elements with equal residue | Their quotient has finite order and lies in the torsion-free kernel | None |
| `finiteSubgroup.integral_reduction_injective` | Rank 0; ±I | Integral scalar extension into ℤ₃ followed by the previous theorem | None |
| `wehlerPullbacks`, its evaluation theorems and two examples | i=0,1; pairing and ordered product | Column actions preserve the pairing; product trace 14, determinant 1 | None |
| `mathieuCharacter`, its two theorems and two examples | n=0,1; primes 2,3,7; nonprime 1 excluded from prime theorem | Empty product and nonzero prime casts give the stated rational identities | None |

Supplier boundary checks covered the general contracts as well: nonample and zero-dimensional complete intersections; arithmetic intersection degree under ℝ→ℂ; G=1 quotients; tame versus wild local actions; rational rather than integral quotient averaging when ℓ divides |G|; ordinary A₄ versus binary tetrahedral groups in SL₂; finite-height versus additive formal groups using their p-series; genus-zero versus genus-one generic fibres; local versus global projective embeddings; and actual ample lines versus Picard sections. The only changed supplier conditions are the already-correct README genus-one hypotheses copied into the plan. The ruled-form supplier's statement is unchanged; only its page locator changes.

## Verification and maintainer notes

- **Suggested.lean elaboration:** not available. No Lean command was run, so there is no compiler or elaborated-type certification. The residue repair was checked against the exact pinned `ZMod` declaration and `norm_num` equality extension, not a newer library version.
- **Dependency check:** exited successfully with the exact output below. No UPWARD or CYCLE line occurred.

```text
depcheck: 6 roadmaps, 42 edges, 0 problem(s)
```

- **Scope check:** comparing parsed plan JSON with its original Git version confirms that everything outside the top-level `gaps` list is identical. Within that list only `detail` changed, for `elliptic-surface-geometry` and `ruled-surface-two-forms`. No gap, supplier, section or `needs` sentence was added or renamed.
- **Contract consistency:** all 23 plan gap slugs and exact `needs` sentences match the corresponding README supplier lines. The new per-target dependency entries expose the existing lift-to-pencil direction and introduce no supplier edge.
- **README/Lean consistency:** all 12 named Lean declarations occur in the README; the six anonymous examples retain their documented Check names. There are 162 Lean lines, one `import Mathlib`, no options and no admitted data or examples. The three new stabilizer Checks require the geometric K3 carriers and therefore remain README Checks; the existing matrix examples still test the matrix definition.
- **Source checks:** `sources.toml` parses, retaining 28 source records. No new work is cited and no new source fetch is needed. Existing waived/uncertified primary locators remain settled; they are not represented here as newly read primary proofs. The enriques-one extraction has font corruption, but its generic-fibre hypotheses at line 17390 and relative-minimality convention at line 17427 are readable. The two Stacks corrections were read directly against the cached page markers.
- **Ownership checks:** upstream style was compared with `TauCetiRoadmap/ComplexTori/README.md` and `Completed/IntegralLattices/README.md`. SchemeAndStackFoundations §4.6 supplies the ordinary deformation obstruction spaces; §4.10 treats existence/fully faithful comparison for given proper schemes. The existing `gap:tame-equivariant-deformations` remains responsible for the equivariant formalism and polarized algebraization consumed by the lifting target. The five supplied sibling checkouts were searched for K3, Wehler, involution and genus-one ownership; no new premise is imported from them. Pinned-library object searches found no replacement for the planned matrix congruence headlines or geometric Wehler construction; ray-class unit congruence torsion is a different object.
- **Whitespace check:** `git diff --check` passed with no output.
- **Downstream consequences:** no target or Lean declaration was renamed, deleted or narrowed. No ownership moved and no merge-order change is requested. Consumers keep the same names. The strengthened genus-one gap now agrees with the existing README restriction, and the added Checks require actual polarization preservation. No commit, push or external write was performed.

A fresh independent review remains required; this report records repairs and their verification limits.
