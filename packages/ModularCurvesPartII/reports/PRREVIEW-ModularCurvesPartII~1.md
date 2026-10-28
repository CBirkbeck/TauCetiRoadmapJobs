# Review of ModularCurvesPartII (pull request #913 at 35be0c8)

**Verdict:** needs changes

## R01 (P1) — Subtract the Abel–Jacobi base-point correction

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4640`, repeated at line 4652: “`α_*AJ_{c′}(x)=AJ_c(α(x))+[α(c′)−c]`”.

**Claim:** Pushforward of the cusp-normalized Abel–Jacobi map has the displayed plus correction.

**Witness:** Take α=id on X₀(11), c′=0, c=∞, x=0. With D=[0−∞] of order 5, the left side is 0 and the right side is 2D≠0.

MazurEisenstein line 2787, Proposition II.11.1, pp.98–99, supplies the order; Appendix Theorem A.1, p.173, identifies its component specialization (line 5565). The roadmap's own change-base formula at line 4651 also gives the opposite sign.

**Repair:** Write `α_*AJ_{c′}(x)=AJ_c(α(x))−[α(c′)−c]` in both places. Indeed `[αx−αc′]=[αx−c]−[αc′−c]`. Add the level-11 example as a negative-control Check: the repaired right side at x=c′ is D−D=0, while the original gives 2D. Retain the nontrivial correction for different cusps.

## R02 (P2) — Import the earlier owner's modular quotient and dimension theorem

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4426`, lines 4436–4437 and 4476: “Construct the quotient by the abelian subvariety `B_f` here” and “`dim A_f = [K_f : ℚ]`”.

**Claim:** Layer 16 owns the general abelian-subvariety quotient, the image-generated modular quotient, its universal API and Shimura's dimension theorem.

**Witness:** `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md:625`, §4.3, constructs the same Albanese quotient and proves the dimension theorem; line 627 supplies the same general quotient and ideal API.

That supplier precedes this roadmap in `ORDER.txt` (lines 34 and 81). It treats every normalized primitive weight-two newform and character, not just its cyclotomic application.

**Repair:** Import §4.3 by name in Scope and ownership and Exact supplier contracts. Delete the duplicate construction and theorem targets; retain only separately stated comparisons that add something to that supplied object. Check identity of conventions using its point-of-exact-order model and Albanese action. On E²/(E×0), both constructions give E; for ideals 0 and 1 they give J and 0; for the rational level-11 form both give dimension 1. These are identical objects, not a new generality. Any genuinely additional geometric comparison should use the supplied quotient map.

## R03 (P3) — Remove undeclared API names from prose

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:2533`: “`firstCoefficientHeckePairing_baseChange`: Scalar extension to C agrees with the analytic q-coefficient pairing.”

**Claim:** This backticked API identifier names a declaration of this roadmap.

**Witness:** `TauCetiRoadmap/ModularCurvesPartII/Suggested.lean` has ten declarations and no such declaration. The gate reports `readme-ids-missing=1`. Other future API names, for example at README lines 322 and 408, also need the same prose treatment.

**Repair:** State the scalar-extension comparison in prose without inventing a Lean identifier. Apply that rule to the other proposed API bullets while preserving their mathematical content. Do not add an API catalogue to Suggested.lean. The three real definitions and seven headline theorem names may remain; they are all present in the elaborated file.

## R04 (P3) — Replace the forbidden HTML anchors

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:310`, and 171 further occurrences: “`<a id="s0-1"></a>`”.

**Claim:** These explicit anchors supply the internal target links.

**Witness:** The supplied gate reports `residue=172`; all listed occurrences are the anchor syntax prohibited by its residue rule.

**Repair:** Remove the HTML anchors and retarget their incoming links to the rendered heading anchors. For example the §0.1 link must still reach the §0.1 heading after removal. Check every internal fragment after rewriting; deleting the tags alone leaves broken links. This is a gate policy defect, not a mathematical objection.

## R05 (P3) — Point supplier contracts at the actual sections and names

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:167` and 206, repeated at 3504: “§§4.2–4.7” for `SemistableTorsionDatum`, and “`RelativeJacobian.RelativeJacobian`, `RelativeJacobian.jacobianBaseChange` and `RelativeJacobian.PrincipalPolarization`”.

**Claim:** The displayed sections and identifiers locate the supplied torsion and relative-Jacobian interfaces.

**Witness:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:2606` places the torsion datum in §4.14. `TauCetiRoadmap/JacobianChallengePartII/README.md:211`, 232 and 257 supplies the relative-Jacobian mathematics in §§1.2–1.4, without those three declaration names.

**Repair:** Add NeronModelsAndSemistableAbelianVarieties §4.14 to the torsion contract, preserving §§4.2–4.7 for graph results. Cite JacobianChallengePartII §§1.2–1.4 in prose without the nonexistent identifiers. The sections do supply the required mathematics, including nonreduced base change: this is locator drift, not an unowned prerequisite. For a genus-one family over dual numbers, the corrected citation still supplies its relative Picard scheme and base-change comparison.

## R06 (P3) — Distinguish nearby-cycle theorems from model references

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:3429`: “Ribet–Stein, §3.9, pp.45–46; … Theorems 6.5–6.6, pp.928–929”.

**Claim:** These external locators accompany §12.3's general normalization/specialization sequences and ramification scaling.

**Witness:** RibetStein line 2024 describes the mixed fibre and Néron torus. BDMTV line 1856 and line 1870 describe specific semistable models. Neither passage states §12.3's general nearby-cycle sequences or ramification comparison.

**Repair:** Label these as references for the modular models. Locate the sequence and ramification statements explicitly in the already cited LefschetzPencilsAndVanishingCycles §§7a.1–7a.5, and use its primary-source locators when giving an external citation for those statements. No new supplier is needed. The supplied sequence gives ranks 1 and 2 for a nodal genus-one special/generic fibre, and ramification 3 changes thickness 2 to 6, as required here.

## R07 (P3) — Specify the character in the level-23 dimension Check

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4484`: “Check on `N = 11` (dimension 1) and `N = 23` (dimension 2).”

**Claim:** The level alone identifies the dimension example, although Layer 16 allows arbitrary nebentypus.

**Witness:** At level 23 an order-11 diamond character occurs in cusp forms and forces a newform coefficient field containing ℚ(ζ₁₁), of degree at least 10.

Indeed X₁(23)→X₀(23) is an étale cover of degree 11 with base genus 2. Riemann–Roch gives each nontrivial character a one-dimensional differential eigenspace.

**Repair:** Specify the trivial-character newform orbit at level 23, whose coefficient field has degree 2, and retain the rational trivial-character level-11 example. Add a nontrivial even character of order 11 as a negative control: its dimension is at least 10, so “level 23” alone is insufficient. This repairs the Check, not Shimura's dimension theorem; R02 separately addresses ownership of that theorem.

## Verified sound

The complete README and Suggested.lean were read. The table below records 170 computed probes covering all 168 numbered targets, the fifteen seeded targets, the seven Lean headlines and each mathematical finding. These are discriminating instances and convention tests, not proofs of the general theorems. No additional counterexample was found in this pass. Definition APIs and Checks were read with their standing conventions, including group-scheme multiplicities, nonreduced bases, low levels, totalized functions, finite coefficients and the distinction between stack and coarse quotients.

The roadmap extends the existing ModularCurves roadmap into integral models, arbitrary level and arithmetic cohomology; it is not globally a replacement of that roadmap. R02 is a repairable duplication within that extension. No route-specific good-prime restriction, computational algorithm, sorry'd data, `set_option`, or edit outside this folder was found. Sources are paraphrased rather than copied. There is no earlier AI review to reconcile and no declared supplier gap.

### Computed adversarial pass

“Result/change” records the result of this review, not an edit to the pull request. A section number refers to `TauCetiRoadmap/ModularCurvesPartII/README.md`.

| Statement/target | Instances tried | Values computed on the relevant sides | Result/change |
| --- | --- | --- | --- |
| 0.1 | Trivial inertia; wild elliptic point over F₂ | A^{1}=A; at j=0 inertia order 24≠1, while coarse space remains P¹ | No counterexample; no tame base-change inference |
| 0.2 regularity | Reflections and simultaneous negation on k[[x,y]], char≠2 | Reflection: dim=embdim=2; negation: dim=2, embdim=3 | Criterion separates regular and singular cases |
| 0.2 finite modules | Z_p[[x]], p odd, x↦−x | Invariant ring Z_p[[x²]]; basis (1,x), module rank 2 | Mixed-characteristic example agrees |
| 0.2 inertia ideal / Lean headline | Identity, reflection, simultaneous negation | Ideals 0,(x),(x,y); cotangent ranks 0,1,2; principal exactly in first two cases | No counterexample; Serre primary text unavailable |
| 1.1 | Square lattice; lattice origin | g₃=0, a₆=c₆=0, j=1728; origin maps to [0:1:0]; Δ=g₂³−27g₃² | Native totalized pole values correctly excluded |
| 1.2 | C/(Z+iZ); origin translated to nonzero point | Pointed model has origin 0; translation by t sends 0 to t≠0 | Pointed hypothesis distinguishes wrong map |
| 1.3 | Multiplication by 2, with target 2Λ or Λ | Indices [2Λ:2Λ]=1 and [Λ:2Λ]=4; differential multiplier 2 in both | Degree and differential not conflated |
| 1.4 | Periods 1,i | ∫_a dz=1, ∫_b dz=i; i dz∧dbar(z)=2 dx∧dy | Orientation and Hodge factor retained |
| 1.4a | Oriented basis (1,i), reversed basis | η₁ω₂−η₂ω₁=2πi; reversing gives −2πi; primitive sigma translation sign −1 | Opposite orientation detected |
| 1.5 | S=τ/N,T=1/N; N=3 | Pairing ζ₃; reversed arguments ζ₃⁻¹≠ζ₃; N=1 gives 1 | Sign agrees with declared convention |
| 2.1 | One-gon in char 2; triangular three-gon | Tangent cone y(y+x) has two distinct branches; V=3,E=3,b₁=1 | Node and genus retained |
| 2.2 | Split three-gon and smooth elliptic curve | Smooth groups G_m×Z/3 and E; translation on components adds indices mod 3 | Carrier comparison preserves action |
| 2.3 [sample] | (m,N)=(5,2) over C; m=p in char p | Aut rank 10; torsion rank 2·gcd(2,5)=2; bad-characteristic Aut rank 2p but 2 geometric points | Group schemes, not point counts |
| 2.4 | Constant split C₃ over dual numbers; smooth family | Node scheme has degree 3 over whole base; smooth family degeneration scheme empty | Infinitesimal degeneration not replaced by reduction |
| 2.5 | Translation on C₃; component reflection | Translation is i↦i+1; reflection i↦−i is not a rotation of oriented branches | Rotation condition discriminates |
| 2.6 | C₃ contracted using divisor on identity component | 3 components become 1; section survives; divisor degree 0 on other 2 components | Empty divisor excluded |
| 2.7 | C₆ quotient by order-3 component subgroup; node power map d=2 | Polygon count 6/3=2; node fibre length 3 versus generic degree 2 | Finite quotient not asserted flat at node |
| 2.9 | C₂ over Z₂, automorphism scaling by −1 | Action is identity mod 2, not mod 4 since −1−1=−2≠0 mod 4 | Formal uniqueness retains all thickenings |
| 2.11 | Contraction Ell₆→Ell₃ | Relative automorphism μ₂ has rank 2; representability fails; n-torsion has n² rank when n divides polygon count | Stack inertia retained |
| 2.10a | Split C₄, N=2 | Kernel μ₂×(Z/4)[2] has rank 4; reduced characteristic-2 points only 2 | Full-set law retains multiplicities |
| 2.8 | One-gon and four-gon, N=2 | Torsion ranks 2 and 4; only latter permits full rank-4 Drinfeld divisor | Wrong polygon count excluded |
| 2.10 | N=3 full frame to point level | Relative rank Nφ(N)=6; total GL₂(F₃) order 48; quotient 48/6=8 | Correct stack degrees |
| 3.1 | N=4 polygon levels | Full level requires 4-gon; point/cyclic component counts can be 1,2,4 | Distinct moduli problems |
| 3.2 | N=1; N=3 full level | Identity contraction degree 1; full contraction degree 48; both relative dimension 1 over Z | Small-level stack not replaced by scheme |
| 3.3 | N=4, naive polygon labels m=1,2,4 | Refined polygon counts 1,1,4; labels m=1 and 2 remain distinct | Refinement remembers decontraction |
| 3.4 | N=4,m=2 over C | Naive contraction kernel μ₂ of order 2; refined object has a one-gon | Naive and refined stacks differ |
| 3.5 | N=1,5,12 | Generic inversion at 1; supersingular inversion at level 5 in char 5; 12=3·4 is fine over Z | Correct exclusion of level one |
| 3.6 | Tate three-gon | Special fibre has 3 components; q=Q³; smooth fibre after Q inversion | Parameter exponent retained |
| 3.7 | Node power maps d=2,3 | Fibre lengths 2d−1=3,5 versus generic degrees 2,3; char 2 derivative of u² is 0 | No flatness/separability overclaim |
| 3.8 | GL₂(F₅); split Cartan at 2 | Order 480; Γ₁ index 24, effective index 12; monomial order 2 versus normalizer order 6 at 2 | Small-prime distinction correct |
| 3.9 | Level-5 frame versus rational cyclic subgroup | Full frame forces primitive fifth root; cyclic subgroup does not; GL₂-frame torsor degree 480 | Étale-local framing retained |
| 3.10 | Trivial group acting on Z; base change F₂ | (Z)^1⊗F₂=F₂=(F₂)^1 | Fibre criterion consistent in simplest case |
| 3.11 [sample] | Level one over F₂ | Coarse fibre P¹, generic dimension 1; elliptic j=0 stabilizer 24 | Arbitrary-base-change theorem is genuinely stronger than tameness |
| 3.12 | H=GL₂(Zhat), H=Γ(3) | Normalization degrees 1 and 48; coarse degrees 1 and 24 | Stack/coarse factors differ |
| 3.13 | τ=2i and positive-frame T | τ/(τ+1)=(4+2i)/5; negative-frame parameter gives τ+1 | Frame convention discriminates |
| 3.14 | N=3 fixed pairing versus unrestricted | One connected fixed-pairing quotient; φ(3)=2 unrestricted components | Correct component domain |
| 3.15 | N=11 point to cyclic; N=3 full to point | Stack/coarse degrees 10/5; full-to-point degree 6 | Generic inversion counted |
| 4.1 | Full level 5 cusp chart | q=t⁵; ramification 5, not 1 | Tate parameter fixes normalization |
| 4.2 | N=d=5; N=15,d=5 | φ(5)/2=2 components; 2φ(3)=4 geometric cusps in second case | Corrects source indexing |
| 4.3 | N=4,d=2; a unit twist of q=t² | Boundary inertia persists; pole order of j remains 2 under unit twist | Coarse ring not mistaken for fine moduli |
| 4.4 | Weight-one Hasse form over F₂; section on other component | Nonzero mod-2 section need not lift over Z; section on disjoint component has zero chosen-cusp expansion | Flatness and detection conditions matter |
| 4.5 | Level 5 determinant-2 frame change | ζ₅↦ζ₅²; point label P↦2P | Determinant direction fixed |
| 4.6 | Generic Γ₀(5), full level 2, Γ₁(4) open | Stabilizer orders 2,2,1; Γ₁(4) cusp can retain order 2 | Open and compact fine loci distinguished |
| 4.7 | p=5,7 | Fixed full genera 0,3; cusp counts 12,24; full pairing counts 4,6 | Projective scalar quotient has 2 components |
| 4.8 | τ=2i at zero cusp; width w | S⁻¹τ=i/2, q_c=e^(−π), not e^(−4π); q=t^w | Cusp coordinate and strict/effective widths distinguished |
| 4.9 | Spec C over R, then base change to C | One connected R-scheme becomes Spec(C×C), 2 components | Algebraically closed base hypothesis necessary |
| 4.10 | N=5 fixed pairing | 1 component versus 4 for unrestricted level | Correct connected object |
| 4.11 | N=5 cyclotomic base | φ(5)=4 generic embeddings; fixed embedding selects 1 generic component | Connected special fibre need not be irreducible |
| 4.12 [sample] | N=4 boundary; smooth elliptic locus | Naive 2-gon contracts to refined 1-gon; smooth-locus level divisor remains rank 4 | Overlap isomorphism excludes false global naive identification |
| 5.1 [sample] | N=3,4,6,12,15 | First three retain bad-fibre automorphisms; 12=3·4 and 15=3·5 have coprime rigidifiers | All-Z normalization range supported |
| 5.2 | H=Γ(1), Γ(3) | Coarse j-map degrees 1 and 24; stack degrees 1 and 48 | Normalization/coarse construction agrees |
| 5.3 | n=5 and n=4 | gcd(5,6)=1; gcd(4,6)=2, so invert 2 in stated range | Does not claim unrestricted level-4 base change |
| 5.4 | Prime-level cusp local ring | Completed ring Z[[q]] has dimension 2 and embedding dimension 2 at (p,q) | Regular cusp criterion consistent |
| 5.5 | p=3,n=3; p=2,n=3 | Cusp degrees 1+27+2+6=36; mixed dyadic equation z²=−q is regular | Degree sum and dyadic ring agree |
| 5.6 | N=4; equal-j quadratic twists over Q | Cyclic degree 6 versus all-subgroup count 7; j=1728 curves with F₅ point counts 8 and 4 need not be Q-isogenous | Geometric isogeny interpretation retained |
| 5.7 [sample] | p=5 over C | Full components 4, scalar quotient 2; effective inertia 2,3,5 versus raw central factor 2 | Verified over C; source does not certify integral inertia at 2,3 |
| 5.8 | H=full level one | Relative dimension 1, degree to X(1) 1; boundary codimension 1 | Stack properties not transferred without theorem |
| 5.9 | Tame order-2 surface quotient | k[[x²,xy,y²]] has dimension 2 and embedding dimension 3 | Coarse singularity can survive regular stack |
| 5.10 | Γ₀(11) | Cusp widths 1+11=12=[SL₂:Γ₀(11)] | Degree and cusp divisor agree |
| 5.11 | X₁(5); fixed full X(5) | 2 cusps each of widths 1 and 5 give degree 12; 12 full cusps of width 5 give 60 | Effective indices correct |
| 5.12 | Full N=3,5 | Cyclotomic degrees 2,4; connected fixed-pairing count 1 in either case | Structural cyclotomic algebra retained |
| 5.13 | N=1,2,5 fixed pairing | Cyclotomic degrees 1,1,4; fixed geometric component count 1 | Small levels retain inertia |
| 5.14 | Trivial twist and conjugate determinant | Trivial cocycle gives original curve; conjugation sends ζ to ζ⁻¹ | Twist includes determinant datum |
| 5.15 | Identity level inclusion and full-to-point N=3 | Degrees 1 and 6; ramification at a width ratio w′/w | Map is not assumed étale at boundary |
| 5.16 | Split monomial level 2 | Full degree 6 divided by monomial order 2 gives 3; dividing by full normalizer 6 gives 1 | Exceptional level 2 treated correctly |
| 5.17 | H=level one; H=Γ₀(4) elliptic open | Coarse ordinary j-line A¹; cyclic smooth divisor rank 4 on either presentation | Only boundary refinement differs |
| 5.18 | Prime N=5 diamond quotient | ( Z/5 )×/{±1} has order 2; Γ₀ coarse j-degree 6 | Main-roadmap construction reused on its range |
| 5.19 | Identity normalization of normal P¹ | Normalization map degree 1 and local ring unchanged | No arbitrary-base-change inference |
| 5.20 | Γ₁(4) at characteristic 2 | Inversion fixes 2-torsion residue labels but not a generic order-4 point; stabilizer jumps 1→2 | Failure mechanism is retained |
| 5.21 [sample] | m=12=3·4; H=Γ(1) | GL₂(Z/12) order 96·48=4608; cover rank 4608; cusp ramification 12 | Finite-flat cover is not global frame torsor |
| 6.1 | N=5 chosen positive frame | Analytic infinity corresponds to point-moduli zero cusp; reversing frame swaps the distinguished labels | Compact comparison needs marked convention |
| 6.2 | Γ₀(11) over j-line | Cusp ramification indices 1,11 sum to 12 | No étaleness at zero cusp |
| 6.3 [sample] | X₀(11); full level 5 | Cusp fields Q,Q; fixed full cusp field Q(ζ₅), degree 4; unrestricted components 4 | Arithmetic fields not inferred from complex points alone |
| 6.4 | Trivial symplectic twist | Cocycle values all 1; twisted comparison is original comparison | Marked torsion identification determines map |
| 6.5 | Paired trivial level-5 twist | Geometric component count 1; unrestricted full curve has 4 | Pairing hypothesis prevents false irreducibility claim |
| 7.1 | Hodge frame at Tate cusp | du/u=2πi dz; weight two scale (2πi)² | Curve differential frame and modular frame distinct |
| 7.1a [sample] | Widths 1 and 5 | KS coefficient 1 at q; q=t⁵ gives 5 dt/t | Normalization computed; primary KS source uncertified |
| 7.2 | f=q+O(q²), f=1+O(q) | f dq/q=dq+O(q)dq versus dq/q+O(1)dq | Cuspidality exactly removes pole |
| 7.3 | Good m=4 and bad prime p | Full/cyclic branches 7/6; bad correspondence degree p; normalized action is raw/p | All subgroup and cyclic actions distinct |
| 7.4 | Weight 2, a,d branch | Isogeny differential multiplier a/d; sum gives classical T_n on f dq/q | Raw n factor cancelled only with stated normalization |
| 7.5 definitions | N=1 and normalized level-11 f | Zero operator algebra at 1; β(Id,f)=1, β(T₂,f)=−2 at 11 | Actual image, no free operator variables |
| 7.6 / Lean headline | N=1,11 | Pairing dimensions (0,0) and (1,1); level-11 matrix [1] invertible | Deep general perfection not a one-tactic consequence |
| 8.1 [sample] | Finite coefficient coordinates over K | An invertible d×d K-minor gives coordinates in K; d=1 and coefficient 1 give scalar 1∈K | Requires split rational parameter and injective expansion |
| 8.2 | N=4 in good characteristic; N=p in char p | Cyclic function-field degree 6; j(q^p)=j(q)^p gives inseparable collapse at bad p | Bad fibre not assigned the same function field |
| 8.3 | N=5 determinant action | ζ₅ has four conjugates; fixed pairing over Q(ζ₅) has one component | Descent keeps component field |
| 8.4 | ζ₅ and ζ₅⁻¹ | Complex conjugation changes exponent 1→−1≡4 mod 5 | Pairing-inversion convention consistent |
| 8.5 | Identity base extension and tower K⊂L⊂M | Identity map on sections; two-step scalar extension V⊗L⊗M=V⊗M | Only declared generic/flat range used |
| 9.1 | p∤N; N=5,p=2 | Generic degeneracy degree p+1=3; special source has 2 components | Correspondence source need not be smooth |
| 9.2 | Diamond a=2 modulo 5 | P→2P; inverse a=3; product 2·3≡1 | Inverse diamond distinct from same diamond |
| 9.3 | Cyclotomic Fricke twice | Quotient-dual composition gives original level object; replacing ζ by ζ^a changes diamond factor a | Field of definition retained |
| 9.4 | N=12 exact divisors | 1,3,4,12; w₃w₄=w₁₂ and w₄²=id | Nonexact divisor 2 excluded |
| 9.5 | Prime 13 split normalizer | Ordered degree 13·14=182, quotient degree 91 | Exchange involution halves degree |
| 9.6 | Split/non-split normalizers at 13; monomial at 2 | Degrees 91 and 78; split-plus genus 3; at 2 monomial quotient degree 3 | Source notation translated explicitly |
| 9.7 | N=1; frame-change conjugation | GL₂(Z/1) trivial; conjugate image subgroups give same coarse class | Rational point does not choose a frame |
| 9.8 | Unordered pair (j,j′) | Sum and product unchanged under exchange; ordered pairs (0,1728),(1728,0) give same (1728,0) | Quotient invariant functions distinguish unordered object |
| 9.9 | m=4,9,6 | All/cyclic counts 7/6,13/12,12/12; at 4 scalar branch (2,2,0) removed | Cyclic filter correct |
| 9.10 | p=2, full versus cyclic composition | Degree 9=7+2 for full; 9=6+3 for cyclic | Different scalar multiplicities retained |
| 9.11 | Weight 1 versus 2 mod p | Second coefficient factor p^(k−1) is 1 versus 0; E₄ at p=2 constant factor 9≡4 mod 5 | No division by p before divisibility theorem |
| 9.12 | Degree-2 map, F₂ coefficients | Trace∘pullback=2=0; not identity 1 | Integral trace counts degree without division |
| 9.13 | Identity isogeny on projective level | Hecke cycle at m=1 is diagonal, bidegree (1,1) | Uses geometric cycle, not independent labels |
| 10.1 | Full level 5 | φ(5)=4 components; fixed one has field degree 4 over Q | Export preserves determinant labels |
| 10.2 | Level-11 newform, T₂ | Classical a₂=−2; geometric action on its differential also −2 | Normalization matches |
| 10.3 | Identity level map | Both algebraic and analytic maps degree 1; cusp width ratio 1 | Agreement respects compactification |
| 10.4 | Raw versus normalized weight-two prime trace | Raw pT_p; normalization returns T_p; for a₂=−2,p=2 values −4 and −2 | Factors retained in descent |
| 11.1 | Ordinary and supersingular p-torsion | Ordinary μ_p×Z/p has p geometric points; supersingular local-local torsion has 1 | Group-scheme rank p² in both |
| 11.2 | p=5,n=2 | Component multiplicities 1,φ(5)=4,1 | Mixed component is nonreduced |
| 11.3 | p=5,n=2,j=1728 ordinary mixed point | Effective negation cotangent rank 2; invariant dim 2, embdim 3 | Corrects supersingular-only source claim |
| 11.4 | Tame inverse characters (x,y)→(ζx,ζ⁻¹y) | Invariants u=x³,v=y³,w=xy satisfy uv=w³; dim 2, embdim 3 | Resolution input differs from pseudoreflection quotient |
| 11.5 | N=5,p=2 fine mixed level | 2 components; component map degrees 1 and 2 | Wild coarse descent not inferred |
| 11.6 | Prime-square semistable model at 13 | k=1; four vertical plus one horizontal component; K_(1,4) graph b₁=0 | Model and base extension retained |
| 11.7 | ℓ=13,37,61 | k=1,3,5; extension e=84,684,1860; genus 3,45,135; graph b₁=0,4,8 | Genus agrees with component-plus-graph sum |
| 11.8 | Level-13 plane quartic, char 2 | F+X F_X=Y(X+1)²; singular-point equations force incompatible projective coordinates | Smoothness check uses actual equation |
| 12.1 | Two vertices, s parallel edges; K_(3,3) | b₁=s−1; K_(3,3):9−6+1=4; p=11 edge lengths 2,3 | Loops and parallel edges not erased |
| 12.2 | One loop of thickness h | Character rank 1 for h=1,2; monodromy determinants 1,2 | Character lattice distinct from component cokernel |
| 12.3 [sample] | Good level-13 fibre; one nodal genus-one fibre | Good: H¹ ranks 6=6+0; nodal: special rank 1, generic rank 2=1+1; ramification 3 changes thickness 2→6 | Sequences numerically consistent; R06 locator repair |
| 12.4 | Frobenius branch at p=2 | Degrees (1,2); multiplication [2] on resulting norm-pullback | Correspondence direction retained |
| 13.1 | J₀(5); degree-3 curve map | Jacobian dimension 0; norm∘pullback=[3] | No finite-coefficient division |
| 13.2 | Constant quadratic extension and totally ramified degree d | Norm of point has coefficient 2 in first case; ramified norm coefficient 1, pullback coefficient d | Residue degrees and ramification separated |
| 13.3 | J₀(11), T₂ | Eigenvalue −2; Eisenstein difference −2−3=−5; cusp class order 5 | Geometric integral image agrees |
| 13.4 [sample] | Γ₀ and nontrivial diamond a=3 mod 13 | Γ₀ adjoint unchanged; inverse diamond 3⁻¹=9≠3 | Inverse convention and Fricke transport retained |
| 13.5 | Genus 0,1 and ℓ≠char | Tate ranks 0,2; H¹(1) ranks 0,2; Tate twist remains 1 | No untwisted identification |
| 13.6 | Level-11 rational coefficient block | T_Q and cusp space dimension 1; pairing [1] | Same rational pairing as §7.6, compared via geometry |
| 13.7 [sample] | P=5 over F₂; composite N=55 at 5 | B⁰=0,A⁰=0,dim(A/B)=1; nonzero differential on component away from infinity expands to 0 | Exceptional small characteristics and detection range retained |
| 13.8 | Nodal residues; genus-zero two-cusp case | Residues (a,−a) sum 0; in char 2 (a,a) also sum 0; log residue space rank 1 | Residue sign and regularity agree |
| 13.9 | Degree-2 map with residue coefficient in F₂ | Trace-pullback factor 2=0, not inverse degree | Adjunction uses trace without normalization |
| 14.1 | Sym^r of rank 2, r=0,1,2 | Ranks 1,2,3; unipotent cusp monodromy retains width w | Coefficient dual and symmetric power distinguished |
| 14.2 | G_m; compact genus-one curve | Ordinary H¹ ranks 1 and 2; parabolic ranks 0 and 2 | Support image not ordinary cohomology |
| 14.3 | One and two punctures | Reduced boundary ranks 0 and 1; empty boundary keeps H² rank 1 | Empty-set endpoint retained |
| 14.4 | Degree-ℓ circle cover with F_ℓ coefficients | Pullback on H¹ is ℓ=0; invariant target H¹ still rank 1 | Naive invariants comparison correctly avoided |
| 14.4a | Finite circle cell model; O/πⁿ | C⁰=C¹=O/πⁿ, differential 0; inverse limits give O in both degrees | Adic comparison has specified finite model |
| 14.5 | Genus-one modular curve | S₂ dimension 1, conjugate dimension 1, H¹ dimension 2 | Weight-two Hodge decomposition matches |
| 14.6 [sample] | Holomorphic/antiholomorphic pair with Petersson norm c>0 | Wedge integral −8π²ic; reversed +8π²ic; holomorphic pair 0 | README factor correct; source issue recorded |
| 14.7 | Diamond 3 modulo 13 | Untwisted adjoint is 9; Fricke transport makes same Hecke element self-adjoint | No claim twisted pairing is alternating |
| 14.8 | Weight 2 versus Sym¹ coefficients | Coefficient transport trivial in degree 0; degree 1 carries actual isogeny pullback | Higher-weight map cannot be bare scalar trace |
| 14.9 | F₅ permutation of five cusps | (P−I)^5=0 but P−I≠0; on e₁−e₀ difference e₂−2e₁+e₀≠0 | Eisenstein semisimplification not exact scalar equality |
| 14.9a | Open genus g with s cusps; g=0,s=4 | Graph rank 2g+s−1=3; H²=0 | Finite free group model consistent |
| 14.10 | Free rank-d O-module localized by idempotent | For O² and projector diag(1,0), image rank 1 and reduction rank 1 | Torsion-free localized summand retained |
| 14.11 | F₇ character values 2 and 4; r=0,1 | 2·4=1 permits pairing; 2²−1=3 forces self-pairing 0; alternating/symmetric signs −1,+1 | Adjoint block and factorial hypotheses retained |
| 14.12 | Two endpoints a,b and reversed modular symbol | Boundary [b]−[a], reversed negative; equal endpoints boundary 0 | Full symbols not all compact cohomology |
| 14.13 | Elliptic Jacobian | Tate rank 2, cohomology rank 2 with twist 1; dual realization reverses action | Carrier and transpose retained |
| 14.14 | N=11 and an old block | dim T=1, dim H¹=2; rank-two formula is 2·dim T | No integral freeness inferred |
| 14.15 | Zero operator on cuspidal symbols | Evaluation kernel must vanish in geometric image; full symbols include nonzero boundary part of rank s−1 | Only cuspidal comparison gives kernel equality |
| 15.1 | Two degeneracy maps, N=11,p=2 | Each generic degree 3; source H¹ pair rank 4 | Map is actual two-leg pullback |
| 15.2 | N=3,p=2; conjugate matrix | Vertex-edge index p+1=3; lower-left entry c→c/2, upper-right b→2b | Conjugation direction fixed |
| 15.3 / Lean headline | Full group; reduction modulo 3 at p=2 | m=1 gives zero quotient ring and whole kernel; level-3 kernel uses m=3 coprime to 2 | General CSP not reduced to trivial boundary case |
| 15.4 | Trivial amalgam coefficients and agreeing zero characters | Restriction difference 0−0=0; exact kernel contains zero pair | General proof input is amalgam, not arbitrary groups |
| 15.5 definition | Γ(3), F₅; zero character | Ordinary character dimension 3, congruence dimension 0; zero vanishes at M=N=3 | Finite codomain alone insufficient |
| 15.6 / Lean headline | N=3,p=2,q=5 | Congruence kernel dimension 0, so two 3-dimensional source spaces inject; p=q remains permitted by statement | Source lemma matches signature |
| 15.7 / Lean headline | N=11,p=2; Γ₀ contrast | Compact source rank 4; Γ₁ pullbacks saturated; Γ₀ has nontrivial Shimura kernel | Γ₁ and parabolic hypotheses retained |
| 15.8 | Z/49, diamond 8, inverse 43; p=29,T=6 | 900−36·43≡38; dropping inverse gives 31; both reduce to 3 mod 7 | Integral normalization differs despite same residual value |
| 15.9 / Lean headline | Level 5 cusp module over F₃ and F₅ | 12 cusps: sum of constant vector 0 mod 3, 2 mod 5 | Source F₃ typo must not enter proof |
| 15.10 / Lean headline | N=3,p=11,q=5 | Intermediate index p−1=10 vanishes mod 5; enhanced bound still required | Restriction injectivity cannot replace source theorem |
| 16.1 | Eigencharacter projection Q×Q→Q | Kernel 0×Q; quotient Q; embedding postcomposition same kernel | Minimal-prime construction agrees |
| 16.2 | Hecke ideals 0 and 1 | Quotients J and 0; E²/(E×0)=E in either claimed construction | R02: duplicate earlier supplier ownership |
| 16.3 | Multiplication by ℓ on Tate module | Integral cokernel size ℓ^(2g); after Q_ℓ extension cokernel 0 | Rational exactness correctly separated |
| 16.4 [sample] | Level 11 trivial character; level 23 nontrivial even character | Degrees/dimensions 1/1; order-11 character forces [K_f:Q]≥10, not 2 | R07: specify trivial-character level-23 Check; R02 ownership |
| 16.5 | Level-11 rational newform | One Galois embedding, differential dimension 1; degree-d coefficient field gives d embeddings | No selected embedding exhausts whole d-dimensional space |
| 16.6 | Identity; E→E² inclusion with projection | Identity compositions [1]; inclusion/projection gives vu=1 but uv≠1 | Equal-dimension/isogeny hypotheses essential |
| 16.7 | M=N,Np,Np² | Old multiplicities τ(1)=1,τ(p)=2,τ(p²)=3 | All divisors, not just squarefree ones |
| 16.8 | Positive-genus AJ versus genus zero | AJ(c)=0; positive-dimensional quotient cannot have image 0; genus-zero J=0 excluded by f existence | Nonzero quotient hypothesis used |
| 17.1 | J₀(11), prime 2, torsion 5 | Generic and special 5-torsion orders 25; at bad prime 11 good-reduction theorem unavailable | Canonical reduction range retained |
| 17.2 | J₀(11) at 2,3 | Point counts 5,5; traces 2+1−5=−2,3+1−5=−1; FV=[2],[3] | Eichler–Shimura checks agree |
| 17.3 | Base cusp c′ and shifted image | Identity on X₀(11), c′=0,c=∞,x=0: left 0; written right 2D≠0, D has order 5 | R01: minus correction gives D−D=0 |
| 17.4 | One and two supersingular edges | Sum kernels rank 0 and 1; latter generated by (1,−1) | Integral characters are graph homology |
| 17.5 [sample] | p=11,13,17; two unit edges | Orders 5,1,4; p=11 pairing 2+3=5, T₂=3 mod 5; unit-edge pairing 2 | Integral cokernel and prime-level generator supported |
| 17.6 | Multiplication by m on G_m | Contravariant character map Z→Z is ×m; cokernel Z/m | Finite lattice error survives rational isogeny |
| 17.7 | J₀(11) at 11, ℓ=5 or 3 | Toric orders 5,3; Φ[5] order 5 and Φ[3] order 1; integral ranks 1,1,2 | Residual invariants retain monodromy error |
| 17.8 | Swap involution on O²; Q empty | Minus vectors (a,−a), projector (1−ξ)/2; empty deck group order 1 | Odd coefficient characteristic required |
| 17.9 | Δ cyclic of order ℓ, rank-r group-ring module | O-rank ℓr; group-ring rank r; minus coboundaries 0 | Freeness is over O[Δ], not Hecke algebra |
| 17.10 | Q empty; free rank-r O[Δ] | Augmentation ideal 0 when Δ=1; general coinvariant O-rank r | Actual augmentation comparison required |

### Seeded source sample

All fifteen requested locator groups were inspected against legally obtained text where available. There are no additional README locators explicitly marked “unverified”. Source service attempts covered 46 works; five remain unreadable or uncertified as detailed below. The source IDs below identify the cited works; numbered lines are from the source-service extractions. CesMod line numbers use arXiv v2 unless explicitly labelled published; BT uses the published article. Page numbers below are printed pages, not PDF offsets.

| Target | Text opened and conclusion |
| --- | --- |
| 2.3 | CesMod lines 276–291, §2.1.6, and 320–334, §2.1.11; DR II.1.10, pp.177–178, line 981. The automorphism group scheme and smooth-locus torsion support the statement, including nonreduced μₚ. |
| 3.11 | CesMod Proposition 3.3.2, pp.24–25, lines 1095–1133. The compactified coarse j-line and arbitrary base-change assertion are present; this is not merely a tame-inertia inference. |
| 4.12 | ConradGen Theorem 4.1.1, p.31, line 1493; Theorem 4.2.1 and Remark 4.2.2, pp.35–36, line 1744; CesMod Theorems 4.3.5, 4.4.4 and 5.13, lines 1716, 1794 and 2615. The normalization comparisons retain the stated ordinary/tame or refined ranges. |
| 5.1 | The same CesMod normalization theorems and ConradGen passages support the three standard levels. The distinction between naive cyclic level and the refined normalization is necessary. Level-one representability is explicitly corrected in the README rather than inferred from Proposition 4.3.6. |
| 5.7 | BT §§2–3, pp.713–717, lines 195–275 and 350–371. Two projective pairing components and complex ramification orders 2,3,p agree. BT line 206 works over ℂ; this reading does not certify integral inertia in characteristics 2 and 3. The README's integral construction uses its separate normalization machinery. |
| 5.21 | CesMod Proposition 4.3.4, p.38, lines 1697–1712, and Proposition 4.3.6, p.39, lines 1728–1734; ConradGen Theorem 4.2.1 and Remark 4.2.2, line 1744. Relative finite-flat rank and proper rigidifiers are supported, with the level-one exception retained. |
| 6.3 | DR VII.4.2–4.8, pp.310–313, lines 5270–5364, gives analytic/Tate coefficient comparisons; GrossZagier p.226, lines 74–90, gives the two rational X₀ cusps. MilneMF pp.94–96, lines 4892–4998, supplies the function-field model argument. These passages do not alone classify every cusp: the frame computation and ConradGen Theorem 4.3.4, pp.38–39, lines 1873–1908, must be used with the corrected indexing. |
| 7.1a | DDT Lemma 1.12, pp.25–26, lines 950–959, fixes the 2πi differential normalization; the Tate calculation gives dq/q and width w gives w dt/t. FaltingsChai's primary Kodaira–Spencer locator could not be read; see Not verifiable. |
| 8.1 | ConradQexp Lemma 3.2 and Theorem 3.3, pp.3–6, lines 98–246, support injectivity and coefficient descent. DR VII.4.5–4.8, lines 5306–5364, supplies the comparison. The chosen coefficient field and split parameter are retained. |
| 12.3 | RibetStein §3.9, pp.45–46, lines 2024–2081, and BDMTV Theorems 6.5–6.6, pp.928–929, lines 1856–1892, describe models rather than the asserted general sequences. R06 records the locator correction; LPV owns those sequences. |
| 13.4 | RibetStein Theorem 5.2/Corollary 5.3, p.66, lines 2856–2878; Lemma 5.7/Theorem 5.8, pp.68–69, lines 2964–2994. Adjoint diamonds are inverse diamonds; the Fricke transport and Kummer sign cannot be discarded. The scalar error in Theorem 5.2 does not alter its adjoint conclusion. |
| 13.7 | MazurEisenstein Definition 3.1 and Propositions 3.3–3.4, pp.67–69, lines 1588–1664; Lemmas 4.3–4.8, pp.73–76, lines 1798–1955. They support the integral dualizing-differential realization and the special characteristic-2/3 restrictions. In particular Lemma 4.8 is not an unrestricted identification with the Hodge-square definition. MazurIsogenies §2(e), pp.140–141, lines 461–515, supplies the cotangent/dualizing comparison over its specified base and states the restriction comparison up to sign. |
| 14.6 | RibetStein Theorem 5.2, p.66, lines 2831–2878, has a normalization error. Direct integration with f↦2πif dz gives −8π²i, as in the README; DDT lines 977–985 is consistent with this normalization. |
| 16.4 | RibetStein Theorem 5.14, p.73, lines 3162–3185, gives the dimension and rank-two theorem for the actual newform quotient. The statement is mathematically supported; ownership and the level-23 Check require R02 and R07. |
| 17.5 | MazurEisenstein Appendix Theorem A.1, p.173, lines 5565–5573, and Proposition 1.4, p.179, lines 5809–5816, support the prime-level cyclic component group and intersection presentation. RibetStein §3.10.2, p.48, lines 2150–2191, concerns a related character sequence, not by itself the whole monodromy theorem. The general integral pairing and cokernel are correctly supplied by NeronModelsAndSemistableAbelianVarieties Layer 4. |

### Pinned library, Lean and headline audit

The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches were by mathematical object as well as identifier. Fifty-three individually indexed library contract entries, together with the compound contracts, were located and their declaration text inspected. Representative exact locations and restrictions are:

| Native declaration/object | File and line at the pin | Relevant restriction |
| --- | --- | --- |
| `PeriodPair`, `weierstrassP`, `derivWeierstrassP_sq` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean:59`, 267, 1074 | Independent real periods; totalized function; the differential equation excludes lattice points. |
| `WeierstrassCurve.IsElliptic` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366` | Unit discriminant, not merely a cubic equation. |
| `IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51` | Includes the local and Noetherian conditions used in the invariants headline. |
| `LinearMap.IsPerfPair` | `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39` | Both induced dual maps are bijective. |
| `Gamma`, `Gamma0`, `Gamma1` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:41`, 79, 131 | Principal reduction kernel; lower-left congruence; diagonal-one point level. |
| `Polynomial.natDegree_cyclotomic` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:316` | Requires a nontrivial coefficient ring. |
| `Subgroup.index` | `Mathlib/GroupTheory/Index.lean:55` | Natural cardinality; infinite index has the totalized value 0. |
| `Scheme.Hom.normalization`, `normalizationDesc`, `normalizationPullback` | `Mathlib/AlgebraicGeometry/Normalization.lean:122`, 372, 577 | Native scheme construction; no general arbitrary-base-change isomorphism is implicit. |
| `Scheme.ellAdicSheaf`, `Scheme.EllAdicCohomology` | `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:63`, 75 | Pro-étale coefficient/cohomology carriers, not a modular comparison theorem. |
| `groupCohomology.coindIso`, `H1IsoOfIsTrivial` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58`; `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:1018` | Coinduction and trivial-action hypotheses retained. |
| `cuspFormCharSpace` | `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279` | The actual simultaneous diamond eigenspace. |
| Hecke action and first coefficient theorem | `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.lean:393`; `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Composite.lean:129`, 140 | Native operator action; coefficient identity needs positive index. It does not alone prove perfection. |
| `integerCuspWidth` | `TauCeti/NumberTheory/ModularForms/Cusps/Basic.lean:143` | Strict integer width, not automatically the effective coarse width. |
| `tateCurve` | `TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Basic.lean:68` | Defined over ℤ⟦X⟧; the Laurent generic fibre requires scalar extension. |
| Generic elliptic automorphisms | `TauCeti/AlgebraicGeometry/EllipticCurve/Aut.lean:178` | Excludes j=0 and 1728. |
| `weilPairing` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean:230` | Actual elliptic-curve pairing; argument order matters. |
| `AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group carrier; not the missing modular quotient construction. |
| `LocalCoefficientSystem`, pullback | `TauCeti/AlgebraicTopology/LocalCoefficient.lean:43`, 75 | Fundamental-groupoid module functor and actual map pullback. |
| Symmetric powers and rank | `TauCeti/RepresentationTheory/SymmetricPower.lean:47`, 84, 156; `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:203` | Representation/intertwiner functoriality; rank theorem retains finite/free hypotheses. |
| Reduction surjectivity | `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean:437` | Integral SL₂ to ZMod; not a substitute for S-arithmetic CSP. |
| Group-ring locality and augmentation | `TauCeti/Algebra/MonoidAlgebra/LocalRing.lean:101`, 128; `TauCeti/Algebra/MonoidAlgebra/Exactness.lean:115`, 151 | p-group/coefficient assumptions and the actual augmentation ideal are retained. |

The README headlines are: compact modular uniformization and cusp fields; connected fixed-pairing/twisted models; integral level stacks, coarse curves and base change; the weight-two differential and perfect Hecke-pairing dictionary; bad-fibre/nearby-cycle geometry; Jacobian functoriality and integral dualizing differentials; Shimura/Hodge comparison and rank-two Hecke freeness; CSP, Ihara and congruence invariance; the actual newform quotient dimension theorem; Eichler–Shimura, modular monodromy and Taylor–Wiles freeness/augmentation.

Suggested.lean states seven currently expressible headlines: regular invariants (§0.2), perfect Hecke pairing (§7.6), S-arithmetic CSP (§15.3), principal Ihara (§15.6), compact parabolic-character Ihara (§15.7), congruence invariance (§15.9), and the Γ₁(p) variant (§15.10). Its module docstring names the geometric headlines that lack actual modular carriers. No additional statable headline omission was identified, and no free-predicate or arbitrary-data substitute was found. The three definitions are the actual Hecke operator image, its coefficient pairing and congruence characters.

After building the two required Tau Ceti import modules, direct `lake env lean` elaboration of Suggested.lean succeeded with exactly seven `sorry` warnings. A separate copy with `#check @name` for all ten declarations also elaborated. Every required binder survived: finite-over-invariants and residue triviality/tameness; `NeZero N`; finite index and localization for CSP; the level bounds, prime hypotheses, actual conjugation equation and agreement conditions for Ihara; and the trace-two vanishing condition for compact characters. No signature repair was needed. Nothing in the worktree was edited.

For each of the seven admitted theorems, separate one-tactic attempts using `simp`, `rfl` and `infer_instance` failed to close it. Object searches and the opened native declarations did not identify a single existing lemma proving one of these seven general statements. None is a definition restatement or a small-value Check. There is no padding finding.

### Ownership and supplier order

Main-roadmap shape comparisons used AlgebraicCurves, ModularForms and StableReduction. The supplier audit read all `Needs` lines, checked the resolver's 54 leads against the referenced texts, and inspected 23 captured supplier documents plus CyclotomicClassGroupsAndStickelberger. Not every resolver lead denotes a defect: aliases and prose interfaces are common. In particular NeronModelsAndSemistableAbelianVarieties line 651 explicitly explains R11.1–R11.6, so R11.4 is not missing.

Cross-roadmap resolutions include the following. Paths in this table are relative to the roadmap repository.

| Supplier citation | Resolved location and contract |
| --- | --- |
| ModularCurves Layers 0A–3 | `TauCetiRoadmap/ModularCurves/README.md`: existing divisor, elliptic-level and tame modular geometry; retained as the base roadmap rather than rebuilt globally. |
| AlgebraicCurves §12C | `TauCetiRoadmap/AlgebraicCurves/README.md:1128` on main: the function-field/curve-map comparison. |
| ClassFieldTheory global Artin/Hilbert reciprocity | `TauCetiRoadmap/ClassFieldTheory/README.md:1683`, 1872 on main, Layers 11 and 14. The citation at target §15.8 would be clearer with these section locators. |
| AdicSpacesPartIII R2.11 | `TauCetiRoadmap/AdicSpacesPartIII/README.md:8793`: modular tower inputs, with polygon/Tate/fine-level objects in the following paragraphs. |
| JacobianChallengePartII §§1.2–1.4 | `TauCetiRoadmap/JacobianChallengePartII/README.md:211`, 232, 257: positive-genus relative Jacobian, polarization and arbitrary pullback. R05 corrects the names, not the contract. |
| SchemeAndStackFoundations §3.5/lineBundleNorm | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4883`: the norm API is present; it is not a missing prerequisite. |
| NeronModelsAndSemistableAbelianVarieties §§4.2–4.7, 4.14 | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1943`, 2152, 2343, 2370, 2606: graph cycles, integral monodromy, component cokernel, pairing, and finite torsion with abelian quotient retained. |
| LefschetzPencilsAndVanishingCycles §§7a.1–7a.3 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:3437`, 3481, 3553: normalization, specialization and signed graph/variation comparison. The branch orientation and thickness data are part of the contract. |
| ArithmeticLocallySymmetricSpaces ALS.F.3, §1.1, §§5a.3–5a.5 | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:709`, 1666, 3966, 4002, 4027: finite coefficients, row/inverse monodromy and dual Hecke blocks. Integral limits are not silently supplied by the finite-coefficient assertion. |
| CyclotomicClassGroupsAndStickelberger §4.3 | `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md:625`, 627, 631: the earlier general modular quotient, quotient API, dimension and rank-two coefficient realization. R02 records the duplicate ownership. |

Ownership searches used the supplied `roadmaps grep` and `roadmaps show` tools across main and the available open roadmap heads, alongside the board-package index and pinned-library object searches. Generic stack, normalization, curve, Jacobian, trace, graph and cohomology infrastructure was traced to suppliers; the new ownership here is its modular integral realization and the stated comparisons, subject to R02. No duplicate fully qualified name among this file's ten declarations was identified. Supplied open-head context was checked; this is not a claim to have audited unavailable open work.

The required movable dependency check returned:

```text
not movable: ModularCurvesPartII consumes ClassFieldTheory (#254) and is consumed by EllipticCurveModularityPartII (#226), which comes first: moving ModularCurvesPartII after ClassFieldTheory would put a supplier after a consumer, a cycle through ModularCurvesPartII
UPWARD: ModularCurvesPartII (#80) -> AlgebraicCurves (#238) at README lines [2486, 2639, 3523]
UPWARD: ModularCurvesPartII (#80) -> ClassFieldTheory (#254) at README lines [4197]
depcheck: 164 roadmaps, 1177 edges, 2 problem(s)
```

Both UPWARD lines are false positives under this review's explicit main-roadmap exception: AlgebraicCurves and ClassFieldTheory already exist on main, and the consumed mathematics is there. Their later revision jobs are not suppliers. Moving this roadmap after those revision jobs would manufacture the displayed ordering cycle. The correct resolution is to preserve main-branch supplier provenance, not add an upward dependency. No merge-order or tooling file was edited. The earlier owner in R02 is also before this roadmap. No further actual cycle was identified in the explicit internal dependency links.

The worker's gate remains **FAIL**: `residue=172`, `readme-ids-missing=1`, `depcheck=2`; every other reported counter is zero, including build, stray-files, imports, sorry-data, dropped, dirty and outside-folder. R03 and R04 cover the actual text failures; the preceding paragraph addresses both dependency diagnostics individually. The later direct Lean build result does not turn the full gate green. Acceptance is therefore unavailable independently of R01/R02. HEAD matched the requested commit and the outside-folder diff was empty.

## Not verifiable

These limitations are source-access limitations, not permission requests or assertions that unread text supports a claim. The source service was used throughout; no paywall was bypassed and no source was copied into the repository.

- **FaltingsChai**, *Degeneration of Abelian Varieties*, III §9, pp.80–86, and IV §3.1(vi), p.107: publisher access resolved only to an uncertified/paywalled text. The primary Kodaira–Spencer locator for §7.1a remains uncertified; the Tate normalization was computed and DDT was read.
- **BLR**, *Néron Models*, §§2.2–2.3 and §7.3, Lemma 2/Proposition 3, pp.179–180: publisher text unavailable through the service. The cited henselian lifting details were not certified from that book.
- **Stichtenoth**, *Algebraic Function Fields and Codes*, III §1, Definition 3.1.8, Proposition 3.1.9 and Corollary 3.1.14: publisher text was uncertified/paywalled. The primary divisor norm/conorm passage used in §13.2 could not be checked directly; the constant-extension and ramification factors were tested in the table.
- **KatzMazur**, *Arithmetic Moduli of Elliptic Curves*, Theorem 13.4.7 for §11.2: Princeton returned HTTP 403 and the source-service title lookup found no legal readable copy. It remains in the missing-reference record.
- **SerreENSJF**, 1967 ENSJF algebra colloquium, Théorème I5 for §0.2: source-service bibliographic search found no legal text. Edixhoven's reproduced criterion was available, but the primary source remains in the missing-reference record.
- **BTErrata**: the author-hosted correction was fetched, but portions of its extraction are not readable enough to certify every proof detail. This review uses BT's opened §§2–3 for the seeded sample, not a claim that the whole article or all later estimates have been certified.

The two unresolved missing works were kept together in the job's missing-reference record; the three service-marked uncertified books were not re-requested. No review or manifest was parked or modified pending access. The computed probes and supplier/source checks above do not amount to formal proofs of the README's unimplemented general theorems.

## Source issues

The following are errors in the texts themselves, not additional numbered findings against corrected roadmap statements. Each description is in the reviewer's own words.

- **Misprint** in ConradAnalytic at Proposition 2.9, printed p.4 (line 207): the source says the affine Weierstrass function is holomorphic on every parameter-point pair; it should be holomorphic off the moving lattice poles, with a projective extension at the zero section; affects a stated result.
- **Error** in ConradClassical at Proposition 3.1(1), printed p.3 (line 144): the source says the quotient map for a discontinuous group action is proper with finite fibres; it should be a statement about the local finite-stabilizer quotient chart, since an infinite group can have infinite orbits; affects a stated result.
- **Error** in ConradGen at Theorem 4.3.4, printed pp.38–39 (lines 1875–1908): the source says component copies are indexed independently by unit b and divisor r; it should be indexed modulo the polygon automorphisms, giving φ(d)/2 copies for d>2, with r not an independent component label; affects a stated result.
- **Error** in CesMod at Proposition 4.3.6, preprint printed p.39 and published pp.2052–2053 (line 1728; published line 2010): the source says the listed prime-power and twice-prime-power exceptions exhaust nonschematic full levels; it should be restricted to level at least two, or include level one among the exceptions; affects a stated result.
- **Error** in BT at §2.2, printed p.715 (lines 265–270): the source says projective full level is fine and the unrigidified polygon cusp has stabilizer order p; it should be coarse projective level, with raw stabilizer order 2p and effective rigidified stabilizer order p; affects a stated result.
- **Error** in MilneMF at Example 8.9, printed p.100 (lines 5168–5176): the source says the Legendre family is a universal elliptic family over the affine line for full level two; it should exclude parameters zero and one and retain the inversion stabilizer rather than claim fine representability; affects a stated result.
- **Error** in RibetStein at Chapter 5 introduction, printed p.63 (lines 2727–2729): the source says compact-curve first cohomology equals compactly supported first cohomology of every dense open; it should use the parabolic image, since two punctures on the projective line already add a compact-support class; affects a stated result.
- **Error** in RibetStein at Theorem 5.2, printed p.66 (lines 2856–2860): the source says the cup/Petersson comparison has real factor 4π; it should have factor −8π²i for the normalized differential f↦2πif dz and the stated complex orientation; affects a stated result.
- **Error** in GrossZagier at III Proposition 1.4, printed p.255 (lines 1188–1189): the source says nonregular points occur only at supersingular elliptic curves with extra automorphisms; it should also allow ordinary mixed prime-power points with nonreflection stabilizer action, such as p=5, exponent two, j=1728; affects a stated result.
- **Misprint** in CDT at Lemma 4.5.11, printed pp.31–32 (lines 1950–1955): the source says the level-five invariant and semisimplification assertion uses coefficients F₃; it should use F₅, as the surrounding proof does; the twelve-cusp augmentation module has a constant invariant over F₃; affects a stated result.
