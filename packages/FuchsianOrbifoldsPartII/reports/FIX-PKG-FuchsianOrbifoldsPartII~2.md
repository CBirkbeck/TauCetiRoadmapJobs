# Repair report: FuchsianOrbifoldsPartII

The review contains F01–F09 and the separately headed R08: ten findings. Each is settled below. The review's closing references to R01–R04 and R10 are treated as references to its numbered findings, not as additional findings.

## F01 (P1) — applied

README Scope: nonexistent ownership attribution → an explicit exclusion of higher-dimensional hyperbolic volumes and gonality, without naming an owner. The main folders, board folders, merge order and open-head index contain no such roadmap; the indexed text search finds only a consumer-list mention in ComplexComparisonPartII. The immutable non-gap portion of the design plan is outside the permitted edit surface.

## F02 (P2) — applied

Lean's height-normalization route theorem → the raw-list conjugacy classification `cycleGroup_conj_iff_isRotated`. README §3.3 retains the height argument as prose; §3.4 states the headline, its generality and three discriminating Checks. The module docstring distinguishes this statable classification from class recovery on missing bordered-orbifold carriers. DIT16 line 332 states the arithmetic conclusion; the raw-list extension follows from the polygon, cusp and height arguments.

## F03 (P2) — applied

The Part I measure/connectedness attribution → a local pushforward definition, fundamental-domain independence, mass π/3, nonatomicity and path connectedness in README §4.1. Genus now cites Layer 5 item 1, including §0.4 and Layer 0 dependencies. §§4.3–4.4 consume §4.1. Part I Layer 6 supplies the quotient/signature; Layer 4 item 5 supplies area, not a predefined measure.

## F04 (P2) — applied

The all-parameter/cusp-form Fourier gap → only the C¹ Fourier expansion at regular E*(z,1/2), in both README and plan gaps. §5.3 retains that endpoint as its target; other critical parameters and cusp forms use AnalyticNumberTheoryPartI §2.1. Scope, contracts and dependencies agree. Constant-term growth is derived from AutomorphicSpectralTheory §1.15 and the pinned completed-zeta Laurent decomposition, not requested anew.

## F05 (P3) — applied

An unmarked abstract free-product isomorphism → an existential isomorphism explicitly mapping the positive ℤ generator to T^m and each indexed C₂ generator to its prefix-centred half-turn. README §1.3 and three generator Checks specify the same marking. No Hopfian argument is needed. In particular a factor permutation or inversion of the translation generator fails the required marking.

## F06 (P3) — applied

Unsupported DIT16 line 387 attributions in §§3.1–3.3 → explicitly identified local routes with their actual supplier inputs. §3.1 cites ComplexCurveModuli D0.4/D6.2; §3.2 names lifting and disc automorphisms; §3.3 names the pinned height formula and §1.3. §3.4 cites DIT16 Theorem 1, p.957, DIT16 line 332 for its conclusion. DIT16 lines 387–406 instead discuss distance cycles.

## F07 (P3) — applied

Historical labels and editorial wording → timeless section references and mathematical notation throughout the affected text. Deleted the older-AS-label sentence and “corrected”/“gap correction” wording; Δ names the operator. Both RQ.2 mentions in §4.5 now name MultiquadraticPartII §2.4, `J_square_iff_sumTwoSquares`; the undefined discriminant function is gone. §5.3 has “the supplied” once.

## F08 (P3) — applied

Implicit proof inputs → explicit contracts and Needs entries: ping-pong in §1.3; finite-index covolume and effective modular cofiniteness in §1.6; closed/open modular-domain equality in §4.1. The covolume theorem was already in the supplier contract and now also appears at its use. The new endpoint calculation similarly names the exact pinned completed-zeta decomposition, regularity and residue inputs.

## F09 (P3) — applied

A reversal gap requesting the coefficient dictionary again → only the opposite-orientation identification of full primitive parametrized cycles. Both gap entries agree. The IntegralLattices B2–B3 contract now attributes all three coefficient actions to those sections. For a>0, conjugating the ideal gives A⁻¹; multiplying by √D adds J; combining these operations gives JA⁻¹. J²=1 gives the negative-leading case as well.

## R08 (P2) — applied

The undefined S₃ in §3.3 → S S₁ S⁻¹, with S₁ centred at 3. Its representative [[−3,−1],[10,3]] fixes (−3+i)/10. The incorrect comparison denominator in §4.3 → the actual equal-weight expression ν_I(E)/(4π)+ν_J(E)/(10π), contrasted with (ν_I(E)+ν_J(E))/(7π). Both surrounding worked examples retain the correct period-length normalization.

### Mathematical evidence and ownership

The content main revision is c44faf6aeb43c6714ca7828f936d6086b73ed2e6. The pins in its lake manifest and the checked-out libraries agree: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The representative main roadmaps read for shape and ownership were FuchsianOrbifolds, ComplexCurveModuli and IntegralLattices.

Cross-roadmap citations were re-read at main or the supplied open-head index:

| Supplier | Locator and verified contract |
| --- | --- |
| FuchsianOrbifolds, main | Layers 0–3: actions, cone/free quotients, polygon bookkeeping and cusps; Layer 4 item 5: area/signature; Layer 5 item 1: topological genus; Layer 6 item 1: effective level-one quotient and signature. No assertion there supplies μ_mod or regular-locus connectedness. |
| AutomorphicSpectralTheory, indexed head c5cfb92 | §§1.14–1.15: normalization, completed constant term and continuation; §4.17a: arithmetic cycles and surfaces, area, length, projection and finite-width cusp; §§4.18, 4.20: uncompleted critical-line flux/integrability and cusp decay. The requested endpoint termwise C¹ export is still a gap. |
| AnalyticNumberTheoryPartI, indexed head 4ba2e21 | §2.1: core_stokes under integrability and vanishing flux, core_signature and core_boundary_period. The general-eigenfunction statement gives the cusp-form application. Scalar multiplication gives the completed t≠0 application without needing a nonvanishing assertion about that scalar. |
| IntegralLattices, main | Layer B, B2: oriented ideal map and √D clause for a<0; B3: composition, opposite form and inverse. This provides the coefficient actions, not the full oriented parametrized-cycle identification. |
| GlobalNumberFields, main | Layer 11: orders, invertible proper ideals, Picard/narrow Picard groups and maximal-order specialization. No comparison for noninvertible proper ideals is used. |
| MultiquadraticPartII, indexed head 0bf098b | §§2.3–2.4: the two-square and J-square criteria with fundamental-discriminant/presentation hypotheses; §§3.1–3.2: form-character and narrow ideal-character comparison. |
| ComplexCurveModuli, main | D0.1: labelled smooth surface normal forms; D0.4: finite-type smooth uniformization and conformal double; D6.2: reflected geodesic-cut metric. Their smooth carriers do not already give the marked cone-orbifold double here. |
| ConformalMapping, main | L2: Schwarz–Pick and disc automorphisms; L4: scalar Schwarz reflection and continuation/removability. |
| AlgebraicTopology, main | Stages 1 and 7: groupoid van Kampen and finite-CW Euler characteristic/gluing. These are inputs to, not replacements for, the local finite-type orbifold argument. |
| DifferentialGeometry, main | §§5.3, 5.5, 5.6.3: compactly supported C¹ Stokes, corners and planar integral comparison. Compact truncations use a cutoff equal to one near the polygon. |
| Completed/UniversalCovers, main | Stage 2: based lifting and covering correspondence. The actual lifting and deck-conjugation declarations are pinned inputs. |

Ownership searches used the roadmap grep/show tools over main and indexed open heads, including the named sibling roadmaps, and object searches over board packages and the pinned libraries. Searches included limit sets, Nielsen regions, convex cores, Ford polygons, minus continued fractions, conformal doubles, quotient measures and complementary coverings. General quotient measure, ping-pong and covering theory are imported; the arithmetic surface belongs to AutomorphicSpectralTheory; the smooth double belongs to ComplexCurveModuli. This package owns the raw-list classification, marked cone-orbifold extension and specified geometric comparisons. No new declaration duplicates another roadmap's fully qualified name. Revisions of existing roadmaps are not dependency sources. No unprovided open checkout was sought.

The existing three supplier-gap slugs are retained. Only two needs strings changed, and only within the plan's top-level gaps list. The primitive cycle invariant, geometric orientation reversal and completed endpoint C¹ export remain requests to AutomorphicSpectralTheory; this package's edits do not establish those supplier results. There is no supplier move or scope expansion.

### Source verification

All three cited texts were available in the supplied legal cache; no additional source or missing-reference request was needed. Their existing unique manifest keys and certified status were retained. No source text was copied into the package or this report.

| Source | Passages read and use |
| --- | --- |
| DIT16 | Lines 71–137: units, narrow classes, primitive minus periods and coefficient signs; lines 149–199: Nielsen region, genuine boundary, signature, Gauss–Bonnet and modular area; lines 238–257: reversed cycle and cycle groups; lines 323–406: Theorem 1, free product, boundary partition, arithmetic conclusion and the source's different distance argument; lines 407–448: genus and complementary coverings; lines 514–524: completed constant term and residues; lines 1025–1055: Stokes and spectral growth. |
| LU23 | Lines 215–218: finite generation/geometric finiteness and the cofinite first-kind case; lines 230–277: elliptic orbits, elementary cases and finite core area. Its second-kind context is retained for the nowhere-dense assertion; its torsion-free surgery is not substituted for the cone argument. |
| SERIES05 | Lines 733–734: finite generation iff geometric finiteness for Fuchsian groups; lines 1126–1149: hull quotient and the specifically two-dimensional finite-area/funnel assertions, distinguished from three-dimensional volume. |

The local conformal-recovery proof uses the unique cusp class to rebase a conjugacy at ∞, giving z↦az+b, a>0. Maximal elliptic height 1 forces a=1. The full cusp subgroup then fixes the common width m; positive cyclic gaps of the complete height-one sets modulo m recover every digit, including repetitions. A chain of digit-2 tangencies does not create another cusp: for [3,2], the tangency 4 maps under the half-turn centred at 3 to the endpoint 2 of the free interval (1,2). The reverse implication is the integral-translation conjugacy of §1.4.

### Adversarial mathematics pass

Rows record concrete values or explicit set/map evaluations, rather than elaboration as evidence of truth. API laws are included below their defining objects. Matrices are SL representatives, with equality interpreted up to ±I in PSL. The carriers are ℤ, ℝ, ℂ, lists and the indicated hyperbolic quotients; coefficient characteristic/DVR and module-rank variations do not belong to these statements.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Curvature, area and orientation conventions | Height strip of width m above Y | ∫₀ᵐ∫_Y^∞ y⁻²dy dx=m/Y; width 4, Y=2 gives 2 | Consistent | Retained |
| Left action and effective order | S at i and 2i | S(i)=i, S(2i)=i/2, S²(2i)=2i; matrix square −I | Order 2 in PSL | Retained |
| Cyclic conjugation direction | [3,6] rotated once | {0,3}−3 modulo 9={0,6}, the [6,3] centres | Both constructions agree | New headline Check |
| Laplacian and Stokes coefficient | log y on [0,1]×[1,2] | ∮dz/(2y)=1/2−1/4=1/4=(1/2)∫y⁻²dxdy | Sign and factor fixed | Timeless wording |
| Laplacian height factor | F=y² at y=2 | ΔF=−8; inverse-square operator gives −1/2 | Wrong convention excluded | Retained values |
| Narrow sign convention | D=12 | N(2+√3)=4−3=1; N(1+√3)=1−3=−2 | I and J distinguished | Retained |
| Norm-one unit convention | D=8 | N(1+√2)=−1; square=3+2√2, norm 1; length=2log(3+2√2) | Negative-norm generator squared | Retained |
| §0.1 limit-set definition | Trivial and finite elliptic groups | Orbit finite in ℍ; boundary accumulation set ∅, size 0 | Not nonelementary | Retained |
| §0.1 parabolic case | ⟨T⁴⟩ | 4j+i→∞; Λ={∞}, size 1 | ∞ must be included | Retained |
| §0.1 hyperbolic case | z↦4z | Orbit 4^j i has limits 0,∞; size 2 | Infinitude does not imply nonelementarity | Retained |
| §0.1 basepoint independence | T⁴ orbits of i and 2i | Both ideal accumulation sets {∞}; distance log 2 remains bounded | Same boundary set | Retained |
| §0.1 closedness and conjugacy | Conjugate ⟨T⁴⟩ by S | S{∞}={0}; conjugate orbit tends to 0 | Closed singleton and equivariance | Retained |
| §0.1 fixed endpoints and first kind | Hyperbolic cyclic group; PSL₂(ℤ) | {0,∞}⊆Λ in the first; Λ=whole ideal circle in the second | Both directions distinguished | Retained |
| §0.2 hull and interior | Λ=whole circle | No complementary interval; CΓ=ℍ and NΓ=ℍ | No artificial boundary | Retained |
| §0.2 supporting side | Λ in [−1,1], endpoints retained | Allowed hull lies inside unit semicircle; 2i is on the excluded side | Unconditional exterior rule fails | Retained |
| §0.2 invariance and conjugacy | Translate supporting endpoints −1,1 by 3 | Hull side for endpoints 2,4 is translated old side; boundary maps pointwise by z↦z+3 | Correct map domain/target | Retained |
| §0.2 genuine boundary charts | Modular paired vertical edges; half-turn at a boundary point | Paired-edge contribution t=0; half-turn sends an inward normal to an outward normal | Elliptics cannot preserve the boundary half-plane | Retained |
| §0.3 finite core and funnels | PSL₂(ℤ); Γ([4]) | Core areas π/3 and π; funnel counts 0 and 1; full second quotient area ∞ | Core and full quotient differ | Retained |
| §0.3 elementary exclusion | ⟨T⁴⟩ | Limit-set size 1; no nonelementary interior hull | Positive-area theorem not applied | Retained |
| §0.4 bordered signature and scalar B | (0;2,3;1;0) | 2π(−2+1+1/2+2/3)=π/3 | Curvature normalization agrees | Genus supplier corrected |
| §0.4 boundary contribution | (0;2;1;1) | 2π(−2+1+1+1/2)=π | Omitting boundary gives −π | Retained |
| §0.4 permutation and conjugacy invariance | Cone lists [2,3] and [3,2] | Defect sums both 7/6; B both π/3 | Multiset, not ordered cone list | Retained |
| §0.4 impossible signature | (0; ;1;0) | B=−2π versus positive finite core area | Excluded as realized signature | Retained |
| §0.5 Gauss–Bonnet | Pair of pants; arithmetic cycle length ℓ | 2π(−2+3)=2π; 2π(−2+1+1+ℓ/2)=πℓ | Genuine boundary sign positive | Retained |
| §0.6 primitive funnel geodesic | Hyperbolic map z↦4z; its square; T | Axis length log 4; square traverses twice with length 2log 4; T has no axis | Primitivity and hyperbolicity necessary | Retained |
| §1.1 admissibility | [], [2], [2,2], [4], [4,4] | Predicate values false,false,false,true,true; admissible sums 4 and 8 | Empty/all-2 excluded, repetitions allowed | Retained |
| §1.1 admissibility under rotation | [3,6], [6,3] | Both have digits≥2, a digit>2 and sum 9 | Both directions hold | Retained |
| §1.1 raw subgroup and universal property | Empty list | T^0=1, Fin 0 empty; closure of {1}=trivial subgroup | Total definition has correct junk input | Retained |
| §1.1 half-turn action and order | Prefix centre 3 | [[3,−10],[1,−3]] fixes 3+i; square=−I, matrix not ±I | Exact projective order 2 | Marking Check |
| §1.1 generating-set equality | [3,6] | S₂=T⁹ S₀T⁻⁹; adjoining S₂ or S₀ with T⁹ gives the same subgroup | Endpoint centre is not another factor | Retained |
| §1.1 projective embedding | S² and T⁹ | −I maps to identity; T⁹ acts as z↦z+9 over both integral and real actions | Faithful effective interpretation | Retained |
| §1.2 polygon membership | [3,6], points i,3+i,9+i | Strip coordinates 0,3,9; each relevant norm square is 1 | All boundary points included | Retained |
| §1.2 total polygon at empty input | [], i and 2i | x=0; norm squares 1 and 4, both ≥1 | Degenerate line, no tiling claim | Retained |
| §1.2 measurability, convexity and side pairing | Unit-circle point at centre 3 | S₁ fixes centre height 1 and swaps its two half-arcs; norms satisfy r↦1/r | Closed half-planes, correct split side | Retained |
| §1.2 free intervals | [4]; [3,2] | Lengths 4−2=2; second gap 2−2=0 | Tangency is ideal, no interior overlap | Retained |
| §1.2 high strip | [3,6], y=2 | Each squared distance to a real centre ≥4>1; full width 9 | Ford cutoff above 1 valid | Retained |
| §1.3 fundamental-domain headline | [4], point 2+2i and T⁴ translate | First has 0<x<4 and is outside endpoint discs; translate has x=6 outside strip | Interior representatives distinguished | Retained |
| §1.3 marked ℤ factor | [4] | Positive generator→T⁴: i↦4+i; inverse gives −4+i | Abstract isomorphism insufficient | Signature strengthened |
| §1.3 marked C₂ factors | [3,6], k=0,1 | Images S and [[3,−10],[1,−3]], fixing i and 3+i | Factor indices pinned | Signature strengthened |
| §1.3 nonabelian free product | [4,4] | SS₁=[[-1,4],[4,-17]], S₁S=[[-17,-4],[-4,-1]]; unequal up to sign | No abelianization or repeated-factor collapse | New Check |
| §1.3 cusp-stabilizer headline | [4]; [4,4] | Intersections with ⟨T⟩ are ⟨T⁴⟩ and ⟨T⁸⟩; T⁴ is absent in the latter | Full cusp width matters | Retained |
| §1.3 cusp/orbit topology | [4]; [3,6] | One cusp in each; cone orbit counts 1 and 2; genus 0, one funnel | Width and number of cones distinct | Retained |
| §1.3 ideal tangencies | [3,2] | Tangency 4 maps by S₁ to 3−1/(4−3)=2, endpoint of (1,2) | Not another parabolic cusp | Recovery proof witness |
| §1.4 rotation and projection | [3,6]→[6,3] | T⁻³ sends centres 0,3 to −3,0≡6,0 mod 9; modular orbits unchanged | Isometry is over M | Retained |
| §1.5 telescoping word | [3,6] | (T³S)(T⁶S)=[[17,−3],[6,−1]], det 1, trace 16 | Product order fixed | Retained |
| §1.5 endpoint ordering | [3,6], w=(3+√7)/2 | First endpoints ≈0.1771,2.8229: 0<0.1771<1<2<2.8229<3; next ≈3.3542,8.6458: 3<3.3542<4<8<8.6458<9 | All required strict inequalities hold | Retained |
| §1.5 digit-2 and repeated words | [2]; [4,4] | T²S trace 2; [4,4] word=[[15,−4],[4,−1]]=(T⁴S)² | Hyperbolicity/primitivity not interchangeable | Retained |
| §1.6 second kind and infinite index | [4], interval [3/2,5/2] | Shallow-strip area=lim(1/ε−1)=∞; finite index k would give kπ/3<∞ | Contradiction proves infinite coset count, native index 0 | Inputs named |
| §1.6 nonelementarity | Γ([4]) | Parabolic ∞ and its S-image 0; T⁴ then gives 4, three distinct ideal limits | Limit set has >2 points | Retained |
| §2.1 finite boundary cut | [3,6] | z=1/2+i√3/2, first cut=5/2+i√3/2, S₁γz=17/2+i√3/2 | Finite arc reaches the circle | Retained |
| §2.1 one-digit endpoint | [4] | Last circle crossing equals γz; applying T⁻⁴S₁ returns z | No strict-interior endpoint assumption | Retained |
| §2.1 once-traversed length | [4] and doubled arithmetic word | Primitive trace 4 gives length 2log(2+√3); square trace 14 gives twice that | Repetition excluded only in arithmetic period | Retained |
| §2.2 actual surface comparison | [4] versus [3,2] | Same unit 2+√3, areas π and 2π, cone counts 1 and 2 | Length alone does not determine the surface | Retained |
| §2.2 projection with sheets | D=28 principal | Upstairs mass 2π, base mass π/3, ratio 6 | Projection cannot be an isometric embedding | Recomputed base measure |
| §2.2 high-core cutoff | [3,6] | First retained maximum √7/2≈1.3229; second √7≈2.6458; 3 exceeds both | Ford height 1 insufficient for core | Retained |
| §2.2 negative cutoff control | z=3/2+6i/5 | Ford norm squares at nearest centres=9/4+36/25>1; core circle requires y²≥7/4 but 36/25<7/4 | In P, outside Q_A | Retained |
| §2.2 properness and boundary charts | Width-m high cusp; genuine boundary point | Cusp map to width 1 has degree m; boundary source angle π maps into target angle 2π | Proper finite sheets, not open local map at boundary | Retained |
| §2.3 spacing definition and formula | x=0,2,4 | V=0,2arsinh(1),2arsinh(2); cosh values 1,3,9 | Metric and three expressions agree | Retained |
| §2.3 monotonicity domain | x=−2,0,2 | V values −2arsinh(1),0,2arsinh(1); arcosh formula at −2 is positive | Alternate expressions require x≥0 | Retained hypothesis |
| §2.3 lift versus quotient distance | [4], i and 4+i | Lift spacing 2arsinh 2≈2.8873, quotient distance 0 | No intrinsic-distance recovery shortcut | Retained |
| §3.1 connected reflected double | (0;2 repeated ℓ;1;1) | Double genus 0, 2ℓ order-two points, 2 cusps; B=2πℓ | Twice the original area | Route attribution fixed |
| §3.1 genus and area gluing | Pair of pants | 2g+t−1=2; doubled χ=−2−2=−4; area 4π | Genus-two result | Retained |
| §3.1 t=0 exclusion | Boundaryless connected surface | Disjoint double has 2 components; formal 2g−1 is not its connected genus | Connectedness hypothesis essential | Retained |
| §3.1 reflection and doubled map | Normal coordinate r | r↦−r; cosh²(−r)=cosh²r; applying twice gives r | Involutive isometry, analytic reflection | Supplier correctly identified |
| §3.2 cone-order lifting | Local cone order 2 and identity equivalence | Preserved meridian relation μ²; identity lift fixes basepoint and has inverse identity | Based orbifold cover, not coarse unramified cover | Route attribution fixed |
| §3.2 affine cusp normalization | z↦2z+3 | ∞↦∞, height 1↦2, translation width m↦2m | a>0 and scaling distinguished | Used in headline proof |
| §3.3 height denominator | γ=1 and γ=S at 3+i | Denominators 1 and 3²+1=10; heights 1 and 1/10 | Bound and strict example agree | Fixed conjugate label |
| §3.3 conjugated fixed point | S S₁ S⁻¹=[[-3,-1],[10,3]] | 10z²+6z+1=0 at z=(−3+i)/10; square −I | Correct indexed involution | R08 applied |
| §3.3 equality classification | γ=T⁹ and γ=S₁ for [3,6] | (cN+d)²+c²=1 in each; γ∈⟨T⁹⟩ or ⟨T⁹⟩S₁ | All equality models identified inside Γ | Retained |
| §3.3 denominator nonzero | c=0, d=0 candidate | ad−bc=0 instead of 1 | Zero denominator impossible | Retained |
| §3.3 nonidentity witness | Identity at 2i | Identity fixes 2i but would require 2≤1 | Identity excluded | Retained |
| §3.3 repeated height set | [4], [4,4] | Both maximal sets 4ℤ+i; cusp periods 4 and 8 | Point-set period alone insufficient | Retained/new headline Check |
| §3.4 conjugacy iff rotation, forward and reverse | [3,6], [6,3] | Conjugacy true by T⁻³; rotation true | Positive witness both ways | New headline |
| §3.4 repeated-list negative control | [4], [4,4] | a forced to 1; widths 4≠8; conjugacy false and rotation false | Does not erase repetitions | New Check |
| §3.4 orientation control | [3,4,5], [5,4,3] | Rotations of first: [3,4,5],[4,5,3],[5,3,4]; second absent; real reflection sends centres to {0,5,9} mod 12 | PSL conjugacy false, rotation false | New Check |
| §3.4 arithmetic class recovery | A=B and primitive rotated periods | Same cyclic gap list; complete invariant gives A=B in the reverse implication | Projection marking unnecessary, cone marking retained | Group headline synchronized |
| §4.1 half-open domain | i; −1/2+2i; 1/2+2i | Membership true,true,false; i is absent from fdo | Tie directions fixed | Retained |
| §4.1 circular ties | −1/2+i√3/2; 1/2+i√3/2 | Norm squares 1,1; memberships true,false | Left arc retained | Retained |
| §4.1 null difference | fdo⊆F_DIT⊆fd | volume(fd\fdo)=0; hence volume(F_DIT△fdo)=0 | Direct use of pinned equality | Input added |
| §4.1 quotient measure and independence | fdo versus F_DIT | Pushforwards agree; both total masses π/3 | Same Borel quotient measure | Local definition added |
| §4.1 total mass | Triangle angles π/3,π/3,0 | π−(π/3+π/3)=π/3=2π(−2+1+1/2+2/3) | Polygon and signature agree | F03 applied |
| §4.1 empty and cone fibres | ∅ and π_mod(i) | Preimages ∅ and countable orbit; both volume 0; full mass π/3 | No cone atom or zero measure | New Check |
| §4.1 regular connectedness | Remove elliptic lifts from a compact path | Only finitely many deleted points meet the compact path; each is replaced by one small detour, yielding 1 path | Surjects onto connected M_reg | Local target added |
| §4.2 projected measure | E=∅ and E=M | ν_A(∅)=0; ν_A(M)=πℓ_A | Counts all source sheets | Retained |
| §4.2 integrals and rotation | f=1, D=28 principal; rotated [6,3] | Both pullback integrals 2π; rotation changes neither mass nor modular orbit | Pushforward and over-base isometry agree | Retained |
| §4.2 reciprocal density | A²=J | 2ν_A=6ℓ_A μ_mod, hence ν_A=3ℓ_A μ_mod; total πℓ_A | Factor two survives cancellation | Retained |
| §4.3 family probability | D=28, S={I,J} | L=2+5=7, mass=(2π+5π)/(7π)=1 | Length normalization positive | Wrong-model expression corrected |
| §4.3 equal weights | Same family | Coefficients 1/(4π),1/(10π); length weights yield (2/7)/(2π)=(5/7)/(5π)=1/(7π) | Different mixtures distinguished | R08 applied |
| §4.3 empty and singleton | S=∅; S={I}, D=28 | Empty numerator/mass 0; singleton denominator 2π and total mass 1 | Nonemptiness required | Retained |
| §4.3 modular probability | μ_prob=(3/π)μ_mod | Whole mass=(3/π)(π/3)=1; test-set area a gives 3a/π | Same base normalization | F03 propagated |
| §4.4 complementary measures | D=12; D=28 | π+2π=9(π/3); 2π+5π=21(π/3) | Constants 9 and 21 correct | Recomputed |
| §4.4 boundary and cusp comparison | Complementary periods | Width sums 4+5=9=3(1+2); 9+12=21=3(2+5) | Independent constant check | Retained |
| §4.4 involution and fixed point | ι(A)=JA⁻¹ | ι²(A)=J(JA⁻¹)⁻¹=J²A=A; ι(A)=A iff A²=J | Both directions agree | Dictionary gap narrowed |
| §4.4 signed dictionary | Q=x²−3y², D=12 | Q and opposite have class I; −Q and [−1,0,3] have class J; J²=I | √D sign factor indispensable | Supplier attribution corrected |
| §4.5 stable-family sum | D=28 pair; reciprocal singleton | Sum=21μ_mod; singleton=3ℓ_A μ_mod; normalized measure always 3μ_mod/π | Whole, genus and fixed-point cases coherent | Retained |
| §4.5 genus stability | Exponent-two quotient, J mod squares | ι(A) mod C²=(J mod C²)(A mod C²); same coset iff J mod C²=1 | Criterion in both directions | Correct supplier section |
| §4.5 arithmetic criterion | D=12,28,136 | 3∣12 and 7∣28 give false; 136=6²+10² gives true | J square distinguished from J=1 | Undefined discriminant name deleted |
| §4.6 explicit D=12 words | [4], [3,2] | Matrices [[4,-1],[1,0]], [[5,-3],[2,-1]], both trace 4; unit 2+√3 | Areas π and 2π, common primitive length | Retained |
| §4.6 explicit D=28 words | [3,6], [3,3,2,2,2] | Matrices [[17,-3],[6,-1]], [[23,-18],[9,-7]], both trace 16; unit 8+3√7 | Areas 2π and 5π, common primitive length | Retained |
| §4.6 ideal-generator signs | D=12 and D=28 ideals | Norms N(1+√3)=−2, N(3+√7)=2, N(2+√7)=−3 | J/I labels agree with signs | Retained |
| §5.1 truncation and top orientation | F=y, width m | α=dz/2; top integral from m+iY to iY=−m/2 | Right-to-left orientation | Recomputed |
| §5.1 constant and paired sides | F=1; paired constant form | α₁=0; each paired contribution is I+(−I)=0 | Artificial sides disappear | Retained |
| §5.1 exhaustion and cusp tail | F=1, width 9, Y=3 | Omitted area=9/3=3; tends to 0 as Y increases | Finite tail, noncompact cusp retained | Retained |
| §5.2 differential identity | F=log y; F=y² | dα coefficients 1/(2y²),−1; (ΔF/2)y⁻² gives the same 1/(2y²),−1 | λ/2 and sign fixed | Retained |
| §5.2 finite flux sign | F=y on a strip | ∂zF=−i/2; −i∫₀ᵐ∂zF=−m/2 | Matches top-side integral | Recomputed |
| §5.2 λ=0 branch | F=1; harmonic F=y as negative control | First mean a=m, a′=0, tail m/Y; second a=mY, flux −im/2≠0 | No division by λ; divergent mean excluded | Retained |
| §5.2 λ≠0 limit | Exact identity at Y with flux→0 | I_A(F)=(2/λ)∮α_F; multiplicative identity returns ∮α_F | Existence follows without L¹ claim | Retained |
| §5.3 Laurent input | s=1+u | Λ=Λ₀−1/(1+u)+1/u; finite term c_Λ=Λ₀(1)−1, residue 1 | Pinned API fixes expansion | Input named |
| §5.3 endpoint cancellation | s=1/2+ε | Opposite pole coefficients √y/2 and −√y/2; sum 0; finite part √y(log y+2c_Λ) | Logarithm survives | Target narrowed |
| §5.3 derivative and flux | Mean √Y(log Y+c), width m | Derivative=(1+(log Y+c)/2)/√Y; flux=−im(1+(log Y+c)/2)/(2√Y)→0 | C¹ endpoint input sufficient | New Check |
| §5.3 tail and coefficient | Same mean, eigenvalue 1/4 | Scalar tail=m(2log Y+4+2c)/√Y→0; Stokes coefficient 1/8 | Absolute tail bound also converges | New Check |
| §5.3 nonzero Fourier modes | Integer frequency n≠0 and integer width m | ∫₀ᵐe^(2πinx)dx=(e^(2πinm)−1)/(2πin)=0 | Mean/flux reduce to constant term | Endpoint termwise gap retained |
| §5.3 other parameters and cusp forms | t≠0; zero cusp mean | Both Stokes sides multiplied by same finite Λ(1+2it); cusp horizontal mean/flux 0 | Existing supplier applications suffice | Duplicate targets cut |

### Pinned inputs and signature inspection

The new proof inputs were opened at the stated pins, with their hypotheses:

| Input | Pinned file and locator | Verified restriction |
| --- | --- | --- |
| Monoid.CoprodI.lift_injective_of_ping_pong | Mathlib/GroupTheory/CoprodI.lean:903, parameters at 804–813 | Disjoint nonempty ping-pong sets, nonidentity action inclusions, and enough factors or a factor of cardinality at least three. The ℤ factor supplies that size condition even for one digit. |
| MeasureTheory.IsFundamentalDomain.quotientMeasure_eq | Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630 | Countable acting group, invariant measure, measurable constant actions, two a.e. fundamental domains. It identifies pushforwards, not their mass. |
| ModularGroup.fd_ae_eq_fdo | TauCeti/NumberTheory/Modular.lean:196 | Equality almost everywhere for upper-half-plane invariant volume; measurable intermediate F_DIT inherits it. |
| ModularGroup.isFundamentalDomain_fdo | TauCeti/NumberTheory/Modular.lean:234 | Effective PSL₂(ℤ), a.e. fundamental-domain statement. |
| MeasureTheory.covolume_eq_card_mul_covolume | TauCeti/MeasureTheory/Group/FundamentalDomain.lean:322 | Nested subgroups, invariant measure, countable ambient subgroup with fundamental domain; quotient cardinality in ℕ∞. |
| TauCeti.ModularGroup.isCofinite_psl2zToPSL2RRange | TauCeti/Analysis/Complex/Fuchsian/LevelOne/Basic.lean:73 | Cofinite effective real image of PSL₂(ℤ). |
| completedRiemannZeta_eq; differentiable_completedZeta₀; completedRiemannZeta_residue_one | Mathlib/NumberTheory/LSeries/RiemannZeta.lean:84, 89, 110 | Entire pole-cleared function and residue 1; meromorphic limits are distinct from totalized values at poles. |

The remaining named pinned inputs were located and inspected in the files in the README contracts: upper-half-plane volume/metric, S/T and the determinant-one height formula, generated subgroups, free coproducts and index, finite stabilizers, measurable pushforward/Bochner integral, effective projective and ideal-circle actions, proper action and cyclic stabilizers, geodesic lines and polygon area, null boundaries/cusp-tail measure, discrete covolume, narrow group/square/finite instances, based lifting and over-base deck conjugation. No new carrier was introduced in place of an available native one.

One scratch Lean file contained the complete final declarations and `#check @name` for all eight declarations. It elaborated with exit 0 and only the same five sorry warnings. Every elaborated type was compared with the README:

| Declaration | Elaborated binders and conclusion | Comparison/change |
| --- | --- | --- |
| AdmissibleCycle | List ℕ→Prop | Real predicate; no standing binder lost. |
| cycleGroup | List ℕ→Subgroup PSL₂(ℤ) | Raw total construction; no admissibility silently assumed. |
| cyclePolygon | List ℕ→Set UpperHalfPlane | Raw total construction; geometric claims require admissibility separately. |
| cyclePolygon_fundamentalDomain | n, AdmissibleCycle n; a.e. fundamental domain for cycleGroup n and volume | Same README scope. |
| cycleGroup_presentation | n, AdmissibleCycle n; ∃ e, the two indexed generator identities | Changed from unmarked Nonempty to marked existential; the index k is Fin n.length. |
| cycleGroup_cuspStabilizer | n, AdmissibleCycle n; intersection with ⟨T⟩ equals ⟨T^sum⟩ | Full subgroup statement, no lost hypothesis. |
| cycleGroup_infiniteIndex | n, AdmissibleCycle n; native index=0 | Infinite coset interpretation matches README. |
| cycleGroup_conj_iff_isRotated | n,n′, both admissibility hypotheses; real embedded conjugacy iff n~r n′ | New headline; both hypotheses retained. |

There are no section variables, so no binder disappeared. The final module has three real-bodied definitions and five headline theorems, each with sorry, a single import Mathlib plus the used pinned projective-action module, and no set_option, sorry-valued data, admitted examples or API padding. The new classification and marked presentation require geometric/free-product arguments, rather than a definitional or one-tactic library restatement.

### Exact check outcomes

- Final Suggested.lean elaboration from the pinned content workspace: exit 0; exactly five “declaration uses sorry” warnings, at lines 56, 65, 81, 88 and 97. No errors or other warnings. The imported Tau Ceti object existed, so no targeted build was needed. No Lean process remains running.
- All-eight-declaration scratch signature elaboration: exit 0; five sorry warnings; no dropped binders. Only comments changed after that signature comparison.
- Final mechanical dependency direction check, using the brief's --depcheck/--movable invocation: exit 0. Exact output:

```text
depcheck: 49 roadmaps, 557 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Citation resolution against main c44faf6 and the 354 indexed open heads: exit 0; no cross-roadmap citation or Lean name found nowhere. Its note that external Lean names were not checked by that tool was addressed by the separate pinned source inspection above.
- git diff --check: exit 0, no output. JSON comparison confirms that deleting gaps from the old and new plan yields identical objects. README gap lines and plan needs strings agree exactly under the same three slugs. Only README.md, Suggested.lean, the two permitted gaps strings, and this report changed. The sources manifest and metadata did not need changes.
- No separate gate failures were supplied in the brief. The cited mathematical and documentation defects are accounted for by the ten verdicts above; no tooling or merge-order change was made.

### Maintainer consequences

Consumers of cycleGroup_highestElliptics must use the README §3.3 route statement; that name has been deleted from Suggested.lean. cycleGroup_presentation keeps its name but now returns a marked existential. cycleGroup_conj_iff_isRotated is the new end-theorem signature. No occurrence of these names was found in another readable roadmap's Lean file. The three supplier gaps remain explicit external prerequisites; this round neither edits their suppliers nor certifies their delivery. No commit, push or pull-request edit was performed.
