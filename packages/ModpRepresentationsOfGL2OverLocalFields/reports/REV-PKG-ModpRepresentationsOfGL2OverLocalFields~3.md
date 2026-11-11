<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13474#issuecomment-6790847192 -->
Review (codex) of 9a8ba56

Verdict: needs_changes

1. **F01** (P2) The Banach approximation headline is statable but absent

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/Suggested.lean:31`: “and its Banach version”; `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1030`–1034 states the existential approximation theorem.

   **Claim.** The Banach theorem cannot be stated because the pinned libraries lack Ord_B.

   **Witness.** `Mathlib/RepresentationTheory/Continuous/Basic.lean:55`, `:81`, `:541`, `:558` provide continuous linear actions, equivariant continuous maps and coinduction. The §2.6 conclusion quantifies over σ and a map; it never needs to mention Ord_B.

   I appended a native-carrier signature to a scratch copy of the unchanged file and elaborated it successfully at the pins. The only additional warning was the intended theorem's `sorry`. The complete tested signature is reproduced below. Its explicit continuity assumptions matter: `ContRepresentation` alone bundles continuous endomorphisms, not continuity in the group variable. The lower triangular subgroup is fixed by an equality; killing its unipotent radical expresses inflation from the torus. The lattice is open and bounded in a complete normed L-space. The residual representation is exactly Θ/ϖΘ, and is admissible and finitely presented using the package's existing predicates. There is no arbitrary predicate or sorry'd datum.

   **Exact repair.** Add the full §2.6 existential headline on these native carriers (or an equivalent formulation with the same hypotheses), with `sorry`, its README name, and a mathematical docstring. Remove the Banach theorem from the unavailable list. The smooth counit itself may remain there because its statement specifies Ord_B. Preserve all finite extensions F/ℚ_p with F≠ℚ_p and all primes.

   **Test of the repair.** For Θ=𝒪 with trivial action, take M=0: kernel rank 0, cokernel rank 1. For the induced lattice of a unitary character take M its rank-one lattice and the identity induced map: both errors have rank 0. The signature expresses both cases without imposing the conclusion as a hypothesis.

2. **F02** (P2) The growth characterization divides by a possibly zero dimension

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1254`–1256: “For `U` uniform” and “`[U : U^{p^r}]^{1/dim U}`”.

   **Claim.** This growth characterization applies to every uniform open subgroup allowed by the general p-adic Lie group definition.

   **Witness.** Take G=U={1}, V=k. Then dim U=0, grade_k(k)=0, dim_G V=0, and dim V^{U^{p^r}}=[U:U^{p^r}]=1 for every r. The displayed exponent contains 1/0.

   Even replacing division by a total operation does not fix the characterization: base 1 raised to every exponent is 1, so growth cannot distinguish exponent 0 from exponent 1. The actual supplier, `TauCetiRoadmap/CompletedCohomologyPartII/README.md:1402`, expressly assumes d>0; the package's own contract at lines 331–333 retains that condition and the target loses it.

   **Exact repair.** Keep canonical dimension defined for every p-adic Lie group. State the growth characterization for uniform U of positive dimension and nonzero V. Add the separate zero-dimensional case: admissibility gives finite-dimensional V, canonical dimension 0 for nonzero V, and constant invariants growth. Add G=U={1}, V=k as a negative control for the growth formula. This repairs the formula without narrowing the general definition.

   **Test of the repair.** For U=ℤ_p and V=k, the invariant dimensions are 1=p^{0r}; for V=C^∞(ℤ_p,k), they are p^r=p^{1r}. For U={1} the separate clause gives dimension 0 and constant value 1 without division.

3. **F03** (P2) Generic Brauer reciprocity still has two owners

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1511` and `:1519`–1533: “Let `Γ` be a finite group” and “This roadmap owns only this transport of the pairing to lifts”.

   **Claim.** This package owns the general identity [L⊗P̃_σ:V]=[V̄:σ], for arbitrary finite Γ over a splitting modular system.

   **Witness.** Open PR #1775, `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:719`, §3.1, proves Φ_φ=Σχ d_{χφ}χ for the ordinary character of the same lifted projective cover. Taking the χ coefficient gives exactly this identity.

   This is the unresolved part of previous R04, whose repair explicitly required removing the independent general reciprocity target. The Hom chain is mathematically correct, but changing its proof route or calling it “transport” does not change the owned object. The current head of #1775 was read; its actual folder is nested under RepresentationTheory. Neither the absence of that PR from the merge order nor declining to cite it resolves the double ownership.

   **Exact repair.** Remove the arbitrary-finite-group reciprocity target and its ownership claim here. Keep the GL₂-specific rational constituent and adjoint/lattice computations, using the already-cited GL2AutomorphicRepresentationsAndTransfer §R17.5.11 projective pairing, pinned projective lift and Hom base change as their inputs. State the Hom chain as that application, not as a second generic theorem. Record the generic pairing/lift ownership in Scope and the exact contracts. Do not add #1775 as an upward supplier. Generic reciprocity remains the object of ModularCharactersAndBlocks §3.1.

   **Test of the repair.** For Γ=C₂ over the splitting system (ℚ₂,ℤ₂,𝔽₂), the regular projective lifts to ℤ₂[C₂]. Its rational constituents 1 and sign each occur once; both reduce to the simple k, with multiplicity 1. The character equation and the package equation both give (1,1), demonstrating the exact overlap. This test remains available as a Check of the imported Hom chain.

4. **F04** (P3) The Vignéras finite-length locator uses the wrong theorem

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:966`: “VIGNERAS11, §5, Proposition 8 and Théorème 7”; also the reference at line 2228 and `packages/ModpRepresentationsOfGL2OverLocalFields/sources.toml:254`.

   **Claim.** Théorème 7 in the cached arXiv numbering supplies the finite-length/subquotient result used here.

   **Witness.** VIGNERAS11 line 723, Théorème 6, printed pp. 19–21, states the admissible finite-presentation length and subquotient result. Line 1025, Théorème 7, printed p. 26, concerns finite U₀-invariants of a finite B⁺-submodule.

   **Exact repair.** Cite Théorème 6, pp. 19–21, for this result, retaining Proposition 8 where its finite-obstruction criterion is used. Correct the reference and existing manifest locator under VIGNERAS11; do not add a second source key. Théorème 7 need not be removed if a distinct, correctly identified use is retained.

   **Test of the repair.** For k⊕k with trivial action, the finite-length theorem gives length 2 and subquotient lengths 0,1,2. The cited Théorème 6 contains precisely that type of conclusion; Théorème 7 supplies only the different invariant-finiteness assertion. The target's mathematics is unaffected.

Four findings: three P2 and one P3. The author files were not changed. All eleven previous findings were checked first; ten are repaired and R04 is partly repaired. No finding was marked “not actionable in this package” in the last repair report. The two declared supplier gaps are not findings.

## Previous findings, checked individually

Locations below are in `packages/ModpRepresentationsOfGL2OverLocalFields/README.md` unless stated otherwise. Quoted fragments are from the package, not its mathematical sources.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| R01: small-prime Ext formula | Repaired | §3.3: “`(p, f) ≠ (2, 1)`”. The exceptional self-extension has dimension 1. For GL₂(𝔽₂)=S₃, Hom(S₃,𝔽₂)=𝔽₂ while the former adjacency count is 0. The p=3 and f≥2 controls were also checked. |
| R02: torus unit in transfer | Repaired | §2.2: “the Hecke operator” is “`χ(ad)` times” precomposition by q/c. With c=2√5, q=5, the multiplier is √5/2; the indicated functional gives 3, and the square gives 0 modulo 5. This preserves the unit as well as nilpotence. |
| R03: fundamental characters | Repaired | Conventions and §3.4: “the unramified extension `F′/F` of degree `r`”. The coefficient containment is explicit. At p=5, niveau two needs image order 24; 𝔽₅ supplies only 4, whereas 𝔽₂₅ supplies 24 and the sixth power has order 4. |
| R04: lifting and reciprocity ownership | Partly repaired | §5.4: “neither is proved again here” correctly imports both pinned lifting results. But “This roadmap owns only this transport of the pairing to lifts” still claims the arbitrary-finite-group reciprocity formula. See R03 below. |
| R05: equal-characteristic reciprocity | Repaired | §5.4: “so that `L` has characteristic zero and `k` characteristic `p`”. Rationalization is now L⊗𝒪, including §§5.5 and 9.1. For C_p in equal characteristic the regular module has simple multiplicity p, versus 1 on the reduction side; it is excluded from reciprocity, not from projective lifting. |
| R06: ℚ_p ordinary-parts duplication | Repaired | §2.1 imports the ℚ_p functor and requires that “the two functors coincide” on the specified common domain. The contract resolves to CompletedCohomologyAndLocalGlobalCompatibility §0.1, lines 235–252. Opposite-Borel induction gives U, while upper-Borel induction gives U with the Weyl swap. |
| R07: former MP identifiers | Repaired | The downstream table headed “Former identifier (MP numbering)” has 39 rows. MP.0/torsion-admissibility→§0.1, MP.3/weight-coordinates→§3.1, MP.8/projective-lattice→§8.4, and the layer IDs retain their meaning. The cited IDs in the two closest consumers resolve through it. |
| R08: three false Checks | Repaired | §0.2 now uses “`sTs⁻¹ = (1+T)⁻¹ − 1`”; §1.4 requires “`δ² ≠ 1`”; §4.1 distinguishes “`(−∞, 0)`”. The respective values are −T+T²−⋯ versus T, δ(2²)=4 versus 1, and grade(0)=∞ versus grade(k)=dim U. |
| R09: source labels | Repaired | §3.1: “BP12, equation (2), pp. 13–14”; §2.1 distinguishes Definition 3.1.3, Lemma 3.1.7, equation (3.1.8), Definition 3.1.9. BP12 line 481 and EMERTON1 lines 686, 753, 762, 780 confirm the kinds. The §5.5 BP12 pages are also corrected. |
| R10: continuous induction and code span | Repaired | §2.6: “continuous induction … is Mathlib's `ContRepresentation.coind`”. Its API and five Checks distinguish continuous from discrete induction; §6.4's code span is closed. The new availability exposes the separate missing-headline finding R01 below. |
| R11: compact/discrete algebra action | Repaired | §0.2 uses “the `𝒪[U]`-span `M_v` of `v` is finite” and the contract distinguishes level actions from compact-module actions. On ⊕ℕ k with trivial ℤ_p-action, each orbit span is finite and T acts by 0, although the entire discrete module is not compact. Finite sums of orbit spans supply compatibility and additivity. |

The changed passages, their examples and their uses elsewhere were reread. In particular the coefficient extension was followed into §7.6, rationalization into §§5.5 and 9.1, the ordinary-parts convention into §2.2, and the compact/discrete distinction into §4.1. Unchanged targets were reread; previous adversarial evidence was reused only for rows of round 2 that actually give computed values. No “sound” summary without values was used as evidence.

## Verified sound

### Coverage and principles

Read all four author files, the two previous reports, design gaps, the board-package index, overlap report, library-match leads and elaborated signatures. Read all 60 numbered targets in all ten layers, including API bullets, Checks, worked examples, standing hypotheses and every Needs/dependencies paragraph. The report records computed rows below for all fifteen seeded targets, all headlines and all changed mathematical patterns. The remaining unchanged computations are explicitly documented in the round-2 report's adversarial table, rather than merely labelled sound.

The package does not re-plan an existing main-branch roadmap. Its layers have mathematical names and a dependency-driven order: finiteness/coherence→length/ordinary parts; weights→Iwahori growth and extension calculus→local dimension bound; finite projectives→infinitesimal action/gluing→endomorphisms. It does not adopt a source's chapter sequence. Layer 4 preceding Layers 5–6, for example, serves its independent dimension criterion. No computational algorithm, source passage reproduction, prohibited supplier, set_option, sorry'd data, process path, PR number or HTML anchor was found in the roadmap/Lean text. The former-ID table is a compatibility map, not a target catalogue.

Definitions retain their API and at least three Checks; the continuous-induction repair has five. Every layer has Examples and Dependencies. The simple definitions in Lean are needed by its six substantive headlines. Their slight packaging differences are explicit: smooth finite presentation is not finite presentation over the abstract group algebra; torsion admissibility differs from finite invariants for unbounded torsion; the smooth dual is the smooth part of the full contragredient. No additional padding or unresolved own backticked name was found. The math.NT metadata and the 18-entry source manifest parse.

### Seeded locator checks

Printed pages below refer to the recorded versions, not a different published numbering. All fifteen sampled targets were opened in the cached texts; the settled book/Barthel–Livné limitations are listed under Not verifiable.

| Target | Opened evidence | Hypotheses and result checked |
| --- | --- | --- |
| 0.2 augmented Iwasawa algebra | SHOTTON20 lines 301–349, Proposition 3.2 and Lemmas 3.3, 3.5, pp. 7–8 | Augmented multiplication, independence of compact open, freeness/flatness and smooth action. The discrete-action assembly uses finite orbit spans, not the compact-module instance on an infinite discrete space. |
| 0.3 smooth finite presentation | SHOTTON20 lines 112–124, Definition 2.3, p. 3; lines 369–394, Proposition 3.8, pp. 9–10; CDN23 lines 430–445, p. 10 | Compact-open smooth finite-dimensional/finite-length generators; coefficient dévissage for torsion 𝒪. Abstract group-ring finite presentation is not substituted. |
| 0.6 Hom and residue fields | CDN23 lines 500–523, Lemmes 1.6–1.7, p. 12 | Finite generation for Hom base change; admissibility and irreducibility for finite division endomorphisms; finite coefficient field makes that division algebra a finite field. The finite-generator argument applies to the stated H. |
| 0.8 obstruction Δ | HU12 line 1167, Corollaire 3.9, p. 19; lines 1912–1924, pp. 35–36; VIGNERAS11 lines 808–836, pp. 21–22 | General finite-generator two-cell decomposition and B₀Z-stability; containment of invariants only for the specified admissible Serre-weight quotient. The source's unconditional containment/nonvanishing is not imported. |
| 1.1 proper compact-induction quotients | CDN23 lines 686–711, Proposition 1.17, p. 16 | F=ℚ_p; a nonzero kernel, not the identity quotient. The finite-codimension step is the declared Barthel–Livné contract. |
| 2.2 ordinary constituents away from ℚ_p | CDN23 lines 880–920, Proposition 1.30, pp. 20–21; HAUSEUX lines 1342–1357, Corollary 4.2.4, pp. 34–35; EMERTON2 lines 1166–1189, Remark 3.7.3, p. 23 | F≠ℚ_p, locally admissible ordinary constituents, H¹Ord vanishing and R¹Ord injection. Read the replacement cell/transfer argument: it does not apply the ℚ_p-only theorem to general F. |
| 2.3 finite obstruction/length | HU12 lines 1734–1767, Proposition 3.30 and Corollaire 3.31, pp. 30–31; lines 1900–1984, Proposition 4.4 and Lemme 4.5, pp. 34–36; VIGNERAS11 lines 783–791, Proposition 8, p. 21 | Admissibility plus finite obstruction, finite generation and the two-cell proof. The plus/plus typo is corrected in the roadmap. |
| 3.4 tame weights | BHHMS23 lines 617–648, Definition 2.3.1, p. 14; lines 716–721, Proposition 2.4.2, p. 16 | Tame parameter, geometric reciprocity, shifted η convention and coordinate bounds. Niveau-two coefficients and the Artin map of F′ now have the necessary domain. |
| 5.4 projective lifts | BHHMS23 lines 1262–1284, final proof paragraph of Lemma 4.1.2, p. 27; SERRE-LRFG III, Chapters 14–15, uncertified | BHHMS uses the particular multiplicity comparison. The general Hom argument was checked independently with the pinned lift and the earlier pairing; its truth is sound, its ownership is R03. |
| 5.5 adjoint/projective weights | LMS22 lines 318–328, Proposition 3.3, pp. 7–8; LMS22-CORR lines 13–18, item 2, p. 1; BP12 lines 805–811, Lemmas 3.4–3.5, p. 21, and Lemma 3.8, p. 23 | Depth hypotheses exclude the character exception where the corrected R-module differs from the projective cover. Tensor constituents and multiplicities retain the corrected meaning. |
| 6.3 induced cosocles/Ext | BHHMS23 lines 3138–3208, Lemmas 6.3.1, 6.3.3–6.3.5, pp. 61–63 | Bounds on all weight coordinates; source/cosocle orientation; induction of the specified character extension, not an arbitrary length-two module. |
| 6.4 Diamond boxes | BHHMS23 lines 3209–3233, equation (48), Remark 6.3.6, p. 63 | ε_i∈{−2,−1,0,1,2}; downward subsets, fixed simple socle, stated cosocle and multiplicity-free factors. |
| 7.2 Loewy-three vanishing | BHHMS23 lines 3621–3667, Proposition 6.4.1, pp. 71–72 | The actual length-three uniserial extension with repeated χ, generic χ and multiplicity one are all retained. Removing the repeated end factor would invalidate the conclusion. |
| 7.3 connectedness | BHHMS23 lines 3668–3710, Definition 6.4.2 and Lemma 6.4.3, pp. 72–73 | The support condition comes from D₁(ρ̄) and is not asserted for arbitrary character sets. The coordinate interval prevents two moves in one embedding. The package's tame domain is its stated scope. |
| 9.3 relative projectivity | BHHMS23 lines 4250–4311, Proposition 7.4.3 and Remark 7.4.4, pp. 85–86 | Quotients of the specific first-order projective truncation; right action by precomposition, commutative endomorphisms and epimorphisms within the specified quotient class. No absolute projectivity of every quotient is asserted. |

Also checked the repaired EMERTON1 labels at lines 686, 753, 762, 780; BP12 equation (2) at lines 479–487; BHHMS23's small-prime defect at lines 768–785 against BP12 line 1470; SERRE-TREES Theorem 3 and Corollary 1, printed p. 110, OCR lines 3281–3295. No new source was needed. R04 arose in the nonsampled §2.4 locator pass.

### Computed adversarial evidence

“Retain” means the tested instance agrees with the stated hypotheses and conclusion, not that elaboration proved the theorem. The values distinguish the claimed object from the indicated wrong model. Zero rings, equal-characteristic local fields and q=1 are excluded where the field/characteristic/local-field hypotheses exclude them; they were not silently used as valid examples. Finite p-adic Lie groups, including the trivial group, are allowed in §4.1 and produce R02.

| Statement | Instances tried | Computed values on the two sides / wrong model | Result; change |
| --- | --- | --- | --- |
| §0.1 torsion admissibility | Trivial L/𝒪, ramification e, j=0,1,2; ⊕ℕ k | Torsion lengths 0,e,2e versus required finite lengths; direct-sum invariant length ∞ | Retain unbounded torsion and reject infinite direct sum. |
| §0.2 algebra and action | H=1; S₃ with U=1; ℤ_p⋊C₂ | Algebra 𝒪; [(12)][(23)]=[(123)] versus reversed [(132)]; sTs⁻¹=−T+T²−⋯ versus false T | Repaired noncommutative Checks hold. |
| §0.2 discrete assembly | V=⊕ℕ k, trivial U=ℤ_p; orbit spans and their sums | Each finite span has cardinal (card k)^n; T acts as 0 on each and on their sum; whole V is infinite discrete, not compact | Level-action route holds; compact-module shortcut rejected. |
| §0.3 presentation | V=0; I(σ); k[ℚ_p/ℤ_p] | Smooth presentation sizes 0 and one compact generator; the last representation is cyclic with a compact stabilizer, while abstract group-algebra relations require all elements of ℤ_p | Retain smooth-category definition. |
| §0.5 coherence headline | T:I(σ)→I(σ); zero map; G₀⊂G′ | ker T=0 with zero presentation; ker 0=I(σ) with its presentation; index [G′:G₀]=2 | Retain; hϖ excludes ϖ=0. |
| §0.6 scalar Hom | H=1,V=k²,W=k; irreducible C₃-module over 𝔽₂ | Both base-changed Hom dimensions 2; End of the two-dimensional irreducible is 𝔽₄, dimension 2, splitting over 𝔽₄ into two distinct characters | Retain finite generation and finite residue extension, not End=k without absolute irreducibility. |
| §0.8 Δ | Identity I→I; augmentation I(1)→k | Identity has Δ=0 but I^{I₁}≠0; augmentation has Δ=k=V^{I₁}, dimension 1 | Admissibility correctly separates containment cases. |
| §1.1 proper quotient | I(1); I(1)/(T−1) | Infinite length versus length 2 with Steinberg submodule and trivial quotient | Nonzero-kernel hypothesis necessary and present. |
| §1.3 finite type→presentation headline | 0, trivial k, I(σ), at p=2 and 3 | Numbers of compact generators 0,1,1; all are finitely presented in the smooth sense | Retain all primes and group quotient p^ℤ. |
| §1.4 block separation | p=5, δ(2)=2; quadratic δ | Central multipliers δ(2²)=4≠1 versus δ(z²)=1 for every z in the quadratic case | Corrected δ²≠1 condition holds. |
| §1.5 finite cosocle headline | π⊕π, π irreducible; bound N=0 | Largest semisimple quotient length 2=module length 2; a nonzero finitely generated module has a simple quotient of length 1>0 | Quantifier is a uniform bound over all semisimple quotients; retain. |
| §1.6 smooth-dual headline | Trivial k; Steinberg; ⊕ℕ Steinberg | (length, dual dimension)=(1,1),(1,0),(∞,0) | Both iff directions require finite generation; last example excluded. |
| §2.1 ordinary convention | Character χ∘det; opposite-Borel induction U; upper-Borel induction χ | Ord values 0,U,χ^w; supplier gives the same; replacing χ^w by χ fails for χ≠χ^w | ℚ_p ownership and opposite-Borel normalization repaired. |
| §2.2 transfer | F=ℚ_p, unramified quadratic, ϖ²=p | q/ϖ gives 1,p,ϖ; modulo p the latter two are 0 and square-zero, respectively | Vanishing away from ℚ_p agrees; ℚ_p cannot be included. |
| §2.2 torus unit | F=ℚ₅(√5), c=2√5, χ=1 | q/c=√5/2; indicated additive functional gives 3 rather than 1; square=5/4 gives 0 modulo 5 | Repaired action retains unit factor. |
| §2.3 obstruction criterion | Trivial k; I(σ) | For k: obstruction dimension 1, length 1; for I: obstruction 0, invariants infinite and length infinite | Admissibility cannot be omitted and is retained. |
| §2.4 two Lean headlines | V=k⊕k trivial; its subobjects 0,k,V | Lengths 0,1,2; all have finite smooth presentations and finite compact-open invariants | Retain theorem statements; fix locator R04. |
| §2.5 finite-error counit | Character; Steinberg; induced ordinary character | (kernel dimension,cokernel dimension)=(0,1),(1,0),(0,0) | Retain finite error, not an isomorphism claim. |
| §2.6 continuous induction | σ=0,k,𝒪; x of valuation m and x=0 | Ind 0=0; Ind k is smooth; for 𝒪, f(x)=Σ₀ᵐϖ_L^n and f(0)=(1−ϖ_L)⁻¹, difference ϖ_L^{m+1}/(1−ϖ_L)≠0 | Continuous and discrete induction differ; denominator is a unit. |
| §2.6 Banach headline | Trivial Θ=𝒪; unitary induced lattice | σ=0 gives errors (0,𝒪), ranks (0,1); identity induction gives errors (0,0) | Native signature elaborates; add headline, R01. |
| §3.1–3.2 weight normalization | p=17, λ=(5,0), f=1; f=2 with differences 5,6 | dim Sym⁵=6; two factors dimension 6·7=42; t_λ(−1)=(0,−11), t_λ(1)=(−1,−10), i.e. Sym¹¹det⁵ and Sym⁹det⁶ | Retain determinant and reflection conventions; repaired BP12 locator. |
| §3.3 small-prime adjacency | (p,f)=(2,1),(2,2),(3,1) | S₃ trivial self-Ext 1 versus old adjacency 0; q=4 self-Ext 0; q=3 self-Ext 0 and Ext¹(det,1)=1 | Explicit exception repairs first pair; other values retained. |
| §3.4 tame weights | p=5 niveau two; p=17 split ω⁶⊕1 | Image orders 24 versus card(𝔽₅×)=4, corrected by 𝔽₂₅; norm sixth power order 4; p=17 weights Sym⁵ and Sym⁹det⁶ | Repaired coefficients and inverse-Artin convention agree. |
| §4.1 zero and positive dimensions | V=0,k,C^∞(ℤ_p^d,k), d>0 | Grades ∞,d,0; dimensions −∞,0,d; nonzero invariant growth 1,p^{rd} | Retain zero convention and positive-dimensional growth. |
| §4.1 dimension-zero group | G=U=1,V=k | Grade=0, canonical dimension=0, index=1, invariant dimension=1; displayed exponent 1/0 and totalized base 1 cannot identify an exponent | R02: separate d=0 from growth characterization. |
| §4.2 canonical/support comparison | R=k[[x,y]], M=R/(x) | Grade 1; canonical dimension 2−1=1; support dimension 1 | Retain finite-module hypotheses. |
| §4.3–4.4 graded Iwahori | Upper/lower root elements; f=1,2 | Commutator matrix [[1+p+p²,−p],[p²,1−p]] has weight 1=1/2+1/2; graded degree-one dimensions 2,4, degree-two dimensions 4,12 | Retain sign, weighting and central quotient. |
| §4.5 crossing algebra | f=1, XY=0 | Krull dimension 1; X and Y both nonzero, product 0; specialization X=0,Y=1 survives | Excludes the reduced-to-a-point or polynomial-domain wrong model. |
| §§4.6–4.7 Iwahori criterion headline | f=1, truncation orders 1,2,3; regular functions | Truncation dimensions 1,3,7; Hom from third truncation has dimension 7 versus Hom from χ dimension 1; regular representation has GK dimension 3>1 | Multiplicity hypothesis correctly rejects regular representation; unavailable carrier named in docstring. |
| §5.1 root collision | p=5,f=1; p=7,f=1 | At p=5 α has order 4, so α²=α⁻² and multiplicity 2; at p=7 those exponents are distinct | p>5 condition correctly retained. |
| §5.4 lift/reciprocity | C_p in splitting mixed characteristic; C_p in equal characteristic | Lift rank p in both; each rational ordinary character multiplicity 1=its reduced multiplicity; in equal characteristic regular simple multiplicity p≠1 | Mixed-characteristic restriction repaired; generic ownership still R03. |
| §5.4 Hom base change | P̃=𝒪[Γ], M=𝒪 and M=k | Hom(P̃,M)=M; reductions give k=k, with dimensions 1=1 in both examples | Base change valid also for torsion M; does not fix duplicate ownership. |
| §5.5 adjoint tensor | p=17,r=5,f=1, interior range | Dimensions 4+6+8=18=3·6; projective dimensions 34+34+34=102=3·34 | Corrected projective formula applies in stated depth range. |
| §6.3 induced cosocles | f=1,p=17, allowed interior χ | Principal series length 2, induced length-two extension length 4; dimensions 18 and 36=2·18 | Retain distinct cosocle/Ext conditions, not arbitrary extensions. |
| §6.4 boxes | One coordinate ε=0,1,2 | Lengths 1,2,4; ε=2 has two incomparable middle factors, not a length-three chain | Downward-subset definition and cosocle orientation retained. |
| §6.5 tensor filtration | p=17,λ=(5,0),ε=−1 | D dimension 18; tensor dimension 54; constituent dimensions 14+4+12+6+10+8=54 | Three boxes of dimension 18 agree; no lost constituent. |
| §7.2 Loewy-three socle | p=7,r=3; W=χ as excluded wrong model | Allowed W has χ multiplicity 2, versus 1 in σ restricted to I, forcing socle image 0; for W=χ adjunction gives a nonzero map (scalar 1) | Length-three and multiplicity-one hypotheses retained. At p=5 the stated interior range is empty. |
| §7.3 connectedness | f=1; two-coordinate path | Coordinate interval [−1,2] has width 3, so two same-coordinate moves would require difference 4>3; different-coordinate moves have differences (2,0),(0,2) | Same-root obstruction excluded; intermediate-character assertion uses actual D₁ support. |
| §7.4 Weyl convention | g=[[a,b],[pc,d]] | Conjugation by [[0,1],[p,0]] gives [[d,c],[pb,a]] | Retain upper-Iwahori convention and Weyl swap. |
| §7.6 local dimension headline | f=1,2 | Claimed bounds 1,2 versus ambient GL₂ dimensions 4,8 | Genuine bound, not equality; carriers correctly named as unavailable. |
| §8.1 infinitesimal action | Adjoint lattice; trivial rank-one lattice | β(e,f)=h, β(f,e)=−h, β(h,e)=2e; trivial β=0 and extension lengths 1,2,1 | Retain bracket direction, p>2 and coinvariants. |
| §8.2 preimage lattice | W=0, rank V=n | V₁=pV; V₁/p²V has length n; wrong denominator p²V₁ gives length 2n | Correct quotient retained. |
| §§8.3–8.6 lattice headline | p=11,r=3; endpoints; f=1,dim P=d | Contraction eigenvalues 5,4,10 nonzero, endpoints give 0; lattice rank 4d, exact reduction dimensions 3d,4d,d; for r=5 finite cover dimension 22, truncation dimension 88 | Retain depth/p restrictions and explicit lattice, unavailable pseudocompact carrier documented. |
| §9.1 endomorphism headline | f=1,2 | End dimensions 2^f(f+1)=4,12, not squares of truncation dimensions | Commutativity is substantive, not scalar-endomorphism padding. |
| §§9.2–9.3 relative-projectivity headline | Q=0,σ,T_σ; right action | Hom dimensions 0,1,4 for f=1; f·a=f∘a and (f·a)·b=f∘(ab) | Retain all quotients of specified T_σ and source-side action; not arbitrary projective objects. |

### Headline coverage, elaboration and padding

The README's headline families and their acceptance-test coverage are:

| Headline | Suggested.lean coverage |
| --- | --- |
| Coherence for GL₂(F)/ϖ^ℤ, §0.5 | `isFinitelyPresented_ker`, line 102 |
| Finite type implies finite presentation over ℚ_p, §1.3 | `isFinitelyPresented_of_finite`, line 119 |
| Finite cosocle implies finite length, §1.5 | `isFiniteLength_of_bounded_semisimple_quotients`, line 131 |
| Finite length iff finite smooth dual, §1.6 | `isFiniteLength_iff_finite_smoothDualSpan`, line 149 |
| Admissible finite-presentation length/subobject theorem, §2.4 | `isFiniteLength_of_admissible_of_finitelyPresented`, line 164, and `isFinitelyPresented_subrepresentation_of_admissible`, line 178 |
| No supersingular constituents away from ℚ_p, §2.4 | Docstring identifies missing supersingular/principal-series constituent interface. |
| Finite-error ordinary counit, §2.5 | Docstring identifies missing Ord_B. |
| Banach induced approximation, §2.6 | Missing despite native statability: R01. |
| Iwahori multiplicity criterion, §4.7 | Docstring identifies canonical dimension and pseudocompact truncation carriers. |
| Local GK upper bound, §7.6 | Docstring identifies canonical dimension, tame weights and Diamond modules. |
| Explicit lattice realization of first projective truncation, §§8.4–8.6 | Docstring identifies pseudocompact projective covers, Serre weights and gluing lattice. |
| Commutative endomorphisms and relative projectivity of quotients, §§9.1–9.3 | Same missing carriers named in docstring. |

Ran the requested `lake env lean` elaboration from the pinned content checkout on the original file: exit 0, exactly six warnings, all “declaration uses sorry”, at theorem lines 102,119,131,149,164,178. There are no TauCeti imports to build. A single additional scratch file with `#check @name` for all eleven declarations elaborated successfully. All five definition types and six theorem types were compared with the prose; none lost a needed section binder. CharZero, residue characteristic p, local-field structures, finite coefficient field, irreducible uniformizer, smoothness and group-algebra finite generation occur where needed. No author declaration was changed.

On a scratch copy I tried rfl, infer_instance and simp as complete one-tactic proofs for every one of the six sorried theorems; all six failed to close. I also opened the plausible library exact-lemma candidates. `isFiniteLength_iff_isNoetherian_isArtinian` needs Artinianity; `IsSemisimpleModule.finite_tfae` assumes the whole module semisimple; Hopkins–Levitzki requires a semiprimary ring. None proves these smooth-representation headlines. The bounded-cosocle hypothesis does not assert semisimplicity of the representation. Algebraic smoothness and abstract finitely presented module search hits concern different predicates. No declaration is a Check, boundary case, definition unfolding or existing one-lemma theorem.

The R01 statability witness below was elaborated after those checks. In a scratch copy of the original file, after its namespace closes, append this declaration. It uses only existing package predicates and pinned native structures. Seven intended sorry warnings, exit 0, no option overrides:

```lean
namespace ReviewWitness
open ValuativeRel
open TauCetiRoadmap.ModpRepresentationsOfGL2OverLocalFields

theorem banach_approximation
    (p : ℕ) [Fact p.Prime]
    {F L : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [CharZero F] [CharP 𝓀[F] p]
    [NontriviallyNormedField L] [ValuativeRel L]
    [IsNonarchimedeanLocalField L] [CharZero L] [CharP 𝓀[L] p]
    (hF : ¬ Nonempty (F ≃+* ℚ_[p]))
    (ϖ : 𝒪[L]) (hϖ : Irreducible ϖ)
    (B : Subgroup (GL (Fin 2) F))
    (hB : ∀ g, g ∈ B ↔ (g : Matrix (Fin 2) (Fin 2) F) 0 1 = 0)
    {E : Type} [NormedAddCommGroup E] [NormedSpace L E] [CompleteSpace E]
    [Module 𝒪[L] E] [IsScalarTower 𝒪[L] L E]
    [ContinuousSMul 𝒪[L] E]
    (Θ : Submodule 𝒪[L] E) (hopen : IsOpen (Θ : Set E))
    (hbounded : Bornology.IsBounded (Θ : Set E))
    (ρ : ContRepresentation 𝒪[L] (GL (Fin 2) F) Θ)
    (hcont : Continuous (fun x : GL (Fin 2) F × Θ => ρ x.1 x.2))
    (S : Subrepresentation ρ.toRepresentation)
    (hS : S.toSubmodule = Ideal.span {ϖ} • (⊤ : Submodule 𝒪[L] Θ))
    (hadm : IsTorsionAdmissible p S.quotient)
    (hfp : IsFinitelyPresented S.quotient) :
    ∃ (M : Type) (_ : AddCommGroup M) (_ : Module 𝒪[L] M)
      (_ : TopologicalSpace M) (_ : IsTopologicalAddGroup M)
      (_ : ContinuousSMul 𝒪[L] M) (_ : CompactSpace M) (_ : T2Space M),
      Module.Finite 𝒪[L] M ∧
      ∃ σ : ContRepresentation 𝒪[L] B M,
        Continuous (fun x : B × M => σ x.1 x.2) ∧
        (∀ b : B, ((b : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) 0 0 = 1 →
          ((b : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) 1 1 = 1 → σ b = 1) ∧
        ∃ f : ContIntertwiningMap
          (σ.coind (⟨B.subtype, continuous_subtype_val⟩ : B →ₜ* GL (Fin 2) F)) ρ,
          Module.Finite 𝒪[L] (LinearMap.ker f.toContinuousLinearMap.toLinearMap) ∧
          Module.Finite 𝒪[L] (Θ ⧸ LinearMap.range f.toContinuousLinearMap.toLinearMap) := by
  sorry
end ReviewWitness
```

An action on an open bounded lattice extends to its L-span, which is the whole Banach space, and gives the equivalent unitary presentation. Residual admissibility is the lattice criterion cited in CompletedCohomologyPartII F.1. For finite M, compact Hausdorff topology with continuous scalar multiplication is its canonical module topology: a surjection 𝒪^n→M is continuous from a compact space onto a Hausdorff space. Thus this witness does not hide a different topology or a weakened bounded stand-in. It establishes statability, not a proof of the theorem.

### Pinned declarations opened and object-level duplication

Mathlib pin: `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. Tau Ceti pin: `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following are library-relative paths at those pins. In addition to name resolution, searches used the actual objects: smooth stabilizers, finite presentations by induction, contragredients, continuous equivariant functions, completed-algebra actions, projective reduction/lifts, grade and finite length. Library-match search results were treated as leads, not evidence of absence or duplication.

| File and line at pin | Declaration/content read; implication |
| --- | --- |
| `Mathlib/RepresentationTheory/Basic.lean:48`, `:142`, `:670` | Representation is a monoid hom to linear endomorphisms; asModule has the same additive carrier; dual uses g⁻¹. No smoothness or topology is included automatically. |
| `Mathlib/RepresentationTheory/Stabilizer.lean:27` | stabilizer has carrier {g : ρ g v=v}; the smoothness predicate has the intended open-set meaning. |
| `Mathlib/RepresentationTheory/Induced.lean:59`, `:77` | IndV and ind supply algebraic induction; compact-open comparison is a supplier theorem, not assumed to be in the definition. |
| `Mathlib/RepresentationTheory/Intertwining.lean:36`, `:138`; `Mathlib/RepresentationTheory/Subrepresentation.lean:54`, `:114` | Linear equivariance, kernel subrepresentation, restricted and quotient actions. No hidden smooth-category assumption. |
| `Mathlib/RepresentationTheory/Rep/Basic.lean:30` | Rep bundles a module and representation, permitting finite smooth generator predicates in the presentation definition. |
| `Mathlib/RepresentationTheory/Continuous/Basic.lean:55`, `:81`, `:541`, `:558` | Continuous endomorphism actions, continuous intertwining maps, equivariant continuous functions and right translation. Explicit joint continuity is added in the statability test. |
| `Mathlib/NumberTheory/LocalField/Basic.lean:46`; `Mathlib/NumberTheory/Padics/LocalField.lean:28` | Compatible valued topology, local compactness and nontrivial valuation; the ℚ_p instance exists. CharZero and residue characteristic are separately retained in the six headlines. |
| `Mathlib/Topology/Algebra/OpenSubgroup.lean:49`; `Mathlib/Algebra/Group/Subgroup/Basic.lean:634`; `Mathlib/Topology/Algebra/Group/Quotient.lean` | OpenSubgroup includes openness, not compactness; normal closure and quotient topology support GL2ModScalar. Compactness is explicitly quantified in the predicates. |
| `Mathlib/RingTheory/FiniteLength.lean:76`, `:92`; `Mathlib/RingTheory/HopkinsLevitzki.lean:105` | Noetherian+Artinian equivalence, semisimple finite TFAE and semiprimary Hopkins–Levitzki. Their stronger hypotheses do not prove the six headline targets. |
| `Mathlib/RingTheory/KrullDimension/Polynomial.lean:120`; `Mathlib/RingTheory/Regular/RegularSequence.lean:147` | Polynomial Krull dimension and regular-sequence carrier. The latter includes a nontrivial final quotient, so a unit-ideal “regular sequence” is excluded. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`, `:161`, `:252` | completedGroupAlgebra, proj and of; these are imported, not reconstructed. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:99`, `:112`, `:133`, `:143`, `:322` | toQuotientEnd, its extension/independence/factor laws, and the compact-module action. The last has compactness hypotheses absent for ⊕ℕ k. |
| `TauCeti/Algebra/Module/ProjectiveCover/Existence.lean:195` | exists_isProjectiveCover_of_finite uses an Artinian base and finite algebra; no finiteness of the target module is required. It is not a pseudocompact-cover theorem. |
| `TauCeti/Algebra/Module/Projective/Lift.lean:89`; `TauCeti/Algebra/Module/Projective/Reduction.lean:73` | Projective lifting under endomorphism completeness; isomorphism lifting for projectives with coatomic submodule lattices modulo a Jacobson-radical ideal. The revised contracts instantiate both correctly. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean:328` | coindAcyclic for compact group and discrete coefficients in positive degree; applicable to the N₀ cell calculation. |

The general smooth category, Iwasawa regularity/dimension theory, finite projective covers/lifts and Brauer pairing are cited to their owners. The genuinely new objects here are the general-GL₂ finiteness results, finite/coefficient adapters and specified weight/Iwahori/lattice constructions. R03 is the remaining ownership conflict; no exact fully qualified collision among the eleven Lean declarations was found.

### Supplier order, current citations and overlap audit

Read main-branch SchemeAndStackFoundations, ClassFieldTheory and RepresentationTheory/QuiverRepresentations as house-style and ownership comparisons. Read the relevant current open heads through `roadmaps show` and searched ownership through `roadmaps grep`; read the board-package index before evaluating absence. `roadmaps resolve` reported no unresolved cross-roadmap citation or own Lean name. Its host-side library warning was not treated as verification: the pinned declarations above were opened directly.

| Supplier | Resolved sections and evidence |
| --- | --- |
| SmoothRepresentationsOfLocalGroups | SR.0.1–SR.0.4: smoothness at line 624, category 670, abelian structure 705, invariants 768, admissibility 872, finiteness 907, dual 959, scalar change 987, centre 1008; SR.0d.1 at 1676 supplies injectives; SR.2.1 at 1919–2035 supplies induction, reciprocity, exactness and Mackey filtration. |
| PadicLocalLanglandsForGL2Qp | §0.1 (line 206) and §0.3 (268), §§2.1–2.3 (649–719), §2.7 (854), §2.9 (903), §5.1 (1689), §5.3 (projective envelopes around 1750). Duality, finite residue characters, classification, nonpresentation away from ℚ_p and blocks resolve. The all-prime Ext assertion remains the declared gap. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.5.15, lines 8196–8250, supplies general-F weights, compact induction and Hecke algebra/freeness; its ℚ_p construction is explicitly imported from the preceding supplier. The finite-codimension assertion remains the declared gap. |
| PotentialAutomorphyInfrastructure | §3.7, line 1270, gives the transfer Hecke action and localization; §3.12, line 1322, supplies bounded-below derived ordinary comparison. |
| CompletedCohomologyAndLocalGlobalCompatibility | §0.1, lines 235–252, supplies the ℚ_p ordinary functor, opposite-Borel adjunction and Weyl convention; the package imports that case. |
| NoncommutativeAndEquivariantIwasawa | §0.3 (210), §0.5 (272), §§0.7–0.8 (334,379), §F.1 (436), §§0.10–0.11 (459,484), §0.13 (569). Finite-index freeness, filtered lifting, p-valuations, weighted algebra, grade shift, Auslander condition/global dimension and exterior cohomology all resolve. |
| CompletedCohomologyPartII | F.1, lines 184–200, gives the lattice criterion and duality; §5.8, lines 1400–1418, gives positive-dimensional uniform invariants growth. R02 is a dropped hypothesis at use, not a missing supplier theorem. |
| DeformationAndDerivedPatchingAlgebra | §3.4, lines 627–654, regular-sequence ideals and complete intersections, retaining nonzero quotient/local hypotheses. |
| SchemeAndStackFoundations on main | §0.17, lines 1310 onward, explicitly imports pinned depth/Cohen–Macaulay results and supplies the required regular-sequence quotient criterion. |
| ClassFieldTheory on main | Layer 7, lines 1204–1229 onward, absolute Artin map, arithmetic uniformizer convention, inertia and geometric inversion. The unramified F′ field in the repaired fundamental character is essential. |
| RepresentationTheory/QuiverRepresentations on main | Layer 3, lines 507–562, covers/envelopes and finite algebra structure, with its ArtinAlgebras duality input. The slash-qualified path exists even though a bare CLI lookup by that qualified spelling is not a roadmap slug. |
| GL2AutomorphicRepresentationsAndTransfer | R17.5.11, lines 2928–2945, Brauer characters, lattice reduction and projective pairing. This is the earlier input used in §5.4, not a license for duplicate generic ownership. |

All Needs and supplier citations were read. The mechanical check requested by the brief completed with:

```text
depcheck: 237 roadmaps, 2151 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file was edited.

The two precise gaps have the same slugs in design/plan.json and the README contracts: `ext1-finite-length-into-compact-induction`, supplier PadicLocalLanglandsForGL2Qp §2.7, with p=2,3 explicitly included; and `barthel-livne-finite-codimension`, supplier FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15, with nonzero subrepresentation explicitly required. Neither asks for the surrounding classification or compact induction again. The first supplies the missing all-prime Ext estimate; the second the finite-codimension step. Neither is unowned, vague or redundant with a pinned theorem.

The overlap data had no conflicting head changing this roadmap, dropped cited ID or revision-only supplier ID requiring a new order declaration. Closest consumers were opened: PR #1745, `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md`, scope and supplier contract at lines 13 and 64; and PR #1757, `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md`, scope and contract at lines 12 and 94. They consume the MP targets through the retained numbering map; they do not become upward suppliers. The later Scholze roadmap's continuous-induction functoriality is an application of the earlier construction, not a missing dependency here. The ℚ_p and general smooth representation neighbors have the supplied ownership split recorded above. The additional finite-group overlap with PR #1775 is R03.

## Not verifiable

- SERRE-LRFG, Part III, Chapters 14–15: the manifest records this book as uncertified. Its text was not available for direct verification, and it was not requested again. The projective-lift multiplicity calculation was checked independently as the Hom chain above; this does not certify the book's precise pages.
- BARTHEL-LIVNE94, Proposition 18: settled waived. The original text was not read or requested again. Its exact required statement is the named finite-codimension supplier contract; CDN23 Proposition 1.17 was read for the use of that input.
- The two declared supplier-gap theorems are future supply contracts, not proofs supplied by this package. Their precision, ownership and matching declarations were verified; their eventual implementations were not.

All fifteen samples otherwise had readable cached evidence. No new missing-reference request was generated. Elaboration certifies signatures only; none of the six admitted headline proofs was claimed to have been verified by Lean.

## Source issues

- **Error** in BHHMS23 at Lemma 2.4.6, printed p. 17: the source says regular-weight Ext is always given by the adjacency rule; it should be restricted away from (p,f)=(2,1), with trivial self-Ext dimension one there; affects a stated result.
- **Error** in LMS22 at Proposition 3.3(2), printed p. 8: the source says all shifted summands are projective covers; it should be the corrected R-modules, distinguishing the character exception; affects a stated result; corrected in print at LMS22-CORR, item 2, p. 1.
- **Error** in VIGNERAS11 at Propositions 9–10, printed p. 22: the source says the obstruction always contains pro-p Iwahori invariants and is nonzero; it should be restricted to the appropriate admissible quotient situation; affects a stated result.
- **Gap** in CDN23 at proof of Proposition 1.30(b), printed p. 21: the source says Emerton's ℚ_p ordinary-parts computation justifies the general-field assertion; it should be justified by the general-field transfer calculation and ordinary cohomology comparison; affects the proof.
- **Misprint** in HU12 at proof of Proposition 4.4, printed p. 36: the source says both summands of the kernel decomposition lie in the positive cell; it should be one positive-cell and one negative-cell summand; affects the proof.
- **Error** in BHHMS23 at the consequence after equation (44), printed p. 55: the source says every nontrivial character has multiplicity at most one under p>3; it should be restricted to p>5, since α²=α⁻² when p=5 and f=1; affects a stated result.
- **Misprint** in BHHMS23 at proof of Lemma 6.3.8, printed p. 64: the source says the displayed projective-cover surjection ends in the box's socle F(λ); it should end in its cosocle F(t_λ(Σ ε_iη_i)); affects the proof.
- **Misprint** in BHHMS23 at proof of Corollary 7.3.4, printed p. 84: the source says the projective cover is taken for K₁/Z₁ in the displayed factorization; it should be the cover for K/Z₁ throughout; affects the proof.
- **Misprint** in EMERTON2 at Theorem 4.2.12(3), printed p. 30: the source says H¹Ord of χ∘det is χ⊗χ; it should be (χ ε⁻¹)⊗(χ ε), as Proposition 4.2.5 gives; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9a8ba56bc0aa5e648910c8b9a0d63bbfd6f09646", "job": "REV-PKG-ModpRepresentationsOfGL2OverLocalFields~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
