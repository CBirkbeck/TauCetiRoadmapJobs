# Review of ClassicalAdicEtaleCohomologyPartII (pull request #1549 at 82e0068)

**Verdict:** needs changes

## R01 (P1) — Resolve the undeclared AdicSpacesPartV inputs

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md:72`, also lines 11, 80–86, 1156, 1172, 1188, 1208 and 1226. The contract says “Sections 5.3–5.4 supply” rigid resolution, alongside numbered contracts for Zariski geometry, normalization, smooth loci and weakly Shilov points.

**Claim:** These are available supplier sections. They are necessary, for example, to resolve the matching objects in §7.5 and to construct the strata in §7.1.

**Witness:** `roadmaps show AdicSpacesPartV` finds no roadmap on main or an open head. `packages/AdicSpacesPartV/design/README.md:13` instead lists RZ.0–RZ.6. The two declared PartV gaps cover branched covers and generic smoothness, not these inputs.

The design identifies an intended owner; it does not supply the numbered README contracts being cited. The main-tree lookup and the indexed-head lookup agree. This is the brief's missing-supplier-contract defect, not an objection to consuming an unfinished theorem or to PartV's position in the merge order.

**Repair:** Replace these nonexistent section citations with verifiable supplier targets. For inputs available only in the PartV design, declare precise contracts under `Exact supplier contracts` and matching slugs in this package's `design/plan.json`, naming the actual RZ target destinations. Keep ownership with PartV; do not rebuild its geometry here. Alternatively cite an eligible existing owner that states the same generality. In particular the resolution contract must cover reduced rigid spaces over every complete characteristic-zero field and arbitrary rigid spaces via their reduction, not just proper spaces over C.

**Repair test:** Trace §7.5 on a proper split nodal curve: the normalization is smooth, the node has two preimages, and the comparison retains ranks (1,1,1) in degrees (0,1,2). The repaired contract must also resolve each possibly nonreduced matching object; the reduction of `K⟨ε⟩/(ε²)` is K and its smooth proper surjection is the point. Explicitly declaring that contract supplies both instances without assuming smoothness of the original object. No worktree edit was made.

## R02 (P3) — Remove stale parent declaration names

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md:136` and line 1073: `AdicSpace.henselianComparison_bijective_of_spec`, `ordinary_etale_cohomological_dimension`, and `IntegralSmoothProperTrace`.

**Claim:** These are names of signatures supplied by ClassicalAdicEtaleCohomology.

**Witness:** None of the three names occurs in the parent's README or Suggested.lean returned by the roadmap service. Its §§2.5, 11.2 and 9.7 do state the corresponding mathematics in prose; the first name is also absent at both library pins.

**Repair:** Delete the signature/name parentheticals and retain the actual section citations, including the prose target `sheaf-comparison-3-2-9` at §2.5. This is a locator correction, not an unowned mathematical prerequisite. Resolving the corrected references reaches the absolute affinoid comparison, the ordinary 2d bound, and the smooth-formal integral trace respectively. The split degree-p trace remains summation, with values p on the all-ones vector and 1 on a coordinate vector.

## Verified sound

The review covered all 54 numbered target subsections, their API clauses and Checks, all 54 `Needs` lines, the supplier contracts, the 13 declared gap slugs, and all five Lean declarations. The 15 seeded source targets are recorded below. The calculations are tests of the statements and conventions, not a claim to have formalized their proofs. R01 is the blocking finding; R02 is a locator note. The stated theorem scope is repairable, so rejection of the roadmap's scope is not warranted.

The worker's gate at this head passes every scanner and the targeted module build. The outside-folder diff is empty. There is no sorry'd data, `set_option`, algorithmic route, extra roadmap file, copied source passage detected in the inspected statements, or alternate fully qualified declaration name claimed by another inspected roadmap. The Part II boundary extends the parent's trace and prime-to-residue duality; it does not restart the parent.

Independent dependency-check output:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This graph result does not certify that a cited supplier section exists, which is why R01 survives a passing gate.

Direct `lake env lean` elaboration of `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/Suggested.lean` succeeded with only the expected `sorry` warning. A scratch copy with `#check @name` for each of the five declarations also elaborated. All parameters p,n,m and the prime instance occur where needed; no section binder was lost. The theorem uses actual multiplication in the underlying quotient ring, Frobenius restriction of scalars, and native Ext. Its existential trace is fixed on every monomial and its adjoint on every pair of elements, excluding the zero map or an unmarked rescaling.

The one admitted theorem was probed on a scratch copy with the one-tactic alternatives `simp`, `rfl` and `infer_instance`; they did not close it. The object search found no single pinned lemma giving this trace-normalized Frobenius-module Ext duality. The real-bodied definitions are used by that theorem, and there are no admitted examples or boundary-case theorems to remove as padding.

### Seeded source checks

All entries below were checked against the supplied legal extraction, including the printed page, theorem number, hypotheses and the relevant proof step. Numbering is that of Z arXiv v3, AC arXiv v3 and BH arXiv v2, as recorded in the source manifest. “Supported” allows the explicit corrections separately recorded under Source issues; it does not treat a printed typo as the intended theorem. No additional README locator is marked unverified. H is separately settled as uncertified.

| Target | Source text opened | Result and scope checked |
|---|---|---|
| 0.5 Generic fibres | Z Appendix C, Definitions C.1/C.3 and Lemmas C.4–C.9, pp.92–95; Z line 4360 through line 4501 | Supported: flat generic pullback, annihilation of almost-zero objects, coherent image and proper comparison. Smoothness is retained for the nearby-cycle identification. |
| 1.1 Formal dualizing complexes | Z Definition 2.4.1, Warning 2.4.2, Theorem 2.4.4, pp.19–20; Z line 805 through line 843 and the following proof | Supported over rank-one valuation rings with a pseudouniformizer. The roadmap distinguishes the bottom canonical sheaf from a uniquely chosen naive complex. |
| 1.5 Formal canonical traces | Z §2.6, pp.24–25; Z line 1060 through line 1119 | Supported for proper maps of the specified pure dimension; the bottom trace is underived, with sum rather than averaged finite trace. |
| 2.2 BMS maps | Z §§3.2.3–3.2.8, pp.31–33; Z line 1373 through line 1437 | Supported: the cotangent construction exists on admissible models; smoothness is needed for the later isomorphism, not for constructing the map. |
| 2.3 Smooth integral inverse | Z Lemmas 3.3.1–3.3.2, Theorem/Definition 3.3.4 and Definition 3.3.5, pp.33–37; Z line 1450 and line 1657 through line 1691 | Supported with the torsion quotient, image aⁿ and dual dlog factor. Degree zero is the separate unit normalization. |
| 2.7 Pseudo-finite maps | Z Definition 3.6.1 and Lemma 3.6.2, p.46; Z line 2168 through line 2177 | Both generic finiteness and the nearby-complex amplitude condition are retained. Finite maps and rig-isomorphisms meet the condition. |
| 3.5 Décalage/top map | Z Lemma 4.2.27, Corollaries 4.2.28–4.2.29 and Theorem 4.2.30, pp.57–59; Z line 2740 through line 2812 | Supported with the special no-almost-torsion criterion. It is not an assertion that arbitrary almost isomorphisms become honest under décalage. |
| 3.7 Root duality | Z Theorem 4.3.2 and Lemmas/Proposition 4.3.4–4.3.7, pp.59–61; Z line 2825 through line 2999 | Supported: characteristic-p hypersurface calculation, positive Ext vanishing, integral lifting and product argument. No finite-flat hypothesis over the singular base is inserted. |
| 3.8 Cochain trace | Z Definitions 4.3.9/4.3.13 and Remark 4.3.14, pp.62–63; Z line 3008 through line 3065 | Supported with trivial coefficient action for the scalar top trace and with an orientation. General top cohomology is the coinvariant quotient. |
| 4.7 Local duality | Z Theorems 4.4.1 and 4.4.24, pp.66–67,74–75; Z line 3188 through line 3216 and line 3587 through line 3604 | The roadmap uses nice models, keeping the reduced-residue hypothesis needed by its Faltings pairing and descent. The source's broader wording is not copied. |
| 5.4 Mod-p duality | Z Theorem 5.4.4, pp.79–80; Z line 3831 through line 3869 | Supported for smooth proper pure-d spaces in mixed characteristic, with continuous Galois action, twist d and trace normalization. |
| 5.6 Finite p-power duality | Z Theorem 5.5.2, pp.81–82; Z line 3920 through line 3963 | Supported after retaining the required −2d shift and reducing derivedly over Λₙ, as the roadmap does. |
| 5.9 Rational duality | Z Theorem 5.5.6, pp.82–83; Z line 3979 through line 3987 | Supported with pro-étale rational coefficients and the −2d derived trace. The finite-dimensional cohomology pairing is Galois equivariant. |
| 7.1 Zariski constructibility | BH Definition 3.1 and Warning 3.2, pp.14–15; BH line 594 through line 627 | Supported: locally finite Zariski stratification and boundedness locally on qcqs opens, not one global finite stratification or amplitude. |
| 7.4 Proper pushforward | BH Theorem 3.10 and proof, pp.17–18; BH line 764 through line 787 | Supported for every torsion exponent in characteristic zero. The roadmap provides a sheaf-level justification of finite totalization and distinguishes the residue-p and prime-to-residue descent inputs. R01 concerns the ownership of the resolution input, not this theorem's truth. |

### Adversarial calculations

In this table Λ means a nonzero allowed finite coefficient ring unless n=1 is explicitly tested; O=O_C and a=ζ_p−1. A row's “retained” result means the computed instance agrees, not that this finite list proves the general theorem. Entries in the two value columns give the actual competing objects or maps. Every numbered target, the sampled targets, all geometric headlines and both findings are covered.

| Statement | Instances tried | Construction / left-hand value | Claimed comparison / right-hand value | Result; change |
|---|---|---|---|---|
| Conventions: shifts, almostness, twists | ℙ¹; O/p; O/𝔪; two points at p=2 | Point trace 1 in H²(Λ(1)); ε·1≠0 in O/p for 0<v(ε)<v(p); trace(1,1)=0 | Λ[−2] has H²=Λ; (O/𝔪)ᵃ=0; sum=0 | Retain; +2 shift and degree averaging fail. |
| Conventions: orientation, ramification | Two coordinates; π²=p, p=2,3 | dT₂∧dT₁=−dT₁∧dT₂; π mod p≠0 and π²=0 | Swapped cochain orientation −1; π mod 𝔪=0 | Retain; integral sign and the two reductions remain distinct. |
| 0.1 Almost coherent category | Unit; residue field; infinite completed free sum | Unit has one generator; residue almostification 0; ε times infinitely many independent coordinates | Almost finite presentation holds for first two, fails for infinite sum | Retain; wrong category of all complete modules excluded. |
| 0.2 Affine/proper calculus | Formal point; formal ℙ¹ with O and O(−2); unbounded-negative G | Hom(O,O)=O[0]; H(O)=(O,0); H(O(−2))=(0,O); Hom(O,G)=G | Associated-sheaf groups identical; G∉D⁺ | Retain; reversed Hom bounds fail. |
| 0.3 Almost upper shriek | Identity over O/p², A=B=O/p; smooth curve; two points | Ext¹_R(A,B)=O/p; f!O=Ω¹[1]; counit(1,0)=1 | Same Ext¹ on target; H⁻¹=Ω¹; summation=1 | Retain; comparison belongs on the target. |
| 0.4 Nearby complexes | Point, one-torus, square-zero thickening | Point K=Oᵃ/p[0]; torus free quotient ranks (1,1); thickening power-bounded ring O⊕Cε, with p-divisible nilpotents | Mod-p nearby coefficient is O/p, ε acts by 0; derived completed coefficient is O; amplitude [0,d] | Retain; reducedness is not silently imposed here. |
| 0.5 Generic fibre | O; O/p; O/𝔪; proper formal ℙ¹ | O[1/p]=C; (O/p)[1/p]=0; (O/𝔪)[1/p]=0; H⁰(O_ℙ¹)[1/p]=C | Generic modules C,0,0; H⁰(ℙ¹_C,O)=C | Retain; generic fibre is not reduction. |
| 1.1 Canonical complex | Point; smooth curve; non-CM reduction of completed ℤ_p[pT,T²,T³] | ω•=O[0], Ω¹[1]; x=pT mod p≠0, x²=xT²=xT³=0 | Amplitude [−d,0]; bottom flat canonical module, without asserting whole complex equals bottom shift | Retain; smooth formula not extended to non-CM model. |
| 1.2 Comparison | Identity; U=2T at odd residue characteristic; equal-characteristic k((ϖ)) | Differential dU=2dT; reductions by ϖʳ | Canonical pullback multiplies by 2; same ϖ-adic completion | Retain; no replacement of ϖ by p. |
| 1.3 Gluing | U=𝔛; U empty; scalar lattice O⊂K | Kernel of (K⊕O→K), (x,y)↦x−y, is diagonal O; empty-open kernel K | Glued object O, respectively K | Retain; equalizer direction fixes the overlap map. |
| 1.4 Hartogs | Smooth disc; node uv=ϖ; nonreduced t²=ϖ model | Reflexive unit/top sheaf extends uniquely; special node uv=0 reduced; special t²=0 nonreduced | Extension available for first two; last violates reduced-residue assumption | Retain; non-example excluded. |
| 1.5 Formal trace | Identity; split degree 2 and degree p | Tr(1)=1,2,p; Tr(e₁)=1 | Counit identity and sum; p mod p=0 | Retain; normalized average would be undefined at p. |
| 1.6 Generic canonical sheaf | Formal point; smooth curve; nodal chart | ω_K=K; Ω¹_K generator dT; node generator du/u=−dv/v | Generic top differential line has same generators | Retain; relative dimension and sign agree. |
| 1.7 Coherent trace | S=Tʳ in characteristic zero; identity | Pullback dlog S=r dlog T; Tr(dlog T)=dlog S | Tr(f* dlog S)=r dlog S | Retain; trace is not division by r on coefficients. |
| 2.1 Torsion quotient | Module O⊕O/a; degrees 0,1,2; p=2 | Quotient by a-power torsion O; exterior square of a rank-one generator 0 | p-power torsion quotient also O; square-zero exterior product | Retain; single torsion element is not a quotient ideal. |
| 2.2 BMS map | Formal point; smooth one-torus | Φ⁰(1)=1; image Φ¹=aR̃¹ | Degree-zero unit and a-scaled rank-one line | Retain; general construction does not assert smooth isomorphism. |
| 2.3 Smooth inverse | d=0; one-torus; n>d | Ψ⁰(1)=1; Ψ¹(character)=dlog T; Ωⁿ=0 | Identity; normalized inverse jΦ⁻¹; R̃ⁿ=0 | Retain; extra a⁻¹ changes the torus value. |
| 2.4 Nice model | Point; uv=ϖ; t²=ϖ | Residue rings k, k[u,v]/uv, k[t]/t² | First two reduced and nice; third not reduced | Retain; smooth generic fibre alone insufficient. |
| 2.5 Rational normalization | Rank-one torus; ordered two-torus | Φ=Sch∘j implies jΦ⁻¹=Sch⁻¹; swapping gives −1 | Coordinate maps to dlog T; top wedge changes by −1 | Retain; no extra scalar. |
| 2.6 Faltings trace | Point; smooth curve | Point 1↦1; ω•₀=Ω¹₀[1], then shift [−2] gives Ω¹₀[−1] | Target has H¹=Ω¹₀(−1), not H⁻³ | Retain; integral and mod-p shifts agree. |
| 2.7 Pseudo-finite | Identity; finite map; rig-isomorphism | Generic finite maps; nearby pushforward amplitude [0,d] | Both defining conditions true; identity pushforward unchanged | Retain; generic finiteness alone not used as definition. |
| 2.8 Pro-étale trace | Split p points; identity | Counit(x₁,…,x_p)=Σxᵢ; unit trace p | Reduction gives 0 on all-ones, 1 on e₁; identity 1 | Retain; no tame-degree restriction. |
| 2.9 Trace compatibility | Identity; split two-sheet map | Tr_F∘sum on (1,0)=1 | Coherent sum∘Tr_F on (1,0)=1 | Retain; both arrows have the same dualizing target. |
| 3.1 Polystable chart | Zero-dimensional block; one nodal block; unit parameter | O[t]/(t−ϖ)=O; uv=ϖ has d=1; uv=1 is a torus | Dimensions 0,1,1; canonical top lines invertible | Retain; unit parameters and products included. |
| 3.2 Root tower | p=2 nodal stage; torus; m=0 | Special fibre k[x,y]/(x²,y²,xy) has basis 1,x,y (length 3); generic degree 2 | Not base-flat at the node; torus rank 2; stage zero identity | Retain; O-flatness is not R-flatness. |
| 3.3 Character multiplication | uv=ϖ, opposite weights; parameter 1 | u·v=ϖ·1; with parameter 1 gives 1 | Normalized factor ϖ^{min(1,1)}=ϖ; unit case factor 1 | Retain; multiplication of weight lattices need not be an isomorphism. |
| 3.4 Character cohomology | Rank-one trivial and order-pᵐ characters | Trivial Koszul differential 0: H⁰=H¹=O; nontrivial differential b=ζ_{pᵐ}−1: H⁰=0,H¹=O/b | Same invariants/coinvariants; rank-two trivial ranks (1,2,1) | Retain; nontrivial character cohomology is torsion, not zero integrally. |
| 3.5 Décalage | Differential a; free line; torus | η_a[O→ᵃO] acyclic; O/O[a]=O | Torsion removed; O/a is a different object; torus free ranks (1,1) | Retain; quotient notation and special criterion matter. |
| 3.6 Projection trace | m=0; root torus p=2; characteristic-p node | tr(1)=1; tr(T^{1/2})=0; tr(T)=T | Projection to base coset; algebra trace of 1 is 2 (or 0 mod 2) | Retain; zero trace and algebra trace are excluded. |
| 3.7 Root derived duality | n=0; m=0; p=2,3 at node; p=2,n=2 | n=0 gives 𝔽_p; m=0 gives A; node p=2 summands A,A/(v),A/(u) pair with weights 1,u,v; p=3 branch block has matrix [[0,u],[u,0]] | Dual summands A,(u),(v); annihilator equalities give Extᵏ=0 for k>0; triple crossing has seven summands weighted 1,U,V,W,UV,UW,VW | Retain; nonunit determinants on nonfree summands do not refute duality. |
| 3.8 Oriented trace | d=0,1,2; nontrivial character; swapped basis | d=0 identity; trivial top Hᵈ=M; nontrivial d=1 top M/(γ−1)M; swap det=−1 | Scalar trace 1, coefficient quotient, and orientation factor −1 | Retain; scalar top trace requires trivial action. |
| 3.9 Cochain duality | Trivial d=1 and d=2; opposite weights | d=1 cup pairs degrees 0/1 by 1; d=2 e₁∪e₂=1 and e₂∪e₁=−1 | Dual complex shifted −d has matching degrees; opposite weights contribute the factor in §3.3 | Retain; orientation survives before mod-2 reduction. |
| 3.10 Polystable local duality | Point; smooth one-torus | Point K=Oᵃ/p; torus cohomological ranks (1,1) | Dual with ω•₀[−2] has the same ranks in degrees 0,1 | Retain; does not assert finite projectivity over singular coefficients. |
| 4.1 Derived pairing | Unit; zero complex; ℤ/p over ℤ/p² | Unit adjoints identity; zero adjoint 0→0 is iso; Hom(ℤ/p,ℤ/p²)=pℤ/p² | Reflexive torsion module ≅ its double dual, despite not being projective | Retain; duality and projectivity are distinct. |
| 4.2 Rig-isomorphism descent | Identity; admissible blowup with unchanged generic fibre | Nearby complex on generic fibre unchanged; trace composite identity | Pushed adjoint is the original local-duality adjoint | Retain; uses proper duality, not equality of formal structure sheaves. |
| 4.3 Good quotient | Trivial G; free split G-cover; fixed-point action | Quotients X, X; free fibre has cardinality \|G\|; fixed fibre smaller | Generic torsor condition holds for first two and fails for fixed points | Retain; finite quotient alone is insufficient. |
| 4.4 Homotopy invariants/orbits | G=1; G=C_p; nonabelian S₃; induced module Λ[G] | Induced invariants and coinvariants both Λ; norm [e₁]↦Σ_ge_g; trivial 𝔽_p module norm=p=0 | Shapiro has zero higher groups for induced module; trivial C_p module has nonzero higher groups | Retain; inversion supplies the right action, no averaging. |
| 4.5 Equivariant pushforward | Identity t; point d=0; induced G-module | Rt_*=id; bound 2d=0; invariants/orbits=Λ | Both exchange maps identity in these cases; Hom-orbits adjunction gives Λ | Retain; finite cohomological dimension is retained for totalizations. |
| 4.6 Wild quotient descent | Split C₂-torsor at p=2; split S₃-torsor | Invariants diagonal Λ; norm generator goes to invariant sum, a generator even when \|G\|=0 in Λ | B_hG→B^hG is iso on the induced fibre; trace of diagonal 1 alone is \|G\| | Retain; distinguishes Shapiro from a false trivial-module norm argument. |
| 4.7 Local almost PD | Point; node uv=ϖ; t²=ϖ | Identity duality; reduced nodal residue; nilpotent t in third residue | Nice predicate true,true,false; theorem applies only to first two | Retain; source overbreadth is not inherited. |
| 5.1 Global almost trace | Point; ℙ¹; two components | 1↦1; point class↦1; component classes (x,y)↦x+y | Targets Oᵃ/p in degrees 0,2,2 with twist −d | Retain; model change preserves trace via §2.9. |
| 5.2 Global almost PD | ℙ¹; zero/empty cohomology | H ranks (1,0,1); empty space complex 0 | Complementary ranks (1,0,1); RHom(0,D)=0 | Retain; no nonempty hypothesis needed for duality. |
| 5.3 Top trace/detection | One point; two points; zero map of 𝔽_p | Trace 1→1; Λ²→Λ sum has kernel Λ; nonzero 𝔽_p tensor O/p remains non-almost-zero | Top trace iso only in connected case; almost tensor detects nonzero finite kernel/cokernel | Retain; disconnected trace not claimed bijective. |
| 5.4 Mod-p PD | ℙ¹_C, p=2,3; i=−1,3; ℙ¹ in characteristic p | Mixed-characteristic H=(𝔽_p,0,𝔽_p(−1)); outside-range groups 0; char-p H²(𝔽_p)=0 | Complementary pairing 1·1↦1; outside 0↔0; char-p proposed H⁰-dual would have rank 1 | Retain mixed characteristic; negative control excludes equal characteristic p. |
| 5.5 Local-system PD | Point with V=𝔽_pʳ, r=0,1,2; cyclic p-group unipotent module | Evaluation matrix I_r; for [[1,1],[0,1]], fixed subspace span(e₁) has dimension 1 | Dual evaluation I_r; filtration has two trivial one-dimensional quotients | Retain; p-group fixed-vector input has its field/finite-dimensional hypotheses. |
| 5.6 Finite p-power PD | Point and ℙ¹, n=1,2 | Point Λₙ⊗ᴸ_Λₙ𝔽_p=𝔽_p[0]; tensor over ℤ_p has H⁻¹=H⁰=𝔽_p | Correct reduction is first; ℙ¹ duality uses Λₙ[−2] with ranks (1,0,1) | Retain; wrong scalar ring and omitted shift fail. |
| 5.7 Integral/rational trace | Point; ℙ¹; split degree p | Compatible traces 1 at every pʳ-level; inverse limit 1∈ℤ_p then 1∈ℚ_p; trace unit p | Same formal-model trace on its domain; rational trace still p | Mathematics retained; R02 removes stale name. |
| 5.8 Integral derived PD | ℙ¹; torsion test M=ℤ_p/p | ℙ¹ cohomology ℤ_p,0,ℤ_p(−1); Hom(M,ℤ_p)=0 but Ext¹(M,ℤ_p)=𝔽_p | Derived dual retains torsion in degree 1; ordinary Hom alone loses it | Retain derived statement. |
| 5.9 Rational PD | Point; ℙ¹; genus-g smooth proper curve | Ranks 1; (1,0,1); (1,2g,1); integral p-torsion becomes 0 | Dual ranks identical; alternating middle pairing, trace 1 in top degree | Retain with Tate twist and −2d. |
| 7.1 Constructible complexes | Point skyscraper in disc; open complement extension by zero; disjoint union with increasing shifts; n=1 | Stalk ranks (1 at point,0 elsewhere); reversed for open extension; no global degree bound; zero coefficients give 0 | Two strata suffice locally; D_zc^(b) allows local bounds; n=1 zero category | Retain; arbitrary Huber constructibility is not substituted. |
| 7.2 Algebraization | Spec K; nilpotent thickening K[ε]/ε²; proper ℙ¹ | Point category finite Λ-modules; étale topology unchanged by nilpotents; ℙ¹ ranks (1,0,1) | Analytic point/thickening categories and proper cohomology agree | Retain; the proper/absolute equivalence is distinguished from general full faithfulness. |
| 7.3 Generators/locality | Identity finite cover; split p-cover; extension from punctured disc | Identity pushforward Λ; split pushforward Λᵖ; summation e₁↦1 even mod p | Finite-cover generators do not require invertible degree; branch-locus strata retained | Retain; declared branched-cover contract handles extension. |
| 7.4 Proper pushforward/totalization | Point inclusion; nodal curve; normalized two-term cosimplicial complexes | Skyscraper R⁰=Λ,Rⁱ=0 for i>0; ranks (1,1,1); N⁰→N¹=id has H⁰=0; N¹→N²=id has H¹=0 | Tot₁ gets H⁰=0, Tot₂ gets H¹=0; truncating one step earlier gives Λ | Mathematics retained; R01 resolves analytic geometry contracts. |
| 7.4 Sheaf bridge and bound | Constant cosimplicial Λ on ℙ¹; sole N²=Λ[2] | Constant totalization sheaf has H²=0 but global H²=Λ(−1); negative-degree example Tot has H⁰=Λ | Sheafified hypercohomology gives 0; negative-degree example Tot₁=0 | Retain sheafification and D≥0 hypothesis; latter example excluded. |
| 7.5 Field extension | Point; ℙ¹; split nodal rational proper curve; singular matching object | Ranks (1), (1,0,1), (1,1,1); branch difference (a,b)↦a−b | Same ranks and map after C′/C, even transcendental; reduction of K[ε]/ε² is K | Mathematics retained; R01 supplies resolution; singular toric shortcut excluded. |
| 7.6 Proper base change | Identity base change; two points; n=1; residue characteristic zero | Exchange id; stalk Λ²→Λ² identity; zero→zero; every n invertible in residue field in char 0 | Same objects and maps; mixed-characteristic p-part uses §7.5 | Retain; scope stays Zariski constructible. |
| 7.7 Constant cohomology sheaf | Z point or two points; Y=ℙ¹ | R⁰=Λ or Λ²; R² for point=0; H²(Z×Y,Λ)=Λ(−1) for point | Constant direct-image sheaf has the same ranks; not product cohomology | Statement consistent; H source not certified. |
| Lean quotient/CharP/monomial | p=0,1,2,3; n=0,1; all exponents positive | p=0 quotient over ℤ; p=1 zero ring; n=0 quotient=ZMod p; t₀t₁=0 | CharP 0 and 1 have correct total meanings; prime theorem excludes p=0,1; monomial RHS also zero | Retain real-bodied definitions; no division-by-zero theorem instance. |
| Lean root module/theorem | m=0,1,2; p=2,3; n=0,1,2 | q=pᵐ>0; scalar action r·x=r^q x; τ(x^q)=x, τ(x)=0 for q>1 on node branch | τ(r^q x)=rτ(x); m=0 identity; complementary-residue blocks as §3.7 | Retain; natural division used only with positive q. |
| R01 supplier resolution contract | Point, nodal curve, dual-number point | Resolution identities, normalization with two node preimages, reduction map | Intended RZ.5 operations have these values; claimed §§5.3–5.4 cannot be resolved | Declare/repoint exact supplier contracts. |
| R02 parent trace/comparison | Point; split p points | Identity comparison; sum(e₁)=1, sum(1,…,1)=p | Same prose parent maps, with no declarations under the cited names | Remove stale names; no mathematical change. |

For the nonfree calculation in §3.7, write q=pᵐ and choose residue exponents r_i between 0 and q−1. A nonzero monomial has proper support S. Its summand is `A/(∏_{i∉S}t_i)` and its dual is the ideal `(∏_{i∈S}t_i)`. Multiplication with the complementary residue vector followed by τ gives that ideal's generator. The alternating resolution uses the two complementary products; their annihilator identities make every positive Ext zero. The zero residue vector gives the free summand A. This computes both sides of the adjoint, including the singular examples, rather than assuming a finite-free root stage.

### Ownership, pins and supplier resolution

Object searches used `roadmaps grep`/`roadmaps show`, the main tree, board packages and the supplied sibling checkouts. Searches included Faltings traces, almost coherent duality, polystable root modules, Zariski-constructible proper pushforward, Frobenius restriction and the actual declaration names. The characteristic-p root-duality statement was found only in this roadmap and its own package/checkouts. A similarly named pinned Frobenius file concerns the Frobenius exact category of matrix factorizations, not this ring's Frobenius restriction module: `TauCeti/CommutativeAlgebra/MatrixFactorization/Frobenius.lean:14`. There is no declaration collision in the inspected siblings.

The existing owners retain almost modules, abstract derived algebra, ringed-site enhancements, semistable one-block towers, proper primitive comparison, smooth proper local systems and coherent formal geometry. This roadmap owns their specific formal almost-coherent specialization, product-polystable trace calculation, wild descent, p-primary duality and Zariski-constructible comparison. The AInf variant explicitly extends from one block with parameter p^q, q>0, to products with arbitrary nonzero parameters including units. No duplicate fixed-vector or abstract perfect-pairing API is added.

The following pinned declarations were opened, not inferred from their names. Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Declaration and pinned file | What its actual type supplies |
|---|---|
| `LinearMap.IsPerfPair`, `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39` | Two bijective adjoints; no finite-dimensionality or projectivity condition. |
| `Representation.invariants`, `Mathlib/RepresentationTheory/Invariants.lean:73` | Fixed vectors for all group elements; does not assume finite group. |
| `iterateFrobenius`, `Mathlib/Algebra/CharP/Lemmas.lean:327` | The q-power ring homomorphism, with the requisite characteristic instance. |
| `ModuleCat.restrictScalars`, `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85` | Scalar multiplication through the chosen ring homomorphism. |
| `CategoryTheory.Abelian.Ext`, `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | Native shifted-Hom Ext, with natural degree cast to integer. |
| `AlgebraicGeometry.Scheme.smallEtaleTopology`, `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50` | Scheme étale site; it does not furnish a rigid site. |
| `Representation.exists_common_fixed_vector_of_isPGroup` / `invariants_ne_bot_of_isPGroup`, `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:151` / `:158` | Nonzero finite-dimensional representation over an exponential-characteristic field; group is a p-group, not necessarily finite. |
| `TauCeti.AdicSpace`, `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` | Full subcategory of sheafy locally affinoid pre-adic spaces, without the required rigid/almost coefficient sites. |

Cross-roadmap resolution was by sections and mathematical objects. The table records the consumed families and representative exact locations; R01 and R02 isolate the failures rather than treating the automated resolver's output as a verdict. Line numbers below refer to the cited README, not the service's leading metadata line.

| Supplier | Resolved inputs and witness locations |
|---|---|
| PerfectoidSpaces | P0.1–P0.13/P0.29, P3.11–P3.22, P5.9–P5.13.4, P6.5–P6.7/P6.15–P6.16: almost quotient/presentation, purity, finite-stage descent and pro-étale towers; `README.md:1618`, `:8649`, `:12243`, `:15153`. |
| AdicSpacesPartII | R0–R1 and R0.19–R0.20: affinoids, geometric morphisms, spectral limits and ordinary tilde-limits; `README.md:7464`, `:8134`. |
| AdicSpacesPartIII | F0.6–F0.8, R2.2–R2.8, R3.1–R3.8: formal/coherent geometry, models, generic fibres, coherent GAGA and traces, with the five explicit extensions listed below. |
| AdicSpacesPartV | Unresolved numbered sections: R01. The board design has RZ.0–RZ.6; its two declared extensions are not counted as missing merely because unfinished. |
| SchemeAndStackFoundations | §0.6 reflexivity, §§0.8–0.9 finite-presentation geometry, §0.21 excellence permanence, §§2.18–2.21 DQCoh and coherent duality; `README.md:678`, `:3959`, `:4094`, `:4275`, `:4390`. Valuation-base extensions are explicit gaps. |
| RigidAnalyticGeometry; ResolutionOfSingularitiesCharacteristicZero | §§1.1–1.2 affinoid algebra; §§7.5,7.7,7.8 quasi-excellent scheme resolution/principalization, respectively. Resolution `README.md:1098`, `:1130`, `:1150`; these are not substituted for the separate rigid-resolution contract. |
| DerivedModuleAlgebra; DerivedDeRhamCohomology | §§0.2,0.4,0.8,0.10–0.14,1.T.1,1.1–1.8,1.E.1,S.1 and §1.22: tensor/Hom, cotangent, completion, towers and first-quadrant spectral sequences. Representative lines `README.md:626`, `:815`, `:1403`, `:1666`, `:2200`, `:2316`; DerivedDeRham `README.md:900`. |
| EnhancedDerivedSheaves | §§0.1–0.4, E1.1–E1.5, E2:towers.1, E5:animation.3; bounded module totalization at `README.md:1978`. The sheaf bridge uses RΓ on each étale affine followed by sheafification, not an unsupported termwise identification with global cohomology. |
| AInfCohomology | AI.0:integral.1, AI.1.1–AI.1.7, AI.3.1–AI.3.2, AI.4.1, AI.6.1–AI.6.2: dlog/twists, décalage/Koszul operations, structure sheaf, toric comparison and existing semistable block. Representative `README.md:748`, `:902`, `:1898`, `:2108`, `:2262`, `:2658`, `:2824`. |
| PadicHodgeTheory | §§2.1,2.4,2.7,7.2: comparison, proper primitive/perfectness and integral lattices; `README.md:599`, `:1250`. The nonproper nearby and integral field-extension additions remain declared contracts. |
| ArithmeticGaloisDuality | R02.1.2–R02.2.3 and D7.1–D7.3: continuous/group-ring cohomology, towers and coefficient algebra; `README.md:599`, `:1190`, `:1401`, `:4685`, `:5002`, `:5073`. The ringed almost adaptation remains here. |
| DiamondsAndVStacks; DiamondEtaleCohomology | D2.2 v-cover condition (`README.md:3779`); C0.1 rigid/diamond site comparison, C0.23 bounded-below étale-to-v fully faithfulness (`README.md:614`), C2.10 hyperdescent (`README.md:893`). No prime-to-p restriction is added to these v-derived inputs. |
| ClassicalAdicEtaleCohomology | §§1.1–1.5(c),2.5,3.2,8.2,8.4,9.1,9.5–9.7,10.5,11.1–11.2. In particular §2.5 starts at `README.md:1064`, §9.7 at `:5152`; their underlying claims resolve. R02 corrects only the obsolete signature names. |
| HodgeTateAndCanonicalSubgroups | §7.6 proper smooth p-primary local systems, `README.md:2436`, checked against SW Theorem 10.5.1, pp.82–89, SW line 3295. |
| EtaleCohomologyFoundations | F.0 constructible coefficients and G.1–G.3 compactification. The wider quasi-excellent nonproper direct-image statement is explicitly assigned to F.3 as a gap. |
| AdicCoefficientsAndComparisons | L2/fp-compactification-limit at `README.md:1088`, L2/fp-strict-cofiltered at `:1112`; both keep finite presentation and qcqs-base hypotheses. |

The 13 gap slugs agree between `packages/ClassicalAdicEtaleCohomologyPartII/design/plan.json` and the README. Every gap has a named supplier. Related compatibility clauses were read as parts of a single specified functor or theorem, not as free unspecified assumptions. No gap is rejected merely for being absent from its supplier today. No duplicate ownership was found for these extensions at the inspected pins/eligible sections.

| Gap(s) | Boundary checked |
|---|---|
| valuation-formal-proper-mapping | Coherent coefficients may have p-torsion; formal ℙ¹ with O/p has H⁰=O/p while generic fibre is zero. Noetherian proper mapping is insufficient over O_C. |
| reduced-model-cofinality | Applies to reduced rigid generic fibres; dual-number generic fibre is excluded. Localization at rig-isomorphisms and domination by reduced-residue models are explicit. |
| refined-formal-algebraization | Flat finite presentation, smooth generic fibre and pure dimension d are all retained, rather than mere existence of some algebraization. |
| finite-formal-quotients | Quasiprojective residue fibre gives invariant affine neighbourhoods; FQ Theorem 3.3.4, pp.17–18, FQ line 756 and line 760. No tame-order restriction. |
| polystable-uniformization-zigzag | Reduced quasiprojective auxiliary models, not arbitrary original models; Z Theorem 4.4.1, Z line 3188, and U Theorem 1.4, pp.4–5, U line 169. Finite extension disappears over algebraically closed C. |
| finite-branched-covers | Normality, surjectivity and nowhere-dense inverse branch locus distinguish a genuine cover from a disc plus an isolated point over its origin. The empty complement cover is excluded by surjectivity. |
| proper-generic-smoothness | Open is in the target: for point inclusion a→disc it is disc minus a, and for two inclusions the common open deletes both points. |
| valuation-upper-shriek | Includes valuation quotients, proper adjunction, flat base change and smooth formula; identity over O/p² preserves the nonzero Ext¹(O/p,O/p). |
| valuation-duality-amplitude | Relative Tor amplitude is over S, not a demand that the dualizing complex be perfect over a singular X. |
| valuation-canonical-reflexivity | Smooth generic fibre and geometrically reduced residue fibre are both present; it is an extension of the supplier's Noetherian reflexivity scope. |
| general-nearby-coherence | Admissible nonproper models, formal-affine comparison, étale locality and derived reduction are specified; these are not supplied by proper primitive comparison alone. |
| integral-toric-field-extension | Requires a smooth toric affinoid and its actual tower; a singular node has no such étale toric chart. |
| quasi-excellent-direct-images | Allows nonproper finite-type maps with invertible finite coefficients; this is stronger than proper constructibility. |

### Headline coverage and shape

The headline results are formal Hartogs/canonical traces (§§1.1–1.7), integral Faltings trace and compatibility (§§2.3–2.9), characteristic-p and integral product-root derived duality (§3.7), polystable and general local almost duality (§§3.10,4.7), wild-quotient descent (§4.6), global almost duality (§5.2), mod-p/local-system/finite-p-power/integral/rational duality (§§5.4–5.9), constructible algebraization/generation (§§7.2–7.3), proper pushforward (§7.4), algebraically closed field-extension invariance (§7.5), all-torsion proper base change (§7.6), and the constant cohomology sheaf (§7.7).

The characteristic-p headline is stated in Lean. The module docstring names the other headlines and identifies the absent formal schemes, rigid sites, almost categories, geometric cohomology and comparison maps. The integral root theorem also needs its constructed integral character projection; it is not replaced by an arbitrary map. The pin searches and the opened native carriers support these distinctions. No statable headline omission or stand-in was identified.

The README has the required scope, conventions, supplier contracts, build explanation, layer Examples/Dependencies and references. Definitions carry API prose and at least three discriminating Checks; the computations above distinguish the unit, zero, nonfree and wrong-normalization cases. Layers follow the dependency direction. The skipped layer number 6 is not itself a defect. Normative shape was compared with main-branch AdicSpacesPartIII, EtaleCohomologyFoundations and EnhancedDerivedSheaves. No files in the pull request were changed.

## Not verifiable

- H, Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*, §2.6, Proposition 2.18 and proof, p.279, cited in §7.7: the manifest/brief settles this source as uncertified. No readable text was supplied for this run; the purported extraction locator “H line 802” cannot be certified. It was not requested again. The statement and its deduction from §7.6 were checked independently as a sheaf statement, including the ℙ¹ negative control above.
- The numbered AdicSpacesPartV supplier sections cannot be verified on main or an indexed open head; the accessible board design was inspected. This is R01, not an unavailable published source and not a reason to park this review.

## Source issues

- **Misprint** in Z at Theorem/Definition 3.4.13, diagram (3.7), printed p.43 (Z line 2038): the source says the rational source acquires an additional scalar power; it should be the unscaled source for the inverse normalized by dual dlog and Remark 3.4.15; affects a stated result.
- **Error** in Z at Lemma 4.2.15, printed p.54 (Z line 2563): the source says multiplication between every pair of weight lattices is an isomorphism; it should be multiplication by the retained block-parameter factors, possibly nonunits; affects a stated result.
- **Misprint** in Z at Proposition 4.3.6, Case 2, printed p.61 (Z line 2965): the source says the root bound uses level n; it should be level m, the root stage being reduced modulo π; affects the proof.
- **Misprint** in Z at Theorem 4.4.24, printed p.74 (Z line 3587): the source says the theorem without repeating reduced residue fibre; it should be the nice-model statement of Theorem 4.1.2, p.49, also specified at the beginning of §4.4; affects a stated result.
- **Misprint** in Z at Definition 5.2.1, printed p.75 (Z line 3640): the source says the global trace target has shift +2d; it should be −2d, as in the displayed defining composite; affects a stated result.
- **Misprint** in Z at Theorems 5.5.2, 5.5.4 and 5.5.6, printed pp.81–83 (Z line 3922, line 3969 and line 3980): the source says the derived trace and duality use an unshifted coefficient target; it should be the coefficient target shifted by −2d; affects a stated result.
- **Misprint** in Z at Theorem 5.5.2, proof, printed p.81 (Z line 3928): the source says to tensor the finite-level duality over ℤ_p; it should be over ℤ/pⁿ for the displayed coefficient-reduction square and perfect-complex Nakayama argument; affects the proof.
- **Misprint** in AC at Lemma 4.5.22, proof, printed p.100 (AC line 4294): the source says its proof is identical to its own proof; it should be a reference to the earlier scheme argument, Lemma 4.1.11, with the formal analogues; affects the proof.
- **Error** in AC at Lemma 4.9.7(2), printed p.113 (AC line 4852): the source says the Hom input bounds are D⁺ then D⁻; it should be D⁻ then D⁺, as in Corollary 4.9.6; affects a stated result.
- **Misprint** in AC at Theorem 5.1.5, proof, printed p.117 (AC line 5003): the source says sections of the associated sheaf and higher direct image are taken over X; it should be over the affine target Spf A; affects the proof.
- **Misprint** in AC at Theorem 5.5.5, printed p.129 (AC line 5512): the source says proper pushforward runs from the target category to the source category; it should be from the source to the target, opposite to upper shriek; affects a stated result.
- **Misprint** in AC at the construction preceding Lemma 5.5.6, printed p.130 (AC line 5528): the source says the tensor of pushed-forward objects is over O_X; it should be over O_Y before the cup map, and over O_X inside pushforward; affects the proof.
- **Misprint** in AC at Lemma 5.5.6, printed p.130 (AC line 5540): the source says the internal-Hom comparison lies in the source category; it should be in the target category, as both sides and its proof specify; affects a stated result.
- **Misprint** in AC at Lemma A.3(1), proof, printed p.173 (AC line 7457): the source says cohomology vanishes for i≤0; it should be i<0; the complete unit module has nonzero H⁰; affects the proof.
- **Misprint** in AC at Lemma A.5, printed p.173 (AC line 7480): the source says the reduction bounds use the index a; it should be d in both inequalities, matching the conclusion and Lemma A.3; affects a stated result.
- **Misprint** in BH at Lemma 3.8, proof, printed p.16 (BH line 716): the source says the restricted sheaf is open; it should be locally constant; affects nothing.
- **Misprint** in BH at Theorem 3.5, proof, printed p.17 (BH line 744): the source says the closed complement Z_i is contained in V_i; it should be contained in U_i and disjoint from V_i; affects the proof.
- **Misprint** in BH at Theorem 3.10, proof, printed p.18 (BH line 784): the source says the common dense open for smoothness is in X; it should be in Y, the common target of the proper maps; affects the proof.
- **Gap** in BH at Lemma 3.25, proof, printed p.25 (BH line 1113): the source says to choose a perfectoid toric torsor on an arbitrary affinoid; it should be justified beyond the smooth case or preceded by smooth proper hyperdescent; affects the proof.
