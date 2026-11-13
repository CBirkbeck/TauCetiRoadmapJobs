<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6862518090 -->
Review (codex) of b8e3dcb

Verdict: needs_changes

1. **F01** (P3) Account for all advertised headline theorems in the module docstring

   **Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean:17`: “The headline theorems and what each lacks”. Compare `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:27`, the table headed “Headline targets”.

   **Claim.** Every advertised headline theorem that cannot be stated at the pins is named in the acceptance file's module docstring, with its missing carrier.

   **Witness.** README:29, :32–33 and :35 advertise the opposite slope bound, local/curve graded recovery and coefficient trace formula (MS.0.4, MS.3.6, MS.4.4, MS.6.6). Suggested.lean:19–37 names none of these.

   This is not a request for surrogate Lean statements. The same omission affects the bounded graded formula and PBQ descent, curve intersection/gluing/transport/bounded quotient, minimal-slope reductions and generic theorem, and fibre reconstruction/isomorphism criterion. Their carriers are also absent at the pins. The headline inventory below identifies each affected target. Definitions and the Legendre example in the overview are not being promoted to acceptance theorems.

   **Exact repair.** Append the following five bullets inside the existing module docstring, before its closing delimiter:

   ```lean
   * The opposite slope rank bound (MS.0.4), bounded graded formula (MS.1.2), and PBQ
     descent (MS.1.4-MS.1.5) lack the Amice and bounded Robba differential Frobenius
     modules, their slope filtrations, and bounded quotients.
   * Curve intersection and gluing (MS.2.2-MS.2.3), finite etale PBQ transport (MS.2.6),
     the curve bounded quotient (MS.2.7), and the convergent PBQ filtration (MS.2.9)
     lack the curve generic/local fields and convergent/overconvergent isocrystal categories.
   * Local graded recovery (MS.3.6), the curve irreducibility criterion (MS.4.3), and
     curve graded recovery (MS.4.4) lack those categories, PBQ grades and saturation.
   * The minimal-slope reductions (MS.5.3), generic minimal slopes (MS.5.5), and the
     affine-line reduction (MS.5.6) lack dagger hulls and their Frobenius-module categories.
   * Lefschetz fibre reconstruction (MS.6.3), the coefficient trace formula (MS.6.6),
     the projected trace average (MS.6.7), and the fibrewise isomorphism criterion
     (MS.6.10) lack coefficient isocrystals, their fibres, rigid cohomology and weights.
   ```

   **Retest.** Inserted these exact bullets into a scratch copy, without altering the reviewed file. The prescribed Lean invocation exited 0 with no output. MS.0.4, MS.3.6, MS.4.4 and MS.6.6, the four witness omissions, are now explicitly named with missing carriers; the remaining theorem entries of the overview are covered as well. The computed mathematical instances below remain unchanged. This is a documentation-policy finding, not a false-theorem or statable-headline finding.

One P3 documentation finding; no P1 or P2 finding. The previous mathematical-reference repair is sound. The original acceptance file and a scratch copy containing the proposed documentation repair both elaborate without warnings.

## Verified sound

### Previous finding checked first

| Previous finding | Repaired passage in the README | Disposition and retest |
| --- | --- | --- |
| Round 5 F01: overconvergent quotient closure applied to a convergent image | :1594–1596: “`Q` is a nonzero convergent quotient of the convergent PBQ object `P_1(N)`”; :1604 names MS.2.9 | **Repaired.** Ordinary Legendre: source rank 2, maximal slope 1; image rank 1, slope 1; image has no overconvergent structure. MS.2.9 applies, giving `1=1`, whereas MS.2.4 does not. |

The actual diff against the preceding repair has four changed regions: the supplier-use sentence at README:275, the MS.4.2 route/Needs/Check, the MS.4 dependency paragraph, and the source-correction entry at :2512. I read all four, including the unchanged surrounding arguments. The new subquotient input is present at the current parent head: RD.1.36, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:3216`; the convergent abelian category is RD.3.34 at :6572; exact faithful realisation is RD.3.37 at :6704. Supplier line numbers here exclude the tool's one-line presentation header.

The new image is nonzero because a nonzero finite projective dagger module on the affine open has nonzero sections, and the stated section map is injective. Its generic slope equals the maximal slope of the first PBQ step; as a nonzero subobject of isoclinic `P`, it has slope `slope(P)`. No overconvergent structure on the image is introduced. For the split projection `L_1 ⊕ L_0 → L_0`, the first step maps to zero, but the section-injectivity hypothesis is false. For `0 → 0`, the explicit `P ≠ 0` hypothesis excludes the undefined numerical slope.

I also inspected every other use of MS.2.4: MS.2.6 uses the overconvergent counit quotient; MS.2.8 an overconvergent extension quotient; MS.4.3 an overconvergent subobject quotient; MS.4.4 an overconvergent image quotient; MS.4.5 an exact sequence in the overconvergent category. Local and generic quotient steps use MS.0.10. No occurrence of the repaired category mismatch was found. No finding was marked not actionable, and none is re-raised.

The earlier report supplies computed rows for only part of the package and refers elsewhere for the rest. I therefore read all 69 numbered targets, rather than treating that reference as complete evidence. A scratch ledger records a computed row for each of the 69. The public table below gives all 69 rows, including the seeded sample, headline theorems, every target affected by R01, and the repaired route.

### Computed adversarial mathematics

`L_s` denotes a constant line of normalized slope `s`. `J` denotes the logarithmic module with Frobenius multipliers `q⁻¹,1`, connection `∇e₂=e₁ dt/t`, and bounded quotient `L_0`. These are explicit instance checks, not formal proofs of the general results.

| Target | Instances | Computed values on both sides | Result  Change |
| --- | --- | --- | ---  --- |
| MS.0.1 | Affine line; lacunary series | Residues k(x) versus k((x)); factorial gaps tend to infinity, excluding every fixed-order recurrence; unit generic rank 1, slope 0 | Consistent  None to mathematics |
| MS.0.2 | Zero, unit, J; geometric series with coefficients p^(-n) | Solution/bounded dimensions 0/0,1/1,2/1; logarithm coefficient norms p^r at n=p^r; last series radius 1/p<1 | Consistent  None to mathematics |
| MS.0.3 | K=Q_p(sqrt(p)), q=p; q=p^2 followed by iteration | sqrt(p) raw slope 1, normalized 1/2, twisting by its inverse gives 0; (0,2)/2=(0,1), then (0,4)/4=(0,1) | Consistent  None to mathematics |
| MS.0.4 | Unit into unit or unit square; split projection | Top/target ranks 1=1 or 1<2; maxima 0=0; split projection has maxima 1!=0 and dagger kernel rank 1 | Consistent; spanning needed for equality  None to mathematics |
| MS.0.5 | Zero, unit, J, split L_1+L_0 | Kernel/bounded ranks 0/0,0/1,1/1,0/2; bounded quotient applied twice gives ranks 0,1,1,2 again | Consistent  None to mathematics |
| MS.0.6 | J; split extension with sub L_1 and quotient L_0 | b-a=1 with nonzero class and unbounded solution; b-a=-1 with extension class 0 | Consistent  None to mathematics |
| MS.0.7 | Zero, line, split, J | Bounded-solution rank versus total rank 0=0,1=1,2=2,1<2; split class 0 versus J class nonzero | Consistent  None to mathematics |
| MS.0.8 | J after finite coefficient extension; identity extension | Bounded quotient ranks 1=1 and solution dimensions 2=2; coefficients at p^r still have norm p^r | Consistent  None to mathematics |
| MS.0.9 | Zero, unit, split, J | Bounded slope sets empty,{0},{1,0},{0}; PBQ false,true,false,true | Consistent, nonzero convention explicit  None to mathematics |
| MS.0.10 | Split projection, J quotient; empty sum | Maxima 1->0 (non-PBQ),0->0 (PBQ); empty sum rank0 and PBQ=false; sum of two equal-slope lines rank2, sole slope0 | Consistent  None to mathematics |
| MS.0.11 | Unit tensor zero; split tensor a slope-zero rank2 object | PBQ true->false if tensor factor zero; for nonzero factor bounded slope multiset (1,1,0,0), PBQ false=false | Consistent  None to mathematics |
| MS.1.1 | Zero, line, split | Filtration lengths 0,1,2; split grade maxima (1,0), nested maxima (1,1) | Consistent  None to mathematics |
| MS.1.2 | Split; J | Both bounded quotient and sum of grade tops have slopes (1,0), rank2; for J both rank1, slope0; nested-top substitute gives (1,1) | Consistent  None to mathematics |
| MS.1.3 | Split/J under generic-to-local extension | Filtration lengths 2=2,1=1; bounded slope sets {1,0}={1,0}, {0}={0} | Consistent  None to mathematics |
| MS.1.4 | Split over bounded Robba field; irreducible line | Descended first step rank1 slope1; completed step rank1 slope1; line filtration length1 | Consistent  None to mathematics |
| MS.1.5 | Constant disc line; CT11 rank3 example | Line filtration length1; CT11 slopes 0,1/2,1, first step span(e1,e3) rank2 max1, quotient rank1 slope1/2; bounded quotient has slopes1/2,1 and is not pure | Consistent  None to mathematics |
| MS.1.6 | Constant, logarithm, negative index | Exact growth 0 and1; p^r/(p^r+1)^lambda diverges for lambda<1; at lambda=-1 polynomial inequality true but stipulated class={0} | Consistent  None to mathematics |
| MS.1.7 | J eigen-solutions at growth0/1, unit | mu=0<=0-0 and mu=1<=1-0; unit 0<=0 | Consistent  None to mathematics |
| MS.1.8 | J at lambda=-1,0,1; p=2,3 | Both growth and shifted-slope dimensions 0,1,2; log coefficients at p^r have norms p^r | Consistent  None to mathematics |
| MS.1.9 | Constant line multiplier a; split disc module | Solution multiplier a^(-1), dual quotient multiplier a; ranks1=1; split bounded solutions have slopes0,-1 and source PBQ=false | Consistent  None to mathematics |
| MS.2.1 | Zero, unit, split on a curve | Generic bounded ranks0,1,2; PBQ false,true,false on any nonempty affine open | Consistent  None to mathematics |
| MS.2.2 | G_m series sum p^n x^(p^n); 1/x on A1; nonfree line | Completed membership true, infinity-dagger membership false since p^(-n)r^(-p^n)->infinity; order_0(1/x)=-1 excludes interior; elliptic 2-torsion class nonzero, local rank1 | Consistent  None to mathematics |
| MS.2.3 | Generic line slope1; rank0/full; diagonal in unit square | Twist multiplier q by q^(-1) gives slope0; glued ranks0,2; wedge kernel of e1 wedge(-) has rank1 | Consistent  None to mathematics |
| MS.2.4 | Same-slope lines, empty family, split quotient | Sum ranks1+1=2 and bounded slope0; empty rank0 PBQ=false; unequal-slope split source PBQ=false | Consistent  None to mathematics |
| MS.2.5 | Split and irreducible line | Grade maxima (1,0), filtration length2; line length1, max0 | Consistent  None to mathematics |
| MS.2.6 | Degree-p Artin-Schreier cover; identity | Pullback unit rank1, pushforward rankp, all p slopes0; identity ranks1=1 | Consistent  None to mathematics |
| MS.2.7 | Split; ordinary Legendre | Split bounded rank2=2; Legendre top rank1 slope1, dagger structure=false; at supersingular point slopes1/2,1/2 and global filtration hypothesis fails | Consistent  None to mathematics |
| MS.2.8 | p=5 versus p=3 | Total rank3=2+1, grade maxima1,0; p=5 H1 slopes0,2 and complex eigenvalue moduli5,5 so no eigenvalue1; p=3 slopes1,1, no unit root | Consistent  None to mathematics |
| MS.2.9 | Unit, split, zero, Legendre unit-root kernel | Filtration lengths1,2,0,1; kernel generic/local rank1=1 and bounded slope0; no dagger structure asserted | Consistent  None to mathematics |
| MS.3.1 | Zero, line, split | Top-map kernels ranks0,0,1; saturation true,true,false | Consistent  None to mathematics |
| MS.3.2 | E-dagger to E, to E^2; (a,b)->a+alpha b | E-span ranks1=1,1<2; last dagger kernel0 but completed kernel rank1 | Consistent  None to mathematics |
| MS.3.3 | Unit injection; split projection; zero | Maxima0=0, top/target ranks1=1; bad projection maxima1!=0 and kernel rank1; zero numerical slope excluded | Consistent  None to mathematics |
| MS.3.4 | Zero, split, J | Saturation ranks0,1,1; split keeps slope1, J keeps slope0; applying again preserves these values | Consistent  None to mathematics |
| MS.3.5 | Unit; slope-zero Jordan block over F_q; split | Unit ranks1=1; Jordan PBQ=true, saturated=true, irreducible top=false; c^q-c=1 has no Laurent solution (negative valuation impossible, constant residue gives0=1) | Consistent  None to mathematics |
| MS.3.6 | Split with grade maps scalars2,3 | Bounded map diag(2,3) lifts to the same two grade maps; lengths2=2, rank2=2; nested-top slopes1,1 would mismatch1,0 | Consistent  None to mathematics |
| MS.3.7 | Unit map2; J versus unit | Unique lift2; J/unit top ranks1=1 but total ranks2!=1, excluded by failed saturation | Consistent  None to mathematics |
| MS.3.8 | Unit, zero, split on dense opens | Dagger-section kernel ranks0,0,1 on every test open; saturation true,true,false | Consistent  None to mathematics |
| MS.3.9 | J, Legendre-Kummer, split; degree2 pullback | (PBQ,saturated)=(true,false),(false,true),(false,false); unit pullback kernel0 and pushforward rank2 kernel0 | Consistent  None to mathematics |
| MS.3.10 | Unit, zero, split | Quotient ranks1,0,1 and top ranks1,0,1; split quotient kernel rank1 | Consistent  None to mathematics |
| MS.4.1 | Ordinary Legendre; split projection; unit-square sum algebraic control | Legendre top/target ranks1=1 so strict condition false; split maxima1!=0; square sum top ranks2>1 and kernel diagonal rank1, but dagger-section injection false | Consistent  None to mathematics |
| MS.4.2 | Legendre, unit identity, split projection, P=0 | Legendre P1 rank2 max1, convergent image rank1 slope1, top/target ranks1=1; unit maxima0=0 ranks1=1; split dagger kernel1; zero excluded | Repaired reference applies  None to mathematics; prior repair verified |
| MS.4.3 | Unit, split, J | Irreducible=true,false,false; (PBQ,saturated,irreducible top)=(true,true,true),(false,false,true),(true,false,true) | Consistent  None to mathematics |
| MS.4.4 | Split with scalar grade maps2,3 | Recovered overconvergent map diag(2,3), each top rank1=1; zero has empty sum rank0=0 | Consistent  None to mathematics |
| MS.4.5 | J, split equal-slope square, Legendre-Kummer | (a,b)=(-1,0),(0,0),(1,0); J nonsplit PBQ and unsaturated; equal square PBQ/saturated/reducible top; rank3 Kummer extension saturated/non-PBQ | Consistent  None to mathematics |
| MS.4.6 | Unit map2; J versus unit; proper curve | Unique lift2; J/unit ranks2!=1 excluded by saturation; proper irreducible filtered object's top rank equals full rank | Consistent  None to mathematics |
| MS.4.7 | Split quotient to L_0; unit quotient | Bad kernel slope1>0 rejects quotient; unit kernel rank0 and quotient rank1, lift2=2 | Consistent  None to mathematics |
| MS.4.8 | O(1), map2, dual twice | Slopes -1->1->-1; scalar2->2->2; lifted arrow has original direction | Consistent  None to mathematics |
| MS.5.1 | Zero; dagger line; Legendre unit-root line | Hull ranks0,1,2 from subobject ranks0,1,1; double hull same0,1,2 | Consistent  None to mathematics |
| MS.5.2 | Ordinary Legendre; zero; diagonal in unit square | First-step ranks1=1 despite hull rank2; zero0=0; diagonal stays same subobject, not just same rank | Consistent  None to mathematics |
| MS.5.3 | n=1,2, ambient unit and N=0; n=2 split | Ambient first-step ranks1,2; subobject ranks0,0. Split induced slopes0,0,1,1, rank4, minimal step rank2=2; slope1 block polynomial T^2-q^2 | Consistent  None to mathematics |
| MS.5.4 | N=0,M; unit-square diagonal | Dual image ranks0,rank M,1; dualized hull ranks0,rank M,1; diagonal restriction (a,b)->a+b and hull diagonal | Consistent  None to mathematics |
| MS.5.5 | Generic constant split M; N=L_0 or0 | Hull N=N, first-step ranks1=1 or0=0; slopes0=0; generic residue k(t), not k((t)) | Consistent  None to mathematics |
| MS.5.6 | Artin-Schreier y^p-y, p=2,3; identity | Degree p, derivative -1, ramification index p at infinity; identity degree1 | Consistent; no tame assumption  None to mathematics |
| MS.5.7 | Legendre unit-root line; proper curve; zero | Hull rank2, first-step rank1=rank N; proper hull=N; zero0=0 | Consistent  None to mathematics |
| MS.5.8 | P2/F_(p^2) with line; Dwork on A2 restricted x=0 | H0 K-dimensions2=2; non-docile Dwork dimensions0!=1 | Consistent; docility essential  None to mathematics |
| MS.6.1 | Identity curve; constant field extension curve at origin | Residue-rational lifts1 versus0; pullback ranks1 versus1; wrong image-only condition would accept second curve | Consistent  None to mathematics |
| MS.6.2 | Unit; split N=L_1+L_0 with M=L_1 | PBQ source on curve rank1 and quotient rank1; surjection/injection both identities on L_1 | Consistent  None to mathematics |
| MS.6.3 | Equal constant lines and map2; distinct constant multipliers | Ranks1=1, fibre multipliers a=a; a!=b forces Frobenius-equivariant scalar0, excluded | Consistent  None to mathematics |
| MS.6.4 | Unit-square to unit; slope1 line identity | Unit-root source slopes0,0, target0; scalar projection rank1; slope1 identity target slope1, unit-root-source hypothesis=false | Consistent  None to mathematics |
| MS.6.5 | Quadratic coefficient line; scalar extension; degree2 pushforward | Underlying K-rank2/[L:K]2=1; forgetting action then tensoring gives coefficient rank2; base change rank1, pushforward rank2 | Consistent  None to mathematics |
| MS.6.6 | Point multiplier2, n=1,2; affine line unit | Traces2=2 and4=4; affine line compact-support F=q yields #A1(F_(q^n))=q^n; dual twist O(-1) multiplierq | Consistent  None to mathematics |
| MS.6.7 | m=1,2, cyclic swap T | m=1 Av=id; m=2 Av(1,0)=(1/2,1/2)=TAv; primitive trace1, identity trace2, cyclic composites2 versus4 | Consistent  None to mathematics |
| MS.6.8 | Unit, connected curve; Y=X disjoint union X | End map identity on Qbar; disconnected case a->(a,a), kernel0, (1,0) outside image | Consistent  None to mathematics |
| MS.6.9 | F=2 over F3; golden-ratio L-line | w=2log_3(2), 3^(w/2)=2; forgotten K-spectrum absolute values1.618034,0.618034, distinct weights +-0.876; polynomial residues2,2,1 at0,1,2 | Consistent  None to mathematics |
| MS.6.10 | Equal unit lines on A1; unequal lines on a point | Hom weight0, L-function (1-qt)^(-1), pole at1/q; unequal eigenvalues a!=b violate fibre equality | Consistent  None to mathematics |
| MS.6.11 | Lines with g'=2 and h=3, m=1,2 | tau=3/2, g'tau=3; invariant averaging (3+3)/2=3 | Consistent  None to mathematics |
| MS.6.12 | Unit lines, requested h=1; other lift2 | Both maps1,2 are isomorphisms, only1 induces h; zero is not invertible | Consistent, existence is weaker  None to mathematics |
| MS.6.13 | Equal rank-one objects, nonzero scalar2 | Top/full ranks1=1; equal weight difference0; induced map rank1 | Consistent  None to mathematics |
| MS.6.14 | Labelled lines with g'=2,h=3 | h Top(g')^(-1)=3/2, inverse2/3, (3/2)2=3; wrong composite h Top(g') is not typed | Consistent  None to mathematics |

Standing hypotheses exclude the zero coefficient ring, equal-characteristic coefficients, `q=1` and an empty irreducible object. The zero module is nevertheless allowed where appropriate: it is not PBQ, is saturated, has empty PBQ filtration and zero hull; no numerical maximal slope is assigned to it. The tests use `p=2,3` where signs, growth and induction matter. The restriction `p≡1 mod4` is confined to the Legendre–Kummer example, not the general library.

Additional checks in the complete ledger include the bounded-quotient universal property and quotient criterion, unit-root tensor nonvanishing, base change, image-versus-linearisation kernels, all three extension slope orders, and coefficient forgetting. For example, `(E†)² → E`, `(a,b)↦a+αb` with `α∉E†`, has dagger kernel 0 and completed kernel dimension 1; no Frobenius structure is claimed for arbitrary `α`. For the rank-three CT11 example, the first PBQ step has rank 2 and maximal slope 1, and its rank-one quotient has slope 1/2. For a quadratic coefficient line, coefficient rank is `2/2=1`; forgetting the action and tensoring gives rank 2 instead. These distinguish the carrier and coefficient conventions used in the reconstruction arguments.

### Seeded source sample and source support

No author-flagged unverified locator occurs in the README. The nine cited works have nine existing manifest keys. No fetch, duplicate key or manifest alteration was needed; the two settled uncertified sources were not requested again.

| Target | Source and exact locator read | Comparison |
| --- | --- | --- |
| PBQ over complete generic/local fields, MS.0.9 | TSU Definition 3.16, p.16, TSU line 864; Lemma 3.17, TSU line 869 | Purity is that of the maximally bounded quotient. Nonzero quotients retain the maximal slope. |
| PBQ over bounded disc and bounded Robba field, MS.0.9 | TSU Definition 3.22, p.17, TSU line 920; CT11 Definition 5.1, printed p.55, CT11 line 996 | Both are defined through extension to the Amice field. |
| Alternative PBQ zero convention | OHK Definition 5.10 and Lemma 5.11, p.27, OHK line 1336 and line 1343 | OHK line 1341 includes zero; README:165 and MS.0.9 explicitly choose the nonzero convention. |
| Curve PBQ, MS.2.1 | TSU Definition 3.26, p.18, TSU line 991 | Generic module on a nonempty affine open, with lift and compatible Frobenius; not fibrewise isoclinicity. |
| Lefschetz condition, MS.6.1 | TSU §6.3, p.28, TSU line 1456 | Separated finite-type base, irreducible object, smooth witness curve, morphism, residue-rational point and irreducible restriction retained. Merely meeting the image does not suffice. |
| Coefficient Lefschetz input | AE §1.1, p.4, AE line 153; Theorem 3.10, p.17, AE line 747 | Scalar-extension category and factorisation of each selected closed point through the curve agree with the declared contract. |
| Repaired MS.4.2 route | TSU Proposition 6.1 proof, p.26, TSU line 1352; compare TSU line 869 and line 1016 | The printed overconvergent reference is inappropriate for the convergent image. The repaired generic/convergent quotient input applies. |

Also compared the convergent construction with TSU line 1357–1362 and its interior gluing model at TSU line 1035–1097; the descent and filtration statements with TSU line 878–929 and line 997–1110; growth comparison with OHK Theorem 7.6(ii), pp.36–37, OHK line 1933–1941; the induced-object distinction with DAD Lemma 4.1.4, p.12, DAD line 451–457; and the coefficient trace argument with TSU Proposition 7.12, pp.33–34, TSU line 1709–1776. The cited preprint versions are the manifest versions, so their numbering is not silently attributed to a different edition.

### Pins, acceptance file and headline inventory

The pins in `lake-manifest.json` agree with the package: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. I opened the following declarations at those pins:

| Pinned declaration | Pinned file and line | Scope actually supplied |
| --- | --- | --- |
| `LinearMap.quotKerEquivRange` | `Mathlib/LinearAlgebra/Isomorphisms.lean:39` | Quotient by kernel to image; no analytic descent. |
| `Representation.averageMap`, `averageMap_invariant`, `averageMap_id` | `Mathlib/RepresentationTheory/Invariants.lean:126`, :131, :137 | Finite group and invertible cardinality, explicit at :121. |
| `LinearMap.trace`, `trace_one` | `Mathlib/LinearAlgebra/Trace.lean:75`, :190 | Definition is zero outside the finite-basis branch; identity formula uses finite/free context at :168. |
| `Padic.norm_p_pow` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:881` | Standard prime-adic norm, natural exponents. |
| `FixedPoints.subfield` | `Mathlib/FieldTheory/Fixed.lean:103` | Fixed subfield of the monoid action. |
| `WittVector.Isocrystal`, `isocrystal_classification` | `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`, :179 | The structure extends Module with `frob : V ≃ᶠˡ[p, k] V`; no connection or finite-rank field. Classification is rank one over algebraically closed residue field. |
| `PowerSeries.derivative` | `Mathlib/RingTheory/PowerSeries/Derivative.lean:50` | Formal derivation, without a chosen compatible Frobenius lift. |
| `PowerSeries.HasGaussNorm.subring`, `mem_subring_one_iff` | `TauCeti/RingTheory/PowerSeries/Bounded.lean:63`, :81 | Positive-radius weighted boundedness; radius 1 gives bounded coefficients. |
| `PowerSeries.OnOpenDisc.subring` | `TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean:295` | Analytic series on the open disc. |

That is 14 named package references. I additionally opened `PowerSeries.OnOpenDisc.derivative` at :342: derivative stability alone supplies no differential Frobenius-module category. Object searches at both pins found no PBQ, dagger hull, Amice-field, bounded-Robba-field or overconvergent-isocrystal carrier. Amice transforms of measures are different objects and do not supply an Amice coefficient field. There is no reason to force these headlines through bare linear algebra or arbitrary predicates.

The prescribed `lake env lean` command, run from the content checkout against the absolute package file, exited **0 with no output and no warnings**. The file has exactly one `import Mathlib`, its module docstring and the correct empty namespace. It has **0 declarations**, **0 sorried theorems**, **0 sorried data**, **0 examples**, and **0 set_option occurrences**. Therefore the exhaustive one-tactic padding-probe inventory and exhaustive `#check @name` inventory each have **0 entries**. No Tau Ceti build was necessary. There is no padding or silently discarded declaration hypothesis.

| Headline results advertised in the README | Acceptance-docstring coverage |
| --- | --- |
| Bounded splitting; local PBQ filtration; growth/slopes; local reconstruction (MS.0.7, MS.1.1, MS.1.8, MS.3.7) | Explicit at Suggested.lean:29–32. |
| Curve PBQ; curve rank; specified-map and dual minimal-slope theorems (MS.2.5, MS.4.2, MS.4.6, MS.4.8) | Explicit at :19–28. |
| Minimal slopes on curves; docile full faithfulness (MS.5.7–MS.5.8) | Explicit at :24–25, :36–37. |
| Finite-field existence and specified-map theorems (MS.6.13–MS.6.14) | Explicit at :33–35. |
| Opposite slope bound; bounded graded formula; local descent (MS.0.4, MS.1.2, MS.1.4–MS.1.5) | Not separately accounted for; R01 adds their absent analytic module and filtration carriers. |
| Curve intersections, gluing, finite étale transport, bounded quotient, convergent filtration (MS.2.2–MS.2.3, MS.2.6–MS.2.7, MS.2.9) | R01 makes coverage explicit, including the convergent variant. |
| Local graded recovery, curve irreducibility and graded recovery (MS.3.6, MS.4.3–MS.4.4) | Missing; R01 adds the category, PBQ-grade and saturation dependencies. |
| Minimal-slope reductions, generic minimal slopes, affine-line reduction (MS.5.3, MS.5.5–MS.5.6) | Missing; R01 adds dagger hulls and their module categories. |
| Fibre reconstruction, coefficient trace formula, projected average, fibrewise criterion (MS.6.3, MS.6.6–MS.6.7, MS.6.10) | Missing; R01 adds coefficient isocrystals, fibres, cohomology and weights. |

No statable headline was found missing. R01 is the incomplete documentation of the other advertised theorems, not an objection to an empty acceptance file.

### Supplier order, ownership and declared gaps

I read all **69 target Needs paragraphs** and all **seven layer dependency paragraphs**, including continuation lines. The 72 distinct explicitly numbered parent IDs resolve at the current indexed head of **#1002 PadicDifferentialEquationsAndRigidCohomology**. Their statements were compared with the consumed interfaces; the reference inventory is below. Each `id:line` locates the heading in `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md` at that head.

| Parent layer | Resolved target and heading line |
| --- | --- |
| RD.0 | RD.0.1:722, RD.0.9:957, RD.0.17:1166, RD.0.26:1413, RD.0.34:1602, RD.0.35:1639, RD.0.36:1672, RD.0.37:1712, RD.0.38:1737, RD.0.39:1758, RD.0.42:1836, RD.0.48:2015, RD.0.53:2159 |
| RD.1 | RD.1.13:2629, RD.1.22:2865, RD.1.25:2939, RD.1.27:3006, RD.1.32:3115, RD.1.35:3179, RD.1.36:3216, RD.1.37:3246, RD.1.39:3287, RD.1.40:3307, RD.1.41:3331, RD.1.43:3366, RD.1.44:3408, RD.1.45:3430, RD.1.72:4117 |
| RD.2 | RD.2.22:4770, RD.2.28:4969 |
| RD.3 | RD.3.15:6057, RD.3.16:6073, RD.3.19:6148, RD.3.22:6233, RD.3.25:6317, RD.3.29:6430, RD.3.31:6477, RD.3.32:6503, RD.3.33:6534, RD.3.34:6572, RD.3.37:6704, RD.3.38:6741, RD.3.39:6763, RD.3.40:6790, RD.3.41:6808, RD.3.45:6939, RD.3.47:6992, RD.3.48:7024 |
| RD.4 | RD.4.19:7642 |
| RD.5 | RD.5.2:8765, RD.5.4:8793, RD.5.7:8856, RD.5.8:8880, RD.5.8c:8946, RD.5.29:9405, RD.5.89:10727, RD.5.100:10972, RD.5.103:11081, RD.5.112:11313 |
| RD.6 | RD.6.2:11524, RD.6.4:11589, RD.6.23:12040, RD.6.28:12135, RD.6.42:12468, RD.6.47:12638, RD.6.57:12904, RD.6.59:12967, RD.6.60:12997, RD.6.61:13012, RD.6.77:13328, RD.6.82:13427, RD.6.85:13496 |

The newly used sections really supply isoclinic subquotient closure, the abelian convergent category, and exact faithful realisation. The parent's slope normalization uses `v_π`; division by `v_π(q)` gives this package's convention. For `q=p²`, eigenvalue `p²` has raw slope 2 over the unramified field and 4 when `e=2`, but normalized slope 1 in both cases. Tate `O(1)` has slope −1 in both packages after this conversion. The source settings for generic `k(t)` versus local `k((t))` remain distinguished.

The other supplier scopes and sections were reopened on main: `TauCetiRoadmap/AlgebraicCurves/README.md:478` (Layer 2, Dedekind local intersections) and :1468 (Layer 12, regular projective models, smooth over perfect fields); `TauCetiRoadmap/RigidAnalyticGeometry/README.md:434` (Layer 5, finite-cover Tate acyclicity). Their openings and layer organization were also read for the house-shape comparison.

All nine gaps have a named parent supplier and **byte-equal needs sentences** in README and `design/plan.json`, with matching slugs. The parent sections were inspected for what is missing, not merely for their headings:

| Declared gap | Missing extension, compared with parent |
| --- | --- |
| extended-log-robba-growth | Extended logarithmic embedding, injective multiplication and eigenvector growth, beyond RD.0.34/RD.2.28. |
| dejong-disc-robba-submodules | Saturated submodule comparison with the bounded disc, beyond local morphism full faithfulness RD.5.4. |
| unit-root-correspondence-perfect-base | General fixed coefficients over a perfect base, beyond RD.3.48's ordinary Witt coefficients and RD.6.61's finite-field setting. |
| legendre-kummer-extension | Specified cohomology and Frobenius eigenspace classifying the extension, beyond the Kummer carrier RD.6.47. |
| irreducible-iota-purity | Absolute coefficient irreducibility and coefficient-linear purity in every smooth dimension, beyond RD.6.77. |
| lefschetz-curves-irreducibility | Curve through a finite set preserving absolute coefficient irreducibility; not supplied by the parent's existing curve results. |
| docile-curve-restriction | H⁰ restriction theorem, beyond logarithmic extension RD.5.103. |
| coefficient-linear-weil-ii | Weight bound for the retained L-linear coefficient spectrum, beyond the parent's K-linear RD.6.85. |
| dejong-generic-affine-line-comparison | Embeddings and multiplication injectivity for residue k(t), beyond the local complete-residue-field RD.0.53/RD.5.2. |

These are precise extensions, with their needed hypotheses. The construction and compatibility clauses in a single gap concern its one supplied interface, rather than unrelated requests. None has supplier `none`, asks this package to duplicate a known input, or disguises an undeclared missing prerequisite. They remain supplier contracts; the documentation finding does not alter them.

The prescribed dependency check printed:

```text
depcheck: 240 roadmaps, 2176 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. `roadmaps resolve` found no unresolved cross-roadmap citations or local Lean names; its explicit omission of pinned-library checks was covered manually above. No package theorem identifier was removed by the repair.

I read the supplied board-package index, open-work index and overlap report before searching. The main checkout has no second copy of this Part II. Object searches used `roadmaps grep` across main and the indexed open heads, the available board contents and pinned libraries. PBQ and dagger hull searches found no competing owner. The unrelated “Lefschetz condition” in **#1725 SatoTateGroups**, `TauCetiRoadmap/SatoTateGroups/README.md:888`, compares a compact group's centralizer and commutant; it is not the curve condition here.

All five scopes in the current closest-open list were read:

- **#1002**, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:50`: analytic coefficient rings, slope foundations, isocrystals, rigid cohomology and weights are the imported base, not re-planned here.
- **#2289**, `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:25`: reductive-group Kloosterman/Bessel objects and their comparisons. Its :99–100 expressly imports this Part II's MS.4.6; it does not own a second curve reconstruction theorem.
- **#2265**, `TauCetiRoadmap/CrystallineCohomologyPartII/README.md:8`: Witt cohomology of singular varieties and comparison to the slope-below-one part of rigid cohomology; :14–16 leaves coefficient rigid cohomology to the parent. This is not PBQ or dagger-hull theory.
- **#879**, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:52`: finite flat groups, integral classifications and their Robba inputs. Its §R07.4.7–R07.4.8 coefficient carriers are shared imports, not new PBQ constructions.
- **#1062**, `TauCetiRoadmap/PadicHodgeTheory/README.md:7`: rational periods and geometric comparisons; :14–20 assigns analytic rings and ordinary isocrystals to their suppliers. No PBQ or minimal-slope reconstruction ownership.

The other two closest-roadmap lists are empty. No conflicting head, dropped cited ID or revision-only ID is listed in the supplied overlap report, and no such collision appeared in the inspected scope/citation checks. Ownership claims are limited to the readable indexed heads and available board checkout; the index's other package branches were not treated as if they were local files.

Overlap check: read PadicDifferentialEquationsAndRigidCohomology, KloostermanSheavesAndBesselIsocrystals, CrystallineCohomologyPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory; shared analytic and isocrystal inputs belong to the named parent/suppliers, ordinary Witt slopes to CrystallineCohomology, and curve minimal-slope reconstruction to this Part II (explicitly imported by KloostermanSheavesAndBesselIsocrystals); no duplicate ownership found.

### Principles, shape and source independence

The roadmap extends its parent and states where it stops. Its curve results retain perfect residue fields, general mixed-characteristic discretely valued coefficients and all primes. No route-specific replacement theorem, algorithm, forbidden supplier, process narrative, HTML anchor, machine path, sorry'd data or `set_option` was found in the mathematical package. Every own backticked expression was classified as mathematical notation or a supplied library name; no undeclared own Lean API name was found.

There are **69 numbered targets**, **seven layers**, **20 definition/API blocks** and **69 target Needs paragraphs**. Definition Check counts, in their order, are `3,5,4,4,3,3,3,5,3,3,3,3,3,3,3,3,3,4,3,4`. Each layer closes with Examples and Dependencies. Targets have hypotheses and locators; the proofs identify their mathematical inputs. The only requested repair is R01.

For wording, I compared 15 roadmap/source pairs across five sources: MS.0.9 against TSU twice, CT11 and OHK; MS.2.1 and MS.6.1 against TSU; MS.6.9 against AE; MS.4.2, MS.0.3, MS.2.3, MS.3.4 and MS.6.6 against TSU; MS.1.8 against OHK; MS.5.1 against DAD; and the Lean headline docstring against TSU's introduction. The five further prose sections include a definition and several proof routes. A normalized alphabetic-token comparison found longest shared runs of 3–8 words, all forced mathematical descriptions or standard names. Reading the sentences beside the cited passages found no copied expression or clause-by-clause paraphrase. The extended repair route independently distinguishes the convergent image and cites its actual inputs.

Counting author-attributed locator passages before References, including the corrections section and counting a combined theorem/page citation as one passage, gives: TSU 100, DAD 17, OHK 12, CT11 7, AE 5, KED04 1, KED05 1, DEJONG98 1, TSU98 1; total 145. TSU has the largest share. Its complete numbered section inventory was read directly from the cached text (TSU line 191, 540, 1147, 1241, 1340, 1506 and their subsection headings); there is no separate contents page to rely on.

The arrangement is not a one-to-one reproduction: MS.0 draws on TSU §§2–3 and Appendix A; MS.1 combines local descent with CT11 and OHK growth theory; MS.2 isolates curve gluing and adds the convergent variant; MS.3 combines TSU §§4–5; MS.4 uses the rank theorem to obtain reconstruction; MS.5 supplies the different DAD hull branch; MS.6 combines TSU §6.3/§7 with coefficient and AE inputs. The order is forced where it agrees with TSU: MS.1.1 needs MS.0.7/MS.0.10; MS.2.5 needs local descent and gluing; MS.4.2 needs MS.2.9/MS.4.1, and MS.4.6 needs MS.4.3/MS.4.4. MS.5.7 then consumes MS.4.2, while MS.6.3 consumes the curve theorem. No layer is named for a source chapter. No reused table, figure, exercise list or public-formalisation declaration was found.

Source independence: 15 passages compared with 5 sources; shared wording is limited to standard mathematical terms and forced hypotheses; largest share TSU, 100 of 145 locator passages; contents compared with TSU's complete section inventory: independent, with the common build order justified by the stated dependencies.

## Not verifiable

- DEJONG98, Proposition 6.4: settled uncertified/paywalled. The contract's precision and ownership were checked; the original text was not read or requested again.
- TSU98, Theorems 4.2.6 and 7.2.3: settled uncertified/paywalled. Their use in TSU and the declared contract were checked; the original text was not read or requested again.
- Ownership against package branches unavailable in this checkout is not claimed. The supplied readable open roadmap heads, main and available board contents were checked.
- Elaboration verifies the acceptance file's syntax/imports, not the truth of the unformalized general mathematics. The tables give computed adversarial evidence, not formal proofs.

## Source issues

- **Misprint** in TSU at Proposition 3.18, printed page 16: the source says a unit-root tensor factor always preserves and reflects PBQ; it should require that factor nonzero under its PBQ convention; affects a stated result.
- **Misprint** in TSU at Theorem 3.19(1)–(2), printed pages 16–17: the source says nested terms have decreasing maximal slopes and their tops give the bounded quotient; it should use successive grades in both assertions; affects a stated result.
- **Misprint** in TSU at Lemma 3.31, printed page 19: the source says the pushed object lies on the base and the pulled object on the cover; it should interchange those starting curves; affects a stated result.
- **Gap** in TSU at proof of Lemma 3.31, printed page 19: the source says its pullback argument concludes PBQ of the original object and then cites itself; it should prove pullback through generic bounded-quotient base change; affects the proof.
- **Gap** in TSU at proof of Lemma 3.33, printed page 20: the source says its unit-root gluing lemma applies directly to a rank-one generic module; it should first normalize coefficients and twist its slope to zero; affects the proof.
- **Misprint** in TSU at proof of Proposition 6.1, printed page 26: the source says overconvergent quotient closure determines the slope of the convergent image; it should use Lemma 3.17(2) on generic modules; affects the proof.
- **Misprint** in TSU at proof of Corollary 6.8, printed page 29: the source says the intermediate curve isomorphism has target the restriction of N; it should have target the restriction of M; affects the proof.
- **Misprint** in TSU at proof of Proposition 7.12, printed page 34: the source says twisting Frobenius by lambda multiplies its n-th trace by lambda; it should multiply by lambda to the n-th power; affects the proof.
- **Misprint** in DAD at proof of Lemma 4.1.4, printed page 12: the source says the sum of induced hulls equals its first slope step; it should apply the first-step operator to that initial sum; affects the proof.
- **Misprint** in OHK at Corollary 5.12, printed page 27: the source says any quotient of an arbitrary module is PBQ; it should assume the source module is PBQ; affects a stated result.

These source issues do not add package findings: the relevant package hypotheses and corrected formulas already avoid them. For the last one, the identity quotient of `L_1 ⊕ L_0` has bounded slopes `{1,0}` and is not PBQ. For the trace correction, a constant line with multiplier 2 at n=2 contributes 4, not 2. The source lines underlying these entries are TSU 872, 878, 1019, 1026, 1062, 1352, 1493, 1767; DAD 455; OHK 1350.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b8e3dcb209942053be96c2c338d5770eda9c4e9a", "job": "REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~6", "model": "gpt-6-astra", "worker": "chris-6"} -->
