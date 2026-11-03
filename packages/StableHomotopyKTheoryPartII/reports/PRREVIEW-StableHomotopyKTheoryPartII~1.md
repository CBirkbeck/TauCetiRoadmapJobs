# Review of StableHomotopyKTheoryPartII (pull request #1733 at aec0155)

**Verdict:** needs changes

## R01 (P2) — Restrict the Witt supplier gap to the missing comparison

**Location:** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:110`, the additional RefinedTraceMethods contract, especially “free of rank d over ℤ_p”; also its use in §4.8 at line 607.

**Claim:** `gap:finite-field-witt-etale-frobenius` requests the finite-field Witt rank statement as missing work from RefinedTraceMethods. That part is already supplied by an earlier roadmap. A declared gap may retain missing comparisons, but must not assign an existing result a second owner.

**Witness:** `TauCetiRoadmap/PadicHodgeRegulators/README.md:346` identifies the integers of W(k)[1/p] with W(k) and gives rank dim_(F_p)k; line 351 identifies rational Frobenius with Witt Frobenius.

The merge order places that roadmap at 303, before this one at 310.

This is the supplied open head, confirmed with the roadmap show tool, not an unpublished board variant or a revision of a roadmap on main. Its “Supplier: Finite unramified étale Q_p-algebras” section covers every prime, including 2 and 3, and finite products of finite fields. The rank assertion thus includes precisely the field case requested here. This finding does not claim that its rational-algebra API already states the integral reduction bijection on endomorphisms.

**Exact repair:** Cite that named PadicHodgeRegulators section for the ordinary Witt/unramified identification and rank, retaining the pinned Witt Frobenius formulas. Narrow the existing gap, with the same slug in its plan entry and README contract, to the missing integral finite-étale and reduction-endomorphism comparison. Keep RefinedTraceMethods §6.1 as owner of the spectral étale lifting input and this roadmap as owner of the spherical finite-field Frobenius comparison. The new supplier is earlier, so no ownership cycle or upward edge is necessary.

**Repair test:** For k=F₂ the imported rank is 1; for k=F₄ it is 2, with W(F₄) the integers of the unramified quadratic Q₂-extension. Thus §4.8 still obtains a rank-two spherical module. Its distinct Frobenius sends [a] to [a²]=[a+1] for a²+a+1=0; the remaining gap still supplies exactly the integral endomorphism uniqueness needed to identify this map. No theorem is weakened and no prime is removed.

## Verified sound

Reviewed all 38 numbered targets in `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md`, its conventions, API bullets, Checks, proof routes and dependencies, and all 64 lines of `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean`. The computations below cover every numbered target, all 15 seeded source targets and all 14 headline groups in the module docstring. No route-specific prime restriction, copied exposition, computational algorithm, sorry'd data, option override or outside-folder change was found. The Part II boundary extends the foundations of Part I rather than replacing them. GeneralizedCohomology, TopologicalKTheory and EnhancedDerivedSheaves on main supplied the shape comparison.

**Gate and elaboration.** The supplied gate for the specified head reports every scanner, dependency, metadata, scope and build check passing, including the targeted module build. Independently, direct `lake env lean` elaboration of `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean` exited 0 with no diagnostics. The outside-folder diff is empty. The file has a single `import Mathlib`, no Tau Ceti imports, zero declarations and zero admitted examples. Consequently the declaration-signature and one-tactic padding probes have zero candidates; there is no lost section hypothesis to inspect. This is not evidence of the truth of the prose theorems; their checks are below.

The requested dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1617 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every local Needs edge was read; no proof uses its target's conclusion as an input. In particular the sphere Segal result is an output of §2.7, not an input from AInfCohomology or RefinedTraceMethods, and §7.5 uses raw finite-height Tate descent, not merely K(1)-local Tate vanishing.

**Seeded source verification.** All 15 sampled locators were read in the supplied legal cached texts. Printed pages are distinguished from the explicitly identified preprint and scan pages. The extra proof-route checks included the Singer unit argument, the finite-Hopf bimodules, Euler signs, and the non-finite-type free-loop extension.

| Target | Locator and text witness | Hypotheses and conclusion verified |
|---|---|---|
| 1.2 | lnr12 line 1411, Corollary 4.11, p.890; line 1450, Propositions 4.14–4.15, pp.891–892; line 1550, Proposition 4.16, pp.893–894; line 1608, Proposition 4.17, p.895 | Finite G, bounded-below degreewise mod-p finite type; continuous homology, its strong convergence, continuous dual and multiplicative unit. Ordinary homology of the limit is not substituted. |
| 2.1 | lnr12 line 400, Definition 2.3, p.870; line 1255, Lemma 4.6 and Definition 4.7, pp.887–888 | Colimit cohomology depends on the tower. Defining that colimit for arbitrary towers does not extend the finite-type convergence theorem. |
| 2.3 | lnr12 line 641, Definition 3.1 and formulas (3.1)–(3.3), pp.875–876 | General graded left Steenrod modules, integer Laurent powers, twisted action, suspension and signed augmentation; no instability assumption on the module. |
| 2.6 | lnr12 line 1964, Theorem 5.9, pp.902–903; line 2002, Definition 5.10 through Proposition 5.12, pp.903–905 | Bounded-below finite type; graded Steenrod-module comparison and augmentation. The roadmap explicitly supplies the adaptation from the source's geometric map to the imported lax monoidal Δ, using its unit and exactness, not a Segal equivalence. |
| 3.1 | ns18 line 3331, Lemma III.1.8 and proof, p.289 | Finite sets and finite limit; eventual injectivity and stable images, without surjectivity of the original tower. Empty cases are handled separately. |
| 3.4 | ns18 line 3271, Theorem III.1.7 and proof, pp.288–292 | Every bounded-below spectrum, all primes, no finite-type/cardinality restriction. The arbitrary-vector-space step and completion target are retained. |
| 4.1 | ns18 line 4868, Lemma IV.1.3, Corollaries IV.1.4–IV.1.5 and Remark IV.1.6, pp.325–326 | Normalizer quotient W, lax monoidal uniqueness and suspension-spectrum factorization; no replacement by Σ_p-Tate. |
| 4.7 | ns18 line 4843, Example IV.1.2(i)–(ii), pp.324–325 | HA gives a↦a^p modulo p. The source's compactness terminology is repaired by the finite/dualizable p-complete class, with an explicit exactness argument and negative control. |
| 4.8 | ns18 line 4858, Example IV.1.2(ii), p.325 | Marked étale spherical lift of a finite field and its Witt Frobenius. The finite-field algebra input is the declared RefinedTraceMethods contract; d=1 is the sphere case. |
| 5.3 | ns18 line 5189, equation (12), pp.333–334; line 5256, Lemma IV.1.19, pp.336–338; line 5338, Lemma IV.1.20, pp.338–339 | Integer n, actual permutation twist, arbitrary space and E∞ ring, set-valued power operation. Negative ranks use tensor inverses. |
| 7.3 | ns18 line 4990, Proposition IV.1.12 and proof, pp.329–330; line 5061, Remarks IV.1.13–IV.1.14, p.331 | Finite CW retracts for the bundle comparison; localized stable ψ^p, with β↦pβ and the required inverse on β⁻¹. |
| 7.4 | ns18 line 648, Example I.2.3(iii), pp.219–220; line 2214, Lemma II.4.1 and its norm-comparison proof, pp.260–261 | Trivial C_(p²)-action on KU, coherent residual quotient action; different rational coefficient dimensions obstruct orbit vanishing. Only the implication from orbit vanishing in the norm argument is used for unbounded KU. |
| 7.5 | ns18 line 3283, paragraph following Theorem III.1.7, p.288 | Tensor permutation action on KU⊗KU; its rational Tate target cannot be KU's 2-completion. The stronger raw Tate locality input is resolved below. |
| 8.2 | ns18 line 5996, proof of Theorem IV.3.7, p.355 | Increasing comparison-fiber connectivity justifies commuting orbits with this tower limit; fixed points commute with limits, and exactness gives Tate. Not an unrestricted commutation theorem. |
| 8.3 | ns18 line 5978, Theorem IV.3.7 and proof, pp.354–355; line 2357, Corollary II.4.9, p.265 | Simply connected Y, no finite type; cyclotomic rather than raw tensor Frobenius. Iterated geometric fixed points retain boundedness through the cyclotomic equivalence. |

For §8.1's input to the last two rows, kuhn04 line 596 (Theorem 6.2) and line 625 (Theorem 6.6), preprint pp.15–16, give the finite comparison; malkiewich17 line 609 (Proposition 2.22 and proof), preprint pp.14–15, supplies the arbitrary simply connected extension and the increasing normalized fibers. For §§6.2–6.3, bmms86 line 4481 (VIII.2, Proposition 2.4(vi), scan p.134) and line 4501 (scan p.135) fix the Euler factors χ and ω. For §2.4, agm85 line 214 (§2, p.439) and line 290 (proof of Lemma 2.2, p.441) supply the finite-Hopf-algebra route. The 2019 correction, ns19-correction line 18 and its correction list, does not repair the coefficient/compactness issues recorded at the end of this report.

**Computed adversarial pass.** Here S is the sphere spectrum; HF_p and HZ are Eilenberg–MacLane spectra. A “pass” records agreement on the stated instance and rejection of the indicated wrong model, not a claim to have formalized the theorem. The change column records proposed repairs; this review edits no roadmap files. The tests found no false mathematical statement. R01 concerns duplicate ownership of a supplier obligation.

| Statement | Instances tried | Values computed on the two sides / negative control | Result | Change |
|---|---|---|---|---|
| 1.1 Cyclic coefficients and Weyl weights | C₂, C₃, p=5 and a=2; integral coefficients | At 2 the Laurent generator has degree −1. At 3, β(b/u)=1, e²=0, and t² has degree −4 and weight 1. At 5, t has weight 2 and b has weight 3. Integral odd Tate groups are 0, versus F_p for mod-p coefficients. | Pass | none |
| 1.2 Continuous homological Tate sequence | X=S, G=C₂; G=C₃ at p=2; p=5 dual weight; products | First case E²_(s,0)=F₂ for every s and all differentials vanish: Hc_n=F₂ for every n, whereas H_n(S₂^∧;F₂)=0 for n≠0. Prime-to-p and trivial groups give 0 on both Tate sides, versus H₀(C₃;F₂)=F₂. Weight duality is 2↦3; t·t⁻¹=1 and e·t⁻¹e=0. | Pass | none |
| 2.1 Continuous cohomology | Constant tower; zero transitions; sphere Singer tower | Identity colimit gives H*(B) on both sides; zero transitions give 0, although the direct sum of stage cohomologies is nonzero. Singer sphere has one F₂ in each integer degree, while ordinary cohomology of its completed limit is 0 in negative degrees. | Pass | none |
| 2.2 Inverse-limit Adams | Zero tower; constant HF_p; U_n(S) at 2 | Zero gives E₂=0 and abutment 0. H*(HF_p)=A_p, so Ext is F_p at (0,0) and 0 elsewhere, matching π*HF_p. Sphere tower bottom degrees 1,0,−1 for n=0,1,2 rule out a common lower bound. | Pass | none |
| 2.3 Singer action and augmentation | M=0,F₂,F₃; r=−1; s=0,1 | R_+(0)=0. ε(Σx⁻¹)=1 and ε(Σxy⁻¹)=1, both degree 0. At 2, binom(−1,1)=−1=1 and Sq¹x⁻¹=1, not 0. At odd p, β(xy⁻¹)=1 and β(y^r)=0; P⁰ and Sq⁰ act identically. | Pass | none |
| 2.4 Singer Tor-equivalence | M=0; M=F_p with N=F_p; augmentation summand | Tor and Ext of the zero input are 0 on both sides. Degree-(0,0) Hom into F_p is F_p on both sides and ε evaluates the distinguished degree-zero generator to 1; the zero augmentation would induce 0 instead of 1. The general result uses the finite-Hopf route, not this scalar test alone. | Pass | none |
| 2.5 Extended-power approximation | B=0,S,ΣS; p=2; n=0,1,2 | Zero gives 0. Bottom U_n(S)=1−n gives 1,0,−1; the Greenlees stage index 1−(p−1)n agrees. U₀(ΣS) has bottom 3 while ΣU₀(S) has bottom 2; the suspension reindexing starts with n≥1, where both bottoms are 3−n. | Pass | none |
| 2.6 Topological Singer comparison | B=0,S,HF_p; p=2,3 | Zero maps to zero. At 2, Σx⁻¹ has degree 0 and maps to 1; at 3, Σxy⁻¹ also has degree 0 and maps to 1. An unshifted generator has degree −1, and −Δ at 3 sends the unit to 2 rather than 1. This checks the actual map, not only the carriers. | Pass | none |
| 2.7 Finite-type Segal | S, HF_p, HQ | Completed sphere and tensor-Tate target have π₀=Z_p, with unit 1. HF_p has π₀=F_p and no other homotopy on both sides. HQ completes to 0 and its rational finite-group Tate target is 0. | Pass | none |
| 3.1 Finite towers | Constant ∅ and two-point set; {a,b}←{a}←⋯; binary prefixes; constant S₃ | Limit and stable-image sizes are respectively 0,2,1. For binary prefixes the limit has size 2^ℵ₀, and 0^∞ and 0ⁿ10^∞ have equal stage-n values: injectivity fails. Constant S₃ has six elements and all maps identity; noncommutativity does not affect the pro-group assertion. | Pass | none |
| 3.2 Truncated tensor Tate | HF_p at n<0; HF_p⊕HF_p; zero | The negative truncation is 0. In the two-summand tensor expansion the two constant words survive; all mixed cyclic orbits are free and contribute 0 Tate. Thus additivity retains two diagonal contributions, not 2^p independent ones. Zero gives 0. | Pass | none |
| 3.3 Arbitrary-dimensional HF_p | V=0,F_p,F_p²,⊕_κF_p | π₀ of both completed input and tensor-Tate target is respectively 0,F_p,F_p²,⊕_κF_p, with identity comparison; other homotopy groups are 0. For infinite κ the finite-support vector (1,1,…) is absent, excluding replacement by the product. Uniform stabilization is independent of κ. | Pass | none |
| 3.4 Bounded-below Segal | S, Σ⁻¹HF_p, H(⊕_κF_p); excluded KU at 2 | π₀S_p^∧=Z_p on both sides. Σ⁻¹HF_p has π₋₁=F_p and other groups 0 on both sides. The arbitrary sum retains its degree-zero direct sum. KU₂^∧/2 has F₂ in every even degree, whereas T₂(KU)/2=0: boundedness is essential. | Pass | none |
| 4.1 Weyl refinement | p=2,3; S; S[N] | W has orders 1,2 respectively; at 3 averaging uses 2⁻¹=2. The unit remains 1. On the monoid generator z the group-ring construction sends z to z^p, agreeing with the p-fold space diagonal followed by multiplication, not z↦1. | Pass | none |
| 4.2 Underlying-space factorization | X=HZ, p=2, element 2; X=0 | The lift of 2 is 2 times the unit plus transfer(1): restriction is 2+2=4 and Tate image is 2 in Z₂. A lift 2·unit restricts to 2, while 4·unit has Tate image 4. The zero spectrum has contractible underlying space and unique map. | Pass | none |
| 4.3 Norm splitting | X=0,HF₂; degree 0 versus positive degree | Zero gives 0=0⊕0. For HF₂, kernel and quotient on π₀ are F₂, but the middle group is Z/4: twice the chosen lift of 1 is transfer(1)≠0. Its exponent 4 differs from exponent 2 of F₂⊕F₂. The theorem promises only a set section here. | Pass | none |
| 4.4 Degree-zero powers | KU at p=2, class 2; HZ; F₄ | P₂(2)=3·1+sign has rank 4 and transposition character 2, versus character 4 for the constant class 4. For HZ, P₂(1+1)=4 differs from P₂(1)+P₂(1)=2. In F₄, a²=a+1 for a²+a+1=0. | Pass | none |
| 4.5 Transfer ideal | HZ at p=5; HF_p; zero ring | Proper Young-subgroup indices 5,10,10,5 generate (5), not (120); 30 is nonzero mod 120 but zero mod 5. For HF_p their images are 0, and the quotient remains F_p. The zero ring quotient is 0. | Pass | none |
| 4.6 Degree-zero Frobenius | HZ at 2 and 3; F₃[z]; zero | Both routes send 2 to 4 mod 2=0, and to 8 mod 3=2. On F₃[z], z maps to z³, not z. On the zero ring both maps are the unique 0→0. | Pass | none |
| 4.7 Ordinary and finite p-complete examples | Z,Q,zero ring,F₄,S_p^∧; p-inversion diagram | The first three degree-zero maps have values 2↦2 mod 3, Q→0, and 0→0. F₄ sends a↦a+1≠a. Sphere const/can and φ send 1↦1. Completed colimit of the p-inversion diagram is 0, while colimit π₀Map(S_p^∧,S_p^∧) is Q_p≠0, excluding categorical compactness. | Pass | none |
| 4.8 Finite-field spherical Witt | d=1; F₄/F₂, d=2; marked versus unmarked lift | d=1 gives S_p^∧, rank 1, and identity. F₄ gives rank 2, [a]↦[a²]=[a+1], and the second iterate fixes [a]. Identity and Frobenius are distinct unmarked automorphisms; only identity preserves the fixed π₀ marking. | Mathematics passes; ownership R01 | Import the existing rank statement |
| 5.1 Virtual twists | V=0, rank −1, Möbius line; ρ₂,2ρ₂ | Zero twist gives R⁰(X) on both descriptions. At a point rank −1 gives π₁R, not π₋₁R. Möbius cochains have differential 1−(−1)=2 and H¹=Z/2; the trivial line has differential 0 and H¹=Z. Swap degrees are −1 and +1. | Pass | none |
| 5.2 Thom adjunction | n=0,−1; p=2; R=ΣHZ,Σ²HZ | At n=0 both sides are ordinary Borel R-cohomology. Restriction of −ρ has rank −2: for ΣHZ both sides give π₂=0 versus the erroneous rank−1 value Z; for Σ²HZ both give π₂=Z versus erroneous value 0. | Pass | none |
| 5.3 All-degree Rezk power | p=2; n=1 with u; n=−2 with Bott; n=0 with 2 | Positive-degree power is ub+u², restricting to u², so it is neither 0 nor merely u² before restriction. Negative-degree Bott power restricts to β²∈π₄KU, a unit. Degree zero gives 3+sign and character 2. At n=−1 the twist ranks −p and +p sum to 0. | Pass | none |
| 5.4 Representation-suspension Tate | p=2,n=1,R=HZ; n=−1; reflection | With permutation action, (S^ρ⊗HZ)^tC₂ has F₂ in odd degrees and 0 in even degrees, agreeing with Σ(HZ^tC₂); replacing ρ by trivial rank 2 gives the opposite parity. On sphere Tate the reflected factor is compatible with the identity after the comparison, whereas the nonequivariant top sphere has degree −1. Inverse twists have total rank 0. | Pass | none |
| 5.5 Extended-power/Thom comparison | D_p(S), D_p(0); n=1,−1 at 2 | D_p(S)=Σ∞_+BΣ_p has π₀=Z, whereas D_p(0)=0. For n=1 the negative Thom twist is −ρ, rank −2 with sign monodromy; for n=−1 it is +ρ, rank 2. Forgetting the sign changes the twisted integral cohomology test Z/2 to Z. | Pass | none |
| 5.6 All-degree Frobenius comparison | n=0,1,−1; p=2 | n=0 sends 2 in HZ to 0. For degree-one u both routes give u+u²s, total degree 1 because 2−1=1. At n=−1 both routes retain −ρ, which cancels +ρ to rank 0; a forced positive suspension would instead have rank 2p. | Pass | none |
| 6.1 Tate decompositions | p=2,3; HZ versus HF_p; sum/product | At 3 the invariant even/odd components are in suspensions 4,5 for i=1, not 2,3. HZ Tate has π₁=0 and π₀=F₂; HF₂ Tate has π₁=F₂. At each degree only one displayed summand contributes, so sum and product give the same π_i. Integral maps between distinct even summands have Ext^(2k−2j)=0; the same summand has Hom=F_p. | Pass | none |
| 6.2 Ordinary Steenrod components | p=2,u; p=3,v; x,z of degree 1; p=5,7 Euler scalar | At 2: u(u+b)/b=u+u²s. At 3: v(v+u)(v+2u)=v³−vu²; dividing by −u² yields v−v³t². For x,z: (x−ye)(z−we)=xz+(yz−xw)e, agreeing with β(xz)=yz−xw and the degree sign; unsigned coefficients give the opposite odd term. For p=5, (2!)²=4=−1; for p=7, (3!)²=1, as required by (m!)²=(−1)^(m+1). | Pass | none |
| 6.3 Stable total Steenrod map | Unit, u, x; left suspension; integral reduction | Unit component is 1, higher components 0. On u at 2, Sq¹u=u²≠0 despite π₁HF₂=0. At 3 the odd component sends degree-one x to −βx; after left suspension, β(ι×x)=−ι×βx, so degree-two sign gives −ι×βx on both routes. Integral degree-zero component is reduction 1↦1. | Pass | none |
| 7.1 Atiyah cyclic power | p=2, virtual classes 2,−1; line L | For 2: rank 4, transposition trace 2. For −1 the Koszul symmetry gives sign, trace −1 and rank 1, rather than the trace +1 of a trivial square. On a line the trace is L^p, matching ψ^p(L). | Pass | none |
| 7.2 KU Tate coefficients | r=1,2; p=2,3; x=0 | Rational dimensions are p−1 and p²−1: 1,3 at 2 and 2,8 at 3. At r=1 the field is Q_p(ζ_p), with W-invariants Q_p. (1+x)^p−1 at x=0 is 0; (x−1)^p−1 at odd p gives −2, excluding the wrong coordinate. | Pass | none |
| 7.3 KU Frobenius/Adams | β,β⁻¹; S² line class; p=2,3 | Both maps send β↦pβ and β⁻¹↦β⁻¹/p; their product is 1. On S², β²=0 and (1+β)^p=1+pβ, giving 1+2β and 1+3β. An integral periodic endomorphism with this Bott value cannot send β⁻¹ to an integral inverse. | Pass | none |
| 7.4 Unbounded orbit obstruction | Trivial C_(p²)-action on KU; p=2,3; periodic HQ[β±¹] | In each even degree source/target rational dimensions are 3/1 at 2 and 8/2 at 3; odd groups are 0/0. The comparison is therefore not an equivalence. For the periodic rational spectrum HQ[β±¹], finite-group norms are invertible and both Tate terms are 0, so unboundedness alone is not a sufficient nonvanishing criterion. | Pass | none |
| 7.5 Unbounded Segal obstruction | KU and its swap tensor, p=2; sphere control | Raw height-one Tate is rational, hence the swap-tensor target has mod-2 cofiber 0. KU₂^∧/2 has π₀=π₋₂=F₂. In contrast sphere Tate has π₀=Z₂ and mod-2 π₀=F₂, so the rational conclusion cannot be applied to the sphere. | Pass | none |
| 8.1 Free-loop totalization | Y=*,S²,∨_κS²; excluded S¹ | Point gives S on both sides. For S², normalized bottom degrees are (n,n+2), hence (1,3),(2,4) for n=1,2, independent of κ for the wedge. For S¹ the first bottom degree is n−n=0 for every n, so the required growth fails. | Pass | none |
| 8.2 Controlled Tate/limit comparison | Constant tower; comparison fibers ΣⁿHF_p; trivial G | Constant fibers are 0 and all comparisons identity. For ΣⁿHF_p, orbit fibers have no π_i for i<n, in particular π₀=0 for n≥1, giving the needed degreewise stabilization. For G=1 the norm is identity and both Tate objects are 0. | Pass | none |
| 8.3 Free-loop Segal | Y=*,S²,∨_κS²; n=0,1,2 | Point Frobenius has π₀ target Z_p. Genuine C_p-fixed sphere has π₀=Z²; homotopy fixed sphere has π₀=Z⊕Z_p, and both complete to Z_p². S² and its arbitrary wedge retain bottom bounds (n,n+2). n=0 comparison is identity; n=1 and 2 use respectively one and two restriction pullbacks. | Pass | none |

The following additional computations check standing conventions and supplier interfaces used in multiple layers.

| Convention/interface | Instances tried | Values computed on each side / wrong model | Result | Change |
|---|---|---|---|---|
| Extended powers and tensor symmetry | k=1,3; G=S₃; E=S,0; suspension once/twice | D₁(E)=E; D_(S₃)(S)=Σ∞_+BS₃ has π₀=Z; D_(S₃)(0)=0. Swap has degrees −1,+1 on the once/twice suspended factors. k=0 would give the sphere even for zero input, explaining k≥1. | Pass | none |
| Finite Steenrod chain | p=2,3; n=−1,0,1 | Quotient dimensions are 1,2,8 at 2 and 1,2,12 at 3. E(Q₀,Q₁) has dimension 4, so it cannot replace A₃(1). ξ₁⁴=ξ₂²=0 at A₂(1); odd-p A_p(1) has two exterior factors and a polynomial factor of dimension p. | Pass | none |
| Steenrod action and signs | Sq¹,Sq²; P¹ at 3; two odd classes | Sq¹Sq¹=0, Sq¹Sq²=Sq³, and P¹P¹=2P² at 3. Sq¹u=u² while Sq²u=0. P¹v=v³ has degree 6; β(xz)=yz−xw. Composition and Koszul signs agree with Layers 2 and 6. | Pass | none |
| Finite norm versus circle norm | G=1,C₂; HZ; induced object | Identity norm gives Tate 0. For C₂ on HZ the degree-zero norm is 2 and cokernel Z/2; no extra suspension occurs. An induced finite-group object has Tate 0. | Pass | none |
| Marked Witt and Frobenius | ZMod p; F₄; rank d | W(F_p)=Z_p with identity Frobenius; F₄'s a maps to a+1 and its second iterate is a. Rank d=1,2 agrees with the corresponding free spherical modules and with PadicHodgeRegulators' existing formula. The Witt coefficientwise formula is used only in characteristic p. | Mathematics passes; ownership R01 | Narrow the gap |
| Completion, rationality and shifts | HQ,HF_p,Σ⁻¹HF_p | Completion gives 0,HF_p,Σ⁻¹HF_p respectively. Rational HQ is nonzero despite zero mod-p reduction. A negative lower bound is allowed: π₋₁Σ⁻¹HF_p=F_p. | Pass | none |
| Layer 7 sphere fixpoint example | Trivial C_(p²)-sphere; p=2,3; zero | Residual Tate of S^(hC_p) has π₀=Z₂,Z₃ and mod-p quotient F₂,F₃, not 0. Zero input gives 0. The bounded-above hypothesis of the fixpoint lemma and bounded-below hypothesis of the orbit lemma are distinct. | Pass | none |

**Pinned library audit.** The manifest pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Object searches covered spectra, Tate/norm constructions, Steenrod operations, Singer constructions, Bott/KU, compatible sections and Witt Frobenius. These concrete declarations were opened at those pins:

| Pinned file and line | Declaration / content consumed | Boundary checked |
|---|---|---|
| Mathlib/CategoryTheory/Types/Basic.lean:222 | `CategoryTheory.Functor.sections` | Compatible dependent choices; neither nonemptiness nor finiteness is built in. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:79 | `nonempty_sections_of_finite_cofiltered_system` | Nonempty finite stages and cofilteredness are needed. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:125 | `CategoryTheory.Functor.eventualRange` | Intersection of transition images, not the whole stage. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:230 | `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range` | Supplies stabilization of images. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:255 | `CategoryTheory.Functor.toEventualRangesSectionsEquiv` | Replacement preserves sections. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:262 | `CategoryTheory.Functor.surjective_toEventualRanges` | Uses the Mittag–Leffler condition. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:312 | `CategoryTheory.Functor.eval_section_surjective_of_surjective` | Finite nonempty stages and surjective transitions. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:323 | `CategoryTheory.Functor.eventually_injective` | Finite sections of a surjective finite system; §3.1 applies it after replacement and handles the empty case. |
| Mathlib/Algebra/CharP/Lemmas.lean:321 | `frobenius` | CommSemiring and exponential characteristic. |
| Mathlib/RingTheory/WittVector/Defs.lean:52 | `WittVector` | The native carrier contains a coefficient sequence; it is not a spherical Witt spectrum. Re-exported through Basic.lean. |
| Mathlib/RingTheory/WittVector/Frobenius.lean:218 | `WittVector.frobenius` | Ring map on ordinary Witt vectors. |
| Mathlib/RingTheory/WittVector/Frobenius.lean:255 | `WittVector.coeff_frobenius_charP` | The extra CharP hypothesis is present. |
| Mathlib/RingTheory/WittVector/Frobenius.lean:275 | `WittVector.frobenius_zmodp` | Identity for the prime field, not for all finite fields. |
| Mathlib/RingTheory/WittVector/Compare.lean:199 | `WittVector.equiv` | W(ZMod p)≃Z_p, not W(k)≃Z_p for general k. |
| TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59 | `IsAspherical` | A predicate on based topological spaces, not Eilenberg–MacLane spectra. |
| TauCeti/AlgebraicTopology/Cohomology/Basic.lean:60 and :129 | `singularCochainComplex`, `singularCohomologyFunctor` | Ordinary space cohomology; these do not supply coherent spectral actions or stable Steenrod maps. |
| TauCeti/LinearAlgebra/CliffordAlgebra/BottPeriodicity.lean:393 | `realCliffordBottEquiv` | Clifford-algebra tensor equivalence, not the KU spectrum or its Tate construction. |

Thus §3.1 correctly cites the existing inverse-system machinery rather than redefining it, and §4.8 cites the native Witt formulas while keeping the spectral lift separate. No declaration in Suggested.lean can collide with a sibling declaration, since it declares none.

**Cross-roadmap ownership and supplier resolution.** Used the roadmap search/show tools, searched main, the supplied open heads and board packages by object, then read the relevant passages. Existing-roadmap revisions were not treated as dependencies in place of main. The automated citation resolver found no unresolved roadmap citation; external Lean names were independently checked in the local pins above. The following gives the resolved boundaries (all paths are repository-relative; line references for open-head snapshots exclude the tool's header).

| Owner and location | Contract resolved / ownership conclusion |
|---|---|
| TauCetiRoadmap/StableHomotopyKTheory/README.md:1925, :2133, :2455, :2523, :2567, :2680 | Layer 5 supplies spectral comparisons and HR; §7.9 supplies Milnor; §§7.14–7.18 supply complete spectra and detection; §7.19 rational spectra; §§7.21–7.26 exact couples and convergence. Part II adds Singer/completion comparisons, not a second spectrum foundation. |
| TauCetiRoadmap/GeneralizedCohomology/README.md:432, :785, :878, :1214, :1536, :1559 | G2.8 extended powers, G3.8 limits, G3.9 derived completion, G4.2/G5.3 Thom constructions and G5.4 structured examples including KU. The virtual inverse-twist and power comparisons in Layer 5 are additions, not repeated ordinary Thom constructions. The marked Bott comparison also appears at line 2177. |
| TauCetiRoadmap/TangentialBordism/README.md:726, :775, :859, :1504 | B4 items 1,2,7 give operations, stable-operation algebra, normalization and Adams machinery. Item 8's exterior-Milnor-primitive freeness is distinct from the declared exhaustive finite A_p(n) chain. |
| TauCetiRoadmap/BordismFormalGroups/README.md:293, :555, :760, :1004, :1248, :1526, :2490 | F3 gives ku_(2)/BP⟨1⟩ and v₁ localization; F6.1 localization; F6.3 finite Hopf/Margolis tools; F6.4 smashing; F6.5 norms, coherent actions and raw finite-height Tate descent. The E(0)-local conclusion at height one is the rationality needed by §7.5. |
| TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:638, :700, :739 | §§4.0,4.4,4.5 give genuine models, comparison infrastructure and the homotopy Tate spectral sequence with cup products and conditional convergence. Continuous mod-p homology with strong finite-type convergence is the distinct target here. Its odd cyclic boundary convention is not silently substituted for the Bockstein normalization βe=1. |
| TauCetiRoadmap/AInfCohomology/README.md:3819, :3848 | AI.7.2 gives the finite norm/Tate transport, bounded-below orbit lemma, and the unit-normalized exact spectral diagonal. Its sphere Check specifies the map; it does not import the completion theorem needed here. |
| TauCetiRoadmap/RefinedTraceMethods/README.md:484, :557, :587, :607, :646, :804, :879, :919, :999, :1043, :1227 | §§2.1,2.3–2.6,2.8,2.10–2.13,2.16 give coherent actions, boundedness, parametrization, subdivision, THH, unrefined Frobenius, free-loop model, genuine spectra and restriction pullbacks. The free-loop Segal theorem is not supplied there. |
| TauCetiRoadmap/RefinedTraceMethods/README.md:2411, :2489, :2517 | §5.1 stable localized ψ, §5.3 orientation, §6.1 spectral étale lifting. The finite-field algebraic Witt contract is expressly declared, not inferred from generic spectral étaleness. |
| TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1117, :1436 | E3 Kan extensions and E5:abstract monoidal/operadic objects, including their named foundational suppliers. The proposed Thom adjunction retains coherent actions. |
| TauCetiRoadmap/AlgebraicTopology/README.md:946 | Stage 6 ordinary cohomology, coefficient and cup comparisons. Does not already provide the spectral Singer comparison. |
| TauCetiRoadmap/TopologicalKTheory/README.md:702, :816, :886 | T2.5 Adams operations, T4 Bott and T5 splitting/Thom comparisons on main; scope and Bott sign agree. No appeal to an open revision for these inputs. |
| TauCetiRoadmap/ChromaticHomotopyTheory/README.md:355 | §4.1 constructs the raw Tate calculation for completed KU_p^∧, explicitly separating it from uncompleted KU and consuming this roadmap's sphere Segal theorem. §7.2 here owns the uncompleted r=1,2 calculation; there is no upward import of the completed variant. |
| TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:146 | Its broader relative/formally étale lifts over perfect p-complete δ-rings go beyond the finite-field ordinary étale lift here. This roadmap owns the finite-field marked case and its Tate Frobenius comparison; it does not construct that broader lift. |
| TauCetiRoadmap/PadicHodgeRegulators/README.md:344, :346, :351 | The finite unramified étale Q_p-algebra supplier section already identifies W(k), gives its rank and identifies rational Frobenius. This is the existing input missed by the Witt gap; see R01. |
| TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:1659 | §6.1a realizes perfect algebras relative to Morava E-theory and proves a cover theorem. This is not the connective finite-field spherical lift over S_p^∧. |

Both declared gaps have precise hypotheses and named earlier owners. The Witt gap must be narrowed as in R01: its rank input is already supplied, while the integral reduction-determined endomorphism comparison is not stated in the rational supplier API. The prime-field Witt equivalence is already separately cited from Mathlib. The Hopf-chain gap supplies the exhaustive A_p(n) chain and freeness used by Singer, which the existing E(Q_i)/T_t statements do not supply. Their needs sentences occur in `packages/StableHomotopyKTheoryPartII/design/plan.json` and the matching supplier subsections at README lines 85 and 110. The README uses descriptive contract labels rather than repeating the literal `gap:` slugs; the review brief explicitly declares both contracts, so their declared status in this review does not depend on inferring a new gap. Neither declared missing comparison is treated as already proved. R01 requires repointing the existing rank input, not moving a construction or changing the merge order.

**Headline and form audit.** These are the 14 headline groups identified from the README, all named in Suggested.lean's module docstring:

| Headline | README target(s) | Missing pinned carrier/interface stated in docstring |
|---|---|---|
| Singer Tor-equivalence | 2.4 | Stable Steenrod algebra, its graded modules and Singer functor |
| Inverse-limit Adams theorem | 2.2 | Spectra, Adams tower and continuous Ext comparison |
| Topological Singer/augmentation comparison | 2.6 | Spectral extended powers, continuous cohomology and Singer module |
| Finite-type Segal theorem | 2.7 | Coherent tensor actions, spectral Tate and completion |
| Arbitrary-cardinality bounded-below Segal theorem | 3.4 | Same carriers plus spectral boundedness/completion predicates |
| Unique Weyl refinement | 4.1 | Coherent spectral actions and lax monoidal Tate diagonal |
| All-integer-degree power/Frobenius comparison | 5.6 | E∞ spectra, represented virtual twists and power maps |
| Finite-field spherical Witt Frobenius | 4.8 | Spectral étale sphere algebra and Tate comparison |
| Total Steenrod Frobenius | 6.3 | Spectral HZ/HF_p, Tate and stable operations |
| KU Frobenius equals stable Adams | 7.3 | KU, spectral Tate and localized stable Adams maps |
| Unbounded KU counterexamples | 7.4–7.5 | KU, residual actions, Tate and Bousfield localization |
| Simply connected free-loop totalization | 8.1 | Spectral totalization and connectivity |
| Controlled Tate/limit commutation | 8.2 | Coherent finite actions, spectral norms and connectivity |
| Free-loop Segal and genuine comparisons | 8.3 | Cyclotomic THH, genuine spectra and p-completion |

None is made statable merely by the native ordinary Witt vectors, singular cochains, algebraic Tate cohomology or Clifford Bott equivalences. Encoding them by arbitrary predicates or a new heavy spectral carrier would be a stand-in. The short Lean file is consequently appropriate. The finite-set pro-constancy argument is a supporting result, not a substitute headline; its Mathlib ingredients are explicitly deferred to the pin. The README has the required summary, ownership, conventions, supplier contracts, layer dependencies, examples and references. Definitions retain mathematical APIs and at least three discriminating Checks, including negative controls for the principal wrong models.

## Not verifiable

No sampled target or required flagged locator was left uncertified, and no additional source request was needed. All eleven referenced works have supplied legal cached texts. The source audit was the requested seeded sample plus the proof-route checks identified above, not a certification of every page of the background Cartan exposés or every theorem in a supplier roadmap. Their cached formula extraction is imperfect; no uncertain OCR symbol was used to manufacture a finding.

The two declared supplier gaps remain conditional obligations, as allowed by the brief. The mathematical headline theorems have no pinned spectral statements to elaborate; the successful Lean check establishes file form and imports only. Their review evidence is the source comparison, supplier resolution and explicit computations above.

## Source issues

- **Misprint** in ns18 at the decompositions preceding Theorem IV.1.15 and that theorem, printed pp.332–333 (ns18 line 5120, line 5126 and line 5136): the source says odd-prime shifts are i(p−1) and i(p−1)+1; it should be 2i(p−1) and 2i(p−1)+1; affects a stated result.
- **Error** in ns18 at Example IV.1.2(ii), printed p.325 (ns18 line 4852): the source says the p-complete sphere exemplifies categorical compactness among p-complete spectra; it should be treated as finite/dualizable p-complete, since its p-inversion diagram violates compactness; affects a stated result.
- **Error** in ns18 at Proposition IV.1.16 and the associated monomial interpretation of Theorem IV.1.15, printed pp.332–333 (ns18 line 5132 and line 5155): the source says odd-prime Frobenius has unsigned reduced-power and Bockstein coefficients; it should be (−1)^iP^i and right coefficient (−1)^(n+i)βP^i in the stated monomial/Koszul normalization; affects a stated result.
