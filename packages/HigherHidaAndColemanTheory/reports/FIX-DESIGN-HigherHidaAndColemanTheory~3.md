# Repair report: HigherHidaAndColemanTheory design

## F01 (P1) — applied

H2/integral-normalization: "t_w for arbitrary w extends globally" → local t_w on each stratum, plus a global t_κ built from any w₀∈Cκ+, independent of w₀, restricting to p^(n_w′)t_w′ with n_w′>0 exactly off Cκ+; only t_κ extends via k′ΣZ_i. Added a GL₂ k=2, p=3 negative control (1 versus 1/3) and a slope Check ((0,1) versus (−1,0)). H2/integral-cousin and H2/regular-control now use t_κ.

Evidence: BP-Hida line 2488–2489 (C(κ) and independence of w∈C(κ)), line 2490–2500 (Proposition 4.3.11, global map for w∈C(κ)), line 2501–2503 (Remark 4.3.12, n_w′>0 off C(κ)), line 2504–2510 (Proposition 4.3.13), line 2666–2688 (Theorem 4.5.2, Corollaries 4.5.4–4.5.5 use C(κ)). Other occurrences checked: B7/integral-overconvergent works on one w-neighbourhood with the local t_w, so it is unchanged. X8/modular-check's p^(−min(1,k))U_naive is exactly t_κ (n_long=k−1 for k≥2, n_id=1−k for k≤0). Plan node, API, tests and locators updated to match.

## F02 (P1) — applied differently

Unowned abelian-type local projectivity → new owned target F5/abelian-coefficient-descent (§6.1a): V^n-an=(f_*V′)^Δ through B₁ and Δ, local projective Banach structure, and Δ-direct-factor cohomology, with Hodge-type, PGSp₄ and integral non-example Checks. F5/family-complex and F5/family-vanishing-duality now need it; the OverconvergentAutomorphicForms §8.7 and PerfectoidShimuraVarieties contracts were updated. No supplier target was invented.

Evidence: BP-Coleman line 3926–3933 (Principle 4.4.44), line 4303–4333 (Remark 4.6.6), line 4455–4458 (Remark 4.6.13), line 4476–4483 (Proposition 4.6.15, Hodge type only), line 7510–7554 (Lemma 6.6.4: abelian type through B₁ and Δ-invariants). Why this roadmap owns it: the statement concerns the analytic coefficient sheaves, whose construction is consumed here. The supplier text in PerfectoidShimuraVarieties §6.14 explicitly stops at Hodge type, and no roadmap on main or at an indexed open head states the coefficient-level descent.

## F03 (P1) — applied

Unowned Klingen inputs → two X8 targets. X8/klingen-analytic-family (§9.6): w-analytic sheaves, compact U, the one-variable cuspidal family and spectral variety, the locally constant Euler characteristic, BGG and the sheaf-level ranges. X8/klingen-small-slope (§9.7): the strict k+2r−3 restriction isomorphism. X8/klingen-control's Euler argument names both perfect families. Generic slope machinery is imported from its owners.

Evidence: Pilloni-Singular line 3631–3663 (§12.8, Proposition 12.8.2.1), line 4043–4045 (Proposition 13.3.1.1), line 4120–4159 (BGG triangle, Corollary 13.3.3.1), line 4160–4182 (§13.4, Proposition 13.4.1), line 4554–4577 (Theorem and Corollary 14.7.1), line 4668–4676 (Lemma 14.8.4). Retest: at r=2, k=0 the threshold is 1, so slope 0 is in and slope 1 is out. Ownership: a `roadmaps grep -i klingen` over main and the open heads found only ShimuraCompactifications C4.16–C4.17 (geometry) and SmoothRepresentationsOfLocalGroups (local Hecke algebra). Neither states this analytic family or this extension theorem.

## F04 (P3) — applied

F5/locally-analytic-bgg Check: "degree≤1 slopes 0,2, z² slope 4" → slopes labelled as untwisted (f(z)↦f(p²z): 0,2,4). The term V_lan,1(w0Mκ) has slopes −1,1,3, and its degree≤1 kernel matches V_1 with slopes −1,1. At p=3 the eigenvalues on 1 and z are 1/3 and 3. The plan test was updated and Example 6.2.19 added to the locator.

Evidence: BP-Coleman line 7022–7035.

## F05 (P3) — applied

C4/interior-cousin gained a four-bullet API: source and target with Hecke stability, vanishing off ℓ±(w), the identity when D=∅, and the global image. It also gained three Checks: the zero map gives 0, not the target; the identity gives F, not the kernel; GL₂ ranges plus the t:F⟨t⟩→F⟨t⟩ fibre-of-image versus image-of-fibre test. The plan node gained api and tests.

H2/fixed-complex's compact-variety Check became a genus-one cusp test: (q)↪O vanishes on the boundary fibre, and the GSp₂g boundary is never empty. The same out-of-scope sentence in Layer 3's Examples was replaced. The same pattern was checked elsewhere: the D=∅ Checks in Conventions, D1, C4 and E6 concern general schemes or abelian-type data, where compact cases are legitimate, so they stay.

## Checks run

Gate (exact output):

```text
candidate: HigherHidaAndColemanTheory is not in the merge order yet; checked as if placed after PerfectoidShimuraVarieties (the intake inserts it when its design is accepted)
note: supplier OverconvergentAutomorphicForms of HigherHidaAndColemanTheory is not in the merge order; it must be inserted before HigherHidaAndColemanTheory
note: supplier SolidAnalyticRings of HigherHidaAndColemanTheory is not in the merge order; it must be inserted before HigherHidaAndColemanTheory
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `roadmaps resolve` on the README found no unresolved cross-roadmap citations and no unresolved Lean names.

Plan consistency: request `neededBy`, gap `neededBy` and stage `coverage.remaining` were recomputed from node prerequisites. They agree exactly, and every external prerequisite has a request record. There are eight new request records: PerfectoidShimuraVarieties §§3.13, 6.4, 6.5, 6.6, 6.7, 6.9 and ShimuraCompactifications §§C4.16, C4.17.

Lean: there is no Suggested.lean at this design stage, so no `#check` pass was run and no Lean command was used.

Sources: every new locator was checked against the cached author editions (page markers recomputed) and recorded in sources.toml under the existing keys. No new source, fetch or missing-reference request was needed.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| H2 global t_κ, independence of w₀ | GL₂ k=1 (Cκ+={id,long}) | ν_id(t), ν_long(t) both give p⁻¹U_naive; n=0 on both strata | consistent |
| n_w′>0 off Cκ+ | GL₂ k=2; k=0; k=−1 | n_long=1; n_id=1; n_id=2 | positive as stated |
| Wrong-chamber global extension | GL₂ k=2, p=3, constant coefficient | p⁻¹U: 1↦1; p⁻²U: 1↦1/3; after twist p^e: p^e↦p^(e−1) | negative control added |
| Regular control twist | GL₂ k=2 | ν_id(t)=p⁻¹; p·(p⁻¹U_naive)=U_naive | consistent with Corollary 4.5.5 |
| F5 descent, invariants direct factor | Δ=C₂ over ℤ_2 and ℚ_2 | augmentation on invariants: image 2ℤ_2 versus ℚ_2 | char-0 hypothesis retained; Check added |
| F5 descent, Hodge degenerate case | G₁=G, Δ=1 | (f_*V)^Δ=V | reduces to the supplier's statement |
| F5 descent, flatness of f | smooth toroidal source and target, same dimension, f finite | miracle flatness applies; would fail for a non-CM source | smoothness hypothesis stated |
| Klingen small-slope threshold | (k,r)=(0,2),(0,0),(3,2) | 1, −3, 4; combined min(1,−2)=−2, min(1,1)=1 | Checks added; strictness kept |
| Klingen classicality ranges | k=0, k=3 | all-degree k−2=−2 and 1; degree 0 k+1=1 and 4 | degree-one equality starts at k=3, as Lemma 14.8.4 uses |
| BGG slope witness | SL₂ κ=1, p=3 | untwisted 0,2,4; twisted −1,1,3; eigenvalues 1/3, 3 | label added |
| Interior image | 0:F→F; id; t on F⟨t⟩ | dims 0, 1; fibre of (t) is 1, image of 0 is 0 | Checks added |
| Genus-one boundary map | O(−D)→O at q=0 | fibre map 0; identity 1 | replaces compact Check |

## For the maintainer

- New target names cited nowhere else yet: F5/abelian-coefficient-descent, X8/klingen-analytic-family, X8/klingen-small-slope. X8/klingen-control is now §9.8 and X8/unitary-check §9.9; target ids are unchanged.
- ShimuraCompactifications is cited at its open head (§§C4.16–C4.17), not on main. PerfectoidShimuraVarieties and OverconvergentAutomorphicForms were read at their indexed open heads.
- Ownership was checked against main and the indexed open heads with `roadmaps grep` and `roadmaps show`.
- No suspicious instructions were found in the review text.
