<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/332#issuecomment-6405575718 -->
Review (claude) of 5bb542d

Verdict: accepted
Conditional on the announced gaps: `solid-localization-kernel`, `discrete-adic-solid-comparison`, `siegel-ordinary-igusa`, `klingen-height-one-igusa`, `abelian-affinoid-basis`, `projective-banach-cohomology`, `banach-support-duality`, `coherent-correspondences`, `equivariant-coherent-models`, `pel-subcanonical-vanishing`, `abelian-subcanonical-vanishing`

1. **F01** (P3) 6.1a: name the level choice and the flatness input precisely

   **Location.** `packages/HigherHidaAndColemanTheory/design/README.md` line 925, F5/abelian-coefficient-descent: "with compatible neat levels and a cone decomposition refined so that the toroidal compactifications for G₁, B₁ and G are smooth … f … finite and generically finite étale with group Δ=Δ(K,K′) (PerfectoidShimuraVarieties §§6.6, 6.9)"; the proof route at line 933: "Since the toroidal compactifications are smooth of the same dimension, the finite map f is flat".

   **Claim.** The statement's hypotheses are exactly those of the cited supplier sections, and the flatness of f follows from them.

   **Witness.** PerfectoidShimuraVarieties §6.9 (open head 47e1dbe) states its Δ-quotient "for neat K ⊆ G(𝔸_f), K′ ⊆ B₁(𝔸_f) with f(K′) normal in K" and refines Σ only "so that … is finite and generically finite étale"; §6.6(3) supplies the existence of such a K′. Neither supplies a Σ simultaneously perfect for G₁ and smooth for G and B₁. Miracle flatness needs only a regular target and a Cohen–Macaulay source: a finite map onto a singular quotient, for instance 𝔸² → 𝔸²/{±1} with coordinate ring F[x²,xy,y²] ⊂ F[x,y], is not flat (the fibre over the origin has length 2 while the generic fibre has degree 2 but the module F[x,y] is not free over the invariant ring), so the target's regularity is the hypothesis that carries the proof; the smoothness of S^tor,0(B₁) is never used, because a normal toroidal embedding is Cohen–Macaulay.

   **Repair.** In the standing sentence of 6.1a write "with K′ ⊆ B₁(𝔸_f) chosen as in PerfectoidShimuraVarieties §6.6(3), so that f(K′) is normal in K and f is finite and generically finite étale with group Δ(K,K′) (§6.9), and with Σ perfect for G₁ and smooth for G"; drop "the toroidal compactifications for G₁, B₁ and G are smooth". In the proof route replace "Since the toroidal compactifications are smooth of the same dimension" by "Since the target is regular and the source, a normal toroidal embedding, is Cohen–Macaulay of the same dimension, the finite map f is flat (miracle flatness)". Record in the same sentence that a Σ perfect for G₁ and smooth for G is a hypothesis of the theorem (BP-Coleman Lemma 6.6.4, BP-Coleman line 7543–7544, needs no smoothness and passes to refinements by the projection formula; the projectivity assertion (2) is this roadmap's addition and is what needs the regular target). Retest: on the Hodge-type instance G₁=G, Δ=1, K′=K the normality condition is trivially satisfied and nothing changes; on PGSp₄ with its GSp₄ cover, Δ=Δ(K,K′) is a group exactly when f(K′) ⊲ K. Update the plan node's statement and hypotheses identically.

2. **F02** (P3) 9.7 Check overstates what the threshold −2 excludes

   **Location.** `packages/HigherHidaAndColemanTheory/design/README.md` line 1412, X8/klingen-small-slope, second Check: "uses min(1,−2)=−2 in all degrees, which admits no slope".

   **Claim.** No class of the Klingen complexes has slope below −2, so the all-degree comparison at (k,r)=(0,2) is vacuous.

   **Witness.** Line 1382 of the same README (and Pilloni-Singular Proposition 13.3.1.1, Pilloni-Singular line 4043–4045) proves only slopes ≥ −3 on every H^i; Pilloni-Singular Remark 13.3.1.1 (line 4100–4103) says explicitly that the authors cannot improve this bound. The window [−3,−2) is not excluded by anything the roadmap proves, so "admits no slope" is unproved.

   **Repair.** Replace "which admits no slope" by "which admits no nonnegative slope: ordinary slope 0 is outside the all-degree statement, and only the proved bound ≥ −3 of X8/klingen-analytic-family constrains the window [−3,−2)". Same change in the plan test `X8.klingen-small-slope.combined`. Retest: at (k,r)=(0,2) the degree-0 statement still covers slope 0 through min(1,1)=1, as the Check's second clause says.

3. **F03** (P3) sources.toml: the BP-GL2 `venue` field is double-encoded

   **Location.** `packages/HigherHidaAndColemanTheory/sources.toml` line 65, key `BP-GL2`: `venue = "Ãpijournal de GÃ©omÃ©trie AlgÃ©brique, …"`.

   **Claim.** The manifest records the journal name.

   **Witness.** The bytes are UTF-8 of a Latin-1 misreading of UTF-8 (`Ã` + `©` for `é`); the journal is Épijournal de Géométrie Algébrique, as the README's reference line 1464 spells it.

   **Repair.** Set `venue = "Épijournal de Géométrie Algébrique, Volume 6 (September 13, 2022) epiga:6112"`. Nothing else in the entry changes (DOI, arXiv id, sha256 and locator are correct). Retest: the README reference and the manifest then agree byte for byte on the journal name.

4. **F04** (P3) 9.1 locator printed twice

   **Location.** `packages/HigherHidaAndColemanTheory/design/README.md` line 1286, X8/c2-weight-table: "(BP-Hida, §3.1, pp. 33–34; BP-Coleman §5.14.3, pp. 141–142; BP-Coleman, §5.14.3, pp. 141–142)".

   **Claim.** Three locators support the table.

   **Witness.** The second and third are the same locator; the content is supported by the two distinct ones (BP-Hida line 1756–1769 for the character lattice, parity and dominance; BP-Coleman line 6548–6562 for the four representatives and the two tables).

   **Repair.** Delete the repeated "; BP-Coleman, §5.14.3, pp. 141–142". Mirror in the plan node's `sources` if it is duplicated there.

5. **F05** (P3) set-difference written with a backslash before a parenthesis

   **Location.** `packages/HigherHidaAndColemanTheory/design/README.md` line 338 "X=Xbar\(D+∪D−) and C=Cbar\(p1*D+∪p2*D−)" and line 436 "Cbar\(int(p1*D+)∪int(p2*D−))".

   **Claim.** House style: mathematics in Unicode, never LaTeX delimiters.

   **Witness.** The two-character sequence `\(` is the LaTeX inline-math opener; here it is a set difference followed by a parenthesis, which a mechanical delimiter check cannot distinguish.

   **Repair.** Use the Unicode set-minus: "X = Xbar ∖ (D+ ∪ D−)", "C = Cbar ∖ (p1*D+ ∪ p2*D−)", "Cbar ∖ (int(p1*D+) ∪ int(p2*D−))". Same in the plan statements of D1/dynamic-compactification and D1/compact-dynamics.

Reviewed at head 5bb542d39334a06a1e04a8ddc045971c5ae18879 of the board branch `import/explorer-higher-hida-and-coleman-theory` (confirmed equal to the pull request's current head before reading). Files reviewed: `packages/HigherHidaAndColemanTheory/design/README.md` (1478 lines, 66 target sections), `packages/HigherHidaAndColemanTheory/design/plan.json` (66 nodes, 85 requests, 11 gaps, 9 source issues) and `packages/HigherHidaAndColemanTheory/sources.toml` (4 keys). Five findings, all P3; no P1 or P2. Acceptance is conditional on the eleven declared supplier gaps listed at the end of "Verified sound".

## Verified sound

**Previous findings, checked first at head 5bb542d.** Each round-2 finding (review of 519048f) was located in the repaired text and compared with the source at the cited lines.

| Round-2 finding | Status | Repaired passage (file and line) and witness |
|---|---|---|
| F01 (P1) global normalization from an arbitrary stratum | Repaired | README line 485: local t_w for every w∈MW; global t_κ=ν_(w₀)(κ)(t)t_naive for any w₀∈Cκ+, scalar independent of w₀, restriction p^(n_w′)t_w′ with n_w′=0 on Cκ+ and >0 off it, extension of t_κ alone by k′ΣZ_i. Lines 494 (API), 503–504 (GL₂ k=2, p=3 negative control: 1↦1 versus 1↦1/3; slopes (0,1) versus (−1,0); k≤0 and k=1 cases), 563 (Cousin elimination of incompatible strata through n_w′>0), 573 and 579 (regular control uses t_κ, t_w=t_κ since n_w=0; rational twist by −ν_id multiplies by p). Plan node H2/integral-normalization carries the same statement and the tests `.wrong_chamber`, `.slopes`. Source: BP-Hida line 2488–2489 (C(κ), independence of w), 2490–2500 (Proposition 4.3.11), 2501–2503 (Remark 4.3.12), 2504–2510 (Proposition 4.3.13), 2666–2688 (Theorem 4.5.2, Corollaries 4.5.4–4.5.5 over C(κ)). Recomputed: n_long=k−1 for k≥2, n_id=1−k for k≤0, both zero at k=1; the wrong normalization sends p^e to p^(e−1) for every e. |
| F02 (P1) abelian-type local projectivity unowned | Repaired, differently from the suggested supplier contract: owned here as F5/abelian-coefficient-descent | README lines 923–941 (statement (1)–(3), route, Needs, three Checks), line 951 (F5/family-complex Needs it), line 1068 (F5/family-vanishing-duality Needs it), line 143 (OverconvergentAutomorphicForms §8.7 contract names the premise and where it is proved), lines 182–187 (new PerfectoidShimuraVarieties §§3.13, 6.4–6.7, 6.9 contract lines). Source: BP-Coleman line 7510–7554 (Lemma 6.6.4: V_(ν_A)=(f_*V_(ν′_A))^Δ(K,K′), direct factor of invariants, B₁ step through G₁), 4476–4480 (Proposition 4.6.15, Hodge type and perfect Σ only), 4303–4333 (Remark 4.6.6: fibre-product and Δ-quotient formulas, "possibly after refining Σ"), 4455–4458 (Remark 4.6.13), 3926–3933 (Principle 4.4.44). Ownership: PerfectoidShimuraVarieties §6.14 at its head ends with the Hodge-type perfect-Σ trivialization; OverconvergentAutomorphicForms §8.7 at its head says that beyond that setting the covers "must be supplied or proved for the chosen affinoid"; `roadmaps grep` for Lovering, Δ-invariant/Δ-quotient and abelian-type coefficient descent finds the torsor-level descent in PerfectoidShimuraVarieties §6.9 and nothing at the coefficient-sheaf level. The consumer-side extension is therefore correctly owned here. The hypotheses' wording is R01. |
| F03 (P1) Klingen control used an unowned analytic family and extension theorem | Repaired | README lines 1376–1397 (X8/klingen-analytic-family: w-analytic sheaf as Kli(ℤ/p^n)-invariants, projective Banach A[1/p] model with compact U, slopes ≥−3 and ≥0 on H^0, one-variable cuspidal family in degrees 0,1 with fibre H^i_cusp(†,κ,2)[U=α], quasi-finite locally finite Z→W, locally constant Euler characteristic, two-term BGG with p^(−k−1)U and the three classicality ranges), 1399–1413 (X8/klingen-small-slope: bijective restriction below k+2r−3 for ε∈[0,1), combined ranges), 1421 (route of X8/klingen-control names both locally constant Euler characteristics and the equalities in degree 0 for all k and degree 1 for k≥3), 1423 (Needs lists both new targets and X8/local-refinement). Source: Pilloni-Singular line 3655–3663 (Proposition 12.8.2.1), 4043–4045 (Proposition 13.3.1.1), 4119–4128 (Proposition 13.3.2.1, Corollary 13.3.2.1), 4133–4156 (Proposition 13.3.3.1, Corollary 13.3.3.1), 4160–4182 (§13.4, Proposition 13.4.1), 4554–4577 (Theorem 14.7.1, Corollary 14.7.1), 4668–4676 (Lemma 14.8.4). Ownership: `roadmaps grep` for Klingen over main and all open heads finds geometry in ShimuraCompactifications C4.16–C4.17 (cited) and local Hecke material elsewhere; no analytic Klingen family or small-slope extension theorem elsewhere. |
| F04 (P3) BGG slope Check unlabelled | Repaired | README line 1008: untwisted V_lan,1 under f(z)↦f(p²z) has slopes 0,2,4; the term V_lan,1(w0Mκ) is twisted by −1 to −1,1,3; degree ≤1 kernel matches V_1 with slopes −1,1; at p=3 the twisted eigenvalues on 1,z are 1/3,3. Source: BP-Coleman line 7030–7035 (Example 6.2.19). Plan test `F5.locally-analytic-bgg.3` matches. |
| F05 (P3) interior-cousin without API/Checks; compact Check out of domain | Repaired | README lines 848–853 (four API bullets: source/target with Hecke stability and finite dimension on slope blocks; vanishing off ℓ±(w); identity when D=∅; global image as subquotient), 857–859 (zero map gives 0, identity gives F, GL₂ ranges and the t:F⟨t⟩→F⟨t⟩ fibre-of-image versus image-of-fibre test); line 541 (genus-one cusp: (q)↪O vanishes on the boundary fibre, GSp₂g boundary nonempty for every g≥1); line 583 (Examples sentence replaced). Plan node C4/interior-cousin now has `api` (4) and `tests` (3); H2/fixed-complex test `.cusp` matches. |

No finding was marked "not actionable in this package" in the repair report, so nothing is settled by that rule and nothing is re-raised.

**Adversarial pass on the text the repairs changed or added, and on the sampled targets and headlines.** Values computed on each side are shown; a row without values was not counted.

| Statement | Instances tried | Values computed on the two sides | Result |
|---|---|---|---|
| 3.2 t_κ independent of w₀ | GL₂ k=1, both chambers compatible | ν_id(t)=p⁻¹, ν_long(t)=p^(−k)=p⁻¹ at k=1; n=0 on both strata | pass |
| 3.2 n_w′>0 off Cκ+ | GL₂ k=2, 0, −1 | n_long=1; n_id=1; n_id=2 | pass |
| 3.2 wrong global chamber (negative control) | GL₂ k=2, p=3, constant coefficient | p⁻¹U: 1↦1; p⁻²U: 1↦1/3; after twisting lattices by p^e: p^e↦p^(e−1) | pass; matches BP-Hida Remark 4.3.12 (n_long=1) |
| 3.2 n_w′ formula versus Remark 4.3.12 | general w₀,w′ | p^(n_w′)=ν_(w₀)(κ)(t)/ν_(w′)(κ)(t): the −ρ terms cancel, leaving ⟨w′⁻¹w0M(κ+ρ)−w₀⁻¹w0M(κ+ρ),v(t)⟩ | pass; the printed remark has misplaced parentheses (Source issues) |
| 3.7 rational twist | GL₂ k=2 | ν_id(t)=p⁻¹; (p⁻¹U)⊗(−ν_id)=p·p⁻¹U=U_naive | pass; Corollary 4.5.5 |
| 1.2 A0/slope-conditions, sharp versus proved | GSp₄ κ=(5,3;−8), t₂ | sharp A_w: 3,4,4,8; proved max of the two bounds: 3,3,3,8 (BP-Coleman line 6553–6561) | pass; proved region implies sharp region |
| 1.2 cone order | ℝ≥0², (−1,10) | second coordinate 10≥0 but first −1<0: not ≥(0,0) | pass |
| 1.2 GL₂ endpoint | k=2, BP operator | threshold k=2 excluded, k−1=1 inside; U_std=p⁻¹U_naive endpoint 1 (BP-Coleman line 6541–6546) | pass |
| 2.1 D1/solid-scheme-operations | q=id on Spec A; smooth curve over 𝔽₂ and ℤ/9; D(t)⊂Spec A[t] | q!A=A[0]; Ω¹[1] in degree −1; j_*O=A[t,t⁻¹] versus completion A[[t]] | pass; BP-Hida line 574–579, 827–834 |
| 2.2 D1/dynamic-compactification | Frobenius on ℙ¹_(𝔽_p), D−=V(t); identity on a regular scheme | p2*D−=pD−, (t^p)¹⊆(t)^p so D−≤(1/p)(pD−); identity needs (t)^a⊆(t)^b with a<b, false | pass; Definitions 2.1.15, 2.1.19, Example 2.1.21 (BP-Hida line 374–376, 429–440) |
| 2.3 D1/ordinary-localization | A=ℤ/4 with T=1,0,2; ℚ₂ with T=2 | ordinary parts A, 0, 0 (2²=0 so T topologically nilpotent); over ℚ₂ the scalar 2 is a unit of slope 1 and is retained | pass; Definition 2.4.2, Lemma 2.4.3 (BP-Hida line 889–901) |
| 2.5 D1/discrete-base-change | [ℤ₂ --2→ ℤ₂]⊗^L 𝔽₂; A=ℤ₂→A′=𝔽₂ with X=Spec ℤ₂[t]/(2t) | derived fibre H⁰=𝔽₂ (Tor₁), H¹=𝔽₂; underived loses H⁰. Tor₁(O_X,𝔽₂)≠0 from the 2-torsion t, so Tor independence is a genuine hypothesis | pass; Propositions 2.6.2, 2.6.13 (BP-Hida line 1048–1052, 1139–1150) |
| 4.3 I3/universal-complex | T′=ℤ_p, f(z)=z | lim_m colim_n ℤ/p^m[T′/p^n]=C⁰(T′,ℤ_p) contains z↦z; the uncompleted colimit contains only locally constant functions | pass; §5.2.6, Proposition 5.2.7 (BP-Hida line 2843–2856), Definition 1.4.1 (line 194–197) |
| 4.6 I3/derived-control | p=2, u=3, ν(u)=u; [A --t→ A] at t=0 | [3]↦3⁻¹ under −ν; derived fibre dimensions (1,1) while H⁰(family)⊗F=0 | pass; Theorem 5.3.5, Remark 5.4.3 (BP-Hida line 2891–2911, 2951–2953), no regularity assumed |
| 4.7 I3/finite-hecke | F[e]/e² acting by e; H¹-only complex | image dimension 2 with e²=0 retained; H¹-only object has image F | pass; BP-Hida line 2954–2955 |
| 4.9 I3/integral-amplitudes | g=1; g=2 w=s1; g=3 | degrees 0 (id, both variants) and 1 (long); canonical [1,3], cuspidal [0,1]; d=6 is Conjecture 5.6.1 | pass; Proposition 5.6.3 (BP-Hida line 2989–3014) |
| 6.1a descent, integral non-example | Δ={1,σ} over ℤ₂ and ℚ₂ | invariants ℤ₂(1+σ)→ℤ₂ has image 2ℤ₂; over ℚ₂ the idempotent (1+σ)/2 exists | pass; Check 3 correct |
| 6.1a descent, Hodge degenerate case | G₁=G, Δ=1, K′=K | (f_*V)^Δ=V; reduces to Proposition 4.6.15 | pass |
| 6.1a descent, flatness of f | regular target, CM source; singular target 𝔸²/{±1} | finite + regular target + CM source ⇒ flat; F[x,y] over F[x²,xy,y²] not flat | R01: only the target's regularity is needed |
| 6.1a descent, projectivity of (f_*V′)(U)^Δ | U=V/Δ for V a Δ-stable pregood affinoid at G₁-level | V′(V) projective over O(V)⊗̂A (Proposition 4.6.15 after finite flat cover); O(V) finite projective over O(U) by flatness; Δ-invariants a direct summand in characteristic 0 | pass under R01's hypothesis |
| 6.3 F5/perfect-slopes | A=F⟨t⟩, C=[A --t→ A]; rational subdomain | H¹=A/(t) finite, not projective; Q̃ with unit leading coefficient; Remark 6.1.13 gives descent along rational localization | pass; Proposition 6.1.11, Lemma 6.1.15, Remark 6.1.16 (BP-Coleman line 6691–6808) |
| 6.8 F5/analytic-control | GSp₄ w=1, v=s0, t₂; modular curve | thresholds −3−(−3)=0 and −3+3−(−3)=3: slope 2 excluded, slope 3 not; W_M={1} makes BGGsafe vacuous | pass; Corollary 6.8.4, Remark 6.8.5 (BP-Coleman line 7706–7715) |
| 7.2 E6/classical-points | GSp₄ ν=(0,−2) dominant; ν=(1,0) | first admitted; second violates 0≥ν1 so the converse is not asserted | pass; Theorem 6.9.3(1)–(2) and proof (BP-Coleman line 7778–7821); the README's BGGsafe replaces the printed sss_(M,w), as its E3 records |
| 8.2 B7/ordinary-comparison | vertical twist m(D+−D−); slope block ≤h | [1/p] erases the twist; image of H^i(K_int) in the finite-dimensional ≤h block is open and bounded; normalized t stabilizes a lattice ⇒ naive slopes ≥⟨t,w⁻¹w0M(κ+ρ)+ρ⟩, e.g. 3 on the identity stratum for t₂ | pass; Propositions 6.1.7, 6.1.11, Theorem 6.2.9, Corollary 6.2.10 (BP-Hida line 3064–3084, 3114–3136, 3183–3214) |
| 9.1 X8/c2-weight-table | ρ, 2ρ_nc from roots; ν=(0,−2); ν=(1,1−k) | noncompact positive roots (−2,0),(0,−2),(−1,−1) sum to (−3,−3); compact (1,−1); ρ=(−1,−2). κ_r=(5,3),(5,1),(2,−2),(0,−2); κ_0=κ_1=(k+2,2) on the wall; duals (3−κ₂,3−κ₁) | pass; BP-Hida line 1756–1769, BP-Coleman line 6548–6562 |
| 9.6 Klingen family ranges | k=0; k=3 | all-degree threshold k−2=−2 and 1; degree-0 threshold k+1=1 and 4; slope 0 covered in degree 1 exactly from k=3 | pass; Corollary 13.3.3.1, Lemma 14.8.4 |
| 9.6 slope bounds in a family | point κ versus affinoid A | a slope <−3 eigenvalue over A specializes, through the maximal nonzero degree and the Tor sequence of 6.4, to a slope <−3 class at a point, contradicting Proposition 13.3.1.1 | pass; the family bound follows from the pointwise one |
| 9.7 small-slope threshold | (k,r)=(0,2),(0,0),(3,2) | k+2r−3=1, −3, 4; combined min(1,−2)=−2, min(1,1)=1 | pass for the thresholds; R02 for the wording "admits no slope" |
| 9.8 Klingen control | p=2, k=0 and 3,4; trace at k=0 | rational control at k=0; torsion assertion needs k>3 so 4 in, 3 out; divisibilities (p⁴,1),(p²,p),(1,p³) give products p⁴,p³,p³, all divisible by p³ | pass; Pilloni-Singular line 4758–4765 |
| Headline I3/family-duality | d=3, ℓ(w)=1, w*=w0M w w0 | cuspidal [0,1] pairs with canonical [2,3] into Λ[−3]; adjoint of t is w0t⁻¹ | pass; Theorems 5.5.1–5.5.2 (BP-Hida line 2957–2978) |
| Headline B7/rational-amplitudes | g=3, d=6, ℓ=2 | rational canonical [2,6], cuspidal [0,2]; integral statement not asserted | pass |
| Headline C4/geometric-classicality | GL₂ k=2; k=1 | regular: one column, edge map an equivalence; singular: l_min=0, l_max=1, interior in [0,1] | pass |
| Headline E6/eigenvariety and E6/interior-equidimension | zero complex; H¹=F only; A=F⟨t⟩ with M=A, M=A/(t) | empty support; one point; support dimension 1=dim W; torsion module excluded | pass |
| Headline E6/interior-sharp-bounds | GL₂ k=2, analytic slope 0 | algebraic bound 0+⟨t,(k−2;−k)⟩=1 | pass |
| Headline B7/sharp-siegel and X8/siegel-check | k₁=5,k₂=3 | t₂ bounds 3,4,4,8; t₁ bounds 6,6,11,11; U₂_std=p⁻³U₂ threshold k₂−2=1 | pass |
| Headline X8/klingen-control | k=0, r=2 | threshold 1 contains slope 0; the two Euler characteristics d1−d0 and d†′1−d†′0 agree by Lemma 14.8.3 at large k | pass |

**Seeded source sample.** No locator is flagged unverified by the author (no such flag in README, plan or manifest). All fifteen sampled targets were read at their locators in the cached author editions; "supports" means the numbered result has the stated content with the stated hypotheses.

| Target | Locator opened (source lines) | Verdict |
|---|---|---|
| 1.2 A0/slope-conditions | BP-Coleman §5.9 line 5630–5648, Definition 5.11.2 line 6022–6042, Definition 5.11.14 line 6210–6222 | supports; relative order through Δ_d, proved strongly-small as the disjunction, ss_M as the sharp bound |
| 2.1 D1/solid-scheme-operations | BP-Hida §2.2 line 574–746, §2.3 line 747–879 | supports; finite type over ℤ, discrete subcategory, the two support orders and their limit formulas (Corollary 2.3.11, line 841–843) |
| 2.2 D1/dynamic-compactification | BP-Hida Definitions 2.1.15, 2.1.19, 2.1.24, 2.1.26, line 374–376, 429–435, 444–451, 456–461 | supports, including Remark 2.1.27 (D± may intersect) |
| 2.3 D1/ordinary-localization | BP-Hida Definition 2.4.2, Lemmas 2.4.3–2.4.4, line 889–945 | supports; artinian finite case and the tower case with its hypotheses |
| 2.5 D1/discrete-base-change | BP-Hida Propositions 2.6.2, 2.6.13, line 1048–1052, 1139–1150 | supports; A-flat F, discrete finite M, Tor independence for finite A→A′ |
| 4.3 I3/universal-complex | BP-Hida §5.2.6, Proposition 5.2.7, line 2842–2856; Definition 1.4.1, line 194–197 | supports; order lim_m colim_n, independence of K_(p,P), admissibility |
| 4.6 I3/derived-control | BP-Hida Proposition 5.3.3 line 2876–2885, Theorem 5.3.5 line 2891–2911, Remark 5.4.3 line 2941–2953 | supports; no regularity hypothesis, specialization through −ν |
| 4.7 I3/finite-hecke | BP-Hida §5.4 line 2954–2955 | supports; finite Λ-algebra, nothing more asserted |
| 4.9 I3/integral-amplitudes | BP-Hida Conjecture 5.6.1, Proposition 5.6.3, line 2983–3014 | supports; g=1 concentration and g=2 by the two-affine cover; g≥3 conjectural |
| 6.1a F5/abelian-coefficient-descent | BP-Coleman Definition 4.4.3 line 3155–3159, Principle 4.4.44 line 3926–3933, Remark 4.6.6 line 4303–4333, Remark 4.6.13 and Proposition 4.6.15 line 4455–4480, Lemma 6.6.4 line 7510–7554 | supports (1) and (3); (2) is the roadmap's own theorem and is routed correctly under R01's hypothesis |
| 6.3 F5/perfect-slopes | BP-Coleman §6.1.10–6.1.17 line 6686–6832, Proposition 6.1.11 line 6691–6694, Lemma 6.1.15 and Remark 6.1.16 line 6796–6811, Theorem 6.4.3 line 7262–7278 | supports; cohomology canonical, complex representative not |
| 6.8 F5/analytic-control | BP-Coleman Corollary 6.8.4 and Remark 6.8.5 line 7706–7715, Theorem 6.8.3 line 7690–7705, Theorem 6.5.5 line 7399–7414 | supports with the README's E3 substitution of BGGsafe for sss_(M,w) |
| 7.2 E6/classical-points | BP-Coleman Theorem 6.9.3(1)–(2) and proof, line 7771–7821 | supports; w=w^M w_M, dominant ν_alg in the converse |
| 8.2 B7/ordinary-comparison | BP-Hida Proposition 6.1.7 line 3064–3084, Proposition 6.1.11 line 3114–3136, Theorem 6.2.9 line 3183–3207 | supports; lattice through BP-Coleman Lemma 5.9.10 (line 5739–5768) |
| 9.1 X8/c2-weight-table | BP-Hida §3.1 line 1734–1795; BP-Coleman §5.14.3 line 6548–6562 | supports; locator printed twice (R04) |

**Pinned library declarations.** Opened at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a (the content manifest's pin): `Module.End` is the abbrev at Mathlib/Algebra/Module/LinearMap/End.lean:32 with `[Semiring R] [AddCommMonoid M] [Module R M]`; `zpow_sub₀` at Mathlib/Algebra/GroupWithZero/Units/Basic.lean:399 with hypothesis `a ≠ 0`; `DerivedCategory` is the def at Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87 under `[Abelian C] [HasDerivedCategory.{w} C]`; `CondensedMod` is the abbrev at Mathlib/Condensed/Module.lean:40 with the abelian instance at line 42; `CondensedMod.IsSolid` is the class at Mathlib/Condensed/Solid.lean:83 whose docstring at lines 74–81 restricts the direct predicate to finite-type ℤ-algebras and prescribes the polynomial restriction. The README's Mathlib contract (line 44) states exactly these facts and claims no theorem the pin lacks. Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 is cited for no declaration (line 48), which is correct: no Shimura, Igusa or solid-localization carrier exists there.

**Supplier citations resolved this round.** ShimuraCompactifications (open head 63e3f03) has C4.16 "The compactified Klingen correspondence" on triples (A,H_n,L) and C4.17 "Acyclicity of the Klingen first projection", algebraically and after analytification, as the README's contract lines 206–207 say; C3.1, C3.9, C5.19–C5.21, C5.29 are present. PerfectoidShimuraVarieties (open head 47e1dbe) has §3.13 (affinoid basis with affinoid perfectoid preimages, Siegel and Hodge type), §6.4 (B₁=G₁×_(G₁^ab)T, Δ(K,K′)), §6.5 (fibre products of torsors, trivial construction on the T-variety), §6.6 (connected towers, Δ), §6.7 (finite quotients with invariant pregood covers, |Δ| invertible), §6.8, §6.9 (Δ-quotient of the pushed-out torsor after refining Σ), §§6.12–6.15; §6.14 ends with Proposition 4.6.15 for Hodge type and perfect Σ. OverconvergentAutomorphicForms (open head bc53e3c) §8.7 states local projective Banach structure "under the actual finite-flat trivializing-cover hypotheses", supplied only in the Hodge-type pregood case with perfect Σ; §0.4 and §8.6 match their contract lines. LieHighestWeight is on main under TauCetiRoadmap/RepresentationTheory with "Layer 3: enveloping algebra, Verma modules, and L(λ)" (README line 405 of that roadmap). ShimuraCompactifications, PerfectoidShimuraVarieties, HodgeTateAndCanonicalSubgroups, OverconvergentAutomorphicForms and SolidAnalyticRings are open pull requests adding new roadmap folders, so citing their heads is allowed. The worker's `roadmaps resolve` found no missing cross-roadmap citation and no Lean name; I rechecked each new citation against the texts rather than relying on that.

**Plan and README consistency.** The 66 README target sections and the 66 plan nodes have the same ids; every `*Needs:*` line equals its node's `prerequisites` (0 mismatches over 66 nodes, Mathlib items compared by name); every gap's `neededBy` equals the set of nodes listing it; all 11 gap slugs appear in both the README and `plan.gaps`; the 85 requests are keyed `Supplier:section` and cover the 85 roadmap-external prerequisites (the two remaining external prerequisites are the Mathlib declarations, which need no request); all nine layers end with `### Examples` and `### Dependencies`; every definition or construction node has at least three Checks and every target has a locator. No `set_option`, no LaTeX delimiters other than the set-minus of R05, no process words, no pull-request numbers, no local paths in the README; the word "packet" occurs only inside "eigenpacket" and "lemma" only in prose.

**Gate.** Run from the board checkout on the design README against `merge-order/ORDER.txt`; exact output:

```text
candidate: HigherHidaAndColemanTheory is not in the merge order yet; checked as if placed after PerfectoidShimuraVarieties (the intake inserts it when its design is accepted)
note: supplier OverconvergentAutomorphicForms of HigherHidaAndColemanTheory is not in the merge order; it must be inserted before HigherHidaAndColemanTheory
note: supplier SolidAnalyticRings of HigherHidaAndColemanTheory is not in the merge order; it must be inserted before HigherHidaAndColemanTheory
depcheck: 56 roadmaps, 649 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the two notes are placement requirements for two open new-roadmap suppliers, not defects.

**Declared supplier gaps.** All eleven are declared in both files with a named supplier, a section and a one-sentence `needs`; each `needs` names the exact objects (two solid enhancements; two Igusa towers; the abelian affinoid basis; projective-Banach quasi-Stein cohomology; Banach support duality; coherent correspondences; group-ring models without dividing by |Γ|; PEL and abelian-type subcanonical vanishing); none asks for what Mathlib, Tau Ceti, a main roadmap or an open head already provides (checked against the supplier heads above and the pins). The acceptance is conditional on: solid-localization-kernel, discrete-adic-solid-comparison, siegel-ordinary-igusa, klingen-height-one-igusa, abelian-affinoid-basis, projective-banach-cohomology, banach-support-duality, coherent-correspondences, equivariant-coherent-models, pel-subcanonical-vanishing, abelian-subcanonical-vanishing.

**Principles.** No route-specific shortcut (every prime and genus kept, p=2 through the cofinal construction); no re-planning of PadicFamilies (its Layers 0, 0a and §§2a.15–2a.16 are imported, the Part II boundary is stated in Scope); no upward citation (gate); no copied passage (every locator was compared with the text, which is paraphrased); no algorithm; no Suggested.lean exists at the design stage, so there is no sorry'd data and no `set_option`.

**Headline theorems and Lean.** The README's headline inventory (line 248) is Iwasawa derived control and Serre duality (I3/derived-control, I3/family-duality), integral amplitude for g≤2 and rational amplitude in every genus (I3/integral-amplitudes, B7/rational-amplitudes), regular and singular geometric classicality (C4/geometric-classicality), cohomological eigenvarieties and interior equidimension (E6/eigenvariety, E6/interior-equidimension), sharp interior and Siegel slopes (E6/interior-sharp-bounds, B7/sharp-siegel) and the two-term Klingen control theorem (X8/klingen-control). None is statable at the pins: the carriers (toroidal Siegel models, Igusa towers, supported automorphic cohomology, analytic coefficient sheaves) exist in neither pinned library. There is no `Suggested.lean` in this design package, so there is nothing to elaborate, probe for padding or `#check`; elaboration: not available (this lane does not elaborate). At the package stage the module docstring must name each headline above and the missing carrier.

## Not verifiable

- Lean elaboration, one-tactic padding probes and `#check` binder comparison: no `Suggested.lean` exists at this stage and this lane does not elaborate; no claim of a sorry-only build is made.
- AutomorphicBundlesPartII, the supplier named by four declared gaps, exists neither on main, nor in `merge-order/ORDER.txt`, nor among the 367 open roadmap pull requests, nor in the board package index. The gaps are declared contracts with a named supplier and are not findings under the brief; I could not check their sections IC.2, IC.3, IC.5 against any text, so the intake will have to announce them on this roadmap's issue.
- The existence of a cone decomposition that is perfect for G₁ and smooth for G simultaneously (the hypothesis of 6.1a after R01) was not verified against a source; the theorem is stated under it and is not refuted by it.
- Journal pagination of BP-Hida, BP-Coleman and Pilloni-Singular was not compared with the author editions; every locator was checked against the author PDFs the manifest records, as the README's reference section says.
- Ownership against open pull requests was checked only through the `roadmaps grep`/`roadmaps show` index of 2026-10-25T23:37:10Z and the board package index; pull requests opened after that index were not searched.

## Source issues

- **Misprint** in BP-Hida at Remark 4.3.12, printed p. 48: the source says the exponent n_w′ is a difference of two pairings whose parentheses are unbalanced, with ρ apparently inside the Weyl action; it should be the difference of ⟨w′⁻¹w0M(κ+ρ),v(t)⟩ and ⟨w⁻¹w0M(κ+ρ),v(t)⟩, the ρ terms cancelling; affects nothing.
- **Misprint** in BP-Hida at Proposition 4.3.11, printed p. 48: the source says the structure sheaf is restricted away from the sum of D_i∩D_(2g+i−1); it should be D_i∩D_(2g+1−i), as in the statement's first line and Lemma 4.3.6; affects nothing.
- **Misprint** in BP-Hida at Lemma 4.3.6 proof, printed p. 47: the source says the sum of divisors runs over i=1 to d; it should run to g, there being only g pairs; affects nothing.
- **Misprint** in Pilloni-Singular at §13.4, printed p. 91, displayed fibre formula before Proposition 13.4.1: the source says the fibre at (κ,α⁻¹) computes H^i_cusp(κ,r)[U=α] with r unbound; it should be r=2, the weight of the family constructed there; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5bb542d", "job": "REV-DESIGN-HigherHidaAndColemanTheory~3", "model": "fable", "worker": "fable-rev169"} -->
