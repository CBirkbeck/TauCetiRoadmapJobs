# Repair report: VectorBundlesAndIsocrystalsPartII

Review settled: REV-PKG-VectorBundlesAndIsocrystalsPartII_r3, findings F01–F02.

## F01 (P3) — applied

Conventions: “forgetting semilinearity makes the twists isomorphic” → forgetting the Galois action gives underlying linear Hom equal to C; omitting C-linearity retains zero continuous additive equivariant Hom for finite K/ℚ_p. Searched the other forgetful statements in §§0.2, 0.3, 0.6, 0.9 and 1.9; they already preserve this distinction. No Lean change.

## F02 (P3) — applied

Section 3.4: bounds on all coefficients → bounds on nonconstant coefficients indexed by k ≥ 1, with constant coefficient 1 separately. Added the k = 0 coefficient Check and both valuation lists. Applied the same positive-index qualification to §3.2’s quotient-series Check. Section 3.3’s inequality remains valid at index zero. No Lean change.

## Mathematical evidence and pattern audit

Fontaine03 line 167 fixes finite K/ℚ_p; Fontaine03 line 201 defines the semilinear category; Fontaine03 line 213 states the full faithfulness used in §0.2. PadicPeriodRings §§1.2 and 2 supply C^{G_K} = K and C(j)^{G_K} = 0 for j ≠ 0. For f : C(1) → C, full faithfulness makes f multiplication by an element of C(−1)^{G_K} = 0. Continuity and additivity imply ℚ_p-linearity by density. Conversely, without the action, multiplication by each a ∈ C is a linear map between the underlying lines, and a = 1 is invertible. The fixed subgroups 0 and K also prevent an equivariant additive isomorphism. This verifies F01 independently of the review's proposed wording.

CN25 line 1061 fixes the normalized exponential roots, CN25 line 1068 fixes their characters, and CN25 line 1077 gives the odd-prime exponential equation. The coefficient repair is elementary: counting factors divisible by p gives v_p(k!) = Σ_{r ≥ 1} floor(k/p^r). For k ≥ 1, this is at most (k − 1)/(p − 1). Thus at odd p, v_p(p^k/k!) ≥ k − (k − 1)/(p − 1) ≥ 1 and tends to infinity. At p = 2 the count is k − s₂(k), so v₂(4^k/k!) = k + s₂(k) ≥ k + 1 ≥ 2. At k = 0 both coefficients equal 1 and have valuation 0. These give exactly A ∈ 1 + pℤ_p{X}, respectively 1 + 4ℤ₂{X}; its nonconstant part has Gauss norm less than 1, so A is a unit.

For §3.2, the coefficient formula for (exp(4X) − 1)/4 starts at k = 1. Its valuation is k + s₂(k) − 2 ≥ k − 1. The constant coefficient is zero, not the value obtained by substituting k = 0 into that formula. For §3.3, 2n − v₂(n!) ≥ n includes n = 0, where both sides are 0. No analogous positive-index omission remains in the exponential coefficient statements. Character normalizations, tower levels and extension parameters are unchanged.

## Computed adversarial mathematics pass

Each row records explicit instances and values, rather than claiming that elaboration proves the mathematics. The rows include all 62 numbered targets, the kept Lean structure, conventions, and the changed supporting statements. Zero fields, p = 1, and equal-characteristic bases do not satisfy the characteristic-zero field and prime conventions. Nonseparable period models are admitted by §4.9; the countability assumptions on sympathetic bases do not restrict the arithmetic headline statements.

| Statement | Instances tried | Computed values on each side | Result and change |
| --- | --- | --- | --- |
| SemilinearRep and completion-action convention | Identity; zero module; standard C action; trivial action at p = 3 and p = 2 | Identity gives cw = cw; zero gives 0 = 0; standard action gives σ̂(cw) = σ̂(c)σ̂(w); trivial action would give ζ₃ = ζ₃² or i = −i | Real structure fields distinguish the intended action; unchanged. |
| Conventions, twist Check | C(1) and C; retain or forget the action | Continuous additive equivariant Hom = 0; underlying C-linear Hom = C; fixed subgroups 0 and K | F01 repaired. |
| Dimension and height conventions | ℚ_p, C, C/ℚ_p; add one constant dimension to both presentation endpoints | Dimensions/heights (0,1), (1,0), (1,−1); (a+1) − (b+1) = a − b | Both presentation conventions have the same signed height; unchanged. |
| Cyclotomic and differential conventions | p = 3, lifts u and −u; p = 2, character value 5 in B₂ | exp(log u) = exp(log(−u)); log(−1) = 0; d₁d₀ = 0, whereas the wrong character gives (1 − 25)t′ = −24t′ | Finite character and inverse character remain essential. |
| Pushout and Euler conventions | Framed B₂; X = Y = ℚ_p | (tc,−c) maps to tc − tc = 0; Euler sum 1 − ([K:ℚ_p]+1) = −[K:ℚ_p] | Signs agree with §§3.7, 4.4 and 1.5. |
| §0.1 strict Banach category | Zero; log χ extension; diagonal T on c₀ with trivial action | Zero kernels/cokernels; log χ has nonzero off-diagonal cocycle; T has kernel 0, dense image, and nonzero quotient class [(p^n)] | Split-only exactness and dense-image inflations are excluded. |
| §0.2 C and period full faithfulness; first Lean headline | Zero source; C to C; C(1) to C; B₁ to B₂ | Hom = 0; End = K in both categories; twist Hom = 0 in both; period Hom = 0 in both, although action-free Hom contains 1 ↦ t | F01 uses the existing theorem; no new signature. |
| §0.3 analytic extension | V ⊕ C, projection and zero map | Dimension (1,h); projection kernel V of dimension h; zero map has image 0 and is analytic | Analyticity does not require surjectivity. |
| §0.4 almost presentations | ℚ_p, C/ℚ_p, C ⊕ ℚ_p | Heights 1, −1; two presentations of C ⊕ ℚ_p give 1 − 0 = 2 − 1 = 1 | An unsigned presentation count would give 3 in the last instance. |
| §0.5 abelian structure and additivity | ℚ_p → C → C/ℚ_p; C(1) → B₂ → C; zero | Dimensions 1 = 0 + 1 and 2 = 1 + 1; heights 0 = 1 − 1 and 0 = 0 + 0; zero (0,0) | Signed additivity agrees. |
| §0.6 finite-length periods | B₂; C(1); zero; ℚ_p | Dimensions (2,0), (1,0), (0,0); ℚ_p has (0,1) | Almost isomorphism of the twists does not produce equivariant Hom. |
| §0.7 scalar rigidity | Scalars 1, p, and a outside K | f(1) = 1 or p; g(a·1) − a·g(1) = g(a) − a ≠ 0 | Equivariance excludes the outside scalar. |
| §0.8 density | Reduction modulo t; constants K; element t in B₂ | Algebraic constants are dense in C; closure of K is K ≠ C; θ(t) = 0 but t ≠ 0 | Residue-field density alone does not prove density in B₂. |
| §0.9 period Hom | B₁ to B₂; B₁ to itself; N = k = 1 | Hom = 0; identity gives nonzero End; Hom(B⁺,t⁻¹B⁺/tB⁺) = K rather than K² | Strict truncation inequalities and Galois conditions retained. |
| §1.1 almost splitting | B₂ extension; ℚ_p → C → C/ℚ_p; log χ | Quotient by ℚ_pt admits section U₁/ℚ_pt ≅ C; quotient by ℚ_p leaves identity of C/ℚ_p; quotient by the whole log χ kernel leaves identity | Nonsplit classes become split only after the specified finite modification. |
| §1.2 all-degree Ext comparison | Degree 0 on C; degree 1 on C,C(1); degree 2 on ℚ_p,ℚ_p(1) | K → K; class of B₂ nonzero → nonzero; ℚ_p → ℚ_p in degree 2 | No replacement by a degree-one comparison. |
| §1.3 generalized invariants | W = 0, C, B₂ | (W_(0),W_(1)) = (0,0), (K,0), (K,Kt′) | Multiplication by t′ is an isomorphism only in the last displayed pair; no inverse of nilpotent multiplication is taken. |
| §1.4 two-operator complex | W = C,C(1),B₂ | Cohomology (K,K,0), (0,K,K), (0,0,0); composite 0 | Wrong inverse-character convention gives −24t′ at character value 5. |
| §1.5 duality and Euler characteristic | X = Y = ℚ_p; C,C(1); zero | Euler sums −[K:ℚ_p], 0 − [K:ℚ_p] + [K:ℚ_p] = 0, and 0; H²(ℚ_p(1)) = ℚ_p | Vanishing begins at degree 3; height-zero Euler sum is zero. |
| §1.6 truncated-period Ext table | (k,j) = (1,0),(1,1),(2,1) | K-dimension triples (1,1,0), (0,1,1), (0,0,0) | k ≥ 1 keeps the two endpoint cases distinct. |
| §1.7 longer truncations | (N,i,j) = (0,1,2); excluded (1,1,1) | First Hom and Ext¹ are 0; excluded case contains C ↪ t⁻¹B⁺/tB⁺ | i < j is necessary. |
| §1.8 fundamental theorem; second Lean headline | V ⊕ C, η = (g,1) or (g,0); V = 0,W = C(1); U₁ with θ | First kernel {(v,−g(v))} has dimension h and image C; second image equals η(V) and kernel contains C; twist η = 0; ker θ = ℚ_pt of dimension 1 | Image inequality excludes the false cases; unchanged. |
| §1.9 analytic realization | Finite V; C; C(1) | Constant BC dimension (0,dim V); C has End_{G_K} = K versus End_BC = C; C(1) has fixed subgroup 0 | Forgetting the action is faithful and not full. |
| §2.1 quotient boundedness | [0 → C], [C → C], diagonal T on c₀ | Quotients C,0,c₀/T(c₀); [(p^n)] ≠ 0 because its preimage would be (1) outside c₀; separated quotient 0 | Algebraic quotient is retained. |
| §2.2 pointwise exactness | Split V₁²; pullback along 0; dense T | Kernel and quotient V₁; pullback middle V₁ with zero quotient; dense T gives nonzero left-heart cokernel | Exactness is left-heart exactness. |
| §2.3 TVS definition | Zero; V₁; all algebra maps on unit balls | Image of {0} = {0}; union of images of O_Λ is contained in O_Λ′ with norm ≤ 1 | Uniform quantifier is over the maps together. |
| §2.4 BC topology | C/ℚ_p; constant ℚ_p; V₁; zero | Evaluations C/ℚ_p,ℚ_p,C,0; heights −1,1,0,0 | Banach topology does not turn height into an unsigned invariant. |
| §2.5 separated completion | B_m; c₀₀; zero | Completions B_m,c₀,0; (p^n) belongs to the completion of c₀₀ and not to c₀₀ | Incomplete models are not identified with their completion. |
| §2.6 c₀ base change | Λ = C; split C²; dense T | Singleton basis gives M; split sequence becomes Λ → Λ² → Λ; coordinatewise T has kernel 0 but class [(p^n)] ≠ 0 | Injectivity does not imply strictness. |
| §2.7 period Modules | Zero; regular B_m; balancing by t in B₂; unbounded sum of B_m | Values 0 and B_m(Λ); t⊗1 = 1⊗t; for each r, t^r·1 in the B_(r+1) summand is nonzero | Balancing and one uniform exponent exclude the wrong models. |
| §2.8 Pairs | [M → M], [0 → B₂], dense T | Quotients 0,B₂,c₀/T(c₀) with [(p^n)] ≠ 0 | Localization retains the non-Hausdorff quotient. |
| §3.1 disc characters | a = 0; γ at p = 3 or 2 | E₀ = 1,χ₀ = 1,ψ₀ = 0; ψ₁(γ) = 1/3 or 1/4; ψ₂(γ) = 1/2 at 2 | κ = 3ψ₁ or 4ψ₁; fractional character lattices retained. |
| §3.2 perfectoid cover and quotient coefficients | p = 3,n = 0; p = 2,n = 0,1; quotient coefficients k = 1,2,3,4 | Y₀³ ≡ X mod 3^(1/3); Y₀²+Y₀ ≡ X mod 2; Y₁²+√2Y₁ = Y₀; quotient coefficient valuations 0,1,3,3 at 2 | F02 pattern repaired here too: k ≥ 1; quotient constant coefficient is 0. |
| §3.3 two-adic comparison | n = 0; n = 2^r; ψ₁ = 1 | v₂(4⁰/0!) = 0 ≥ 0; v₂(2^n/n!) = 1 along powers of 2; v₂(4^n/n!) = n+1; ψ₂/2 = 2/2 = 1 | Existing non-strict n-bound includes zero correctly; division by 2 multiplies the norm by 2. |
| §3.4 exponential coefficient estimate | p = 3,k = 0,1,2,3,6,9; p = 2,k = 0,1,2,3,4 | Valuations 0,1,2,2,4,5 and 0,2,3,5,5; A(0) = 1 in both; (A−1) has constant coefficient 0 | F02 repaired; positive bounds start at k = 1. |
| §3.4 tower, trace coefficient and norm | First level at 3 and 2; cocycles 0,ψ₁; first eigenlines | Constant/geometric/total degrees 6/3/18 and 2/2/4; λ = 0 or (1/3)/(1/3) = (1/4)/(1/4) = 1; inverse norms √3 ≤ 3 and 2 ≤ 2 | No degree or normalization change. |
| §3.4 negative-control root | k = p^r, v_p(c) = p/(p−1) | v_p(binom(1/p,k)c^k) = s_p(k)/(p−1) = 1/(p−1) | Coefficients do not tend to zero, so this root is outside C{X}. |
| §3.5 analytic cocycles | f = c; f = YZ at 2; k = p^r | δ(−c) = c; δ(X²/2) = YZ with v₂(1/2) = −1; v_p binom(p^r,p^(r−1)) = 1 | Constant sign, one denominator and in-range binomial index agree. |
| §3.6 additive lifts | Split; B₂; v = 0 | λ_v = 0 in split case; λ_v = v in B₂; λ₀ = 0 in every extension | Nonzero v is required to infer splitting. |
| §3.7 disc extension isomorphism | Split; framed B₂; pushout by a | λ_E = 0,1,a; λ_v = vλ_E | Nonzero framed classes are not all identified. |
| §3.8 translation invariants | a = 0,1,2; analytic function X | ψ₀ = 0; ψ₁−ψ₁ = 0; ψ₂−2ψ₁ = 0; translation by 1 sends X to X+1 ≠ X | Invariants are C, rather than all C{X}. |
| §4.1 reasonable C-spaces | Zero; c₀; finite-dimensional C | Zero of both types; c₀ has dense span of the e_n and realization c₀(ℕ,Λ); C is finite-dimensional compact type | No claim that all Banach spaces are compact type. |
| §4.2 reasonable period models | B₃; its t²-torsion; unbounded sum | t³B₃ = 0; B₃[t²] = tB₃ of length 2; unbounded sum has t^r nonzero on the B_(r+1) summand for every r | Uniform exponent retained. |
| §4.3 same-type Pairs | Identity; C ↪ C²; dense T; incompatible branches | Quotients 0,C,c₀/T(c₀) ≠ 0; no common branch in the last case | Same type is an explicit hypothesis, not a closed-image condition. |
| §4.4 normalized pushout | m = d = 1,W = C,w = 0 or 1; W = B₂,w = t | Classes 0 and 1; relation (tc,−c) maps to 0 under b+tc′; [t] = 0 in B₂/tB₂ | Zero class need not mean w = 0. |
| §4.5 one-step cocycles | Trivial H; finite H; H = ℤ_p with c(x) = x in C | Cocycle images {0}, at most #H vectors, and ℤ_p ⊂ C = W₀ | All lie in one step; profiniteness and invariant steps remain hypotheses. |
| §4.6 compact-type extensions | C → C² → C; zero endpoints | Middle C², bidual maps identity; zero middle and zero lift space | Finite-dimensional witnesses agree without spherical completeness of C. |
| §4.7 Hom/Ext from B₁ | W = 0,C,c₀ | Hom/Ext parameters 0,C,c₀; B₂ has parameter 1; (p^n) is allowed and (1,1,…) is excluded in c₀ | Banach-valued parameters must converge. |
| §4.8 all separable Fréchet targets | Product C^ℕ; c₀; zero tower | (1,1,…) is in the product and not in c₀; (p^n) is in both; zero tower has lim and lim¹ equal to 0 | No nuclearity restriction introduced. |
| §4.9 nonseparable models | c₀(I,C), uncountable I; W = B₃,d = 2; zero | Hom and Ext¹ parameters c₀(I,C); torsion and quotient lengths 2 and 2; zero comparisons 0 → 0 | Countable dense span is not imposed on the model. |
| §4.10 general B_d source | W = B₃,d = 2,5,0 | Hom/Ext lengths (2,2),(3,3),(0,0); W[t⁰] = 0,W/t⁰W = 0 | d = 0 Check agrees with B₀ = 0. |
| §4.11 constant source | W = C; dense Pair; arithmetic comparison | TVS Hom = C and Ext¹ = 0; Pair Hom contains [(p^n)] ≠ 0; arithmetic H¹(G_K,ℚ_p) has dimension [K:ℚ_p]+1 | Constant evaluation is not arithmetic invariants. |
| §4.12 torsion source into Pair | [0 → B₃],d = 2; [tB₂ → B₂],d = 1; dense C-Pair | Hom = tB₃ of length 2; Hom = C; dense quotient is nonzero and killed by t | Algebraic quotient, not Hausdorff quotient. |
| §4.13 fundamental source | d = 0; d = 1,W = C | U₀ = ℚ_p gives Hom = C,Ext¹ = 0; boundary C → C sends 1 to 1, so Ext¹(U₁,C) = 0 | Displayed source misprint is not imported. |
| §4.14 scalar linearity of lifts | c = 0,p,−1 | Both sides 0; ℓ_v(px) = pℓ_v(x) = ℓ_(pv)(x); ℓ_v(−x) = −ℓ_v(x) = ℓ_(−v)(x) | Nonunits included by p = (1+p) − 1. |
| §4.15 Module comparison | W₁ = W₂ = C; zero; split C² | Hom = C,Ext¹ = C in all three categories; zero groups 0; split parameter 0 | Continuous model splitting gives the natural tensor splitting. |
| §4.16 Pair comparison | Module Pairs B₁,B₂; dense Pair identity; zero | Hom = tB₂ ≅ C in all three categories; identity on nonzero [(p^n)] is nonzero; Hom to zero 0 | Hom only, with bicartesian localization. |
| §5.1 qBC definition and height | Zero; ℚ_p; pure c₀ Pair; C/ℚ_p | Heights 0,1,0,−1; outer pieces of pure Pair are 0,0; ℚ_p has only its negative piece | Height can be negative and does not count the dimension of the middle Pair. |
| §5.2 positive orthogonality | C/ℚ_p to C or B₂; U₁/ℚ_pt_x to B_m; zero-curvature control | Restrictions id_C and tB₂ ↪ B₂ have kernel 0; multiplication by unit t_x injective; End(B₁) contains 1 | C/ℚ_p is positive; zero curvature cannot replace positive curvature. |
| §5.3 intrinsic filtration | Pure Pair; ℚ_p ⊕ B₁ ⊕ U₁/ℚ_pt_x | Outer pieces 0,0 for Pair; positive/middle/negative pieces U₁/ℚ_pt_x,B₁,ℚ_p | Universal subobject and quotient directions agree. |
| §5.4 qBC full faithfulness | Pure Pairs; multiplication by p on C/ℚ_p | Pure Hom is §4.16; pℚ_p = ℚ_p and inverse is p⁻¹; height −1 = −1 | Height and filtration preserved; no splitting asserted. |
| §5.5 non-Hausdorff example | Identity C⁰; LA ↪ C⁰; measure and distribution classes | Identity cokernel 0; dense proper inclusion gives X ≠ 0 but separated X = 0; measure has class 0; derivative evaluation has nonzero class | For f_n(x) = x on p^nℤ_p and 0 elsewhere, the uniform norm is p^(−n) and derivative evaluation at 0 is 1; hence its distribution class is nonzero. |
| §6.1 height functor | 0,ℚ_p^r,B_m,C/ℚ_p; scalar p map | h = 0,B_dR^r,0,0; h(p) = p with reversed arrow; h(id) = id | Uniform bounded-image requirement remains gap:G-HOM. |
| §6.2 exact period comparison | (ℚ_p,V₁); (V₁,V₁); framed B₂ | Ext¹ comparison 0 → 0; Hom and Ext¹ comparisons C → C; boundary sends 1 to 1 | Zero comparison fails normalization. |
| §6.3 positive-period inverse limit | m = 1; B₂ → B₁; zero tower | Hom = C,Ext¹ = 0; kernel tC ≠ 0; zero tower lim¹ = 0 | Reduction maps are surjective and not identities. |
| §6.4 filtered Ext localization | ℚ_p,V₁,C/ℚ_p | First colimit 0; C with zero transition maps has colimit 0; C/ℚ_p has localized Ext¹ rank 1 | No arbitrary filtered-colimit commutation asserted. |
| §6.5 basic VS Ext | k = 0; constant ℚ_p source | Hom(V₁,B⁺) = 0; boundary C → C sends 1 to 1; next Ext¹ transition 0; Ext¹(ℚ_p,V₁) = 0 | Nonzero boundary, not dimension equality alone, gives the zero transition. |
| §6.6 nonpositive curvature | C,ℚ_p; split ℚ_p ⊕ C; excluded C/ℚ_p | Ext¹ ranks 0,0; dual sequence 0 → 0 → B_dR → B_dR → 0 with identity; excluded Ext¹ rank 1 | Curvature restriction retained. |
| §6.7 height–rank formula | ℚ_p,C,C/ℚ_p,ℚ_p ⊕ C | Ranks (h,Ext¹) = (1,0),(0,0),(0,1),(1,0); equations 1 = 1+0,0 = 0+0,0 = −1+1,1 = 1+0 | Signed correction term agrees throughout. |

The §5.5 nonmeasure can be computed explicitly: let f_n(x) equal x on p^nℤ_p and 0 on its complement. This is locally analytic, its uniform norm is p^(−n), and derivative evaluation at 0 is 1. A bounded measure would give 1 ≤ M p^(−n) for every n, which is impossible. Thus the quotient class used in that row is indeed nonzero.

The coefficient lists were also independently recomputed by integer factor counts. For each of p = 2 and p = 3, all indices 1 through 1000 satisfy the claimed bound; at 2 the computed values also equal k + s₂(k). The preceding general inequalities, rather than this finite computation, justify the repaired statements at every prime and every positive index. The source-side character values recompute as κ/3 = 1/3 at p = 3 and κ/4 = 1/4 at p = 2, and both normalize to coefficient 1 in §3.4. No division by a zero character value occurs.

## Acceptance file, signatures and gates

- Ran the prescribed `lake env lean` on `packages/VectorBundlesAndIsocrystalsPartII/Suggested.lean` from the content checkout: exit 0, exactly two warnings, at 62:8 and 85:8, both “declaration uses sorry”. Its only import is `import Mathlib`; no Tau Ceti module required a targeted build.
- Elaborated one scratch copy with `#check @` for every declaration: SemilinearRep, semilinearRep_equivariant_map_smul and fundamental_extension_surjective. Exit 0 with the same two warnings. Compared each expanded type with Conventions, §0.2 and §1.8. The prime instance, finite K/ℚ_p, both finite C-dimensions and module topologies survive in the first theorem. The second retains completeness of E, finite dimension of V, the line condition, continuity, surjectivity, kernel and equivariance of q, continuity/equivariance of η and its image inequality. No binder disappeared and no signature changed.
- Headline inventory: §0.2 C full faithfulness and §1.8 fundamental surjectivity are stated. The module docstring identifies the missing carriers for finite-length period full faithfulness, almost-C structure and duality, the disc extension theorem, qBC full faithfulness and the height–rank formula. No Check was added to Lean and no stand-in or padding declaration was introduced.
- Dependency command: exit 0, exact output below. There is no UPWARD, CYCLE or moved line.

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

- Citation resolver: exit 0; cross-roadmap citations found nowhere: None; Lean names found nowhere: None. Its stated lack of library-pin checking was handled by opening the local pinned files separately.
- Final whitespace check: `git diff --check` exited 0. The report covers all 62 numbered targets, both finding headings are present, source keys are unique, and no machine path occurs in the authored text.
- No gate failures were supplied with this job. No tooling, merge-order, metadata, source-manifest or design-plan edit was needed.

## Supplier, ownership and pinned-library checks

Read the main READMEs of AlgebraicVectorBundles and PerfectoidSpaces for shape. Used `roadmaps grep` by the objects (continuous semilinear representations, qBC and period-valued height), and `roadmaps show` to inspect the supplied indexed open heads. The package's own README was read throughout. No new construction or ownership move is needed for these two Check repairs.

| Citation | Resolved mathematical owner and section |
| --- | --- |
| VectorBundlesAndIsocrystals | Layer 5: all 18 named headings in the supplier contract resolve, including sympathetic Vector Spaces, presentations, Dimension, curvature, tilted heart, Le Bras equivalence, HN decomposition, filtration, Artinian property, morphism calculus and period-module calculus. Its finite-length vanishing contract explicitly distinguishes the missing bounded-image argument. |
| PadicPeriodRings | §§1.1–1.2 give the completion action and fixed field; §§1.5, 2, 4.1–4.3 give the stated periods, topologies, general-base twist invariants and structure maps. The corrected twist Check uses precisely these invariants. |
| PadicHodgeTheory and FiniteFlatGroupsAndIntegralPadicHodgeTheory | §4.4 extends rational Sen theory to arbitrary finite-dimensional semilinear C-representations; §R07.P7.2 supplies labelled rational operators. Neither gives the continuous rigidity theorem as a duplicate target. |
| LocallyAnalyticDistributions | §§0.0–0.3 and Layer 1 resolve the named left-heart, completion, tensor, functional-extension, strict-limit and distribution interfaces. The compact-type extension paragraph retains its finite-K scope; this package's §4.6 supplies its C extension. |
| ArithmeticGaloisRepresentations | §1.1 supplies continuous finite-dimensional representations; it does not construct the Banach ambient category or a competing SemilinearRep. |
| ArithmeticGaloisDuality | §R02.1.3 and §D7.4 resolve rationalization and local Tate duality; §R02.2.1 is explicitly about discrete-coefficient Hochschild–Serre. |
| PerfectoidSpaces and PerfectoidTowers | Main's P1, P3, P6 and the tower head's P9.6 resolve the criterion, almost purity, pro-étale calculus and almost/function descent. The tower contract is over the discretely valued base, and §3.4 keeps that base ℚ_p. |
| AlgebraicVectorBundles | Main's Scope and ownership and Layers 1–2 resolve the pullback, monoidal and internal-Hom boundary. |
| CstConjectureForDaggerVarieties and CohomologyComparisons | The former's ownership and supplier contracts explicitly import this package's TVS, Pairs, qBC and height direction. The latter's §§4.8–4.11 retain the named general-base comparison scope. Both remain consumers. |

The supplied overlaps data has no competing revision, dropped cited id or id defined only by an open revision. Its five closest heads were inspected: CstConjectureForDaggerVarieties, VectorBundlesAndIsocrystals, PadicHodgeTheory, PadicPeriodRings and LocallyAnalyticDistributions. Their ownership agrees with the boundaries above. No declaration name or section id changed, so downstream citations require no migration. The open-head ownership search was performed, rather than assumed from the preceding review.

The pins match the content manifest: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. Opened all supplier declarations at the README's pinned file locators. In particular, TopModuleCat at Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean:41 has topological addition and continuous scalar multiplication, with no completeness or separation field; Submodule.torsionBy at Mathlib/Algebra/Module/Torsion/Basic.lean:177 is the scalar-multiplication kernel; BDeRhamPlus and BDeRham at Mathlib/RingTheory/Perfectoid/BDeRham.lean:75 and :88 are ring constructions, without the required period topology or Galois action. Completion.map at Mathlib/Topology/UniformSpace/Completion.lean:477 is the native extension used by the statements. These definitions do not make the two headline theorems tautologies.

Opened the near-match files for ContinuousSemilinearMapClass (Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean:79), intermediate-field dimension transport (Mathlib/FieldTheory/IntermediateField/Algebraic.lean:54), discrete condensed full faithfulness (Mathlib/Condensed/Discrete/Module.lean:145), and finite-Galois semilinear descent (TauCeti/FieldTheory/Galois/SemilinearDescent.lean:17). They concern maps, dimension transport, discrete modules or finite-Galois descent, respectively; none states Fontaine's continuous infinite-Galois rigidity or the fundamental extension theorem. Object searches in both pins found no duplicate headline or sympathetic TVS/qBC carrier.

## Maintainer notes

Only the README's twist Check, two related coefficient passages and the new coefficient Check changed. Suggested.lean is unchanged and remains the acceptance test with a real structure and two substantive admitted headlines. All ten manifest entries already record certified cached legal sources; the findings require no new reference or missing-text request.

The pre-existing gap:G-HOM remains recorded with matching slug, supplier, section and uniform-bound requirement in Exact supplier contracts and design/plan.json. It is still a prerequisite for the Layer 6 bounded-factorization and localization arguments. The present repairs neither settle that supplier gap nor introduce another one. The normed descent, non-nuclear/nonseparable comparisons and VS-to-sheaf transport remain construction targets, not consequences certified by this elaboration or these test instances. No commits or external writes were made.
