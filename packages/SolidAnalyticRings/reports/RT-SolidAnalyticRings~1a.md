<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/943#issuecomment-6372325967 -->
Red team round 1 pass a (codex) of 3ac1b2b

Verdict: needs_changes

1. **F01** (P3) Zero coefficients invalidate two negative-control Checks

   **Location:** packages/SolidAnalyticRings/README.md:583 and :615: “The family Σ^(−n)G_A has no common lower bound”; “the tails never become more connective”.

   **Claim:** The displayed families violate a uniform lower bound, or have realization tails whose connectivity fails to increase, for the standing connective coefficient algebra A.

   **Witness:** A=0 is allowed (README:321,485). Then G_A=0, every Σ^(−n)G_A and Σ^(−n)A is 0, and every realization tail is 0. All have every lower bound.

   **Exact repair text:** Replace the Check at line 583 with: “For A=δ𝕊, π_(−n)(Σ^(−n)G_A)=∏_ℕℤ≠0, so the family has no common lower bound. For A=0 every term is 0 and any lower bound works.” Replace the Check at line 615 with: “For A=δ𝕊, take the split simplicial object with normalized term Σ^(−n)A in degree n and zero normalized differentials. Every suspended layer is A, with π₀=ℤ. The realization tails retain nonzero π₀, so their connectivity does not increase. For A=0 every layer and tail is 0.”

   **Retest:** At A=0 both repaired Checks give zero in every degree and make no nonvanishing assertion. At A=δ𝕊 the first has nonzero degree −n for arbitrarily large n; the second has π₀ of its d-th tail equal to ⊕_(n>d)ℤ, hence nonzero.

## Verified sound

All 801 README lines and all 132 Suggested.lean lines were read. The audit below records all seven declarations (five definitions and two theorems), all 27 numbered targets, all 63 API bullets and all 99 bullet Checks. Twenty-nine distinct mathematical source locators were verified, plus AS contextual metadata; 18 grouped cross-roadmap supplier citations and the HabiroRings consumer contract were resolved. The two failing Checks are R01; the other 97 agree on the recorded instances. No additional P1 or P2 finding was established.

The seven supplied elaborated signatures were compared with §1.5 and the source. No dropped binder or universe mismatch was found. No Lean command was run. The five definitions are needed by the two retained headlines; neither theorem is padding. Both declared supplier gaps have matching slugs and precise quantified contracts in the README and design plan.

The dependency gate exited 0:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. The reviewed head is 3ac1b2b. The package diff against origin/main is confined to packages/SolidAnalyticRings/; no package source file was edited during this review.

### Declaration and context audit

All seven declarations are in `TauCetiRoadmap.SolidAnalyticRings`, in the noncomputable Layer 1 section. There are no section variables. The first six have no additional hypothesis binders; all use the native universe-zero light category. The last theorem explicitly binds `[HasDerivedCategory LightCondAb]`. I read the worker-provided elaborated signatures and compared each with the source; I did not rerun elaboration. No type or binder was changed.

| Declaration; Suggested.lean line | Section and effective context | Instances and computed values | Result; change |
| --- | --- | --- | --- |
| natShift; 88 | §1.5; native C→C, no variables | 0↦1, 1↦2, ∞↦∞; a neighborhood omitting 0,…,r has inverse image omitting at most 0,…,r−1 | Correct; none |
| inftyPoint; 94 | §1.5; native PUnit→C | The sole point maps to ∞; its composite with natShift is ∞ again; a constant map to 0 instead composites to 1 | Correct marked point; none |
| nullSeq; 98 | §1.5; LightCondAb | Point value is (⊕_(n∈ℕ)ℤ⊕ℤ[∞])/ℤ[∞]=⊕_ℕℤ; reducing the singleton gives 0; unreduced C retains ℤ[∞] | Genuine cokernel; none |
| nullShift; 102 | §1.5; nullSeq→nullSeq | Class [0]↦[1], [1]↦[2], [∞]=0↦0; precomposition sends e₁ to e₀ | Correct variance; none |
| IsLightSolid; 110 | §1.5; ObjectProperty LightCondAb | On ℤ, inverse of 1−σ* sends e₁ to e₀+e₁; on 0 the zero self-map is the identity; on ℝ the harmonic sequence has no null tail-sum solution | A real predicate with a negative control; none |
| isLightSolid_reflective_and_generator; 115 | §1.5; no extra binders | Reflection sends 0, ℤ, ℝ to 0, ℤ, 0; for G=∏ℕℤ, reduction mod 2 sends (a_n) to (a_n mod 2), surjectively; Hom(G,ℤ/2)=⊕ℕ𝔽₂. For Q=ℤ_p/δℤ_p, Q(*)=0 but [pⁿ]∈Q(C) is nonzero, separating G from the wrong generator ℤ | RC 3.2.4(2),(12); not a one-tactic consequence of the predicate; none |
| derivedLightSolid_isRightAdjoint; 125 | §1.5; explicit arbitrary chosen ordinary derived category | ℤ[1] has H⁻¹=ℤ and other H=0, so its reflection unit is invertible; 0 stays 0; ℝ[0] has non-solid H⁰ and is killed by derived solidification | RC 3.2.4(5),(6); not a definition or a pinned reflection theorem; none |

The five definitions are used transitively by both retained theorems. Neither theorem is a Check, a small computation, or an immediate consequence of a pinned lemma. No padding deletion is warranted. Every declared name occurs in README §1.5. Imports, namespace, declaration documentation, `theorem` spelling, and absence of sorry-valued data and options were checked.

### Headline coverage

The README has 27 numbered target sections, rather than individually bold target labels. The summary and sections identify these headline families: discrete spectral embedding (§1.2); light abelian and derived reflection, generator and tensors (§1.5); homotopy detection/completeness (§2.1); spectral reflection and measure formula (§2.2); Hℤ comparison and detection (§2.3); compact spectral generator (§2.4); product tensor (§3.1); split-tower tensor (§3.3); balancing/scalar limits (§3.4); countable interchange (§4.1); null families and all-degree naturality (§§5.3–5.4); bounded resolutions (§6.1); quotient connectivity (§6.2); realization (§6.3); p-complete comparison (§6.4); analytic scalar extension (§7.2); summability and discrete Huber pairs (§7.3); and integer measure/module comparison (§7.4).

The two ordinary universe-zero reflection/generation statements are present. The remaining spectral, enhanced tensor, and larger-universe headline families are individually named in the module documentation with their missing carriers. The searches at the pins found ordinary light sheaves and ordinary derived categories, but no solid spectral hypersheaf category or concrete stable-spectrum carrier. No absent headline can be recovered merely by a scalar predicate, a profile predicate, or replacing the sphere with integer complexes. The ordinary derived category's existence is correctly distinguished from an enhanced monoidal derived category.

### Target-by-target mathematical audit

Each row gives a genuine input and the outputs of the constructions being compared. General proof-route checks are in addition to these finite witnesses; agreement on examples alone is not treated as a proof.

| Target; README line | Instances and values computed on the two sides | Result; change |
| --- | --- | --- |
| §1.1 ambient hypersheaves; 85 | ∅ gives 0; two points give X(*)² and free object 𝕊²; finite free tensor ranks 2×3 give 𝕊⁶ on both sides. On C at *, free π₀=⊕_Cℤ, not ∏_Cℤ | Free/evaluation, descent and tensor directions agree; none |
| §1.2 discrete embedding; 111 | X=0 gives unit 0→0; X=𝕊⊕Σ𝕊 gives π₀=ℤ and π₁=ℤ/2⊕ℤ before and after δ. On ℤ_p, id has infinite image, whereas a locally constant map has finite image | Adjunction and failure of limit preservation separated; none |
| §1.3 marked null object; 135 | Reduced singleton=0; N(*) has π₀=⊕ℕℤ; (1−σ*)e₁=e₁−e₀ and (1−σ*)(e₀+e₁)=e₁. Splitting sends [∞] back to 1 | Correct retract and sign; native Type 0 limitation retained; none |
| §1.4 solidity; 161 | Hom(N,0)=0; for δHℤ the finite-tail inverse exists; N(*)=⊕ℤ versus (L■N)(*) with π₀=∏ℤ, distinguished by (1,1,…) | Both test formulations agree by tensor–Hom; none |
| §1.5 integer theory; 185 | Measures on ∅,*,2,C are 0,ℤ,ℤ²,ℤ×∏ℕℤ. ℤ/2⊗ᴸ■∏ℤ has π₀=∏𝔽₂, π₁=0; ℤ/2⊗ᴸ■ℤ/2 instead has π₀=π₁=𝔽₂ | Light hypotheses and flatness match RC; none |
| §2.1 homotopy structure; 235 | ΣHℤ has π₁=ℤ, π₀=0; ℤ in cochain degree 2 has π₋₂=ℤ. Square-zero 𝕊⊕Σ𝕊 has π₀=ℤ, π₁=ℤ/2⊕ℤ | Does not identify heart data with a spectral algebra; none |
| §2.2 reflection/tensor; 259 | L■0=0; L■δ𝕊=δ𝕊; unit tensor gives M. The finite quotient tower of reduced C has ranks 0,1,2,… and limit ∏ℕ𝕊 | Connective measures and marked units agree; none |
| §2.3 Hℤ comparison; 285 | For p=2,3, H𝔽_p⊗_HℤH𝔽_p has π₀=π₁=𝔽_p, others 0; Σᵇ𝕊→ΣᵇHℤ gives ℤ→ℤ in bottom degree | Relative tensor and bounded-below detection agree; none |
| §2.4 generator/modules; 301 | G has π₀(*)=∏ℤ, π₁(*)=∏ℤ/2; G_0=0 and Mod_0=0. On a two-coordinate retract, (1,0)e₁₂e₂₁=(1,0), but (1,0)e₂₂=0 | Right End action and zero algebra correct; none |
| §3.1 product tensor; 337 | Empty I gives 0→0; sizes 2 and 3 give 𝕊⁶→𝕊⁶ with coordinate projections; suspended swap multiplies the bottom generator by −1 | Countability and Koszul sign retained; none |
| §3.2 split towers; 353 | For P_n=𝕊^(n+1), P₀ rank 1 plus n rank-one kernels has rank n+1; constant sphere gives sphere, zero tower gives 0. Multiplication 2 has no section since 2b≠1 for integer b | Split hypothesis rules out Moore/unsplit towers; none |
| §3.3 independent towers; 379 | Growing ranks give 2·3=6 at (1,2); a diagonal stage r≥max(m,n) maps to (m,n); constant rank-one limits tensor to 𝕊 | Initial/cofinal inverse-limit direction correct; none |
| §3.4 balancing/dualizable change; 395 | For 𝕊[t], absolute π₀=ℤ[t₁,t₂], balanced π₀=ℤ[t] with both variables↦t. Rationalizing ∏ℤ omits (2⁻ⁿ), while ∏ℚ contains it | Balancing valid; limit exchange has a real hypothesis; none |
| §4.1 interchange; 421 | Empty K gives 0=0; point indices give identity. For merely filtered ℕ with F(n,k)=Hℤ for k<n, π₀ left=⊕ℤ and right=∏ℤ | Counterexample is outside ω₁-filtered hypothesis; gap retained |
| §4.2 independent bounds/towers; 437 | The family 1/(j+1)! lies in the independent product-union, but not a common denominator stage. Split truncations give lim ℤ^(n+1)=ℤ^ℕ and lim¹=0 | Independent indexing cannot be replaced by diagonal indexing; gap retained |
| §5.1 complete split datum; 463 | For t-adic spheres, B₀=0, B₁=𝕊, B₂=𝕊²; J_r≃A with marked map tʳ, and lim B_r=A. For A=0 all objects are 0 | Completeness is data; zero scalar does not mean underived quotient; none |
| §5.2 profiles/block maps; 491 | f(j)=j has r-element sublevel at r; zero profile has infinite sublevel at 1. min(f,g) is proper; inf_k max(j−k,0)=0 is not. Two duplications produce four outputs | Filtered but not ω₁-filtered; no profile interchange used; none |
| §5.3 null-family equivalence; 527 | (tʲ) has r surviving singleton blocks mod tʳ; (1)_j has infinitely many mod t. Two nonempty singleton blocks give A² on both sides; one infinite block gives ∏ℕA on both | Blockwise uniform decay preserved; none |
| §5.4 homotopy/naturality; 543 | Negative degrees=0; π₁ of formal spheres=∏ℕℤ/2, and (ηtʲ) mod t² leaves η,ηt. Fold gives (1−t)⁻¹≡1+t mod t² | Nonzero higher sphere stem and finite reductions retained; none |
| §6.1 resolutions; 571 | Constant resolutions of 0, ΣᵇG_A and ⊕_IΣᵇG_A realize to the same objects, with π_k=0 for k<b; for A=δ𝕊, Σ^(−n)G_A has nonzero π_(−n); for A=0 all these groups vanish | The resolution theorem survives; negative-control Check needs R01 |
| §6.2 quotient completion; 587 | Scalar 1 gives 0; scalar 0 gives M⊕ΣM. For Hℤ and 2ʳ, lim H(ℤ/2ʳ)=Hℤ₂ and π₋₁=0; ideal tower instead gives π₋₁=ℤ₂/ℤ | Surjective bottom quotient maps justify the sharp bound; none |
| §6.3 realization; 603 | Normalized degree n contributes ΣⁿN_n, hence lower bound b+n. First omitted layer has bound b+d+1. With N_n=Σ^(−n)A every layer is A: π₀=ℤ for A=δ𝕊, but all groups vanish for A=0 | The comparison theorem survives; negative-control Check needs R01 |
| §6.4 prime completion; 619 | H𝔽_p/pʳ=H𝔽_p⊕ΣH𝔽_p, transition diag(1,0), limit H𝔽_p. Completed sphere unit has π₀=ℤ₂ or ℤ₃, not ℤ | Completed unit and arbitrary-coproduct gap edge retained; none |
| §7.1 analytic structures; 657 | Full category: L=id and L(A)=A; zero category: L(A)=0, so completed iff A=0. ⊕ℕHℤ is not perfect | Both directions of completedness and negative model tested; none |
| §7.2 analytic scalar change; 683 | Identity structures give M; target zero category gives 0 on both paths. Hℤ→H𝔽₂ derived pushout gives π₀=π₁=𝔽₂; non-pushout terminal H𝔽₂ gives H𝔽₂ on both paths | Transitivity needs compatibility, not pushout or kernel generation; none |
| §7.3 summability/pairs; 713,715 | Empty/zero/one tests give all solid modules. ε²=0 gives inverse 1+εσ*. With f=1/p on ℚ_p, pⁿ−p⁻¹pⁿ⁺¹=0 and b₀=1. For R[T], εT is integral when ε²=0 | Noncompleted and nonreduced cases agree; none |
| §7.4 measures/static modules; 755 | HB for topological ℚ_p has π₀=B and other π=0, but section pⁿ at C is absent from δB(*). For B=𝔽₂, free B-module on G has degree-zero ∏𝔽₂ and no π₁ | Static/discrete and absolute/relative tensors remain distinct; none |

### All README Checks recomputed

There are 99 bullet Checks. The line identifies the individual Check, including multi-example bullets. Each row records actual values; none uses “checked” as its evidence. The two zero-algebra failures are R01; the other 97 bullet Checks agree on the recorded instances.

| README line / section | Instance and computed values | Result |
| --- | --- | --- |
| 103 / 1.1 | Empty cover forces M(∅)=0; constant nonzero presheaf has value X≠0 | Discriminates |
| 105 / 1.1 | M(2)=M(*)×M(*); free object=𝕊⊕𝕊 | Agrees |
| 107 / 1.1 | π₀𝕊[C](*)=⊕_Cℤ, at 2=(⊕_Cℤ)²; all-one vector has infinite support | Discriminates |
| 127 / 1.2 | δ0=0 and unit component=1_0 | Agrees |
| 129 / 1.2 | π₀(𝕊⊕Σ𝕊)=ℤ; π₁=ℤ/2⊕ℤ | Agrees |
| 131 / 1.2 | lim_r C(T,ℤ/pʳ)=C(T,ℤ_p); id on T=ℤ_p has infinite image; locally constant maps on compact T have finite image | Discriminates |
| 153 / 1.3 | cofib(𝕊→¹𝕊)=0; unreduced singleton free object=𝕊 | Discriminates |
| 155 / 1.3 | σ*e₁=e₀; difference=e₁−e₀; difference of e₁+e₀=e₁ | Agrees |
| 157 / 1.3 | Wrong right shift gives e₂; difference would be e₁−e₂ | Discriminates |
| 177 / 1.4 | Hom(N,0)=0; 1_0−0=1_0, invertible | Agrees |
| 179 / 1.4 | π₀δ𝕊=ℤ, π₁δ𝕊=ℤ/2; π₁Hℤ=0 | Discriminates |
| 181 / 1.4 | π₀N(*)=⊕ℕℤ; reflected point π₀=∏ℕℤ; (1,1,…) belongs only to second | Discriminates |
| 209 / 1.5 | Shift values (0,1,∞)↦(1,2,∞); marked composite=∞, whereas marking 0 would composite to 1 | Discriminates |
| 211 / 1.5 | Null integer sequences have finite support; (1−σ*)(e₁+e₀)=e₁; opposite-shift difference=e₁−e₂ | Agrees |
| 213 / 1.5 | Free measures at ∅,*,2 give 0,ℤ,ℤ²; at C give ℤ×∏ℕℤ; reduced part=∏ℕℤ | Agrees |
| 215 / 1.5 | Tensor ranks=2·3=6; empty factor gives 0; countable×countable gives ∏_(ℕ²)ℤ with higher Tor=0 | Agrees |
| 217 / 1.5 | Kernel of ×2 on ∏ℤ=0; cokernel=∏𝔽₂. Kernel of ×2 on 𝔽₂=𝔽₂, so Tor₁(𝔽₂,𝔽₂)=𝔽₂ | Discriminates |
| 219 / 1.5 | H⁻¹(ℤ[1])=ℤ; harmonic partial sums grow without bound, but x₀−x_(N+1)→x₀ for a null solution | Discriminates |
| 221 / 1.5 | Q(*)=ℤ_p/ℤ_p=0; pⁿ→0 has infinite image on C and stays non-locally-constant after a surjective compact cover, so [pⁿ]≠0 in Q(C) | Finite measures do not generate |
| 251 / 2.1 | π₁ΣHℤ=ℤ, π₀=0; cochain degree 2 corresponds to π₋₂=ℤ | Agrees |
| 253 / 2.1 | π_k0=0 for every k, hence all upper and lower bounds | Agrees |
| 255 / 2.1 | π₀(𝕊⊕Σ𝕊)=ℤ, π₁=ℤ/2⊕ℤ; square-zero ideal has product 0 | Discriminates from heart |
| 277 / 2.2 | L■0=0 and L■(0⊗M)=0 | Agrees |
| 279 / 2.2 | L■δ𝕊=δ𝕊; unit tensor gives M | Agrees |
| 281 / 2.2 | Continuous homomorphisms ∏ℤ→𝔽₂ use finitely many coordinates, giving ⊕ℕ𝔽₂. Abstract dual of 𝔽₂^ℕ has size 2^(2^ℵ₀) | Discriminates |
| 293 / 2.3 | Hℤ corresponds to ℤ[0], with π₀=H⁰=ℤ | Agrees |
| 295 / 2.3 | Tensor resolution [ℤ→pℤ] with 𝔽_p gives [𝔽_p→0𝔽_p]; homology 𝔽_p in degrees 0,1 for p=2,3 | Agrees |
| 297 / 2.3 | H_i(BΣ₂;𝔽₂)=𝔽₂ for each i≥0; animated 𝔽₂[x] has π_i=0 for i>0 | Discriminates |
| 317 / 2.4 | π₀G(*)=ℤ^ℕ includes all-one vector | Agrees |
| 319 / 2.4 | Each fixed coordinate of e_n is eventually 0, yet e_n≠0 for every n | Discriminates product/discrete topology |
| 321 / 2.4 | A=0 gives free G_A=0; unit axiom forces every 0-module to be 0 | Agrees |
| 323 / 2.4 | (1,0)e₁₂=(0,1), then times e₂₁=(1,0); times e₂₂ initially gives (0,0) | Right action verified |
| 345 / 3.1 | Empty product=0; 0⊗■G=0; empty Cartesian index gives 0 | Agrees |
| 347 / 3.1 | Six basis pairs; coordinate (1,2) takes that tensor basis to 1 and the other five to 0 | Agrees |
| 349 / 3.1 | Degree (1,1) symmetry=(-1)^(1·1)=−1; degree (0,0) symmetry=+1 | Agrees |
| 371 / 3.2 | Zero tower limit=0; identity tower on 𝕊 has all kernels 0 and limit 𝕊 | Agrees |
| 373 / 3.2 | Stage ranks 1,2,3; consecutive differences each 1 | Agrees |
| 375 / 3.2 | Any section would give b∈ℤ with 2b=1; no such b | Excludes unsplit case |
| 387 / 3.3 | Constant tower tensor: 𝕊⊗■𝕊=𝕊; double limit also 𝕊 | Agrees |
| 389 / 3.3 | Stage (1,2) has rank (1+1)(2+1)=6 | Agrees |
| 391 / 3.3 | In A/(t), t·1=0, hence s(t·1)=0; in A, t·s(1)=t≠0 | Discriminates linearities |
| 403 / 3.4 | A=𝕊 makes enveloping scalar 𝕊⊗𝕊=𝕊; both expressions=X⊗■Y; X=0 gives 0 | Agrees |
| 405 / 3.4 | Absolute polynomial variables independent; multiplication sends t₁↦t, t₂↦t, so balanced ring=ℤ[t] | Agrees |
| 407 / 3.4 | An element in (∏ℤ)⊗ℚ has one denominator d; valuations of 2⁻ⁿ tend to −∞, so no such d works | Discriminates |
| 429 / 4.1 | K=∅ gives both sides 0; J=* gives lim_K F on both sides | Agrees |
| 431 / 4.1 | At n, finite product=ℤⁿ; colimit=⊕ℕℤ; coordinatewise colimits give ∏ℕℤ; all-one lies only in latter | Valid negative control |
| 433 / 4.1 | K=* gives colim_J F→¹colim_J F | Agrees |
| 445 / 4.2 | Independent stage n_j=j+1 contains 1/(j+1)!; for fixed n, denominator (j+1)! fails to divide n! for sufficiently large j | Discriminates |
| 447 / 4.2 | Product of zero groups=0; empty product=terminal group=0; colimits also 0 | Agrees |
| 449 / 4.2 | Prefix projection ℤ^ℕ→ℤ^(n+1) has zero-extension section; 1−shift is onto; cokernel lim¹=0 | Agrees |
| 483 / 5.1 | t-adic stages have bases 1,…,t^(r−1); ranks 0,1,2; quotient by t extracts constant coefficient and is 𝕊 | Agrees |
| 485 / 5.1 | Every module over zero algebra is zero; fibers and limits of these diagrams=0 | Agrees |
| 487 / 5.1 | π₀(𝕊/p)=ℤ/p, whereas π₀ of finite sphere sum=ℤ^r | Excludes wrong datum |
| 513 / 5.2 | Sublevel of j at r is {0,…,r−1}; sublevel of 0 at r=1 is ℕ | Discriminates |
| 515 / 5.2 | Each empty internal product is 0; external product of these zero objects=0 | Agrees |
| 517 / 5.2 | A common target g satisfies g(j)≤max(j−j,0)=0; thus g=0 is not proper | Discriminates filteredness |
| 519 / 5.2 | Identity support={j}; zero support=∅; quotient maps respectively identity and 0 | Agrees |
| 521 / 5.2 | Union of supports {4j,4j+1} and {4j+2,4j+3} has four entries | Composition verified |
| 523 / 5.2 | t^(j+1)x=tʲ(tx); tʲ is not divisible by t^(j+1) in ℤ[[t]] | Inclusion direction verified |
| 535 / 5.3 | For (tʲ), residues vanish for j≥r; for (1)_j, every residue mod t is 1 | Discriminates |
| 537 / 5.3 | Choose f(0)=f(1)=0 and f(j)=j for j≥2; both surviving blocks are J₀=A, so product=A² | Agrees |
| 539 / 5.3 | Only block 0 nonempty and f(0)=0 gives ∏ℕJ₀=∏ℕA; no inner decay | Agrees |
| 551 / 5.4 | π_kA=π_kJ_r=0 for k<0; filtered product formula yields π_kΛF=0 | Agrees |
| 553 / 5.4 | π₁A=(ℤ/2)[[t]]; ηt⁰ and ηt¹ survive mod t², others vanish | Agrees |
| 555 / 5.4 | Inputs 0 and 1 survive mod t²; their duplication supports are {0,1} and {2,3} | Agrees |
| 557 / 5.4 | Fold mod t² gives 1+t; (1−t)(1+t)=1−t²≡1; infinite original support excludes the uncompleted sum | Discriminates |
| 579 / 6.1 | All terms zero; realization=0 | Agrees |
| 581 / 6.1 | Constant object realization=M; π_kΣᵇG_A=0 for k<b, also for arbitrary coproducts | Agrees |
| 583 / 6.1 | A=δ𝕊 gives π_(−n)=∏ℤ≠0; A=0 instead gives π_k=0 for all k,n and every uniform bound | False as written; R01 |
| 595 / 6.2 | cofib(1_M)=0 at every stage; limit=0 | Agrees |
| 597 / 6.2 | cofib(0_M)=M⊕ΣM; for M=Hℤ, π₀=π₁=ℤ | Discriminates derived quotient |
| 599 / 6.2 | lim ℤ/2ʳ=ℤ₂, lim¹=0; ideal tower lim=0 and lim¹=ℤ₂/ℤ | Agrees |
| 611 / 6.3 | Constant simplicial M realizes to M; both completion paths give ΛM and the identity | Agrees |
| 613 / 6.3 | Degree-one layer=ΣM; lower bound b+1 both before and after Λ | Agrees |
| 615 / 6.3 | ΣⁿΣ^(−n)A=A; A=δ𝕊 gives nonzero π₀ tails; A=0 gives zero tails with every connectivity bound | False as written; R01 |
| 637 / 6.4 | Completed sphere point π₀=lim ℤ/2ʳ=ℤ₂; uncompleted sphere π₀=ℤ | Discriminates units |
| 639 / 6.4 | At p=3, π₀=ℤ₃ and 1↦1 | Agrees |
| 641 / 6.4 | ℤ_p⊗■ℤ_p=ℤ_p; resolution [ℤ_p→pℤ_p] gives Tor₁(𝔽_p,𝔽_p)=𝔽_p | Discriminates relative inputs |
| 643 / 6.4 | For r≥1, quotient has two summands; transition (1,0); constant first limit=H𝔽_p, zero-transition second limit=0 | Agrees |
| 675 / 7.1 | Full inclusion=id, reflector=id, unit A→A | Agrees |
| 677 / 7.1 | Zero reflector sends A↦0; A→0 is equivalent iff A=0 | Both directions agree |
| 679 / 7.1 | π₀⊕ℕHℤ=⊕ℕℤ is not finitely generated, hence object not perfect | Discriminates |
| 701 / 7.2 | Tensor and scalar extension take zero to zero, then reflection sends zero to zero | Agrees |
| 703 / 7.2 | Zero complete category has tensor unit 0; its π₀=0≠ℤ | Discriminates |
| 705 / 7.2 | H𝔽₂⊗ᴸ_HℤH𝔽₂ has π₀=π₁=𝔽₂, other groups 0; both extension paths give it | Agrees |
| 707 / 7.2 | The pushout of three Hℤ terms is Hℤ; either displayed extension to terminal H𝔽₂ gives H𝔽₂ | Discriminates unnecessary hypothesis |
| 709 / 7.2 | Intermediate kernels=0; terminal kernel=all modules; terminal reflection makes both paths 0 | Discriminates unnecessary hypothesis |
| 737 / 7.3 | F=∅ has no test; f=0 gives identity; f=1 gives the already invertible solid test | Agrees |
| 739 / 7.3 | σ*(e₁+fe₀)=e₀; subtracting f times it gives e₁ | Sign verified |
| 741 / 7.3 | For p=2,3, b_n=pⁿ tends to 0 and b_n−p⁻¹b_(n+1)=0; b₀=1 | Nonzero kernel verified |
| 743 / 7.3 | (1−εσ*)(1+εσ*)=1−ε²(σ*)²=1; in characteristic 2 signs coincide without changing identity | Agrees |
| 745 / 7.3 | ℤ generated over ℤ by ∅ gives no new test; ℤ[T] generated by T gives precisely the T test | Agrees |
| 747 / 7.3 | On ℚ_p with T=p⁻¹ the test has nonzero kernel (pⁿ); empty-test membership true, T-test membership false | Distinguishes the two structures |
| 749 / 7.3 | (εT)²=0, so εT satisfies monic x² and is integral; its T coefficient ε≠0 excludes constants; inverse test=1+εTσ* | Agrees |
| 751 / 7.3 | Matrix action gives (1,0)e₁₂e₂₁=(1,0); (1,0)e₂₂=(0,0) | Right action verified |
| 763 / 7.4 | Integer measure on finite cardinalities 0,1,2 yields 0,ℤ,ℤ² | Agrees |
| 765 / 7.4 | In (∏O_E)[1/p] valuations have one lower bound; v_p(p⁻ⁿ)=−n has none. pⁿ→0 has infinite image on C, so not locally constant | Discriminates both boundaries |
| 767 / 7.4 | Reduction of ∏ℤ gives ∏𝔽₂ in degree 0; tensor of two 𝔽₂ over ℤ has additional degree-one 𝔽₂ | Agrees |
| 769 / 7.4 | θ(𝔽₂[x]) is static; free spectral symmetric degree two has H₁(BΣ₂;𝔽₂)=𝔽₂ | Discriminates |

### API, convention and boundary audit

These rows separately cover every API bullet. The effective hypotheses are those of its numbered section; there are no independent hidden Lean binders. The values below test directions and degeneracies, while the source and dependency records address the general assertions.

| API line | Instance; values on the compared sides | Result; change |
| --- | --- | --- |
| 93 | T=∅ gives Map(0,M)=0=M(∅); T=* gives Map(𝕊,M)=M(*) | Agrees; none |
| 95 | Identity and zero on δHℤ have point π₀ maps 1 and 0, respectively; they are not equal | Detection discriminates; none |
| 97 | Identity hypercover has constant cosimplicial value M(T), with totalization M(T) | Agrees; none |
| 99 | T=2,U=3 gives 6 free summands; T=∅ gives 0 on both sides | Agrees; none |
| 119 | Zero map on Hℤ has π₀ map 0 before/after δ; identity has map 1; ΣHℤ has π₁=ℤ on both paths | Agrees; none |
| 121 | X=Σ^(−2)Hℤ gives unit ℤ→¹ℤ in π₋₂ and 0→0 in other degrees | Agrees; none |
| 123 | Triple finite ranks 2,3,1 give rank 6 under both associations; transposition of degree-one factors gives −1 on both paths | Agrees; none |
| 143 | Two marked shifts send [n] to [n+2]; marked singleton cofiber stays 0 | Composition agrees; none |
| 145 | For M=Hℤ at *, evaluation C→ℤ at ∞ has kernel finitely supported sequences ⊕ℕℤ, equal to Hom(N,M)(*) | Fiber direction correct; none |
| 147 | b=e₁ gives (σ*b)₀=1 and (σ*b)₁=0 | Agrees; none |
| 149 | Lift 0,1,∞ to the larger universe: images remain lifted 1,2,∞; zero coefficients give zero free summand and zero lifting problem | No object/morphism universe substitution; none |
| 169 | M=0 gives zero mapping spectrum for every test; δHℤ has 1−σ* invertible, so its fiber and all tested mapping spectra are 0 | Tensor–Hom equivalence; none |
| 171 | Identity equivalence on δHℤ preserves the invertible tail operator; zero map δHℤ→0 has π₀ map ℤ→0 and is not an equivalence | No arbitrary-map invariance; none |
| 173 | For X=Hℤ the finite-tail inverse sends e₁ to e₀+e₁; X=0 gives the unique inverse on 0 | Agrees; none |
| 193 | Extension 0→ℤ→ℤ²→ℤ→0 has middle solid group ℤ²; Hom(ℤ,ℤ)=ℤ; empty limit/colimit=0 | Agrees; none |
| 195 | Reflection values 0,ℤ,ℝ are 0,ℤ,0; ℤ⊗■ℤ/2=ℤ/2 | Adjunction and unit agree; none |
| 197 | Complex ℤ[1] has only H⁻¹=ℤ and is selected; ℝ[0] has non-solid H⁰ and is rejected; RHom(0,ℤ[1])=0 | Both membership directions tested; none |
| 199 | Tensor ℤ[1]⊗ℤ[0]=ℤ[1] with only H⁻¹=ℤ, before/after inclusion; zero complex stays zero | Agrees; none |
| 201 | Finite quotients of C give ℤ^(n+1), limit ℤ×∏ℕℤ; finite singleton gives ℤ and misses nonzero Q with Q(*)=0 | Infinite generator hypothesis substantive; none |
| 203 | 2×3 gives ℤ⁶, empty×ℕ gives 0; countable×countable has π₀=∏_(ℕ²)ℤ and higher Tor=0 | Agrees; none |
| 205 | For B=𝔽₂, ×2 on ∏ℤ has kernel 0 and cokernel ∏𝔽₂; for B=0 both tensor and homotopy are 0 | Flatness boundary agrees; none |
| 243 | For ΣHℤ, τ_≤0=0 and τ_≤1=ΣHℤ; π₁ of the truncation map changes 0→ℤ exactly at the bound | Agrees; none |
| 245 | B=ℤ/3 gives π₀HB=ℤ/3 and π_k=0 for k≠0; B=0 gives zero spectrum | Agrees; none |
| 247 | M=ΣᵇHℤ gives π_(b+1)(ΣM)=ℤ=π_bM; other groups vanish | Shift sign correct; none |
| 267 | C=M=δHℤ gives identity precomposition on Map(M,M); C=0 gives zero mapping spectra | Adjunction direction correct; none |
| 269 | C=δHℤ has both reflection units inducing 1 on ℤ; C=0 gives the sole map 0→0 | Marked units agree; none |
| 271 | C=D=𝕊 gives Hom(𝕊,M)=M on both sides; C=0 gives zero | Agrees; none |
| 273 | For 2→*, basis elements each map to 1; induced integer measure map is (a,b)↦a+b on both presentations | Covariant direction correct; none |
| 309 | Reduced C at stage r retains first r coordinates; e_n maps to its coordinate if n<r and to 0 otherwise | Unit fixes product comparison; none |
| 311 | k=0 gives ∏ℤ; k=1 gives ∏ℤ/2; k<0 gives 0 | Every degree convention agrees; none |
| 313 | A=0 gives both mapping spectra 0; A=𝕊 gives Map(G,M) on both sides | Free/forgetful adjunction agrees; none |
| 361 | Projection 𝕊²→𝕊 and section x↦(x,0) compose to 1; multiplication 2 would require impossible 2b=1 | Definition discriminates; none |
| 363 | Identity tower map gives identity on each coordinate and on the limit; zero tower map gives zero on both | Agrees; none |
| 365 | n=0 gives P₀; growing ranks give 1+n; product of initial rank 1 and countably many rank-one kernels is ∏ℕ𝕊 | Initial factor retained; none |
| 367 | For projection ℤ²→ℤ, sections (x,0) and (x,x) produce coordinates (x,y) and (x,y−x); inverse change restores (x,y) and first projection is x | Independence is marked correctly; none |
| 471 | Identity of formal-variable datum preserves B₀=0,B₁=𝕊,B₂=𝕊² and lim=A; zero datum remains zero | Coherent data retained; none |
| 473 | r=0 gives marked map 1:A→A; r=1,s=2 gives ×t:J₂→J₁, then ×t to A equals ×t² | Direction/multiplication agree; none |
| 475 | M=A formal-variable example has unit A→lim B_r=1_A; zero M-map induces 0 at every quotient | Naturality agrees; none |
| 477 | Restrict t-adic tower to even exponents: lim A/t^(2r)=A=lim A/tʳ, with each coefficient unchanged | Cofinal direction correct; none |
| 479 | M=A gives A⊗_AB_r=B_r; M=0 gives 0; a=0 gives M⊕ΣM | Derived quotient retained; none |
| 501 | f(j)=j gives finite cardinal r at each r; f(j)=0 gives infinite cardinal at r=1 | Predicate discriminates; none |
| 503 | min(j,j+1)=j is a common target; countable minimum of max(j−k,0) equals 0 and is not proper | Agrees; none |
| 505 | Formal t tower gives ×t composed with ×t² equal ×t³; identity uses ×1 | Agrees; none |
| 507 | Identity support={j}; double duplication support={4j,4j+1,4j+2,4j+3} | Finite supports compose; none |
| 509 | One block I=∅ gives zero map with empty output support; I=* identity has support {0}; I=ℕ and formal A identifies block with G_A | Compactness is for the solid module, not abstract product group; none |
| 627 | X=H𝔽₂,H𝔽₃ gives inverse limit of (1,0) tower equal X, with identity on π₀ | Unit agrees; none |
| 629 | X=Y=completed sphere gives completed sphere; π₀=ℤ_p on both sides; X=0 gives 0 | Completed unit correct; none |
| 631 | Over Hℤ_p, H𝔽_p⊗H𝔽_p has degrees 0,1 equal 𝔽_p on both sides; all are p-complete | Relative comparison agrees; none |
| 633 | X=Hℤ[1/p] has zero quotient tower and reflector 0; X=H𝔽_p has reflector X and vanishing maps from every shifted p-inverted free object | Membership/reflection distinguished; none |
| 665 | Full and zero subcategories over Hℤ have coefficient reflections Hℤ and 0, respectively | Data determines distinct structures; none |
| 667 | Same identity inclusion has reflector id with unit id; replacing its unit by −id changes the marked comparison by −id | Unit marking substantive; none |
| 669 | Identity scalar restriction is identity; ℤ→𝔽₂→0 restricts the zero module to zero along either path | Composition agrees; none |
| 671 | Full structure has A→A invertible; zero structure has A→0 invertible exactly at A=0 | Both directions agree; none |
| 691 | Full structure unit=A; zero structure unit=0, even when A=Hℤ≠0 | Agrees; none |
| 693 | Identity algebra/structure gives Map(M,N)=Map(M,N); target zero category gives contractible mapping spaces on both sides | Adjunction agrees; none |
| 695 | Identity maps yield M on both paths; final zero structure yields 0 on both | Agrees; none |
| 697 | Hℤ,Hℤ,Hℤ with terminal H𝔽₂ yields H𝔽₂ on both paths although its initial pushout is Hℤ | Target completion and commutativity suffice; none |
| 723 | f=0 gives identity on internal Hom, hence every M local; f=p⁻¹ acting on ℚ_p has kernel pⁿ≠0 | Both directions discriminate; none |
| 725 | F=∅ gives L_FC=C and identity mapping comparison; C=0 gives 0 on both sides | Correct universal map; none |
| 727 | ∅⊂{T}, with T=p⁻¹ on ℚ_p: empty test accepts, T-test rejects; L_TL_∅=L_T | Inclusion direction correct; none |
| 729 | Identity scalar map keeps f unchanged; ℤ[T]→𝔽₂ sends T↦0, whose target test is 1 and all target modules restrict to T=0-local modules | Naturality agrees; none |
| 731 | f=0,d=1 gives inverse 1; f=ε,d=2 gives (1−εσ*)⁻¹=1+εσ*, product 1 | Nilpotent boundary including p=2; none |
| 733 | ℤ generated by ∅ adds no test; ℤ[T] generated by T gives T-test; integral εT has square 0 and adds an automatically invertible test | Discrete/general coefficient distinction retained; none |

| Convention or additional boundary | Computed witness | Result; change |
| --- | --- | --- |
| Universes, countability, empty tests | Finite partitions of C have finite ranks; r-fold truncation has rank r. An uncountable set of coordinates is not a countable I in §§3 or 5 | No uncountable extension inferred |
| Left modules/right endomorphisms | In S₃, (12)(23)=(123) and (23)(12)=(132); in Q₈, ij=k but ji=−k. Precomposition uses the first product, just as the matrix witness gives e₁₁ instead of e₂₂ | Noncommutative order retained |
| Homological/cohomological signs | Cochain ℤ in degree 2 has π₋₂=ℤ; after [1] the group is π₋₁=ℤ | Agrees |
| Tensor symmetry in small characteristic | Degree-one swap acts by −1 over ℤ, by 1 over 𝔽₂, and by 2 over 𝔽₃ | No inversion of 2 required |
| Product versus discrete product | e_n has each coordinate eventually 0 but is never the zero vector; continuous into ∏δℤ, not into δ(∏ℤ) | Comparison direction correct |
| Spherical polynomials | 1,t is a rank-two basis mod t², with t·t=0; free E∞ generator instead has symmetric-group homotopy | Different constructions separated |
| Quotient/ideal direction | a₀=1 gives B₀=0,J₀=A; a=0 gives cofiber A⊕ΣA. At r≥1 on H𝔽_p the p transition is diag(1,0) | Derived and marked data retained |
| Equal characteristic and ramification in §6.2 | For O=𝔽₂[[t]], lim O/tʳ=O and quotient transitions onto. For O=ℤ₂[π]/(π²−2), lim O/πʳ=O and π⁽ʳ⁺¹⁾-quotient→πʳ-quotient is onto | No identification of p with a ramified uniformizer |
| Nilpotent completion | For O=𝔽₂[ε]/ε² and a_r=εʳ, eventual quotient=M⊕ΣM, transition diag(1,ε); ε²=0 kills the second inverse limit, so ΛM=M | No regular-element hypothesis silently used |
| Geometric sum denominator | In ℤ[[t]], (1−t)(1+t+…)=1; modulo t² product with 1+t is 1 | Denominator invertible |
| Inseparability and nonreduced rings | The scalar operations accept the Frobenius map 𝔽_p(t)→𝔽_p(t), t↦tᵖ; a unit/free module extends to the target ring and tensor with 0 gives 0. ε²=0 tests already compute nonreduced behavior | No smoothness or separability hypothesis invoked |
| Inapplicable geometry/group hypotheses | No target quantifies over varieties, fans, ideals of places, or locally compact groups; no dimension/rank finiteness, good-prime, or quasi-separatedness premise is being omitted from such a theorem | These defect classes do not create extra targets |

### Resolved suppliers, ownership and proof routes

The content checkout and its origin/main both identify as a4a8652e46fe27e56355bbcf74579562b503fbc3. The manifest fixes Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, agreeing with the package. Read-only `roadmaps grep` and `roadmaps show` were used alongside direct reads of main and the supplied sibling folders. No code or issue text was executed as an instruction.

The following 18 grouped supplier citations were resolved. Locations in this table are supplier README locations; indexed `roadmaps show` adds one display-header line, which is excluded from the locations below.

| Supplier citation | Resolved repository-relative witness and retained boundary |
| --- | --- |
| GeneralizedCohomology G2.1–G2.7 | TauCetiRoadmap/GeneralizedCohomology/README.md:213–433: actual symmetric spectra, stable models, true homotopy and HA/module adapters; no replacement by ordinary derived groups |
| GeneralizedCohomology G3.8–G3.9 | TauCetiRoadmap/GeneralizedCohomology/README.md:785,878: coherent spectral towers, Milnor sequence and (p,id) quotient transitions; arbitrary degree and prime |
| StableHomotopyKTheory §5.13 | TauCetiRoadmap/StableHomotopyKTheory/README.md:1998: operadic/model comparison with positive-model hypotheses |
| StableHomotopyKTheory §§5.14–5.16 | TauCetiRoadmap/StableHomotopyKTheory/README.md:2029,2053,2078: HR-modules, unbounded cochains and π_k=H^(−k); relative HR tensor distinguished from absolute sphere tensor |
| StableHomotopyKTheory §§5.17–5.18 | TauCetiRoadmap/StableHomotopyKTheory/README.md:2090,2098: cellular/connective comparisons and coherent spectral carrier |
| EnhancedDerivedSheaves §§0.1–0.3 and E1.3 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429,441,455,549: ringed-site enhancement, replacements, tensor/Hom and all-degree derived mapping comparisons |
| EnhancedDerivedSheaves E0.4 and E0.8 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:211,376: stable operations and cardinal definitions; no full cardinal interchange theorem is asserted there |
| EnhancedDerivedSheaves E2:towers | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1294,1401: product–difference fiber and pro-zero conditions; coherent towers, not homotopy-category diagrams |
| EnhancedDerivedSheaves E2.1–E2.3 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:2071,2097,2125: named IsReplete.countableProduct_epi and IsReplete.milnor do exist; derived Postnikov comparison requires repleteness |
| EnhancedDerivedSheaves E2.6–E2.7 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:2293,2375: hypercovers, spaces and hypercompletion; hypercompleteness is not confused with automatic Postnikov completeness |
| EnhancedDerivedSheaves E3.2–E3.3 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1153,1203: accessible reflection, adjoints, exact colimit criteria and compact generation |
| EnhancedDerivedSheaves E5:abstract.2–E5:abstract.5 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1456,1494,1512,1570: modules/bar extension, supplied monoidal localization, stable structures and Barr–Beck. The solid specializations remain local targets |
| EnhancedDerivedSheaves E5:presentability.1–E5:presentability.2 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1597,1624,1660: compact objects, presentable operations and loop-tower stabilization; the declared cardinal-interchange extension remains necessary |
| EnhancedDerivedSheaves E5:spectra-comparison | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1842,1876: point-site module comparison and named symmetricSpectra_towerComparison; the sheafwise comparison is constructed in package §2.3 |
| EnhancedDerivedSheaves E5:animation.4 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1994,2012: θ and animatedModules_discrete for an ordinary discrete ring; not a statement identifying arbitrary static condensed B with B(*) |
| EnhancedDerivedSheaves E4.1 and E4.4 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:2569,2703: integer-derived completion and completed tensor; no ambient tensor-closure assertion for ordinary complete modules |
| VStackSheavesAndLisseCategories VS2.1 | TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:653,661,669: compact-Hausdorff integer solidity, reflection and tensor. These are different carriers from the light null-test category |
| VStackSheavesAndLisseCategories VS2.2 | TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:713,715,748,764: measures, common-presentation site transport, topological E coefficients and named ZSolidAnalytification.formalComplement |

The three supplied unresolved-name leads therefore are not missing suppliers: each is explicitly attributed to a roadmap target. They are not claimed as pinned library declarations.

The object search covered main active and completed folders, board packages, all 26 named sibling folders at the supplied heads, and the indexed roadmap search. The relevant overlap in the supplied siblings is HabiroRings: TauCetiRoadmap/HabiroRings/README.md:65–85 explicitly requests the light spectral contract, and §§2.6–2.12 exist at lines 525,551,585,611,631,666,691. Its factorial arithmetic and balanced scalar idempotence remain downstream; degrees of the first two factorial polynomials are 1 and 1+2=3. This package has no Habiro input edge. The generic bar and enhanced category theory are assigned to EnhancedDerivedSheaves, and the compact-Hausdorff measure theory to VStackSheavesAndLisseCategories. The additional light null-test carrier, spectral versions and comparison of those presentations therefore have a stated owner here. No duplicate fully qualified name of any of the seven Lean declarations was found.

The local proof order was checked section by section: §1.5's light integer theory precedes §2.1's homotopy test; §2.2's reflection precedes the Hℤ comparison and generator; §3.1 uses integer detection before split-tower tensor; §4.2, not §4.1, supplies the profile argument; §6.2 proves the bottom-degree quotient-surjectivity estimate before §6.3; §6.4 expressly adds §4.1 for arbitrary coproducts. The summability inversion argument in §7.3 is explicitly a target here, not a consequence claimed merely from existence of a reflector. No UPWARD or local proof cycle was found. The earlier repair report contains no item marked “not actionable in this package”; R01 is not a re-raised settled finding.

Both declared gaps have the same slug, supplier, and quantified needs sentence in design/plan.json and README:67,73. The spaces/spectra interchange is a single stabilization-compatible contract, not a request for unspecified categorical machinery. The light independent-union law is on the ambient abelian category; its solid restriction is constructed in §4.2. Searches found neither full contract already supplied at the pins or the cited supplier sections. No gap is reported as a defect.

### Pinned API and source evidence

All 32 named native carriers/declarations/instance kinds in the exact Mathlib contract were read at the pin. In particular:

- Mathlib/Topology/Category/LightProfinite/Basic.lean:42 defines the category as `CompHausLike` with total disconnectedness and second countability; :56 explicitly requires compactness and T2. The essentially-small instance is at :403, and Mathlib/Condensed/Light/Small.lean:30 is an ordinary sheaf equivalence.
- Mathlib/Condensed/Light/Module.lean:42 ties the ring, module, and light-site universes together; :85 specializes to ℤ and thus Type 0. Mathlib/Condensed/Light/Sequence.lean:20–22 fixes its ring in Type 0. The package does not claim that the internal-projectivity theorem at :302 is universe-polymorphic.
- Mathlib/Condensed/Light/AB.lean:31,35 supplies countable exact products and Grothendieck abelianness, but no AB6 law. Mathlib/Condensed/Light/Monoidal.lean:41,47,56 supplies ordinary monoidal, symmetric and closed structures, not spectral tensors.
- Mathlib/Condensed/Solid.lean:83–85 tests every profinite solidification map; its preceding coefficient warning is retained by the README. It is neither the null-test definition nor a constructed spectral reflection.
- Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean:242 takes a map B→A and returns ihom A→ihom B, confirming the contravariance used by nullShift. Mathlib/CategoryTheory/Preadditive/Projective/Internal.lean:41–47 means preservation of epimorphisms by internal Hom, not arbitrary sectionwise surjectivity; :61 transports retracts.
- Mathlib/CategoryTheory/Presentable/Finite.lean:49 and Mathlib/CategoryTheory/Generator/Basic.lean:545 mean filtered-colimit preservation by Hom and detection of morphism equality. Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74 and HomologySequence.lean:33 supply a chosen localization and integer cohomology objects; they do not supply the missing enhanced tensor.
- Mathlib/Condensed/Light/Epi.lean:104–109 retains a limit cone and epimorphic successive transitions. Mathlib/LinearAlgebra/FreeModule/PID.lean:97,102,138,298 retains CommRing, IsPrincipalIdealRing, IsDomain and a finite basis. The zero-module case has rank 0; the spectral lift of an integer retract is still requested locally.
- The free adjunction, discrete/evaluation adjunction, Nöbeling freeness, marked compactification and full-subcategory inclusion were read at their README-listed files and lines. The Tau Ceti object search found no matching spectral replacement; no Tau Ceti import is required by the seven declarations.

Twenty-nine distinct mathematical source locators were verified across the eight mathematical sources; AS was checked separately as contextual metadata. The count treats a theorem and its proof as one locator, and does not inflate repeated citations.

| Source | Locators read against cached text | Scope established |
| --- | --- | --- |
| W (3) | Paragraphs 2.1–2.3, pp.11–12; W line 437–475 | Light spectral definition, discrete embedding, solid reflection, p-complete comparison and generator |
| MW (2) | Paragraphs 4.1–4.2, p.41; MW line 1748–1776 | Spectral solidity and f-solidity of actual condensed coefficients |
| Q (1) | Lemma B.8 and proof, printed pp.79–80; Q line 3666–3712 | Arithmetic model; separate tower tensor, countable-sum and cardinal steps. General split hypotheses are explicit local extensions |
| Bosco (2) | Proposition A.3 and Lemma A.4 with proofs, pp.92–93; Bosco line 3459–3522 | Integer p-complete coefficients, bounded-above cochains and null-family model; not a direct proof for spectral/light carriers |
| RC (13) | Theorem 2.3.3, Definition 3.2.1, Theorem 3.2.4, Definition 4.0.1, Remark 4.0.3, Definition 4.1.1, Remark 4.1.2, Proposition 4.1.6, Example 4.6.4, Definition 5.5.1, Definition 5.5.4, Lemma 5.5.5, Proposition 5.5.6; RC line 537–574,732–898,1392–1521,2114–2145,3236–3305 | Light abelian reflection, flatness, analytic structures and discrete Huber-pair integral-generator invariance |
| CS (2) | Theorems 5.8 and 6.2, pp.35–36,43; CS line 1243–1257,1578–1609 | Compact-Hausdorff abelian/derived reflection and tensor, imported through VS2.1 |
| AG (5) | Definition 6.12, Proposition 6.14, Definition 12.1, Proposition 12.4, Remark 12.5; AG line 1361–1410,3014–3075 | Analytic measure axioms, completed categories and animated/derived transport |
| HTT (1) | Proposition 5.3.3.3 and proof, printed pp.394–395; HTT line 18705–18738 | κ-filtered spaces colimits versus κ-small limits; stabilization is the explicitly declared extension |
| AS (context only) | AS line 9–20,39–44 | Lecture identities and unendorsed/partly automated transcript status; no target rests solely on it |

All nine manifest keys correspond to the supplied legal cached texts. No new source was needed, no missing-reference request was created, and the package source manifest was not edited. The source misprints below were not copied into the package's mathematics: its shift witness subtracts the next coordinate, its Hom closure uses the actual solid target, and its scalar-extension proof starts with an ambient kernel object.

## Not verifiable

- No new Lean elaboration or proof build was run under the read-only instruction. All seven types were compared using the supplied elaborated-signature record; the review does not claim an independent build.
- The spectral, enhanced and larger-universe constructions are future targets. Their proposed arguments and inputs were audited, but their formal proofs do not yet exist at the pins. The two declared gaps remain conditional supplier contracts.
- RefinedTraceMethods, HigherHidaAndColemanTheory and LocallyAnalyticRepresentationsOfLocalGroups are named prospective consumers. Their authoritative open-head files were not among the supplied sibling checkouts, so ownership against those open pull requests was not checked. They supply no input to this package. All 26 supplied sibling folders were searched.
- No cited source was inaccessible: all nine manifest works were available in the legal cache. There is no missing-text request.

## Source issues

- **Misprint** in RC at proof of Theorem 2.3.3(3), printed p.12, RC line 555–556: the source says the compactification factor is the product of the naturals with the singleton infinity; it should be the union of the naturals with infinity; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(1), printed p.18, RC line 812: the source says the second difference subtracts the first-index coefficient from itself; it should be the first-index coefficient minus the second-index coefficient; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(4), printed p.19, RC line 866: the source says the null-sequence relation ranges over all integers; it should range over natural-number indices; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(7), printed p.19, RC line 874–875: the source says the inner Hom has target B and uses solidity of B; it should be C, the solid complex quantified in this argument; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5, printed p.19, RC line 876: the source says the subsequent derived comparison assumes properties (11) and (12); it should assume (12) and (13), as the proposition states; affects the proof.
- **Misprint** in RC at proof of Proposition 4.1.6, printed p.30, RC line 1514: the source says the kernel object is already in the complete category D(A); it should be an object of the ambient category D(A▷); affects the proof.
- **Misprint** in HTT at proof of Proposition 5.3.3.3, printed p.394, HTT line 18710: the source says the cofinal nerve map has target the category of spaces; it should have target I, the filtered category being replaced; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3ac1b2b61f52fe401866b898d1b60f6896acd6d3", "job": "RT-SolidAnalyticRings~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
