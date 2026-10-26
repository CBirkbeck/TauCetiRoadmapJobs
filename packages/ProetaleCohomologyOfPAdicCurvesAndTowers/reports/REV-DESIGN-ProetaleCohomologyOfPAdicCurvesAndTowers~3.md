<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2128#issuecomment-6409066292 -->
Review (claude) of fdd03ed

Verdict: accepted
Conditional on the announced gaps: `formal-syntomic-period-comparison`, `period-rings-general-C`, `endomorphism-characteristic-polynomials`

1. **F01** (P3) The README's gaps list names §4.7 as the consumer of `endomorphism-characteristic-polynomials`; the consumer is §4.6

   Location: `design/README.md` line 133: "(Katz–Messing, Theorem 2). Needed by §4.7."

   Claim: the Katz–Messing gap is consumed by §4.7 (proper curves).

   Witness: the only `*Needs:*` line citing the gap is §4.6's (line 506: "PadicDifferentialEquationsAndRigidCohomology §RD.7.7 with `gap:endomorphism-characteristic-polynomials`"); §4.7's `*Needs:*` (line 518) names §3.5, VB3 and CohomologyComparisons §§4.11–4.12 only; `plan.json` gaps[2] `neededBy` is `["4.6"]`. §4.6's proof uses the similarity of `H¹_ét(Y_s^sp, ℚ_ℓ)` and `H¹_cris(Y_s^sp)` as `End(J_s)`-representations, which is what the gap supplies.

   Repair: write "Needed by §4.6." at line 133. Tested: the gap announcement then points the supplier at the target whose route (line 498) uses it; `plan.json` already agrees.

2. **F02** (P3) §2.2's first Check instantiates the pattern on a triangulation the README's own definition of "fine" excludes

   Location: `design/README.md` line 307: "The closed unit disc with `S` its Gauss point: one vertex with one leg of length `0+`; `Γ_int` is empty."

   Claim: the pattern of §2.2, defined for "a quasi-compact curve with a fine triangulation `S`" (line 300), is computed on the disc with `S` the single Gauss point.

   Witness: line 274 defines a triangulation as fine when "the special fibre of the associated semistable model has at least two irreducible components" (CDN-CURVES §3.5.2, line 1690–1692 read: "au moins deux composantes irréductibles"); the Gauss point alone gives one component, so this `S` is not fine and the Check is on an input outside the definition's hypothesis. The other two Checks (annulus with two Gauss points, Tate curve with two points) have two components.

   Repair: take `S` the Gauss points of `|T| ≤ 1` and `|T| ≤ |p|`: two components meeting in one point, pattern `Γ` with vertices `s₁` (outer) and `s₂`, one relatively compact edge of length `1`, one leg of length `0+` at `s₁`; `∂Y = {s₁}`, `Γ_int = {s₂}` without edges; `H¹(Γ) = 0` and `H¹_c(Γ)^* = 0` (from `∂^*` at `s₂`, `φ(a₁) = 0`, then at `s₁`, `φ(a₀) = 0`), the disc having no residue classes; this agrees with the one-vertex graph after refinement (CDN-CURVES Remarque 0.14(i), line 388). Tested on the instance: the two-vertex pattern is fine and gives the stated cohomology.

3. **F03** (P3) §0.1 identifies `Hom(H¹_c(Γ, L), L)` with `ker ∂^*` for every abelian group `L`; the identity needs `L` a commutative ring and `L`-linear duals (a slip of the source copied into the roadmap)

   Location: `design/README.md` line 143: "then the dual `H¹_c(Γ, L)^* = Hom(H¹_c(Γ, L), L)` is `ker(∂^*: L^A → L^S)`", with "For an abelian group `L`" earlier in the paragraph.

   Claim: for every abelian group `L`, `Hom_ℤ(coker(∂: L^{(S)} → L^{(A)}), L) = ker(∂^*: L^A → L^S)`.

   Witness: `Γ` one vertex with one loop, `L = 𝔽₂²` as an abelian group: `∂ = 0`, `H¹_c(Γ, L) = L`, `ker ∂^* = L^A = L` has order `4`, while `Hom_ℤ(L, L) = M₂(𝔽₂)` has order `16`. The identity holds for a commutative ring `L` with `Hom_L`: `Hom_L(L^{(A)}, L) = L^A` and left exactness of `Hom_L` give `Hom_L(coker ∂, L) = ker ∂^*`. CDN-CURVES §1.2.2 (line 753) has the same slip ("`L^S` et `L^A` sont les duaux de `L^{(S)}` et `L^{(A)}`" for `L` an abelian group, line 716).

   Repair: in §0.1 define `H¹_c(Γ, L)^* := ker(∂^*: L^A → L^S)` for every abelian group `L` and state as the API fact that for a commutative ring `L` it is the `L`-linear dual `Hom_L(H¹_c(Γ, L), L)`; §0.2's "`ℚ`-module `L`" then reads through the definition. Tested on the instance: with `L = 𝔽₂` as a ring, `Hom_L(L, L) = L` of order `2 = |ker ∂^*|`; every consumer (ℓ-adic, `C̆`, `Λ` coefficients in §§2.5, 4.3, 6.10) uses ring coefficients, so no statement changes.

4. **F04** (P3) §5.3 pairs the section number §3.3.1 of CDN-STEIN with lines that lie in its introduction

   Location: `design/README.md` line 588: "(CDN-STEIN §3.3.1, lines 196–199)".

   Claim: lines 196–199 of CDN-STEIN are in §3.3.1.

   Witness: CDN-STEIN lines 194–199 are in the introduction (§1.2, before "1.3. Proof of Theorem 1.8" at line 180 … 183) and say "see Section 3.3.1 for the details" (line 194–195); §3.3.1 *Definition à la Fontaine–Messing* begins at line 1360. The content at lines 196–199 is the mapping-fibre definition and the rationalise-then-glue convention exactly as restated.

   Repair: write "(CDN-STEIN lines 196–199 in the introduction, with §3.3.1, line 1360, for the definition)". Tested: both passages read; the definition is the same at both places.

5. **F05** (P3) §6.8's second Check carries a twist `{−1}` on the Hodge–Tate target that the statement's `AΩ{1}` has already absorbed

   Location: `design/README.md` line 726: "`d = 1`, `i = 1`: modulo `ξ̃` the target is `H⁰(𝔛, Ω¹){−1}`, free over `O_C` on the logarithmic forms."

   Claim: `H¹(𝔛, AΩ_𝔛{1}) ⊗ A_inf/ξ̃` is `H⁰(𝔛, Ω¹){−1}`.

   Witness: CDN-DUKE line 259 and 318: `H^i(Ω̃_X) ≅ Ω^i_{X/O_C}{−i}` for the untwisted `AΩ_X`, and line 346: `ι_HT: H^i_ét(X, AΩ_X) → H⁰(X, Ω^i{−i})`; with `AΩ{i} = AΩ ⊗ A_inf{i}` the twists cancel, and the Hodge–Tate regulator of line 115, `r_HT: O_C ⊗̂ Sp_i(ℤ_p)^* → H⁰(X, Ω^i_X)`, which the README's own route (line 721) names as the reduction of `r_inf` modulo `ξ̃`, has the untwisted target. So the Check contradicts the route of the same section.

   Repair: write "modulo `ξ̃` the target is `H⁰(𝔛, Ω¹)`, the twist `{−1}` of the Hodge–Tate specialization cancelling against `{1}`; it is free over `O_C` on the logarithmic forms (§6.6)". Tested at `i = 1`: `Ω¹{−1} ⊗ A_inf{1}/ξ̃ = Ω¹{−1}{1} = Ω¹`, matching CDN-DUKE line 115.

Reviewed at head `fdd03ed` of the design pull request (board checkout confirmed at that commit, equal to the pull request's current head, before reading). Files: `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/README.md`, `design/plan.json`, `sources.toml`. Pins: Mathlib `6b7abb3`, Tau Ceti `a91d3aa`. All four round-2 findings are repaired at the head (table below). Five P3 findings, no P1, no P2: acceptance is conditional on the three declared supplier gaps `formal-syntomic-period-comparison`, `period-rings-general-C` and `endomorphism-characteristic-polynomials`.

## Round-2 findings, repair by repair

| Id | Status | Witness at `fdd03ed` |
| --- | --- | --- |
| F01 (P2) slope hypothesis in §§7.4–7.5 | repaired | Line 765: "`M` is supercuspidal when `WD(M)` is irreducible and `φ` has slope `1/2` (CDN23 line 328): irreducibility alone forces `N = 0` and a single slope of `φ` (CDN20 lines 182–184), and the slope `1/2` is the hypothesis of every statement of CDN20 §2.1 (lines 644, 654, 702)". CDN23 line 328 read: "supercuspidal, si WD(M) est irréductible et de pente 1/2"; CDN20 lines 182–184 (irreducible ⟹ single slope), 644 and 654 ("de pente 1/2 et rang 2"), 664 (footnote 10, unitary central character), 702–707 (`X^+_st(M)` of Dimension `([L:ℚ_p], 2)`) all read. Line 805 (§7.4): "so `WD(M)` irreducible and `M` of slope `1/2`", locator "CDN20 Théorème 0.4, printed without the slope hypothesis, which CDN20 §2.1, lines 644 and 654, and CDN23 line 328 carry"; line 818 (§7.5): "(so of slope `1/2`)", locator with Corollaire 2.1 line 654. Negative controls: line 811 (the unramified twist `M′`, slope `3/2`, same multiplicity `φ`-module by reciprocity through `π₀`) and line 824 (`X^+_st(M′) = (B_cris^+)^{φ²=p^{−1}} = 0`, étale classes not `exp(f)`). `plan.json` 7.4 and 7.5: `hypotheses` `["M supercuspidal: WD(M) irreducible", "M of slope 1/2"]`, tests `unramified_twist` and `slope_three_halves`. The Layer 7 Example (line 866) and §7.8 inherit the definition. Recomputed below. |
| F02 (P3) integral Artin–Schreier–Witt attributed to §6.3 | repaired | Line 28: "**PrismaticCohomologyPartIII** §6.25 (the integral étale comparison, without inverting `p` or `d`) with §6.3"; line 100: §6.25 stated as `RΓ_ét(Spec S, ℤ/p^n) ≃ (Δ_{S/A}/p^n)^{φ=1}` with §6.3 for `Δ_{S/A} = A_inf(S)` and tilting, applied to `S = R^+`; line 709 (§6.7 route): "from PrismaticCohomologyPartIII §6.25 (applied to `S = R^+`, with §6.3 for `Δ_{S/A} = A_inf(S)`)"; line 715 `*Needs:*` and line 761 Dependencies add §6.25; `plan.json` 6.7 prerequisites and the `suppliers` entry list §6.25 and §6.3. At the PrismaticCohomologyPartIII head (#1070): §6.3 at its line 234 (generic fibre, `S^♭[1/d]`), §6.25 at its line 621 ("`ℤ/p^n ≃ (Δ_{X/A}/p^n)^{φ=1}` … for `X = Spf S` affine: `RΓ_ét(Spec S, ℤ/p^n) ≃ (Δ_{S/A}/p^n)^{φ=1}`"), its worked example at line 836 ("`S = O_C`: `ℤ/p^n ≃ (A_inf/p^n)^{φ=1} = W_n(O_C^♭)^{F=1}`, and `F − 1` is surjective on `W_n(O_C^♭)`"). |
| F03 (P3) `H^i(X, Ω^j) = 0` attributed to GK07 Theorem 4.4 | repaired | Line 697: "(CDN-STEIN Proposition 6.5 and Corollary 6.6, after GK05-RT Theorem 4.5, line 1770, applied to the strongly dominant coefficient systems `Ω^j_X` as in its lines 93–99, and GK07 Proposition 4.5)". `sources.toml` gains `GK05-RT` (Represent. Theory 9 (2005), DOI 10.1090/S1088-4165-05-00259-1, fetched from the AMS open archive, `publisher-open`, `certified`, `cited_for = ["6.6"]`), and the GK07 locator is now "Proposition 4.5"; References line adds GK05-RT. GK05-RT read: Theorem 4.5 at line 1770 (`H^t(X, V_{Ô_K}) = 0`, `H^t(X, V ⊗ k) = 0` for `t > 0`, `H⁰ ⊗ k = H⁰(⊗ k)`, line 1772–1775), lines 93–96 ("Examples of `V_{Ô_K}`'s arising from strongly dominant representations `V` are the terms `Ω^s_X` … Theorem 4.5 implies `H^t(X, Ω^s_X) = 0`"). `plan.json` 6.6 locator matches. |
| F04 (P3) three precision slips | repaired | (i) Line 661: "`H²_rig(M/S₀) = H²_rig(M♥/S₀) = 0` since `M♥`, the component minus its `q + 1` double points, is affine (GK05 line 1257)"; GK05 lines 1256–1257 read (`M♥` the complement in `M` of the other components, `H^s_rig(M/S₀) ≅ H^s_rig(M♥/S₀)`). (ii) Line 132: "Needed by §§1.2–1.3 and 3.2–3.3"; `plan.json` gaps[1] `neededBy` `["1.2","1.3","3.2","3.3"]`; §3.3's `*Needs:*` (line 397) cites the gap. (iii) Line 709: "(semistable because that is the generality in which AInfCohomology §AI.6.2 supplies `AΩ_𝔛`; CDN-DUKE Theorem 2.9, line 370, holds for every flat formal model)"; CDN-DUKE line 370 read ("smooth adic space over `C` with a flat formal model"); AInfCohomology (#1044) standing setting (SS) at its line 222 and `Semistable.aOmega` at its line 2861 read. |

Nothing was marked "not actionable" in the repair report; nothing is re-raised.

## Verified sound

**Checkout and tooling.** Board checkout at `fdd03ed`, equal to `headRefOid` of the design pull request (read-only query). Gate output, verbatim:

    candidate: ProetaleCohomologyOfPAdicCurvesAndTowers is not in the merge order yet; checked as if placed after ModpRepresentationsOfGL2OverLocalFields (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 662 edges, 0 problem(s)

No UPWARD or CYCLE line. Citation resolver: one lead, "PadicLocalLanglandsForGL2QpPartII §4.1 found nowhere". False lead: that roadmap is an imported board design (merged import, head `b81ec27`, `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md` with headings §3.4 at its line 517, §3.5 at 544, §4.1 at 587, §4.2 at 613, the four sections the README cites), and it is cited only as a consumer (line 875 and the §7.5 Check); it is not a supplier. Lean names found nowhere: none. ModpRepresentationsOfGL2OverLocalFields, cited as a supplier (MP.0, MP.2), is not on main or in an open roadmap pull request but is a board package at line 315 of `merge-order/ORDER.txt`, before this roadmap; its design README has the labels MP.0/finite-presentation (its line 230), MP.0/finiteness-calculus (278), MP.0/amalgam-coherence (308), MP.2/category-c (274) and MP.2/ordinary-banach (819).

**Principles.** No route-specific shortcut (every finite `F/ℚ_p`, every `d ≥ 1`, every complete algebraically closed `C` with `v_p(C^×) = ℚ` in Layers 2–4; GK14 Corollary 4.5 read at line 1362: an arbitrary complete DVR of residue characteristic `p`, the generality of §0.4(b)); no re-planned roadmap (imports as in rounds 1–2, unchanged by the repairs); no computational algorithm; grep over the README: no LaTeX delimiters, no `lemma`, no process words, round labels, pull-request numbers or machine paths; `plan.json` and `sources.toml` carry no machine paths; no Lean file at the design stage, so no `set_option` or sorry'd data.

**Adversarial pass on the repaired and added passages, with values.**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Preamble (line 765): irreducible `WD(M)` ⟹ `N = 0`, single slope | rank-two `WD` with `N ≠ 0` | `N` is `W_F`-equivariant up to `|·|`, so `ker N` is a `W_F`-stable line ⟹ reducible; single slope: CDN20 line 183 | holds | none |
| §7.4 negative control (line 811) | `M′ = M ⊗ E`, `φe = pe`, `G_F` trivial on `e` | `π₀(M_{n,C})` is a torsor under `F^×/(1 + ϖ^nO_F)` on which `Ǧ` acts through `Nrd` (§7.1), transitively; stabilizer `S = Nrd^{−1}(1 + ϖ^nO_F)`, `Nrd(S) ⊂ O_F^×`, so unramified `χ∘Nrd` is trivial on `S`; the special-fibre Frobenius preserves each connected component, so `φ` respects `H = ∏_c H^{(c)}` and `Hom_Ǧ(ρ ⊗ χ∘Nrd, H) = Hom_S(ρ, H^{(c₀)})` as `φ`-modules; slope of `M̆′` is `1/2 + 1 = 3/2` | the stated isomorphism fails for `M′`; the hypothesis is needed | none (the Check is right) |
| §7.5 negative control (line 824) | `M̆′ ≅ D_{3/2}`, basis `e, φe`, `φ²e = p³e` | `x = ae + bφe`, `φx = px` ⟹ `a = p²σ(b)`, `σ(a) = pb` ⟹ `φ²b = p^{−1}b` in `B_cris^+`; with `b ∈ A_cris` (scale by `p^k`), `b = p·φ²(b) ∈ pA_cris`, iterated `b ∈ ∩_k p^kA_cris = 0`, so `X^+_st(M′) = 0` | first row would be `exp: O[M′] ≅ H¹_proét[M′]`, refuted by `H¹_ét[M′] = H¹_ét[M] ≠ 0` not of the form `exp(f)` (CDN20 Remarque A.2, line 2123–2125 read) | none |
| §7.5 at slope `1/2`, `Dim X^+_st(M)` | `L/ℚ_p` finite | CDN20 lines 706–707: `L`-Dimension `([L:ℚ_p], 2)`; as a Check at `[L:ℚ_p] = 1`: `(B_cris^+)^{φ²=p}` of Dimension `(1, 2)` (two slopes `1/2`, each `(1/2, 1)`) | holds | none |
| §7.5 integral form | `Hom_{G_F}(V, −)` then `G`-bounded vectors | CDN20 Remarque 0.10 (line 361–367): `0 → H¹_ét(M_∞, L(1))[M] → X^+_st(M) ⊗ L̂L(M)^* → (L ⊗ H¹(M_n°, O))[M]`; CDN23 lines 1479–1484: injection of `Π_M(V)^*` into `H(V) ⊗ L̂L(M)^*` | injection as restated | none |
| §7.8(e), (f) under the repaired definition | `n = 1`, depth-zero `θ ≠ θ^q` on `𝔽_{q²}^×`, `θ̃(ϖ) = 1` | `ω_{JL(M)}(ϖ) = 1` with `ω = det WD(M)·|·|` (CDN20 line 142) forces `q^{2s}·q^{−1} = 1`, `s = 1/2`: the Example (line 866) and (e) are inside the definition | holds | none |
| §6.3 at `d = 1` (line 661) | `M = ℙ¹_k` with `q + 1` log points; `M` a double point; `s = 0, 1, 2` | `H⁰`: `φ^f = 1`; `H¹(M♥)` spanned by `dlog(t − a)`, `a ∈ ℙ¹(k)`, with one relation (residues sum to `0`): dimension `q`, `φ^f = q`; `M♥ = ℙ¹ ∖ (q + 1 points)` affine ⟹ `H² = 0`; point: `H⁰ = F` only | `φ^f = q^s` on every `H^s`; `s = 2` vacuous | none |
| `N = 0` from `φ^f = q^s` | `s`, `q = p^f` | `Nφ^f = qφ^fN` ⟹ `q^sN = q^{s+1}N` ⟹ `(q − 1)q^sN = 0` in characteristic `0` | holds | none |
| §6.6 vanishing (line 697) | `j = 0, 1`, `d = 1` | GK05-RT Theorem 4.5 (i)–(iii) for `Ω^s_X` (its lines 93–96); `H¹(X, O) = 0`, `H⁰(X, Ω¹) = Sp^cont_1(O_K)^*` (CDN-STEIN Theorem 6.28(2)(c), round-2 row) | holds | none |
| §6.7 integral input (line 709) | `S = R^+` affinoid perfectoid; `S = O_C` | §6.25: `H⁰ = ℤ/p^n` on connected `R^+`, `H¹ = coker(F − 1) = H¹_ét(Spec R^+, ℤ/p^n)`, killed by a pro-étale cover; `O_C`: `F − 1` onto `W_n(O_C^♭)` (its worked example, line 836) | sheaf exactness as needed | none |
| §6.7 generality clause | flat non-semistable model | CDN-DUKE Theorem 2.9 (line 370) holds; `AΩ_𝔛` is supplied only under (SS) (AInfCohomology line 222) | clause correct | none |
| Gap `period-rings-general-C`, `neededBy` | §3.3's carriers `A_cris`, `F¹A_cris` | §3.3 `*Needs:*` (line 397) cites the gap; line 132 and `plan.json` now list 3.3 | consistent | none |
| Gap `period-rings-general-C`, sufficiency for §1.3's third bullet and §7.5's Check | `(B_cris^+)^{φ^h=p^{−a}}`, `a ≥ 1` | from `A_cris` with `φ(A_cris) ⊂ A_cris` and `B_cris^+ = A_cris[1/p]` (both in `needs`): `b = p^aφ^h(b) ∈ p^aA_cris`, iterate, `b = 0`; the `h = 1` case listed in `needs` is the same argument | `needs` suffices; no addition | none |

**Sources: the seeded sample (15 targets), every locator read this round.**

| Target | Locator read | Result |
| --- | --- | --- |
| 0.1 | CDN-CURVES §1.1.1 lines 641–656, §1.2.1 lines 718–740 (`H¹`, `H¹_c` as cokernels, Remarque 1.2(o),(ii) with `S` finite), §1.2.2 lines 743–757 (`∂^*`, `ker ∂^* = H¹_c^*`), Remarque 1.4(ii) lines 780–782 | as restated except the dual convention: R03. The README's legs have exactly one endpoint; the source allows an edge without endpoint only for the vertex-free circle or segment (line 647–650), never a pattern of a triangulated curve |
| 0.2 | CDN-CURVES §1.2.4 lines 783–787 (`N_µ` as the composite with `µ` then the projection), Remarque 1.5 line 788 (compact ⟹ isomorphism), Remarque 1.6 lines 791–796 (`N∘N = 0` when the image of `H¹(Γ′)` in `H¹_c(Γ)^*` vanishes) | as restated; Check values: loop of length `µ`: `N_µ = µ`; segment with four legs: `H¹ = 0`, `H¹_c^*` of rank `3` (one compact edge, two vertices, four legs: `ker ∂^*` has rank `5 − 2`), `N_µ = 0` |
| 0.3 | CDN-STEIN §5.2.1 lines 1901–1917, §5.2.2 lines 1930–1938, §5.2.3 lines 1941–1948 | as restated (`P_J = BW_JB`, `X_J = G/P_J`, `Sp_J(ℤ) ⊗ A = Sp_J(A)` free, `Sp_∅` Steinberg, `Sp_Δ = A`, `Sp_r = Sp_{{1,…,d−r}}`, `Sp_r = 0` for `r > d`, LF-topology, dual a countable inverse limit, `Sp_J(O_L)^*` compact torsion-free, Banach unit ball, smooth vectors) |
| 0.4 | CDN-STEIN Proposition 5.1 line 1918, Remark 5.2 line 1922, Corollary 5.3 line 1926, Corollary 5.4 lines 1950–1955; GK14 Corollary 4.3 line 1300 (type A has no exceptional factor), Corollary 4.4(a) line 1328, Corollary 4.5 lines 1362–1364 (any complete DVR, `char k_K = char k_F`) | as restated at the stated generality |
| 2.2 | CDN-CURVES §0.2.1 lines 264–282 (fine: smooth components meeting in at most one point; legs of length `0+` at removed points), §3.5.2 lines 1688–1699 (`Γ = (I, I₂, µ)`, `I = A_c ⊔ S`, at least two components), Remarque 0.14(i) line 388 | as restated; R02 for the one-vertex Check |
| 2.5 | CDN-CURVES Théorème 6.3 lines 3189–3203 (middle piece over `Σ(Y)`, `S ∖ Σ(Y)` dropped since `Y_s^sp = ℙ¹`), Théorème 0.13(i) lines 367–377, Proposition 5.10(i) lines 2543–2544, Remarque 6.4(ii)–(iii) lines 3208–3230 (`s_{r↦ζ(r)p^r} = s_{r↦p^r} + t_ζN`, `t_ζ = (ζ(ℓ^{−n}))_n`), Remarque 6.5 lines 3231–3238 (`σ(c) = c + t_σN(c)` for `σ ∈ I_K`) | as restated |
| 3.5 | CDN-CURVES Théorème 6.32 lines 3826–3833 (`H¹_syn(Y, 1)` in the first row), Corollaire 6.25 lines 3656–3658 (`p > 2`; at `p = 2` the left arrow is almost an isomorphism), Théorème 0.1 lines 115–134 (Banach, closed images), Remarque 6.33(ii) lines 3851–3856, lines 160–164 | as restated; `p = 2`: the `2`-torsion disappears after `⊗ ℚ_p` |
| 4.3 | CDN-CURVES Théorème 0.15 lines 403–409 ("triangulation assez fine"; pieces `H¹(Γ, C̆)`, `∏_s H¹_rig(Y_s^sp)`, `H¹_c(Γ, C̆)^*(−1)`), Remarque 0.16(i) lines 410–411 | as restated; Mumford curve of genus `g`: pieces `C̆^g`, `0`, `C̆(−1)^g` |
| 4.9 | CDN-CURVES Remarque 0.18 lines 446–455 (`K` finite, `C = ℂ_p`, `ι_BdR` by `lim p^n·x̂_n`, `ι_st = log_{J̃}∘ι_BdR`), Théorème 7.12 lines 4125–4129 ((ii): identification through the cup product into `H²_dR(X) = K`, `(B_st^+ ⊗ H¹_HK^*)^{N=0,φ=1} = (B_st^+ ⊗ H¹_HK)^{N=0,φ=p}`), Remarque 7.13 lines 4130–4133 | as restated, including the restriction to `C = ℂ_p` |
| 5.1 | CDN-STEIN §3.1.1 lines 682–691 (semistable: Zariski-locally étale over `Spwf(O_K[X₁,…,X_n]^†/(X₁⋯X_r − ϖ))`, `1 ≤ r ≤ n`; Stein with semistable reduction: components proper smooth, `Y_s` finite unions, `Y_s ⊂ U_s ⊂ Y_{s+1}`, tubes a Stein covering) | as restated |
| 5.3 | CDN-STEIN lines 196–199 (mapping fibre, absolute crystalline cohomology over `W(k)`, rationalise on quasi-compact pieces then glue), §3.3.1 line 1360, Proposition 1.11 lines 183–186, Corollary 3.46 lines 1411–1414, Proposition 6.1 lines 2193–2196 (strict quasi-isomorphism after `τ≤r`) | as restated; R04 for the locator |
| 6.8 | CDN-DUKE Theorem 1.3 lines 89–90, (1.4) line 95, lines 100–118 (étale regulator, `r_inf`, derived Nakayama, Hodge–Tate regulator `r_HT` into `H⁰(X, Ω^i_X)`, `ξ̃`-torsion-freeness), §§3–4 headings lines 477–632, Hodge–Tate specialization lines 259, 318, 343–349 | as restated; R05 for the Check's twist |
| 7.1 | STR08 Theorem 4.3 lines 337–341 (`(q − 1)q^{m−1}` components, fibres of `M_m → Sp(F̆_m)`), Theorem 4.4(i) lines 372–382 (`π₀ ≅ (o/ϖ^m)^×`, action `det(g)Nrd(b)^{−1}χ(τ)^{−1}`); CDN20 §0.1 lines 101–107 (`ν_H = det, Nrd`, reciprocity; principal homogeneous under `F^×`) | as restated; Check: `m = 1` gives `q − 1` components, scalar `b` acts by `b^{−n}` |
| 7.3 | CDN20 Proposition 2.12(i) lines 914–915 (`G`-bounded vectors), Remarque A.2 lines 2123–2125 (bounded functions on a connected Stein curve with semistable model are constant) | as restated; (ii) of the proposition, stated for `F = ℚ_p`, is not used |
| 7.5 | CDN20 §0.4 lines 246–251 (`Z[M] = Hom_{L[Ǧ]}(JL(M), L ⊗ Z)`, `X^+_st(M) = (B_st^+ ⊗ M)^{N=0,φ=p}`), Théorème 0.8 lines 252–261 (printed for every supercuspidal `M` of rank two), Corollaire 2.1 lines 654–663 (slope `1/2`; first term `C ⊗̂_F O[M]` with `O[M]` the `G_F`-invariants, equal to the README's `O(M_∞)[M]` by footnote 10), Remarque 0.10 lines 361–367, lines 702–707, Remarque 2.3 lines 712–716 (`θ` injective for positive slope); CDN23 lines 1479–1484 | as restated with the slope hypothesis (F01 repaired); the integral form is an injection, as the source |

Also read: CDN23 lines 326–334 (definition of supercuspidal, level), 1465–1472 (`Π_M(V)` and its lattices, Théorème 2.14), 1485–1495 (Remarque 2.15(i)–(ii)); CDN20 lines 140–144, 180–186; GK05 lines 1252–1264; GK05-RT lines 60–100, 1766–1778; CDN-DUKE lines 368–373. Versions: all locators agree with the versions recorded in `sources.toml`; the new `GK05-RT` entry is the published AMS text (its sha256 names the cached file).

**Supplier citations resolved this round** (section or label present with the cited content on main or at the open head; 46 citations on the `*Needs:*` lines of the 15 sampled targets and of §§6.3, 6.6, 6.7, 7.4, 7.8 checked by script, 45 found directly, 1 — ModpRepresentationsOfGL2OverLocalFields MP.2 — found in the board package as above): ReductiveGroupsPartII RG2.2 (#785); LocallyAnalyticDistributions §§0.0, 0.2, 0.CR.6.6 (#854); SmoothRepresentationsOfLocalGroups SR.0, SR.3 (#785); TropicalAndBerkovichArithmetic §§2.11, 2.13, 2.16 (#1494); JacobianChallenge Layer D, AdicSpacesPartIII §§R3.4, R3.7, AdicSpacesPartIV §§F1.7, F1.8, EnhancedDerivedSheaves E2 (main); AbelianSchemesAndArithmeticModuli §A4.2 (#849); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.25; PadicPeriodRings §4.1 (#940); ClassicalAdicEtaleCohomology §§1.3, 4.6, 9.6, 9.7 (#875); CohomologyComparisonsPartII §§4.1, 4.4, 4.5 (#1364); PadicDifferentialEquationsAndRigidCohomology §§RD.4.29, RD.4.34; AInfCohomology §§AI.3.1, AI.6.2, AI.6.3 (#1044); PrismaticCohomologyPartIII §§6.3, 6.25 (#1070); EndoscopicTransferAndUnitaryTraceComparison §§12.2, 12.3, 12.4, 12.7, 12.11, 12.19, 12.20; GL2AutomorphicRepresentationsAndTransfer R16.3; PadicHodgeTheory §5.3 (#1062); PadicLocalLanglandsForGL2Qp §6.9 (#1312). Every `plan.json` prerequisite of every target is named on its `*Needs:*` line (script, 0 unsurfaced). Ownership against open pull requests outside the sibling checkouts the brief names was not checked; no new object is owned by the repairs (the slope hypothesis, the twisted sheaf sequence's citation and the GK05-RT locator change no ownership).

**Gaps.** Three gaps, each with a named supplier earlier in the order, the same slug in `plan.json` and the README (lines 131–133), a one-sentence `needs`, not provided today (`formal-syntomic-period-comparison`: CohomologyComparisonsPartII §4.4 is for log schemes, round-2 row; `period-rings-general-C`: PadicPeriodRings §4.3 states only the `B_cris^{φ=1}` sequence and fixed fields, round-2 row; `endomorphism-characteristic-polynomials`: §RD.7.7 is the `q`-Frobenius statement only, round-1 row) and minimal (the table above shows the plus-ring `needs` suffices for the `φ^h` vanishing the Checks use). R01 corrects the README's consumer of the third gap. Acceptance is conditional on these three.

**Shape and completeness.** `plan.json` parses: 50 targets (17 definitions, 4 constructions, 29 theorems), 140 tests, every definition and construction with at least three tests, every target with a locator; 50 `*Needs:*` lines; every layer ends with Examples and Dependencies; `How to read the build` matches the layer dependencies. Headline theorems as the README names them: §3.5 (T1(a)), §§2.4, 3.3 (T1(b)), §3.4 (T1(c)), §§4.1–4.2 (T2), §§4.7–4.9 (T3), §§2.3, 2.5, 3.2(d), 4.3, 4.6 (T4), §5.5 (T5), §§6.2, 6.4, 6.5, 6.9, 6.10 (T6), §§7.2, 7.4, 7.5, 7.7, 7.8 (T7); the repairs change the hypotheses of T7's §§7.4–7.5 only. The Lean form, the `#check` comparison and the one-tactic padding probe do not apply: a design has no `Suggested.lean` (not available; this lane does not elaborate).

**Counts.** 4 round-2 findings checked (4 repaired, 0 partly, 0 not repaired); 15 sampled targets verified at their locators (15 read in full this round; 0 failures of statement; 3 slips found in sampled targets: R02, R04, R05; 1 convention slip: R03; 1 consumer slip in the gaps list: R01); 13 adversarial rows computed this round on the repaired passages, plus the sample's values in the source table; 46 supplier citations resolved by script and 2 by hand (PadicLocalLanglandsForGL2QpPartII as consumer, ModpRepresentationsOfGL2OverLocalFields as supplier); gate and resolver run; 1 policy grep pass (clean); `plan.json` prerequisites compared mechanically with the README's `*Needs:*` lines (0 unsurfaced).

## Not verifiable

- SS91 §§3–4, IS01 Theorem 4.5, DS01 Theorems 5.7 and 7.7, NAK84 Theorem 4: paywalled, recorded `uncertified` in `sources.toml`; cited through CDN-STEIN Theorem 5.8/5.10, GK05 Proposition 6.5 and CDN23 Remarque 2.15(ii) (line 1491 read: Nakajima [51, th. 4]).
- CN-I, CN-II, CGN23, THO24: boundary or Part II citations only; not opened this round.
- EndoscopicTransferAndUnitaryTraceComparison §12.7's statement that the diagonal `F^×` acts trivially and §12.19's descent datum were resolved as present at the open head (headings found); their contents were read in round 2 and not re-read.
- Elaboration of a `Suggested.lean`: not available at the design stage (this lane does not elaborate).

## Source issues

- **Gap** in CDN-CURVES at §1.2.2, printed page 19 (line 753): the source says the function spaces on vertices and edges are the duals of the finitely supported ones for an abelian group of coefficients; it should be for a ring of coefficients with linear duals (false for the Klein four-group); affects nothing (every use has ring coefficients).
- **Error** in CDN20 at Théorème 0.4 and Théorème 0.8, printed pages 6–7 (lines 199–213, 252–261): the statements are printed for every supercuspidal rank-two `M`, supercuspidal meaning only that `WD(M)` is irreducible (line 182); it should be `M` of slope `1/2`, as the paper's own §2.1 (lines 644, 654, 702), footnote 10 (line 664) and the later CDN23 definition (line 328) require; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fdd03ed", "job": "REV-DESIGN-ProetaleCohomologyOfPAdicCurvesAndTowers~3", "model": "fable", "worker": "fable-rev198"} -->
