<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2128#issuecomment-6408382339 -->
Review (claude) of c479bd5

Verdict: needs changes

1. **F01** (P2) §§7.4–7.5 assert the multiplicity isomorphisms and the multiplicity diagram for every supercuspidal `M`, but they hold only for `M` of slope `1/2`

   Location: `design/README.md` line 765 (Layer 7 preamble): "`M` is supercuspidal when `WD(M)` is irreducible; then `N = 0` and `φ` has a single slope"; line 805 (§7.4): "for a supercuspidal rank-two `L-(φ, N, G_F)`-module `M` … `H¹_HK(M_∞)[M] ≅ M̆ ⊗̂_L LL(M)^*` … the first [commuting] with `φ`"; line 817 (§7.5): "for every finite `F/ℚ_p` and every supercuspidal rank-two … `0 → O(M_∞)[M] → H¹_proét(M_∞, L(1))[M] → X^+_st(M) ⊗̂_L LL(M)^* → 0`"; `plan.json` 7.4 and 7.5 `hypotheses: ["M supercuspidal"]`.

   Claim: with the preamble's definition (any single slope), §7.4 is a `φ`-equivariant isomorphism and §7.5's first row is exact for every such `M`.

   Witness: let `M` be supercuspidal of slope `1/2` (so §7.4 holds for it, CDN20 Corollaire 2.1, line 654, "de pente 1/2") and `M′ = M ⊗ E` with `E = ℚ_p^nr e`, `φe = pe`, `G_F` trivial on `e`: `WD(M′)` is irreducible, `M′` has slope `3/2`, `JL(M′) = JL(M) ⊗ χ∘Nrd` with `χ` unramified. `Ǧ` acts on `π₀(M_{n,C})` transitively through `Nrd` (§7.1; EndoscopicTransferAndUnitaryTraceComparison §12.7: the full-height cohomology is induced from the height-zero stabilizer), the stabilizer `S` of a component has `Nrd(S) ⊂ O_F^×`, and the Hyodo–Kato Frobenius is the absolute Frobenius of the special fibre, which fixes every component. Frobenius reciprocity `Hom_Ǧ(ρ, ∏_c H^{(c)}) = Hom_S(ρ, H^{(c_0)})` therefore commutes with `φ`, and `(JL(M) ⊗ χ∘Nrd)|_S = JL(M)|_S`. So `H¹_HK(M_∞)[M′]` and `H¹_HK(M_∞)[M]` are the same `φ`-module, of slope `1/2` (the §7.4 Check), while `M̆′` has slope `3/2`: §7.4 fails for `M′`. In §7.5, `X^+_st(M′) = (B_cris^+ ⊗ M′)^{φ=p}`: over `C̆`, `M′ ≅ D_{3/2}` with basis `e, φe`, `φ²e = p³e`, and `(B_cris^+ ⊗ D_{3/2})^{φ=p} = (B_cris^+)^{φ²=p^{−1}} = 0` (no negative slopes in `B_cris^+`, as §1.3's second bullet uses). The first row would then read `exp: O(M_∞)[M′] ≅ H¹_proét(M_∞, L(1))[M′]`, refuted by the nonzero `G`-bounded étale classes `H¹_ét(M_∞, L(1))[M′] = H¹_ét(M_∞, L(1))[M] ≠ 0` (same reciprocity) which §7.3's Check shows are not of the form `exp(f)`. The sources confirm the hypothesis: CDN23 line 328 defines supercuspidal as "`WD(M)` irréductible et de pente 1/2"; CDN20 lines 644, 654 and 702 add "de pente 1/2" to every statement of §2.1, and footnote 10 (line 664) ties the unitarity of the central character of `JL(M)` to slope `1/2`; the README's own §1.3 bullet (line 253) reads "`M` of slope `1/2` (supercuspidal rank-two)".

   Repair: in the Layer 7 preamble define "`M` is supercuspidal when `WD(M)` is irreducible and `φ` has slope `1/2` (CDN23 line 328); `N = 0` then holds", or add "of slope `1/2`" to the statements of §§7.4 and 7.5 and to the Layer 7 Example; add to `plan.json` 7.4 and 7.5 `hypotheses` "M of slope 1/2"; add the negative-control Check to §7.4: "the unramified twist `M′ = M ⊗ E`, `φe = pe`, has `JL(M′) = JL(M) ⊗ χ∘Nrd` and the same multiplicity `φ`-module (reciprocity through `π₀`), of slope `1/2`, while `M̆′` has slope `3/2`; the slope hypothesis cannot be dropped". §7.8 is unaffected: `ϖ` acting trivially on `JL(M)` with `L(1)`-coefficients already forces slope `1/2` through the central character (CDN20 line 142), and CDN23's definition carries the slope. Tested on the instance above: with slope `1/2` imposed, `Dim X^+_st(M) = ([L:ℚ_p], 2)` (CDN20 lines 706–707) and both rows are as stated; for `M′` the repaired statements make no claim.

2. **F02** (P3) The integral Artin–Schreier–Witt statement is attributed to PrismaticCohomologyPartIII §6.3, whose Check is the generic-fibre one; the integral variant is its §6.25

   Location: `design/README.md` line 100: "for `S = O_C` this gives `(A_inf/p^n)^{φ=1} = ℤ/p^n` with `F − 1` surjective on `W_n(O_C^♭)` (its Check at `S = O_C`)"; line 709: "obtained on affinoid perfectoids from PrismaticCohomologyPartIII §6.3 modulo `p^n`".

   Claim: §6.3 supplies the exactness of `0 → ℤ/p^n → W_n(R^{+♭}) → W_n(R^{+♭}) → 0` (pro-étale locally) on the integral tilt.

   Witness: PrismaticCohomologyPartIII at its head (#1070), §6.3 (its line 236) states `RΓ_ét(Spec(S^♭[1/d]), ℤ/p^n) ≃ fib(F − 1 on W_n(S^♭[1/d]))`, with `d` inverted; its `S = O_C` Check (line 250) says "the coefficient ring is `W_n(C^♭)`". The statement the design quotes is that README's §6.25 (*The variant of the étale comparison without inverting p or d*, line 621: `ℤ/p^n ≃ (Δ_{X/A}/p^n)^{φ=1}`, hence `RΓ_ét(Spec S, ℤ/p^n) ≃ (W_n(S^♭))^{φ=1}` for perfectoid `S`) and its worked example (line 836: "`S = O_C`: `ℤ/p^n ≃ (A_inf/p^n)^{φ=1} = W_n(O_C^♭)^{F=1}`, and `F − 1` is surjective on `W_n(O_C^♭)`").

   Repair: cite "PrismaticCohomologyPartIII §6.25 (integral étale comparison, with §6.3 for `Δ_{S/A} = A_inf(S)` and tilting)" in the contract (line 100), the scope line (line 28), the §6.7 route and `*Needs:*` line, the Layer 6 Dependencies, and `plan.json` 6.7 prerequisites and the `suppliers` entry. Tested on `S = R^+` for an affinoid perfectoid `Spa(R, R^+)`: §6.25 gives `H⁰ = ℤ/p^n` on connected `R^+` and `H¹ = coker(F − 1) = H¹_ét(Spec R^+, ℤ/p^n)`, killed by a pro-étale cover, which is the sheaf exactness §6.7 needs; §6.3 gives the same on `R^♭ = R^{+♭}[1/d]` only.

3. **F03** (P3) §6.6 attributes the vanishing of `H^i(X, Ω^j_X)` to GK07 Theorem 4.4, which computes something else

   Location: `design/README.md` line 697: "(CDN-STEIN Proposition 6.5 and Corollary 6.6; GK07 Proposition 4.5 and Theorem 4.4)".

   Claim: GK07 Theorem 4.4 and Proposition 4.5 are the primary sources of `H^i(X, Ω^j_X) = 0`, `i > 0`, and the mod-`k` statements.

   Witness: CDN-STEIN Proposition 6.5 (line 2270) cites "[33, Theorem 4.5], [35, Prop. 4.5]"; its bibliography has [33] = Grosse-Klönne, *Integral structures in the p-adic holomorphic discrete series*, Represent. Theory 9 (2005) (line 3291) and [35] = GK07 (line 3294). GK07's Theorem 4.4 (line 1109) is the computation of the reduction `Log^s(M⁰) ⊗ k` of logarithmic forms (its line 73), and its Proposition 4.5 (line 1164) is `H^j(X, Log^s(M⁰)) ≅ H^j(X, M⁰ ⊗ Ω^s)` for small weights.

   Repair: write "(CDN-STEIN Proposition 6.5 and Corollary 6.6, after Grosse-Klönne, *Integral structures in the p-adic holomorphic discrete series*, Theorem 4.5, and GK07 Proposition 4.5)", recording the Represent. Theory paper in `sources.toml` (it is open on arXiv) or citing it through CDN-STEIN; drop "Theorem 4.4" or name it as the reduction computation. Tested: the `d = 1`, `j = 1` Check (logarithmic forms, `Sp^cont_1(O_K)^*`) is CDN-STEIN Theorem 6.28(2)(c) (line 2615), unchanged.

4. **F04** (P3) Precision slips in repaired or adjacent passages

   - Line 661 (§6.3, the new `d = 1` witness): "`φ^f = q²` on `H²_rig(ℙ¹_k)`". GK05 Theorem 6.3 concerns `H^s_rig(M/S₀) ≅ H^s_rig(M♥/S₀)` with `M♥` the complement of the other components (GK05 lines 1256–1257); for `d = 1`, `M♥ = ℙ¹_k` minus `q + 1` points is affine, so the relevant `H²` is `0` and the `s = 2` case is vacuous. Write "`H²_rig(M♥/S₀) = 0` since `M♥` is affine".
   - Line 132 and `plan.json` gaps[1] `neededBy`: "Needed by §§1.2–1.3 and 3.2" / `["1.2", "1.3", "3.2"]`, while §3.3's `*Needs:*` line (397) and its `A_cris`, `F¹A_cris` carriers also need the gap; add 3.3 to both.
   - Line 709 (§6.7): stated for "a semistable formal scheme `𝔛` over `O_C` with smooth generic fibre"; CDN-DUKE Theorem 2.9 (line 370) is for any flat formal model of a smooth `X`. The restriction is forced by the carrier (AInfCohomology §AI.6.2 constructs `AΩ` under its semistable standing hypotheses): say so in one clause ("semistable, the generality in which `AΩ_𝔛` is supplied; CDN-DUKE Theorem 2.9 holds for every flat formal model").

Reviewed at head `c479bd5` of the design pull request (board checkout confirmed at that commit before reading). Files: `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/README.md`, `design/plan.json`, `sources.toml`. Pins: Mathlib `6b7abb3`, Tau Ceti `a91d3aa`. One P2 finding (a missing hypothesis in §§7.4–7.5, a passage no repair touched, read in full as a sampled target) and three P3 findings; no P1. All eight round-1 findings are repaired (F03 with a residual section slip, R02).

## Round-1 findings, repair by repair

| Id | Status | Witness at `c479bd5` |
| --- | --- | --- |
| F01 (P2) level hypothesis in §7.8(e) | repaired | `design/README.md` line 851: "for every supercuspidal `M` of level at most `n` on which `ϖ` acts trivially … (CDN23 Remarque 2.15(ii), line 1494)"; line 765 defines `Ǧ_n` and "level at most `n`" (CDN23 lines 182, 330 read: `Ǧ_n = 1 + m_D^n`, "de niveau ≤ n si JL(M) se factorise à travers Ǧ/Ǧ_n"); line 857 adds the negative control `n = 1`, `M` of level `2`; `plan.json` 7.8 statement, hypotheses, locator and test `level` match. CDN23 line 1494 reads "pour tout M de niveau ≤ n". |
| F02 (P2) nonexistent `Syntomic.*` names | repaired | `grep 'Syntomic\.'` over the README: 0 hits. Line 95 cites §4.1 *Ordinary and modified Tate lattices*, §4.2 *Period morphisms and their targets*, §4.4 *All weights and bounded error*, §4.5 *Syntomic-étale objects on X*; the CohomologyComparisonsPartII README at its head (#1364) has these headings at its lines 479, 510, 549, 568 with `L_EN(r) = (p^a a!)⁻¹L(r)`, `a = floor(r/(p−1))` (line 481) and quantifiers `∃A(e,p,r), ∀X,n,q≤r` (line 553). Line 593 (§5.3 Check) now cites "its factorial Check" with `a = 2`, `p^a a! = 8`, matching that README's line 505. |
| F03 (P2) Artin–Schreier sequence misattributed to AInfCohomology §AI.3.1 | repaired, residual P3 (R02) | Line 96: §AI.3.1 supplies the carrier only ("no exactness statement for `1 − φ^{−1}` is taken from it"); AInfCohomology §AI.3.1 at its head (#1044) has `AInfSheaf.ainf` with `ainf_frobenius`, `ainf_theta`, `ainf_sections_H0`, no exactness statement. Line 709: the sheaf sequence is an explicit route step citing CDN-DUKE Lemma 2.11(b), lines 380–394 (read: statement and proof exactly as restated, `ker(1 − ψ_i) ≅ μ^i ker(1 − φ^{−1}) ≅ μ^i Ẑ_p`, surjectivity modulo `μ` from (a) plus `μ`-adic completeness). Lines 28, 98–100, 717, 761 and `plan.json` 6.7 prerequisites and `suppliers` add PrismaticCohomologyPartIII §6.3, which exists at its head (#1070, line 234, *The étale comparison for perfectoid rings*). The section number for the integral statement is off by one section: R02. |
| F04 (P2) gap `period-rings-general-C` imprecise; §4.3 cited for a plus-ring sequence | repaired | Line 109 cites §4.3 for what it states; PadicPeriodRings §4.3 at its head (#940) states `B_cris^{G_K} = B_st^{G_K} = K₀`, `(B_dR^+)^{G_K} = K` and `0 → ℚ_p → B_cris^{φ=1} → B_dR/Fil⁰B_dR → 0` only (grep for `φ=p` in that README: no plus-ring statement). Line 132 and `plan.json` gaps[1] `needs` now name `0 → ℚ_p t → (B_cris^+)^{φ=p} → C → 0`, `(B_cris^+)^{φ=1} = ℚ_p`, `(B_cris^+)^{φ=p^{−1}} = 0` over arbitrary complete algebraically closed `C`; `detail` records what §4.3 lacks. |
| F05 (P3) §7.2 Check: one orbit | repaired | Line 787: pairs `(v, i)`, `g·(v, i) = (gv, i + v(det g))`, invariant "type plus copy index mod 2", two `G`-orbits, one `G × Ǧ`-orbit, stabilizer `GL₂(O_F)ϖ^ℤ`; `plan.json` test `orbit` matches. Recomputed below. |
| F06 (P3) six locator slips | repaired | Line 498 "Remarque 0.16(ii)" (CDN-CURVES line 410 is "Remarque 0.16"); line 30 "§4.7"; line 341 states the section of `H¹_ét → H¹_ét/H¹(Γ, ℚ_ℓ(1))` with `s_{r↦ζ(r)p^r} = s_{r↦p^r} + t_ζN`, `t_ζ = (ζ(ℓ^{−n}))_n` (CDN-CURVES lines 3208, 3224–3230 read); line 661 records GK05's standing `d ≥ 2` (GK05 line 1209 read: "6.1 Let d ≥ 2"), the `d = 1` direct check and CDN-STEIN §5.5 line 2157 (read: "the linearized Frobenius on `H^r_HK(Y)` is equal to multiplication by `q^r` [32, Cor. 6.6]", with `d ≥ 1` at line 1881); line 642 "`d − 2 = 0`" (GK05 lines 1252–1253: last centres of dimension `r − 2` in `ℙ^r`); `sources.toml` GK14 locator "Corollaries 4.3, 4.4, 4.5" (GK14 line 1328 read: Corollary 4.4(a) pairwise non-isomorphism). |
| F07 (P3) "cocompact" in §6.10 | repaired | Line 745: "for a discrete torsion-free `Γ ⊂ PGL_{d+1}(K)`"; DAT06 lines 1962–1967 read: "sous-groupe discret et sans torsion", free action, Galois covering, (4.1.4). Cocompactness remains only in §7.2 (route) and §7.8(e), where the quotient must be proper. |
| F08 (P3) `*Needs:*` lines missing on 38 targets | repaired | 50 `*Needs:*` lines against 50 `### k.n` targets (script over the file). Every `plan.json` prerequisite is named in its target's `*Needs:*` line (script: 0 unsurfaced after reading ranges such as "§§3.2–3.4" as covering 3.3). Layer 2 and Layer 6 Dependencies name AdicSpacesPartIII F0, ClassicalAdicEtaleCohomology §4.6, PrismaticCohomologyPartIII §6.3 and §4.3. |

## Verified sound

**Checkout and tooling.** Board checkout at `c479bd5` = the pull request's head named by the brief. Gate output, verbatim:

    candidate: ProetaleCohomologyOfPAdicCurvesAndTowers is not in the merge order yet; checked as if placed after ModpRepresentationsOfGL2OverLocalFields (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 662 edges, 0 problem(s)

No UPWARD or CYCLE line. The new edge PrismaticCohomologyPartIII is earlier in `merge-order/ORDER.txt`. Citation resolver (`roadmaps resolve`): one lead, "PadicLocalLanglandsForGL2QpPartII §4.1 found nowhere", a false lead (board design, #392 at `b81ec27`, per the board packages index; cited only as a consumer); Lean names found nowhere: none.

**Principles.** No route-specific shortcut (every finite `F/ℚ_p`, every `d ≥ 1`, every complete algebraically closed `C` with `v_p(C^×) = ℚ`); no re-planned roadmap (CstConjectureForDaggerVarieties CS.1, CohomologyComparisons §§4.11–4.12, LocallyAnalyticDistributions §0.CR.6.6 imported with their conventions, as in round 1); no computational algorithm; grep over the README: no LaTeX delimiters, no `lemma`, no process words or pull-request numbers, no machine paths; `plan.json` and `sources.toml` carry no machine paths; no `set_option` or sorry'd data (no Lean file at the design stage).

**Sources: the seeded sample (15 targets), all read at their locators.** Round-1 rows with computed values were reused only for passages no repair touched (0.2, 0.5, 3.2, 6.10); every other sampled target was read in full.

| Target | Locator read | Result |
| --- | --- | --- |
| 0.2 | CDN-CURVES §1.2.4, Remarques 1.5–1.6 (round-1 rows; passage untouched) | as restated |
| 0.3 | CDN-STEIN §5.2.1 lines 1901–1917, §5.2.2 lines 1930–1938, §5.2.3 lines 1941–1948, Corollary 5.4 lines 1950–1955 | `Sp_J`, `Sp_r = Sp_{{1,…,d−r}}`, `Sp_r = 0` for `r > d`, LF-space, `Sp_J(L)^* = lim LC(X_{n,J}, L)^*` nuclear Fréchet, `Sp_J(O_L)^*` compact torsion-free, Banach unit ball, smooth vectors: as restated |
| 0.5 | CDN-STEIN Proposition 5.6 line 1977, §5.4.1 (round-1 rows; untouched) | as restated |
| 3.2 | CDN-CURVES §6.3, Théorème 0.13(ii) line 383–387 ("le twist (−1) signifie que l'on multiplie l'action naturelle de ϕ par p") | as restated |
| 3.4 | CDN-CURVES Théorème 6.30 lines 3780–3781 (`p²`-exact, affinoid), footnote 45 line 3799, Remarque 0.19 lines 568–575 (denominators depend on the lengths of the legs) | as restated |
| 3.5 | CDN-CURVES Théorème 6.32 lines 3826–3833 (second term `H¹_syn(Y, 1)`, first row exact, second a complex), Corollaire 6.25 line 3656, Théorème 0.1 lines 115–134 (Banach, closed images), Remarque 6.33(i)–(ii) lines 3834–3856, lines 160–164 | as restated; the passage from `H¹_syn` to `H¹_proét` is Corollaire 6.25 plus §1.1(a), as the locator says |
| 4.6 | CDN-CURVES Théorème 8.12 lines 4542–4543, proof lines 4548–4556, Remarque 0.16(ii) lines 412–415 | as restated, including the proof sketch |
| 5.2 | CDN-STEIN §3.1.1 lines 682–691, §3.1.2 lines 696–699, Proposition 3.12 lines 905–915 (= GK05 Theorem 3.4; zigzag `ι_HK`), Example 1.9 lines 160–163; GK05 Theorem 3.4 line 637, Corollary 3.7 line 673 | as restated; `RΓ_HK` is defined on the semistable weak formal scheme and computed on the Stein covering |
| 6.1 | GK05 §6.1 lines 1209–1215, §6.2 lines 1252–1253; CDN-STEIN §5.1 lines 1880–1898 | as restated (vertices ↔ components, `BT^s` truncations `Y_s`) |
| 6.3 | GK05 Theorem 6.3 lines 1254–1264, Corollary 6.6 lines 1291–1298, Proposition 6.5 line 1275; CDN-STEIN §5.5 lines 2156–2167 | as restated with the `d ≥ 2`/`d ≥ 1` bookkeeping; R04 for the `H²` clause |
| 6.6 | CDN-STEIN Proposition 6.5 lines 2270–2274, Corollary 6.6 lines 2275–2276, Theorem 6.28 lines 2601–2616; GK07 lines 65–80, 1109, 1164; CDN20 Remarque A.2 lines 2123–2125 | statements as restated; R03 for the GK07 attribution |
| 6.7 | CDN-DUKE Theorem 2.9 lines 370–373, Remark 2.10, Lemma 2.11 lines 380–394, Lemma 2.12 line 417, Corollary 2.13 line 461, (1.4) line 95, (5.2) line 891 | as restated; Theorem 2.9's hypothesis is "flat formal model" (R04) |
| 6.10 | DAT06 §4.1.3 lines 1960–1968 (re-read), round-1 rows for 3.0.9, 3.1.1, 4.2.1, 4.2.2, 2.1.6 | as restated after R07 |
| 7.3 | CDN20 Proposition 2.12(i) lines 914–915; EndoscopicTransferAndUnitaryTraceComparison §12.7 (diagonal `E^×` trivial, height translation in the Weil descent), §12.19 (descent of `M_n^ϖ` to `E` with `G′`) | as restated |
| 7.4 | CDN20 lines 182–184 (definition), Théorème 0.4 lines 199–213, Corollaire 2.1 line 654, lines 702–716, footnote 10 lines 664–665; CDN-CURVES Remarque 0.16(iii) lines 417–425; EndoscopicTransferAndUnitaryTraceComparison §12.20 | as restated except the slope hypothesis (R01) |

Also read for the repairs: CDN23 lines 176–186, 326–334, 1168–1176, 1456–1500; CDN-CURVES lines 405–425, 3204–3232; GK14 lines 1325–1330; CDN20 Théorème 0.8 lines 246–261. Versions: all locators agree with the arXiv versions recorded in `sources.toml`.

**Adversarial pass (values computed on each side).** Rows for the repaired passages, the sampled targets and the targets the findings touch.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §7.4 isomorphism, `φ`-equivariance | `M` of slope `1/2`; `M′ = M ⊗ (φe = pe)` | `Hom_Ǧ(ρ ⊗ χ∘Nrd, Ind_S^Ǧ H) = Hom_S(ρ, H)` with `φ` acting through `H` (absolute Frobenius fixes components): slope `1/2` for both; `M̆′` slope `3/2` | false for `M′` | R01 |
| §7.5 first row | `M′` of slope `3/2` | `(B_cris^+ ⊗ D_{3/2})^{φ=p} = (B_cris^+)^{φ²=p^{−1}} = 0`; row collapses to `O(M_∞)[M′] ≅ H¹_proét[M′]`, but `H¹_ét[M′] = H¹_ét[M] ≠ 0` and étale classes are not `exp(f)` (§7.3 Check) | false for `M′`; with slope `1/2`, `Dim X^+_st = ([L:ℚ_p], 2)` as CDN20 line 707 | R01 |
| §7.8(e) with level `≤ n` | `n = 1`, `M` of level `2`; `n = 1`, depth-zero `θ ≠ θ^q` on `𝔽_{q²}^×` | level `2`: `Ǧ_1` trivial on `M_1^ϖ` ⟹ `JL(M)`-part `0`; level `1`: `Ind_{F^×O_D^×}^{D^×} θ̃`, dimension `[D^× : F^×O_D^×] = 2`, `θ̃(ϖ) = 1` choosable, irreducible iff `θ ≠ θ^q` iff `θ` not through the norm | repaired statement holds; (f) has input | none |
| §7.8 slope under "ϖ trivial" | `ω_{JL(M)}(ϖ) = 1` | CDN20 line 142: `ω = det WD(M)·|·|`, so `2s·f − f = 0`, `s = 1/2` | §7.8 implicitly at slope `1/2` | none (R01 repairs the definition) |
| §7.2 orbit Check | `g = diag(ϖ, 1)`; `g = ϖ`; `ϖ_D` | `type + i`: `+1 + 1 ≡ 0`; `0 + 2 ≡ 0`; `ϖ_D`: vertex fixed, `i + 1`; stabilizer of `(v₀, 0)` is `F^×GL₂(O_F)`, `v(det)` even automatically | two `G`-orbits, one `G × Ǧ`-orbit | none |
| Layer 7 preamble, `M_0^ϖ = Ω × ℤ/2` | `v(Nrd ϖ) = 2` | `O_D^×` trivial at level `0`, `ϖ_D` shifts height by `1`, `ϖ` by `2` ⟹ two copies | consistent with §7.2 and §7.7 Checks (`H⁰ = 𝔽_p²`) | none |
| §2.5 Picard–Lefschetz | `ζ = 1`; Tate curve | `t_ζ = 0`; `N: ℤ_ℓ → ℤ_ℓ(1)` by `v_p(q)`, `t_ζN` lands in `H¹(Γ, ℚ_ℓ(1))`, the kernel of the projection | as source (lines 3208, 3229) | none |
| §6.7 sheaf sequence | `i = 0`; `i ≥ 1` on `μ^i x` | `1 − φ^{−1} = −φ^{−1}(1 − φ)`, kernel `Ẑ_p`; `ξφ^{−1}(μ) = μ` since `ξ = μ/φ^{−1}(μ)`, so `(1 − ξ^iφ^{−1})(μ^ix) = μ^i(1 − φ^{−1})x` | kernel `μ^iẐ_p`, as CDN-DUKE line 391 | R02 (section number only) |
| §6.7 Check `𝔛 = Spf O_C`, `i = 1` | `A_inf{1} = μ^{−1}A_inf(1)` | `1 − φ^{−1}` on `μ^{−1}y` is `μ^{−1}(1 − ξφ^{−1})y`; `H¹_ét(Spa C, ℤ_p(1)) = 0` ⟹ surjective, Lemma 2.11(b) at `i = 1` | holds | none |
| §6.7 integral input | `S = R^+` affinoid perfectoid | §6.25: `H⁰ = ℤ/p^n`, `H¹ = coker(F − 1) = H¹_ét(Spec R^+, ℤ/p^n)`; §6.3: same on `R^♭ = R^{+♭}[1/d]` only | §6.25 is the owner | R02 |
| §6.3 at `d = 1` | `ℙ¹_k` with `q + 1` log points; double point; `s = 0, 1, 2` | `H⁰`: `φ^f = 1`; `H¹(M♥) = ⊕ dlog(t − a)`, `q`-dimensional, `φ^f = q`; `H²(M♥) = 0` (affine); point: `H⁰ = F` | `φ^f = q^s` holds; `s = 2` vacuous | R04 |
| `N = 0` from `φ^f = q^s` | `s`, `q = p^f` | `Nφ^f = qφ^fN` ⟹ `q^sN = q^{s+1}N` ⟹ `(q − 1)q^sN = 0`, char `0` | holds | none |
| §6.6 | `d = 1`, `j = 1`; `j = 0`; `H¹(X, O)` | Theorem 6.28(2)(c): `H⁰(X, Ω¹) = Sp^cont_1(O_K)^*`; (2)(a): `H⁰(Y, Ω^r) = Sp_r(k)^*`; bounded functions constant (CDN20 Rem. A.2) ⟹ `H⁰(X, O) = O_K`; Prop. 6.5: `H¹(X, O) = 0` | holds | R03 (locator) |
| §5.2 `ι_HK` dependence on `ϖ` | `ϖ ↦ ϖu`, Tate module `Ne₁ = e₀` | `exp(log(u)N)e₁ = e₁ + log(u)e₀`, `exp(log(u)N)e₀ = e₀` | matches the Check | none |
| §5.2 Check `𝔸^d_K` | `r ≥ 1` | `H^r_dR = 0` ⟹ `H^r_HK = 0` by `ι_HK` (Example 1.9) | holds | none |
| §5.3 factorial Check | `p = 2, r = 2`; `p = 3, r = 4` | `a = 2`, `2²·2! = 8`; `a = 2`, `3²·2! = 18`, `(1/18)ℤ_3 = (1/9)ℤ_3` | agrees with CohomologyComparisonsPartII §4.1 lines 505, 507 | none |
| §6.1 Check | `d = 2`; `d = 3` | centres of dimension `d − 2 = 0`: `q² + q + 1` points; `d = 3`: lines of dimension `1 = d − 2` must be blown up | holds | none |
| §6.10 without "cocompact" | `Γ = 1`; non-cocompact torsion-free `Γ` | `Λ ⊗^L_Λ RΓ_c = RΓ_c`; free action, Galois covering (DAT06 lines 1963–1965) | holds | none |
| §4.6 similarity | good ordinary elliptic curve over `𝔽_q`; Drinfeld half-plane | both sides `X² − aX + q`, `N = 0`; `H¹_HK(Ω)(1)`: slope `1 − 1 = 0`, permutation action on `Γ`, matching geometric Frobenius on `H¹_c(Γ, ℚ_ℓ)^*` | holds | none |
| §3.4 | closed disc; closed annulus | `H¹_dR(Ỹ_S)^{sep,φ=p} = 0` ⟹ `0 → ℤ_p ⊗̂ O(Y)^{**} → H¹_syn → 0` up to `p²`; annulus: `dlog T` fixed by `φ/p` (`φ(T) = T^p`), image of the symbol `(T)` | holds | none |
| §3.5 | closed annulus; `p = 2` | third term `X¹_st(C̆(−1)) = (B_cris^+)^{φ=1} = ℚ_p`; `p = 2`: Cor. 6.25's cokernel killed by `2` disappears after `⊗ℚ_p` | holds | none |
| §0.3 Checks | `d = 1`, `K₁ = 1 + ϖM₂(O_K)`; `A = 0`; `J = Δ` with the wrong index set | invariants `A^{ℙ¹(k)}/A`, rank `q` (round-1 row, including `A` with `p`-torsion); all `Sp_J(0) = 0`; quotienting by `i ∈ J` kills `Sp_Δ(A) = A/LC(X_Δ, A) = 0` | holds | none |
| §0.3 topology bullets | `L/ℚ_p` finite | `LC(X_J, L) = colim LC(X_{n,J}, L)` LF; dual `lim LC(X_{n,J}, L)^*` countable product of Banach spaces; `Sp_J(O_L)^*` compact (CDN-STEIN lines 1931–1938) | holds | none |
| §0.2 | segment with two legs at each end | `S = 2`, `A_c = 1`, four legs: `H¹ = 0`, `H¹_c` rank `3`, `N_µ = 0` (round-1 row) | holds | none |
| §7.3 | `n = 0`; bounded vectors | two copies of §6.5 at `d = 1` (consistent with `M_0^ϖ = Ω × ℤ/2`); `H¹_ét(M_n, O_L(1))` a bounded lattice; `exp(f)` not étale (CDN20 Rem. A.2) | holds | none |
| Gap `period-rings-general-C` | `M = C̆`, `M = C̆(−1)`, `r = 1` | kernel `ℚ_p t`; `(B_cris^+)^{φ=1} = ℚ_p`; `(B_cris^+)^{φ=p^{−1}} = 0` | `needs` is exactly what §§1.3, 3.3, 6.5 use | R04 (add 3.3 to `neededBy`) |
| Gap `formal-syntomic-period-comparison` | CohomologyComparisonsPartII §4.4 line 551 | charts "étale over `V[x₁^±1,…]/(…−π^h)`", log schemes; `∃A(e,p,r) ∀X,n,q≤r` (line 553) | gap real; `needs` precise | none |
| Gap `endomorphism-characteristic-polynomials` | PDE §RD.7.7 (round-1 row) | `q`-Frobenius only | gap real | none |

**Supplier citations resolved this round** (section present with the cited content at main or the open head): PrismaticCohomologyPartIII §6.3 and §6.25 (#1070); AInfCohomology §AI.3.1 (`AInfSheaf.ainf`, `ainf_frobenius`, `ainf_theta`, `ainf_sections_H0`), §AI.6.2 (`Semistable.structureSheafEdge`, standing hypotheses SS: semistable charts); PadicPeriodRings §4.3 (#940); CohomologyComparisonsPartII §§4.1, 4.2, 4.4, 4.5 (#1364); EndoscopicTransferAndUnitaryTraceComparison §§12.7, 12.19, 12.20. The 95 citations resolved in round 1 were not re-resolved except where a repair touched them; none of the repairs changed a citation other than those listed. Ownership against open pull requests outside the sibling checkouts the brief names was not checked; nothing new is owned here (the twisted sheaf sequence is a route step of §6.7).

**Gaps.** Three gaps, each with a named supplier earlier in the order, the same slug in `plan.json` and the README, a one-sentence `needs`, and not provided today (witnesses in the table). F04's `needs` is now exact. Were the design accepted, acceptance would be conditional on `formal-syntomic-period-comparison`, `period-rings-general-C` and `endomorphism-characteristic-polynomials`; the verdict here is needs changes, so no conditional acceptance is recorded.

**Shape and completeness.** `plan.json`: 50 targets (17 definitions, 4 constructions, 29 theorems), 138 tests, every definition and construction with at least three tests; 50 of 50 targets carry a `*Needs:*` line; every layer ends with Examples and Dependencies; `How to read the build` matches the layer dependencies. The Lean form, the `#check` comparison and the one-tactic padding probe do not apply: a design has no `Suggested.lean` (not available; this lane does not elaborate). Headline theorems as the README names them: §3.5 (T1(a)), §§2.4, 3.3 (T1(b)), §3.4 (T1(c)), §§4.1–4.2 (T2), §§4.7–4.9 (T3), §§2.3, 2.5, 3.2(d), 4.3, 4.6 (T4), §5.5 (T5), §§6.2, 6.4, 6.5, 6.9, 6.10 (T6), §§7.2, 7.4, 7.5, 7.7, 7.8 (T7); R01 changes the hypotheses of T7's §§7.4–7.5 and nothing else.

**Counts.** 8 round-1 findings checked (8 repaired, 1 with a residual P3); 15 sampled targets verified at their locators (11 read in full this round, 4 reused from round-1 rows with computed values; 0 failures of statement, 1 missing hypothesis found in a sampled target: R01; 2 locator slips: R02, R03); 32 adversarial rows computed; 9 supplier sections resolved at their heads; gate and resolver run; 1 policy grep pass (clean); `plan.json` prerequisites compared mechanically with the README's `*Needs:*` lines (0 unsurfaced).

## Not verifiable

- SS91 §§3–4, IS01 Theorem 4.5, DS01 Theorems 5.7 and 7.7, NAK84 Theorem 4: paywalled, recorded `uncertified` in `sources.toml`; cited through CDN-STEIN Theorem 5.8/5.10, GK05 Proposition 6.5 and CDN23 Remarque 2.15(ii), which were read.
- Grosse-Klönne, *Integral structures in the p-adic holomorphic discrete series*, Theorem 4.5 (R03): not in the manifest and not opened; its statement is restated by CDN-STEIN Proposition 6.5, which was read.
- CN-I, CN-II, CGN23, THO24 Theorems 3.5–3.6, CDN20 Théorème 0.6: boundary or Part II citations only; not opened this round.
- Elaboration of a `Suggested.lean`: not available at the design stage (this lane does not elaborate).

## Source issues

- **Error** in CDN20 at Théorème 0.4 and Théorème 0.8, printed pages 6–7 (lines 199–213, 246–261): the statements are printed for every supercuspidal rank-two `M`, supercuspidal meaning only that `WD(M)` is irreducible (line 182); it should be `M` of slope `1/2`, as the paper's own §2.1 (lines 644, 654, 702), footnote 10 (line 664) and the later CDN23 definition (line 328) require, since an unramified twist changes the slope of `M̆` but not that of the multiplicity module; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c479bd5", "job": "REV-DESIGN-ProetaleCohomologyOfPAdicCurvesAndTowers~2", "model": "fable", "worker": "fable-rev192"} -->
