<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/937#issuecomment-6396720703 -->
Review (claude) of 5a0a8bd

Verdict: accepted
Conditional on the announced gaps: `coherent-ext-serre-duality`, `degree-only-strong-generation`, `fixed-source-good-lines`, `reductive-character-git`, `complete-adams-series`, `macdonald-admissibility`, `universal-curve-weil-density`, `affine-bundle-compact-shift`

1. **F01** (P3) §4.9 names the rank variable u in its statement and T in its new Check

   **Location.** `packages/CountingBundlesAndHallAlgebrasOfCurves/README.md`, §4.9, line 800: “Their plethystic relation is `Exp(∑_{α≠0}A_{g,α}^{≥0}u^r z^d/(q−1))=∑_α N_αu^r z^d`”. The Check added by the repair, line 808, says: “Write N(T,z)=∑N_(r,d)T^rz^d and N₀(z)=[T⁰]N(T,z).”

   **Claim.** The new Check is about the series in the statement just above it.

   **Witness.** In one subsection the statement writes the rank variable as u and the Check writes it as T. §6.1 (line 1010) also uses T^r z^d for the same series, and §2.3 (line 508) uses u^r v^d. So the reader has to translate between the statement and the Check that tests it.

   **Repair.** In the §4.9 statement, replace `u^r z^d` with `T^r z^d` on both sides, which matches the Check and §6.1. Optionally make the same change in §2.3, replacing `u^r v^d` and `u^{lr}v^{ld}` with `T^r z^d` and `T^{lr}z^{ld}`. Tested on the Check's own instance, P¹ over 𝔽₂: after the rename the statement's coefficient of T z is N_(1,1)=4, which is the value the Check computes as [T z]N.

One non-blocking note (P3). No P1 or P2 finding. Both round-2 findings are repaired, the repairs are supported by the cited source lines, and the merge-order move creates no cycle. The acceptance is conditional on the eight declared supplier gaps listed at the end of `## Verified sound`.

## Verified sound

### Previous findings (round 2), checked before the new pass

The repair report marks both findings applied. Neither was marked not actionable. The diff between the two commits changes only the two Check blocks below. Suggested.lean, the manifest, metadata and plan.json are unchanged.

| Id | Repaired passage (README) | Independent check | Status |
| --- | --- | --- | --- |
| F01 | line 809: “After dividing out N₀(z), the rank-one coefficient is P(1)/((q−1)(1−z)); multiplying the rank-one coefficient of Log N by q−1 recovers P(1)/(1−z).” | P¹/𝔽₂. Degree one has three length-one skyscrapers, each with one nilpotent and one automorphism, so [z]N₀=3. Class (1,0): only O satisfies the cutoff (O(−1)⊕κ has μ_min=−1), giving 1. Class (1,1): O(1) gives 1; each O⊕κ(x) has End lower triangular with 2 nilpotents and 2 units, giving 1, three times. Total 4=[z](N₀/(1−z)). The quotient [Tz](N/N₀)=1=P(1)/(q−1). Adams ψ_m with m≥2 sends T to T^m, so it cannot reach rank one. The locator S16 line 2224 carries the torsion factor in (5.19), and S16 line 2246 cancels it to give (5.20). | Repaired |
| F02 | line 1395: “In characteristic two, q=2^f with f≥1, so Ω_K=qA in rank one and coprime rank two”; lines 1396–1397: the 𝔽₂ and 𝔽₄ witnesses | y²+y=x³ over 𝔽₂: only x=0 has affine solutions (y=0,1), plus the point at infinity, so 3 points. A=3, Ω=6, #H=#Pic^d·#H⁰(Ω)=3·2=6. Over 𝔽₄: x³∈{0,1} and y²+y=c has two roots in 𝔽₄ for c=0 and c=1, so 9 points (also 4+1−(−2−2)=9). Ω=36, #H=9·4=36, stack mass 36/3=12. The wrong model “characteristic×A” gives 18. MS14 line 582 (Corollary 4.5) states Ω_K=qA, and MS14 lines 505–548 (Theorem 4.3(7)) give Exp(∑qA⁺/(q−1)), which matches the README route. | Repaired |

I also searched the rest of the package for the two repaired patterns. For coherent rank-zero torsion conflated with bundle coefficients, the Checks of §§2.3, 5.7, 5.10 and 6.1 were recomputed and keep or cancel the torsion series correctly. For field cardinality conflated with characteristic, `grep` for characteristic-two and q=p patterns found only correct uses: §6.2 coefficient field, §7.6, the §8.4 p=2≤14 witness, and §8.10 Examples.

The fix report says the dependency check printed no `moved:` line. My run (below) prints one. The move is the same one already reported in round 2, it is permitted by the brief, and it is not a package defect.

### Merge order and cycle check

Output of the required command (`gate --depcheck … --movable`), run unchanged:

```text
moved: CountingBundlesAndHallAlgebrasOfCurves moved in the merge order from #172 to #269, right after its last supplier ClassicalGroupsPartII (HabiroNahmSeries also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 51 roadmaps, 597 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. In ORDER.txt this roadmap is at line 173, its latest suppliers ClassicalGroupsPartII and HabiroNahmSeries are at lines 270 and 226, and its only consumer, TopologicalMirrorSymmetryForHitchinSystems, is at line 311.

I checked the move for cycles. `roadmaps grep CountingBundles` over main and the 362 open heads, plus a grep of all board packages, finds only three roadmaps that mention this one besides TopologicalMirrorSymmetryForHitchinSystems: QSeriesPartitionsAndMockModularForms (Downstream consumers), FunctionFieldArithmetic (Downstream consumers, line 3111) and GlobalShtukasAndFunctionFieldLanglands (Downstream consumers). All three are suppliers of this roadmap and cite it only as a consumer. No roadmap between lines 173 and 270 consumes it. The move therefore creates no cycle with any supplier or consumer.

### Lean form (`packages/CountingBundlesAndHallAlgebrasOfCurves/Suggested.lean`)

- **Elaboration.** `lake env lean <Suggested.lean>` from the content checkout: exit 0, built, about 5 s. The only diagnostics are the two `declaration uses sorry` warnings at lines 83 and 93. The object files of all three `TauCeti.*` imports were present, so no module build was needed. No Lean process was left running.
- **Binder check.** A scratch copy with `#check @name` for all five declarations elaborated. The elaborated binders are:
  - `bundleDegree`: k, `Field k`, X, `X.Over (Spec k)`, implicit r, a `FixedRank X r` bundle, result ℤ.
  - `IsAbsolutelyIndecomposable`: same binders, result `Prop`.
  - `absIndecCount`: k, `Field k`, X, `X.Over`, `r : ℕ`, `d : ℤ`, result ℕ.
  - `nilpotent_matrix_count`: K, `Field K`, `Finite K`, `n : ℕ`.
  - `absIndecCount_eq_of_degree`: adds `Finite k`, `IsProper`, `SmoothOfRelativeDimension 1` and `GeometricallyConnected` of the structure map, with r, d and d′.

  These match README §§0.2, 1.4 and 10.4. No binder is lost, and nothing changed.
- **Padding probe.** In the scratch copy, each sorried statement was restated with `fail_if_success solve | t`. For the nilpotent count, t ranged over `simp`, `rfl`, `simp [Nat.card_eq_fintype_card]`, `infer_instance` and `decide`. For the degree-independence theorem, t ranged over `simp`, `rfl`, `simp [absIndecCount]`, `infer_instance` and `unfold absIndecCount; congr 1`. All ten probes failed to close the goal. A grep of the pinned Mathlib and Tau Ceti finds no nilpotent-matrix cardinality, Fine–Herstein, absolute-indecomposable or Higgs object. There is no padding.
- **Junk values.** `n*(n−1)` at n=0 is 0·0=0, so the count is 1, which is correct for the empty matrix. At r=0, `FixedRank X 0` has only zero objects, and Mathlib `Indecomposable` (BinaryBiproducts.lean:1096) requires `¬IsZero`, so both sides of the degree-independence theorem are 0. `eulerCharBelow` (EulerCharacteristic.lean:105) is a total truncated finrank sum. On the hypotheses of `absIndecCount_eq_of_degree` (proper, smooth of relative dimension one, geometrically connected over a finite field) truncation 2 computes χ.
- **Form.** The file has a single `import Mathlib` plus three existing `TauCeti.*` modules, one module docstring, the namespace `TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves`, and layer comments. It contains no `set_option`, no `lemma`, no sorry'd data and no `True` placeholder.
- **Headlines.** Using README §§1.4, 2.3/2.7, 3.2/4.7, 4.8–4.9, 6.3–6.6, 7.3/8.6–8.8, 8.10, 9.1–9.4, 10.3–10.5, 11.2/11.4 and 11.5, the two statable native headlines are stated: the nilpotent count and degree independence of the absolute count. The docstring names every other headline with its missing carrier: coherent HN groupoids, curve Hall completion, complete Adams series (declared gap), coarse Higgs/Quot/GIT objects, Frobenius compact cohomology and constructible Euler pushforward. I agree each is not statable at the pins without an ad hoc encoding of a declared-gap carrier.

### Seeded source sample (all 15 read at their locators)

| Target | Locator read | Outcome |
| --- | --- | --- |
| 0.2 geometrically indecomposable counts | S16 lines 110–116 (§1.2, p.299); S16 lines 519–536 (§2.1, p.307); S16 line 2226 (§5.7, p.334) | A_{r,d}, Euler form, HN stability under field extension and torsion count #X(F_q) all supported. |
| 1.5 nilpotent-to-automorphism ratio | S16 lines 639–645 (Cor. 2.5, p.309) | Formula and radical-fibre cancellation supported. |
| 3.1 Hall algebra of a curve | S16 lines 952–1000 (§4.1, pp.315–316) | Quotient-left product with q^{½⟨γ₂,γ₁⟩}, Δ′, k_γ relation and Δ all match. I rederived the Hom denominator of Δ′ from Riedtmann's formula. |
| 4.1 curve Eisenstein series | S16 lines 1064–1074 (§4.3, (4.3), p.317) | E_r, E^vec_r, E_0 and E_r=E^vec_r E_0(q^{−r/2}z) match. |
| 4.3 Harder Eisenstein coproduct | S16 lines 1103–1113 (Thm 4.2(iii), p.318) | Both formulas, including E_0(q^{(t−s)/2}z)E_0(q^{−(t+s)/2}z)⁻¹, match. |
| 4.7 HN strata are spherical | HN10 line 221 (Thm 3.1, p.5); HN10 line 380 (Cor. 3.5, p.8); S16 lines 1165–1169 | Every HN-type characteristic function lies in the spherical algebra. HN10 orders slopes increasingly and S16 decreasingly; the README's statement is order-neutral. |
| 4.9 universal truncated and bundle counts | S16 lines 1192–1249 (Cors. 4.5–4.6, pp.320–321); S16 lines 2224 and 2246 | B, C and A^{≥0} in K_g, then A; uniqueness by Prop. 4.7. The repaired Check is supported. |
| 6.4 rank-two universal check | S16 lines 389–412 (examples, p.305) | Formula transcribed correctly. I also derived it independently from Theorem 1.6 (table row below). |
| 6.5 origin constant | S16 lines 2306–2378 (§5.9, pp.335–336) | Regular rewriting at α=0 and vanishing of non-identity terms supported. q=0 on the cone follows from the pairing. |
| 6.6 constant-term formula | S16 lines 426–480 (Cor. 1.9 and examples, pp.305–306) | Constants match. The README's negative extraction is right and the source's printed positive sum is a misprint (computation below). |
| 7.2 Serre-dual Higgs criterion | S16 lines 2421–2430 ((6.1), p.337) | Maps a and b and the criterion match, for coherent V and W. |
| 7.6 Kronecker chart and moment map | S16 lines 2585–2641 (§6.6, pp.341–342) | h=(1−g)+d₂−d₁, E, the closure P and μ=(∑y_ix_i, −∑x_iy_i) match. |
| 9.3 compact Poincaré polynomial | S16 lines 151–161 (Cor. 1.3, p.300); S16 lines 3020–3043 | Formula matches. The README's spread-out route replaces the source's diffeomorphism step. |
| 11.2 parabolic universality | S16 lines 3096–3133 (Thm 7.1, §7.2, pp.352–353); LIN15 line 994, LIN15 line 1690, LIN15 line 1794 (Cor. 3.18) | The README states only K_g. The source's R_g claim rests on a proof “parallel” to Thm 1.1, which gives K_g (Source issues). |
| 11.4 slope-cut universality | S16 lines 3138–3144 (Cor. 8.1, p.353) | K_g elements A^{≥ν} and A^{≤ν} supported. |

Locators of the repaired Checks: S16 lines 2224/2246 and MS14 line 582 support the passages. I also read SPR66 line 6739 (Thm 3.5, printed p.179: dimension ≤1, any algebraic group, all kernels trivial and H² zero), which supports §1.6; MS14 lines 485–500 (Lemma 4.1, Cor. 4.2, p.8), which support §1.9; S16 lines 891–918 (Prop. 3.1), which give exactly the d, d″ and d′ of §2.7; and S16 lines 3045–3080 for §9.1.

No source was fetched and the manifest is unchanged.

### Computed adversarial pass

Rows cover the repaired passages, the sampled targets, the Lean declarations and spot checks. For every other subsection I re-used the computed values of the round-2 table: each of its rows carries values, and I re-read the text of each subsection.

| Statement | Instances tried | Values computed (each side / wrong model) | Result | Change |
| --- | --- | --- | --- | --- |
| §4.9 Check, N₀ | P¹/𝔽₂, degrees 0,1 | [z⁰]=1; [z]=3·(1/1)=3 | Pass | none |
| §4.9 Check, [T]N | P¹/𝔽₂, classes (1,0),(1,1) | 1 and 1+3·(2/2)=4; N₀/(1−z)=1+4z; the dropped-torsion model gives 1 | Pass | none |
| §4.9 Check, Log | rank one, any q | (q−1)·P/((q−1)(1−z))=P/(1−z); ψ_m, m≥2, reaches only ranks ≥2 | Pass | R01 (naming only) |
| §8.10 Check, 𝔽₂ | y²+y=x³ | #E=3; Ω=6; #H=3·2=6; mass 6 | Pass | none |
| §8.10 Check, 𝔽₄ | same curve | #E=9; Ω=36; #H=36; mass 12; p·A=18 refuted | Pass | none |
| §8.10 theorem | coprime class, same-slope Exp | Only the linear Exp term at a coprime (r,d), so q^{(1−g)r²}#H/(q−1)=Ω/(q−1)=qA/(q−1), hence #H=q^D A | Pass | none |
| §8.9 normalization | r=1, g=1, q=2 | I⁺=q^{1−g}·q^gP/(q−1)=2P | Pass | none |
| §6.4 rank-two formula vs Thm 1.6 | exact rational arithmetic with my own derivation of J and H for λ=(1),(2),(1,1), the normalized residue z₂=z₁/q, and ψ₂ in Log: g=0 (q=2,5); g=1 (q=2,α=(−1,−2)); (q=5,a=2/3); (q=7,a=3); g=2 (q=5,a=2/3,b=−2); (q=3,a=2,b=−1/2) | Eventual coefficients 0; 0; 6; −13/6; 8/3; −3185; 294, equal to the closed formula in every case and to P at g=1 [(1/3)(−13/2)=−13/6; (−2)(−4/3)=8/3]. Even and odd d agree, so the count is degree-independent at r=2. | Pass | none |
| §6.6 origin constants | −Log series, g=1,2,3, r≤4, exact | Eventual coefficients 1,1,1,1; 1,2,6,22; 1,3,15,95. A positive extraction gives −1 at r=1 | Pass | none |
| §6.5 origin | P(1) at α=0; q⁻¹; q^m−1 | 1; undefined; −1 (regular) | Pass | none |
| §3.1/3.2 Hall product and pairing | O,O ⊂ O² on P¹/𝔽₂ | E=1, three saturated lines, product 3v, pairing 3v/6=v/2; Δ′=v/#Hom=v/2 | Pass | none |
| §3.3 torsion coefficient | V⊕T, rank r, length l | Hall twist v^{E((r,d−l),(0,l))}=v^{rl}, torsion subobject unique, so coefficient v^{−rl}; r=2,l=1 gives v^{−2}; the source's q^{−l/2} fails | Pass | none |
| §5.2 torsion separation | (E_1(z)\|E^{≥0}_1(w)), P¹/𝔽₂, coefficient zw | Direct mass of Coh^{≥0}_{(1,1)}: 1+3·(1/2)=5/2; formula: V₁+(3/2)V₁=5/2 | Pass | none |
| §5.8 positive arms | λ=(2),(2,1),(3) | ζ(q⁻¹z); ζ(q⁻²z); ζ(q⁻¹z)ζ(q⁻¹z²), matching both sides cell by cell | Pass | none |
| §5.9 one box | J₍₁₎ | ∏(1−α⁻¹)/(1−q⁻¹)=q^{1−g}P/(q−1) | Pass | none |
| §6.2 extraction | (2+3z)/(1−z²) | dRes at 1 and −1: −5/2, 1/2; −∑ξ^{−d}dRes gives 2 (even), 3 (odd) | Pass | none |
| §1.9 bound | weighted HN spread | μ−μ_min≤(g−1)(r−1), so d>(g−1)r(r−1); g=2, r=2: d>2 | Pass | none |
| §8.1 framing | g=2, r=2, d=1 | B=−3/2; d₁=5; l₁=9; d₂: max(9,20,0)=20, residue 6 mod 9, gives 24; l₂=47; gcd 1; C=423 | Pass | none |
| §8.1 kernel bound | general | μ_min(K)≥deg K−(t−1)μ_max(K) (proved using μ_min≤μ_max) ≥−d−(r+1)d₁; −16+24=8>3 | Pass | none |
| §8.2 δ identity | sections of W of class (r′,d′) | (c₁r+d)(c₂r′+d′)−(c₂r+d)(c₁r′+d′)=(d₂−d₁)(dr′−rd′); r=2, d=1, class (1,1): −19; class (1,0): +19 | Pass | none |
| §8.4 small-characteristic Check | elliptic curve over 𝔽₂, (1,0) | d₁=2, d₂=7, l=(2,7), h=0+7−2=5; δ(1,a₂)≥2·5−7=3>0; (0,a₂): 2a₂>0 | Pass | none |
| §7.4 Check | genus 2, M nonspecial of degree 2 | h⁰(M)=1, h¹(M)=0; Hom=1+8=9=l₁; base points P,Q | Pass | none |
| §7.6 moment | 𝔽₃, V₁=k, V₂=k² | μ=(2,−I₂), trace sum 2−2=0 | Pass | none |
| §7.2 criterion | k², W=ke₁ | lower-left 0: preserved; 1: not; both directions of a(θ)∈im b | Pass | none |
| §9.3 polynomial | r=1, g=1 | H=E×A¹; H_c dimensions 1,2,1 in degrees 2–4; t²(1−t)² | Pass | none |
| §9.4 reciprocal | r=1 | q^g∏(1−α⁻¹)=P(1)=#Pic^d; q^{2D} gives q^gP(1), which fails | Pass | none |
| §11.2 parabolic Euler form | P¹, two-step mark, equal-degree lines | flag-preserving Hom codimension ∑_{j<k}m_jn_k; E_par 0 and 1, Hom 0 and 1 | Pass | none |
| §11.4 slope cuts | r=1, ν=0, d=−1,0; dual d=1,0 | 0, P; 0, P | Pass | none |
| §1.6 neutrality | C₂ over 𝔽₃ | H¹=Hom(Ẑ,C₂) has 2 classes; H²=0 since cd(Ẑ)=1 | Pass | none |
| Lean `nilpotent_matrix_count` | n=0,1,2 over 𝔽₂; n=2 over 𝔽₃ | 1,1,4; 9; natural subtraction 0−1=0 harmless | Pass | none |
| Lean `absIndecCount_eq_of_degree` | g=0; r=0; g=1, r=2 | P¹: 1 (r=1) and 0 (r≥2) in every degree; r=0: 0=0; g=1: P in both parities (row above) | Pass | none |
| Merge-order move | ORDER.txt positions | Suppliers at 226 and 270 come before the new place; consumer at 311 after it; nothing in between consumes it | Pass | none |

### Pinned library declarations opened

Pins from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Each README file:line was opened and found as cited:

- Mathlib: `Matrix.card_GL_field` (Card.lean:120); `IsArtinianRing.isNilpotent_jacobson_bot` (Artinian/Ring.lean:54); `isSemisimpleRing_iff_jacobson` (Artinian/Module.lean:641); `Finite.isDomain_to_isField` (LittleWedderburn.lean:176, needs Ring, IsDomain and Finite); `Indecomposable` (BinaryBiproducts.lean:1096, includes ¬IsZero); `Skeleton` (Skeletal.lean:74); `ObjectProperty.FullSubcategory` (FullSubcategory.lean:39); `YoungDiagram` and `transpose` (YoungDiagram.lean:66,186).
- Tau Ceti: `FixedRank` (FixedRank.lean:69, the full subcategory of rank r at every point) and `pullback` (:104); `eulerCharBelow` (EulerCharacteristic.lean:105); `InvertibleSheaf.trivial` (LineBundle/Basic.lean:131); `exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end` (KrullSchmidt/DirectSum.lean:154); `isLocalRing_end_of_isIndecomposable` (KrullSchmidt/Indecomposable.lean:266, assumes IsFiniteLength); `armLength` and `legLength` (HookLength/Basic.lean:136,140).

The README's statements about what each declaration assumes match.

### Cross-roadmap citations resolved (main 5f173a7 and the open heads of the 2026-10-25 index)

Every cited section heading exists where it is cited:

- ClassicalGroupsPartII (#1492 head) CG.0.4, CG.0.5, CG.2.4–2.6 at lines 409, 441, 1117–1173.
- HabiroNahmSeries §5.1 at line 1069.
- HabiroCyclotomicCompletions §1.1 at line 205.
- QSeriesPartitionsAndMockModularForms §§2.4 and 3.5 at lines 304 and 483.
- DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7, 7.12, 7.15, 8.8–8.11 and 10.5 (lines 941–3678).
- LefschetzPencilsAndVanishingCycles §5.11 at line 3164.
- ArithmeticStatisticsPartVIII §5.17 at line 859.
- EtaleDualityAndPerverseSheaves §§0.4, 0.6, 0.7 at lines 552, 819, 896.
- ComplexComparisonPartII C6.3–C6.6 at lines 4169–4335.
- AlgebraicModuliForArithmeticGeometry §§1.3 and 4.19 at lines 579 and 7318.
- AutomorphicSpectralTheory §§6.22c and 6.24 at lines 3400 and 3438.
- ReductiveGroupsPartII RG2.3.7 at line 5202.
- WeilConjectures WC.1, “Finite groupoid mass”, at line 337.
- GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5, 0.6, 0.13 at lines 170–457.
- FunctionFieldArithmetic §§0.2, 0.3, 5.1–5.4 at lines 479–1815.
- EndoscopicTransferAndUnitaryTraceComparison §§3.6 and 3.7 at lines 1237 and 1271. §3.7(c), kernel generation for every epimorphism from L₁⊗V′, is present. §3.6 carries char∤|W|, which is why the locally-free-locus gap is needed.
- SchemeAndStackFoundations (main) §§1.18, 1.21, 2.6, 2.18, 2.20, 3.3, 3.6, 3.7, 4.1, 4.5, 4.14. §3.3 states the Ext–Hom duality only for locally free U, which is why the coherent-U gap is needed.
- AlgebraicVectorBundles (main) L0A–L2B.
- QuiverRepresentations (main) Layers 1–2.
- ArtinAlgebras (#1397, a new folder by another author) Layer 0.
- CohomologicalPointCounting (#196, new folders by another author): “The combined endpoint”, CompactSupport Layers 6–8, EllAdicRealization Layers 7–9 and TraceFormula Layers 11–12.

The citation resolver's empty list agrees.

### Ownership and duplication

I ran object searches with `roadmaps grep` over main and the 362 open heads, plus the board packages, for “absolutely/geometrically indecomposable”, nilpotent matrices / Fine–Herstein, spherical Hall, curve Hall algebra, Mellit, Kac polynomial, stable Higgs and nilpotent cone. The only overlap is EndoscopicTransferAndUnitaryTraceComparison §3.7, which mentions the two-framing Quot chart only inside its proof route; its targets are (a)–(d) and boundedness. This package cites §3.7 for good lines and kernel generation and owns the corrected two-line chart as a target, so nothing is planned twice. No other roadmap states the nilpotent-matrix count, absolute-bundle counts, the curve Hall form, the partition formulas or the Mellit curve deformation, so this roadmap is their owner. The five Lean names are in this package's namespace and collide with nothing readable.

### Declared supplier gaps

`design/plan.json` has exactly eight gaps. Each slug, supplier and section matches a `What <Supplier> must provide (gap:<slug>)` line in that supplier's README subsection. No gap has supplier `none`, each `needs` is a single precise contract with its hypotheses, and none asks for an object that the cited section already states. The two SchemeAndStackFoundations gaps extend §3.3's locally-free-U statement and its absence of a degree-only generation criterion. The ET gap removes §3.6's char∤|W| restriction for GL_r.

### Shape and policy

The README has the required sections in order. Every “Define” subsection has its API bullets and at least three Checks. Each layer ends with Examples and Dependencies. `grep` for process words, pull-request numbers, LaTeX delimiters, machine paths, `set_option` and `lemma` found nothing. sources.toml records all 13 cited works. The main-branch comparisons used QuiverRepresentations, AlgebraicVectorBundles and SchemeAndStackFoundations.

### Counts

- 2 of 2 previous findings repaired.
- 15 of 15 seeded targets read in the sources.
- 32 adversarial rows with values (plus reuse of the 104 valued round-2 rows).
- 17 pinned declarations opened.
- 21 supplier families resolved.
- 8 of 8 gaps consistent.
- Elaboration: exit 0, `sorry` warnings only.

## Not verifiable

- **M20** (Mellit 2020): settled uncertified in the manifest and not reopened. I did not read Thm 1.1, Prop. 3.1, §4, Lemma 5.1 or Thm 5.2. These are the input to §§10.1–10.5 and to the Lean headline `absIndecCount_eq_of_degree`. My exact rank-two computation from S16 Thm 1.6 shows degree independence at r=2 for the six sample tuples, consistent with S16 Appendix C for prime rank, but it does not certify M20.
- **FH58** (Fine–Herstein): settled uncertified. The count is restated in S16 Cor. 2.5 (S16 line 645), and n≤2 was enumerated directly.
- **HES81** (Hesselink, Thm 5.7): settled uncertified. Its use was read at S16 lines 3057–3067. The affine-bundle counts of §8.7 were checked on A¹×A^a.

## Source issues

- **Misprint** in S16 at Corollary 1.9, p.305 (S16 line 445): the source says the origin constant is the positive sum of root-of-unity differential residues of A⁰; it should be the negative sum, which gives 1 in rank one; affects a stated result.
- **Misprint** in S16 at Corollary 1.9 examples, p.306 (S16 line 459 and S16 line 470): the source labels the rank-three and rank-four constants as the full counts; it should label them as origin values; affects nothing.
- **Misprint** in S16 at Corollary 1.4(i), p.301 (S16 line 191): the source gives the reciprocal prefactor as q raised to 2D; it should be q raised to D, as rank one shows; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(ii), p.301 (S16 line 194): the source puts the component count in cohomological degree D; it should be degree 2D, the top degree of the D-dimensional cone; affects a stated result.
- **Misprint** in S16 at equations (6.11)–(6.12), pp.351–352 (S16 line 3074 and S16 line 3080): the source shifts compact degree by the affine fibre rank; it should shift by twice that rank, with the stated twist; affects the proof.
- **Misprint** in S16 at §4.2, p.316 (S16 line 1005): the source writes the bundle–torsion coefficient with q-exponent −l/2; it should be −rl/2, as the Hall twist of rank r against length l requires; affects the proof.
- **Misprint** in S16 at Lemma 2.4, equation (2.1), p.309 (S16 line 630): the source puts n_i copies of rad End(M_i) on the diagonal; it should be the full n_i-by-n_i matrix block over that radical; affects the proof.
- **Misprint** in S16 at §5.7, before (5.21), p.334 (S16 line 2265): the source says the universal truncated invariant specializes to the untruncated count; it should specialize to the nonnegative-cutoff count; affects the proof.
- **Misprint** in S16 at §6.10, p.350 (S16 line 3017): the source matches Higgs eigenvalues with bare Weil-number monomials; each should carry the factor q^D from the point count; affects the proof.
- **Error** in S16 at §6.2, p.337 (S16 line 2416): the source says the Higgs sheaf stack has dimension 2(g−1)r²; it should be at least 2(g−1)r²+1, the dimension of its stable open (rank one, genus two: 3); affects nothing.
- **Gap** in S16 at Theorem 7.1 and §7.2, pp.352–353 (S16 line 3118 and S16 line 3123): the source places parabolic counts in the unlocalized invariant ring via a proof parallel to Theorem 1.1; that proof yields only K_g; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5a0a8bd", "job": "REV-PKG-CountingBundlesAndHallAlgebrasOfCurves~3", "model": "opus", "worker": "fable-rev110"} -->
