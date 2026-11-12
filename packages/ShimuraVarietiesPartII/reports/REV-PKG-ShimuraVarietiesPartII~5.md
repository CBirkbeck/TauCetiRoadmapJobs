<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6787289406 -->
Review (codex) of 9ea94af

Verdict: needs_changes

1. **F01** (P1) The expanded norm Check reverses the declared dual convention

   **Location.** `packages/ShimuraVarietiesPartII/README.md:37`: “δ=ζ” and “the length-2 norm ζ⁶ is the crystalline linear F₂₅-Frobenius”. Compare the standing convention at line 29 and the correctly distinguished matrices at line 977.

   **Claim.** With δ denoting the standard group element, its norm ζ⁶ is also the crystalline Frobenius in the dual realization.

   **Witness.** For G_m and δ=ζ, line 29 gives F_D=ζ⁻¹σ. Hence F_D²=ζ⁻⁶=ζ¹⁸, whereas line 37 claims ζ⁶. Their quotient is ζ¹²=−1, not 1.

   **Exact repair.** Retain δ=ζ, but replace the last identification in that sentence by: “The standard group norm is ζ⁶; its dual crystalline linear F₂₅-Frobenius is ζ⁻⁶=ζ¹⁸.” Retain m₀=1 and the subsequent elliptic calculation. Alternatively the whole example may consistently use δ_D=ζ as §4.9 does, but it must then distinguish the standard element δ=ζ⁻¹.

   **Repair test.** Modulo 24, the standard norm exponent is 1+5=6; the dual norm exponent is −1−5=18; the ordinary square exponent is 2. The proposed sentence gives all three correctly and agrees with the rule F_D=ρ∨(δ)σ. The same rule is used in the repaired finite-period construction. This is a new inconsistency in the expanded Check, not a failure of the framing-degree repair itself.

2. **F02** (P3) The new fundamental-group Check includes GL₀ incorrectly

   **Location.** `packages/ShimuraVarietiesPartII/README.md:978`: “For GL_n and GSp_(2g), π₁ is Z with trivial Galois action”. There is no positive-rank restriction on n.

   **Claim.** The displayed algebraic fundamental group is ℤ for every GL_n admitted by the Check.

   **Witness.** GL₀=1 has cocharacter lattice 0 and coroot lattice 0, hence their quotient π₁(GL₀)=0, not ℤ. Its H¹ is nevertheless the singleton, so the framing conclusion survives.

   **Exact repair.** Write “For GL_n with n≥1 and GSp_(2g), …”. Add the boundary control “For GL₀=1, π₁=0 and H¹ is still trivial.” No theorem or supplier gap needs changing.

   **Repair test.** For n=0 the corrected ranks are 0−0=0; for n≥1, the quotient of ℤⁿ by the sum-zero coroot lattice is ℤ. Both have zero torsion in the relevant split case. The cited supplier already distinguishes these cases: PadicHodgeTheory, PR #1062, `TauCetiRoadmap/PadicHodgeTheory/README.md:1108`, §5.5, expressly restricts the ℤ calculation to n≥1 and treats GL₀ as trivial.

Two findings: one P1 and one P3. The previous blocking finding is repaired; the new findings concern two expanded Checks. The four authored package files were not changed.

### Previous finding, verified first

| Previous finding | Repaired passage | Independent verification |
|---|---|---|
| Round 4 F01: tensor descent does not give a frame over the original finite field | `packages/ShimuraVarietiesPartII/README.md:960`: “Choose a framing degree m₀≥1, meaning that the torsor has a point over K₀=Q_(q^m₀)”. Line 29 gives the same convention; line 1028 requires a multiple of m₀. | **Repaired.** HT line 1051 descends tensors; HT line 1056 chooses a frame only after a sufficiently divisible extension; HT line 1065 uses rm factors. The repaired norm realizes γ_x^m₀, not γ_x. For the elliptic example, its trace/determinant are −6/25,1/25 rather than 2/5,1/5. |
| F01 proof inputs and pattern elsewhere | `packages/ShimuraVarietiesPartII/README.md:964` uses Steinberg over the maximal unramified extension and finite-type descent. Lines 95 and 137 name the suppliers. | **Repaired.** ReductiveGroupsPartII §RG2.1.1 on main covers the henselian unramified field; PadicHodgeTheory §5.5 supplies the torsor and its cohomology class. BunGAndNewtonStrata §1.16 is applied after choosing δ. The exact q-Frobenius conclusions in §§5.10 and 7.6 remain unchanged. |

The norm-one-torus control also works: for the unramified quadratic extension Q₂₅/Q₅, valuations of norms are even, whereas v₅(5)=1. Thus N(z)=5 has no Q₅-point; after extension it is uv=5, with point (5,1). This is a control on torsor neutrality, not an assertion that this particular torsor is a specified Shimura fibre. I searched the remaining frame, finite-field, norm-length and power statements. Frames over the algebraically closed residue-field completion, finite-field de Rham frames under connected groups, and ℓ-adic frames are distinct constructions and do not repeat F01. The earlier positive-exponent and geometric-global-conjugacy repairs remain intact. No settled “not actionable” finding is re-raised.

## Verified sound

### Principles, scope, shape and coverage

Read all **63 numbered targets**, their statements, proof routes, APIs and Checks, all **71 standalone Needs lines**, the conventions, supplier contracts and downstream scope. The target-by-target computed ledger was retained during the review; the table below reports the seeded targets, headlines, changed passages and both findings. Unchanged numerical rows from the preceding review were used only where they supplied actual computed values, and the displayed short computations were recomputed. The additions in the repair report were checked independently.

There are **eight layers**, each with Examples and Dependencies, and **26 Definition/Construction sections**, each with an API and at least three Checks. R01 and R02 identify the false Checks found in this pass. Each theorem has a locator and stated hypotheses. The main-branch ReductiveGroupsPartII and SchemeAndStackFoundations roadmaps were read for the house shape.

The package continues ShimuraVarieties beyond its generic canonical tower. It imports generic component groups, PEL moduli, local models, tensor deformation theory, B(G), generic conjugacy quotients and PEL Newton strata from their owners; it constructs their integral Hodge-model realizations and comparisons here. Ramified primes, exceptional type-A and quaternionic-D factors, and arbitrary connected parahoric level at p>2 remain in the integral-model theorem. KPZ Theorem 7.2.21 really has this breadth (KPZ line 3735); its optional nonexceptional reduction is separated from the general shtuka reduction (KPZ line 3768). No added “good primes only” shortcut was found.

The mathematical dependencies explain the order: integral models and tensors feed local geometry; auxiliary covers feed descent; Newton and tensor-isogeny theory feed special lifts; KR geometry supplies same-field curves; those curves feed Frobenius comparison. No source chapter supplies a layer title or an unforced organizational template. No re-planning, computational algorithm, copied source passage or circular proof route was identified. No machine path, HTML anchor, pull-request number or process narrative was found in the authored roadmap text. Mathematical backticks and imported declaration names were distinguished from claimed new Lean declarations.

### Seeded source verification

All **five** manifest works were readable in their legal cached extractions. All **15** requested sample locators were opened, including the relevant proof steps and standing assumptions. No additional author-flagged unverified locator was found. The explicit version notes specify the manuscript pagination where applicable; no additional source fetch or missing-reference request was needed.

| Sampled target | Exact locator and source text | Hypotheses and conclusion verified |
|---|---|---|
| 0.4 Integral étale Hodge tensors | KZ §§4.1.6–4.1.7, pp.30–31, KZ line 1304 through line 1355; §5.1.1, p.47, KZ line 2063 through line 2079 | Canonical tensor sections and frame realization; tower H₁ versus dual H¹ and the multiplier twist are retained. |
| 0.6 Universal crystalline tensor functor | HT Proposition 1.3.12 and Corollary 1.3.13, p.19, HT line 840 through line 884; Appendix A.4–A.7, pp.38–39, HT line 1744 through line 1807 | Global crystalline tensors and exact tensor functor. The roadmap correctly uses the generated category's subgroup of the tensor stabilizer, rather than the erroneous equality in the proof. The log-extension input is a declared contract. |
| 1.8 Pro-level DVR extension | KPZ Theorem 7.1.3(1) and proof, p.73, KPZ line 3191 through line 3216; HT Lemma 1.3.6, p.17, HT line 764 through line 773 | Full prime-to-p tower, mixed-characteristic DVR, and actual good-reduction/descent inputs. No extension property for an arbitrary finite-level generic point is substituted. |
| 2.1 Strongly acceptable Shimura triples | KZ Definition 4.2.2, p.34, KZ line 1476 through line 1490 | Very-special condition and induced centre condition, not simply “abelian type” or “hyperspecial”. |
| 2.2 Reflex splitting for auxiliary covers | KPZ §§7.2.2–7.2.3, pp.77–78, KPZ line 3394 through line 3423; Proposition 7.2.19(2), p.83, KPZ line 3669 through line 3683 | Splitting at all specified p-places in the reflex composite, with the chosen auxiliary cover. |
| 2.6 Strongly acceptable auxiliary cover | KZ Proposition 4.2.3 and Lemma 4.2.4, pp.34–35, KZ line 1491 through line 1523; KPZ Proposition 7.2.19, p.83, KPZ line 3682 | Torsion-free coinvariants and full-fixer equality. The roadmap corrects, rather than repeats, the torsion misprint. |
| 3.1 Integral component-action groups | KP §§4.5.6 and 4.6.1–4.6.4, pp.195–199, KP line 2982 through line 3010 and line 3091 through line 3156 | Integral adjoint group, closure in the away-p adeles, star-product relation and auxiliary tilde groups; full adelic and away-p closures are distinguished. |
| 3.2 Reflex units and unramified components | KP Lemmas 4.3.2, 4.3.5 and Corollary 4.3.9, pp.189–191, KP line 2760 through line 2844; KPZ §§7.1.10–7.1.11, p.75, KPZ line 3281 through line 3297 | Units land in the connected parahoric modulo the simply connected image; condition (D) controls stabilizers. Modern (A)–(D) hypotheses are present, not silently inherited from the older tame setup. |
| 3.4 Integral adjoint twisting action | KP Lemmas 4.5.2, 4.5.4, 4.5.7, 4.5.9, pp.194–197, KP line 2947 through line 3056 | Central torsor twist, polarization and isogeny coefficients, with the correct conjugation of level. |
| 3.7 Freeness of the integral descent kernel | KP proof of Corollaries 4.6.15 and 4.6.18, pp.203–205, KP line 3313 through line 3408; KPZ §7.3.1(3), pp.86–87, KPZ line 3814 through line 3847 | Arithmetic kernel at the tower, neat-level freeness and effective quotient. The j-piece uses its conjugate parahoric, as the published correction requires. |
| 4.3 Newton strata on the special fibre | HT Theorem 1.3.14, pp.19–20, HT line 885 through line 908 | Reduced locally closed strata, Newton specialization, and the separation of unconditional stratification from nonemptiness requiring the rational-Newton witness. |
| 4.5 Special-point nonemptiness of Newton strata | HT Proposition 1.3.10, p.18, HT line 821 through line 837; (1.1.3.1), HT line 284; Proposition 1.2.5, pp.14–15, HT line 648 through line 683 | Rational Newton representative and torus transfer; the global conjugator is geometric and the local p-conjugator rational. The inverse Hodge cocharacter is retained. |
| 4.8 Tensor-preserving quasi-isogeny group | HT §§2.1.3–2.1.5, pp.21–22, HT line 969 through line 1009 | Rational quasi-isogenies preserving all the tensors, across realizations; neither polarization alone nor actual automorphisms replaces this group. |
| 5.1 Integral maps under derived isomorphisms | KZ Proposition 4.3.2 and Corollary 4.3.4, pp.37–40, KZ line 1626 through line 1672 and line 1690 through line 1710 | Integral extension in the stated good, connected setup; the formal-completion comparison requires the derived isomorphism, not any central isogeny. |
| 7.2 Frobenius point in the conjugacy quotient | KZ §§5.1.2–5.1.3, pp.47–48, KZ line 2080 through line 2106 | Exact geometric q-Frobenius of the intrinsic tower, independence of frames and geometric conjugacy quotient; rational quotient points are not claimed to be rational representatives. |

The repair was additionally checked against HT §§2.1.5–2.1.7, pp.22–24, especially HT line 1051 through line 1078, and K17 §2.1.2, p.29, K17 line 1268 through line 1309. K17 fixes a base-field frame in its hyperspecial setting; it does not remove HT's sufficiently divisible extension in the general setting. K17 Corollary 2.1.7, p.31, K17 line 1381 through line 1394, also confirms the compact homogeneous-quotient argument as a separate input.

### Computed adversarial table

These are discriminating controls, not proofs of the general statements. “Keep” means the instance respects the stated hypotheses and survives the test. The standing assumptions exclude p=2, q=1, a zero coefficient field and inseparable characteristic-zero extensions; those are not counterexamples to the stated scope. Positive rank is not a standing assumption, which is why R02 applies.

| Statement | Instances tried | Values computed on the compared sides | Result / change |
|---|---|---|---|
| Conventions, R01 | G_m, δ=ζ of order 24 over Q₂₅ | Standard norm exponent 1+5=6; dual exponent −1−5=18 mod 24; ordinary square exponent 2. Claimed crystalline exponent 6 differs from 18 by 12. | Correct the label and dual value as R01. |
| 0.4; dual convention | E:y²=x³+x/F₅ | Affine counts 1,0,1,1,0; total 4. H¹ trace/determinant 2,5; standard H₁ geometric trace/determinant 2/5,1/5. Multiplying inverse roots by 5 restores 2,5. | Keep; distinguishes dual and Tate-line conventions. |
| 0.6 | Constant ordinary elliptic family | Rank 2; slopes 0,1; determinant slope 1. Geometric monodromy 1 does not determine the nontrivial Frobenius group. | Keep the subgroup/restriction route; no equality with the full tensor stabilizer is needed. |
| 1.8 | Good elliptic scheme; split multiplicative Tate curve | Inertia I versus upper-unipotent [[1,t],[0,1]], t≠0. A full compatible tame frame forces t=0. | Keep the pro-level condition. |
| 2.1 | Split-at-p GU(1,1); positive-rank GSp; Iwahori | Z_G^c for GU(1,1) is a local G_m of dimension 1; for GSp it is μ₂, dimension 0, order 2, hence not a torus. An Iwahori is not a very-special vertex level. | Keep the centre and level restrictions. |
| 2.2 | Q(i) at 5 and at 3 | X²+1 has roots 2,3 mod 5, giving local degrees 1+1; no root mod 3, giving degree 2. | Keep splitting, not arbitrary finite extension. |
| 2.6 | Coinvariants ℤ²; ℤ/2 | Torsion subgroups 0 and a group of order 2. | Keep torsion-free; reject the source's literal torsion wording. |
| 3.1 | Torus; star product S₃*_(S₃)S₃ with conjugation | Torus derived congruence completion 1. Relation (a,a⁻¹) maps to aa⁻¹=1; for a=(123), the wrong (a,a) maps to a²≠1. | Keep inverse diagonal relation and topological ambient group. |
| 3.2 | Reflex G_m inverse norm at 5 | 2 maps to 1/2 of valuation 0; 5 maps to 1/5 of valuation −1. Units have trivial valuation class; uniformizers do not. | Keep inverse reciprocity and unit restriction. |
| 3.4 | diag(ℓ,1) and upper/lower unipotents | Upper entry 1 becomes ℓ; lower entry 1 becomes ℓ⁻¹. Inverse conjugation swaps these outcomes. | Keep γKγ⁻¹. |
| 3.6; 3.7 | Iwahori, j=diag(p,1); identity cover; scalar −1 at full odd level | Lower entry p becomes 1, violating original Iwahori divisibility. Identity Δ has stabilizer 1; −1 sends level vector 1 to −1≠1. | Keep conjugate-level pieces and full-level freeness. |
| 3.8 headline | Modular curve hyperspecial and Iwahori | Relative dimensions 1 and 1; special-fibre branch counts 1 and 2. In the node, nonzero u,v satisfy uv=0. | Keep normal integral models without promising smooth special fibre. |
| 4.3 | Ordinary/basic elliptic points; PGL₂ classes | D slopes (0,1) and (1/2,1/2), p-ranks 1 and 0. PGL₂ central Newton value 0 can accompany κ=0 or 1 mod 2. | Keep both Newton and integral Kottwitz data. |
| 4.5 | T=SO(x²+y²) in SL₂/Q, d=diag(3,1), p=5; identity | det(d/√3)=1. A rational normalizer correction needs determinant 1/3, with odd v₃=−1, whereas ±norms from Q(i) have even v₃. At 5 the norm is split and surjective. Identity gives g=1,T′=T. | Keep geometric global conjugacy and rational local conjugacy. |
| 4.6; 4.7 headline | Ordinary elliptic locus; quaternion-inner-form control | Ordinary open dimension 1, basic closed set dimension 0, ordinary closure dimension 1. A half-slope inner shift would require slopes 1/2,−1/2 with multiplicity 1 each, violating denominator-2 multiplicity. | Keep existence of the ordinary class; do not infer it in every inner form. |
| 4.8 | E×E with projection tensors; scalar 1/2 at p=5 | Swap sends e₁₁ to e₂₂≠e₁₁. Scalar 1/2 is a rational quasi-isogeny but not an actual automorphism of the abelian scheme. | Keep all tensor conditions and rationalization. |
| 4.9 repaired frame assertion | Norm-one torus Q₂₅/Q₅; N(z)=5 | Norm valuations 2v(z) are even; target valuation 1 is odd. Over Q₂₅ the equation uv=5 has (5,1). | Prior F01 repaired; descent alone is insufficient. |
| 4.9 repaired norm length; 4.13 | E/F₅, framing degree 2 | γ trace/det 2/5,1/5; γ² trace/det (2/5)²−2/5=−6/25,1/25. π² trace/det 2²−10=−6,25. | Keep length rm₀ and subsequent positive multiples of m₀. |
| 4.9, R02 | GL₀ and GL_n for n≥1 | For GL₀, X_*=0, coroots=0, quotient 0. For n≥1, quotient ℤⁿ/(sum-zero lattice)=ℤ. Both torsion subgroups are 0. | Qualify the ℤ assertion; H¹=1 survives. |
| 4.9 stable powers | Ordinary E/F₅ above; supersingular y²=x³−x/F₃ | Ordinary roots 1±2i give independent prime valuations, closure dimension 2, e=1, centralizer dimension 2 for m≥1; m=0 gives dimension 4. Supersingular #E=4, π²=−3, e=2, centralizer dimensions 2 at m=1 and 4 at m=2. | Keep positive divisibility, not merely positive exponent. |
| 4.9 finite-period group | δ_D=[[0,−1],[5,0]] | δ_D²=−5I; (δ_D⁻ᵀ)²=−I/5. Finite-period centralizer over F₅ has dimension 2; J_δ has dimension 4. | Keep I_p distinct from J_δ. |
| 4.13 headline | Ordinary CM and supersingular fibres; unipotent control | Tensor-isogeny and stable-centralizer dimensions 2=2 and 4=4. Identity and nontrivial unipotent share trace 2/determinant 1 but centralizer dimensions 4≠2. | Keep semisimplicity and the stable common power. |
| 5.1 | Identity; t↦t² on G_m; SL₂→PGL₂ | Identity formal ring map t↦t. Torus derived groups both 1 and Shimura components dimension 0. SL₂→PGL₂ has kernel μ₂ of order 2 and is not a derived isomorphism. | Keep exact completion-comparison hypothesis. |
| 5.9 headline | Ordinary CM elliptic point | Canonical-lift Mumford–Tate torus and isogeny group have rank/dimension 2; a condition preserving only scalars would admit GL₂ of dimension 4. | Keep full isogeny action. |
| 5.10 headline | E/F₅ | Rational standard quotient coordinates 2/5,1/5; a rational companion matrix realizes them. Square coordinates −6/25,1/25 differ. | Keep exact q-Frobenius. |
| 6.3 headline | A¹/F₅, c=0, dense open G_m; lower-stratum constant map | Marked-point degree 1; inverse image G_m is nonempty dense. Constant map into a lower stratum has empty inverse image of the higher open. | Keep original field and nonconstant progress where needed. |
| 7.2 | diag(1,1/5); E over F₅ and F₂₅ | First polynomial T²−(6/5)T+1/5; elliptic polynomial T²−(2/5)T+1/5; extension polynomial T²+(6/25)T+1/25. | Keep character-polynomial and geometric-Frobenius conventions. |
| 7.4; 7.6 headline | Degree-one point on comparison curve; determinant character | Frob scalar 1/5 at degree 1 versus 1/25 at degree 2; common elliptic quotient (2/5,1/5), not (−6/25,1/25). Trivial representation gives 1 on both sides. | Keep same-field curves and exact q, independently of p-adic framing degree. |
| Conj(G) convention; 7.5 | SL₂(R) rotations by ±π/2 | Both trace 0 and determinant 1. A real intertwiner has determinant −(a²+b²)<0; no determinant-one real conjugator exists. | Keep geometric conjugacy, not rational conjugacy. |

Other target checks include the square-zero tensor frame u=[[1,ε],[0,1]], where u e₁₁u⁻¹=e₁₁−εe₁₂ despite identical reduction; finite normalization fibres of dimension 0 versus a P¹ of chain choices of dimension 1; connected finite-field frame torsors with H¹=1 versus constant C₂ with H¹=C₂; matched multipliers 2J⊕3J, which cannot equal c(J⊕J); and compactness of C×/R× versus the unbounded scalars 2ⁿ in C×. These controls prevent weakened tensor, moduli, connectedness, product and compactness substitutes.

### Pinned declarations, Lean acceptance test and headlines

The pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following cited declarations were opened at those pins; searches were by object as well as declaration name.

| Pinned file and line | Declaration / actual content | Consequence for this package |
|---|---|---|
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`, line 124 | `WittVector.Isocrystal`, `Isocrystal.frobenius`: module over the Witt fraction field with Frobenius-semilinear equivalence, for the specified perfect domain | Does not bundle finite dimension, G-tensors or a family on a Shimura special fibre. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | `TauCeti.AlgebraicGeometry.AbelianVariety`: proper geometrically integral group object | No polarization or integral Shimura moduli problem is a field. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:74` | `TauCeti.AlgebraicGeometry.AbelianVariety.End`: additive wrapper of endomorphisms, composition multiplication | Rationalizing this object does not supply the canonical tensors defining I_x. |
| `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:63` | `Matrix.transpose_mul_J_mul_eq_det_smul` | Rank-two identity AᵀJA=det(A)J is already supplied. For diag(2,3) the multiplier is 6; for A=0 both sides are 0. It stays only a Check. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71` | `TauCeti.reductiveCommHopfAlgProperty` | Field-level reductive Hopf-algebra carrier, not an integral parahoric group scheme or its local model. |
| `TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean:66`, line 107 | `TauCeti.HopfAlgebra.conjugationAlgHom`, `productMap_comp_conjugationAlgHom` | Left conjugation evaluates to gxg⁻¹. With g=diag(2,1), x=[[1,1],[0,1]], upper entry becomes 2, whereas inverse conjugation gives 1/2. |
| Same file, lines 176, 196, 248 | `conjugationAlgHom_counit_left`, `conjugationAlgHom_counit_right`, `conjugationAlgHom_coassoc` | Identity, fixed-identity and associativity laws of that action; no quotient-classification theorem. |
| `TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean:136` | `TauCeti.ComoduleAlgebra.coinvariants` | Right coaction equalizer a↦a⊗1. The left conjugation coaction needs the other tensor-factor inclusion; it is not registered here as the requisite right comodule. |

The raw algebra of class functions can be described using these ingredients. That does not make the Shimura-model, canonical-tensor, parahoric, Newton-stratum or tower-local-system carriers available. Searches for those objects in the pinned libraries did not reveal a native statement of any headline. The README does not claim the absence of Hopf-algebra reductive groups or their conjugation map.

`lake env lean <Suggested.lean>` was run from the content checkout, with the delivered package file as its absolute argument: **exit 0, no output and no warnings**. No Tau Ceti module build was necessary. The earlier preflight “Unknown identifier of” did not reproduce on the delivered file.

There is one `import Mathlib`, one module docstring, the required namespace, and **zero declarations**. Consequently the exhaustive one-tactic padding probe has **0 sorried theorems**, and the mechanical `#check @name` comparison has **0 own signatures**; neither is a sampled omission. There is no sorry'd data, `set_option`, stand-in predicate, extraneous example or imported roadmap module. No own backticked declaration is promised by the README but absent from the file.

| Headline from the README | Docstring coverage and missing carrier at the pins |
|---|---|
| §3.8, integral models of abelian type, KPZ Theorem 7.2.21 | Named; abelian-type Shimura data, parahoric group schemes, integral Shimura and local models absent. |
| §4.7, openness/density of the ordinary locus | Named with the ordinary-class existence premise; B(G), universal G-isocrystal and Newton strata absent. |
| §4.13, tensor Tate comparison, HT Corollary 2.1.9 | Named; canonical Shimura tensors, I_x and its finite-period crystalline centralizer absent. |
| §5.9, ordinary special lifts and isogeny action, KZ Theorem 4.4.6 | Named; integral model, ordinary locus and tensor-preserving isogeny group absent. |
| §5.10, rational ordinary Frobenius, KZ Corollary 4.4.13 | Named; integral ordinary points with their ℓ-adic realizations absent. |
| §6.3, same-field curves, KZ Corollary 5.2.7 | Named; integral Shimura models and KR strata absent. |
| §7.6, common rational Frobenius class, KZ Theorem 5.1.4 | Named; special fibre, group-valued tower local systems and geometric conjugacy-quotient comparison absent. |

The summary's intermediate local-geometry, canonical-model and DVR-extension results also require the same absent integral models. None becomes statable by a few simple native-carrier definitions. No statable headline omission or Lean padding was found.

### Supplier resolution, ownership and merge order

Every cited supplier was resolved against main or its provided open head. In the table, each file is `TauCetiRoadmap/<supplier>/README.md`; the line is a checked anchor, and the section list records the consumed material, including grouped subsections. Open PR numbers identify the evidence here, not proposed roadmap citations.

| Supplier and inspected version | Resolved sections and anchor | Ownership boundary verified |
|---|---|---|
| ShimuraVarieties, #933 | §4.5 (line 1227), §5.6, §§6.3–6.6, §8.1 | Generic torus models, CM reduction, component groups and canonical tower stay there. |
| ShimuraData, #1038 | Layers 1 and 4; §1.2 (line 185), §4.1 (line 765) | Hodge/abelian type and connected Hodge lifts; the four refinements here are explicit gaps. |
| PELModuli, #966 | §M2.8 (line 2380), §§M4.5–M4.6, §§M6.1–M6.4 | Single-lattice integral Siegel models and level changes do not supply the chain-moduli contract. |
| AbelianSchemesAndArithmeticModuli, #849 | §§A4.1, A4.3, A4.8–A4.9; A6.7, A6.14, A6.20–A6.22, A6.28–A6.29; A4.1 line 1838 | Universal abelian objects, realizations, Serre–Tate, Frobenius and torsor twists imported. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, #879 | §R07.2, especially .6, .7, .12, .14, .20; .6 line 3236 | Base Dieudonné/tensor comparison inputs imported. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, #1843 | §§2.10–2.11, 3.13–3.17, 4.3–4.4, 4.12, 6.4–6.5; §4.12 line 1195 | Owns general very-good embeddings, adapted deformation rings and ordinary adapted lifts; this package specializes them to Shimura points. |
| GeometricSatakeAndFusion, #1235 | GS0, including 0.8, 0.29, 0.31, 0.37; 0.8 line 388 | Affine Schubert/stratification ingredients imported. |
| GeometricSatakeAndFusionPartII, #1836 | §§1.4, 3.1, 3.4, 3.7, 5.5, 7.6; §3.1 line 571, §7.6 line 1113 | Canonical normal local models and Schubert curves owned there; very-special integrality is the precise added contract. |
| ReductiveGroupsPartII, main | RG2.0, RG2.1, RG2.3; Steinberg at line 1469 | Henselian algebraically closed residue-field torsor vanishing, arithmetic groups, fixers, connected parahorics and Lang. |
| ReductiveGroupsPartIII, #2131 | §§0.5–0.7, 1.2–1.3, 2.3, 2.5, 3.5, 5.3a; downstream §5.5 line 1588 | Generic conjugacy and torus results imported. Its abelian-variety application assumes the geometric comparison explicitly; no back-edge to its proof is consumed here. |
| BunGAndNewtonStrata, #1241 | §§0.6, 0.8, 1.16, 1.22–1.26, 1.28–1.29, 1.34, 1.37, 1.39, 2.16; §1.16 line 592 | Owns general B(G), Newton/ordinary classes and finite-period norm centralizers; the latter assumes δ and does not manufacture a frame. |
| HeckeStacksAndLocalShtukas, #1252 | HS2.1, HS2.10–HS2.11, HS2.13; HS2.1 line 1041 | Generic period towers imported; integral full-fixer completion and connected reduction remain named gaps. |
| CrystallineCohomology, #857 | CR.7.1 (line 11243), CR.7.3 | General coefficients and relative connection imported; the two specific transport/tensor-descent results are gaps. |
| PadicDifferentialEquationsAndRigidCohomology, #1002 | RD.3.43 (line 6767), RD.5.116 | Newton semicontinuity on noetherian bases, singular ones included, and Zarhin's trick. |
| PadicHodgeTheory, #1062 | §5.5; local torsor theorem line 1099, rank-zero control line 1108 | Tensor torsors and H¹(F,G)≃(π₁(G)_Γ)_tors. This is the repaired proof input and the explicit comparison for R02. |
| MotivesAndAlgebraicCycles, #1313 | Layer 6, §§6.1–6.3; §6.3 line 1149 | Tensor reconstruction and subgroup/closed-immersion criterion; no full-monodromy equality assumed. |
| AutomorphicBundles, #1069 | §§3.4–3.8; §3.4 line 1423 | Betti, étale and de Rham representations and comparisons; H¹ uses the dual representation. |
| SchemeAndStackFoundations, main | §§1.17–1.23; §1.17 line 2728 | Quotient stacks, inertia, presentation and descent; arithmetic Δ-effectiveness is the specific new result here. |
| AlgebraicModuliForArithmeticGeometry, #853 | Layer 6; §6.1 line 8773; Layers 1 and 4 for declared gaps | Henselian approximation imported; finite-field Bertini and rational stack presentation are not silently assumed. |
| ArithmeticGaloisRepresentations, #856 | §1.11, reductive quotients (line 1436); §§5.1, 5.13 | Conj(G), Chebotarev and semisimple lisse recognition imported; coarse Noot comparison is separate from this package's final theorem. |
| GlobalShtukasAndFunctionFieldLanglands, #1490 | §§6.1–6.2; lines 1925, 1937 | Constant twists and irreducible companions on open curves; semisimple assembly over one coefficient extension remains the declared gap. |
| NeronModelsAndSemistableAbelianVarieties, #852 | §§5.1–5.2; line 3109 | Good-reduction criteria and descent at the required DVR generality. |
| ShimuraCompactifications, #1053 | Layer 7, §§7.18–7.19; lines 2633, 2646 | Existing quasi-projectivity and finite normalization do not supply universal Siegel chains or the stated component-specialization extension. |
| IgusaVarietiesAndTorsionConcentration, #1090 | §§0.1–0.2, 0.12; §0.12 line 452 | Existing PEL hyperspecial Newton strata; the present normalized Hodge-model construction has a distinct domain and an overlap compatibility. |

Object searches used the roadmap service over main and indexed open heads, the local board packages, and the pinned libraries. The board package index was read before making absence claims. Searches included integral Hodge models, tensor-preserving quasi-isogenies, special lifts, tensor frames, finite-period centralizers and Siegel lattice chains. Near matches were resolved to the ownership boundaries above, not treated as duplicates merely because they share vocabulary. With no Lean declarations here, there is also no fully qualified name collision.

The supplied overlap artifact reports no competing head changing this package, dropped cited id or id defined only by an open revision. Its five closest roadmaps were inspected: #1843, #1836, #2131, #1241 and #1090, with the concrete boundaries in the table. No two-owner construction or upward handoff was found in this package. The earlier external full-fixer citation issue in #1836 is not re-raised against this package, which assigns the extension to ReductiveGroupsPartIII rather than the main roadmap that excludes it.

The prescribed dependency command, with `--movable`, returned exit 0 and exactly:

```text
depcheck: 236 roadmaps, 2156 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver reported no unresolved roadmap citations or Lean names. Its library-name coverage warning was not treated as verification; the pinned declarations were opened separately as recorded above.

### Declared supplier contracts

The README and the plan's top-level gaps list contain the same **20 slugs**, with no supplier `none`: local-models; open-curve-companions; integral-local-shimura; general-connected-reduction; cr-crystalline-parallel-transport; cr-isocrystal-tensor-descent; noot-coarse-comparison; finite-field-bertini; rational-stack-presentation; component-specialization; siegel-chain-moduli; hodge-cover-refinement; multiplier-exact-sequences; matched-fibre-product-centre; fundamental-invariant-form; rg3-cyclic-torus-and-neatness; rg3-r-smooth-tori; rg3-r-smooth-abelian-type; rg3-stabilizer-closed-immersion; compact-quotient-borel.

Each names an owner and an exact extension with hypotheses. The local-model gap excludes the already supplied smooth extremal stratum; the companion gap excludes the supplied irreducible case; the chain-moduli gap distinguishes a universal chain from finite normalization; and the integral-shtuka gaps exceed the supplied generic period tower. The stable-centralizer gap requires a positive exponent divisible by the component index, and the coarse Noot gap is independent of full Conj(G) comparison. No additional vague, duplicate or unowned gap was identified. Future acceptance would be conditional on these contracts; this needs-changes verdict does not certify their future proofs.

## Not verifiable

- No unavailable text blocked this review: all five cached works and all 15 seeded locators were read. No new missing-reference request is needed.
- The separate published versions of KZ, HT and K17 were not collated against their recorded manuscript versions. Locator verification is for the versions explicitly recorded in `sources.toml`; KP and KPZ use their published pagination.
- Package overlap coverage uses the supplied head-based artifact and the inspected relevant heads. It is not a claim that every unrelated open roadmap was manually read.
- The 20 declared supplier gaps are future mathematical contracts. Their precision, ownership and overlap were reviewed; their eventual proofs cannot be certified here.
- Computed controls and source comparisons are not formal proofs. The declaration-free Lean elaboration verifies imports and syntax, not the truth of the README's deep theorems.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), printed p.34: the source says inertia coinvariants are torsion; it should be torsion-free, consistently with Lemma 4.2.4 and KPZ Proposition 7.2.19; affects a stated result.
- **Misprint** in HT at Proposition 1.2.5, printed p.14: the source says the torus class uses μ_x; it should be μ_x⁻¹, as the admissibility hypothesis and proof require; affects a stated result.
- **Gap** in HT at the proof of Corollary 1.3.13, printed p.19: the source says the generated realization category has the full tensor-stabilizer group; it should be a subgroup, with restriction of representations supplying the functor; affects the proof.
- **Misprint** in HT at the proof of Corollary 1.3.13, printed p.19: the source says V^⊗n⊗(V∨)^⊗m is sent to D^⊗m⊗(D∨)^⊗n; it should be D^⊗n⊗(D∨)^⊗m; affects the proof.
- **Error** in HT at §1.3.15 and Corollary 1.3.16, printed p.20: the source says an ordinary class exists without a separate existence premise; it should be assumed to exist or guaranteed, for example by quasi-splitness; affects a stated result.
- **Misprint** in HT at §2.1.8, printed p.24: the source says the cyclic subgroup is generated by an unintroduced x when defining neatness of γ; it should be generated by γ; affects nothing.
- **Misprint** in HT at Appendix A.2, printed p.37: the source says U is D minus S for a divisor D in S; it should be S minus D; affects nothing.
- **Error** in KP at the proof of Theorem 4.2.7, printed p.187: the source says the relevant action map is a torsor; it should be smooth, with the frame projection carrying the torsor property; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.
- **Gap** in KP at Lemma 3.1.17, printed p.169: the source says its auxiliary topology justifies the logarithmic limit; it should use p-adic completeness and shifted logarithmic-tail convergence; affects the proof; corrected in print at KPZ §7.3.1(2), pp.85–86.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, printed pp.202–203: the source says all component pieces use one fixed parahoric; it should use jK_p°j⁻¹ for the j-piece; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9ea94af495fe314ff1b9185115cb76536144441c", "job": "REV-PKG-ShimuraVarietiesPartII~5", "model": "gpt-6-astra", "worker": "chris-10"} -->
