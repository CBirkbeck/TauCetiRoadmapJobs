# PORT-GenericDoublePointInterpolation

Branch: `roadmap/generic-double-point-interpolation`.
Head commit: 289027b0d2b58624f99b3c6037e1ab836942ae55.
Base: `0a7ca14`; the starting worktree was clean.

The committed change is confined to `TauCetiRoadmap/GenericDoublePointInterpolation/README.md`,
`TauCetiRoadmap/GenericDoublePointInterpolation/Suggested.lean` and
`TauCetiRoadmap/GenericDoublePointInterpolation/metadata.toml`. The topic remains `math.AG`.
No push or other GitHub write was performed.

## Validation

Build outcome, verbatim:

```text
Build completed successfully (8976 jobs).
```

Warnings: 15, all `declaration uses sorry`; errors: 0; other warnings: 0.
The module contains 28 declarations, including 15 admitted headline theorems and
13 supporting declarations with real bodies. It has one `import Mathlib`, no
Tau Ceti imports because no kept signature needs one, no options, and no examples.

Gate summary, verbatim:

```text
gate GenericDoublePointInterpolation: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required separate dependency check produced:

```text
depcheck: 32 roadmaps, 286 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no merge-order move. The first full gate
reported only a dirty worktree; that gate always checks cleanliness, so its
final run followed the commit. Every content scanner was already zero beforehand.
The final citation resolver found no unresolved roadmap citation or Lean name.
Its notice that it did not inspect pinned packages was supplemented by direct
inspection of this worktree's manifest and pinned sources. All 167 internal
README links resolve to actual headings.

## Draft pull request body

Build a library of generic double-point interpolation, from bounded polynomial coefficient spaces and square-zero first jets through projective restriction ranks, the plane and cubic bases, and ordinary and differential Horace induction. The end theorems give Alexander–Hirschowitz maximal rank in degree at least five, a nonempty principal open of well-poised affine configurations, and bounded integer coordinates. The same universal minor supports polynomial parameter pullback for arithmetic consumers, with nonvanishing stated as a hypothesis.

AI assistance: Codex (GPT-6) ported the accepted material, checked source and supplier contracts, and audited the mathematics and Lean signatures.

## Suppliers and ownership

The only dependency that is still an open new-roadmap contribution is
**AlgebraicModuliForArithmeticGeometry**. Its actual open-head text supplies
§§1.1–1.2 (projective quotients, twists and the coefficient Čech comparison),
§1.7 (determinantal rank loci), and §2.1 (the Hilbert functor and its finite
locally free subfunctor). The two initially unresolved qualified names were
roadmap declarations, not pinned library declarations. Their exact spellings
are retained in the supplier prose with their section, without presenting them
as pinned namespace exports.

| Supplier | Checked copy and consumed contract |
| --- | --- |
| Mathlib | Manifest revision `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; native bounded and homogeneous polynomial submodules, support basis, partial derivatives, square-zero algebra, CRT, matrix rank, grid vanishing and principal spectra. |
| Tau Ceti | Manifest revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; total-degree inclusion/span, relative differentials, affine differential sections and Zariski tangent carriers. These are README proof inputs, so no unused module is imported into the acceptance test. |
| AlgebraicVectorBundles | Main, §L0B: finite locally free sheaves, affine finite-projective equivalence, tensor/pullback/rank comparison. |
| DiophantineApproximationAndTranscendence | Main, §2.7: one-block specialization of block homogenization, coefficients, linearity, homogeneity and both inverse identities. |
| SchemeAndStackFoundations | Main, §0.28: affine quotient and sheafification comparisons; §2.6: projective cohomology; §4.12: generic flatness; §5.12: Bézout with proper-intersection equality hypotheses. |
| IntegralLattices | Main, Layer 0: ownership boundary for general integral lattice theory; no integral lattice carrier is rebuilt. |

Object searches used the roadmap index across all 336 indexed open contributions
and main, the board packages, the supplied open-head models and the pinned
Mathlib/Tau Ceti sources. The searched objects included bounded monomial
coordinates and their metric, homogenization, first jets, square-zero point
quotients, residual/trace sequences, relative generic smoothness, finite locally
free pushforward, cotangent-line direction families, Veronese tangents,
Terracini/contact incidence, cubic subspace recursions, Horace induction,
universal minors and integer boxes. No retained declaration uses a fully
qualified name owned by another readable roadmap.

Two overlaps are later consumers, not suppliers:

- ArithmeticStatisticsPartV §3.28, its interpolation target
  FieldStatistics.doublePointInterpolation, repeats the Alexander–Hirschowitz
  input and the Horace/cubic route. It occurs later in the merge order. This
  roadmap owns that general interpolation development; the arithmetic target
  can consume Layers 1–5 rather than become an upward dependency.
- LefschetzPencilsAndVanishingCycles §3.4, its Veronese morphism, closed-immersion
  and hyperplane-pullback targets, also occurs later. The complete-monomial
  Veronese construction needed here is therefore a target in §3.2 here, with
  its API, Checks and normalized symmetric-power comparison. No declaration
  is given the later roadmap's namespace.

The brief's later AlgebraicModuliForArithmeticGeometryPartII supplies no input
to this roadmap. The package's six proposed Part II contracts are instead
owned here: Cartier residual and trace (§2.2), finite locally free pushforward
and relative generic smoothness (§2.0), the universal length-two direction
family (§2.4), plane singular-curve incidence (§3.2), and compatible mixed
specialization (§4.3). These general statements preserve the package contracts;
no separate Part II document is presumed to deliver them.

No existing Lean statement was deleted for duplication. The package already
consumed Euler's identity, the restricted support basis, native CRT and grid
vanishing; those ownership exclusions remain in Scope and ownership. The
homogenization item remains only the native-carrier adapter of its main-roadmap
supplier. There is no second generic projective bundle, Hilbert functor,
determinantal locus, differential sheaf, or tangent carrier.

## Lean and README changes

Nothing moved from Lean to the README: all 25 package declarations already
satisfied the acceptance-test restrictions, and all were retained. The three
added deep headlines are planeDoublePointRank, cubicDoublePointRank and
quarticDoublePointRank. They use the existing firstJetMatrix and need no new
supporting definitions. Their exceptional counts and field generality are
spelled out in their README targets. The projective contact, differential
Horace and unbounded cubic recursion headlines remain explicitly identified
as unavailable on the intended projective-section/incidence carriers at the
pins, with the missing interfaces named in the module docstring.

The original 78 bold mathematical targets are retained, with the mixed-incidence
item renamed and relocated. The final README has 87 such targets, 72 explicit
API bullets and 92 discriminating Checks. It retains every worked example,
finite base, source locator, supplier boundary and the opening Summary.
The selected-minor, evaluation-prime and projective-distinctness definitions
now have explicit topic labels; their APIs remain prose bullets and their
Checks claim no Lean counterparts.

## Mathematical corrections and clarifications

1. Replaced the six unprovided Part II requests by owned, sourced layer targets.
   The Cartier statement is general on a locally Noetherian scheme and carries
   its invertible twist and actual source/target maps; base change is qualified.
   Finite locally free pushforward keeps arbitrary parameter base change.
2. Moved compatible mixed specialization from foundational Layer 2 to §4.3,
   after the actual support families and successful residual/trace setup exist.
   Removed irrelevant residual-sequence prerequisites from Layer 1. The mixed
   diagram still has to dominate its prescribed mixed strata and factor
   through the bad locus; properness along a trait does not replace that theorem.
3. Used the pinned differential and tangent carriers. At the generic point of
   A¹ the absolute local-ring cotangent dimension is 0, whereas the tangent at
   its geometric rational lift has dimension 1. The relative differential now
   explicitly uses X_Ω and Y_Ω at their Ω-rational points.
4. Relative generic smoothness now states the integral finite-type source
   generality of VAK line 27200. The differential assertion follows after
   restriction over the smooth locus of the target, with explicit Jacobian,
   identity/composition and rank laws. The dual-number and inseparable controls
   retain the reducedness and characteristic distinctions.
5. Added the actual Veronese morphism and pinned its polarization convention:
   symmetric coefficients (1,2,1) correspond to complete coordinates (1,1,1),
   with mixed dual pairing 1/2. Both value and derivative are 2·(1/2)=1.
   Without this convention an identification by plain coefficient dot product
   would give the wrong mixed value.
6. Made F≠0 explicit before discussing its singular divisor. The plane
   numerical reduction explicitly has d≥5 and concludes d=6; small degrees
   remain the separate bases. The tangent/secant assertions carry d,q≥1,
   and generic quadrics carry r≥1, excluding impossible distinct tuples in P⁰.
7. The dense-chart target now explicitly assumes that the projective rank
   locus is nonempty in an arbitrary degree; §4.8 supplies this for d≥5.
   The quartic zero vanishing system is described as a zero vector space,
   rather than as an empty residual scheme.
8. The homogeneous-form/section comparison retains the supplier's full
   commutative-ring generality. The rank-in-family statement states its
   finite-dimensional source system, invertible sheaf and arbitrary parameter
   scheme. Trait limits keep distinct supports throughout and require support
   components of positive dimension, where length-two directions exist.
9. Preserved the accepted cubic base counts: r=5 has three on-space and six
   outside supports plus the transverse length-two remainder, trace length 1;
   r=7 has seven on-space and eight outside supports with no remainder.
   Corrected inherited missing spaces and replaced source line locators with
   locators checked against the same-hash legal texts.

## Elaborated signatures

A scratch file containing the final module and `#check @name` for every one of
its 28 declarations elaborated successfully. I compared every elaborated type
with the corresponding README statement; none lost a section binder and no
binder repair was needed. Every essential field, characteristic, degree bound,
incidence, injectivity condition and exception is in the declaration's own
signature. The three additional headlines likewise retain CharZero and their
exact numerical exclusions. All 28 own names appear in README backticks.

| Declaration | Elaborated inputs compared with README |
| --- | --- |
| Bounded | CommRing R; r,d natural; native bounded submodule. |
| Monomials | r,d natural; finitely supported nonnegative exponents with total sum≤d. |
| monomialsFintype | r,d natural; no coefficient hypothesis. |
| JetRows | n,r natural; Fin n×Option(Fin r). |
| jetAlgebra | CommRing R; r natural; actual point P. |
| doubleIdeal | CommRing R; n,r natural; arbitrary tuple P, repetitions allowed. |
| doublePointQuotient | Field k; n,r; P and explicit Injective P; equivalence marked by its value on every quotient class. |
| firstJetMap | CommRing R; n,r; P,d; value and native partial derivatives. |
| firstJetMatrix | CommRing R; n,r; P,d; the same monomial/row indices. |
| WellPoised | Field k; n,r; P,d; surjectivity of firstJetMap. |
| nearExceptionRanks | The twelve specified rational tuples and exact ranks. |
| sexticPlane | q∈{9,10}; rational supports; rank min(28,3q). |
| planeDoublePointRank | Field k, CharZero k; d,q≥0; (d,q)≠(2,2),(4,5). |
| ProjectivelyDistinct | Field k; r; arbitrary index universe ι; nonzero representatives and proportionality condition. |
| threeSubspaceCubicBases | r∈{5,6,7}; rational spaces of dimension r−2, pair spans, triple intersection, nine distinct projective supports and stated incidences. |
| twoSubspaceCubicBases | r∈{5,7}; two rational spaces, r−2 supports on each and three outside, all stated incidences. |
| oneSubspaceCubicBases | Conjunction of r=5 and r=7; dimensions 3 and 5; 3/6 and 7/8 support split; Q,w and transversality only in r=5. |
| cubicDoublePointRank | Field k, CharZero k; r≥2, q≥0; (r,q)≠(4,7). |
| quarticFive | 21 rational supports in affine five-space, injective, rank 126. |
| univariateHermiteRank | Field k of any characteristic; explicit injective tuple P; d arbitrary. |
| quarticDoublePointRank | Field k, CharZero k; r≥5 and q≥0. |
| genericDoublePointRank | Field k, CharZero k; r≥1, d≥5; q≥0. |
| universalJetMatrix | r,n,d natural; integer-polynomial coefficient ring. |
| selectedMinor | n,r; d; actual embedding of jet rows into monomials. |
| evaluationPrime | Field k; n,r; actual tuple P; native spectrum point. |
| integerGridForMinor | Field k, CharZero k; n,r,d arbitrary; column embedding and nonzero selected minor. |
| genericAffinePrincipalOpen | Field k, CharZero k; r,n≥1; d≥5; n(r+1)≤choose(r+d,d). |
| parameterPullback | Field k, CharZero k; finite parameter type S in its own universe; actual θ, nonzero pullback and coordinate degree bounds B. |

## Source and pinned-library evidence

The legal PDFs fetched for BO, COU and VAK have exactly the hashes in
`packages/GenericDoublePointInterpolation/sources.toml`. Their source lines
below use the layout-preserving text of those files. Published theorem/page
locators remain alongside the line locators in the roadmap. Statements are
paraphrased; no source passage was copied into the roadmap.

| Source locator | Claim inspected |
| --- | --- |
| BO line 18 | Alexander–Hirschowitz statement, characteristic zero and exception list. |
| BO line 119 | Veronese tangent/annihilator identification. |
| BO line 131 | First Terracini lemma and secant-incidence differential. |
| BO line 205; BO line 245 | Contact locus, double curve and the plane numerical bound. |
| BO line 264 | Low-degree exceptions, including the quadric radical calculation. |
| BO line 358; BO line 389 | Ordinary Horace hypotheses, Cartier restriction sequence and global-section inequality. |
| BO line 461; BO line 466; BO line 492; BO line 517 | Cubic theorem and three-, two- and one-subspace recursions, including their r=5,7 bases. |
| BO line 602 | Curvilinear criterion and its proof for a kernel linear system. |
| BO line 733 | All three division inequalities, with u an integer. |
| BO line 764; BO line 773; BO line 791; BO line 812 | Differential step and the three predecessor uses. |
| BO line 846; BO line 854; BO line 858; BO line 914 | Closed bad-rank inequality, mixed limit, residual lower bound and the overfilled restriction. |
| BO line 920; BO line 930; BO line 932; BO line 943 | Quartic schedule, dimension-seven ordinary branch, dimension-five base and univariate interpolation. |
| COU line 167; COU line 179 | Bounded monomials, chart sections, squared point scheme and first-jet matrix. |
| COU line 229; COU line 240 | Coordinate minor degree, bounded integer box and coefficient metric. |
| VAK line 14012; VAK line 22730; VAK line 22798; VAK line 27200 | Smooth presentation, relative differentials, conormal of the diagonal and relative generic smoothness. |

At the pins I inspected the following native definitions rather than assuming
extra structure. `MvPolynomial.basisRestrictSupport` has representation
`AddMonoidAlgebra.supportedEquivFinsupp s` in
`Mathlib/RingTheory/MvPolynomial/Basic.lean`, line 95. The bounded submodule
is defined there at line 164 and its membership/total-degree equivalence at
line 174; it carries neither a metric nor an interpolation hypothesis.
`TrivSqZeroExt` is the product carrier in
`Mathlib/Algebra/TrivSqZeroExt/Basic.lean`, line 67, with infinitesimal-product
vanishing at line 452. The local-ring tangent carrier is explicitly a dual of
m/m² in `TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean`, line 65; it does
not by itself give the relative tangent space at a nonclosed point.

The exact pinned CRT declaration is in
`Mathlib/RingTheory/Ideal/Quotient/Operations.lean`, line 248; it assumes
pairwise comaximality. Grid vanishing is in
`Mathlib/Combinatorics/Nullstellensatz.lean`, line 62; it assumes a domain and
strictly more evaluation values than the degree in each coordinate. Euler's
identity is in `Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean`, line 73;
it holds for commutative semirings including degree zero, while deducing F=0
from its partials needs nonzero degree invertible in the field. The absolute
smooth-locus theorem is in
`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`, line 361; it assumes
reducedness and local finite presentation over a perfect field.

## Adversarial mathematics pass

Every numerical entry below was recomputed by polynomial substitution, quotient bases, integer arithmetic, or modular row reduction. These finite tests check statements and conventions; they are not proofs of the admitted unbounded geometric theorems. In particular the mixed diagram is a construction target, not a consequence asserted from properness alone.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Binomial count of bounded monomials | r=0,d=2; r=2,d=0; r=d=2 | 1=choose(2,2); 1=choose(2,0); 6=choose(4,2), versus 9 with coordinatewise bounds | Retained |
| Dimension of bounded polynomials | k=Q; r=0,d=2; r=d=2 | dimensions 1 and 6, equal to counts 1 and 6 | Retained |
| Coefficient coordinates | 2+3x², d=3; zero ring | (2,0,3,0) reconstructs 2+3x²; zero tuple reconstructs 0 | Retained |
| Fixed-degree homogenization | f=1+x,d=2; f=g=1+x, degrees 1,1 | H₂(f)=X₀²+X₀X₁; H₂(fg)=X₀²+2X₀X₁+X₁²=H₁(f)H₁(g) | Supplier adapter retained |
| Homogeneous forms and twisting sections | P¹_Z,d=2; P⁰_Z,d=0 | X₀X₁ restricts to x on X₀=1; rank 3=choose(3,2); rank 1=choose(0,0) | Generalized coefficients to every commutative ring |
| Coefficient Gram form | 2+x,3-x; x,y; zero polynomial | G=6-1=5; G(x,y)=0; G(x,x)=1; G(2+x,2+x)=5>0; G(0,0)=0 | Spacing repaired |
| First-jet algebra evaluation | x² at 3; C7; x² at 0 over F₂ | (9,6); (7,0); (0,0), using ordinary derivatives | Retained |
| Kernel of one first jet | P=0; f=x,x²; r=0 | jet(x)=(0,1)≠0; jet(x²)=0; kernel (x²); r=0 kernel 0 of identity k→k | Retained |
| Distinct point ideals and their powers | Q[x] at 0,1; Z[x] at 0,2 | 1=x-(x-1) belongs to sum; in Z[x], sum (x,2) has quotient F₂, 1≠0 | Field hypothesis retained |
| Squared union ideal | supports 0,1; repetition 0,0; empty tuple | (x²(x-1)²); (x²); empty intersection top, square top | Retained |
| Double-point quotient comparison | x at 0,1; product x·x; n=0 | jets ((0,1),(1,1)); squares ((0,0),(1,2)) agree with x²; empty algebras dimension 0=0 | Retained |
| Length of distinct double points | r=2,n=1; r=1,n=2; n=0 | 3=1(2+1); 4=2(1+1); 0=0(r+1) | Retained |
| Bounded first-jet evaluation | P=0 in A²,d=1; P=3, f=2+x | matrix I₃; J(2+x)=(5,1) | Retained |
| Value projection | x at 0,1; empty tuple | (0,1)=None projection of ((0,1),(1,1)); empty target dimension 0 | Retained |
| Derivatives of vanishing polynomials | P=0,d=2; f=x,x²; constants | value 0 for both, derivatives 1 and 0; constant value kernel dimension 0 | Retained |
| Surjectivity through the value kernel | P=0,r=1,d=1 and d=0 | d=1: total/value/kernel-derivative ranks 2/1/1; d=0: 1/1/0, so true iff true and false iff false | Both directions checked |
| Monomial first-jet matrix | P=3,d=1; coefficients of 2+x | [[1,3],[0,1]](2,1)=(5,1)=J(2+x) | Retained |
| Full row rank criterion | r=2,n=1,d=1 and d=0 | ranks 3 and 1 against 3 rows; onto iff 3=3, fails iff 1<3 | Both directions checked |
| Well-poised double points | one origin,d=0,1,2; supports 0,1,d=3,4 | ranks 1,2,2 against target 2; two-point ranks 4,4; permutations keep rank 4 | Retained |
| Restriction to projective double points | P=[1:3],F=X₀²+X₀X₁; d=2 | chart f=1+x gives (4,1); homogeneous F gives value 4 and chart derivative 1 | Trivialization fixed |
| Finite locally free pushforward of a line bundle | B=k×k; A=k[ε]/ε²; empty scheme | k² has rank 2; base change A² then k² has rank 2; empty rank 0 | Own target replaces extension contract |
| Relative generic smoothness | A²→A¹; x↦x² over Q and F₂; generic point of A¹ | projection rank/kernel 1/1; x² at 1,0 has ranks 1,0; F₂ ranks 0; generic absolute tangent 0 versus geometric relative tangent 1 | Own target, general integral source; geometric-point convention corrected |
| Restriction rank of a finite scheme | one double origin A²,d=1; D=0; empty | 3=3-0=min(3,3); 0=0-0; empty rank 0 | Retained |
| Restriction rank on disjoint unions | A={0},B={1}, degree≤1 and constants | 2=1+1; for constants 1=1+0 on B-vanishing kernel | Retained |
| Cartier residual and trace | Q[x,y],I=(x,y)²,H=(y); identity and empty divisor | (I:y)=(x,y); trace (x²); lengths 3=1+2; H empty gives residual X and trace empty | General target replaces extension contract; flat base change qualified |
| Finite-scheme residual and trace | double origin A³; transverse and tangent directions | 4=1+3; 2=1+1; 2=0+2; empty 0=0+0 | Retained |
| Castelnuovo dimension bound | A² double origin,d=1 and d=2 | d=1 kernel 0≤0+0; ranks 3≥1+2=3; d=2 kernel 3≤2+1=3 | Retained |
| Ordinary Horace criterion | r=1,d=3,q=2,u=1 | trace/residual lengths 1,3 equal dimensions 1,3; total rank 4=min(4,4) | Retained |
| Independent subschemes | A² origin,d=1; double point→simple point; add extra support | ranks 3→1 with lengths 3→1; zero kernel remains zero when adding conditions | Retained |
| Curvilinear criterion at one support | k⊕kx⊕ky; D=span(1,x) and D=all | full ranks 2<3 versus 3=3; y-direction rank 1<2 versus 2=2 detects failure | Both directions checked |
| Curvilinear reduction | two A¹ double supports,d=2,3 | each local length-two test is full local double; global ranks 3<4 and 4=4 | Retained |
| Universal length-two direction family | A² origin; point; A¹; dual-number parameter | ideals (y,x²) and (y-x,x²), both length 2; zero-dimensional directions empty; A¹ direction P⁰; after base change rank 2 | Own target replaces extension contract |
| Rank in flat point families | matrix [t] at t=1 and t=0 | ranks 1→0; determinant-open D(t) contains 1 and excludes 0 | Retained |
| Proper limits of curvilinear failures | δ(t)=(0,t), vertical direction; coincident-support control | generic and special length 2, special residual/trace 1/1; collision of two supports breaks disjoint length 2+2=4 | General trait theorem with distinct supports |
| Exact integer rank witnesses | 1×1 matrices [101] and [102]; Euler F=X² | residues 0 and 1; integer ranks both 1; nonzero residue implication only one direction; ΣX∂F=2X² | Euler imported |
| Quadrics with prescribed singular points | r=2,q=0,1,2,3; char 2 control | kernel dimensions 6,3,1,0=choose(4-q,2); over F₂, all partials of X² vanish despite value 1 at X=1 | Characteristic-zero symmetric-form route retained |
| Low-degree near-exception ranks | the twelve rational configurations | ranks 9,10,20,30,35,120; 12,15,32,35,65,70, equal to min(source,rows) | 22-witness table gives nonzero minors |
| Veronese morphism and tangent spaces | P¹,d=0,1,2; [1:1],[2:2] | d=2 outputs (1,1,1),(4,4,4); d=1 identity; d=0 both map to [1]; chart derivative at 0=(1,0) | Explicit construction/API added |
| Veronese tangents and double-point conditions | v=e₀,r=1,d=2; F=aX₀²+bX₀X₁+cX₁² | tangent span X₀²,X₀X₁; annihilator a=b=0 gives cX₁², dimension 1 | Retained |
| Terracini span for the Veronese family | conic in P²,q=1,2 | affine tangent-span ranks 2 and 3; secant projective dimensions 1 and 2; +1 agrees | Retained |
| Plane singular-curve incidence | line F=x and double line F=x²; ℓ=1,2 | normal derivatives 1 and 2x; square containment fails/passes; support bounds 2 and 5 | Own target replaces extension contract |
| Contact curve in the defective plane case | five general points on conic, d=4 | kernel dimension 1; double conic degree 4=2·2; q=5=2(2+3)/2 | Nonzero form and d,q≥1 made explicit |
| Plane contact numerical reduction | d=5,6,7,8 | q=7,9,12,15; ℓ-bound 5,9,9,14; only 9≤9 survives | d≥5 made explicit in this reduction |
| Exact sextic plane critical ranks | q=9,10 | ranks 27 and 28=min(28,27),min(28,30) | Retained |
| Plane interpolation input | d=0,q=0,1; d=2,q=2; d=4,q=5 | ranks 0,1; exceptional ranks 5<6 and 14<15 | Native full-range headline added |
| Three-subspace cubic base rank witnesses | r=5,6,7 | containment ranks 30,57,93; final ranks 56,84,120; kernels 0 | Retained, recomputed |
| Three-subspace cubic recursion | base r=5,6,7; residual quadrics r=8 coordinate general model | cubic kernels 0,0,0; in nine variables split into three blocks of three, the three pair-block coordinate spaces cover all 45 quadratic monomials, kernel 0 | Base values checked; no claim to prove unbounded induction |
| Two-subspace cubic base rank witnesses | r=5,7 | containment 20,66; final 56,120; omitted outside supports leave at least 18,24 coefficients | Retained |
| Two-subspace cubic recursion | r=3; r=6 count split | r=3 gives five general double supports, rank 20=choose(6,3); r=6: four supports per space split 1+3, plus 3 outside, matching trace/kernel counts | Retained |
| One-subspace cubic base rank witnesses | r=5,7 | r=5 ranks 10→55→56, value at Q adds 0, derivative adds 1; r=7 ranks 35→120 | Accepted support counts preserved |
| One-subspace cubic recursion | r=5,7,8 | on/off/remainder counts 3/6/2; 7/8/0; 9/9/3; r=8 trace length 2=3-1 | Retained |
| Cubic critical-count remainder | r=2,3,4,5,7,8 | (q,δ)=(3,1),(5,0),(7,0),(9,2),(15,0),(18,3); r=4 excluded despite δ=0 | Retained |
| Cubic maximal-rank input | r=2,q=3,4; r=4,q=6,7,8 | ranks 9,10; 30,34,35 against maxima 30,35,35 | Native headline added with exact exception |
| Quartic P⁵ critical rank | r=5,d=4,q=21 | 126=choose(9,4)=21·6 | Retained |
| Horace trace-size inequality | r=3,d=6,q=21; precritical r=2,d=4,q=0 | u=9,e=1: 12≤21; u=-5,e=0: -5≤4 | Negative integer u retained |
| Horace residual-size inequality | same two cases | N(3,4)=35≤11·4=44; N(2,2)=6≤5·3=15 | Retained |
| Large-dimensional quartic residual bound | r=10,d=4,q=91 | u=71,e=5; residual supports 15≥11 | Retained |
| Nonnegative critical Horace data | r=3,d=6,q=21; q=0 negative control | u=9≤21 and residual 11≥0; precritical u=-19 violates nonnegativity | Critical range retained |
| Mixed residual rank in degree d−1 | r=3,d=6,q=21,u=9,e=1 | rank (21-9)4-1=47; N(3,5)=56; kernel 56-47=9 | Retained |
| Injective residual restriction to H | same data; degree d−2=4 | N(3,4)=35; 11 doubles give 44 conditions, max rank 35, kernel 0 | Retained |
| Killing a residual system with simple points | same data | residual dimension 9; nine general simple conditions give 9-9=0; total 47+9=56 | Retained |
| Underfilled trace with simple remainder | same data | trace 3·9+1=28=N(2,6); subset with no simple point has rank 27 | Retained |
| Moving supports and hyperplanes | δ(t)=(a,t),H_t=(y=t) | at 0: (a,0), y=0; at 1: (a,1), y=1; quotient lengths 3 and 2 at both | Retained |
| Compatible bad-incidence specialization | e=0; e=2 with F={1},G={2}; graph [s:t] | e=0: rank 0<0 false, W empty; mixed residual lengths 1+2=3, trace 1+0=1; axis limits [0:1]≠[1:0] | Owned theorem, moved to §4.3; pointwise properness does not prove compatibility |
| Transverse curvilinear limit rank | r=3,d=6,q=21,u=9,e=1,f=1,g=0 | residual 9+44+1=54; trace 27+1=28; total 82=(21-1)4+2 | Retained subset rank, no double counting |
| Tangent directions in the moving residual | same data,f=0,g=1 | residual 9+44+2=55; trace 27; total 82; filled system has 56 conditions | Retained |
| Underfilled differential Horace contradiction | same critical data | closed bad rank ≤81 versus lower rank 82; impossible 82≤81 | Retained |
| Overfilled partial-length reduction | r=3,d=4,q=9,u=5,e=1,ν=0 | 0≤0<1; partial length 35=35; full length 36>35 | Retained |
| Overfilled differential Horace contradiction | same partial-length configuration, F⊆Γ₀, ∣Γ₀∣=0 | partial target length 35=35; independent rank 35 gives kernel 0, and enlarging to full length 36 keeps kernel 0 | Retained |
| Differential Horace induction step | r=3,d=6,q=21 | predecessors (2,6,9),(3,5,12),(3,4,11) have maxima 27,48,35; target 84=21·4 | Retained |
| Univariate Hermite interpolation | F₂ supports 0,1,d=0,1,2,3; empty tuple | ranks 1,2,3,4=min(d+1,4); n=0 rank 0 at every d; no factorial divisions | Retained |
| Quartic P⁷ ordinary Horace input | q=41,42,u=30 | trace 210=30·7; residual 118≤120 and 126≥120; total ranks 328 and 330 | Retained |
| Quartic induction inputs | r=5,6,8,9 critical counts | r=5 rank 126; r=6,q=30 data (21,0); r=8,q=55 data (41,2); r=9,q=71,72 data (54,4),(55,5) | Native headline added |
| Exception-avoiding induction schedule | r=3,d=5,q=14; r=3,d=6,q=21 | predecessors (2,5,7),(3,4,7),(3,3,7); and (2,6,9),(3,5,12),(3,4,11), none exceptional | Retained |
| Generic characteristic-zero double-point rank | r=1,d=5,q=0,1,4; excluded r=0,q=2 | ranks 0,2,6=min(6,0),min(6,2),min(6,8); r=0 allows only one support | Retained |
| Passing to the dense affine chart | one point [1:0]; excluded point [0:1] | X₀ coordinate 1≠0 vs 0; chart [1:a] dehomogenizes to a; chart intersects nonempty rank open | Retained |
| Universal first-jet matrix | r=n=d=1; x² at T=3 | U=[[1,T],[0,1]]; det 1; x² column (9,6) | Retained |
| Degree of a first-jet minor | r=n=1,d=1; n=2,r=1,d=3; zero minor | Δ=1 has degree 0≤2; two-point Δ=(b-a)^4 has degree 4≤12; degree(0)=0≤md | Retained total-function convention |
| Principal-open full-jet locus | Δ=1; Δ=T; Δ=0 | D(1) all points; T evaluates 0 at origin and 1 at 1; D(0) empty; no nonzero-evaluation point at Δ=0 | Retained |
| Bounded integer specialization | n=r=1,d=5, cols 1,x; n=0 | B=10; P=0 lies in [0,10], Δ=1≠0, rank 2; empty determinant 1 and B=0 | Retained |
| Nonzero maximal minor | same one-point endpoint | two selected columns give Δ=1; all six columns not selected simultaneously; existence uses 2≤6 | Retained existential choice |
| Generic affine Hermite interpolation | r=n=1,d=5 | m=2≤6; Δ=1; origin belongs to D(1); rank 2=target dimension | Retained |
| Polynomial parameter pullback | θ(s)=s²; cols 1,x; constant parameter set empty | Δ∘θ=1, degree 0, choose s=0 with B_s=0; configuration (0), rank 2; empty S has one assignment | Retained nonzero-pullback hypothesis |
| Special collinear configurations fail | seven points (i,0), degree 5 | x-slice rank 6 + normal-slice rank 5 =11<21 | Retained |
| Projectively distinct supports | e₀,e₁; e₀,2e₀; singleton 0 | pair ranks 2 and 1 give true and false; singleton zero fails nonzero clause | Retained real-bodied predicate |
| Selected determinant | cols (1,x) and (x,1); two supports 0,0 and 0,1 | determinants 1,-1,0,1; two-point determinant (b-a)^4 | Retained; API bullets made explicit |
| Evaluation prime | Q[T] at 0,1; no variables | evaluation kernels (T),(T-1); no variables kernel 0; T evaluations 0,1 | Retained; API bullets made explicit |
| Bounded / Monomials / monomialsFintype | r=0,d=0 and r=2,d=2 | one constant coordinate and six quadratic coordinates; coordinatewise wrong count 9 | Real bodies retained |
| JetRows | n=0; n=r=1; n=2,r=2 | cardinalities 0,2,6 = n(r+1) | Real body retained |
| ProjectivelyDistinct | empty; singleton 0; e₀,e₁; e₀,2e₀ | true; false; pair rank 2 gives true; pair rank 1 and scalar 1/2 give false | Real body retained |
| selectedMinor | n=r=1,d=1; n=2,r=1,d=3 | column orders (1,x),(x,1) give 1,-1; supports 0,0 give 0; supports 0,1 give 1 | API made bullet list |
| evaluationPrime | Q[T] at 0,1; no variables | kernels (T),(T-1); T evaluates 0,1; no variables gives kernel 0 in k | API made bullet list |
| Characteristic and coefficient convention | x² at 3 over Q,F₂,F₃; zero ring | jets (9,6); (1,0); (0,0); zero ring jet 0 | Algebraic formulas remain characteristic free |
| Projective dimensions and length convention | r=2, full double and hyperplane double | ambient length 3; trace length 2; residual length 1, so 3=1+2 | Retained |
| Maximal rank versus independence | r=1,d=5,q=4 | rank 6=min(6,8), kernel 0 but cokernel dimension 2 | Overfilled wording retained |
| Integer Euclidean division convention | r=2,d=4,q=0 | dividend -10; u=-5,e=0 gives -10=2(-5)+0; natural subtraction would give 0 | Retained |
| Geometric-point tangent convention | generic point of A¹_k and its Ω-rational lift | absolute m/m² dimension 0; tangent of A¹_Ω at rational lift dimension 1 | Corrected |
| Universe and empty parameter convention | Fin 0, empty S, zero coefficient ring | one empty coordinate assignment; monomial set cardinality 1; zero coefficient module has one element | Made explicit |

### API identities

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| Binomial count of bounded monomials, API 1: The Some j coordinate recovers the original exponent α_j. | α=(1,1),d=2 gives Some coordinates (1,1)=(1,1) | Consistent with the stated hypotheses. |
| Binomial count of bounded monomials, API 2: The None coordinate is the nonnegative slack exponent d−∣α∣, using ∣α∣≤d. | None exponent 2-(1+1)=0 | Consistent with the stated hypotheses. |
| Binomial count of bounded monomials, API 3: The sum of all homogeneous exponents is d, so deleting None recovers a bounded exponent. | homogeneous vector (0,1,1) has sum 2; inverse (1,1) has weight 2≤2 | Consistent with the stated hypotheses. |
| Coefficient coordinates, API 1: c_d(f)(α)=coeff_α(f). | coefficients of 2+x are (2,1) | Consistent with the stated hypotheses. |
| Coefficient coordinates, API 2: c_d⁻¹(a)=Σ over α∈A(r,d) of a_α X^α. | inverse of (2,1) is 2·1+1·x=2+x | Consistent with the stated hypotheses. |
| Coefficient coordinates, API 3: f=g iff c_d(f)=c_d(g). | 2+x and 3+x have unequal constant coordinates 2≠3; equal (2,1) reconstructs equal polynomials | Consistent with the stated hypotheses. |
| Fixed-degree homogenization, API 1: X^α maps to X₀^(d−Σα)X^α. | x² at d=2 maps to X₁²; x maps to X₀X₁ | Consistent with the stated hypotheses. |
| Fixed-degree homogenization, API 2: Setting X₀=1 is the inverse on degree-d homogeneous forms. | X₀X₁ at X₀=1 is x; H₂(x)=X₀X₁ | Consistent with the stated hypotheses. |
| Fixed-degree homogenization, API 3: H(d+e)(fg)=H_d(f)H_e(g), for f∈V_d and g∈V_e; targets have different degrees. | H₂((1+x)²)=X₀²+2X₀X₁+X₁²=H₁(1+x)² | Consistent with the stated hypotheses. |
| Coefficient Gram form, API 1: G(f,g)=Σ coeff_α(f)coeff_α(g). | G(2+x,3-x)=2·3+1·(-1)=5 | Consistent with the stated hypotheses. |
| Coefficient Gram form, API 2: For real f≠0, G(f,f)>0. | G(2+x,2+x)=4+1=5>0; G(0,0)=0 | Consistent with the stated hypotheses. |
| Coefficient Gram form, API 3: For the transported Euclidean norm, c_d is an isometry and the integral coordinates are Z^A(r,d). | both squared norms are 5; coordinates (2,1) are integral | Consistent with the stated hypotheses. |
| First-jet algebra evaluation, API 1: fst(jetAlgebra_P(f))=eval P f. | x² at 3 has scalar 9=3² | Consistent with the stated hypotheses. |
| First-jet algebra evaluation, API 2: snd(jetAlgebra_P(f))(j)=eval P(pderiv j f). | x² at 3 has infinitesimal coefficient 6=2·3 | Consistent with the stated hypotheses. |
| First-jet algebra evaluation, API 3: jetAlgebra_P(X_j)=(P_j,e_j). | x at 3 gives (3,1); y at origin in A² gives (0,e_y) | Consistent with the stated hypotheses. |
| Squared union ideal, API 1: doubleIdeal(P)=(⋂ ker(eval P_i))². | at 0,1, square of intersection (x(x-1)) gives (x²(x-1)²) | Consistent with the stated hypotheses. |
| Squared union ideal, API 2: Over a field with injective P, doubleIdeal(P)=⋂ (ker(eval P_i))². | intersection (x²)∩((x-1)²) equals (x²(x-1)²) over Q | Consistent with the stated hypotheses. |
| Squared union ideal, API 3: Permuting the finite tuple leaves doubleIdeal unchanged. | both orders (0,1) and (1,0) give (x²(x-1)²) | Consistent with the stated hypotheses. |
| Double-point quotient comparison, API 1: The class of f maps to its tuple of native first jets. | class of x at 0,1 gives ((0,1),(1,1)) | Consistent with the stated hypotheses. |
| Double-point quotient comparison, API 2: Multiplication is the native square-zero multiplication in each factor. | squaring gives ((0,0),(1,2)), the jets of x² | Consistent with the stated hypotheses. |
| Double-point quotient comparison, API 3: A tuple permutation commutes with the induced product-factor permutation. | swapping supports gives ((1,1),(0,1)), the swapped product tuple | Consistent with the stated hypotheses. |
| Bounded first-jet evaluation, API 1: J(f)_i(None)=eval P_i f. | x² at 3, None entry 9 | Consistent with the stated hypotheses. |
| Bounded first-jet evaluation, API 2: J(f)_i(Some j)=eval P_i(pderiv j f). | x² at 3, Some entry 6 | Consistent with the stated hypotheses. |
| Bounded first-jet evaluation, API 3: The α column is P_i^α in the value row and α_jP_i^(α−e_j) in derivative row j; zero exponent gives zero. | constant column (1,0); x column (3,1); x² column (9,6) | Consistent with the stated hypotheses. |
| Value projection, API 1: valueMap(f)(i)=eval P_i f. | x at supports 0,1 gives (0,1) | Consistent with the stated hypotheses. |
| Value projection, API 2: valueMap is the None-row projection of J. | None projection of ((0,1),(1,1)) is (0,1) | Consistent with the stated hypotheses. |
| Value projection, API 3: f∈ker(valueMap) iff every f(P_i)=0. | at 0, x has value 0 and lies in kernel; 1 has value 1 and is outside | Consistent with the stated hypotheses. |
| Derivatives of vanishing polynomials, API 1: The (i,j) coordinate is ∂_j f(P_i). | at 0, x maps to 1 and x² maps to 0 | Consistent with the stated hypotheses. |
| Derivatives of vanishing polynomials, API 2: It equals the Some-row projection of J on ker(valueMap). | Some projection of jet(x)=(0,1) equals 1 | Consistent with the stated hypotheses. |
| Derivatives of vanishing polynomials, API 3: Permuting points permutes the derivative target coordinates. | x(x-1) derivatives at 0,1 are (-1,1); after swap (1,-1) | Consistent with the stated hypotheses. |
| Monomial first-jet matrix, API 1: The None row at α equals P_i^α. | x² value entry at 3 is 9 | Consistent with the stated hypotheses. |
| Monomial first-jet matrix, API 2: The Some j row equals α_jP_i^(α−e_j), with zero when α_j=0. | x² derivative entry at 3 is 6; constant derivative at 0 is 0 | Consistent with the stated hypotheses. |
| Monomial first-jet matrix, API 3: firstJetMatrix(P,d)·c_d(f)=J(P,d)(f). | [[1,3],[0,1]](2,1)=(5,1)=J(2+x) | Consistent with the stated hypotheses. |
| Well-poised double points, API 1: WellPoised(P,d) iff Surjective(J(P,d)). | origin, d=1: rank 2=target 2, predicate true; d=0: 1<2, false | Consistent with the stated hypotheses. |
| Well-poised double points, API 2: WellPoised is unchanged under a permutation of points. | supports 0,1 in either order, d=3: rank 4=4 | Consistent with the stated hypotheses. |
| Well-poised double points, API 3: If d≤e and WellPoised(P,d), then WellPoised(P,e). | supports 0,1, degrees 3 and 4: ranks 4 and 4, target 4 | Consistent with the stated hypotheses. |
| Finite locally free pushforward of a line bundle, API 1: On Spec A with Z=Spec B and L associated to the B-module M, f_*L is associated to M viewed as an A-module. | B=k×k, M=B gives underlying k-module k² | Consistent with the stated hypotheses. |
| Finite locally free pushforward of a line bundle, API 2: If B is locally free of rank n over A and M is invertible over B, this A-module is locally free of rank n, including n=0. | rank_B M=1; rank_k B=2; rank_k M=2 | Consistent with the stated hypotheses. |
| Finite locally free pushforward of a line bundle, API 3: The base-change map identifies A'⊗_A M with the pushforward of the pulled-back line bundle and respects identity and composite base changes. | after k→A=k[ε]/ε²→k: ranks 2→2→2; identity base-change matrix I₂ | Consistent with the stated hypotheses. |
| Relative generic smoothness, API 1: For an affine polynomial map its tangent map is multiplication by the Jacobian evaluated at the geometric point. | x↦x² at 1 has Jacobian [2] and tangent rank 1 | Consistent with the stated hypotheses. |
| Relative generic smoothness, API 2: The differential of the identity is the identity, and that of a composite is the composite, with the residue-field pullbacks included. | identity derivative 1; x²∘x² at 1 has derivative 4=2·2 | Consistent with the stated hypotheses. |
| Relative generic smoothness, API 3: On the smooth open its rank and kernel dimension have the stated values; outside that open no surjectivity is asserted. | A²→A¹ projection has rank 1, kernel 1=2-1; x² at 0 has rank 0 outside its smooth open | Consistent with the stated hypotheses. |
| Restriction rank of a finite scheme, API 1: h(X,D)=dim D−dim ker(D→H⁰(X,O(d)∣X)). | double origin A²,d=1: 3=3-0 | Consistent with the stated hypotheses. |
| Restriction rank of a finite scheme, API 2: h(X,D)≤min(dim D,length X). | 3≤min(3,3)=3; D=0 gives 0≤min(0,3)=0 | Consistent with the stated hypotheses. |
| Restriction rank of a finite scheme, API 3: h(∅,D)=0. | empty target rank 0 even from the 3-dimensional source | Consistent with the stated hypotheses. |
| Cartier residual and trace, API 1: On an affine open with H=(t), the residual ideal is `(I_X : t)` and the trace ideal is `(I_X + (t))/(t)`. | I=(x,y)²,t=y: (I:y)=(x,y), trace ideal (x²) | Consistent with the stated hypotheses. |
| Cartier residual and trace, API 2: The first map has source I_Res⊗L(-H), target I_X⊗L and is multiplication by the Cartier equation in a trivialization; the second is restriction to H. | first map x↦xy, y↦y²; second x²↦x², xy↦0, y²↦0 | Consistent with the stated hypotheses. |
| Cartier residual and trace, API 3: For flat base changes the residual and trace sequence pulls back to the corresponding sequence; arbitrary base change is claimed only when the pulled-back Cartier equation remains regular and the ideal-quotient comparison is an isomorphism. | identity and field extension preserve those three images and quotient lengths 3=1+2 | Consistent with the stated hypotheses. |
| Universal length-two direction family, API 1: The geometric fiber at a nonzero cotangent-line quotient is the length-two closed subscheme at that support with the prescribed tangent direction. | dx↦1,dy↦0 gives (y,x²), quotient basis 1,x, length 2 | Consistent with the stated hypotheses. |
| Universal length-two direction family, API 2: The quotient algebra has multiplication `(a,u)(b,v) = (ab,av+bu)`; its infinitesimal line squares to zero. | (0,ε)²=(0,0); (1,0)(0,ε)=(0,ε) | Consistent with the stated hypotheses. |
| Universal length-two direction family, API 3: The incidence quotient commutes with arbitrary parameter base change and with base extension of k; over S→Spec k use the relative diagonal and Ω¹_(X_S/S). | after k→k[δ]/δ² quotient A⊕Aε has rank 2, with ε²=0 | Consistent with the stated hypotheses. |
| Veronese morphism and tangent spaces, API 1: At a nonzero vector v its image has coordinates v^α with ∣α∣=d, modulo common nonzero scalar. | [1:2] maps to [1:2:4] in degree 2 | Consistent with the stated hypotheses. |
| Veronese morphism and tangent spaces, API 2: Rescaling v by c≠0 rescales every output coordinate by c^d, giving the same projective point; changing the monomial ordering permutes the output coordinates. | rescaling by 3 gives [9:18:36]=[1:2:4] | Consistent with the stated hypotheses. |
| Veronese morphism and tangent spaces, API 3: Pullback of O(1) is O(d), and the map is compatible with field extension and the fixed affine-chart homogenization. | O(1) transition t pulls back to t² for d=2; field extension preserves (1,2,4) | Consistent with the stated hypotheses. |
| Projectively distinct supports, API 1: Every support vector is nonzero, including in a singleton family. | singleton e₀ nonzero gives true; singleton 0 false | Consistent with the stated hypotheses. |
| Projectively distinct supports, API 2: Multiplication of each vector by its own nonzero scalar preserves the predicate. | e₀,e₁ and 2e₀,3e₁ have pair rank 2 and distinct projective images | Consistent with the stated hypotheses. |
| Projectively distinct supports, API 3: For integral support vectors viewed over ℚ, proportionality by a nonzero integer also violates the predicate at distinct indices; vector inequality alone does not establish distinct projective images. | e₀,2e₀ have pair rank 1; e₀=(1/2)(2e₀), so predicate false | Consistent with the stated hypotheses. |
| Moving supports and hyperplanes, API 1: δ_i(0)=γ_i and H_i(0)=H. | δ(0)=(a,0), H₀=(y=0) | Consistent with the stated hypotheses. |
| Moving supports and hyperplanes, API 2: The double-point and restricted double-point families have constant ranks r+1 and r over the distinct-support open. | at t=0,1 full quotient basis (1,x-a,y-t), rank 3; restricted basis (1,x-a), rank 2 | Consistent with the stated hypotheses. |
| Moving supports and hyperplanes, API 3: Any parameter base change pulls back the same squared-ideal incidence family. | t=s² pulls the ideal to (x-a,y-s²)² by both substitution and base change | Consistent with the stated hypotheses. |
| Compatible bad-incidence specialization, API 1: Its maps to B and C commute with the generic, mixed and all-zero specialization maps, and the direction family is pulled back from the universal incidence. | constant vertical direction over δ(t)=(a,t): specialization t=0 gives support (a,0) by both composites | Consistent with the stated hypotheses. |
| Compatible bad-incidence specialization, API 2: Every selected mixed stratum dominates the prescribed support stratum; its transverse indices stay transverse, and its tangent indices have the common special limit in H. | product support model (s,t)↦t is surjective, and special residual/trace lengths for F,G are (1,2)/(1,0); [s:t] has distinct axis limits | Consistent with the stated hypotheses. |
| Compatible bad-incidence specialization, API 3: Factoring through W supplies the same strict upper rank bound throughout the diagram, while the pulled-back direction schemes remain finite flat of length two with distinct supports. | for e=0 rank 0<0 has no point; for two zero section maps rank 0<4 holds on the whole direction parameter, constant length 2+2=4 | Consistent with the stated hypotheses. |
| Universal first-jet matrix, API 1: Evaluating Tᵢⱼ=P_ij in k gives firstJetMatrix(P,d). | universal x² column specialized at T=3 is (9,6) | Consistent with the stated hypotheses. |
| Universal first-jet matrix, API 2: The value entry is the product of T_i coordinates to exponent α. | T² at T=3 equals 9; constant monomial empty product equals 1 | Consistent with the stated hypotheses. |
| Universal first-jet matrix, API 3: The derivative entry is α_j times the exponent-decremented monomial, zero when α_j=0. | 2T at T=3 equals 6; x at T=0 has derivative 1; constant derivative 0 | Consistent with the stated hypotheses. |
| Selected determinant, API 1: Evaluation at any ring-valued tuple gives the selected determinant of its specialized first-jet matrix. | at T=3, det [[1,3],[0,1]]=1=eval(Δ) | Consistent with the stated hypotheses. |
| Selected determinant, API 2: Precomposing the column embedding by one transposition changes the sign, with the same row ordering on both sides. | column orders (1,x) and (x,1) give 1 and -1 | Consistent with the stated hypotheses. |
| Selected determinant, API 3: At a tuple with repeated supports and n≥2, the determinant vanishes because its value rows repeat. | two supports 0,0 give determinant 0; supports 0,1 give 1 | Consistent with the stated hypotheses. |
| Evaluation prime, API 1: The underlying ideal is the kernel of evaluation k[T]→k at P. | at 0, kernel of Q[T]→Q is (T) | Consistent with the stated hypotheses. |
| Evaluation prime, API 2: Every coordinate difference Tᵢⱼ−Pᵢⱼ evaluates to zero and belongs to that ideal. | T-0 at 0 evaluates 0; T-1 at 1 evaluates 0 | Consistent with the stated hypotheses. |
| Evaluation prime, API 3: Its point belongs to D(Δ) exactly when Δ evaluates nonzero at P. | for Δ=T, origin evaluates 0 and is outside D(T), while 1 evaluates 1 and lies inside | Consistent with the stated hypotheses. |

### Every README Check

| Check | Values recomputed | Result |
| --- | --- | --- |
| Binomial count of bounded monomials, Check 1 | r=0: d=0 gives 1=1, d=2 gives intended 1 versus spurious-variable 3 | Agrees with its target and API. |
| Binomial count of bounded monomials, Check 2 | d=0: count 1=choose(r,0) | Agrees with its target and API. |
| Binomial count of bounded monomials, Check 3 | r=d=2: six exponents, slack (2,1,1,0,0,0), count 6 versus coordinatewise 9 | Agrees with its target and API. |
| Coefficient coordinates, Check 1 | basis (1,x,y,x²,xy,y²) has 6 elements | Agrees with its target and API. |
| Coefficient coordinates, Check 2 | C7 at d=0 has coordinate 7 | Agrees with its target and API. |
| Coefficient coordinates, Check 3 | 2+3x² has coordinates (2,0,3,0) | Agrees with its target and API. |
| Fixed-degree homogenization, Check 1 | H₂(1+x)=X₀²+X₀X₁; coefficient of X₀² is 1 versus 0 for 1+X₁ over Z; zero ring both 0 | Agrees with its target and API. |
| Fixed-degree homogenization, Check 2 | H₀(7)=7; with r=0,H₂(1)=X₀² and H₀(1)=1 | Agrees with its target and API. |
| Fixed-degree homogenization, Check 3 | X₀X₁ restricts to x; degree 1≤2 | Agrees with its target and API. |
| Coefficient Gram form, Check 1 | G(x,y)=0 and G(x,x)=1 | Agrees with its target and API. |
| Coefficient Gram form, Check 2 | G(C2,C3)=6 | Agrees with its target and API. |
| Coefficient Gram form, Check 3 | 2+x gives integer tuple (2,1) and squared norm 5 | Agrees with its target and API. |
| First-jet algebra evaluation, Check 1 | jet of x at origin is (0,1)≠0 over Q; zero in the zero ring | Agrees with its target and API. |
| First-jet algebra evaluation, Check 2 | jet of C3 is (3,0) | Agrees with its target and API. |
| First-jet algebra evaluation, Check 3 | jet of x² at origin is 0, while x² mod x³ is nonzero | Agrees with its target and API. |
| Squared union ideal, Check 1 | (x²) properly contained in (x) over Q, both zero in the zero ring | Agrees with its target and API. |
| Squared union ideal, Check 2 | empty infimum top, square top, quotient dimension 0 | Agrees with its target and API. |
| Squared union ideal, Check 3 | x² mod x²=0 but x² mod x³≠0 over Q | Agrees with its target and API. |
| Squared union ideal, Check 4 | (x)+(x-2)=(x,2); its quotient F₂ has 1≠0 | Agrees with its target and API. |
| Double-point quotient comparison, Check 1 | basis 1,x-a,y-b has length 3 | Agrees with its target and API. |
| Double-point quotient comparison, Check 2 | empty quotient and empty product each dimension 0 | Agrees with its target and API. |
| Double-point quotient comparison, Check 3 | x(x-1) jets ((0,-1),(0,1)) are nonzero; square jets are zero | Agrees with its target and API. |
| Bounded first-jet evaluation, Check 1 | 1,x,y at origin give I₃, rank 3 | Agrees with its target and API. |
| Bounded first-jet evaluation, Check 2 | constants have rank 1<r+1 for r≥1; derivative coordinate 1 unattainable | Agrees with its target and API. |
| Bounded first-jet evaluation, Check 3 | x² at 3 has jet (9,6) | Agrees with its target and API. |
| Value projection, Check 1 | x at 0,1 gives (0,1) | Agrees with its target and API. |
| Value projection, Check 2 | n=0: target dimension 0 and whole source kernel | Agrees with its target and API. |
| Value projection, Check 3 | x at 0 has value 0, derivative 1 | Agrees with its target and API. |
| Derivatives of vanishing polynomials, Check 1 | x has value 0 and derivative 1 | Agrees with its target and API. |
| Derivatives of vanishing polynomials, Check 2 | constants: evaluation injective, kernel dimension 0 | Agrees with its target and API. |
| Derivatives of vanishing polynomials, Check 3 | x² has value 0 and derivative 0 while polynomial nonzero | Agrees with its target and API. |
| Monomial first-jet matrix, Check 1 | origin, columns 1,x give I₂, determinant 1 | Agrees with its target and API. |
| Monomial first-jet matrix, Check 2 | d=0 column has one value 1 and r derivatives 0 per support | Agrees with its target and API. |
| Monomial first-jet matrix, Check 3 | r=n=d=2: 2(2+1)=6 rows, choose(4,2)=6 columns | Agrees with its target and API. |
| Well-poised double points, Check 1 | one point,d=1: rank r+1=target dimension | Agrees with its target and API. |
| Well-poised double points, Check 2 | one point,d=0,r≥1: rank 1<r+1 | Agrees with its target and API. |
| Well-poised double points, Check 3 | seven collinear points,d=5: rank 11<21 | Agrees with its target and API. |
| Finite locally free pushforward of a line bundle, Check 1 | B=k×k yields k² of dimension 2 | Agrees with its target and API. |
| Finite locally free pushforward of a line bundle, Check 2 | base change A², then nonflat quotient gives k²; ranks 2,2 | Agrees with its target and API. |
| Finite locally free pushforward of a line bundle, Check 3 | empty family rank 0; identity pushforward of invertible line rank 1 | Agrees with its target and API. |
| Relative generic smoothness, Check 1 | dual numbers: tangent dimension 1 versus Krull dimension 0, smooth locus empty | Agrees with its target and API. |
| Relative generic smoothness, Check 2 | projection A²→A¹: tangent rank 1, kernel dimension 1 | Agrees with its target and API. |
| Relative generic smoothness, Check 3 | x² over Q: derivative 2 at 1 and 0 at 0; over F₂ derivative 0 everywhere | Agrees with its target and API. |
| Relative generic smoothness, Check 4 | generic absolute cotangent 0; Ω-rational lift has relative tangent dimension 1 | Agrees with its target and API. |
| Restriction rank of a finite scheme, Check 1 | simple point,constants: rank 1 | Agrees with its target and API. |
| Restriction rank of a finite scheme, Check 2 | D=0: rank 0 on length-three double point | Agrees with its target and API. |
| Restriction rank of a finite scheme, Check 3 | double point,d=1: rank 3=r+1 for r=2 | Agrees with its target and API. |
| Finite-scheme residual and trace, Check 1 | double origin A³: basis 1,x,y,z has length 4, residual 1 and trace 3 | Agrees with its target and API. |
| Finite-scheme residual and trace, Check 2 | (x,y,z²): basis 1,z has length 2, residual 1 and trace 1 | Agrees with its target and API. |
| Finite-scheme residual and trace, Check 3 | (y,z,x²): basis 1,x has length 2, residual 0 and trace 2; empty 0=0+0 | Agrees with its target and API. |
| Universal length-two direction family, Check 1 | kernels (y,x²),(y-x,x²); both length 2 and different embedded directions | Agrees with its target and API. |
| Universal length-two direction family, Check 2 | X=point: parameter empty; X=A¹: direction P⁰, quotient length 2 | Agrees with its target and API. |
| Universal length-two direction family, Check 3 | ε²=0, ε≠0; k×k has two reduced idempotent supports | Agrees with its target and API. |
| Universal length-two direction family, Check 4 | A=k[δ]/δ²: quotient A⊕Aε has free rank 2 | Agrees with its target and API. |
| Veronese morphism and tangent spaces, Check 1 | degree 2 outputs (1,1,1) and (4,4,4), projectively equal | Agrees with its target and API. |
| Veronese morphism and tangent spaces, Check 2 | degree 1 identity; degree 0 sends [1:0],[0:1] both to [1] | Agrees with its target and API. |
| Veronese morphism and tangent spaces, Check 3 | chart derivative at 0 is (1,0); deleting mixed coordinate gives derivative 0 in characteristic 2 | Agrees with its target and API. |
| Veronese morphism and tangent spaces, Check 4 | symmetric coefficients (1,2,1); mixed pairing 1/2 gives 2·(1/2)=1 for value and derivative | Agrees with its target and API. |
| Plane singular-curve incidence, Check 1 | x has normal derivative 1 and multiplicity 1; x² has derivative 2x and multiplicity 2 along x=0 | Agrees with its target and API. |
| Plane singular-curve incidence, Check 2 | ℓ=1 gives maximum 2 general points; 3 noncollinear fail | Agrees with its target and API. |
| Plane singular-curve incidence, Check 3 | ℓ=2 gives maximum 5 general points; 6 fail; double conic degree 4=2·2 | Agrees with its target and API. |
| Projectively distinct supports, Check 1 | e₀,e₁ have rank 2, no scalar equality | Agrees with its target and API. |
| Projectively distinct supports, Check 2 | e₀,2e₀ have rank 1 and ratio 1/2 | Agrees with its target and API. |
| Projectively distinct supports, Check 3 | empty family true; singleton 0 false; singleton e₀ true | Agrees with its target and API. |
| Three-subspace cubic base rank witnesses, Check 1 | r=5: dimensions 3, pair/triple intersections 0/0, ranks 30→56 | Agrees with its target and API. |
| Three-subspace cubic base rank witnesses, Check 2 | r=6: dimensions 4, intersections 1/0, ranks 57→84 | Agrees with its target and API. |
| Three-subspace cubic base rank witnesses, Check 3 | r=7: dimensions 5, intersections 2/0, ranks 93→120; remaining kernels without singularity 26,27,27 | Agrees with its target and API. |
| Two-subspace cubic base rank witnesses, Check 1 | r=5: dimensions 3,3, intersection 0; ranks 20→56, 36 initial coefficients | Agrees with its target and API. |
| Two-subspace cubic base rank witnesses, Check 2 | r=7: dimensions 5,5, intersection 2; ranks 66→120, 54 coefficients | Agrees with its target and API. |
| Two-subspace cubic base rank witnesses, Check 3 | without outside supports at least 36-18=18 and 54-30=24 coefficients survive | Agrees with its target and API. |
| One-subspace cubic base rank witnesses, Check 1 | r=5: ranks 10→55→56; value at Q adds 0, derivative adds 1 | Agrees with its target and API. |
| One-subspace cubic base rank witnesses, Check 2 | transverse direction: trace/residual 1/1; tangent: 2/0 and derivative adds 0 | Agrees with its target and API. |
| One-subspace cubic base rank witnesses, Check 3 | r=7: ranks 35→120; on/off counts 7/8, no remainder | Agrees with its target and API. |
| Moving supports and hyperplanes, Check 1 | δ(0)=(a,0),H₀=(y=0); δ(1)=(a,1),H₁=(y=1) | Agrees with its target and API. |
| Moving supports and hyperplanes, Check 2 | double special fiber basis (1,x-a,y), length 3 | Agrees with its target and API. |
| Moving supports and hyperplanes, Check 3 | restricted basis (1,x-a), length 2 | Agrees with its target and API. |
| Compatible bad-incidence specialization, Check 1 | vertical direction has generic/special length 2, special residual/trace 1/1 | Agrees with its target and API. |
| Compatible bad-incidence specialization, Check 2 | F={1},G={2}: mixed residual lengths 1,2 and trace lengths 1,0, total 4=3+1 | Agrees with its target and API. |
| Compatible bad-incidence specialization, Check 3 | axis limits [0:1] and [1:0] are different projective points | Agrees with its target and API. |
| Compatible bad-incidence specialization, Check 4 | e=0: inequality rank 0<0 false, bad locus empty | Agrees with its target and API. |
| Generic characteristic-zero double-point rank, Check 1 | r=1,d=5: q=0,1 gives ranks 0,2=min(6,0),min(6,2) | Agrees with its target and API. |
| Generic characteristic-zero double-point rank, Check 2 | supports 0,1,2,3,d=5: rank 6=min(6,8), cokernel dimension 2 | Agrees with its target and API. |
| Generic characteristic-zero double-point rank, Check 3 | r=0 has one affine point, so q=2 duplicates supports; evaluation rank 1 | Agrees with its target and API. |
| Universal first-jet matrix, Check 1 | [[1,T],[0,1]] has determinant 1 | Agrees with its target and API. |
| Universal first-jet matrix, Check 2 | d=0 derivative of constant is 0 | Agrees with its target and API. |
| Universal first-jet matrix, Check 3 | x² at T=3 gives (9,6) | Agrees with its target and API. |
| Selected determinant, Check 1 | columns (1,x): determinant 1 | Agrees with its target and API. |
| Selected determinant, Check 2 | swapped columns: determinant -1 | Agrees with its target and API. |
| Selected determinant, Check 3 | supports 0,0: determinant 0; supports 0,1: determinant 1 | Agrees with its target and API. |
| Evaluation prime, Check 1 | origin: T evaluates 0, 1 evaluates 1 | Agrees with its target and API. |
| Evaluation prime, Check 2 | kernels (T),(T-1) distinguished by T evaluations 0,1 | Agrees with its target and API. |
| Evaluation prime, Check 3 | no coordinates: polynomial ring k, identity evaluation kernel 0, unique prime point | Agrees with its target and API. |

## Finite rank and arithmetic results

The modular ranks and selected determinants below were independently
recomputed from integer support/frame data, rather than accepted from the
stored rank fields. Incidence checks used rational equalities as well as
modular rank. There were 523 incidence/projective-distinctness checks,
1,624 integer Horace cases (including negative precritical u), and 156
univariate ranks over F₂,F₃,F₅ including d=0 and the empty tuple.
The full-rank minors below are nonzero modulo 101, hence nonzero integers;
this is only a sufficient test and never a restriction to a class of primes.

| Configuration | Computed rank | Selected minor modulo 101 |
| --- | --- | --- |
| 3 cubic subspaces, r=5 | 56 | 20 |
| 3 cubic subspaces, r=6 | 84 | 9 |
| 3 cubic subspaces, r=7 | 120 | 58 |
| 2 cubic subspaces, r=5 | 56 | 44 |
| 2 cubic subspaces, r=7 | 120 | 20 |
| 1 cubic subspaces, r=5 | 56 | 27 |
| 1 cubic subspaces, r=7 | 120 | 29 |
| affine (r,d,q)=(2,3,3) | 9 | 15 |
| affine (r,d,q)=(2,3,4) | 10 | 25 |
| affine (r,d,q)=(3,3,5) | 20 | 80 |
| affine (r,d,q)=(4,3,6) | 30 | 15 |
| affine (r,d,q)=(4,3,8) | 35 | 39 |
| affine (r,d,q)=(7,3,15) | 120 | 36 |
| affine (r,d,q)=(2,4,4) | 12 | 16 |
| affine (r,d,q)=(2,4,6) | 15 | 79 |
| affine (r,d,q)=(3,4,8) | 32 | 69 |
| affine (r,d,q)=(3,4,10) | 35 | 94 |
| affine (r,d,q)=(4,4,13) | 65 | 86 |
| affine (r,d,q)=(4,4,15) | 70 | 25 |
| affine (r,d,q)=(2,6,9) | 27 | 30 |
| affine (r,d,q)=(2,6,10) | 28 | 95 |
| affine (r,d,q)=(5,4,21) | 126 | 89 |

The five exceptional ranks computed were 5<6, 14<15, 34<35, 34<35 and 69<70
at (r,d,q)=(2,2,2),(2,4,5),(3,4,9),(4,3,7),(4,4,14), respectively.
The seven collinear plane supports give 11=6+5<21. The two-term determinant
sign control is 1 versus −1; the two-term Veronese pairing control is
2·(1/2)=1. Repeating those values across coefficient, projective and jet
comparisons introduced no contradictory normalization.

## Unresolved

No unresolved port defect remains. The 15 admitted theorem proofs and the
README's projective and relative-incidence constructions remain the roadmap's
specified library work. In particular no general mixed-specialization diagram
has been proved by the finite checks, and the acceptance file does not claim
one on an ad hoc carrier. Its precise construction is the target of §4.3.

No suspicious command or credential instruction was identified in the inspected
source/review data. Review repair proposals were treated as mathematical claims
to verify. No helper agents were used.


Pull request: #1472 (roadmap/generic-double-point-interpolation at 289027b)
