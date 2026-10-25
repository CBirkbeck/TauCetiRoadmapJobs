<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1517#issuecomment-6401833531 -->
Review (claude) of 899c252

Verdict: accepted
Conditional on the announced gaps: `dagger-de-rham-finiteness-over-c`, `dagger-strictness-kunneth-over-c`, `geometric-finiteness-tubes`, `proper-pair-resolution-over-c`, `bounded-arithmetic-filtration`, `positive-crystalline-hom`, `galois-period-hom-vanishing`, `period-lattice-gluing`, `qbc-pairs`, `natural-period-hom`, `strict-countable-derived-limits`, `compact-extension-duality`, `analytic-syntomic-descent`, `overconvergent-crystalline-complex`, `geometric-log-periods`, `proper-rigid-integral-etale`

1. **F01** (P3) Second `**Checks.**` block under each definition holds reminders, not tests

   **Location.** `packages/CstConjectureForDaggerVarieties/README.md`, the second `**Checks.**` block of §0.1 (line 152: "Identity and composition preserve the lattice", "No Galois action is required over C"), §0.2 (line 181), §0.3 (line 209), §0.5 (line 261), §1.1 (line 355), §1.2 (line 383), §1.3 (line 411), §2.1 (line 493), §2.3 (line 538), §3.1 (line 668), §4.1 (line 810).

   **Claim.** The house rule is that a Check says what is computed and what a plausible wrong definition would get wrong. Every definition already has at least three such computed Checks in its first block (counts: 0.1: 3, 0.2: 3, 0.3: 3, 0.5: 4, 1.1: 3, 1.2: 3, 1.3: 3, 2.1: 3, 2.3: 4, 3.1: 3, 3.7: 4, 4.1: 4). The second block of each definition contains bullets that compute nothing and hold for any wrong object.

   **Witness.** §0.1 line 154 "Identity and composition preserve the lattice" restates the API bullet at line 144; line 155 "No Galois action is required over C" is true of the zero module, of the wrong lattice tB_dR⁺ and of a bare vector space alike. §1.3 line 413 restates the first-block bullet at line 408 (v(1,1)=0 versus c+d giving 2). §0.5 line 263 and §2.3 line 540 restate the definition's own wording.

   **Exact repair.** For each listed definition, delete the second `**Checks.**` heading and move any bullet that carries information into the definition's prose or API list (for example, §0.1: append "No Galois action is part of the data over C." to the first paragraph; §1.1: fold "the diagram is first formed in the left heart" into the sentence on tildes). Bullets that only restate an existing bullet (§0.1 line 154, §1.3 line 413) are deleted. The first blocks, which carry the computed tests, are unchanged. Tested on §0.1: after the repair the definition keeps three discriminating Checks (zero module, tᵐ lattices, zero submodule) and nothing vacuous.

2. **F02** (P3) Two locator and heading slips

   **Location.** `packages/CstConjectureForDaggerVarieties/README.md` line 187: "### 0.3 weak admissibility and acyclicity over c"; line 50: "`WittVector.Isocrystal` … in `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`".

   **Claim.** The heading lowercases the field C, which is the object the section is about (the body says "over C" throughout); sibling headings on main keep proper names ("R0.5 completed tensor products of Banach modules"). The Isocrystal locator points at the docstring's closing line, not the declaration.

   **Witness.** At the Mathlib pin `6b7abb3`, `Mathlib/RingTheory/WittVector/Isocrystal.lean` has `-/` at line 112 and `class Isocrystal (V : Type*) [AddCommGroup V] extends Module K(p, k) V` at line 113; `isocrystal_classification` is at line 180 as cited.

   **Exact repair.** Line 187: "### 0.3 weak admissibility and acyclicity over C". Line 50: replace `:112` by `:113`. Nothing else changes; the `:180` locator is correct.

Two findings, both P3 (style and locator), none blocking. Both round-2 findings are genuinely repaired; the repairs introduced no new defect; the merge-order move creates no cycle. Acceptance is conditional on the sixteen declared supplier gaps listed in `review.json`.

## Verified sound

Reviewed on 2026-10-25 against the pins Mathlib `6b7abb3`, Tau Ceti `a91d3aa` (content `lake-manifest.json`, checkout at `3b80899`). The four package files were read in full without modification; only this report and `review.json` were written. No source entry was added.

### Round-2 findings, one by one

| Finding | Repaired passage | Status and verification |
|---|---|---|
| F01 (P2), shifted cone in the derived-limit contract | `README.md:102` and the plan's `strict-countable-derived-limits` entry: "Rlim C_n=Cone(1−shift)[−1] in the strict derived category, that is, the homotopy fibre of 1−shift:∏C_n→∏C_n, (a_n)↦(a_n−τ_n(a_(n+1))) … which for a tower of spaces V_n placed in degree zero is the complex [∏V_n→∏V_n] in degrees 0 and 1"; new Check at `README.md:806`. | **Repaired.** README and plan `needs` strings compared mechanically: identical for all 16 slugs, suppliers identical. Recomputed: for the constant tower Q_p[0], δ(a)_n=a_n−a_(n+1) is onto with the continuous section a₀=0, a_n=−Σ_(k<n)b_k (check: a_n−a_(n+1)=b_n), kernel the diagonal; fibre (H⁰,H¹)=(Q_p,0), unshifted Mathlib cone (`CochainComplex.mappingCone`, degree i built from source degree i+1) gives (H⁻¹,H⁰)=(Q_p,0). Milnor at i=0 with the fibre: 0→R¹lim H⁻¹=0→H⁰=Q_p→lim H⁰=Q_p→0, consistent; at i=1 for V[−1]: 0→R¹lim H⁰=0→H¹=V→lim H¹=V→0, consistent. The direction a_n−τ_n(a_(n+1)) is the only well-typed one (τ_n:C_(n+1)→C_n). Pattern search: the only other cone in the README (§3.5 line 722, cancelling isomorphic terms) is shift-independent; §4.2's Checks (lines 828–829) already use the fibre normalization (constant O(D)/C: lim=O(D)/C, R¹lim=0; tail tower ⊕_(j≥n)Q_p: lim=0, R¹lim=∏Q_p/⊕Q_p∋[(1,1,…)]≠0 placed one degree up). |
| F02 (P3), undefined extrema at c=0 | `README.md:760`: "{x : \|f_j(x)\|>ε for some j} and {x : \|f_j(x)\|>ε for every j} respectively, so for c=0 the first is empty and the second is the whole chart, and for c≥1 they are {max_j\|f_j\|>ε} and {min_j\|f_j\|>ε}"; `README.md:758` renames the rescaling constant to λ with 0<\|λ\|<1. | **Repaired.** c=0 on a nonempty chart: ∃ over ∅ is false (complement ∅), ∀ over ∅ is true (complement the chart); agrees with the Check at line 767 and the prose at line 751. c=1, f=T, ε=\|π\|: both complements {\|T\|>\|π\|}; T=1 outside the tube, T=π inside; max=min=\|T\|. c=2, f=(T,S), point (1,π): ∃-complement true (1>\|π\|), ∀-complement false (\|π\|>\|π\| fails); max(1,\|π\|)=1>\|π\| and min=\|π\|≯\|π\| agree. Rescaling: {\|λf\|≤ε}={\|f\|≤ε/\|λ\|}, λ=π gives radius 1 (matches the non-unit Check at line 765); λ=0 is excluded, so no division by zero. No other extremum over a possibly empty index set in the README (§3.6 states its m=s and empty-union conventions explicitly at line 734). |

No finding was marked not actionable in the repair report; nothing is re-raised.

### Principles

No route-specific restriction (p=2 retained at lines 23, 35, 42; general complete discretely valued K with perfect countable residue field), no re-planned roadmap (AdicSpacesPartII/IV, PadicHodgeTheory, VectorBundlesAndIsocrystals, LocallyAnalyticDistributions, CohomologyComparisons, ClassicalAdicEtaleCohomology are consumed by section; the proper comparison over K and C is imported, not restated), no copied passage (every locator is a line or theorem number with the claim in the author's words), no algorithm, no sorry'd data, no `set_option`, no `lemma`, no process narrative, no pull-request number, no LaTeX delimiters (grep over the README). `Suggested.lean` has the single `import Mathlib`.

### Seeded source checks

All CN25 locators are into the 61-page CN5 author manuscript recorded in `sources.toml` (page markers of the cached text used to confirm printed pages).

| Target | Text opened | Support and qualifications |
|---|---|---|
| 0.3 weak admissibility and acyclicity over C | CN25 line 1807 (Definition 5.13, p.36), lines 1809–1829 (Remark 5.14) | Semistable of slope 0, respectively all slopes ≥0, exactly as stated; the zero-object convention is the roadmap's and is harmless. Degree t_H−t_N checked against PadicHodgeTheory §3.4 at its open head, which uses the filtered degree t_N−t_H and says its curve realization reverses the sign: trivial line, lattice tB_dR⁺ gives O(−1), degree −1; t⁻¹B_dR⁺ gives O(1), degree 1. |
| 0.6 generation of the de Rham lattice | CN25 lines 1852–1858 (Lemma 5.17, p.37) | Slopes in [0,r]; bounded eigenspace generates M⊗B_dR⁺; Nakayama reduction mod t and the exp(uN) untwisting are the source's steps. The README's N(u)=−1 (PadicHodgeTheory §0.5 at its head: N=−d/du, N(u)=−1) makes exp(+uN_M) the horizontal lift; verified: N_M(exp(uN)x)−∂_u(exp(uN)x)=0 termwise, whereas exp(−uN)x has total monodromy 2Σ(−u)ᵏ/k!·Nᵏ⁺¹x. See Source issues. |
| 0.7 period-valued Hom from an eigenspace | CN25 lines 1870–1887 (Proposition 5.18 and proof, pp.37–38); line 939 (Proposition 3.27(i), p.20) | Both isomorphisms, proof via curvature ≤0, height rk M, rank-equals-height and generation for injectivity; B_st-version by a weakly admissible lattice. Matches. |
| 0.8 period-valued Hom from an acyclic kernel | CN25 lines 1896–1907 (Proposition 5.20, p.38); 1908–1910 (Remark 5.21) | Hypotheses tʳB_dR⁺⊗M⊆tʳL⊆B_dR⁺⊗M and acyclicity retained; Hom and Ext¹ vanishing from the finite-length quotient; sublattice direction L′⊆L (the source's "containing" at line 1906 is the misprint already in the register). |
| 0.9 period reconstruction modulo a power of t | CN25 lines 1913–1947 (Proposition 5.23 and proof, pp.38–39) | Statement: k≥2r, kernel and cokernel killed by t²ʳ. The README's sharper "kernel killed by tʳ" is exactly what the proof establishes (lines 1939–1942: the kernel is a subobject of the kernel of multiplication by tʳ); the cokernel bound t²ʳ is lines 1943–1946. Supported. |
| 1.1 filtered cohomology and its image filtration | CN25 lines 2263–2265 (§7.1.1, p.46), 2289–2300 (§7.2 and §7.2.1, pp.46–47), 1954–1960 (Proposition 6.1, p.39) | Definitions of Fʳⁱ, DRʳⁱ, Bⁱ, Filʳⁱ=Im and the TVS lifts match; Prop 6.1 is the imported package (cited as an import contract). |
| 1.4 twist invariance and the surjectivity reduction | CN25 lines 2200–2239 (Remark 6.23(ii)–(iii), pp.44–45) | Fixed i, r↔r+1 equivalence via multiplication by t; Xʳ⁺¹ⁱ/tXʳⁱ≅Hⁱ_HK⊗̂C; F̃ʳ⁺¹ⁱ≅tF̃ʳⁱ since i≤r; induction on i from surjectivity. Matches. |
| 1.5 the simplified Stein and affinoid diagram | CN25 lines 2098–2112 (Theorem 6.14, p.43) | Rows, β̃=p⁻ʳβα_r⁻¹, Fréchet/LB, strict vertical maps with closed image, ker β̃ at φ=pʳ⁻¹. Matches; Ω⁻¹=0 and the integer exponent are the roadmap's explicit conventions. |
| 1.6 bicartesian diagrams | CN25 lines 2117–2143 (Corollaries 6.15 and 6.19, Remark 6.18, pp.43–44), 2196–2199 (Remark 6.23(i)) | Proper: bicartesian, horizontal arrows injective, Hʳ(FʳRΓ_dR)→FʳHʳ_dR an isomorphism. Stein/affinoid: bicartesian, horizontal arrows surjective with kernel Ωʳ⁻¹/ker d. Matches. |
| 2.6 the degreewise equivalence | CN25 lines 2367–2381 (Proposition 7.10, p.48), 2408–2409 (footnote 21) | (a)–(e) as stated; footnote 21 confirms Hʳ,ʳ⁺¹ is syntomic, outside the comparison range, as the README says. |
| 2.7 the four conjectural properties | CN25 lines 2382–2389 (Corollary 7.11, Remark 7.12, p.48), 2266–2276 (Conjectures 7.1, 7.3, 7.4, p.46), 2185–2195 (Conjecture 6.21) | Quasi-compact case plus the small extension; the four families and the twist-invariance step match. |
| 4.5 R¹lim vanishing for proper times Stein | CN25 lines 2657–2672 (§8.2.2, Proposition 8.12, p.54), 2702–2703 (Remark 8.16(i)) | Y proper, S Stein with strictly increasing admissible affinoid cover; R¹lim=0 by completion, étale passage, proper-factor Künneth and Theorem 6.14. Matches. |
| 4.6 pro-étale Künneth for proper times Stein | CN25 lines 2704–2710 (Remark 8.16(ii), p.54) | Proper-factor Künneth and the open-unit-ball counterexample for two nonproper factors. Matches. |
| 5.1 vanishing on the differential error term | CN25 lines 2746–2755 (Lemma 9.5 and proof, pp.55–56), 2744–2745 (context: dagger affinoid over K) | Smooth Hom as colimit over finite L/K, Fontaine's Hom_(G_L)(C,B_dR)=0, continuity and density. Matches. |
| 5.4 geometric recovery | CN25 lines 2821–2853 (Theorem 9.8 and proof, pp.57–58) | Smooth dagger X/C with de Rham slopes ≥0, i≥0; both module isomorphisms; proof by qBC filtration, dense finite-length presentation of the Pair A, Corollary 3.18 and Proposition 5.20. Matches. |

There are no author-flagged unverified locators. GK04 and BKV22 are not in this round's sample and were not reopened; the round-2 review verified them with computed values.

### Computed adversarial table

Notation: R=B_dR⁺, B=B_dR, U₁=(B_cris⁺)^(φ=p), D a dagger disc. Rows cover the repaired passages, the sampled targets and the headlines. Unchanged API rows of the round-2 table (118 rows) carry computed values and were relied on for text no repair touched.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Contract Rlim=Cone(1−shift)[−1] (`:102`) | Constant Q_p[0] | δ onto (section a₀=0, a_n=−Σ_(k<n)b_k), ker=diagonal; fibre (H⁰,H¹)=(Q_p,0); unshifted cone (H⁻¹,H⁰)=(Q_p,0) | Fibre agrees with Milnor; cone does not | None (F01 repaired) |
| Same | Constant V in degree 1 | Fibre: ∏V in degrees 1,2, H¹=V, H²=0; Milnor i=1: R¹lim H⁰=0, lim H¹=V | Consistent | None |
| Same | Tower (Q_p,0,0,…); zero tower | δ an isomorphism, H⁰=H¹=0, lim=0; zero tower 0 | Degenerate cases pass | None |
| §4.1 new Check (`:806`) | As rows 1–2 | Identical values, including the empty sum at n=0 | Correct | None |
| §3.7 complements (`:760`) | c=0; c=1 (f=T, ε=\|π\|); c=2 (f=(T,S), point (1,π)) | ∅ / whole chart; both {\|T\|>\|π\|}, 1 outside, π inside; ∃ true, ∀ false, max/min agree | Both directions agree | None (F02 repaired) |
| §3.7 rescaling (`:758`) | λ=π, λ unit, λ=0 | radius ε/\|π\|; unit excluded by 0<\|λ\|<1 and covered by the unit bullet; λ=0 excluded | No division by zero | None |
| Conventions: N, twist, degree, square sign | φ=diag(1,p), Ne₁=e₀; lattices tᵐR, m=−1,0,1; point square | Nφe₁=pe₀=pφNe₁; N(e₁+ue₀)=0, N(e₁−ue₀)=2e₀≠0 at p=2; degrees 1,0,−1; v(1,1)=1−1=0 (sum gives 2) | Conventions pin the wrong models | None |
| 0.3 predicates | O, O(1), O(−1), 0; O(1)⊗O(2) | acyclic T,T,F,T; weakly admissible T,F,F,T; tensor O(3) acyclic | Both directions distinguished | None |
| 0.6 generation | M=0; slope 0 at r=0; slope 1 at r=1; slope 1 at r=0; slope 1/2 at r=1 | 0; (B_cris⁺)^(φ=1)=Q_p generates R; e⊗Q_p generates; (B_cris⁺)^(φ=p⁻¹)=0 fails (slope outside [0,r]); U_(2,1)-block reduces to C² by independence of the Q_(p²)-characters | Slope hypothesis necessary and sufficient in the examples | None |
| 0.7 eigenspace Hom | M=0; slope 0, r=1 (X=U₁); slope 1, r=1 (X=Q_pe) | Hom(0,B)=0; ht U₁=1, Hom_VS(U₁,B)=B, rank 1=rk M; Hom(Q_pe,B)=Be∨, rank 1 | Rank equals height in each case | None |
| 0.8 acyclic-kernel Hom | M trivial, r=1, L=R or t⁻¹R | V=Q_pt or U₁; quotient C or 0; Hom(C,B)=Ext¹(C,B)=0 so Hom(V,B)=B, rank 1 | Matches | None |
| 0.9 truncated reconstruction | M trivial, L=R, r=1, k=2; L=t⁻¹R, r=1, k=2; r=0 | R/t²→Hom(Q_pt,R/t²)=R/t² is multiplication by t: kernel tR/t², cokernel R/t, both killed by t=tʳ; second case everything killed by t²; r=0 isomorphism | Kernel bound tʳ and cokernel bound t²ʳ hold | None |
| 1.1 F versus Fil | Point r=0,1; disc i=r=1; i<0 | Point (F,B,Fil,A)=(tʳR,R,tʳR,0); disc (O(D)/C,0,0,O(D)/C) with [T]↦dT≠0; negative degrees 0 | Image and group distinct | None |
| 1.4 twist invariance | Point i=0, r=0→1 | H: Q_p→Q_pt, F: R→tR, X^(1,0)/tX^(0,0)=U₁/Q_pt=C=B/tB | Quotient is HK⊗C | None |
| 1.5 Stein/affinoid diagram | Point r=0; disc r=1; annulus r=1 | Point: Ω⁻¹=0, H⁰=Q_p=X^(0,0), ker β̃ at φ=p⁻¹ is 0; disc: H¹_proét=O(D)/C, bottom row 0→O/C→Ω¹→0 exact; annulus: X^(1,1)=Q_p, ker β̃=(B_cris⁺)^(φ=p⁻¹)=0 so dlog T survives | Kernel formula and exponents consistent | None |
| 1.6 bicartesian cases | Proper point; disc i=r=1 | 0→Q_p→Q_p⊕R→R→0 exact, horizontal maps injective; disc horizontal maps O/C→0 both onto with common kernel O/C | Both cases pass | None |
| 2.6 degreewise criteria | Point r=0; disc r=1; formal E_r=O(−1) | Point: h¹ terms 0, pair (Fⁿʳ,R) acyclic, ht Q_p=1=dim H⁰_dR; disc: h¹₀(1)=H¹(O)=0 after simultaneous twist, h¹₁(1)=0, ht(O/C)=0=dim H¹_dR; formal: ht deficit −1 and nonzero positive piece | All five conditions move together | None |
| 2.7 all-degree equivalence | Point/disc; formal h¹₂=C/Q_p | All defects 0; formal example passes degree 0 but fails degree-2 height | All-degree quantifiers necessary | None |
| 4.5 R¹lim for proper×Stein | Y=point or P¹, S open disc | Proper coefficients Q_p (deg 0), Q_p(−1) (deg 2); each R¹lim a finite sum of zero Stein terms | 0 | None |
| 4.6 Künneth | P¹×open disc; two open discs | Degrees 0–3: Q_p, H¹(S), Q_p(−1), H¹(S)(−1) (matches Examples line 909); d(TS)=S dT+T dS not a sum of pulled-back forms | Proper factor needed | None |
| 5.1 differential vanishing | Disc i=1; i=0; finite L/K | [T]≠0 in O(D)/K; Hom_(G_L)(C,B)=0 on each simple tensor, density gives 0; i=0 term 0 | Continuity and density essential | None |
| 5.4 geometric recovery | Constant Q_p^d, d=0,1,2; disc H¹ | Hom_TVS=B_st^d, B^d; disc: A=O/C has Hom 0, H/A=0, both sides 0 | Matches | None |
| Headline statability | Each of the 33 docstring items | Carriers at the pins: `BDeRhamPlus`/`BDeRham` only (no B_cris⁺, B_st⁺, Frobenius, N, t); `WittVector.Isocrystal` (no N, filtration, finiteness); Tau Ceti `AdicSpace`, `FarguesFontaine.spaY/spaX` (topological, no coherent sheaves, no dagger structure, no étale or de Rham cohomology: no `*etale*`, `proEtale` or Hyodo–Kato file under `TauCeti/AlgebraicGeometry`) | None statable; no stand-in | None |

### Pinned declarations opened

`BDeRhamPlus` at `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, `BDeRham` at `:88` (binders at `:51–52`: commutative ring, prime p, p nonunit, p-adically complete; zero ring when p=0); `fontaineThetaInvertP` at `:62`; `WittVector.Isocrystal` at `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` (R02), `isocrystal_classification` at `:180`; `CochainComplex.mappingCone` at `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57` (round 2's reading of its degree convention re-used for the F01 computation). Tau Ceti `TauCeti/AlgebraicGeometry/AdicSpace/` contains `FarguesFontaine`, `PreAdicSpace`, `Spa`, `ValuationSpectrum` and no cohomology module.

### Elaboration and the Lean form

`lake env lean` on `packages/CstConjectureForDaggerVarieties/Suggested.lean`, run from the content checkout at the pins: exit 0, no output, 3.6 s. The file has one `import Mathlib`, one module docstring in the required form (title, "the roadmap is README.md", the 33 non-statable headlines each with its missing carrier), an empty `namespace TauCetiRoadmap.CstConjectureForDaggerVarieties`, no `TauCeti.*` import, no `set_option`, no `lemma`, no `#check`. The `#check @name` binder audit and the one-tactic padding probe therefore have zero subjects; nothing changed. The 33 docstring items are exactly the README's deep theorem targets (§0.4, 0.6–0.9; 1.4–1.6; 2.2–2.9; 3.2–3.7; 4.2–4.7; 5.1–5.5); §5.6 is scope. No headline is statable at the pins (table row above), so an empty file is the correct form, not padding and not a stand-in.

### Ownership, suppliers and the merge order

Dependency check, complete output:

    moved: CstConjectureForDaggerVarieties moved in the merge order from #8 to #204, right after its last supplier CohomologyComparisons (AdicSpacesPartIV, ClassicalAdicEtaleCohomology, LocallyAnalyticDistributions, PadicHodgeTheory, VectorBundlesAndIsocrystals also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 56 roadmaps, 638 edges, 0 problem(s)

No UPWARD or CYCLE line. The move cannot create a cycle: `roadmaps grep 'CstConjectureForDaggerVarieties'` over main and all 367 open heads finds no roadmap citing this one, and the four readable board packages (below) do not mention it; every supplier it cites is a roadmap on main or an open new-folder pull request, none of which cites it back.

Citations resolved at the suppliers as they are now (line numbers in the roadmap file): AdicSpacesPartII on main R0.5 `:2759`, R0.10–R0.17 `:4204–6681`, R1.3 analytification `:8968`, R1.7 rigid–adic comparison `:9806`; AdicSpacesPartIV on main F1.7 `:4238`, F1.8 `:4515`, F1.9 `:4662`, F1.11 `:5594`, F1.12 `:5897`, F1.16 `:6460`; PadicHodgeTheory at its open head §§0.1–0.5 `:115–264`, §2.7 `:594` with `properRigidLogResolution` `:608` (standing K finite over Q_p, Conventions `:24`, so the C-extension gap is genuine), §§3.4–3.7 `:700–773`, §5.2 `:1004`, N=−d/du and N(u)=−1 `:284,288,330`, filtered degree t_N−t_H `:708`; VectorBundlesAndIsocrystals at its open head VB0 `:223` (Coefficient category `:225`, Dieudonné–Manin `:301`), VB1 `:414` (Bundles, annuli `:416`; Slope-sensitive cohomology `:601`; Untilts `:671`; HN filtration `:772`), VB2 classification `:1061` (`:1117`, `:1127`), VB3 `:1177` (fundamental untilt sequence `:1227`; Sympathetic algebras `:1426`; Curvature `:1538`; Le Bras `:1608`; Euler–Poincaré `:1688`; Period modules `:1726`; Curvature-zero finite-length `:1742`; VS Hom vanishing `:1752`); LocallyAnalyticDistributions at its open head §0.0 `:247`, §0.2 `:399`; CohomologyComparisons at its open head §4.8 `:871`, §4.9 `:885`, §4.9a `:895`, §4.10 `:911`, §4.11 `:923`; ClassicalAdicEtaleCohomology at its open head §1.3 `:279`, §1.4 `:374`, §8.4 `:3892`, §9.7 `:4684`. The citation resolver reports nothing found nowhere. Ownership of the C-lattice module, analytic square, qBC defects, geometric slope classes and recovery theorems: no competing owner in main, the open heads or the readable board packages (round-2 object searches, not repeated for unchanged objects; the two repaired passages introduced no new object).

Gap contracts: all 16 slugs present in both `README.md` and `design/plan.json` with identical supplier and `needs` text (mechanical comparison); no supplier `none`; the two `needs` sentences touched this round are precise (the Roos model now has its shift and its explicit two-term form). The round-2 minimality audit of the other fourteen stands; this round re-checked `proper-pair-resolution-over-c` (PadicHodgeTheory's standing field is finite over Q_p, so the extension is not already provided) and `strict-countable-derived-limits` (LocallyAnalyticDistributions §0.2 at its head is the Fréchet, finite-dimensional-Mittag-Leffler theorem, which does not cover O(D)/C towers).

Shape: 44 numbered subsections, each theorem with hypotheses and a locator, each definition with an API list and at least three computed Checks (counts in R01), six layers each ending with Examples and Dependencies, the required top-level sections in order.

## Not verifiable

- Board packages at their indexed heads whose README and Suggested.lean could not be read (contents request returned nothing): ArithmeticLocallySymmetricSpacesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PELModuliPartII, PadicHodgeTheoryPartII, PadicLocalLanglandsForGL2QpPartII, RealSurfacePeriodIndex, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, VStackSheavesAndLisseCategoriesPartII, VectorBundlesAndIsocrystalsPartII. Their ownership and any citation of this roadmap were not checked; none of them is cited by this package, so none can close a cycle from this side. The readable ones (AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LogicAndDefinabilityInNumberTheory) contain no mention of this roadmap.
- Journal pagination of CN25 (Duke 174) was not collated; all locators are into the author manuscript the manifest records.
- GK04 and BKV22 were not reopened this round (outside the sample and untouched by the repairs).

## Source issues

- **Gap** in CN25 at Lemma 5.17 proof, printed p.37, CN25 line 1856: the source says the series x−uNx+u²N²x/2!−… gives the N=0 sections, without fixing the sign of N on u anywhere in the text; it should state N(u)=+1 for that series, since with Fontaine's N(u)=−1 the horizontal section is the series with +u; affects nothing (a convention the roadmap fixes explicitly).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "899c252", "job": "REV-PKG-CstConjectureForDaggerVarieties~3", "model": "fable", "worker": "fable-rev125"} -->
