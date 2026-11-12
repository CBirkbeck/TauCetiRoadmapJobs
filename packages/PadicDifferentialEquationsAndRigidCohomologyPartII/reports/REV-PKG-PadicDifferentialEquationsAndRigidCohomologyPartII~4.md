<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6789558408 -->
Review (codex) of 93f51c7

Verdict: needs_changes

1. **F01** (P1) The curve rank proof needs a convergent PBQ filtration

   **Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1462`: “Let `H = ker(N → P)` and let `L` be its maximally PBQ convergent subobject”. The same input is used at line 1472 and attributed to MS.2.5 at line 1474.

   **Claim.** The earlier curve PBQ theory supplies a maximally PBQ subobject of the convergent kernel H, with the generic and interior compatibility needed for gluing.

   **Witness.** MS.2.1 (line 964) defines PBQ only for overconvergent objects; MS.2.5 (line 1085) supplies only their filtration. TSU line 1359 explicitly introduces a separate convergent version in the proof of Proposition 6.1, printed page 26.

   This is not supplied by MS.1.1 either: that theorem is over a field, and does not descend its subspaces to a convergent isocrystal on the curve. No convergent PBQ-filtration target occurs elsewhere in this README or in the inspected suppliers. MS.2.3 glues overconvergent objects and requires boundary data; invoking it to establish this prerequisite would assume the boundary conclusion that MS.4.1 is trying to prove.

   The domain difference matters. On the ordinary locus of the irreducible rank-two Legendre object used in MS.2.7, let P be its slope-one quotient. The kernel H is a rank-one, slope-zero convergent object. It is not overconvergent: otherwise full faithfulness would make its inclusion a proper nonzero overconvergent subobject of the irreducible Legendre object. This example has equal top and quotient ranks, so it is a test of the missing prerequisite, not a counterexample to the strict-rank contradiction lemma.

   **Exact repair.** Extend the curve PBQ definition and filtration targets to convergent F-isocrystals on a smooth connected curve over the stated perfect field. State existence and uniqueness, the decreasing maximal slopes of successive PBQ grades, and agreement with the generic filtration and bounded-disc filtrations at every interior point. Use completed affine sections for the convergent realization and impose no boundary overconvergence. Cite TSU, proof of Proposition 6.1, p. 26, lines 1357–1362, and give the descent/gluing argument from the local PBQ results. Retain the overconvergent refinement with its additional boundary compatibility. Point MS.4.1's Needs line explicitly to the convergent result. This theory belongs here, not in a new supplier gap.

   **Retest.** For the kernel above, the convergent filtration is `0 ⊂ H`, with generic rank 1, interior rank 1, bounded quotient rank 1 and sole slope 0. It supplies L=H without asserting an overconvergent structure on H. Add this as a negative-control Check, alongside the unit and the split two-slope object. The rank-zero case has no nonzero grades.

2. **F02** (P1) The induction formula takes the first step of the wrong object

   **Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1714`: “Induce an `F^n`-object to `⊕_(i<n) F^(i*)M` with cyclic Frobenius; its first slope step is `⊕_(i<n) F^(i*)S_min(N)`”.

   **Claim.** The first slope step of the induced ambient object M is computed using the subobject N.

   **Witness.** Take n=1, M the unit object on `A¹_(𝔽_p)`, and N=0. The induced ambient object is M and its first step has rank 1; the displayed right side is zero, of rank 0.

   The same mismatch persists at n=2: the induced unit has rank 2 and slopes `(0,0)`, while the displayed right side still has rank 0. DAD line 452–456, Lemma 4.1.4, printed page 12, distinguishes the induced subobject N′ from the induced ambient object M′. The package corrected the source's first-step typo but attached the corrected expression to M′.

   **Exact repair.** Introduce both `M′ = ⊕_(i<n) F^(i*)M` and `N′ = ⊕_(i<n) F^(i*)N ⊆ M′`. State `S_min(N′) = ⊕_(i<n) F^(i*)S_min(N)`; if giving the ambient formula, use M on both sides. Apply the assumed minimal slope property of M′ to N′, using compatibility of the hull with this induction. Add the unit-ambient/zero-subobject example as a Check so that M′ and N′ cannot be interchanged.

   **Retest.** With n=1, the repaired subobject formula has ranks `0=0`, and the ambient formula has ranks `1=1`. With n=2 these are `0=0` and `2=2`. For n=2 and `N=M=L₀⊕L₁`, induction has rank 4 and its first slope step has rank 2 on both sides. The theorem reducing MS(X) to n=1 is retained.

Both findings from round 3 are repaired. Two independent defects remain: a missing convergent PBQ prerequisite and an incorrect object in an induction formula. Neither requires changing the scope or the end theorems. The nine declared supplier gaps are not findings.

## Verified sound

### Previous findings, verified first

Locations below are in `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md`.

| Previous finding | Repaired passage | Disposition and verification |
| --- | --- | --- |
| F01: purity after forgetting coefficients | Lines 2122–2123: “apply the supplier request irreducible-iota-purity to it, with its `L`-structure”; line 2127: “The underlying `K`-object is not used” | **Repaired.** The contract at line 313 requires irreducibility after every finite coefficient extension and uses L-linear Frobenius. The quadratic example at lines 2152–2162 correctly rejects purity after forgetting L. |
| F02: missing discriminating Lefschetz Check | Lines 1898–1901: “`C` carries 0 `k(α)`-rational points over `α` (the identity curve carries 1) and is not a witness” | **Repaired.** For both p=2 and p=3, there is no embedding of `𝔽_(p²)` into `𝔽_p`. The pullback unit still has rank 1; LC itself still has the identity witness. |

The repair also strengthens the Lefschetz supplier contract to absolute irreducibility over its finite coefficient model. This is correct: the constant rank-two object with polynomial `T²−T−1` is irreducible over ℚ₃ but splits after extending to ℚ₃(√5). The revised Convention 10, MS.6.5 caveat, MS.6.9 definition and its three API assertions, two changed gap descriptions, added Checks and Layer MS.6 example were read and tested. The nine plan/README gap descriptions agree exactly. No prior finding was marked not actionable, and neither new finding re-raises a settled finding.

### Scope, shape and generality

Read all 68 numbered targets, their 68 Needs lines, all seven layer dependency paragraphs, the 2,432-line README, the Lean file, metadata, manifest and plan gaps. The previous computed rows were used as corroboration, not as a substitute for reading the targets; the table below records additional and repeated computations, including the sampled definition, all end theorems and both findings.

The scope is a Part II extension: the parent owns the analytic rings, Frobenius/connection carriers, slope theory, full faithfulness, cohomology and weights; this package owns bounded quotients, PBQ, saturation, hulls and reconstruction. It does not narrow the general theorems to favorable primes. The congruence restriction in the Legendre example belongs to that example. No computational algorithm, copied source passage, sorry'd data, `set_option`, HTML anchor, machine path or process narrative was found in the mathematical package files.

The seven mathematical layer names and their order are supported by dependencies: bounded quotients feed PBQ; local PBQ feeds curve PBQ and saturation; those feed curve reconstruction; coefficient and Lefschetz theory feeds the finite-field theorems. No source-chapter heading or claim to follow a source's organization occurs. Main-branch shape comparisons were `TauCetiRoadmap/AlgebraicCurves/README.md` and `TauCetiRoadmap/RigidAnalyticGeometry/README.md`.

There are 19 explicit API blocks. Their Check counts, in document order, are `3,5,4,4,3,3,3,3,3,3,3,3,3,3,3,3,4,3,4`. The new purity API has four Checks. Each numbered target has a locator. The backticked notation for mathematical objects is not presented as newly declared Lean identifiers; no claimed local Lean declaration is missing. R01 is the separate completeness defect in the convergent version of the PBQ construction.

### Computed adversarial table

Here L_s is a constant slope-s line. Log has connection `∇e₂=e₁ dt/t`, Frobenius `F(e₁)=q⁻¹e₁`, `F(e₂)=e₂`. Its bounded quotient is the unit line. These computations test hypotheses, conventions and wrong models; they do not constitute proofs of the deep theorems.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Coefficients and slope conventions | q=p², F=diag(1,p²); ramification e=2; iterate twice | Raw slopes `(0,2)` become `(0,1)`; ramified raw 4 divided by 4 gives 1; iterated raw `(0,4)` divided by 4 again gives `(0,1)` | Correct; q=1, zero coefficient ring and characteristic-p coefficient field are excluded |
| Solution and Tate conventions | F=a line; O(1); dual twice | Solution eigenvalue a⁻¹; Tate slope −1; dual slope +1; scalar map 2 dualizes twice to 2 | Correct |
| MS.0.1 generic/local fields | `A¹_𝔽₂`, factorial-gap series | Generic residue field `𝔽₂(t)`; local residue field `𝔽₂((t))`; arbitrarily long zero runs followed by coefficient 1 violate any fixed rational recurrence | Correct distinction |
| MS.0.2 solutions and native carriers | zero, unit, Log; geometric and logarithm series | Solution dimensions `0,1,2`; bounded dimensions `0,1,1`; sup norms of coefficients of `Σuⁿ`, `Σp⁻ⁿuⁿ`, log are `1,∞,∞`; convergence radii `1,1/p,1` | Correct |
| MS.0.3 fixed-field normalization | Witt algebraic closure; K=ℚₚ(√p), σ=id | Fixed fields ℚₚ and K; `v_p(√p)=1/2`; twist by √p changes slope `1/2` to 0 | Correct ramified case |
| MS.0.4 opposite bound | unit→unit²; split projection to L₀; zero→L₀ and L₁ | First ranks `1<2`, slope `0=0`; split source maximum 1 versus target 0, but dagger kernel rank 1; zero would require incompatible numbers 0 and 1 | Correct injectivity/nonzero controls |
| MS.0.5 bounded quotient | zero, unit, Log | Kernel/quotient ranks `(0,0),(0,1),(1,1)`; iterated quotient ranks `0,1,1` | Correct kernel convention |
| MS.0.6 extension splitting | Log; split L₁⊕L₀ | Log gap `0−(−1)=1`, primitive coefficients at pʳ have norm pʳ→∞; split gap `0−1=−1`, extension class 0 | Boundary and sign distinguished |
| MS.0.7 bounded splitting headline | zero, split two slopes, Log | Split grades have total ranks 0 and 2 with bounded dimensions 0 and 2; Log has rank 2 but bounded dimension 1 and nonzero extension class | Both directions tested |
| MS.0.8 base change | Log; identity; finite constant extension | Bounded quotient rank `1→1`; coefficient norm pʳ remains unbounded; identity map gives identical two-dimensional solution spaces | Correct |
| MS.0.9 PBQ | zero, unit, L₁⊕L₀, Log | Bounded slope sets `∅,{0},{1,0},{0}`; PBQ values `false,true,false,true` | Correct |
| MS.0.10 quotient and sums | split object; empty/one/two unit lines; internal Log sum | Quotient maximum `0<1`; sum ranks `0,1,2`, PBQ `false,true,true`; internal `L₋₁+Log=Log` has bounded slope `{0}`, external sum has `{−1,0}` | Correct nonemptiness and internal/external distinction |
| MS.0.11 tensor | M=unit, U=0 or unit; M=L₁⊕L₀ | Tensor ranks 0 and 1 give PBQ pairs `(true,false)` and `(true,true)`; nonzero unit-root factor keeps both slopes 0 and 1 of split M | Correct iff with U≠0 |
| MS.1.1 filtration headline | zero; L₁⊕L₀ | Lengths 0 and 2; grade maxima `(1,0)` versus nested maxima `(1,1)` | Correct |
| MS.1.2 bounded grades | split object; Log | Split bounded slopes `(1,0)` equal grade-top slopes `(1,0)`, not `(1,1)`; Log has one top of rank 1 | Correct |
| MS.1.3 filtration base change | split object and Log under constant extension | Split grade ranks `(1,1)→(1,1)` and slopes `(1,0)→(1,0)`; Log bounded quotient ranks `1=1` | Correct |
| MS.1.4 Robba descent | rank-one and split L₁⊕L₀ | Filtration lengths 1 and 2; first-step ranks 1 and 1 before/after completion | Correct |
| MS.1.5 disc descent | constant line; split disc module | Grade ranks `(1)` and `(1,1)` over disc, E† and E; finite-free quotient ranks 0 and 1 | Correct tests; de Jong source access remains settled uncertified |
| MS.1.6 growth definition | constant, log, polynomial; λ<0 | Constant exact growth 0; log coefficient norm pʳ at n=pʳ forces growth ≥1; a polynomial satisfies a negative-exponent bound but the defined negative class is 0 | Wrong inequality-only definition excluded |
| MS.1.7 eigenvector bound | Log eigen-solutions; unit | `(μ,λ,λmax)=(0,0,0),(1,1,0)` gives equalities `0=0`, `1=1`; at λ=0 the slope-one solution is excluded | Correct |
| MS.1.8 growth/slope headline | Log, λ=−1,0,1; p=2,3 | Growth dimensions `0,1,2` equal shifted-slope dimensions `0,1,2`; `pʳ/(pʳ+1)^λ` is unbounded for λ<1 | Correct shift and small-prime cases |
| MS.1.9 bounded evaluation | F=a line; bounded non-PBQ diag(1,q) | Solution and evaluation eigenvalues `a⁻¹,a`; latter object's bounded solution slopes `(0,−1)` are two distinct slopes | Correct dual and PBQ hypothesis |
| MS.2.1 curve PBQ | zero, line, constant split | Generic bounded ranks `0,1,2`; slope sets `∅,{0},{1,0}` give `false,true,false` | Correct overconvergent definition; convergent counterpart missing, R01 |
| MS.2.2 intersections | `Σpⁿx^(pⁿ)` on G_m; pole 1/x on A¹ | At 0 coefficients are bounded; at infinity `p⁻ⁿρ^(−pⁿ)→∞`; 1/x has order −1 at 0 and is excluded | Both local conditions discriminate |
| MS.2.3 gluing | generic zero and whole object; slope-one line | Glued ranks `0=0` and `r=r`; constant slope 1 becomes 0 only after twisting by q⁻¹ | Correct rank-one normalization |
| MS.2.4 curve sums | empty/one/two unit lines; Log quotient | Sum ranks `0,1,2` with PBQ `false,true,true`; Log's unit quotient has maximum `0=0` | Correct |
| MS.2.5 curve filtration headline | split; irreducible line; convergent ordinary line | First two have lengths 2 and 1, grade slopes `(1,0)` and `(0)`; ordinary convergent line has rank/top rank 1 but is outside the stated overconvergent domain | R01: add the convergent variant |
| MS.2.6 finite étale transport | `y↦yᵖ−y`, p=2,3 | Derivative −1≠0; degrees 2,3; pullback unit rank 1 and pushforward ranks 2,3, all slopes 0 | Correct, including wild boundary |
| MS.2.7 bounded curve quotient | split; ordinary Legendre | Split bounded rank `2=1+1`; Legendre bounded/top rank `1=1`, while original rank is 2 | Correct convergent/overconvergent distinction |
| MS.2.8 Legendre extension | p=5 | Frobenius squares `−3±4i`, moduli 5; untwisted fixed dimension 0; selected eigenspace dimension 1; selected twisted eigenvalue 1 | Correct extension twist and rank 3 |
| MS.3.1 saturation | zero, line, L₁⊕L₀ | Top-map kernel ranks `0,0,1`; saturation values `true,true,false` | Correct |
| MS.3.2 quasi-saturation | inclusion E†→E²; `(a,b)↦a+αb`, α∉E† | First E-span rank 1<2; second dagger kernel rank 0 but linearized kernel rank 1 and span rank 1=target rank | Correct carriers |
| MS.3.3 pure target | unit; split projection; zero | Unit maxima `0=0`, ranks `1=1`; split maxima `1≠0` with kernel rank 1; zero numerical assertion excluded, rank-only assertion `0=0` allowed | Correct |
| MS.3.4 saturated quotient | zero, line, split | Quotient ranks `0,1,1`; repeated saturation ranks `0,1,1`; split kernel rank 1 | Correct quotient, not enlargement |
| MS.3.5 rank/irreducibility | unit inclusion; unit Jordan block over 𝔽_q | Top/target ranks `1=1`; Jordan block PBQ and saturated but top has stable line of rank 1 in rank 2 | Correct conjunction; top irreducibility matters |
| MS.3.6 graded recovery | split object, identity | Recovered grades have ranks `(1,1)` and slopes `(1,0)`; identity scalar on each is 1; nested terms would give slopes `(1,1)` | Correct |
| MS.3.7 reconstruction headline | Log versus its unit saturation; unit h=2 or 0 | Tops both rank 1, total ranks 2≠1; saturation hypothesis rejects Log; line lift is 2, while 0 has rank 0 and is not an isomorphism | Correct controls |
| MS.3.8 global saturation | zero, constant line, constant split on dense opens | Kernel ranks `0,0,1` on every nonempty affine open | Correct |
| MS.3.9 transport | unit under degree-p étale cover; iterated Frobenius | Pullback/pushforward ranks 1,p with zero top-map kernels; raw slope multiplies by a and normalized slope stays 1 | Correct normalization |
| MS.3.10 global quotient | zero, line, constant split | Saturation ranks `0,1,1`; split quotient has kernel rank 1 and top rank `1=1` | Correct |
| MS.4.1 kernel gluing | ordinary Legendre→top; hypothetical strict rank case | In actual example `rank N=2`, `rank P=rank Top(N)=1`, `rank H=1`; H has slope 0 but no overconvergent subobject realizing it | R01: missing convergent filtration input, not a false rank theorem |
| MS.4.2 rank headline | unit identity; split→L₀; zero quotient | Identity `1=1`; split max `1≠0` but section kernel rank 1; zero rank identity `0=0` lacks a numerical slope | Correct exclusions |
| MS.4.3 irreducibility | line; split; Log | Truth tuples `(irreducible,PBQ,saturated,top irreducible)` are `(T,T,T,T)`, `(F,F,F,T)`, `(F,T,F,T)` | Both directions discriminate |
| MS.4.4 graded recovery | constant split, h=diag(2,3) | Grade-top maps are scalars `(2,3)` and lift to the same pair; grade ranks `(1,1)` and slopes `(1,0)` agree | Correct map direction |
| MS.4.5 slope-ordered extensions | Log; split equal slopes; Legendre extension | Log `(a,b)=(-1,0)`, PBQ true/saturated false; equal split `(0,0)` PBQ true/saturated true/top reducible; Legendre ranks `2+1=3`, maxima `(1,0)` | Rank-two conclusion not misapplied to rank 3 |
| MS.4.6 specified-map headline | unit h=2; Log versus unit | Unique lift scalar 2; Log and unit top ranks `1=1` but total ranks `2≠1`, excluded by saturation | Correct |
| MS.4.7 quotient formulation | L₁⊕L₀→L₀ and →L₁ | First kernel slope 1>0 violates hypothesis; second kernel slope 0<1 identifies quotient with Top | Correct direction of strict inequality |
| MS.4.8 minimal-slope headline | O(1), dual, scalar 2 | Slopes `−1→1→−1`; scalar `2→2→2`; two dualizations restore direction | Correct |
| MS.5.1 hull | zero; extendable line; ordinary line in irreducible rank 2 | Hull ranks `0,1,2` versus original ranks `0,1,1`; applying hull again keeps `0,1,2` | Correct nontrivial hull |
| MS.5.2 MS predicate | zero; ordinary line | First-step ranks `0=0` and `1=1`, although hull ranks 0 and 2 | Equality is not equality of whole hulls |
| MS.5.3 induction | n=1 or 2, M=unit, N=0 | Ambient first-step ranks 1 or 2; printed right-hand ranks 0 or 0 | R02: false formula; repaired subobject equality `0=0` |
| MS.5.3 cover reductions | degree-two Galois cover and unit | `f^*f_*1` has two rank-one summands, total rank 2; both first-step ranks 2 | Reduction itself survives R02 |
| MS.5.4 dual image | N=0 and N=M; two-dimensional field-linearization control | Q† ranks 0 and rank M; in the non-descending injection control E† rank 2 maps to E rank 1, leaving a linearized kernel of rank 1 | Correct reason to retain full linearization |
| MS.5.5 generic MS | extendable slope-zero line in L₀⊕L₁ | Hull rank 1, both minimal steps the same rank-one slope-zero subobject; residue remains k(t) | Correct conditional on generic comparison gap |
| MS.5.6 affine-line reduction | identity and Artin–Schreier cover | Degrees 1 and p; derivative of latter −1; ramification index at infinity p | No tame-only restriction |
| MS.5.7 curve MS headline | ordinary line; proper curve; zero | Ordinary case first-step ranks `1=1` despite hull rank 2; proper case hull=N; zero case `0=0` | Correct endpoint; route depends on repairing R01/R02 |
| MS.5.8 docile headline | projective plane and line over 𝔽_(p²); wild Dwork control | Unit horizontal dimensions `2→2` over K; non-docile example has `0→1` | Correct constants and docility |
| MS.6.1 sampled LC | identity at degree-two point; quadratic-constant candidate at origin | Identity has relative residue degree 1, one lift, rank-one pullback; other candidate has 0 rational lifts and rank-one pullback | Repaired negative Check distinguishes image containment from a witness |
| MS.6.2 rank maps | identity unit; N=unit⊕L₋₁→unit | Q ranks 1 in both cases; surjections have ranks `1→1`; lower summand rank 1 discarded in second | Correct |
| MS.6.3 fibre reconstruction | equal rank-one objects, h=2 | Rank inequalities `1≤1≤1`; fibre eigenvalues `a=a`; induced fibre map scalar 2 | Correct |
| MS.6.4 unit-root source | identity unit; identity L₁ | Unit slopes `0=0`; L₁ slopes `1=1`, so conclusion fails when the unit-root source hypothesis is removed | Correct |
| MS.6.5 coefficients | [L:K]=2, coefficient rank 1, then degree-two extension | Forgotten ranks `2→4`; normalized ranks `2/2=4/4=1`; base-field pushforward of unit has coefficient rank 2 | Correct |
| MS.6.6 trace/duality | point F=2, n=2; unit on A¹ | Point traces `4=4`; A¹ trace q equals its q rational points; dual eigenvalues 1 and q pair to q | Correct signs, powers and Tate twist |
| MS.6.7 average | m=2, swap action on (2,4), also p=2 | Average `(3,3)` fixed; projector trace 1 versus identity trace 2; two-slot totals 2 versus 4; denominator 2 remains nonzero in ℚ₂ | Correct |
| MS.6.8 endomorphisms | unit; disconnected doubled target | Identity constants dimension `1→1`; diagonal `Q̄_p→Q̄_p²` has kernel 0 and misses (1,0) | Correct injectivity, no false surjectivity |
| MS.6.9 revised purity | F=2 over 𝔽₃; F=a on ℚ₃(√5)-line | `w=2 log₃2≈1.26186`, `3^(w/2)=2`; `a≈1.618034`, its weight ≈0.876036 | Correct real and coefficient-linear weights |
| MS.6.9 coefficient forgetting control | polynomial T²−T−1 | Mod-3 values `(2,2,1)`; complex root magnitudes `(1.618034,0.618034)`; weights `(0.876036,−0.876036)` | Finite-K irreducibility does not imply purity; repaired contract excludes this input |
| MS.6.9 finite model and degree | same L-line, degree 2; extend L | Eigenvalue `a²=2.618034=3^0.876036`; extension keeps eigenvalue a; forgotten closed-point L-space repeats a² twice | Repaired route preserves weights despite multiplicity |
| MS.6.9 new tensor/twist API | lines with eigenvalues 2 and 3; twist c=2 | Ratio 2/3 has weight `2log_q2−2log_q3`; degree-n twist contributes `2ⁿ`, weight increment `2log_q2` | Correct dual and sign |
| MS.6.9 revised Lefschetz input | constant quadratic object before/after adjoining √5; identity curve | Over ℚ₃ no stable line; over L two stable eigenlines, hence 2 constituents; absolutely irreducible line remains 1 constituent | Correct absolute-irreducibility requirement |
| MS.6.10 fibre criterion | equal lines, unequal lines | Equal case `(1−t)⁻¹` has pole at 1; for eigenvalues a≠b the point polynomials `1−at` and `1−bt` differ | Correct hypothesis test |
| MS.6.11 specified map | g′=2, h=3, m=1 or 2 | Endomorphism lift `3/2`; composite `2·(3/2)=3`; average of two copies of 3 is 3 | Correct direction and normalization |
| MS.6.12 existence | equal lines, h=1, alternative scalar 2 | Scalars 1 and 2 both invertible; only 1 induces h; scalar 0 has rank 0 | Correct weaker conclusion |
| MS.6.13 finite-field headline | unit line h=2; equal irreducibles | Line map has rank `1→1`; equal fibres force equal weights and Hom weight difference `w−w=0` | Correct end theorem, distinct from specified-map statement |
| MS.6.14 specified-map headline | labelled lines g′=2 and h=3 | `h∘Top(g′)⁻¹=3/2`, inverse `2/3`; composing with Top(g′) gives 3 | Correct map direction |

### Sources and seeded sample

The sampled “Lefschetz condition” is MS.6.1. TSU line 1456–1463, §6.3, printed page 28, specifies the separated finite-type base, closed point, smooth curve, residue-field rational point over it and irreducible pullback. The README retains all those data; connectedness of the witnessing curve is consistent with irreducibility. Both directions of the intended witness test were computed above. The surrounding rank and fibre uses match Proposition 6.7 and Corollary 6.8 (TSU line 1468–1496).

For the repairs, AE line 153–183, §1.1, PDF pages 4–5, gives the coefficient category; AE line 539–553, Theorem 2.7, page 13, gives mixedness and the purity input; AE line 747–760, Theorem 3.10, pages 17–18, gives a curve factoring every specified closed point with irreducible restriction. TSU line 1580–1587 gives the isotypic underlying K-object without claiming it pure. TSU line 1814–1825 and 1923–1932 gives the weight and Lefschetz locators. AE supports the stronger finite-set statement used here, although TSU Theorem 7.19 states only a dense-open consequence.

The purity comparison at degree n uses the parent's `F_x=F^n`, not F itself: `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:11440`, §RD.6.2. After coefficient splitting, F cycles the n factors and Fⁿ has conjugate restrictions on them. Thus repeating the selected fibre spectrum n times changes multiplicities, not absolute values. The quadratic test shows why forgetting L is a different operation.

No author-flagged unverified locator remains in the README. All nine cited works have manifest entries under their existing keys. Source versions are identified; the AE locator now explicitly includes §1.1. No source was fetched or manifest entry changed. DEJONG98 and TSU98 remain settled uncertified sources, as recorded below.

### Pinned libraries, ownership and supplier direction

The pins in `lake-manifest.json` match the README: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following 14 referenced declarations were opened at those pins:

| Declaration(s) | Pinned file and line | Verified scope |
| --- | --- | --- |
| `LinearMap.quotKerEquivRange` | `Mathlib/LinearAlgebra/Isomorphisms.lean:39` | Quotient by kernel equals range for modules over a ring; no analytic descent |
| `Representation.averageMap`, `averageMap_invariant`, `averageMap_id` | `Mathlib/RepresentationTheory/Invariants.lean:126`, :131, :137 | Finite group and invertible cardinality; normalized projection onto invariants |
| `LinearMap.trace`, `LinearMap.trace_one` | `Mathlib/LinearAlgebra/Trace.lean:75`, :190 | Trace defined by a finite basis when present; finite-free identity trace equals finrank |
| `Padic.norm_p_pow` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:881` | Natural powers, prime p, norm p⁻ⁿ |
| `FixedPoints.subfield` | `Mathlib/FieldTheory/Fixed.lean:103` | Fixed subfield for the given monoid action |
| `WittVector.Isocrystal`, `WittVector.isocrystal_classification` | `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`, :179 | The class extends Module and has `frob : V ≃ᶠˡ[p, k] V`; no finiteness or connection field. Classification here assumes finrank=1 and algebraically closed k |
| `PowerSeries.derivative` | `Mathlib/RingTheory/PowerSeries/Derivative.lean:50` | Formal derivation on the native power-series ring |
| `PowerSeries.HasGaussNorm.subring`, `mem_subring_one_iff` | `TauCeti/RingTheory/PowerSeries/Bounded.lean:63`, :81 | Positive radius, ultrametric normed ring, bounded weighted coefficient norms |
| `PowerSeries.OnOpenDisc.subring` | `TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean:295` | Series restricted at every smaller positive radius; no Frobenius module or isocrystal structure |

Also inspected `PowerSeries.OnOpenDisc.derivative` at the latter file, line 342. The existence of power-series rings and derivative stability is not evidence for the missing differential/Frobenius module, slope or isocrystal carriers. Object searches for PBQ, bounded quotients, dagger hulls, Robba/Amice coefficient fields, overconvergent isocrystals and rigid cohomology found no native carrier making these headlines statable through a few simple definitions. Amice transforms of measures and ordinary Witt-vector isocrystals are different objects.

The three roadmap suppliers were resolved now, rather than taken from the previous report:

- Parent at open head #1002: all 71 explicitly numbered RD section citations resolve. Relevant groups include analytic carriers RD.0.1 (:673), RD.0.9 (:910), RD.0.17 (:1120), RD.0.26 (:1370); comparisons RD.0.35 (:1597), RD.0.53 (:2120); slopes RD.1.32 (:3030), RD.1.35 (:3094), RD.1.37 (:3162), RD.1.41 (:3247), RD.1.72 (:4033); coefficient categories RD.3.25 (:6219), RD.3.31 (:6378), RD.3.32 (:6404), RD.3.34 (:6474), RD.3.37 (:6604); descent RD.5.8 (:8780), RD.5.8c (:8846), RD.5.112 (:11227); duality RD.5.89 (:10638); docility RD.5.100 (:10886), RD.5.103 (:10995); finite-field fibres/weights RD.6.2 (:11440), RD.6.28 (:12056), RD.6.57 (:12830), RD.6.82 (:13385), RD.6.85 (:13454). All these locators are in `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md` at that head. The parent has no PBQ construction; it cannot supply R01 implicitly.
- `TauCetiRoadmap/AlgebraicCurves/README.md:478`, Layer 2, and :1468, Layer 12, on main supply the Dedekind/function-field and smooth-model interfaces. Perfectness and the distinction between regular and smooth models are retained here.
- `TauCetiRoadmap/RigidAnalyticGeometry/README.md:434`, Layer 5, on main supplies classical finite-cover Tate acyclicity. It does not depend on the later coherent-cohomology theorem.

The parent uses raw valuation slopes; the package's explicit division by `v_π(q)` is necessary and has been checked in the unramified, ramified and iterated examples. No new cycle or upward supplier was found. The nine gaps are precisely named, matched to the plan, and ask for coherent missing interfaces rather than anonymous prerequisites or duplicated targets: extended-log-robba-growth; dejong-disc-robba-submodules; unit-root-correspondence-perfect-base; legendre-kummer-extension; irreducible-iota-purity; lefschetz-curves-irreducibility; docile-curve-restriction; coefficient-linear-weil-ii; dejong-generic-affine-line-comparison. This verdict does not treat their absence from the parent as a defect.

Object searches used `roadmaps grep` over main and the available open heads, and searched the available board packages. The supplied board-package index was read before making absence claims. The closest open scopes were inspected: #879 FiniteFlatGroupsAndIntegralPadicHodgeTheory owns group schemes and integral classifications; #1062 PadicHodgeTheory owns period/comparison theory; #1205 VectorBundlesAndIsocrystals owns Fargues–Fontaine geometry and finite-isocrystal comparisons; #857 CrystallineCohomology owns crystalline and de Rham–Witt theory. Their scope passages occur respectively at `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:52`, `TauCetiRoadmap/PadicHodgeTheory/README.md:7`, `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:7`, and `TauCetiRoadmap/CrystallineCohomology/README.md:50`. None owns the missing convergent PBQ theorem. The parent remains the owner of the foundational carriers, so Part II is the appropriate owner for R01's PBQ extension.

The supplied overlap facts report no conflicting head, dropped cited id or revision-only id. No new overlap was identified in the object searches. The direct `roadmaps overlaps` call cannot recompute this unported package by name: it reports that the Part II roadmap is not on main or in an open roadmap pull request. This is a tooling limitation, not a finding. The supplied package-aware overlap report and available head contents were used instead.

`roadmaps resolve` reports no unresolved cross-roadmap citations or local Lean names. Its disclaimer says it did not check pinned-library names; the manual pin checks above supply that missing verification.

Dependency check output, with the prescribed movable package check:

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. This mechanical success does not discover R01's omitted intra-roadmap prerequisite.

### Lean acceptance test and padding

The prescribed `lake env lean` command was run from the content checkout against the package's `Suggested.lean`. It exited 0 with no output and no warnings. No Tau Ceti import needed a targeted build. The file has one `import Mathlib`, one module docstring, the required namespace, zero declarations, zero admitted examples and zero occurrences of `sorry` or `set_option`.

All sorried declarations were included in the one-tactic-probe inventory: there are **zero**, so no probe copy was needed. Likewise the `#check @name` inventory contains **zero declarations**, so no section hypothesis could silently disappear. No padding was found.

The headline inventory is accounted for in the module docstring:

| Headline group from the README | Target IDs | Docstring coverage and missing carriers |
| --- | --- | --- |
| Bounded splitting, local PBQ filtration, growth/slopes, local reconstruction | MS.0.7, MS.1.1, MS.1.8, MS.3.7 | Lines 29–32: Amice/Robba fields with differential Frobenius structures, generic solution spaces and slopes |
| Curve PBQ filtration and rank theorem | MS.2.5, MS.4.2 | Lines 26–28: generic curve field, differential modules and bounded quotients |
| Specified-map theorem and minimal-slope dual | MS.4.6, MS.4.8 | Lines 19–23: convergent/overconvergent F-isocrystals and their extremal pieces |
| Minimal slope property on curves | MS.5.7 | Lines 24–25: dagger-extendable Fⁿ-isocrystals and hulls |
| Docile Lefschetz full faithfulness | MS.5.8 | Lines 36–37: docile overconvergent isocrystals |
| Finite-field existence and specified-map theorems | MS.6.13, MS.6.14 | Lines 33–35: coefficient isocrystals, fibres, weights and Lefschetz curves |

The summary's intermediate constructions—bounded quotients, descent, saturation, coefficient categories and trace formula—use the same absent carriers. None can be recovered by replacing those objects with arbitrary scalar data. No statable headline omission or weakened stand-in was found. The passing empty Lean file provides no verification of the missing PBQ prerequisite or of the false prose formula.

## Not verifiable

- DEJONG98, Proposition 6.4: settled uncertified/paywalled. Its text was not available; no request was repeated and it was not added to a missing-reference file.
- TSU98, Theorems 4.2.6 and 7.2.3: settled uncertified/paywalled. Its text was not available; no request was repeated. The package accurately identifies the requested extension beyond the parent's coefficient/base hypotheses.
- The new Part II package is not yet in the content-roadmap index, so the direct overlap command cannot analyze it by name. The supplied package-aware overlap report was inspected instead. Ownership checks cover the available indexed open heads and local board checkout, not unseen contents of other board branches.
- Elaboration cannot verify any unformalized headline here: the Lean file deliberately has no declarations. The computed instances and source checks are mathematical review evidence, not formal proofs.

## Source issues

- **Misprint** in DAD at proof of Lemma 4.1.4, printed page 12: the source says the first induced slope step is the sum of whole subobjects; it should be the sum of their first slope steps; affects the proof.
- **Error** in TSU at Definition 7.14 and Theorem 7.18, printed pages 34 and 37: the source says weights are integers and irreducibles are pure; it should be real weights when arbitrary constant Frobenius twists are allowed; affects a stated result.
- **Misprint** in TSU at proof of Corollary 6.8, printed page 29: the source says the intermediate isomorphism ends in the source restriction; it should be the other object's restriction; affects nothing.

The convergent PBQ input is explicitly recognized in TSU line 1359–1360, so R01 is a package completeness defect, not a source gap. AE's purity theorem is in its algebraically closed coefficient category; the discarded finite-K assertion was not a source error. Other source issues carried by the previous report were not newly certified in this round.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "93f51c78cb8ec6c71353c5dcce0a6c76cc89a5c6", "job": "REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~4", "model": "gpt-6-astra", "worker": "chris-6"} -->
