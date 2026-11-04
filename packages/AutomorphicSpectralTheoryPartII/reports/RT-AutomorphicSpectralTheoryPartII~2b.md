<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1008#issuecomment-6484377304 -->
Red team round 2 pass b (claude) of f09b575

Verdict: needs_changes

1. **F01** (P3) Two targets use carriers of earlier targets that their `*Needs:*` lines omit

   Location: `packages/AutomorphicSpectralTheoryPartII/README.md:587` and `:593` ("Extend the real multiplier on this finite direct sum"; "Each fixed support/level stage comparison intertwines the real multiplier") with the `*Needs:*` line at `:597`; and `:1059` ("For an arbitrary quotient weight and `F∈{L²_w,C,T_N,T,S_{w,N},S_w}`, define F_X") with the `*Needs:*` line at `:1071`.

   Claim: every input of a target's statement is listed on its `*Needs:*` line (README line 209: "Every subsection lists the inputs to both its statement and the indicated proof route").

   Witness: §1.9's statement extends "the real multiplier", which is `Tμ` of §1.7 (the only target that defines a multiplier on all of `S(G∞)`); its `*Needs:*` at line 597 lists AutomorphicFormsOnReductiveGroups §§0.1–0.5, §1.1, AutomorphicSpectralTheory §§0.11–0.15, SR.4.1–SR.4.2, satake-exponential-family and N1, not §1.7 (nor §1.3). §3.3's statement quantifies F over `C([G]_P)`, defined in §2.11; its `*Needs:*` at line 1071 lists AutomorphicSpectralTheory §§1.5–1.10, §2.16, §2.14 and a gap, and neither §2.16 (Needs: §2.10, §2.12, §2.13) nor §2.14 (Needs: §2.13, §2.12, §2.6, §2.1) reaches §2.11 transitively. Both omitted targets precede their consumers, so no cycle or forward reference arises; the build order is unaffected.

   Repair: at line 597 replace "AutomorphicFormsOnReductiveGroups §§0.1–0.5; §1.1;" by "AutomorphicFormsOnReductiveGroups §§0.1–0.5; §1.1; §1.7;". At line 1071 replace "§2.16; §2.14;" by "§2.16; §2.14; §2.11;". Tested: with these edges the chains §4.3→§1.9→§1.7→§1.6→…→§0.5 and §3.3→§2.11→§2.4→§2.2→§2.1 are acyclic and every carrier named in the two statements has an in-roadmap owner on the chain.

Round 2. The seven round-1 findings were re-verified at this head first (section "Round-1 repairs"), then the full pass was run again over every line of `packages/AutomorphicSpectralTheoryPartII/README.md` (1575 lines) and `packages/AutomorphicSpectralTheoryPartII/Suggested.lean` (116 lines). One new finding, P3.

## Round-1 repairs

Each round-1 finding, checked at head f09b575.

| Finding | Status | Witness at this head |
|---|---|---|
| a-F01 (P2) §4.1 bi-K stability | repaired | Line 1227: "closed and stable under G∞ and under the bi-K Schwartz algebra … no G(𝔸)-invariance of the K-fixed χ-part is asserted". New Check at line 1243 recomputed: (23)·(1,1,−2)=(1,−2,1), not ⟨(12)⟩-fixed; e_K δ_(23) e_K v = ½[(1,−2,1)+(−2,1,1)] = (−1/2,−1/2,1), fixed by (12). bplzz line 1100–1103 restricts the action to S(G(𝔸))_K. |
| a-F02 (P2) §2.12 used S_w before §2.14 | repaired | Line 889: "Its uniform-growth estimates are proved in §2.13 and its relative-decay estimate in §2.14"; the S_w bullet is gone from §2.12 (line 897 now states the weak definition and the support bound). Line 951 carries the measure statement with "w bounded above on supp μ" and the locator bpcz line 1395, which reads exactly so (Lemma 2.5.11.1). Needs chain now §2.14→§2.13→§2.12, no cycle. The route at line 953 follows bpcz lines 1397–1401. |
| a-F03 (P3) §2.7 page | repaired | Line 787: "(2.5.5.4)–(2.5.5.5), p.212"; bpcz line 1268 is the page-212 header and lines 1273–1277 carry both displays. |
| a-F04 (P3) §0.5 restating Checks | repaired | Lines 367 and 369 are the two computed Checks. Recomputed: eⁿ/(1+n)^d→∞ for every d; sup_n n²/(1+\|n\|)²=1 (n=0 gives 0, limit 1 from below); r=−1 gives n²/(1+\|n\|)→∞. |
| b-F01 (P2) compound gaps | repaired, differently and correctly | 29 slugs in README and `design/plan.json`, byte-identical lists (mechanical diff below). `rapid-semisimple-centre` is now the W-invariant semisimple multiplier only; `split-centre-fourier-laplace`, `refined-langlands-discrete-data`, `discrete-spectrum-casimir-counting`, `real-plancherel-decomposition`, `tempered-characters-in-torus-strips` are separate; the Nash product clause points to the existing `nash-schwartz-analysis` (line 517). The repair report's reason for not adding a third Nash slug is right (a second key for the same contract). Its rejection of the "stage preserved" clause is right: AutomorphicFormsOnReductiveGroups §0.3 (head) states convolution maps supports C₁,C₂ to C₁C₂, and line 593 now says so. |
| b-F02 (P3) δ_P^Q undefined | repaired | Line 679: "Write δ_P^Q(x)=exp⟨2ρ_P^Q,H_P(x)⟩ on [G]_P … δ_P^G=δ_P and δ_P^P=1", matching bpcz lines 697–705. Check at line 699: δ_B^G=4, δ_B^B=1 for diag(a,1), \|a\|=4, consistent with Conventions line 27 and §2.16 line 989. |
| b-F03 (P3) §0.1 locator | repaired | Line 215: "which require p>0; the case p=0 is admitted here and its growth bound is treated in §0.2"; bplzz line 401 reads "Let p>0 be an integer". |

No repair introduced a new error: the §2.14 route uses only §2.13 (R(f)μ∈T for compact f), the §2.1 compact-translate comparison, AutomorphicFormsOnReductiveGroups §0.3 and `dixmierMalliavin` of its §2.7 (head, line 468, which also proves `S(G(𝔸))=S(G(𝔸))*C_c^∞(G(𝔸))`); the support bound supp μ·(supp f)⁻¹ was recomputed below for the pairing convention of line 897.

## Verified sound

Counts: 10 Lean declarations read and tabulated; 63 targets read (§§0.1–0.10, 1.1–1.9, 2.1–2.18, 3.1–3.10, 4.1–4.9, 5.1–5.7) with APIs, routes, Needs and Checks; 71 line locators opened in the cached extractions (27 bpcz, 38 bplzz, 6 lapid) and compared with the theorem and printed-page numbers; 5 Mathlib file:line locators and 3 cited files read at the pinned commit (6b7abb3c…); 29 declared gaps compared with the README contracts and with the supplier text; 18 roadmap citations resolved at their open heads or on main; about 45 Checks recomputed (table below); the module docstring's 15 non-statable headlines matched against the README's endpoints.

Mechanical checks run this pass (read-only):

```text
depcheck: 186 roadmaps, 1224 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Citation resolver: no cross-roadmap citation and no Lean name found nowhere. `git diff --stat origin/main...HEAD`: ten files, all under `packages/AutomorphicSpectralTheoryPartII/`; `design/plan.json` differs from main only in the top-level `gaps` key (JSON key-by-key comparison); `metadata.toml` adds one topic line. Gap slugs: 29 in README, 29 in `plan.json`, identical sorted lists; suppliers, sections and `needs` strings agree. No `lemma`, `set_option`, pull-request number, process word or machine path in README, Lean file or `sources.toml`. `Suggested.lean`: single `import Mathlib`, one module docstring, the namespace, one layer comment, docstrings on all ten declarations, `sorry` only in the three theorems, no sorry'd data, no `#eval`/`#print`.

Lean, from the job's elaborated signatures (no build run here, as the brief requires): the file has no `variable` or `include`, so no section binder can drop; every hypothesis (rank bound, holomorphy, finite-order bound, complex linear independence) is in the declaration's own signature; each elaborated type equals its README statement in §§0.1–0.3. Mathlib at the pin has `HasProdLocallyUniformlyOn` (Topology/Algebra/InfiniteSum/UniformOn.lean:146) whose body is exactly the first conjunct's `TendstoLocallyUniformly … atTop` shape, so the conjunct is well formed; no Weierstrass elementary factor, canonical product or finite-order predicate exists at the pin (grep over Analysis/ and the value-distribution files), so the seven definitions are not duplicates of pinned declarations.

Lean declarations (all in `TauCetiRoadmap.AutomorphicSpectralTheoryPartII`, Layer 0, no section context):

| Declaration (README §; Lean line) | Binders | Instances tried and values | Result |
|---|---|---|---|
| `HasRankBound` (0.1; 44) | Λ : Set ℂ, p : ℕ | Λ=∅: sum 0, true at p=0. Λ=ℤ: p=0 harmonic sum ∞, p=1 sum 2·π²/6=π²/3. Λ={1/(n+1)}: terms (n+1)^{p+1}→∞, false for all p. Λ={1/2}, p=0: sum 2, true. | true as stated; `Λ.Countable` is implied by summability of positive terms (Mathlib `Summable.countable_support_*`), so it is redundant but harmless |
| `elementaryFactor` (0.2; 48) | p, w | w=2, p=0,1,2: −1, −e², −e⁴. w=0: 1. w=1: 0 with E_p′(1)=−exp(Σ_{j≤p}1/j)=−1,−e,−e^{3/2}. | matches Checks line 281 and GlobalHolomorphicFunctions' definition |
| `canonicalProduct` (0.2; 53) | Λ, p, z | Λ=∅: `z^0·∏'=1` at every z, including z=0 (`pow_zero`). Λ={0}: z. Λ={0,1,2}, p=0, z=3: 3·(−2)·(−1/2)=3. 0∉Λ: value 1 at z=0. | origin handled once; no 0/0 |
| `partialCanonicalProduct` (0.2; 60) | Λ, p, s : Finset of nonzero-point subtype, z | Λ={0,1}, p=0, z=2: s=∅ gives 2, s={1} gives 2(1−2)=−2. Λ={0,1,2}, z=3: s={1}: −6; s={1,2}: 3. | matches Checks 273, 283 |
| `HasFiniteEntireOrder` (0.2; 68) | ψ | ψ=1: C=1,d=0. ψ=exp(z²): \|ψ\|≤e^{\|z\|²}≤e^{(1+\|z\|)²}. ψ=exp(exp z): e^{e^x}/e^{C(1+x)^d}→∞. ψ=0: true. | equivalent to finite order for entire ψ (d=⌊ρ⌋+1, C≥max on the unit disk) |
| `HasRapidVerticalDecay` (0.3; 72) | {n}, ν | n=1, ν=exp(z²): \|ν\|=e^{x²−y²}≤e^{M²}e^{−y²}, every (1+\|z\|)^r bounded. ν=exp(−z²) at iy: e^{y²}, unbounded at r=0. n=0: ‖z‖=0, bound C=\|ν()\|. | sup-norm real part on `Fin n → ℝ` is the strip condition |
| `affineSpectralLattice` (0.3; 78) | {n k}, a, b | k=0: {a}. n=k=1, a=1/2, b=1: 1/2+ℤ. b=(1,1) in ℂ (n=1,k=2): 1·b₀−1·b₁=0, `LinearIndependent ℂ b` fails. | real rank-2 lattices of ℂ excluded by the theorem hypothesis, as Check 317 says |
| `finite_rank_weierstrass_product` (0.2; 85) | Λ, p, hΛ | Global bound: \|E_p(w)\|≤1+\|w\|^{p+1}≤e^{\|w\|^{p+1}} for \|w\|≤1/2 (GHF's deviation bound), and ≤exp(\|w\|+Σ_{j≤p}\|w\|^j/j)≤exp(2^{p+1}(p+1)\|w\|^{p+1}) for \|w\|≥1/2; summing the rank majorant gives log\|Ψ\|≤C_p‖z‖^{p+1}Σ\|λ\|^{−(p+1)}; origin factor \|z\|≤e^{\|z\|}. p=0, Λ={1/2}: \|1−2z\|≤e^{2(1+\|z\|)}. Zeros: at w₀∈Λ∖0 the factor E_p(1)=0 and the net is eventually 0, so `tprod`=0; derivative z^δ E_p′(1)/w₀·∏_{w≠w₀}E_p(w₀/w)≠0 (no further zero factor, absolutely convergent product). Λ=∅: product 1, zero locus ∅, derivative clause empty. 0∈Λ: derivative at 0 equals ∏'1=1. | all five conjuncts true; not one-tactic |
| `polynomial_zero_fiber_interpolation` (0.3; 98) | n, q, ψ, hψ, horder | Direct witness: ν=ψ∘q·exp(Σ_j z_j^{2q₀}), q₀ odd, 2q₀>d·deg q: on ‖Re z‖≤M, Re z_j^{2q₀}≤−y_j^{2q₀}+C_M(1+\|y_j\|)^{2q₀−1} and \|ψ(q(z))\|≤exp(C′(1+‖z‖)^{d·deg q}), so the product decays faster than every power. ψ=0: ν=0. n=0: ν∈{0,1}. Necessity of `horder`: a ψ with zero set {i·log log n} (infinite rank) and q=z admits no ν, since Σ_n e^{−(π/2)log log n}=∞ violates the Blaschke condition for bounded functions on the strip \|Re z\|<1. | true; hypothesis not removable |
| `affine_lattice_interpolation` (0.3; 108) | n, k, a, b, hb, A | Functionals ℓ_i with ℓ_i(b_j)=δ_ij exist by independence; g_i=sin(πℓ_i(z−a))/∏_{m∈E_i}(ℓ_i(z−a)−m), E_i=ℤ∩ℓ_i(A−a); ∏g_i vanishes on lattice points with some m_i∉E_i, is nonzero on A (sin(πw)/(w−m₀)=±π at w=m₀); the finitely many remaining lattice points off A are removed by affine factors nonzero on A (finite union of proper subspaces avoided); exp(Σz_j²) damps exponential type. k=0, A=∅: (λ(z)−λ(a))e^{z²}. n=k=1, a=0, A={0}: e^{z²}sin(πz)/(πz), value 1 at 0, 0 on ℤ∖0. A={1/2}: e^{z²}sin(πz) nonzero at 1/2. n=0 forces k=0. | true in every dimension |

Three stated theorems are headlines of Layer 0 (BPLZZ Lemma 2.2 with the global exponent, Proposition 2.4 with Remark 2.7, Corollary 2.6 in the complex-independent form); none restates a definition, mirrors a Check, computes a value or treats a boundary case; the seven definitions are each used by one of them. BPLZZ Corollary 2.5 (finite-rank Λ, polynomial pullback) is the one-line composition of theorems 1 and 2 and is rightly not stated. The fifteen docstring items cover §§0.8, 1.3–1.8, 2.7–2.8, 2.15–2.18, 3.1–3.2, 3.3–3.4, 3.6, 3.7, 3.8–3.10, 4.6–4.7, 4.8–4.9, 5.2–5.3, 5.4–5.5, 5.6, 5.7, each with its missing carrier; none is statable at the pins (no real reductive Schwartz algebra, no adelic quotient, no root-datum real form).

Adversarial pass on README statements, Checks and conventions (one row per statement; values on both sides):

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions line 25, L(X)f(g)=d/dt f(exp(−tX)g) | ℝ, π_t(x)=e^{itx}, t=1,2 | π_t(L(X)f)=∫−f′e^{itx}=it·π_t(f): i, 2i; opposite sign −i, −2i | as stated |
| Line 25, t_λ versus tensor weight | f=z, λ=1; torus weight +1 | t₁z=z−1; character α↦α+1; annihilator root (t_{−1}z)(α)=z(α+1) | signs as stated; bplzz line 759 prints t_λ (Source issues) |
| Line 27, pairing and Mathlib inner | scalars 1, i | ⟨1,i⟩=−i; ⟪1,i⟫=i | slots exchanged as stated |
| Line 27 and §3.8 Check 1173, circle convolution | f=e_{−n}, mass one | R(f)φ(x)=∫e^{−2πing}φ(x+g)dg=e_n(x)⟨φ,e_n⟩; kernel e_n(x)conj e_n(y); f=e_n projects onto e_{−n} | as stated |
| Line 27, §2.3 Check 699, §3.6 Check 1135 | GL₂ Borel, diag(a,1), \|a\|=4 | δ_B=4, δ^{1/2}=2, δ^{−1/2}=1/2, δ^{s−1/2}: 2 at s=1, 1/2 at s=0; δ_B^B=1 | consistent across Conventions, §2.3, §3.6, §3.8 |
| §0.1 API line 223 | Λ=ℤ | n(r)~2r, rank 1; Chebyshev gives n(r)≤r^{p+1}Σ\|λ\|^{−(p+1)} | counting exponent lies in [p,p+1], as stated |
| §0.2 API line 260 | q constant; q=z² with ψ of order d | exponent 0 (bounded); exponent 2d | as stated, zero polynomial has junk degree 0 and is covered |
| §0.4 θ | SU(2): ϑ₀=−1 on ℤ, W={±1} | θ={−1,+1}, θ_G={−1}; Y_{−1}=ℤ, Y_1={0}; 0 in both, infinitesimal characters ±n, n≥1 | Checks 339, 571 and Example 617 hold; bplzz line 506–507 defines θ the same way |
| §0.4 Check 341 | rootless rank 2 | [[1,n],[0,−1]]²=I for every n∈ℤ | infinitely many involutions; bplzz line 451 claims Aut♥ finite (Source issues) |
| §0.5 Checks 363–369 | exp z, exp(−z²), exp on ℤ, z² on ℤ | e^x≤e^M on strips; e^{y²} at iy; eⁿ/(1+n)^d→∞; sup n²/(1+\|n\|)²=1, r=−1 gives ∞ | as stated |
| §0.5 definition versus bplzz Definition 2.8(1) | ϑ=−1 on U(1) | strips reduce to the lattice ℤ; "some real r" = polynomial growth | definition agrees with bplzz line 464–469 |
| §0.6 Hausdorffness claim line 381 | Θ={−1}, U(1) | sin(πz) vanishes on all of Y_{−1}=ℤ, all seminorms 0, function nonzero | the "no claim for arbitrary Θ" hedge is necessary |
| §0.7 module law line 405 | ν∈M, μ sharp, ϑ′-strip | all but finitely many translates killed by μ; surviving translates have bounded real part, where ν is moderate | M·M♯⊂M♯, matches bplzz Remark 2.9(3) |
| §0.8 route line 427 | a∈h*ℂ, θ finite | each ν_ϑ∘pr_{−ϑ} is rapid on vertical strips (pr real-linear); product over W nonzero at a iff each factor nonzero at every wa | nonvanishing at every Weyl translate is necessary; bplzz line 497–500 |
| §0.9 Checks 453–459 | f=z; s(z)=−z | t₁z=z−1; (f(z)−f(−z))/z: 2 at f=z, 0 at f=1; f/z sends 1 to 1/z; t₁t₂=t₃ | as stated |
| §1.1 line 487 | ℝ^× with f=exp(−(1+(log t)²)^{1/4}); semisimple G | f in every C^p, not Nash Schwartz; for semisimple G, ∩_pC^p needs decay e^{−Nρ(H)} for all N, which is Nash decay | equality iff compact centre, bplzz line 540–542 |
| §1.2 Check 511 | f=e^{−πx²}, t=0 | ∫f=1 on both sides; one-point group: f(1)v | as stated |
| §1.3 K-finiteness | SU(2), μ=exp(z²), f with K-types in finite T | π_n(μ⋆f)=e^{n²}π_n(f) for the finitely many n with a type in T; finite sum, smooth | the bi-K-finite hypothesis is what makes N_{{1}} suffice; §1.6 then needs θ∪{1} |
| §1.6 seminorm bound | compare with bplzz line 806 | source uses max over θ; README max over θ∪{1} | README's right side is at least the source's, so the statement is true and the §1.7 damping route still converges on every strip of M_{θ∪{1}} |
| §1.7 kernel claim line 561 | μ vanishing at every actual χ_π | π(Tμf)=0 for all π, so Tμf=0 by §1.2 detection; converse by choosing f with π(f)≠0 | as stated |
| §1.9 stage count, Checks 605–609 | C=JxJ⊔JyJ; C={1}, J≠{1}; C=∅ | f=f_x⊗1_{JxJ}+f_y⊗1_{JyJ}; a value at 1 propagates to J·1·J⊄C, stage 0; no summands | as stated |
| §2.1 Checks 643–647 | w=1; w=e^t on ℝ_{>0}, u=2 | C_U=1; w(2t)/w(t)=e^t unbounded | as stated |
| §2.2 line 653 chamber order | η−λ∈ℝ_{≥0}Δ_P on a Siegel set | ⟨α,H₀⟩ bounded below, so exp⟨η−λ,H₀⟩≥c, d_λ≤Cd_η | direction as stated |
| §2.3 Check 701 | Res_{K/F}GL₂, [K:F]=2, \|a\|_F=2 | \|a\|_K=\|N a\|_F=4; d_{P_H,α_H}=d_{P,α_K}^{1/2}=2 | as stated; bpcz line 1078–1082 gives the equivalence |
| §2.4 Checks 723–727 | compact quotient; measure ×c; modular cusp | Ξ≍1; Ξ↦c^{−1/2}Ξ; vol(xU)≍1/y so Ξ≍y^{1/2}=exp⟨ρ₀,H₀⟩ | matches Ξ_P≍d_{P,ρ₀}, bpcz line 1121 |
| §2.6 Checks 777, 783 | (1+\|x\|)^{−1} on ℝ; Franke p=2 | ∫(1+\|x\|)^{−2}=2, ∫1=∞; ‖pR(X)φ‖₂=2‖R(X)φ‖₂ for w=p²=4, √2 for w=p | AutomorphicSpectralTheory §5.1 (head, line 2726) puts p on the form, so w=p² is right |
| §2.7 line 787 | one-point quotient, mass 1, weight w | ‖φ‖_w=w^{1/2}\|φ\|, Ξ=1, bound \|φ\|≤q(φ)w^{−1/2} with q=‖·‖_w | matches bpcz (2.5.5.4), line 1273 |
| §2.12 line 897, support of R(f)μ | pairing ⟨μ,R(f*)φ⟩ with f*(g)=conj f(g⁻¹), μ=δ_y | ⟨δ_y,R(f*)φ⟩=∫f(y⁻¹x)conj φ(x)dx, density x↦f(y⁻¹x), support y·(supp f)⁻¹; R(g)δ_y=δ_{yg⁻¹} | supp μ·(supp f)⁻¹ is the right side for this convention |
| §2.12 Check 907 | δ_x, δ_y, weight 1 | total-variation distance 2 | norm continuity of the orbit fails; bpcz line 1333 claims a continuous Banach representation (Source issues) |
| §2.13 Check 933 | exp(iy²), (y d/dy)^k | leading term (2i)^k y^{2k} | no single N; as stated |
| §2.14 Checks 959–965 | w=1; w=n_P; constant 1 | S_1=T; n^{−N}n^r bounded for all r forces S; 1∉S_{n_P} | as stated; (2.5.11.9) at bpcz line 1386 |
| §2.14 measure statement | μ=δ_y, f compact, w=n_P | R(f)δ_y supported in y(supp f)⁻¹, compact, so in S; w=Haar on a noncompact quotient: R(f)1=(∫f)·1∉S | "bounded above on supp μ" is necessary and is what bpcz line 1395 states |
| §2.16 Checks 989–993 | P=Q, mass-one compact quotient | ⟨CT1,1⟩=1=⟨1,EP1⟩; scaling one measure: 2≠1; both: 2=2 | adjunction depends on compatible measures |
| §2.17 line 997 versus bpcz line 1460–1471 | ‖x‖_P^N, d_P^Q(x)^{−r}, w(a)δ_Q(a)^{−1}da over A_Q^∞ | identical quantifier order: N before r in part 2 | as stated |
| §2.18 line 1009 versus bpcz line 1536–1543 | w_P^±∼w on ω_P^Q[>ε] | third bullet of Proposition 2.5.15.1 | as stated |
| §3.1 Check 1043 | one-dimensional type, operator a·id | unit vector: a; 2v: 4a; unitary basis change preserves the sum | basis independence needs orthonormality |
| §3.2 Check 1053 | I(λ,x)=e^{λx}, g=1_{[0,1]} | I(1,g)=e−1; I(−1,g*)=∫_{−1}^0e^{−x}dx=e−1; I(1,g*)=1−e^{−1} | −conj λ with conjugate inversion is the adjoint; bpcz line 2053 prints λ̄ and g^∨ (Source issues) |
| §3.2 Check 1055 | B(u,v)=u·conj v, A=2, T=i | B(2i,1)=2i; T*=−i, B(2,−i)=2·conj(−i)=2i; B(2,i)=−2i | as stated |
| §3.3 line 1059 versus bpcz lines 2089–2131 | weights on A_P^∞; general w | L²_{w,X}=closure of O_X; F_X=orthogonal of S_{X^c} in F | as stated |
| §3.4 line 1085 versus bpcz lines 2157–2175, 2279, 2289 | F∈{C,T_w,S_{w,N}} | absolute summability in C, T_{w n^{N₀}}, S_{w,N+N₀}; density (2.9.5.9); products (2.9.6.10) | as stated |
| §3.5 Checks 1115–1121 | GL₂ Borel, χ⊠χ; χ₁⊠χ₂ | stabilizer orders 2 and 1; M=G: W(G)=1 | as stated |
| §3.6 line 1125 versus bpcz line 2344–2350 | Re s>0, δ_P^{s−1/2}φ_P | C_{χ_M}([M_P]) and holomorphy on H_{>0} | as stated; the boundary hedge is right |
| §3.7 "converges absolutely" versus bpcz line 2394 "converges" | φ=Σ_iR(f_i)φ_i by Dixmier–Malliavin | Σ_v\|⟨φ_i,E(I(λ,f_i*)v,λ)⟩\|‖E(v,λ)‖_{T_N}≤CΣ_vp(I(f_i*)v)q(v)<∞ by Proposition 2.8.4.1 and Lapid Proposition 5.1 | the README's stronger wording is supported by its stated route |
| §3.7 Checks 1147–1149 | compact torus, mass one, single mode e_m | coefficient 1 for e_m, 0 otherwise; φ=0 gives 0; φ off the χ-block reconstructs its χ-component only | as stated |
| §3.9 line 1179 versus bpcz lines 2431–2443 | q=sup(w n^{N₀})^{−1}\|·\| | \|K(x,y)\|≤p(f)w(y)^{−1}w(x)n(x)^{N₀} | as stated |
| §3.10 Checks 1203–1205 | circle, D=(2π)^{−1}d/dx, Y=iD−1, f=e_{−1}; Y=D | De₁=ie₁, De_{−1}=−ie_{−1}; Ye_{−1}=0, Ye₁=−2e₁; kernel e₁(x)e_{−1}(y), R_y(Y) on e_{−1}: 0, R(Y)f=0, 0≤0; conj(Ye₁)=−2e_{−1} gives 2≤0 false; Y=D: both coefficients −i | as stated |
| §3.10 line 1191 versus bpcz lines 2481–2497 | coefficient \|𝒫(M_P)\|^{−1}, x,y∈G(𝔸)¹, bound p(L(X)R(Y)f)‖x‖^N‖y‖^N | identical | as stated |
| §4.1 Checks 1235–1243 | T=all finite places; GL₁; S₃ model | H_G^T=ℂ; Laurent evaluation; (−1/2,−1/2,1) | as stated |
| §4.2 line 1247 versus bplzz line 1091–1094 | inner form G′, almost all v∉T with G_v≃G′_v | identical | as stated |
| §4.4 API line 1307 | R(f*g)=R(f)R(g), R(g*f)=R(g)R(f) | image R(f)R(g)⊂image R(f)⊂L²_cusp; R(g)(L²_cusp)⊂L²_cusp | the two cases are assigned the right reasons |
| §4.4 Check 1319 | GL₂, trivial ω, f≥0 with ∫f>0 | R(f)1=(∫f)·1≠0, orthogonal to cusp forms | not quasi-cuspidal, as stated |
| §4.5 line 1325 versus bplzz line 1231–1233 | γ_M^+, λ_M∘γ_M^− | identical two conditions | as stated |
| §4.6 route line 1353 | GL₂: M(𝔸)/(M(F)Z(𝔸)SL₂(𝔸)K_M M∞) | ≅ 𝔸^×/(F^×(𝔸^×)²Ô^×ℝ_{>0}), a quotient of Cl/Cl², finite | finitely many representatives exist, as the route needs |
| §4.8 Check 1393 | one bad Casimir c≠targets | damped (q(z)−c) kills exactly the fiber; W-product times sharp seed lies in M♯θ by the module law | as stated |
| §5.2 line 1449 versus bplzz lines 1382–1419 | s_w=ℓ(wα_χ)−ℓ(α_σ); ν_w at v[w]; ν†_{w,w′}; constants C_w; product over w′; damping μ†; seed μ⁰∞ | same construction step by step | as stated |
| §5.2 Check 1465 | M=G, equal χ∞, h with χ(h)≠χ_σ(h) | μ⁰∞⊗(h−χ_σ(h)1): 0 at σ, μ⁰∞(χ∞)(χ(h)−χ_σ(h))≠0 at χ | as stated; bplzz line 1375–1376 omits the seed (Source issues) |
| §5.3 line 1477 versus bplzz line 1428–1435 | range in ⊕_{D_χ}, μ(χ)=1 | identical; "finite sum" from Lemma 3.13 (line 1440–1441) | as stated |
| §5.4 line 1493 versus bplzz lines 1120–1130 | Theorems 3.6 and 3.7 | identical; L²_cusp[χ] as the maximal closed χ-subspace (line 1105–1107) | as stated |
| §5.5 line 1507 versus bplzz line 53–60 | Theorem 1.1 hypothesis and range | identical | as stated |
| §5.6 Check 1533 | Satake parameters 2,3; 2,2 | 1−5T+6T²; 1−4T+4T² | multiset retained |
| §5.7 Check 1545 | PGL₂, ρ=1/2, q(λ)=λ²−1/4 | −t²−1/4 at it; 0 at 1/2; never equal | as stated |
| Examples 477, 1021, 1413, 1551 and Worked examples 1562–1564 | damped sinc; GL₂ cusp tails; T−2 at 2,3; selectors 2 and 3 | 1 at 0, 0 at ±1, imaginary-axis magnitude e^{−t²}sinh(π\|t\|)/(π\|t\|); y^{1/2}e^{−√(1+log y)}/Ξ=e^{−σ^{1/2}}; values 0,1; 6 then 1 | consistent with their sections |

Suppliers and ownership, resolved this round at the heads the brief names or on main: AutomorphicSpectralTheory §§0.11–0.15, 1.5–1.10, 2.3–2.5, 3.1–3.4, 4.1–4.4, 4.7–4.9, 4.11–4.14, 5.1–5.9, 6.1–6.4 (all headings present; §0.11 has no isotypic sum or joint-continuity statement, §0.14 is Euclidean, §§6.1–6.3 are compact Paley–Wiener, so the six gaps on it ask for what it does not state; its §6.4 kernel convention and §1.9 cuspidal-datum convention agree with §§3.8 and 3.3 here); AutomorphicFormsOnReductiveGroups §§0.1–0.5, 2.1–2.4, 2.7 (`dixmierMalliavin` and `S(G(𝔸))=S(G(𝔸))*C_c^∞` at line 468), 3.4–3.5, 4.1–4.2; AdelicAlgebraicGroups §§2.1–2.3, 3.1, 3.4–3.6, 4.6–4.7; SmoothRepresentationsOfLocalGroups SR.1.1–1.3, SR.2.2, SR.4.1–4.2; AutomorphicLFunctionsAndLocalFactors anchor `isobaric-construction` (line 271) and AL.3 "Strong multiplicity one for isobaric sums" (line 2321, retaining multiplicities and norm twists); SpectralManifolds SM3 (Fréchet open mapping and closed-subspace quotients, line 80–82); VonNeumannAlgebras V4.Core (line 736); GlobalHolomorphicFunctions "Preparatory primary factors and locally uniform products" (line 223; product under Σ(R/\|a_n\|)^{p_n+1}<∞, exact zero divisor, deviation bound); ZerosOfLFunctions `OrderLE` (line 284) and Layer 5 items 1–6 (canonical product at order ≤1, line 967); ModularCurvesPartII §1.4a "Lattice sigma function" (line 490); CongruenceSpectralGap Layers 0–5 (titles at lines 141–781 match line 17 here); GanGrossPrasadUnitaryGroups §§6.3–6.4 (lines 1213, 1247); on main: NoncommutativeGeometry N1 (completed projective tensors), OperatorIdeals OI-B29, B32, B33, B41, B84 and Part C, SelfAdjointSpectralTheory Parts A–E, PDE Lane A (line 223), ReductiveGroups Layer 7 (line 627), RepresentationTheory/LieGroups Layers 6–7 (lines 383, 407). Object searches across main and all open heads for canonical products, elementary factors, quasi-cuspidal test functions, T-multipliers, Delorme multipliers, moderate/rapid vertical symbols, Schwartz multipliers and cuspidal isolation found no second owner: ZerosOfLFunctions owns only the order-≤1 product; GlobalHolomorphicFunctions' `elementaryFactor` has the same body and is cited as owner at README line 15, with the local copy declared under this roadmap's own namespace for the acceptance test (recorded in both round-1 passes, not re-raised). All 29 gap suppliers are earlier in the merge order or on main.

## Not verifiable

- Bernstein (`bernstein`) is uncertified; the §2.7 and §2.8 locators were checked only through bpcz lines 1271–1273 and 1281–1283, which cite the same places.
- No Lean build or `#check` was run in this read-only pass; the job's elaborated signatures and the package report's recorded elaboration (three `sorry` warnings, ten `#check @name` lines) are the evidence relied on.
- Ownership against open pull requests was checked through the brief's sibling checkouts, the roadmap index used by `roadmaps grep` and the resolver; no unlisted checkout was sought.
- Lemma 2.25 of BPLZZ (§1.5), Lemma A.2's fixed-type continuity (§1.3) and the Donnelly and Müller counting inputs (§§4.6, 5.7) were checked against their statements and the surrounding text, not re-derived; they are declared gaps.

## Source issues

- **Error** in bplzz at §2.2, notation before Definition 2.8, printed p.10 (line 451–452): the source says the set of root-datum automorphisms of order at most two is finite; it should be the finite coset Wϑ₀ used in §2.3, since a rank-two torus datum has infinitely many involutions; affects the proof.
- **Misprint** in bplzz at Lemma 2.22 proof, printed p.16 (line 756–759): the source writes the annihilating polynomial with the translates t_λz; it should be t_{−λ}z under its convention (t_λf)(α)=f(α−λ), as the weight-one torus shows; affects nothing.
- **Misprint** in bplzz at Proposition 3.17 proof, printed p.28 (line 1375–1376): the source takes a bare Hecke element as the multiplier in the second M=G case; it should be multiplied by a sharp seed nonzero at χ∞, since the sharp algebra need not contain 1; affects the proof.
- **Misprint** in bplzz at Proposition A.1, printed p.43 (line 2104): the source quantifies over all of N(h*ℂ); it should be the W-invariant symbols, as the bilinear map (A.1) at line 2111 and the evaluation at a W-orbit require; affects nothing.
- **Misprint** in bpcz at §2.5.4, printed p.210 (line 1217–1219): the source says equivariant SLF morphisms with closed image are topological embeddings; it should add injectivity, or pass to the quotient by the kernel; affects nothing.
- **Error** in bpcz at §2.5.9, printed p.213 (line 1333): the source says the weighted Radon-measure space is a continuous Banach representation of G(𝔸); right translation is not norm-continuous there, two distinct point masses being at distance two; affects nothing in its uses, which need only bounded translation and weak smoothing.
- **Misprint** in bpcz at Proposition 2.8.4.3, printed p.229 (line 2053–2057): the source writes the second slot with parameter λ̄ and plain inversion g^∨; it should be the Petersson adjoint, parameter −λ̄ with conjugate inversion; affects a stated result.
- **Misprint** in bpcz at Theorem 2.9.4.1(2), printed p.232 (line 2166): the source says the family is absolutely summable in S([G]); it should be S([G]_P), as the proof at line 2187 shows; affects nothing.
- **Misprint** in bpcz at Corollary 2.9.7.2 proof, printed p.237 (line 2355–2358): the source defines ψ_s=δ_P^sψ and then differentiates with coefficient (2s−1)⟨ρ_P,X⟩; the coefficient should be 2s⟨ρ_P,X⟩ for that definition, or the definition should carry δ_P^{s−1/2}; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f09b5758a8103f86ac9761fc87e58d1da512052e", "job": "RT-AutomorphicSpectralTheoryPartII~2b", "model": "fable", "worker": "chris-x9"} -->
