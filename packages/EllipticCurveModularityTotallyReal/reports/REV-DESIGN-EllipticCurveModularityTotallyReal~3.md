<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12848#issuecomment-6788226792 -->
Review (codex) of 4ac4382

Verdict: needs_changes

1. **F01** (P1) The general cohomological twist convention needs the inverse cocycle

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:149`, through line 151: “on `H¹(X)` by `a_g^* ∘ ρ(g)`”.

   **Claim:** For the specified trivialization `φ : X′ → X` with `φ ∘ ᵍφ⁻¹ = a_g`, this formula transports the Galois action for an arbitrary cocycle.

   **Witness:** Take `K=ℚ(ζ₃)`, `b³=2`, `g(b)=ζ₃b`, `X:y²=x³+1`, `X′:y²=2x³+1`, and `φ(x,y)=(bx,y)`. Then `a_g(x,y)=(ζ₃⁻¹x,y)`. Transport on differentials multiplies by ζ₃; the displayed formula gives ζ₃⁻¹.

   **Exact repair:** Keep the point-action and trivialization conventions. Replace the cohomology formula by `(a_g⁻¹)^* ∘ ρ(g)`. Explain that the reflection specialization has `a_g=w^{e(g)}=a_g⁻¹`, so §§1.2–1.6 retain their formulas. Add the cubic-twist calculation as the non-involutive convention Check.

   **Repair test:** Naturality gives `ρ_X′(g) φ^* = (ᵍφ)^* ρ_X(g)`. Since `ᵍφ=a_g⁻¹φ`, the right side is `φ^*(a_g⁻¹)^*ρ_X(g)`. In the example, `φ^*ω=bω′`; applying g gives `ζ₃bω′`, hence ζ₃ after transport back. On the two conjugate eigenspaces the correction has eigenvalues `(ζ₃,ζ₃⁻¹)`, whereas the written formula gives `(ζ₃⁻¹,ζ₃)`. These are different operators under the specified φ, even though their unmarked characteristic polynomials coincide. For w of order two both formulas give w*. This also follows by dualizing the transported Tate action `a_g ρ_T(g)`; the pinned Tate action is covariant, and the roadmap explicitly makes H¹ its dual.

2. **F02** (P3) The repaired induction Check still doubles the trivial extension

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:574`: “`W_θ ⊗ Ind_{G_M}^{G_L} 1 = W_θ ⊕ W_θ ⊗ δ`”; also `packages/EllipticCurveModularityTotallyReal/design/plan.json:234`.

   **Claim:** The displayed direct-sum equality holds in the arbitrary-number-field layer, including M=L.

   **Witness:** For `k=ℚ(√−3)`, n=3, M=L and δ=1. The left side has dimension `2·1=2`; the displayed right side has dimension `2+2=4`. The following positive control itself says the answer is rank two.

   **Exact repair:** State `Ind V_θ ≅ W_θ ⊗ Ind 1` and its dimension `2[M:L]` generally. State the decomposition `W_θ ⊕ (W_θ⊗δ)` only when `[M:L]=2`. For M=L, state `Ind V_θ=V_θ≅W_θ`. Apply the same case distinction to the plan test.

   **Repair test:** Over ℚ with n=3 the permutation representation has characters 1 and δ, and dimension two; induction has dimension four. Over ℚ(√−3) the permutation representation is just 1, and induction has dimension two. This finishes previous F02 without narrowing the theorem.

3. **F03** (P2) Different deck labels do not imply noncongruent Galois representations

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:690`: “`χ̄ = ψ̄ ≠ 1 = η̄`, so `W_χ ≡_3 W_ψ` and not `W_η`”; also `packages/EllipticCurveModularityTotallyReal/design/plan.json:367`.

   **Claim:** Unequal residual character evaluations rule out an isomorphism of the residual Galois representations for every permitted base and parameter.

   **Witness:** Fix n=15 and any rational admissible t. Put `J=Pic⁰(C_15(t))`, `k=ℚ(μ₁₅,J[3])`. Then M=L=k and every residual rank-two evaluation is trivial: both sides are `κ²` with identity Galois action, despite `ψ̄≠1`.

   **Exact repair:** Replace the negative conclusion by: the character-evaluation argument gives the three specified congruences; at three it identifies χ with ψ, and does not identify its evaluation map with η's. Do not assert that accidental Galois congruences are impossible. Add the finite-extension example as a positive control, in README and plan. No main congruence theorem needs weakening.

   **Repair test:** The finite field of definition of J[3] kills the mod-three H¹ action (μ₃ is included). Tensoring the free regular module with either evaluation gives a trivial rank-two module. Thus every g has matrix I₂, trace 2 and determinant 1 on both reductions, with characteristic polynomial `(X−1)²`. Nevertheless an order-five root stays order five in characteristic three: `χ̄=ψ̄` has order five and η̄ has order one. The corrected assertion distinguishes unequal deck evaluations from isomorphism after forgetting the deck action. The same finite-extension control applies to the supplier's informal “reversing these primes” language; its actual theorem only asserts the three positive congruences.

Three findings: one P1, one P2 and one P3. The main reflection/lifting route survives these repairs. The three declared supplier gaps are valid contracts; their absence upstream is not a finding. No design, plan or source-manifest entry was changed.

## Previous findings, checked first

The prior report's computed rows were used only for unchanged mathematical claims. All repaired passages, the three gaps, every seeded source target, all supplier citations and the extra generality tests above were checked again. No prior finding was marked not actionable.

| Previous finding | Repaired passage, with location in the design README | Status and verification |
|---|---|---|
| F01, duplicate ownership of the CM endomorphism field | Lines 81–84: “belongs to ComplexMultiplicationAndExplicitReciprocity Layer 1”; lines 394–402 give `gap:cm-elliptic-endomorphism-field`; lines 1148–1150 consume it. | Repaired. The owned target is now the totally real automorphic application. The upstream owner differs from the prior suggested owner, legitimately: its §1.1 already uses the Lie-scalar argument, and CMRankZeroConverse places its j=0 descent contract there. The plan records the same general contract and supplier. |
| F02, trivial-extension and general-degree Checks | Lines 527 and 533 say “δ nontrivial”; lines 727–729 say “multiplication by the degree `n/d`”; lines 575–577 give “rank `2[M:L]`” and the trivial-extension control. | Partly repaired. The matrix/cocycle guards and general degree are correct. The newly inserted direct-sum equality is still unconditional: R02. |
| F03, geometric disconnection versus integrality | Lines 873–879: “not geometrically integral”; “If `ζ₃ ∉ K` … P is integral”; “two K-components” if ζ₃ is in K. | Repaired. Over ℚ the arithmetic group has order 48 and one orbit; over ℚ(ζ₃) it has order 24 and two orbits. Both have two geometric components. |
| F04, characteristic-two differential | Lines 1187–1191: “`dx/(2y + a₁x + a₃)`”; over 𝔽₂, “`ω = dx`”; “`d(x²) = 2x dx = 0`”. | Repaired. The two smooth models have discriminants 1 modulo 2 and 3. Their nonzero Frobenius maps kill the specified nonzero invariant differential. The plan agrees. |

The repaired-pattern search also checked the d≥3 divisor guard, 3 dividing n for the cubic endpoint, the trivial-character lattice control, the order of system assembly, coefficient field versus integers, the F₅-model condition, and residual unramifiedness versus unramified extension. Those repairs remain present. R03 is an additional finite-base-extension failure of a negative Check; the earlier table computed the deck labels, which does not establish the negative Galois conclusion.

## Verified sound

Read all 18 plan targets, 68 plan Checks, the README's APIs and Checks, and every Needs line. The four layers proceed from reflection descent and its invariants, to lifting and seeds, to one simultaneous parameter and three lifts, to descent and the endpoint. Dependencies force this order. It is not the source's expository order: LeHung26 puts lifting before reflection descent. The design retains arbitrary totally real degree, CM curves, all coefficient primes, bad places and monodromy. It imports the geometric construction instead of replanning it. No computational algorithm, good-primes-only replacement, copied source passage, forbidden supplier, sorry'd data, set_option, job identifier, machine path or PR number was found in the design text.

### Adversarial calculations

The table records numerical or algebraic values, not a claim to have proved modularity computationally. It covers every target, all fifteen seeded targets, the headline statements, repaired passages and finding locations. Characteristic-zero number fields exclude zero rings, inseparable field extensions and nonreduced base fields. Smooth elliptic curves exclude singular cubics and rank-zero H¹. The odd-prime restriction belongs to lifting; it is not imposed on the endpoint's coefficient prime.

| Statement | Instances and values on the two sides | Result / change |
|---|---|---|
| H¹, Frobenius and unitary normalization | 11a1 over 𝔽₃ has 5 points, so a₃=4−5=−1 and polynomial `X²+X+3`. Dual roots have trace −1/3 and product 1/3 instead of −1 and 3. Unitary roots have product 1; shifting s by −1/2 gives `1+3^(−s)+3^(1−2s)`. | Matches AG §§3.10, 4.4 and the covariant pinned Tate action after duality. The opposite half-shift gives exponents −s−1 and −2s−1. |
| Quadratic twist sign | `y²=x³−x+1` over 𝔽₅ has 8 points; multiplying the cubic by 3 gives 4. Traces −2 and 2 equal multiplication by the quadratic character −1. | Correct in conventions, §§1.2, 1.6 and 4.1. |
| General twist convention | For the cubic twist in R01, `φ*ω=bω′`, `g(b)/b=ζ₃`, while `a_g*ω=ζ₃⁻¹ω`. On a basis with order-three matrix R, `R²=[[-1,1],[-1,0]]≠R=[[0,−1],[1,−1]]`. | R01. Quadratic examples alone did not discriminate the inverse. |
| 1.1 real cyclotomic data | ℚ,n=3: root sum −1, L-degree 1, M/L-degree 2; δ(Frob₂)=−1, δ(Frob₇)=1. n=9: minimal polynomial `x³−3x+1`, degree 3; n=15: degree 4. k=ℚ(ζ₃),n=3: M=L and degree 1. k=ℚ(i),n=3: L=ℚ(i), but maximal real subfield of M is ℚ(√3). | Relative and totally real cases separated. For d=1, δ_d(c)=1 versus δ₃(c)=−1, supporting d≥3. |
| 1.2 reflection twist | With `R=[[0,−1],[1,−1]]`, `W=[[0,1],[1,0]]`, direct multiplication gives `WRW=R²`, `R³=I`, `WR²W=R`. For δ=1, descent is unchanged. Cubic branch valuations for n=5 are 1,−1,−5,5: `2g−2=8`, g=5. For n=15 only two ramify: `2g−2=4`, g=3. | Repaired guards work. No order-three-cocycle assertion is needed for the actual reflection construction. |
| 1.3 eigenspaces and induction | n=3 gives `6=2+2+2`; the θ projector has rank 2, the zero projector rank 0. `dim Ind V=2[M:L]` is 4 over ℚ and 2 over ℚ(ζ₃). In the latter case the displayed direct sum has rank 4. | Eigenspace construction passes; R02 corrects its induction Check. |
| 1.4 determinant, weights and assembly | Reflection-paired bases give `[e₁,e₂]=1`, `[e₂,e₁]=−1`, diagonal entries 0. On W₁, `det=ε⁻¹δ²=ε⁻¹`; at real conjugation its value is −1. Weights add to 0+1=1, matching the cup-product target. Good polynomial degree 2 and constant q≠0 match rank 2. | Correct. Eigenspaces precede properties and raw assembly; no circular definition. At k=ℚ(ζ₃) there are zero real places, so oddness is only asserted conditionally. |
| 1.5 integral evaluation | At ℓ=3, `v₃(1/3)=−1`, every character value has valuation 0; `O[μ_n]²⊗_θ O=O²`, rank 2. At p the labels (η,χ) reduce to (η,η), and (ψ,1) to (1,1); at 3, (χ,ψ) reduce to (ψ,ψ), and (η,1) to (1,1). | Seven lattice API facts have the stated domains; no integral projector is used. |
| 1.5 negative congruence Check | Over `k=ℚ(μ₁₅,J[3])`, χ̄ has order 5 and η̄ order 1, but both residual Galois modules are κ², every matrix I₂, trace 2, determinant 1. | R03: label inequality does not imply noncongruence. |
| 1.6 elliptic endpoints | For n=3, w-invariants contribute `0+2=2` from pieces of dimensions 2 and 4; projection sends `x+wx` to x. Norm after pullback is 15 for n=45,d=3, and 101 or 3 for n=303,d=3 or 101. | Correct general-degree repair. At an inert place the trace is multiplied by −1, not by 1. |
| 2.1 change of prime | At 11a1's place 3, every ℓ≠3 has `X²+X+3`. A triangular nonsplit extension and the split `1⊕ε⁻¹` both have `(X−1)(X−q)` but different extension class (nonzero versus zero). | Semisimplicity is essential; fixed coefficient embeddings identify the same π. |
| 2.2 weight-two summand lifting | e=0 has dimension 0 and is excluded; elliptic e=1 has dimension 2 and weights 0,1. At c, −1 reduces to 2 in 𝔽₃ and 1 in 𝔽₂. In 𝔽₂₅, B²=2I, C²=I, det C=4, while det B=3. | Odd-prime guard and actual F₅-model alternative preserved. For generic elliptic mod-five image, cyclotomic projective image has order 60, so alternative (a) fails and (b) matters. |
| 2.3 switch curve | Enumerated GL₂(𝔽₃) and SL₂(𝔽₃): orders 48 and 24. Rational-line stabilizer in SL₂ has order 6. Borel and Cartan-normalizer orders 12,8,16 are smaller than 24. Frame components: degrees 24+24 geometrically; one arithmetic component over ℚ, two over ℚ(ζ₃). | Repaired integrality Check matches Hilbert supplier. Rational point (E,id) and genus zero give ℙ¹; finite j fibres turn infinitely many parameters into infinitely many j-values. |
| 2.4 mod-three seed | Normal-series orders 48,24,8,2,1 give abelian quotient orders 2,3,4,2. Dual determinant at c is 2≠1 in 𝔽₃. An unramified local extension preserves inertia diag(−1,1); restriction to the kernel of its quadratic character gives I₂. | Seed hypotheses and the corrected residual-weight gap route agree. The BLGG argument is not claimed to prove the whole general gap. |
| 2.5 mod-five seed | Cyclotomic restriction of a full GL₂(𝔽₃) image is SL₂ of order 24; line stabilizers have order 6 or divide 4, never 24. Dualizing a five-torsion isomorphism gives identical residual H¹. 11a1 has a fixed five-torsion line, hence fails the premise. | Correct; no original mod-three hypothesis is introduced. |
| 3.1 simultaneous parameter | At a cubic λ, `2−λ−λ⁻¹=3≠0 mod5`. The unit-group orders for 𝔽_(3^a), a=1,2,3,4, are 2,8,26,80, below p>100. At p=101, n=303, L-degree is 100 and M/L-degree 2; `L(ζ₃)=L(ζ₁₀₁)=M`. | The arbitrary-base specialization is imported with the normal-closure prime choice. Subgroup irreducibility has the correct direction. |
| 3.2 auxiliary seed | Both cubic spaces have dimension 2 and realize the same H¹(A_t). An invariant line for the larger group would be a line for the smaller; the smaller invariant-line set is empty. `{5}∩{3,p}=∅`. | Seed can be applied over L directly; it also satisfies the residual condition over K. |
| 3.3 three lifts | Prime sequence p,3,p; residual label pairs (η,η),(ψ,ψ),(1,1). All target ranks are 2, determinants ε⁻¹, weights 0,1; five occurs zero times. | The three rows match their individual lifting inputs. |
| 4.1 descent | `W₁⊗δ=H¹(B_t)` and `H¹(B_t)⊗χ_h=H¹(E)` because δ²=χ_h²=1. For square h(t), χ_h=1. A rank-one stable lattice reduces to a residual line, contradicting the cyclotomic absolute irreducibility. | Same-representation soluble descent applies; the chosen descent is not inferred just from equal restrictions. |
| 4.2 all primes and places | 11a1 at 11: rank N=1, conductor exponent 1, factor `(1−11^(−s))⁻¹`. For `x³−x+1`, Δ=−368 and c₄=48, with v₂₃(Δ)=1; 5 is nonsquare mod23, residue degree 2, and the multiplicative sign squares to 1. Gaussian CM curve at 2: exponent 5, factor 1. `Γ_ℂ(s+1/2)` shifted by −1/2 becomes `Γ_ℂ(s)`. | Degree 2/1/0 finite factors and nonzero monodromy retained; no coefficient prime, including 2, omitted. |
| CM field contract and 4.3 | For `y²=x³−x`, `[i]*ω=iω`, conjugation sends i to −i. Kernel fields over ℚ, ℚ(√2), ℚ(i) are ℚ(i), ℚ(ζ₈), ℚ(i). Counts at 3 and 5 are 4 and 8, giving traces 0 and −2; split roots −1±2i have product 5. `y²=x³+1` at 5 has 6 points, trace 0. | Contract gives both directions of field-of-definition criterion; the totally real case has degree 2 and distinct weights 0,1, hence cuspidal induction. |
| Characteristic-p differential control | `y²+y=x³` over 𝔽₂: Δ=−27=1, denominator 1, 3 points, `Frob*dx=d(x²)=0`. Over 𝔽₃, `y²=x³−x`: Δ=64=1, 4 points, `Frob*(dx/2y)=0`. | F04 repaired. Characteristic zero cannot be dropped from injectivity of the differential scalar. |
| 4.4 endpoint | Non-CM `x³−x+1` has `j=48³/(−368)=−6912/23`; CM `x³−x` has j=1728. These choose different branches but both conclude rank 2, determinant ε⁻¹, level equal to conductor. Everywhere good reduction has all exponents 0, product ideal (1), level 1. | Both branches and unit-ideal case covered. No degree-two or √5 exclusion enters the quantifiers. |

### Source sample and manifest

All nine recorded texts were readable in the supplied legal cache. No author-flagged unverified locator was present, no new fetch was necessary, and the manifest was left unchanged. Its nine unique keys match all nine referenced works; version notes distinguish preprint pagination from published pagination. The following are the fifteen seeded targets; theorem numbers, pages and hypotheses were read at the indicated extraction locators.

| Target | Source locator opened | Verification |
|---|---|---|
| 1.1 | LeHung26 line 237, §3.2 p.6 | Source has totally real K and n=3p. General relative claim is separately justified by `X²−(ζ+ζ⁻¹)X+1`, abelian cyclotomic restriction and the explicit nonreal-root guard. |
| 1.2 | LeHung26 lines 237–249, (9), Lemma 3.2 p.6 | Reflection descent, rational rotations and quotient formulas match. The source's cocycle is involutive, so it does not support the arbitrary-cocycle error R01. |
| 1.4 | LeHung26 lines 241–248, Lemma 3.2 p.6; OpenAI26 lines 480–514, Proposition 5.1 pp.12–13 | Pairing, rank, Hodge numbers, semisimplicity and common traces match; assembly is after these results. |
| 1.5 | LeHung26 lines 243–247, (10) p.6; OpenAI26 lines 547–578, Lemma 5.3 p.13 and Corollary 5.4 p.14 | Both texts assert positive congruences from equal evaluations. Neither asserts R03's converse. |
| 1.6 | LeHung26 lines 244–249, (11) p.6; OpenAI26 lines 521–541, Proposition 5.2 p.13 | Rational pullback/projection and the quadratic twist agree; the design explicitly guards the cubic index. |
| 2.1 | LeHung26 lines 221–224, §2.4 p.5 | Common polynomials plus semisimple recognition give the change of prime with fixed labels. |
| 2.2 | LeHung26 lines 231–235, Proposition 3.1 p.6; BD14 lines 2144–2176, Théorème 3.2.2 pp.36–37; FLHS15 lines 116–120, Theorem 2 p.3, and 221–265, §2 pp.5–6 | Le Hung excludes 2 and 5. The BD universal conclusion includes potentially semistable noncrystalline lifts. The extra five-adic argument uses a genuine F₅-model with cyclotomic determinant (dualized here), as stated in the gap. |
| 2.3 | FLHS15 lines 421–452, Lemma 6.1 and proof p.10 | Arbitrary number field, symplectic five-torsion comparison and SL₂ mod-three image. Infinitely many j-values are the design's Hilbert/finite-fibre consequence, not a misquotation of the lemma. |
| 2.4 | FLHS15 lines 404–412, Theorem 6 and Corollary 5.1 p.9 | Elliptic mod-three residual modularity and the cyclotomic irreducibility condition agree. General cohomological-weight modularity remains a declared gap. |
| 2.5 | FLHS15 lines 127–128, Theorem 3 p.3, and 426–429, proof p.10 | Five-adic seed and switch argument match; no hypothesis on E[3]. |
| 3.2 | LeHung26 line 264, §3.4 p.7; FLHS15 line 127, Theorem 3 p.3 | Auxiliary curve over L provides the seed through the cubic endpoint. |
| 4.1 | LeHung26 lines 270–271, §3.4 p.7, and 357–360, Lemma 5.1 p.9 | Abelian descent requires irreducible restriction; twisting recovers E. |
| 4.2 | LeHung26 lines 361–363, §5 p.9; FLHS15 lines 66–77, §1 p.2 | Compatible modular realization and L-function normalization supported. Detailed all-place WD, conductor and archimedean assertions are supplied by the specific resolved roadmap contracts below. |
| 4.3 | LeHung26 lines 364–366, §5 p.9; OpenAI26 lines 1200–1215, §9.4 pp.27–28 | Differential argument and induced versus sum branches match. Arbitrary characteristic-zero field extension of the differential statement is explicitly a supplier obligation. |
| 4.4 | LeHung26 lines 86–93, Theorem 1.1 p.2 | Source is conditional on geometric Inputs 2.1–2.2; the design names their owning proved targets instead of treating them as unowned assumptions. |

Also read the unseeded §1.3 at LeHung26 line 241; §3.1 at LeHung26 lines 250–260 and OpenAI26 lines 990–1033 (Proposition 8.4 p.23 onward); §3.3 at LeHung26 lines 264–269. OpenAI26's two-factor argument is not silently generalized here: the arbitrary-base extension belongs to the imported §7.4.

The supporting gap citations were checked as well: BLGG12 lines 2024–2052 (Theorem 6.1.5 pp.41–42) and 2192–2223 (Theorem 6.1.8 p.45); BLGG13II lines 82–159 (Theorems 2.1.2, 3.1.1–3.1.2 pp.2–4); Kisin09 lines 3976–4009 and 4068–4075 ((3.5.5) p.1170, (3.5.7) p.1172); SW99 lines 2468–2505 (Theorems A–B pp.74–75); BCDT01 line 15 (Theorem A p.1). The ordinary, residual-image, local-field and Hypothesis H restrictions are not erased. The BLGG13II proof's p=3 setting is explicitly acknowledged in the gap discussion.

### Supplier resolution and ownership

Read the main READMEs of ModularCurves, EllipticCurves and JacobianChallenge for house shape and their actual foundational interfaces. Used `roadmaps show` for all 20 named supplier roadmaps and `roadmaps grep` by object across main and the supplied open heads. Numbers below are actual README line numbers, excluding the tool's provenance header. Each roadmap path is `TauCetiRoadmap/<name>/README.md`.

| Supplier | Resolved sections and content |
|---|---|
| EllipticCurveModularityImaginaryQuadratic, #1048 | §0.2 at 559–601: fixed-pairing twists/rationality; §1.1 at 860–883: arbitrary-base U; §1.3 at 957–981: covers/quotients/reflection; §3.1 at 1150–1156: integral marking; §§4.1–4.4 at 1258–1412: systems, endpoints, lattices and positive congruences; §5.1 at 1435–1456: non-CM large image; §7.1 at 1854–1875: geometric irreducibility; §7.4 at 1980–2060: arbitrary-base simultaneous specialization. |
| AutomorphicGaloisRepresentations, #1007 | §3.10 at 2218 and 2264–2274: cohomological attachment and twist; §3.13 at 2340–2349: geometric rank-one characters; §3.14 at 2398–2400: determinant/oddness/irreducibility; §4.4 at 2519–2525: full away-prime WD; §4.7 at 2543–2545: coefficient-prime comparison without residual restrictions. |
| AutomorphicGaloisRepresentationsPartII, #1006 | AG2.0: IsAttached and character/twist interfaces; AG2.P, independent Hilbert members at 488–535: cohomological member, dual adapter and exact normalization. |
| PotentialAutomorphyInfrastructure, #1081 | §2.3 at 819–830: descent of the specified representation, with irreducible restriction and finite-place parameters. |
| GL2AutomorphicRepresentationsAndTransfer, #931 | R16.2.13 at 929: real/complex parameters; R16.3.2 at 961: N≠0 Steinberg; R16.3.5 at 995: conductors; R16.3.6 at 1036: gamma factors; R16.4.4 at 1136: Hecke-data comparison; R16.6.3–4 at 1349–1381: weight/normalization adapters; R17.4.16 at 2692–2711: quadratic induction; R17.5.14 at 2977–2983: only weight-one residual modularity. |
| GL2ModularityLifting, #1071 | §§5.7 and 5.10 at 1334–1350 and 1394–1412 have the stronger local/ordinary restrictions described by the design. The general BD theorem is correctly declared as a gap. |
| ArithmeticGaloisRepresentations, #856 | Layers 1–3 give representations/lattices/WD/conductors. §4.1 at 3143–3149 states GaloisRep.IsOdd; §5.3 at 3519–3529 states GaloisRep.iso_of_frobenius_charpoly_eq; §6.1 at 4064–4081 states TateModule.residualRep on native torsion, with §6.2's pairing/determinant. These are planned supplier names, not pinned declarations. |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | IG.2.4 at 1965–1983 needs integral covers, not geometrically integral ones; IG.2.6 at 2165–2178 includes connected-torsor-to-field conversion; IG.2.7 at 2304–2323 gives Hilbert finite avoidance/approximation. |
| ModularCurvesPartII, #913 | §4.10 at 1560–1582: fixed-pairing connectedness and irreducibility for N≥3, including 15. |
| ModularCurves, main | §0E at 839–875: polarized projective-curve descent and finite actions; Layers 3 and 5B: level structures and fixed-pairing curves. Canonical polarization is ample at genus m≥3. |
| EllipticCurves, main | Layer 0.5 at 398–420: Galois actions/morphism descent; Layer 1 at 593–619: differential and separability; Layer 4.5a: local models; Layer 5: twists. |
| JacobianChallenge, main | Layers D–F; 42–46 explicitly allow Pic⁰ without a rational point. A chosen point normalizes the Abel–Jacobi map. |
| SmallRamificationAndAbelianVarietyBaseCases, #970 | §5.0d at 1993–2024: raw carrier, finite realization fields and geometric Frobenius convention. Here the M₀-completion model is constructed from rotation eigenspaces, not inferred from polynomial coefficients alone. |
| PotentialModularityAndCompatibleSystems, #1075 | §1.1 at 95–110: weak-family comparisons; §1.6 at 210–240: automorphy by good polynomials and the separate away-coefficient strictness predicate. |
| AbelianSchemesAndArithmeticModuli, #849 | A4.1 at 1838–1853: integral Tate modules; A6 and A6.11 at 3042–3057: endomorphism realizations and integer, ℓ-independent characteristic polynomials. |
| NeronModelsAndSemistableAbelianVarieties, #852 | §3.10 at 1895: semistable reduction; §5.1 at 3109: NOS; §5.3 at 3200: finite-local-field comparison; §5.6 at 3755–3777: local Euler polynomials; §6.10 at 4296–4311: compatible H¹. The H¹/Tate dual and monodromy normalization agree. |
| FaltingsFinitenessAndIsogenyTheorems, #1004 | R28.4.5 at 1858–1862 gives semisimplicity at every prime over a number field. |
| ShimuraVarieties, #933 | §5.3 at 1525–1553 gives the CM algebra action and eigenspaces over ℂ. The design no longer attributes KT descent to it. |
| ComplexMultiplicationAndExplicitReciprocity, #1254 | Layer 1, §1.1 at 339–345 uses Galois equivariance of the Lie scalar. The new gap is placed before this section; its absence today is an explicit contract. CMRankZeroConverse #1744's gap:cube-sum-full-cm uses the same owner for the j=0 specialization. |
| EtaleCohomologyFoundations, main | §0.11 at 1157–1175: trace and curve duality, with its adic realization layers, supplies the cup-product target ℚ̄ℓ(−1). |

The old CM collision was checked directly at open #1727, `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1628`, and #1048, `TauCetiRoadmap/EllipticCurveModularityImaginaryQuadratic/README.md:2286`. The former gives the differential field criterion; the latter uses KT in its CM application. This design now owns neither general construction: it requests one earlier CM supplier contract. The relocation to that owner, documented in the repair report and plan, allows both applications to consume it. No upward edge to #1727 is introduced.

The five closest overlap heads were read: #1048 owns the imported geometry and imaginary-quadratic endpoint; #1036, `TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md:3`, owns GL₂-type varieties over ℚ and ℚ-curves; #1484, `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:3`, owns the rational wild-three method; #1075 owns general compatible-family infrastructure; #1746, `TauCetiRoadmap/AbelianSurfacesModularity/README.md:3`, owns the rank-four surface switch. #2137, `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md:3`, is defect-one weight-one/Bianchi theory, not the missing general BD theorem. The new relative reflection systems and arbitrary-totally-real elliptic application have their appropriate owner here. No duplicate fully qualified Lean declaration is present because this design contains no Lean file.

The supplied overlap facts list no conflicting head, dropped cited id, or id available only in an open revision. Current resolution found no unresolved cross-roadmap citation. The overlaps CLI cannot recompute a report for this unported design name; it says no such roadmap is on main or an open roadmap PR, so the supplied design-specific overlap file was used. The board package index was read first. AnalyticNumberTheory and LogicAndDefinabilityInNumberTheory were read at the supplied heads; their scopes add no competing object. LawrenceVenkateshMethod remains inaccessible, as recorded below. HilbertModularForms §11.3 at 2401–2421 was opened as a downstream contract, not a supplier.

All three gaps have matching README/plan slugs and named earlier suppliers. Their hypotheses and single mathematical conclusions are precise. The lifting gap asks for the missing general theorem, the residual gap for a cohomological-weight witness rather than the supplied weight-one one, and the CM gap for field descent rather than just an algebra action over ℂ. None is charged as an unowned prerequisite.

### Pinned declarations opened

The revisions in lake-manifest.json are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches used those trees by object as well as name. File/line witnesses below were opened with their hypotheses; they are not assertions about a newer library.

| Pinned file | Declarations and actual scope |
|---|---|
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:48` | NumberField.IsTotallyReal quantifies over all infinite places; maximalRealSubfield at 126 uses every complex embedding; IsTotallyReal.le_maximalRealSubfield at 140 and isTotallyReal_maximalRealSubfield at 157; IsTotallyComplex at 210. A single chosen real embedding does not suffice. |
| `Mathlib/NumberTheory/NumberField/CMField.lean:70` | IsCMField; CMExtension.eq_maximalRealSubfield at 456; IsCMField.ofCMExtension at 510; IsCyclotomicExtension.Rat.isCMField at 564 explicitly requires a cyclotomic index greater than 2. |
| `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74` | IsCyclotomicExtension asserts primitive roots and algebra generation over commutative rings. Number-field and reality assumptions are additional. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366` | WeierstrassCurve.IsElliptic means invertible discriminant. WeierstrassCurve.j at 388 is Δ′⁻¹c₄³ under ellipticity, not the invariant of an arbitrary singular equation. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:80` | WeierstrassCurve.tateModuleGaloisRepresentation acts covariantly on every torsion level; prime binder at 75. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52` | TauCeti.det_tateModuleGaloisRepresentation has cyclotomic determinant, with ellipticity, separably closed extension and ℓ≠0 in the field. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:164` | quadraticTwistOf; quadraticTwist at 469 requires a separable quadratic extension; quadraticTwistPointEquiv at 824; quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map at 945. The trivial extension is handled by the explicit untwisted branch. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77` | WeierstrassCurve.torsionGaloisAction on actual N-torsion. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean:225` | TauCeti.Isogeny.weilPairing on torsion, valued in roots of unity, with separable closure and N invertible. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Galois.lean:104` | WeierstrassCurve.weilPairing_torsionGaloisAction, preserving the coefficient action on roots of unity. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Torsion/Structure.lean:149` | WeierstrassCurve.nonempty_basis_torsionBy gives a Fin 2 basis over ZMod N; section assumes IsSepClosed, and the declaration keeps ellipticity, N≠0 and invertibility. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Differential.lean:79` | TauCeti.Isogeny.Hom.pullbackDifferential; pullbackDifferential_comp at 102 reverses composition; pullbackDifferential_add_invariantDifferential at 137 is additive on ω. These laws do not by themselves state the CM Galois-kernel theorem. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:77` | WeierstrassCurve.Affine.invariantDifferentialDenom is `2y+a₁x+a₃`. Nonzero denominator alone does not imply ellipticity. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/ComplexMultiplication.lean:94` | GeometricEnd uses SeparableClosure; HasGeometricCM at 100 distinguishes geometric endomorphisms from those over the base. No general differential Galois-kernel theorem was found at the pin. |

The three originally reported missing-name leads are resolved to ArithmeticGaloisRepresentations §§4.1, 5.3 and 6.1, as above. The resolver's statement that it did not check external pinned packages was addressed by these local inspections. Generic field, torsion, twist and differential objects remain imported, not reconstructed. Object searches found no native Hilbert cuspidal attachment or imported cover/cohomological-system construction on which to state the other headlines.

### Dependency check, shape and acceptance-file limits

Ran the exact dependency command from the brief, without editing the order. Complete output:

```text
candidate: EllipticCurveModularityTotallyReal is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2151 edges, 0 problem(s)
```

No UPWARD or CYCLE line. A traversal of the 18 plan targets found zero forward or cyclic internal prerequisite edges. The source of the added edge is the earlier CM supplier. Being absent from the order is not a defect at design stage.

The README has the required Summary, Scope, Conventions, supplier contracts, build explanation, four mathematical layers, per-layer Examples and Dependencies, downstream contracts, worked examples and references. Each target has hypotheses, locator and individual Needs. The field, twist, eigenspace and lattice definitions have respectively 5, 5, 5 and 7 API facts and at least three Checks. The raw system assembly uses the supplier carrier after its properties. The repaired general CM construction is a supplier contract, not a new local definition. No implementation algorithm or source-chapter layer organization was found.

Headline inventory: §1.1 relative cyclotomic fields; §§1.2–1.6 reflection descent, rank-two properties, lattices/congruences and elliptic endpoints; §2.1 change of prime; §2.2 summand lifting; §2.3 number-field 3–5 switch with infinitely many j-values; §§2.4–2.5 elliptic seeds; §§3.1–3.3 simultaneous parameter and three lifts; §4.1 non-CM modularity; §4.2 full local comparison; §4.3 CM induction; §4.4 the general totally real endpoint.

The design correctly identifies §1.1 and §2.3 as statable at the pins using the native field, curve, torsion, pairing and basis carriers. Neither full statement is a one-tactic consequence of the declarations opened above. The automorphic headlines lack native Hilbert automorphic/attachment carriers; the reflection/cohomological headlines lack the supplied covers and their cohomology/system constructions. A package-stage module docstring must name those missing headlines individually rather than invent free predicates or weakened substitutes.

There is no Suggested.lean in this design. Hence zero sorried declarations exist to probe, zero own Lean names need matching, and there is no import header, variable binder, admitted data or padding declaration to test. The plan's prospective names are not presented as extant Lean declarations. No Lean command was run. **Elaboration: not available (this lane does not elaborate; say so in the report).** This is not a passing elaboration and does not claim that sorry was the only warning. Expanded #check signatures and executable one-tactic probes remain package-stage checks.

## Not verifiable

- Lean elaboration and executable one-tactic probes are unavailable in this lane; Suggested.lean is absent. The source-level statability assessment above does not certify a package build.
- `packages/LawrenceVenkateshMethod/README.md`, board #345 at the supplied head `9ee7ac3`, returned HTTP 404. Its ownership was not certified. The other two indexed board package READMEs were readable.
- The overlaps CLI has no unported design candidate mode for this name; the supplied design-specific overlap facts and directly opened supplier heads were used instead. No independent claim about an unavailable PR head is made.
- All nine cited source texts were readable; there is no missing mathematical reference request.

## Source issues

- **Misprint** in LeHung26 at §2.1, equation (5), printed p.5: the source introduces the cubic quotient for a tower with arbitrary odd n; it should require 3 dividing n for that member of the tower; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4ac4382efff8102c20aaadc4da9225bcbabf2121", "job": "REV-DESIGN-EllipticCurveModularityTotallyReal~3", "model": "gpt-6-astra", "worker": "chris-4"} -->
