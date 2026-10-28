<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1023#issuecomment-6449409000 -->
Red team round 2 pass a (codex) of 40f55c8

Verdict: needs_changes

1. **F01** (P2) The spherical formula needs a compatible doubled hyperspecial subgroup

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:432`: “For hyperspecial spherical section f° with f°(1)=1 and spherical vectors with ℓ(v)=1”.

   **Claim:** These hypotheses imply d₁Z equals the standard Euler factor, including at residue characteristic 2.

   **Witness:** Over ℚ₂ in the stated A⊕D coordinates, choose K=GL₂(ℤ₂), π=χ=1 and s=1/2. Then Z=3/2, d₁=4/3 and d₁Z=2, whereas L=(1−1/2)⁻²=4.

   **Calculation:** Write t=2^(−s−1/2). The embedded x∈ℚ₂× has matrix ((x+1,x−1),(x−1,x+1))/2. For x a unit it lies in K. For v₂(x)=±m, m≥1, Iwasawa covariance gives f°=t^(m+2), since the maximal norm of the lower row is 2 max(1,abs(x)). With vol(ℤ₂×)=1, Z=1+2t³/(1−t); at t=1/2 this is 3/2. All denominators are nonzero. This K is hyperspecial and even contains the embedded compact torus; those conditions alone do not fix the spherical normalization.

   **Exact repair text:** “Choose a self-dual unramified lattice L in V and the hyperspecial subgroup K_W stabilizing L⊕L in the original V⊕(−V) coordinates. Use its image under the explicitly specified polarization change, and take the K_W-spherical section normalized at 1. The spherical identity refers to this compatible lattice datum, transported together with the embedding and Haar measures. It does not hold for every independently chosen hyperspecial subgroup.” Add: “Over ℚ₂ in split rank one, this K_W is the conjugate of GL₂(ℤ₂) from the original coordinates; the unrescaled A⊕D coordinate lattice gives Z=3/2 at s=1/2 and is a negative control. For K_W the shells give t^m, hence Z=(1+t)/(1−t)=3 and d₁Z=4.” Retain every dyadic place in scope and prove the lattice comparison there.

   **Repair test:** With the compatible original-coordinate lattice, the lower-row norm governing the induction is max(1,abs(x)), rather than 2 max(1,abs(x)); both tails become t^m, giving (4/3)·3=4. EHLS line 2082 chooses its specific integral model G₄(ℤ_ℓ), not an arbitrary hyperspecial subgroup.

2. **F02** (P3) The central-cancellation Check gives the wrong value after one omission

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1031`: “a coefficient multiplier a and section multiplier a⁻¹ have product 1; omitting either factor leaves a.”

   **Claim:** Omitting either of two inverse factors gives a.

   **Witness:** Put a=2. The product is 2·(1/2)=1; omitting the coefficient gives 1/2, whereas omitting the section gives 2.

   **Exact repair text:** “For a distinguished-central z, a coefficient multiplier a and section multiplier a⁻¹ have product 1. Omitting the coefficient leaves a⁻¹, while omitting the section leaves a. With a=2 these are 1/2 and 2, respectively.”

   **Repair test:** Both omissions now have their actual values and both differ from 1.

3. **F03** (P2) The statable equivariant Cauchy theorem remains absent

   Re-raised: a.F02 (round-one repair report, F02).

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean:15`: “expressible on the pinned Weyl modules … rather than a headline”. README §4.4, lines 649–657, still constructs the full field-compatible equivariant decomposition.

   **Claim:** Being used as an input to later branching theorems is sufficient reason to omit this deep theorem from the acceptance file.

   **Witness:** `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:87` and `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:429,441` supply its two sides. At u=d=2 the decomposition is 10=9+1, with nontrivial GL₂×GL₂ actions; it is not a boundary computation or definition.

   **Why the disposition fails:** The acceptance rule includes deep results the roadmap is built to reach, not only its final applications. The pinned declarations define the carriers and actions; none proves this equivariant Cauchy decomposition. The target builds new decomposition maps and scalar-extension compatibility, so it fails the one-tactic padding probe. Calling it a classical input does not supply an existing theorem or make it padding. The correction to the missing-carrier sentence is valid but does not repair the omission.

   **Exact repair text:** “State in Suggested.lean the following headline, with `sorry`: for every characteristic-zero field E and u,d∈ℕ, the homogeneous degree-d part of E[Xᵢⱼ], with action f(X)↦f(g₁⁻¹Xg₂), is GL_u(E)×GL_u(E)-equivariantly linearly isomorphic to the direct sum over Young diagrams λ of size d and at most u rows of (TauCeti.weylModuleOfShape E u λ)∨⊗[E]TauCeti.weylModuleOfShape E u λ. Use native homogeneous submodules, linear duals, tensor products and direct sums, and only real-bodied specialization/action definitions. Import the individual Weyl-module modules used. Name the theorem in §4.4 and remove the sentence excluding it from the headlines.” Retain the scalar-extension/projector development in the README; do not add the dimension calculations as Lean theorems.

   **Repair test:** u=d=2 over ℚ and ℚ(i) gives the same equivariant decomposition of dimensions 10=3²+1²; u=d=0 gives the constant line 1=1, and u=0,d=1 gives 0=0. No admissible or Harish–Chandra carrier is needed.

4. **F04** (P3) The repaired root transform now precedes its geometric datum

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:910`: “§5.4 (doubling coordinates r_z, for the classical transform only)”.

   **Claim:** The written Layer 5 order constructs the classical root transform before the doubled groups, δ, Levi maps and coordinates used in its definition.

   **Witness:** The transform at line 878 evaluates W(r_z). Its required δ and Siegel Levi first occur at lines 914–946; CFK line 845 defines r_z using precisely those data. Section 5.4 needs only §§0.3 and 5.1.

   **Exact repair text:** “Order the Layer 5 targets as: unipotent character; local generalized Speh comparison; generalized doubling geometric datum; root elimination; section family; estimates. Move the present §5.4 before the present §5.3 and update the internal section references.”

   **Repair test:** The order 5.1→5.2→old 5.4→old 5.3 supplies δ and the Levi map before W(r_z) is formed. The c=3,l=1 transform retains exponent 1, while c=3,l=2 remains excluded. There is no mathematical cycle; the new forward reference is avoidable by this reorder.

## Earlier findings: repair verification

The earlier reviews contain nine pass-a findings and four pass-b findings. All thirteen dispositions were checked against this head. Locations below are in `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md` unless stated otherwise.

| Earlier finding | Status | Repaired passage and witness |
|---|---|---|
| a.F01, arbitrary inducing characters | repaired | Line 139: “for every continuous quasi-character χ of E× with no condition on its restriction to F×”. The same slug and needs occur in the plan. At (2,2) in ℚ₃×ℚ₃, the ramified quadratic character gives −1, versus 1 for splitting characters and norm twists; the new contract includes it. |
| a.F02, Cauchy acceptance theorem | partly repaired | `Suggested.lean:15` now says “expressible on the pinned Weyl modules”, removing the false carrier explanation, but still excludes it as “rather than a headline”. The full field-compatible decomposition remains absent; S03 explains why the stated reason does not meet the acceptance rule. |
| a.F03, two supplier locators | repaired | Lines 69 and 81 say “SR.5.1 mirabolic-derivatives and SR.5.3 highest-derivative-adapter” and “AL.2 … the Jacquet–Shalika Satake bound”. Current supplier targets occur at SR README lines 3647, 4716 and AL README line 1820. The plan names SR.5.1. For q=4, α=1 the supplied bound is 1/2<1<2. |
| a.F04, additive-character discrimination | repaired differently | Line 1030: “the opposite convention ψ_U⁻¹ would multiply the integrand by … ζ₃²≠1”. CFK lines 512–518 identify V and the inverse character. Correct descent gives ζ₃ζ₃⁻¹=1; the wrong sign gives ζ₃². This tests actual V-data, avoiding the unsupported U₀ chart from the earlier proposed repair. S02 is a separate nearby Check error. |
| a.F05, p-adic consumer scope | repaired | Line 7: “p-adic interpolation and integral congruence applications … are outside this roadmap”; line 1709 names “subsequent arithmetic applications”. The supplied AutomorphicPadicLFunctionsPartII head concerns Hecke values/ray classes, and is no longer assigned unitary-doubling interpolation. |
| a.F06, punctured gamma divisor | repaired | Line 1142: “take its zero divisor on ℂ×”; line 1169 computes γ=−3X². Its divisor on ℂ× is empty, giving P=1 and L=1. The root of 1−aX remains a⁻¹. CFK line 673 uses zeros in s. |
| a.F07, nonunitary torus factors | repaired | Line 1142: “no unitarity or sign condition on their exponents”; line 1231 separates the torus base case from proper Langlands chambers. For μ=χν⁻¹ and τ=χ over ℚ₃, L(2)=L(1,1)L(3,1)=81/52; the exponents −1,+1 cannot be simultaneously zero after one common shift. |
| a.F08, two root-transform domains | repaired | Lines 878–880 separate “0<l<c” from “1≤l≤⌊c/2⌋” with an actual classical parabolic. c=3,l=2 is allowed only in the first construction; c−2l=−1 excludes the second. CFK lines 430 and 852–863 give the classical domain. The new reference to §5.4 is a within-layer ordering issue recorded in S04. |
| a.F09, restriction-space codomain | repaired | Line 878: “a surjection onto R_l(τ)”; line 1343 restricts the auxiliary reduction accordingly. CFK lines 857–858 give exactly this restriction. The stated GL₃ test has restricted W′=0 and W′(diag(1,2,1))=ζ₃²−ζ₃≠0. The norm twist is 1 on that unit diagonal. |
| b.F01, contragredient numerator | repaired | Line 432: “L_E(s+1/2,BC(π∨)⊗χ⁻¹)”; lines 547 and 736 propagate it. β₀(ϖ)=i, χ=(1,−1), t=1/2 gives X=Y=−i/2 and (3/4+i)⁻¹ on both repaired sides, versus (3/4−i)⁻¹ for the old label. S01 concerns the separate choice of hyperspecial subgroup. |
| b.F02, Satake-bound locator | repaired | Line 81 now attributes the bound to AL.2; the §10.3 Needs line and Layer 10 dependencies agree (lines 1657,1705). Current supplier README line 1820 precedes AL.3. Same q=4 computation as a.F03. |
| b.F03, derivative locator | repaired | Line 69 and the plan now distinguish SR.5.1's unnormalized functors from SR.5.3's normalized highest-derivative adapter. For a GL₁ character the terminal derivative has dimension 1; for a GL₂ determinant character the full second derivative is 0. |
| b.F04, EHLS multiplier attribution | repaired | Line 306 now says (54) “attaches the factor … recomputed here in the m(B,λ) coordinates”. EHLS lines 1920–1924 and 2224–2227 use the product coordinates. The factors ν⁰ and ν¹ agree at ν=1, but give 1 and 4 at ν=4, so the complete GU character remains necessary. |

The six historical G1–G6 records have the settled disposition in `packages/AutomorphicLFunctionsAndLocalFactorsPartII/reports/FIX-PKG-AutomorphicLFunctionsAndLocalFactorsPartII~2.md:5`: their obligations were assigned to package targets or named supplier contracts and their immutable coverage references require intake retirement. That reason remains applicable; no administrative re-raising is made here.

## Sampled adversarial calculations

These 24 rows retain representative computations from the full pass. All locations are in `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md`. The standing domain is characteristic-zero local or number fields and complex smooth/admissible or Casselman–Wallach representations as specified. Zero rings, characteristic-p coefficient fields, inseparable extensions and q=1 are outside that domain, not silently admitted test objects. Residue characteristics 2 and 3 remain included. Rank zero is used only where the text supplies a boundary convention. A numerical identity tests the stated normalization; it does not certify the full analytic proof.

| Target and location | Instances | Computed sides or values | Result / change |
|---|---|---|---|
| §0.1, line 149, the doubled hermitian space | ℂ-line h(x,y)=x̄y; V=0; (u,v)=(3,1) | h_W(D1,D1)=0, h_W(A1,D1)=2; inverse=(1,2), reconstruction=(3,1), missing halves=(6,2); rank-zero GU records all λ, not one | Sound within char 0; characteristic 2 would destroy the inverse and is excluded. |
| §0.2, line 187, siegel parabolic and modulus conventions | n=1, norm(B)=4, λ=1; scalar B=2I,λ=4; X=i,Y=2i | δ_mod=1/4, δ_EHLS=4; scalar modulus=4^(n²)4^(−n²)=1; n(i)n(2i)=n(3i) | Sound; positive determinant and reciprocal convention distinguished. |
| §1.2, line 304, godement sections from Schwartz functions | Φ=0; n=1,s=0,p=diag(4,1); measure×3 | Section 0; row (0,x)p=(0,x), covariance 2; wrong row has inverse scaling 1/2; value 2→6 | Sound with fixed measures and E-split coordinates. |
| §2.1, line 360, local unitary doubling integral | v=0; pairing 2,Z=6; ℓ→5ℓ; compact mass 7 | Z=0 and pairing=0, so I undefined; I=6/2=30/10=3; compact Z=7·2=14,I=7 | Sound; no 0/0 normalized integral. |
| §2.2, line 396, unitary unramified denominator | n=0,1,2;q=2,s=0,χ=1,nonsplit η(ϖ)=−1 | d₀=1,d₁=2,d₂=(4/3)(2/3)=8/9; replacing η by 1 gives 8/3; recurrence gives 8/9 | Sound meromorphically; rational test denominators nonzero. |
| §2.3, line 430, unramified unitary doubling formula | Split Q₂ rank one, trivial characters, s=1/2; complex Satake β=i | Independent coordinate K gives dZ=2 versus L=4; compatible doubled K gives dZ=4; β=i test gives (3/4+i)⁻¹ on repaired dual side | S01; contragredient repair sound. |
| §3.1, line 464, unitary doubling identity | S₃ standard plane, v=(1,−1,0),ℓ(x)=x₃; concentrated section near (23) | ℓ(v)=0 but ℓ((23)v)=−1, so the unfolded weighted pairing can be nonzero; correct target does not divide by the initial pairing | Sound correction of the fixed-section invariance error. |
| §3.2, line 474, unitary MVW comparison | Norm-one z=e^(iπ/6),χ(z)=z²; GL₂(R) compact Cartan; ν=4 | χ∘θ=e^(−iπ/3) versus χ=e^(iπ/3); θ²χ=χ; transpose-inverse a rφ→a⁻¹rφ, inner-adjusted→a⁻¹r−φ; ν⁰=1 versus ν¹=4 | Sound with stated real inner adjustment and separate GU twist. |
| §4.1, line 565, holomorphic unitary modules and strong positivity | a=b=1,κ=(0;0),(1;−1),(2;−1); a=0,b=1 | Gaps 0<2,2=2; μ=(0,0) on boundary; generator weight (−2;1), dual (2;−1); compact cohomological degree ab=0 | Sound non-strict dominance and dual convention. |
| §4.4, line 647, Cauchy decomposition and highest minor vectors | u=d=2 over Q and Q(i); u=d=0;u=0,d=1; two noncommuting unipotents | Homogeneous dimension 10=3²+1²; boundary 1=1 and 0=0; composition matrix [[1,−1],[−1,2]]; X₁₁ changes by −1 under the wrong first Borel | Mathematical statement sound; S03 missing Lean headline. |
| §4.8, line 726, critical archimedean doubling section | n=1,m=3,aχ=2,bχ=0;B=2,r=s=0; positive Levi2 | t=2,scrit=3/2; Jχ=1/16=(1/2)4^(−3/2); norm decomposition 4³·2⁻²=16=4²; at identity f=2 | Sound parameter and character inversion. |
| §5.2, line 834, (k,c) models and the local generalized Speh comparison | k=1,c=2; k=2,c=1 infinite direct sum over Q₂; GL₄ derivative types | Determinant-character model dimension 1,ordinary Whittaker dimension 0; K(m)-fixed dimension dimπ^K(m)+max(m−1,0); derivatives (2,2) terminate dimension 1, generic first derivative4 fails rectangle bound2 | Sound: general (k,c) type does not imply finite length. |
| §5.3, line 876, root elimination for (k,c) functionals | k=2,c=2,l=1; classical c=3,l=1 versus l=2; GL₃ restriction kernel | Permutation (1,3,2,4); exponent (kc−kl−c+l)/2=(6−2−3+1)/2=1 for k=2,c=3,l=1; l2 gives tail−1 and is excluded; restricted W′=0 while W′(diag(1,2,1))=ζ₃²−ζ₃ | Repaired domains/codomain sound; S04 ordering. |
| §6.1, line 1004, generalized local doubling integral | Zero data;k=1; ψ₃; distinguished-central multiplier a=2 | Z=0;k1 inner evaluation; ζ₃ζ₃⁻¹=1 versus wrong ζ₃²; complete central multiplier2·1/2=1, omissions1/2 and2 | S02 only; integral descent repair sound. |
| §6.7, line 1140, L- and epsilon-factors from tempered data | P=1−2X; SO₂/Q₃ ramified quadratic τ; b=±1/4 | P(0)=1 versus (3P)(0)=3; γ=−3X² has empty divisor on C×→P=1,L=1; shifts L(s+1/4)L(s−1/4) | Repaired punctured divisor and torus base sound. |
| §6.11, line 1205, split-torus local factors | SO₂/Q₂;GSpin₂/Q₃;ramified cancellation; nonunitary μ=χν⁻¹ | Values4 versus one-factor 2; spin9/8 versus9/4; μτ=μ⁻¹τ=1 despite ramification; nonunitary at s2 gives81/52; real sgn gives Γ_R(s+1)² | Sound all-place torus branch. |
| §7.1, line 1245, auxiliary GL_c × GL_k integral | (k,c)=(1,2),(2,1),(1,1); Φ=0 | Exponents s+1/2,s−1/2; without Φ both shell tails demand Re(s)>0 and<0, impossible; zero Φ gives0 | Sound Schwartz cutoff and convolution distinction. |
| §7.3, line 1297, common pole divisor of the auxiliary integrals | P=1−X/2;exp(s);{t⁻¹,t⁻²} | Pole order1 at X2;exp has order0; common pole order2 and t²t⁻²=1 attains it | Sound pole multiplicities, not merely pole sets. |
| §8.1, line 1371, global Speh doubling Eisenstein series | c1;k=c1,H=SL₂,τ1; extraneous θ quadratic conductor5 | Speh₁=τ;s_G1/2→s_E0; incorrect θ would satisfy exclusion yet spherical E has pole s1,residue6/π; required θ1 fails exclusion at t0 | Sound repaired family domain. |
| §8.3, line 1417, residual exponents and the hermitian-support obstruction | c2,s=1/4; boundary s=1/2 | First exponent−3/4, tail≤1/4, partial sums≤−3/4,−1/2; at endpoint final bound0 cannot imply strict negativity | Sound open-half-plane residue argument and separate endpoint. |
| §9.3, line 1528, global functional equation and strip bounds | Completed symmetric entire function e^(−(s−1/2)²) as negative control | f(s)=f(1−s) but on s=1/2+it its magnitude=e^(t²), unbounded | No counterexample; independent strip estimate is required and targeted. |
| §9.5, line 1550, the split-torus branch: SO₂ and GSpin₂ | Trivial Q torus;class-order3 μ over Q(sqrt(−23));ramified replacement | Λ_Q² has poles of order2 at0,1; μτ=1 produces pole order1 at1 despite non-selfduality; added ν makes both characters ramified and pole order0 | Sound separate torus entireness criterion. |
| §10.2, line 1612, coarse local transfer | GL₂ trivial versus Steinberg; q4,s1; nongeneric test | Same support {ν^1/2,ν^−1/2}; gamma ratio(1−1/2)/(1−2)=−1/2=−4^(−1/2); L differs by L(s−1/2); nongeneric Whittaker dimension 0 | Sound support/isomorphism distinction; archimedean carrier convention remains supplier-dependent. |
| §10.5, line 1669, every weak transfer is coarse at every place | T={v₁},distinguishedv₀,auxiliary goodw | Number of uncontrolled factors away from v₀=0: v₁ cancels by stability,w by good-place comparison; allowing ramified test at v₁ would leave1 uncontrolled | No counterexample; exact globalization contracts retain auxiliary controls. |

### Suggested.lean declaration and context register

| File region | Declarations | Variable / instance context | Computed coverage | Result |
|---|---:|---|---|---|
| `Suggested.lean:1–36` | 0 | No variables, instances, definitions, theorem binders or admitted data | 1 import; 1 module docstring; 17 headline-family bullets; 0 signatures and 0 padding declarations | Import/namespace/data policy passes. Cauchy coverage is 0 of 1 statable deep target: S03. |

No `#check @name` elaboration was run: the quantified declaration set is empty, the supplied signatures file is absent for that reason, and the brief prohibits Lean builds. There is no lost section-variable or universe binder to inspect. The other seventeen headline families are named individually in the module docstring with the substantial missing carriers; none is replaced by a scalar-function stand-in.

## Supplier, ownership and direction register

The content checkout is main at `d2e0f0d323cf817cdf8a11c7a2fabd0a3f0ec828`. The pinned Mathlib revision is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; the pinned Tau Ceti revision is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both checked-out revisions match `lake-manifest.json`. Current supplier texts were resolved with the roadmap tools and read at main or their supplied open heads. The table records the substantive contracts, rather than treating successful name resolution as proof of a matching statement.

| Supplier and repository-relative witness | Matching contract and boundary checked |
|---|---|
| `TauCetiRoadmap/ReductiveGroups/README.md:627` | Layer 7 supplies rational parabolics, Levi complements and root data for a supplied connected smooth reductive group. It does not construct U/GU/GSpin from a form. |
| `TauCetiRoadmap/OrthogonalSpinGroups/README.md:1` | Layers 0–1 concern general-field nondegenerate quadratic forms with 2 invertible, SO, Spin and Clifford action. Characteristic-zero local fields include ℚ₂; the coefficient field still has 2 invertible. This does not supply quadratic-étale Hermitian groups. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:463` | RG2.0.1–0.2 give evaluation topology and locally compact local-field points with finite-type hypotheses; RG2.0a gives restriction of scalars; RG2.4.4 at line 6213 gives local decompositions; RG2.5.1–5.2 at lines 6724 and 6931 give actual-group dual data and L-groups. The two concrete group contracts remain additions. |
| `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:218` | Layers 2–3 supply complex Schur/highest-weight theory. They do not state the coefficient-field polynomial Cauchy isomorphism. For a two-row shape in dimension one the Weyl module is 0, so the dimension restriction is retained. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1833` | SR.0.4, SR.2.1–2.3, SR.3.3 and SR.4 provide the cited admissibility, induction/Jacquet, tempered-support and Satake targets. SR.5.1 at line 3647 is the unnormalized mirabolic theory; SR.5.3 at line 4716 is the highest-derivative adapter. The two are not interchangeable. |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:558` | §§0.1–0.4, AA.1 and §§2.2–2.3 provide the restricted products, explicit Haar rescalings and quotient integration used here. Rescaling one local measure by 2 multiplies the corresponding integral and Euler product by 2. |
| `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:590` | R16.1.8 prescribes full finite-image local characters, not just their restrictions to units; auxiliary ramification and growth of order are allowed. A character with unit restriction 1 and uniformizer value −1 is distinguished from the trivial character. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1820` | The Satake bound belongs to AL.2. AL.3 supplies generic pair factors, isobaric strong multiplicity one and its own converse tests; AL.4 supplies unramified Euler factors. The isobaric constructor is in Representation prerequisites, at line 269. No arbitrary automorphic representation is identified with its isobaric support. |
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:288` | §§2.1–2.7 give Harish–Chandra modules, normalized induction, Langlands data and globalizations; §§3.4–3.5 and 4.2 provide global representation structures; §§5.3–5.4 and 6.1–6.2 give the Hermitian/cohomological inputs. The extra wave-front, derivative, classical-transfer and controlled-globalization statements are explicitly contracted below. |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:1534` | §§2.1–2.6 give the claimed intertwiners, smooth discrete-data Eisenstein families and ordered residues. §2.3a is a generic GL estimate, not the Speh-block extension. §4.14a at line 2522 owns residual Speh, including its local quotient data. §5.12 at line 2903 gives the support decomposition, with the constituent-induction extension explicitly contracted here. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4052` | §10.29 provides nonarchimedean nongeneric pair factors via canonical quotient data. Equal support implies equal gamma products, but not equal L-factors or isomorphic representations. §5.1 imports the same residual Speh owner. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:732` | §2.9 supplies signed Hermitian forms, adjoints and trace transfer over fields. It is not used to put a field instance on F×F; the split étale pairing comes from MetaplecticAutomorphicForms §3.2a. |
| `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:606` | §3.2a supplies the split pairing; §§3.3,3.3b,3.5–3.7 supply oscillator/theta data; §3.15 at line 732 supplies finite-place MVW; §6.2 and §§6.10a–6.11 supply the stated Siegel and standard-doubling constructions with the splitting-character restriction. The arbitrary-character extension is therefore not already supplied. |

All 22 named contracts occur under Exact supplier contracts and have identical slugs and needs in `packages/AutomorphicLFunctionsAndLocalFactorsPartII/design/plan.json`. Their missing assertions are not counted as defects. The following are the precision/minimality checks; standing local-field, coefficient and representation-category hypotheses are those in README Conventions.

| Gap slug | What remains beyond the current supplier; discriminating boundary |
|---|---|
| hermitian-unitary-groups | Concrete group schemes, multipliers and embeddings, beyond supplied forms/topologies. Rank 0 gives U=1 and GU=Gₘ; the multiplier is not recovered from the zero action. |
| gspin-group-schemes | Even Clifford rational points do not alone give a reductive group scheme or pinned root datum. At c=2 the full center has dimension 2, while the distinguished central cocharacter has dimension 1. |
| classical-support-quotient | Quotient realization with Weyl-conjugate support is additional to a subquotient/support statement. The central twist is the one in the package's quotient-multiplicativity formula; no arbitrary subquotient is silently a quotient of the original ordering. |
| rectangular-orbit-support | Exact generalized-Whittaker/terminal-derivative identification and orbit vanishing exceed the derivative constructors. For a determinant character of GL₂, the successive highest orders are 1,1 and the terminal dimension is 1; the regular Whittaker dimension is 0. |
| standard-archimedean-transfer | The supplier's GL parameters do not construct the five classical standard transfers. Sp₂ has standard degree 3 and SO₃ degree 2. |
| opposite-unipotent-estimate | The specific absolute integral and continuity are additional to smooth induction. The open positive chamber is strict; at its boundary the rank-one decay integral can diverge. |
| real-chevalley-contragredient | The supplied category does not establish this involution theorem. For a unitary character z↦z on a compact torus, inversion gives z⁻¹, while the identity involution does not. |
| prescribed-classical-supercuspidal-globalization | Prescribed central character and unitarization transport exceed the general globalization target. Twisting by ζ and back by ζ⁻¹ gives total twist 1. |
| controlled-gl-test-globalization | Control at T and at the isolated place is extra. With T={v₁}, auxiliary ramification at a common good place leaves 0 uncancelled comparison factors away from v₀; allowing it at v₁ can leave 1. |
| archimedean-wavefront-whittaker | Generalized Whittaker support/nonvanishing is not supplied by the Harish–Chandra carrier. A finite-dimensional GL₂ representation has zero regular Whittaker space and zero-orbit support. |
| archimedean-induced-wavefront | Orbit induction and associated cycles are extra. Inducing GL₁ zero orbits to GL₂ yields the regular orbit; component cycles cannot be replaced by one arbitrary constituent. |
| archimedean-derivative-models | Identification with the dual terminal derivative is extra. c successive drops of k take kc to 0, not to k. |
| archimedean-degenerate-derivative | The explicit normalized derivative calculation is extra. For k=1,c=2 a determinant character drops to GL₁ at its first highest derivative; the top GL₂ Whittaker derivative is 0. |
| archimedean-whittaker-exactness | Exactness is requested on the specified orbit-bounded Serre quotient, not on every representation. The displayed exact sequence reverses arrows under continuous duality; dimensions 1,2,1 satisfy 2=1+1. |
| eisenstein-pole-cuspidal-detection | Preservation of pole order at the specific cuspidal-support constant term is extra. A pole of order 2 must remain order 2; mere nonzero constant term does not suffice. |
| speh-cusp-normalized-intertwiner | The block ρ_c′ is not the supplier's generic inducing representation when c′>1. At c′=2 the asserted region is Re(s)>−1/4, with normalization L(2s+2)/L(2s). |
| twisted-square-normalizers | Twisted square-factor holomorphy under exclusion of every imaginary self-dual twist is additional. At k=1, exterior square has dimension 0 and factor 1; symmetric square is the nontrivial Hecke-factor question. |
| hermitian-residual-support | The residual carrier does not itself prove Weyl stability under Hermitian duality. λ=1 becomes −1; complex conjugation alone would leave 1. |
| automorphic-constituent-support | Passing from a support decomposition to an irreducible normalized-induction subquotient in a positive chamber is an additional theorem. With no proper Levi, the datum is the representation itself. |
| gamma-supercuspidal-support | Canonical factors do not imply the converse detection theorem. GL₂ Steinberg and the trivial representation have the same support and gamma tests but are not isomorphic. |
| nongeneric-pair-epsilon-character-change | The nongeneric extension retains the explicit central exponents. N=2,k=1,b=2,s=1 over ℚ gives the absolute-value exponent 1, not 2. |
| arbitrary-character-unitary-doubling | The restriction on splitting characters excludes the ramified quadratic example χ(2,2)=−1 over ℚ₃×ℚ₃. The named extension includes it; norm shifts alone give 1 there. |

Ownership was searched by object with `roadmaps grep`, including polynomial Cauchy decomposition, highest minors, generalized doubling, rectangular-orbit models, GSpin and Garrett pullback, and separately in the board packages and pinned libraries. Relevant matches were read in ClassicalGroups, ClassicalGroupsPartII, ReductiveGroups, OrthogonalSpinGroups, MetaplecticAutomorphicForms and AutomorphicPadicLFunctionsPartII. The supplied open p-adic head does not own the unitary interpolation application removed by the earlier repair. Existing Schur, standard-doubling and residual-Speh constructors are imported; the polynomial Cauchy comparison, convention transport, specialized holomorphic kernels and nongeneric generalized-doubling transfer are this package's extensions. No declaration collision is possible in the current empty Suggested.lean. This is an object search against available heads, not a claim to have read every unrelated open roadmap in full.

The citation resolver returned no unresolved cross-roadmap citations. Its inability to resolve non-roadmap library names without its own installed packages was addressed by reading the supplied pinned copies directly. The read-only dependency gate returned:

```text
moved: AutomorphicLFunctionsAndLocalFactorsPartII moved in the merge order from #26 to #167, right after its last supplier MetaplecticAutomorphicForms (SmoothRepresentationsOfLocalGroups, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups, GeometryOfNumbersAndQuadraticArithmetic, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, EndoscopicTransferAndUnitaryTraceComparison also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 149 roadmaps, 1009 edges, 0 problem(s)
```

There is no UPWARD or CYCLE diagnostic after the permitted move. No merge-order file was changed. S04 is an internal target-order issue, below the gate's roadmap-level granularity.

## Verified sound

Read all 1,729 README lines and all 36 Suggested.lean lines, together with the repository README and CONTRIBUTING rules. The full pass covered 64 numbered targets, 130 separately listed construction properties and 203 Checks; the table above retains sampled computed instances. Of those 203 Check instances, 202 have the stated value and one is false (S02). These counts include repeated Checks; a successful test is not a proof of the general theorem. Every definition-bearing target has at least three Checks. The new dyadic counterexample S01 tests a theorem beyond its existing Checks.

There are 0 Lean declarations, 0 section-variable contexts, 0 admitted data objects, 0 padding theorems and 1 permitted import. The module docstring names 17 headline families and their missing carriers. Those analytic representation carriers were not found at the pins; the separately statable equivariant Cauchy theorem is the coverage defect S03. All 13 previous findings were revisited: 12 repaired, 1 partly repaired. Two repairs have separate adjacent regressions, S02 and S04; the inverse-character repair remains correct despite S01's independent lattice defect.

The 12 explicit native-library citations were read at the pins: 8 Mathlib declarations and 4 Tau Ceti declarations. The checks retained their actual hypotheses and limitations:

| Pinned witness | Computed distinction |
|---|---|
| `Mathlib/Data/Matrix/Block.lean:45,213` | Four 1×1 blocks assemble [[1,2],[3,4]]; block multiplication gives top-left 1·1+2·3=7. The constructor itself has no semiring hypothesis. |
| `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43`; `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44` | [i]ᴴ=[−i], so [i] is not Hermitian; [0] is Hermitian but degenerate. The predicate supplies neither positivity nor nondegeneracy. |
| `Mathlib/LinearAlgebra/Matrix/Trace.lean:43` | tr([[1,2],[3,4]])=5; the empty diagonal sum is 0. |
| `Mathlib/Algebra/Group/AddChar.lean:70` | The trivial character has ψ(0)=ψ(1)=1. Nontriviality, continuity and unitarity do not follow from the carrier. |
| `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:61,292` | The Lipschitz carrier uses units generated by invertible vectors; the even star-unitary submonoid defining Spin does not package a group scheme. Scalar 2 has Clifford norm 4, distinguishing GSpin from Spin. |
| `TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/CliffordGroup.lean:138` | On even elements the main involution is the identity, so twisted and ordinary conjugation agree. Nondegeneracy and the invertible-2/finite-dimensional hypotheses remain necessary inputs of this pinned comparison. |
| `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:429,441`; `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Irreducible.lean:160` | The shape (1,1) has dimension 0 at n=1 and dimension 1 at n=2; irreducibility has exactly the row-bound condition. The native constructors do not prove polynomial Cauchy decomposition. |

Thirteen supplier families and all 22 named gap contracts were checked in the supplier register. Source checking used the twelve legal cached texts, respecting their recorded versions. The following 93 source anchors were inspected for statement, hypotheses, convention or the cited proof step. A range in the table identifies the portion around that anchor, not a certification of the whole source proof.

| Source | Anchors checked | Count |
|---|---|---:|
| EHLS | lines 1862,1882,1893,2007,2081,2224,3280,3330,3390,3436,3470,3500,3540,3675,3684,3696,4493,6361 | 18 |
| CFK | lines 250,345,419,491,530,549,561,601,613,634,671,711,725,738,760,779,845,852,987,1455,1490,1530,1576,1592,1600,1632,1653,1710,1713,1719,1749,1792,1818,1832,1882,1910,2336,2382 | 38 |
| MODELS | lines 44,94,108,194,219,234,338,467 | 8 |
| GK | lines 88,446,504,4043,4161 | 5 |
| HLS | lines 1704,1765,1799,1818 | 4 |
| GARRETT | lines 164,180 | 2 |
| HARRIS | lines 1170,1184 | 2 |
| HEN02 | lines 216,610,621 | 3 |
| CPS94 | lines 186,249,272,298 | 4 |
| CKPSS01 | lines 141,174,228 | 3 |
| ADAMS14 | lines 46,59 | 2 |
| GGS17 | lines 219,233,247,1310 | 4 |

The package-only diff contains ten changed files, all inside `packages/AutomorphicLFunctionsAndLocalFactorsPartII/`. No forbidden Lean command, computational algorithm, sorry'd definition, `set_option`, `lemma` declaration, or pull-request number was found in README/Suggested.lean. Review output is the only new workspace file from this pass; scratch notes are separate. No Lean process, git-writing operation or external post was run.

## Not verifiable

- CFK22, YAM14 and KAP23 remain settled `uncertified` sources. In particular, CFK22's local-theory proofs, including Lemma 7.3 and the continuation/strip estimates used through CFK; YAM14 Theorem 7.1's good-section comparison; and KAP23 Theorem 25's auxiliary uniqueness are cited by locator, not independently certified. No new request or duplicate manifest key was made.
- GK's theorem statement, distribution hypotheses, orbit setup and global unfolding were checked at the listed anchors. This does not certify every equivariant-distribution vanishing or conormal step in its long proof. The specialized converse argument was checked in CFK/CKPSS01 and the cited CPS94 steps; the entire general converse theorem proof was not independently reconstructed.
- The exact arbitrary-character unitary normalization, specialized holomorphic theta image and rational projected-kernel comparison are targets or precise supplier contracts. Reading the qualitative Garrett theorem and EHLS's formulas does not by itself prove their full comparison. The source defects below must not be propagated into those constructions.
- No Lean elaboration was performed: there are no named declarations to inspect, and builds are forbidden in this review. S03's proposed statement is supported by inspected native carriers, not a claim that replacement Lean code was written or elaborated.
- Historical G1–G6 coverage references are still present in the immutable design record. Their intake retirement is outside this read-only package review; the prior settled disposition is respected.

## Source issues

- **Error** in EHLS at §4.1.4, printed p.47, EHLS lines 2019–2023: the source says a fixed-section doubling pairing is invariant and vanishes when the original pairing vanishes; it should be trilinearly equivariant, transforming the section too; affects a stated result.
- **Misprint** in HLS at (3.1.2.5), internal printed p.44, HLS line 1765: the source says the denominator parity exponent includes an extra n−1; it should be the exponent with that extra n−1 removed; affects a stated result; corrected in print at EHLS §4.2.1, printed p.49, EHLS lines 2111–2113.
- **Misprint** in HLS at §3.1.2, published p.439, internal p.45, HLS line 1799: the source says the base-change target is GL_m; it should be GL_n; affects a stated result; corrected in print at EHLS §4.2.1, printed p.49.
- **Error** in HLS at (3.1.2.9), internal printed p.45, HLS line 1818: the source says the compact-support integral is the subgroup volume for unrestricted vector pairing; it should be that volume times the pairing, or require pairing one; affects a stated result.
- **Misprint** in GARRETT at §1, printed p.2, GARRETT lines 103–104: the source says the extreme coefficient is left N−-invariant on N−K_C N+; it should be left N+-invariant on N+K_C N−, as its annihilation calculation requires; affects the proof.
- **Misprint** in GARRETT at §1, printed p.3, GARRETT line 115: the source says the adjoint involution fixes K pointwise; it should be the adjoint anti-involution restricting to inversion on K; affects the proof.
- **Misprint** in GARRETT at §1, printed p.3, GARRETT line 142: the source says the kernel character at n+θn− is evaluated at k; it should be evaluated at θ; affects nothing.
- **Error** in MODELS at §1, printed p.2, MODELS lines 63–67: the source says twisted U-coinvariants carry an action of all R without normality or character-invariance assumptions; it should be an action of the stabilizer of (U,ψ) in R; affects a stated result.
- **Misprint** in MODELS at §3.2 before (3.4), printed p.7, MODELS line 314: the source says the lower-left block has kl rows and k(c−l) columns; it should be k(c−l) rows and kl columns; affects nothing.
- **Misprint** in CFK at §1, printed p.7, CFK line 294: the source says the restriction of Υ_l has tail Υ_(l−2k); it should be Υ_(l−2r), where r is the total GL-block size; affects a stated result.
- **Misprint** in CFK at (3.16), printed p.17, CFK lines 686–687: the source says a_d>r/2 when abs(Υ)^(−r)π′ is tempered; it should be a_d>r with the displayed normalization and Levi restriction of Υ; affects a stated result.
- **Gap** in CFK at (3.18), printed p.18, CFK lines 739–745: the source says the classical gamma comparison tests every irreducible GL representation; it should be restricted to the constructed generic domain or supplied with a nongeneric extension; affects a stated result.
- **Misprint** in CFK at proof of Lemma 4.3, printed p.36, CFK lines 1580–1583: the source says denominator holomorphy and numerator nonvanishing justify undoing normalization; it should be numerator holomorphy and denominator nonvanishing for the inverse normalization L(2s)/L(2s+c′); affects the proof.
- **Misprint** in GK at §1.3 before Theorem 1.4, printed p.10, GK line 457: the source says the equivariance character is a character of the closed subset Z; it should be a character of the acting group C; affects nothing.
- **Gap** in GK at §3.2 after (3.8), printed p.73, GK lines 4193–4198: the source says the same global identity extends to SO₂ by globalizing the local argument; it should be supplemented by a split-torus construction, since the unmodified period has an infinite norm direction; affects the proof.
- **Misprint** in HEN02 at Proposition 5.2(b)(i), printed p.601, HEN02 line 621: the source says automorphic gamma tests use σ⊗ρ and σ′⊗ρ; it should be π×ρ and π′×ρ; affects a stated result.
- **Misprint** in HEN02 at conclusions of §§5.2–5.3, printed p.602, HEN02 lines 651,655,658: the source says gamma tests identify arbitrary representations themselves; it should be equivalence of Weil restrictions or equality of supercuspidal supports, consistently with the propositions; affects the proof.
- **Misprint** in HEN02 at §5.3, printed p.602, HEN02 lines 653–659: the source says the additive-character argument is s, the test variable is π, and Weil parameters lie in A₀; it should be argument ψ, test variable ρ and Weil-parameter set G₀; affects nothing.
- **Error** in EHLS at §4.2.1, equation (53), printed p.49, EHLS lines 2094–2106: the source says the spherical numerator is labeled BC(π)⊗χ; it should be BC(π∨)⊗χ⁻¹ for its stated right-action induction; affects a stated result.
- **Misprint** in EHLS at §4.4.14, printed p.80, EHLS lines 3669–3673: the source says the minimal compact type of Dᶜ(κ) is W_τ∨ with dual weights; it should be W_τ with weights κ and w₀κ, consistently with equation (90) and EHLS lines 3320–3322; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "40f55c861795a1c0c66fc9694430d738c3a73ba1", "job": "RT-AutomorphicLFunctionsAndLocalFactorsPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
