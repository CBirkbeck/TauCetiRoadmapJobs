<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13121#issuecomment-6785508504 -->
Review (codex) of 55b8824

Verdict: needs_changes

1. **F01** (P1) The cited supplier no longer owns the sphere Segal equivalence

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:83`: “and the Segal statement `𝕊^{tC_p} ≃ 𝕊^∧_p`.” Repeated in the Needs line at 370; consumed by the second comparison at 368 and its sphere Check at 376.

   **Claim.** RefinedTraceMethods §2.3 supplies the sphere Segal equivalence, which identifies the Tate unit in the proof of the p-completed lax comparison.

   **Witness.** PR #1493, `TauCetiRoadmap/RefinedTraceMethods/README.md:7`, assigns the sphere theorem to StableHomotopyKTheoryPartII §2.7. That theorem is at PR #1733, `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:375`; `merge-order/ORDER.txt:331` places this package before its owner at 333.

   The actual §2.3 of RefinedTraceMethods starts at line 557. It supplies Postnikov statements, Tate vanishing, p-completeness and the Tate fixpoint lemma; it does not supply the sphere equivalence. P-completeness alone cannot identify the Tate unit: for trivial-action Hℤ, π₀ of its Tate spectrum is ℤ/p, whereas π₀ of Hℤ_p is ℤ_p. The missing sphere input is used explicitly in speirs-axes line 516. The earlier degree-zero Burnside completion and the supplied Tate diagonal do not themselves state this spectral equivalence. The p=2 result mentioned in the later owner's scope would not supply the all-primes statement.

   **Exact repair.** Remove the Segal assertion from the contract at 83 and the Needs line at 370. Move the second, Segal-dependent lax comparison at 368 and its sphere Check at 376 to the downstream owner StableHomotopyKTheoryPartII, after its §2.7; record this ownership transfer in Scope as an exclusion, not as a supplier edge. Preserve the general theorem there rather than restricting primes. Keep the first comparison at 366 for every spectrum T and every finite pointed C_p-CW complex. In §3.6 explicitly use that fixed-point comparison and the Frobenius factorization through fixed cells, as in speirs-trunc lines 341–346, rather than the standalone equivalence of the completed lax map. Split the Needs lines for the remaining statements accordingly. Do not add an upward dependency on StableHomotopyKTheoryPartII.

   **Repair test.** For Z=S⁰, the retained map is the identity of T^{tC_p}, without identifying that spectrum with a completed sphere. For Z=C_p₊ both sides are 0. For the §3.6 finite test R=𝔽_p, B=S⁰, B′=S⁰∨T₊, it gives π₀=𝔽_p on both sides, since the free summand has zero Tate construction. The excluded infinite ET example still gives 𝔽_p versus 𝔽_p². Thus the cell calculations retain their general finite-complex input and the stronger theorem has a single owner after its prerequisite.

One finding, P1. All three findings from round 3 are repaired. The package elaborates with only the three expected `sorry` warnings; its three admitted theorems are substantial counting headlines, not padding. The remaining defect is a supplier claim that no longer holds at the supplier's open head. The mathematical scope is appropriate and does not require rejection.

## Previous findings, checked first

Locations below refer to `packages/RefinedTraceMethodsPartII/README.md` unless specified otherwise. Quotes are from the repaired package, not source passages.

| Previous finding | Repaired passage and verification | Status |
| --- | --- | --- |
| F01, absolute prismatic ℤ_p example | Line 704: “For A = ℤ_p and R = 𝔽_p in weight 0”. Its displayed fibre is ℤ_p⊕ℤ_p[−1]. Line 705: “its Frobenius is not an isomorphism: its cofibre is `ℤ_p[−1]`”. Current PrismaticCohomologyPartII §§4.29 and 4.31 distinguish this from the zero cofibre of identity Frobenius. | Repaired |
| F02, additive exponent | Line 48: “the least integer with `p^jR = 0`, so that the additive group of R has exponent `p^j`”. The Check at 233 gives ℤ/4: j=2, exponent 4; 𝔽₂: j=1, exponent 2. The ramified example gives e=2,n=3,j=2, exponent 4, not 8. | Repaired |
| F03, local numbering and manifest | Line 788: “explicit W(k)-basis (Layer 9, §9.4)”. The ordinary and Nygaard bases are at 849–850. Every numeric `cited_for` section in `sources.toml` now resolves among the 40 headings; none is the nonexistent §4.4. The affected normalization and invariance references now resolve to §§4.2–4.3. | Repaired |

The repair report contains no settled non-actionable finding that needs reopening. I searched the rest of the package for the repaired patterns: absolute ℤ_p versus the abstract unit package, identity Frobenius, all uses of j and the additive exponent, the basis reference, and all local source-application ids. The new citation of riggenbach-cusp at §4.3 supports the stated perfectoid homotopy-invariance background; the general perfect-𝔽_p-algebra input is separately and correctly contracted from amm-perfectoid Proposition 5.1. No author manifest entry was changed.

## Verified sound

Reviewed all four author files, the nine-layer/40-subsection structure, the previous review and repair report, the board package index, overlap/citation/library leads, and both declared gaps. All fifteen seeded targets were reopened in the cached legal texts. Changed passages were recomputed, including the two prismatic Checks, exponent Checks and their source applications. For unchanged statements I used the preceding review's computed adversarial rows, not its unsupported prose summaries; the sample and headline rows below were checked again. Finite tests test the formulas and conventions; they are not proofs of the deep spectral theorems.

### Principles, organisation and shape

This is an extension of RefinedTraceMethods, with its boundary explicitly stated. It imports generic trace comparisons and does not rebuild the existing roadmap. The indexing arithmetic and cyclic cells feed Tate calculus, then the normalization and K-group calculations; relative filtered prismatic cohomology feeds the finite-chain-ring results. Those dependency requirements explain the order. There is no statement that the roadmap follows a source, source-chapter layer name, or unforced sequence copied from a source's organisation.

The generalities include p=2, perfect algebras that are not fields, regular noetherian axes coefficients, arbitrary perfectoid truncated-polynomial coefficients and ramified finite extensions of ℚ_p. No prime restriction, computational algorithm, copied source passage, process residue, HTML anchor, machine path, sorry'd data, `lemma`, or `set_option` was found in the author files. The algorithmic portion of akn24 is explicitly outside scope. Main-branch SuccessiveMinima and QuadraticCharactersAndReduction were read for house shape. Each layer has Examples and Dependencies; definitions have an API and at least three discriminating Checks. R01 is the exception to otherwise resolved proof-route inputs.

### Seeded source verification

These are page markers of the cached versions recorded by the manifest, not guessed published pagination. All cited works have manifest entries: fourteen readable texts and two settled uncertified works. No new text was needed, fetched or added. Source statements with known errors were checked against the package's corrected version; those are listed separately below.

| Seeded target | Text and locator opened | Hypotheses, identification and outcome |
| --- | --- | --- |
| 2.1 Pointed-monoid algebras | speirs-axes line 286, p.7; hn-cusp lines 105–113, p.3 | The pointed construction contracts the zero basis vector; the unpointed E₁-monoid formula is used with this contraction. Scalar and zero-monoid tests distinguish it from ordinary monoid algebra. |
| 2.3 Cyclotomic splitting | speirs-axes Lemma 4, line 272, pp.6–7; speirs-trunc lines 319–346, p.9; hn-cusp lines 105–113, p.3 | THH multiplicativity, the cyclic action and unstable Frobenius m→pm agree. Infinite-product applications retain the bounded-below/connectivity conditions. |
| 2.5 Coordinate-axes cells | speirs-axes Lemma 6 line 334, p.8; Lemma 9 line 360, p.9; Lemma 11 line 426, p.11; Proposition 12 line 456, p.12 | Period, cyclic repetition, dimension and parity cases agree; the exceptional integral 2-torsion cell is retained. |
| 3.4 Perfectoid coefficient tower | riggenbach-double Corollary 5.8 line 517, p.12, Lemma 5.13 line 668, pp.15–16; riggenbach-trunc Lemma 4.1 line 575, p.13; hn-cusp line 294, p.7 | Orientation, fixed-point/Tate index offset, can, Frobenius and transfer agree. Both mixed characteristic and perfect characteristic-p specializations are covered. |
| 3.5 Staircase lemma | hn-cusp lines 330–349, p.8; speirs-axes lines 1025–1046, p.26; riggenbach-trunc lines 1266–1272, p.27 | Sources use the forward/backward recursion across the cutoff. The abstract abelian-group statement is the same recursion, including s=0 with kernel A₀. No coefficient-specific isomorphism is assumed outside the stated ranges. |
| 4.2 Normalization squares | speirs-axes lines 110–162, pp.3–4; hn-cusp lines 89–103, p.3; hesselholt-cusp-polytopes line 373, p.8 | Axes normalization, conductor ideal and cusp quotient square agree. Nilpotent quotients and the separate homotopy-invariance input are retained. |
| 5.2 Regular planar axes | hesselholt-axes Theorem A line 21, p.1; decomposition line 36, p.1 | Regular noetherian 𝔽_p-algebra, positive degree, de Rham–Witt indices and finite sums agree. This is not restricted to perfect fields. |
| 5.3 Positive-characteristic affine axes | speirs-axes Theorems 1–2, lines 27 and 153, pp.1–4; Proposition 28 line 976, p.25; final assembly lines 1080–1117, pp.27–28 | Perfect fields and both parities are covered. The package corrects the printed characteristic-two odd indexing; the cell calculation gives the single eligible odd-weight factors. |
| 5.4 Characteristic-zero affine axes | speirs-axes Theorem 30 line 1163, p.29; Theorem 31 line 1228, p.30 | Cyclic-homology statement allows arbitrary ℚ-algebras; the K-group formula retains ind-smoothness. Differential-form degree shifts agree. |
| 6.2 Planar cuspidal curves | hn-cusp Theorem A lines 27–37, p.1; hesselholt-cusp-polytopes Corollary 1.7 lines 395–410, pp.8–9 | Coprime a,b≥2; perfect 𝔽_p-algebra for the Witt quotient; perfect field for the separate length statement. The package avoids the source's overgeneral length claim. |
| 7.2 Perfectoid truncated polynomials | riggenbach-trunc Theorem 1.1 line 67, p.2, Corollary 6.5 line 1279, pp.27–28; sulyma-slopes Theorem 1.1/Remark 1.3 lines 43–52, p.2 | All perfectoid rings, p-completion, r≥1, the V_e quotient and even vanishing agree. Perfect-field answers are checks of the general result. |
| 8.1 δ-pairs | akn-delta boundedness lines 121–125, p.4; Definitions 2.1–2.2 lines 296–311, p.8; Definitions 9.1–9.2 lines 1838–1864, p.45 | A has δ and R need not. Both bounded-torsion requirements and the relatively quasisyntomic conditions are present. Ordinary-base descent is restricted to flat base maps. |
| 9.2 Bounded syntomic cohomology | akn24 Lemma 2.8 line 344, p.8; Corollaries 2.13–2.14 lines 388–399, p.9; Corollary 2.16 line 408, p.9 | Weight i≥1, support interval [1,in−1], cohomological degrees 1 and 2, and the finite-field boundary agree. |
| 9.3 Angeltveit's quotient | akn24 Proposition 1.5 line 162, p.4; Proposition 2.18 line 419, p.9 and proof lines 437–452, p.10 | Finite residue field, quotient of finite group orders and exponent f·i(n−1) agree; a zero group contributes order 1. |
| 9.5 Even vanishing | akn24 Theorem 5.2 line 2074, p.46; Corollaries 5.5–5.6 lines 2084–2091, p.47; Lemma 5.9 line 2131, p.48; Corollary 5.10 line 2157, p.49 | Strict cutoff, j=ceil(n/e), ramification factor e and the two nilpotence exponents agree. The corrected additive exponent is p^j. |

The other changed source application was opened at riggenbach-cusp Theorem 1.1, line 152, and amm-perfectoid Proposition 5.1, line 558. The repaired prismatic example was checked against the actual current supplier, not inferred from the abstract unit-package definition.

### Computed adversarial table

Each row records values of the constructions and of the claimed formula/comparison. A pass applies to these computations and the checked hypotheses. The previous round's additional computed rows cover unchanged material outside this compact table.

| Statement | Instances | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| 1.1, first Lean headline: #S | (a,b,r)=(2,3,0),(2,3,1),(2,3,2),(3,5,1),(2,5,0) | Enumerated #S=5,11,17,26,8; 2#S+2=12,24,36,54,18, exactly (a+1)(b+1)+2rab | Pass |
| 1.2, second Lean headline: #T | Same five inputs | #T=1,3,5,12,2; 2#T=2,6,10,24,4, exactly (2r+1)(a−1)(b−1) | Pass |
| Counting degeneracy and truncation | a=b=2,r=0; a=b=m=0 | First S is infinite, ncard=0: LHS 2 versus RHS 9; cuspCount(0,0,0)=0 because Icc 1 0 is empty | Coprimality/positivity exclude false extension |
| 1.3 Witt indexing | S={1,2,3,4},p=2 | Chains {1,2,4},{3} have lengths 3,1; lengths sum to 4=#S | Pass, conditional on declared supplier contract |
| 1.4, third Lean headline | d=0,1,2,3; m=1,…,6 | Enumerations equal polynomial: d=0,1 give all 0; d=2 gives 0,2,0,2,0,2; d=3 gives 0,6,6,18,30,66 | Pass, including d=0 with integer subtraction |
| Word period and m=0 exclusion | d=3,m=6; m=0 | Primitive orbits (66−6−6)/6=9; empty word count 1 versus polynomial 3 at m=0 | Division by period and m≥1 necessary |
| Exponent convention, F02 | ℤ/4; 𝔽₂; ℤ₂[√2]/(√2)³ | j=2,1,2; actual additive exponents 4,2,4; p^j=4,2,4 | Repaired; not j or p^n |
| 2.1 contracted monoid algebra | Π₀, Π₂, zero monoid | Contracted ranks 1,2,0; uncontracted ranks 2,3,1 over nonzero k | Correct zero relation; native MonoidWithZero permits the last case |
| 2.3 splitting and convergence | k=𝔽_p,Π₂,weight 1; periodic rational coefficients | One 𝔽_p in each nonnegative degree; extra basepoint would double even ranks. Periodic weights each contribute ℚ to π₀, so ⊕ℚ lacks (1,1,…) in ∏ℚ | Splitting correct; bounded-below condition excludes bad convergence |
| 2.5 cell types and signs | xy,xyz,(xyz)²,xxy,period-one xx | xy: H̃₁=H̃₂=ℤ,B=1; xyz: H̃₂=H̃₃=ℤ,B=1; (xyz)²: H̃₅=ℤ/2,H̃₆=0 integrally, both 𝔽₂ mod 2; xxy=0; xx has H₀=H₁=ℤ | Parity and period-one exclusion discriminate |
| 3.1 Tate comparisons, R01 | T=𝕊,Z=S⁰; Z=C_p₊; trivial-action Hℤ | Retained fixed-cell map id on 𝕊^{tC_p}; free case 0→0. Hℤ Tate π₀=ℤ/p versus π₀(Hℤ_p)=ℤ_p. Segal-based lax unit gives ℤ_p⊗ℤℤ_p→ℤ_p, only completed isomorphism | Mathematical completion correct; sphere input missing at cited owner |
| 3.2 circle suspension | X=Hℤ,m=1,p | m=1: π₁=ℤ, all others 0; m=p Tate: odd groups ℤ/p, even 0; formulas with shift +1 give the same | Pass |
| 3.4 coefficient tower | R=𝔽_p,n=0,1,2; perfectoid R,n=0,1 | n=0 THH=𝔽_p[u]; fixed π₀ at n=1,2 is ℤ/p²,ℤ/p³; Tate π₀ is ℤ/p,ℤ/p²; V(1)=p. General n=0 coefficient A_inf/(d)=R, first Tate coefficient W₁(R)=R | Pass; index offset retained |
| 3.5 staircase | s=2,k=𝔽₂; s=0,A₀=0; all-zero maps on 𝔽₂ | At s=2 kernel parameter t=x₁∈ℤ/4 forces x₀=t mod 2,x₂=t, then the upper recursion; δ onto by the same two recursions. For y=(1,0,…) take x₀=1,x₁=x₂=…=0. s=0 gives kernel 0. Zero-map model gives kernel and cokernel infinite products of 𝔽₂ | Kernel ℤ/4=W₂(𝔽₂), cokernel 0; hypotheses exclude zero-map model |
| 3.6 finite-complex repair route | B=S⁰,B′=S⁰∨T₊ or S⁰∨ET₊,R=𝔽_p | Finite case π₀ map 𝔽_p→𝔽_p identity; infinite case 𝔽_p→𝔽_p² inclusion | First §3.1 comparison suffices; infinite model excluded |
| 4.2 normalization square | cusp (2,3), axes d=2 | Cusp conductor t², A/c=k,B/c=k[t]/t², both nil-reductions k. Axes image consists of pairs with equal constants; quotient constant difference k | Both square descriptions agree |
| 5.2 planar axes headline | k=𝔽₃,q=1,…,6; k=𝔽₂,q=4; k=𝔽_p[t],q=3 | Formula gives 0,𝔽₃,0,𝔽₃²,0,ℤ/9⊕𝔽₃; p=2,q=4 gives ℤ/4; regular imperfect coefficient contributes Ω¹=k dt | Witt lengths and de Rham degree agree |
| 5.3 affine axes headline | d=3,p=2,3; q=1,2,3,5 | Both parity formulas give 0,k³,k²,k⁸. At p=2,q=5 eligible odd weights 3,5 give 2+6=8 copies | Corrected odd indexing passes at p=2 and 3 |
| 5.4 rational axes headline | d=2,k=ℚ,q=4; k=ℚ(t),q=3 | K₄=ℚ from Ω⁰; K₃=ℚ(t)dt from Ω¹, versus Ω¹_(ℚ/ℚ)=0 | Coefficient generality and shift retained |
| 6.2 cusp headline | (2,3,r=1),p=5,3; (2,3,r=2),p=2 | T={1,5,7}: p=5 chain lengths 2,1 give ℤ/25⊕𝔽₅; p=3 gives 𝔽₃³. r=2,p=2 gives 𝔽₂⁵; lengths 3,3,5=#T | Quotient and p-typical answers agree |
| Cusp length restriction | (2,5,r=0),k=𝔽₃ or 𝔽₃×𝔽₃ | T={1,3}; Witt group ℤ/9 or (ℤ/9)²; module lengths 2 or 4, while #T=2 | Perfect field condition essential for length, not for quotient |
| 7.2 truncated-polynomial headline | e=1; 𝔽₃,e=2,r=2; 𝔽₂,e=3,r=1,2,3 | V₁ quotient 0; next quotient ℤ/9; last quotients ℤ/4,ℤ/8⊕ℤ/2,ℤ/16⊕(ℤ/2)²; even groups 0 | Direct chain quotients agree |
| 8.1 δ-pair conditions | ℤ_p→ℤ/p^n; square-zero torsion sum; A=𝔽_p; R=ℚ_p | First torsion killed by p^n; sum has orders p,p²,…, no bound. δ(p)=1 conflicts with δ(0)=0 in 𝔽_p. Derived p-completion of ℚ_p=0≠ℚ_p | Correct domain excludes all three wrong models |
| 8.2 repaired F01 | Absolute 𝔽_p; absolute ℤ_p; abstract unit package | 𝔽_p: φ=id, cofibre 0, syntomic weight 0=ℤ_p⊕ℤ_p[−1]. ℤ_p: actual cofibre ℤ_p[−1]≠0. Unit package gives same fibre as 𝔽_p but is not the ℤ_p prismatic object | Repaired; actual and abstract objects distinguished |
| 8.2 finite-stage bound | Absolute 𝔽₂,i=1,j=3 versus j=1; BK E=z−2,j=3 versus 2 | Absolute actual and j=3 answers 0; j=1 gives 𝔽₂⊕𝔽₂[−1]. BK actual map f↦zf+f²: H⁰ dimension 1,H¹ dimension 2; j=3 same, j=2 gives dimensions 0,1 | Strict inequality and quotient direction pass |
| 8.2 multiplicative package | c=id versus 2id on scalar step object | c(1)=1 versus 2; syntomic fibres ℤ_p⊕ℤ_p[−1] versus 0 | CAlg condition excludes scalar rescaling |
| 8.5 filtered comparisons | Step filtration A; δ(z)=0 or 1 | Rees=A[t]; generic fibre A, special fibre gr⁰=A; δ(z)=0 lies in F^p, 1 does not. BK special-fibre weight u is W(k)z^u on both sides | Pass |
| 9.2 finite syntomic headline | n=i=1; ℤ/4,i=1; ℤ/8,i=2 | Empty interval gives 0; ℤ/4 gives H¹=ℤ/2,H²=0; ℤ/8 gives H¹=ℤ/4⊕ℤ/8 (order32),H²=ℤ/2 (order2) | Support and cohomological degrees agree |
| 9.3 quotient headline | ℤ/4,i=2; ℤ/8,i=3; 𝔽₂[z]/z³,i=3 | 8/2=4=2²; 128/2=64=2⁶; (16·2·2)/1=64=2⁶ | Pass, with trivial group order 1 |
| 9.4 repaired basis locator | p=2,n=3,s=0,weights 2,3 | z₀² contributes rank1 at weight2 (wrong k<p gives0); f₀ contributes rank1 at weight3 (allowing z₀³ would give2). ℤ/4,i=1 model ranks1,2,1 | §9.4 is the correct owner; digit bounds discriminate |
| 9.5 even vanishing headline | (p,e,n)=(2,1,2),(2,2,3),(3,1,2),(2,12,3) | j=2,2,2,1; cutoff B=12,8,18,1; strict inequality gives i≥13,9,19,2. Nilpotence powers are respectively (6,3),(8,4),(12,4),(6,3) | Formula and ramified cases agree; no odd-prime restriction |
| 9.6 v₁ headline | ℤ/4; n=1; e=2,n=3 | [j]₂=3 with v₁³=0 and v₁²≠0 for ℤ/4; n=1 bound1 with v₁=0; ramified bound p+1, without a sharpness claim | Pass |

### Pins, duplication and Lean acceptance test

The package imports only `Mathlib`. Running `lake env lean` on its absolute filename from the content checkout exited 0 with precisely the `sorry` warnings for lines 61, 69 and 77. No Tau Ceti object build was required. A separate scratch copy with `#check @name` for all six declarations retained every intended binder: a,b≥2 and coprimality for the cardinalities, arbitrary r and d, and m≥1 for cyclic words. Its types agree with the README. The actual file has three definitions and three theorems.

The one-tactic probe was run on all three admitted theorems, using `rfl`, `simp` with the three real definitions, and `infer_instance`, each in a solving branch before the remaining `sorry`. All three still needed `sorry`. Pinned exact-lemma candidates were also opened: `Mathlib/Data/Nat/Totient.lean:79` counts coprime residues, `Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean:41` excludes inverse cancellation, and `Mathlib/Analysis/Complex/Periodic.lean:120` defines an unrelated analytic cusp function. None proves these statements. No theorem computes a single value, mirrors a Check, or treats only a boundary case.

| README headline | Acceptance-test disposition |
| --- | --- |
| Cusp truncation cardinality and Sylvester count, §§1.1–1.2 | `ncard_cuspTruncationSet`, `ncard_cuspCoprimeSet`; simple native Set/Finset definitions only |
| Cyclic-word multiplicities, §1.4 | `card_noCyclicRepetition`, native finite function space and `finRotate` |
| Regular planar axes, §5.2 | Named in docstring; algebraic K-theory and de Rham–Witt missing |
| Affine axes, §§5.3–5.4 | Named in docstring; algebraic K-theory, requisite Witt-valued groups and cyclic homology missing |
| Planar cusp K-theory, §6.2 | Named in docstring; algebraic K-theory and big Witt carriers missing |
| Perfectoid truncated polynomials, §7.2 | Named in docstring; algebraic K-theory and big Witt carriers missing |
| Relative/filtered prismatic theory, Layer 8 | Named in docstring; δ-ring, prism and prismatic-complex carriers missing |
| Finite-chain-ring syntomic structure, quotient, even vanishing, v₁ nilpotence, §§9.2–9.6 | Each family named in docstring; algebraic K-theory and syntomic-complex carriers missing |

Every backticked identifier attributed to this roadmap resolves to one of its six Lean declarations. The citation-tool lead `BigWitt.TruncationSet` resolves to `TauCetiRoadmap.QWittVectors/Suggested.lean:71`, at the supplied open head; it is a supplier target, not a pinned Mathlib claim.

Library declarations opened at the pins include:

| Object | Pinned file and line | Boundary of existing ownership |
| --- | --- | --- |
| `MonoidWithZero` | `Mathlib/Algebra/GroupWithZero/Defs.lean:125` | Has zero absorption and monoid laws; does not require nontriviality or commutativity |
| `MonoidAlgebra`, coefficient equivalence, singleton | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:76`, 136, 222 | Finite-support coefficient object, including a basis vector for a monoid's zero; the contracted quotient is additional |
| Witt vector coefficients and truncation | `Mathlib/RingTheory/WittVector/Defs.lean:52`; `Mathlib/RingTheory/WittVector/Truncated.lean:62` | ℕ-indexed and Fin n-indexed p-typical coefficients, not the arbitrary-truncation-set big Witt theory |
| Verschiebung, Frobenius, Teichmüller | `Mathlib/RingTheory/WittVector/Verschiebung.lean:109`; `Mathlib/RingTheory/WittVector/Frobenius.lean:218`; `Mathlib/RingTheory/WittVector/Teichmuller.lean:93` | Imported p-typical operators, not reconstructed |
| `finRotate` | `Mathlib/Logic/Equiv/Fin/Rotate.lean:27` | Supplies cyclic adjacency; no chromatic cycle-count formula found |
| `Nat.divisors`, Möbius inversion | `Mathlib/NumberTheory/Divisors.lean:53`; `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:54`, 177 | Existing divisor and arithmetic-function operations, imported rather than owned |
| `Set.ncard` | `Mathlib/Data/Set/Card.lean:643` | Infinite sets have ncard 0; theorem hypotheses and positive RHS exclude that escape |
| Kähler differentials and universal derivation | `Mathlib/RingTheory/Kaehler/Basic.lean:148`, 226 | Ordinary differential module, not de Rham–Witt or cyclic homology |
| Nodal algebra, coordinates and lift | `TauCeti/RingTheory/Node/Basic.lean:37`, 65, 75, 97 | Existing quotient by xy−a and universal ring maps; package owns additional cell/normalization calculations |
| Integral perfectoid ring | `TauCeti/RingTheory/Perfectoid/Integral.lean:76` | Existing perfectoid condition, including completeness and Frobenius/principal-kernel requirements; not K or TC |

Object searches covered these carriers, spectra/THH/TC, cyclic homology, big Witt truncation, δ-pairs, syntomic complexes, curve conductors and the three combinatorial statements in pinned Mathlib/Tau Ceti, main, board packages and indexed open heads. Scheme-morphism uses of “syntomic” are not syntomic cohomology. No existing declaration with these fully qualified target names or equivalent counting conclusion was found. The first two library candidate families above have different objects and hypotheses, so they do not justify deleting the counting headlines.

### Supplier resolution, open ownership and gaps

The board index was read before inventory decisions. The prescribed `roadmaps show`/`grep` tools were used for current open heads and main, rather than treating this board's single branch as the whole collection. Relevant resolved suppliers are below; sections are actual section identifiers, not declaration-name guesses.

| Supplier and current open PR where applicable | Resolved consumed objects |
| --- | --- |
| RefinedTraceMethods #1493 | §§1.2–1.4,1.9: mixed/cyclic theory; §§2.1,2.4–2.6,2.8–2.10,2.13,2.16: actions, parametrized Tate, subdivision, THH, cyclotomic and TR inputs; §§4.12,4.17–4.18: trace, rigidity and excision. §2.3 still supplies bounds and completeness but not the sphere theorem: R01. |
| KTheoryFiniteLocalFields #1281 | §§1.1–1.6,2.1,4.0,4.4,5.1,5.16–5.17: field K-theory input, rigidity, ordinary cyclic theory, cyclotomic models, characteristic-p and classical genuine monoid calculations. Modern pointed Frobenius and perfectoid extension remain distinct here. |
| QWittVectors #1351 | §§1.1–1.5, including §1.4a: truncation sets, big Witt operations and power-series comparison. General decomposition is explicitly a gap, not represented as already proved there. |
| AInfCohomology #1044 | AI.0 and AI.7.2: perfectoid rings, A_inf, trace and coefficient comparisons; Tate diagonal is supplied but the sphere equivalence is not. |
| CrystallineCohomology #857 | CR.2 and CR.4: crystalline and de Rham–Witt inputs, including the de Rham–Witt subsection CR.4.6. |
| DerivedDeRhamCohomology #868 | §§1.14–1.17 and Layers 2,5: filtered category, completion, Rees and completed Day convolution, derived de Rham and conjugate inputs. |
| PrismaticCohomology #1057 | §§0.55–0.56,0.73–0.76,0.93 and cited prism/envelope sections through §2.13: δ-rings, prisms and envelopes. |
| PrismaticCohomologyPartII #1065 | §§3.6,3.9–3.10,3.19–3.20,3.24; §§4.4–4.10,4.17–4.19,4.22–4.23,4.25,4.29,4.31: crystals, twists, Nygaard and absolute comparisons. In particular current README lines 1305 and 1329 lead to the repaired ℤ_p counterexample at 1350. |
| PrismaticCohomologyPartIII #1070 | §§6.8–6.9,6.28,6.31,7.0: syntomic and trace comparisons. Relative δ-base and filtered-ring theory here are different ownership. |
| GeneralAlgebraicKTheory #1212 | §§8.1,10.5: relative K fibres and localization input. |
| SchemeKTheoryOperations #1229 | §5.2: regular noetherian homotopy invariance and negative vanishing. Perfect nonnoetherian generality is the explicit gap. |
| StableHomotopyKTheory #1227 | §§7.9–7.10,7.14–7.18: stable, completed and Postnikov machinery, not the later Part II generalized Segal theorem. |
| BordismFormalGroups on main | F6.5 at `TauCetiRoadmap/BordismFormalGroups/README.md:1526`: norm, Tate, induced objects and lax monoidal structure. |
| EnhancedDerivedSheaves on main | E5:abstract.1, E5:abstract.2 and presentability.2 at `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1440`, 1456, 1624: coherent categories, algebras/modules and presentability. |

The closest open work was compared by scope and object: RefinedTraceMethods #1493 and PrismaticCohomology #1057, PartII #1065, PartIII #1070, PartIV #1080. The latter's logarithmic prismatic theory does not own the relative δ-base/filtered-ring construction here. Generic trace/excision belongs to the base roadmap; absolute prismatic and syntomic objects belong to their named suppliers. These are imported, not second constructions. StableHomotopyKTheoryPartII #1733 owns the all-primes sphere theorem, producing R01. The overlap file reports no shared-head conflict, dropped cited id, or id supplied only by an open revision; inspection found no separate numbering finding. The semantic change within §2.3 is why the mechanical overlap report alone did not detect R01.

Both declared gaps match the plan's top-level slugs and the exact supplier-contract paragraphs:

- `bigwitt-ptypical-decomposition`: `packages/RefinedTraceMethodsPartII/README.md:110`, plan gap at `packages/RefinedTraceMethodsPartII/design/plan.json:2106`, supplier QWittVectors §1.5. It specifies prime p, a ℤ_(p)-algebra, a truncation set, natural ring comparison and operator compatibility; this general big-Witt comparison is not supplied by the native p-typical carrier.
- `perfect-homotopy-invariance`: README line 130, plan line 2118, supplier SchemeKTheoryOperations §5.2. It asks exactly for nonconnective homotopy invariance over every perfect 𝔽_p-algebra; regular noetherian invariance does not cover this class. amm-perfectoid Proposition 5.1 supports the requested input.

These are precise named contracts, not unowned prerequisites or new findings. No gap was added. Because this verdict requires changes, `conditional_gaps` is not used as an acceptance flag.

The required dependency command was run with the supplied configuration, README, name, order, movable and content arguments. Its output was:

    depcheck: 236 roadmaps, 2145 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. All explicitly named suppliers occur earlier or on main. R01 is a semantic supplier-drift defect despite that syntactic pass; the proposed repair does not introduce an upward edge.

## Not verifiable

- `larsen-mixed`, the §2.6 cyclic-cell comparison cited by locator, is settled as uncertified. Its text was not available legally in the supplied cache; no new request was made and its contents are not claimed verified.
- `bach-hypersurfaces`, the §2.6 hypersurface Hochschild comparison cited by locator, is likewise settled as uncertified. No new request was made. The accessible Speirs/Hesselholt cell calculations and the independent small examples were checked.

No additional missing source or inaccessible sampled target was found. The acceptance build establishes signatures, not the truth of the admitted theorems.

## Source issues

- **Error** in hn-cusp at Theorem A discussion, printed p.1, line 36: the source says the quotient has the stated finite length for every perfect algebra; it should restrict that length formula to perfect fields; affects a stated result.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, printed p.8, line 395: the source says cardinality equals module length for arbitrary commutative coefficients; it should require simple Witt-filtration factors, in particular perfect fields in this application; affects a stated result.
- **Error** in speirs-axes at Lemma 15, printed p.13, line 506: the source says the lax Tate smash comparison is an integral equivalence; it should assert the p-completed comparison; affects a stated result.
- **Error** in speirs-axes at Theorem 1, printed p.1, line 64, and Theorem 2, printed p.4, line 191: the source says the characteristic-two odd answer has an extra valuation product; it should have one factor per eligible odd weight and word period, with the odd-degree cutoff; affects a stated result.
- **Error** in akn-delta at Proposition 8.6, printed p.43, line 1770: the source says (p−1)j≥i suffices for the finite-stage formula; it should use the sufficient strict bound (p−1)j>pi of Lemma 8.5; affects a stated result.
- **Misprint** in hesselholt-cusp-polytopes at proof of Lemma 1.4(5), printed p.8, line 371: the source says the second summand is bit; it should be bjt, giving 16 rather than 10 at (a,b,i,j,t)=(2,3,1,2,2); affects the proof.
- **Misprint** in akn24 at proof of Proposition 3.34, printed p.25, line 1098: the source says g-generator weights have an extra factor n; it should use Σp^u e_(u,v), as the proposition states; affects the proof.
- **Misprint** in akn-delta at Remark 8.2(iii), printed p.43, line 1740: the source says C_A forms a stack in stable categories; it should say categories, since CAlg(G_A) has distinct initial unit and terminal zero; affects nothing.
- **Misprint** in akn24 at Remark 5.3, printed p.46, line 2077, also footnote 1, printed p.4, line 189: the source says j is the additive-group exponent; it should say the exponent is p^j, with j=ceil(n/e); affects nothing.
- **Misprint** in akn24 at Example 1.7, printed p.4, line 182: the source says a vanishing even group has order zero; it should say order one; affects nothing.
- **Misprint** in hn-cusp at the linearization argument, printed p.3, line 115: the source says the connective TC of every perfect algebra k is ℤ_p; it should use TC(𝔽_p) and base change to THH(k); affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "55b8824781547a5ee934ea8c805182325d14cb50", "job": "REV-PKG-RefinedTraceMethodsPartII~4", "model": "gpt-6-astra", "worker": "chris-8"} -->
