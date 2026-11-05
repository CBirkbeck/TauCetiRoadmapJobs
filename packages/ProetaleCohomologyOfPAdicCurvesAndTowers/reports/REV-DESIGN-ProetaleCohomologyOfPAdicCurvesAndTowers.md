<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2128#issuecomment-6407792482 -->
Review (claude) of eca65ea

Verdict: needs changes

1. **F01** (P2) §7.8(e) asserts a nonzero multiplicity for every supercuspidal `M`, but only `M` of level ≤ n can occur at level n

   Location: `design/README.md` line 772, §7.8(e): "for every supercuspidal `M` on which `ϖ` acts trivially there is `V` with `Π_M(V) ≠ 0`".

   Claim: as stated, for the fixed level `n` of §7.8, every supercuspidal `M` with `ϖ` trivial on `JL(M)` has some `V` with `Π_M(V) ≠ 0`.

   Witness: `Ǧ_n = 1 + ϖ_D^n O_D` acts trivially on `M_n^ϖ`, so every irreducible constituent of `H¹_ét(M^ϖ_{n,C}, L(1))` factors through `Ǧ/Ǧ_n`; for `JL(M)` of level `m > n` the multiplicity space is `0` for every `V`. CDN23 line 1494 states the conclusion "pour tout M de niveau ≤ n".

   Repair: in (e) write "for every supercuspidal `M` of level at most `n` (i.e. `JL(M)` trivial on `1 + ϖ_D^n O_D`) on which `ϖ` acts trivially there is `V` with `Π_M(V) ≠ 0`"; (f) is unaffected since for `n > 0` such `M` exist (depth-zero characters of `𝔽_{q²}^×` not factoring through the norm give two-dimensional level-one `JL(M)`), and the §7.4 Check already records that level `0` carries none. Tested on the instance: `n = 1`, `M` of level `2`: both sides of the repaired statement are vacuous, the original claimed `Π_M(V) ≠ 0` for some `V` and is refuted.

2. **F02** (P2) Supplier drift: four backticked CohomologyComparisonsPartII declaration names do not exist at its head

   Location: `design/README.md` line 94: "§4.2 (`Syntomic.fontaineMessingPeriod`), §4.4 (`Syntomic.boundedPeriodComparison`: …) and §4.5 (`Syntomic.etaleGluing`)"; line 550 (§5.3 Check): "Check `Syntomic.modifiedTateLattices_factorial`".

   Claim: CohomologyComparisonsPartII §§4.1, 4.2, 4.4, 4.5 declare these four names.

   Witness: the CohomologyComparisonsPartII README at its open head contains no occurrence of `Syntomic.` (grep over the whole file, 940 lines); its §4.1 "Ordinary and modified Tate lattices", §4.2 "Period morphisms and their targets", §4.4 "All weights and bounded error" (quantifiers `∃A(e,p,r), ∀X,n,q≤r`) and §4.5 "Syntomic-étale objects on X" exist and carry the cited content under those titles, with no Lean names.

   Repair: cite the sections by number and title and delete the four backticked names; in the §5.3 Check cite "CohomologyComparisonsPartII §4.1, the factorial Check (`L_EN(r) = (p^a a!)^{−1} L(r)`, `a = ⌊r/(p−1)⌋`)". The gap `formal-syntomic-period-comparison` is unchanged: §4.4 is stated for CN semistable charts (schemes), so the transfer to formal and weak formal schemes is correctly declared as a gap.

3. **F03** (P2) §6.7's route attributes the pro-étale Artin–Schreier sequence to AInfCohomology §AI.3.1, which does not state it

   Location: `design/README.md` line 650: "Route: the exact sequence `0 → Ẑ_p --μ^i--> A_inf --(1 − ξ^iφ^{−1})--> A_inf → 0` on `X_proét` (AInfCohomology §AI.3.1)"; also line 95 (contract): "§AI.3.1 (`A_inf,X`, the Artin–Schreier sequence `0 → Ẑ_p → A_inf,X → A_inf,X → 0` for `1 − φ^{−1}`)".

   Claim: AInfCohomology §AI.3.1 supplies this exact sequence of pro-étale sheaves.

   Witness: AInfCohomology §AI.3.1 at its head defines `AInfSheaf.completedIntegral`, `A_inf,X^cl = W(Ô_X^{+,♭})`, `AInfSheaf.ainf` with API `ainf_mod_pn`, `ainf_sections_H0`, `ainf_theta`, `ainf_frobenius`, `ainf_complete`, `ainf_test_point`; no exactness statement for `1 − φ^{−1}` or `1 − ξ^iφ^{−1}` and no "Artin–Schreier" occurs in AI.3 at all (the two occurrences in that README are AI.2 descent remarks). The affinoid-perfectoid statement is owned by PrismaticCohomologyPartIII §6.3 (étale comparison for perfectoid rings, Artin–Schreier–Witt and tilting; its §6.13 Check `0 → ℤ_p → W(O_X) → W(O_X) → 0` with `F − 1`, §6.25 `(A_inf/p^n)^{φ=1} = ℤ/p^n` for `S = O_C`), which is earlier in the merge order.

   Repair: cite PrismaticCohomologyPartIII §6.3 for the perfectoid-affinoid sequence and state the sheaf-level twisted sequence on `X_proét` (`μ^i`, `1 − ξ^iφ^{−1}`, CDN-DUKE proof of Theorem 2.9, lines 376–379) as an explicit step of §6.7 with AInfCohomology §AI.3.1 supplying only the carrier `A_inf,X` and its Frobenius; adjust the §AI.3.1 bullet of the contract accordingly.

4. **F04** (P2) The gap `period-rings-general-C` names "the fundamental exact sequence" while the roadmap uses the plus/`φ = p` sequence that PadicPeriodRings §4.3 does not state

   Location: `design/README.md` line 104: "§4.3: the fundamental exact sequence `0 → ℚ_p(1) → (B_cris^+)^{φ=p} → C → 0` and `(B_cris^+)^{φ=1} = ℚ_p`"; line 127 and `design/plan.json` gaps[1] `needs`: "… and the fundamental exact sequence over an arbitrary complete algebraically closed C".

   Claim: PadicPeriodRings §4.3 states the plus-ring sequence with target `C`; the gap's `needs` is precise.

   Witness: PadicPeriodRings §4.3 at its head states `B_cris^{G_K} = B_st^{G_K} = K₀`, `(B_dR^+)^{G_K} = K`, and the sequence `0 → ℚ_p → B_cris^{φ=1} → B_dR/Fil⁰B_dR → 0` only; no `(B_cris^+)^{φ=p}` statement occurs in that README. The roadmap uses the plus version in §1.3 (Check: kernel `ℚ_p t`), §3.5 and §4.7 and uses `(B_cris^+)^{φ=p^{−1}} = 0` in §1.3 and §6.5.

   Repair: in the contract cite §4.3 for what it states; in the gap's `needs` (plan.json and README) write "the exact sequence `0 → ℚ_p t → (B_cris^+)^{φ=p} → C → 0`, `(B_cris^+)^{φ=1} = ℚ_p` and `(B_cris^+)^{φ=p^{−1}} = 0`, over an arbitrary complete algebraically closed `C`". Tested on the instance `M = C̆` of the §1.3 Check: the repaired `needs` supplies exactly the kernel `ℚ_p t` the Check computes; the present wording does not name it.

5. **F05** (P3) §7.2 Check 3 is false: the components of the model of `M_0^ϖ` form two `G`-orbits, not one

   Location: `design/README.md` line 720: "The components of the model of `M_0^ϖ` form a single `G`-orbit: elements with even determinant valuation act transitively on the vertices of each copy".

   Claim: `G = GL₂(F)` acts transitively on the components; `GL₂(F)^{v(det) even}` acts transitively on the vertices of the tree.

   Witness: components are `Vert(T) × ℤ/2` with `g·(v, i) = (gv, i + v(det g))`; the class `type(v) + i mod 2` (vertex type = parity of the lattice index) is invariant, since `type(gv) = type(v) + v(det g)`. So there are exactly two `G`-orbits, and the even-determinant subgroup preserves the bipartition of the tree. The stabilizer computation `GL₂(O_F)ϖ^ℤ` in the same Check is correct.

   Repair: "The components form two `G`-orbits, distinguished by the parity of vertex type plus copy index, and a single `G × Ǧ`-orbit since `ϖ_D ∈ Ǧ` fixes the vertices and shifts the copy index; a stabilizer in `G` is `GL₂(O_F)ϖ^ℤ`, whose image in `G′` is open."

6. **F06** (P3) Locator and cross-reference slips

   Location and repair, one per bullet:

   - line 461 (§4.6): "(CDN-CURVES Théorème 8.12 = Théorème 0.16(ii))" — 0.16 is a Remarque (CDN-CURVES line 410); write "Remarque 0.16(ii)".
   - line 29 (Scope): "the proper-curve diagram of §4.8 here" — the proper-curve diagram is §4.7; §4.8 is the universal cover of the Jacobian.
   - line 316 (§2.5): "the choice of `r ↦ p^r` splits the projection to `H¹_c(Γ, ℚ_ℓ)^*`" — CDN-CURVES Remarque 6.4(ii) (line 3208) gives a section of the projection modulo `H¹(Γ, ℚ_ℓ(1))`, i.e. of `H¹_ét → H¹_ét/H¹(Γ, ℚ_ℓ(1))`; the Picard–Lefschetz difference `t_ζN` then lands in `H¹(Γ, ℚ_ℓ(1))`. State the section as the source does.
   - line 610 (§6.3): GK05 Theorem 6.3 and Corollary 6.6 are proved under GK05 §6.1's standing "Let d ≥ 2" (GK05 line 1209); §6.3 claims every `d ≥ 1`. Add the `d = 1` witness (the §4.3/§6.4 computation on the tree: slope one on `H¹_c(Γ, C̆)^*(−1)`) to the locator, or cite CDN-STEIN §5.1 for `d ≥ 1`.
   - line 595 (§6.1 Check): "the last centres have dimension `r − 2 = 0`" — `r` is undefined in §6.1; write `d − 2 = 0`.
   - `sources.toml` GK14 locator lists "Corollaries 4.3, 4.5" while §0.4 also cites Corollary 4.4 (GK14 line 1328, pairwise non-isomorphism and multiplicity one); add 4.4.

7. **F07** (P3) §6.10 narrows DAT06 (4.1.4) by an unneeded hypothesis

   Location: `design/README.md` line 680: "for a discrete torsion-free cocompact `Γ ⊂ PGL_{d+1}(K)`, with `Λ ⊗^L_{Λ[Γ]} RΓ_c(H^d_{Ĉ}, Λ) ≅ RΓ_c(H^d_{Ĉ}/Γ, Λ)`".

   Witness: DAT06 §4.1.3, lines 1962–1967, assumes only "Γ ⊂ PG_d un sous-groupe discret et sans torsion"; cocompactness is not used for (4.1.4).

   Repair: delete "cocompact" (keep it where it is needed, in §7.2 and §7.8(e)).

8. **F08** (P3) `*Needs:*` lines are missing on 38 of the 50 targets; plan.json prerequisites are not surfaced

   Location: `design/README.md`: 12 `*Needs:*` lines against 50 `### k.n` targets (missing in §§0.1–0.5, 1.1–1.3, 2.1–2.2, 3.1, 3.3–3.4, 4.3–4.5, 4.8, 5.1–5.4, 6.1–6.9, 7.1–7.8).

   Witness: `design/plan.json` carries per-target prerequisites that the README never names, e.g. 2.1 ← `roadmap:AdicSpacesPartIII F0` (formal geometry; the README's §2.1 and Layer 2 Dependencies cite only §§R3.4, R3.7), 3.2 ← `mathlib:WittVector.Isocrystal`, 6.3 ← `target:5.2`, 7.1 ← `EndoscopicTransferAndUnitaryTraceComparison §§12.2, 12.3, 12.11`.

   Repair: add a `*Needs:*` line to each target listing what its statement and route use, item by item, matching plan.json (the layer-level Dependencies paragraphs stay). This is house style (an implementer who proves a target another way must not be blocked behind an unrelated layer); no mathematical content changes.

Reviewed at head eca65ea of the design pull request (board checkout confirmed at that commit before reading). Files: `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/README.md`, `design/plan.json`, `sources.toml`. Pins: Mathlib 6b7abb3, Tau Ceti a91d3aa. Four P2 findings (one missing hypothesis, three supplier-drift/gap-precision defects) and four P3 findings; no P1. The design supplies exactly what the Scholze package's gap asks for (see Verified sound).

## Verified sound

**Checkout and tooling.** Board checkout at eca65ea = pull request head (`gh pr view 2128`: `headRefOid eca65ea0…`). Gate output, verbatim:

    candidate: ProetaleCohomologyOfPAdicCurvesAndTowers is not in the merge order yet; checked as if placed after ModpRepresentationsOfGL2OverLocalFields (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 661 edges, 0 problem(s)

No UPWARD or CYCLE line. All 30 cited suppliers are on main or earlier in `merge-order/ORDER.txt` (last supplier ModpRepresentationsOfGL2OverLocalFields at line 315; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower at 318 and PadicLocalLanglandsForGL2QpPartII, a board design that imports SZ nodes, are cited only as consumers).

**Principles.** No route-specific shortcut (every finite `F/ℚ_p`, every `d ≥ 1`, every complete algebraically closed `C` with `v_p(C^×) = ℚ`, with the restriction recorded as the source's and the `B_cris` route named); no re-planned roadmap (Cst CS.1, CohomologyComparisons §§4.11–4.12, LocallyAnalyticDistributions 0.CR.6.6 are imported with their exact field conventions, checked below); no computational algorithm; no LaTeX delimiters, no `lemma`, no process words or pull-request numbers in the README (grep over the file); no `set_option` or sorry'd data (no Lean file at the design stage).

**Sources: the seeded sample, all 15 targets read at their locators.**

| Target | Locator read | Result |
| --- | --- | --- |
| 0.2 | CDN-CURVES §1.2.4 line 783–787; Remarque 1.5 line 788; Remarque 1.6 lines 791–796 | `N_µ` composite, compact ⟹ isomorphism, `N∘N = 0` under the stated image condition: as restated |
| 0.5 | CDN-STEIN Proposition 5.6 lines 1977–1984 (`r ∈ {1,…,d}`); §5.4.1 lines 2046–2054 | cocycle identity and vanishing on dependent tuples: as restated; `r = 0` is a direct Check, not Prop 5.6 |
| 1.1 | CDN-CURVES Remarque 0.2(ii) lines 136–137; CDN-STEIN Remark 1.4 lines 114–117 | qc ⟹ étale = pro-étale for all `ℓ`; open disc non-injectivity: as restated |
| 1.2 | CDN-CURVES footnote 5 lines 170–172 | `(B_st^+ ⊗̂ W₁)/(B_st^+ ⊗̂ W₂)` with `B_st^+ ⊗̂ W := B_st^+ ⊗_{B_cris^+}(B_cris^+ ⊗̂ W)`: as restated |
| 1.3 | CDN-CURVES Théorème 0.1 lines 115–134; CDN-STEIN Theorem 1.8 lines 144–159, §5.5 lines 2160–2167 | `X^r_st` and `θ ⊗ ι_HK`; `X^{r−1}_st = 0` via `(B_cris^+)^{φ=p^{−1}} = 0`: as restated |
| 2.1 | CDN-CURVES §0.4.3 lines 599–607, §0.4.4 lines 610–620 (footnotes 13–14), Remarque 3.13 lines 1526–1532, Lemme 4.2 lines 1984–1987 | legs, ghost circles, residue, `Res(du/u) = v′(u)`, sign under orientation reversal: as restated |
| 2.3 | CDN-CURVES Théorème 3.17 line 1748, Théorème 3.19 lines 1854–1856 (= 0.9 line 304), Proposition 3.20 lines 1926–1929, Remarque 0.10(i) lines 307–312 | as restated (Prop 3.20 is `H¹_dR(Y) ≅ H¹_dR(Y^ado)`, which is the Čech computation claimed) |
| 2.5 | CDN-CURVES Théorème 6.3 lines 3189–3203 (integral, pieces over `Σ(Y)`), Proposition 5.10 lines 2543–2546, Remarque 6.4 lines 3204–3230, Remarque 6.5 lines 3231–3238 | filtration and inertia action as restated; the "splitting" is of a different quotient (R06) |
| 3.2 | CDN-CURVES §6.3 lines 3543–3586: Lemme 6.19, Corollaire 6.20, definition of `H^i_HK` line 3555, Théorème 6.21, Remarque 6.22(i)–(iii); Théorème 0.13(ii) lines 380–387 | definition, `ι_HK`, `Nφ = pφN`, filtration with slope-one boundary part and `(−1)` meaning `φ ↦ pφ`: as restated |
| 3.3 | CDN-CURVES §6.4.1 lines 3588–3600, regulator lines 529–532, Théorème 6.24 lines 3630–3631, footnote 32 line 2195, Corollaire 6.25 lines 3656–3658, Proposition 6.26 lines 3673–3676, Proposition 6.29 lines 3766–3770 | isomorphism for `p > 2`, injective with cokernel killed by `2` for `p = 2`, `H⁰_syn = ℤ_p t`, independence of `r ↦ p^r`: as restated |
| 4.5 | CDN-CURVES §8.3.1 lines 4512–4530 (`g(u) = χ_ℓ(g)^{−1}(u + c_ℓ(g))`, `N = d/du`, colimit over `I_L`, projective limits termwise), Remarque 8.10 line 4533, Théorème 8.11 lines 4535–4536 | as restated, including `N∘g = χ_ℓ(g)^{−1}g∘N` |
| 6.10 | DAT06 convention 3.0.9 lines 1289–1290, Théorème 3.1.1 lines 1325–1328, §4.1.3 lines 1954–1967 incl. (4.1.4), Lemme 4.2.1 lines 1997–2008, Proposition 4.2.2 lines 2044–2050, Définition 2.1.6 lines 277–278 | index shift `d_Dat − 1 = d` consistent in (a), (b) (`(d+1)!`, order `≤ d+1`) and (c) (`[−d−i]`); `Λ` as in 3.0.9; cocompact not in the source (R07) |
| 7.1 | STR08 Theorem 4.3 lines 337–341 (`(q−1)q^{m−1}` components, fibres over `Sp(F̂^nr_m)`), Theorem 4.4 lines 372–383 (`det(g)Nrd(b)^{−1}χ(τ)^{−1}`); CDN20 §0.1 lines 101–107 | as restated |
| 7.7 | CDN23 Théorème 2.1 lines 1042–1044 (= 0.5 line 211), §2.1.3 line 1223, Lemme 2.8 line 1262, Lemme 2.9 line 1286, Proposition 2.7 lines 1173–1176 with line 1172 (`GL₂` only), Remarque 2.11 lines 1401–1404, §2.2 line 1295 | as restated |
| 7.8 | CDN23 §2.3 lines 1456–1470 (definitions of `Π_M(V)`, `Π_M(V^+)`, `Π_M(V^+_k)`), Lemme 2.16 lines 1504–1522, Lemme 2.17 lines 1523–1527, Proposition 2.18 lines 1528–1545, Théorème 2.14 lines 1471–1484, Théorème 2.13 lines 1458–1461, Remarque 2.15 lines 1485–1495, NAK84 citation line 2961 | as restated except the level hypothesis in (e) (R01) |

Beyond the sample, also read at their locators: CDN-CURVES Théorèmes 0.4, 0.5, 0.7, 0.15, 0.17, 7.4–7.9, 7.12, 8.1, 8.2, 8.4–8.9, 8.12, Remarques 0.6, 0.8(ii), 0.14, 0.16, 0.18, 0.19, Corollaire 5.5, Lemme 6.1, Propositions 6.2, 6.8, Théorème 6.14, Lemme 6.15, Théorème 6.30, 6.32, Remarque 6.33, §8.2.5; CDN-STEIN Theorem 1.3, Remark 1.6, Example 1.9, Proposition 1.11, §3.1.1 (lines 682–691), §3.1.2, Proposition 3.12, Lemmas 3.26/3.28, Corollary 3.46, Proposition 3.48, Theorem 4.1, Theorem 4.12 (`β̃ = p^{−r}βι_rig^{−1}ι_BK^{−1}α_FM^{−1}`), Remark 4.13, §5.2.1–5.2.3, Proposition 5.1, Remark 5.2, Corollaries 5.3–5.4, Theorems 5.8, 5.10, 5.13, Lemma 5.11, Proposition 6.1, Proposition 6.5, Corollary 6.6, Theorem 6.28, Theorem 6.45(1)–(4), Lemma A.7; CDN20 Proposition 0.1, Théorèmes 0.4, 0.8, Remarque 0.10, line 142, lines 194–198, Proposition 2.12, Proposition A.1, Remarque A.2; CDN-DUKE Theorems 1.1, 1.3, 2.9, Lemmas 2.11–2.12, Corollary 2.13, (1.4), (5.2); GK05 §6.1, Theorem 6.3, Proposition 6.5, Corollary 6.6; GK14 Corollaries 4.3–4.5 (4.5 requires `char k_K = char k_F`, exactly §0.4(b)'s hypothesis); GK07 Theorem 4.4 and Proposition 4.5 located; CN-II Theorem 6.14 (same rows, `β̃ = p^{−r}βα_r^{−1}`, as Cst CS.1); THO24 lines 140–146 (banal splitting remark). Versions: all locators agree with the arXiv versions recorded in `sources.toml`.

**Adversarial pass (values computed on each side).**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, `Nφ = pφN` on `u` | `u` | `N(φu) = N(pu) = −p`; `pφ(Nu) = pφ(−1) = −p` | equal | none |
| Conventions, `deg` and `WD_K` | geometric Frobenius `Φ`, arithmetic `Φ^{−1}` | `deg Φ = f` (CDN-CURVES Rem 8.6(i): `deg γ = −n` for `x ↦ x^{p^n}`), `NΦ = p^fΦN = qΦN`; arithmetic gives `q^{−1}` | §4.4 Check 3 correct | none |
| §0.1 definitions | one vertex, two legs (both with origin `s`) | `∂: L → L²`, `x ↦ (−x,−x)`; `H¹_c = L²/L ≅ L`; `ker ∂^* = {φ₁+φ₂ = 0} ≅ L`; `H¹ = coker(L → L⁰) = 0`; Rem 1.2(ii): `0→0→L→L²→L→0→0`, ranks alternate to `0` | Checks hold | none |
| §0.1 bullet 4 | Bruhat–Tits tree of `PGL₂(K)` | `H¹ = 0` (tree); `H¹_c = colim_n L^{∂T_n}/L = LC(ℙ¹(K), L)/L`; dual = harmonic cochains; agrees with CDN-STEIN Prop 5.6 at `d = 1` | holds | none |
| §0.2 | segment, two legs at each end | `S = 2`, `A_c = 1`, four legs: `H¹ = coker(L² → L) = 0`, `H¹_c = L⁵/L²` of rank `3`, so `N_µ = 0` | compactness needed; Check holds | none |
| §0.3 Check 1 | `K₁ = 1 + ϖM₂(O_K)` on `Sp_1(A)`, `A` with `p`-torsion | `0 → A → A^{ℙ¹(k)} → Sp_1(A)^{K₁} → Hom(K₁, A) → ⊕_x Hom(K₁ ∩ B^x, A)`; the last map is injective because the `K₁ ∩ B^x` span every `K_j/K_{j+1} ≅ M₂(𝔽_q)` (matrices with an eigenline) hence generate a dense subgroup; rank `q` for every `A` | holds, including `A = 𝔽_p` | none |
| §0.3/§0.5 boundary | `d = 1`, `r = 2`; `r = 0` | `Sp_2 = 0` by convention; three hyperplanes of `K²` dependent ⟹ `LC_c(𝓗³, ℤ) = 0`; `r = 0`: `f(H₁) − f(H₀) = 0` ⟹ constants `= Sp_0(ℤ) = ℤ` | consistent | none |
| §0.4 | char `ℓ ≠ p`; DVR hypothesis | Rem 5.2 excludes char `ℓ`; GK14 Cor 4.5 needs `char k_K = p` and type A (no exceptional factor) | hypotheses match | none |
| §1.1(a),(b) | qcqs `X`; open disc; Stein exhaustion | qcqs: `H^i(X_proét, Ẑ_ℓ[1/ℓ]) = H^i(X_proét, Ẑ_ℓ)[1/ℓ] = H^i(Rlim RΓ_ét(ℤ/ℓ^n))[1/ℓ]` (CAE §1.3); open disc: inverting `p` does not commute with `H¹` on a non-qc space, which is CDN-STEIN Rem 1.4; (b): `H⁰_ét(X_n, ℚ_ℓ(r)) = ℚ_ℓ(r)^{π₀}` is Mittag–Leffler | holds | none |
| §1.3 Checks | `M = C̆(−1)`; `M = C̆`; ordinary elliptic | `φ(b)p = pb ⟹ b ∈ (B_cris^+)^{φ=1} = ℚ_p`; `(B_cris^+)^{φ=p} → C` surjective with kernel `ℚ_p t`; Dim `(1,1)+(0,1) = (1,2)`; `X^{r−1}_st = M^{φ=p^r} ⊗ (B_cris^+)^{φ=p^{−1}} = 0` (CDN-STEIN line 2167) | holds; the plus sequence is not in PadicPeriodRings §4.3 | R04 |
| §3.5 Example | Tate curve, `φe₀ = e₀, φe₁ = pe₁, Ne₁ = e₀` | `N = 0, φ = p` on `a⊗e₀ + b⊗e₁` forces `b ∈ ℚ_p`, `a = a₀ + bu`, `a₀ ∈ (B_cris^+)^{φ=p}`: `X^1_st ≅ (B_cris^+)^{φ=p} ⊕ ℚ_p`, Dim `(1,2)`; kernel of `θ` to `C = H¹(Y,O)` is `ℚ_p t ⊕ ℚ_p`, dimension `2 = dim V_p(E)` | holds | none |
| §4.7 | genus `g`; supersingular; `g = 0` | slopes `r_i ∈ [0,1]`, `Σ r_i = g`, Dim `X^1_st = Σ(1 − r_i, 1) = (g, 2g)`; Dim `H¹(Y,O) = (g,0)`; kernel Dim `(0, 2g)`; `(1/2,1)+(1/2,1) = (1,2)`; `g = 0`: all zero | holds | none |
| §4.8 | `g = 1`; sequences not tending to `0` | `Ĵ/V_p(J) ≅ C ⊗ Lie J = C`; dropping `x_n → 0` admits lifts of non-torsion points | holds (definition CDN-CURVES line 440) | none |
| §1.2/§4.2 completed tensor | `H = ∏_ℕ C̆` | projective-limit definition gives `∏_ℕ B_st^+`; `C ⊗ ∏_ℕ C̆ ⊊ ∏_ℕ C` | holds | none |
| §2.1 Checks | `Σ_{k≥0}T^k`; `Σ_{k≥1}T^{−k}`; orientation | first lies in `O_C[[T]]`, not in `O_C⟨T,T^{−1}⟩`; second excluded by Lemme 4.2 (`u⁻ ∈ 1 + T^{−1}m_C⟨T^{−1}⟩`); footnote 13: `v′₂ = −v′₁` | holds | none |
| §2.2 Checks | closed annulus; Tate curve | `S = 2, A_c = 1`, two legs: `H¹ = 0`, `H¹_c` rank `3 − 2 = 1`; circle of length `v_p(q)` | holds | none |
| §2.5 Picard–Lefschetz | change `r ↦ ζ(r)p^r` | source: `s_{ζp^r} = s_{p^r} + t_ζN`, sections of the projection modulo `H¹(Γ, ℚ_ℓ(1))`; difference lands in `H¹(Γ, ℚ_ℓ(1))` | README names a different quotient | R06 |
| §3.2 Check | closed annulus | `Γ_int = ∅`, middle piece `0` (components `ℙ¹`), `H¹_c(Γ, C̆)^*(−1)` of rank `1`, slope `1`: `C̆(−1)`, agreeing with §1.3 | holds | none |
| §3.3 Check | closed disc, `u = 1 + pT` | `du/u = p·dT/(1+pT) ≠ 0` | excludes the zero map | none |
| §4.1 Check | overconvergent disc | Prop 7.4: one vertex, one leg, `Σ = ∅` ⟹ `H¹_HK(Y†) = 0`; `exp` iso | holds | none |
| §4.4/§4.5 | Tate curve; unramified `V` | `WD` two-dimensional with `N` of rank one; unramified: colimit stabilizes at `L = K`, `N = 0` | holds | none |
| §5.3 Check | `p = 2`, `r = 2` | CohComp II §4.1: `a = ⌊r/(p−1)⌋ = 2`, `b = 0`, `p^a a! = 8` ⟹ `(1/8)ℤ₂(2)`; forgetting `a!` gives `1/4` | holds; CDN-STEIN line 2200 writes `0 ≤ b ≤ p−1`, which also admits `(a,b) = (1,1)` | Source issues |
| §5.5/§6.5 | `r = d + 1` | `Ω^{d+1} = 0 ⟹ Ω^d/ker d = 0`; `Sp_{d+1} = 0` ⟹ `H^{d+1}_proét = 0`; both rows zero (CDN-STEIN Rem 1.6(i)) | holds | none |
| §6.1 Check | `d = 2`; `d = 3` | centres of dimension `≤ d − 2 = 0`: the `q² + q + 1` rational points; for `d = 3` lines must be blown up | holds; `r` undefined in the text | R06 |
| §6.3 | `N` on `H^s_HK(Y)` | `Nφ^f = p^fφ^fN = qφ^fN`; `φ^f = q^s` ⟹ `(1 − q)q^sN = 0 ⟹ N = 0` (char `0`); `s = 0`: `φ^f = 1` | holds; GK05 §6.1 assumes `d ≥ 2` | R06 |
| §6.4 Check | `d = 1`, `r = 1` | `H¹_HK = Hom(H¹_c(Γ,ℤ), F)(−1)`, `φ = pσ`; `φ = p` part `= Hom(H¹_c(Γ,ℤ), ℚ_p) = Sp_1(ℚ_p)^*` by §0.1 bullet 4 | consistent across §§0.1, 4.3, 6.4 | none |
| §6.7 Checks | `i = 0`; `𝔛 = Spf O_C`, `i = 1` | `Ẑ_p = A_inf^{φ=1}`; `H¹_ét(Spa C, ℤ_p(1)) = 0` forces `1 − φ^{−1}` surjective on `A_inf{1}` (CDN-DUKE Lemma 2.11(b)) | holds; route input misattributed | R03 |
| §6.9 route | `(A_inf ⊗̂ Sp_r(ℤ_p)^*)^{φ^{−1}=1}` | `= Sp_r(ℤ_p)^* ⊗ A_inf^{φ=1} = Sp_r(ℤ_p)^*` given surjectivity of `1 − φ^{−1}` on `H^{r−1}` (CDN-DUKE §5) | holds | none |
| §6.10(a)–(c) | index shift; `d = 1` | `H_c^{d_D−1+i} = H_c^{d+i}`, `i = 0..d`; `d_D! = (d+1)!`; `[−d_D+1−i] = [−d−i]`; `d = 1`: `H¹_c = π_∅ = St`, `H²_c = π_{{1}}(−1) = Λ(−1)`; Poincaré duality `H^{d+i}_c ≅ Sp_{d−i}(−i)` matches `π_{{1..i}} = Sp_{{1..d−r}}`, `r = d − i` | holds | R07 (cocompact) |
| §7.1 Check | `m = 1`; scalar `b ∈ O_F^×` | `(q−1)q⁰ = q − 1`; `Nrd(b)^{−1} = b^{−n}` | holds | none |
| §7.2 Check 3 | `M_0^ϖ = Ω × ℤ/2` | `g·(v,i) = (gv, i + v(det g))`; invariant `type(v) + i mod 2` ⟹ two `G`-orbits; stabilizer of `(v₀, 0)` is `GL₂(O_F)F^× = GL₂(O_F)ϖ^ℤ` | Check false | R05 |
| §7.4 Check | `n = 0` | `Ǧ` acts on `M_0` through `v(Nrd)`, so `O_D^×` acts trivially and constituents factor through `Ǧ/O_D^× ≅ ℤ`: one-dimensional; supercuspidal `JL(M)` has `dim ≥ 2` ⟹ multiplicity `0` | holds | none |
| §7.5 Check | slope `> 0`; slope `0` | `(B_cris^+ ⊗ M)^{φ=1} = 0` ⟹ `θ` injective; slope `0` gives kernel `ℚ_p t ⊗ M^{φ=1} ≠ 0` | holds | none |
| §7.7 Check | `n = 0`, `q = 0` | `π₀(M^ϖ_{0,K}) = 2` (`Ω` geometrically connected) ⟹ `H⁰ = 𝔽_p²` | holds | none |
| §7.8(e) | `n = 1`, `M` of level `2` | `Ǧ_1` acts trivially on `M_1^ϖ` ⟹ `H¹[JL(M)] = 0` ⟹ `Π_M(V) = 0` for all `V` | statement false without level `≤ n` | R01 |
| Gap `period-rings-general-C` minimality | PadicPeriodRings §4.1 | its rings are built on `C_K = PadicFieldCompletion` of a chosen `p`-adic field `K`; a spherically complete `C` with `v(C^×) = ℚ` is not of this form | gap real and needed | R04 (precision only) |
| Gap `endomorphism-characteristic-polynomials` minimality | PDE §RD.7.7 and the abelian-variety theorem after it | both concern the `q`-Frobenius only (`det(1 − tF)`, `π_A`) | gap real; `needs` precise | none |
| Gap `formal-syntomic-period-comparison` minimality | CohComp II §4.4 | stated for CN semistable charts (schemes/log structures) with `∃A(e,p,r) ∀X,n,q ≤ r`; CDN-STEIN Cor 3.46/Prop 6.1 need the formal and weak formal case | gap real; `needs` precise | none (R02 for the names) |

**Supplier-and-consumer rubric: the Scholze package.** `ScholzeFunctorAndModpCohomologyOfTheLubinTateTower` (board design, merge order 318) declares `gap/proetale-finite-presentation`: CDN23 Théorème 2.1 for every finite `F/ℚ_p`, `K/F` finite, `k ≥ 1`, `q ≥ 0`, with `G′ = GL₂(F)/ϖ^ℤ`, routed to this roadmap as items 2-thm-2-1, 2-prop-semistable, 2-cpcf, 2-cpcf-lemmas, with the Bloch–Kato–Hyodo filtration left to ClassicalAdicEtaleCohomology. §7.7 states Théorème 2.1 with exactly these quantifiers; §7.2 supplies Proposition 2.7 (equivariant semistable model, finitely many `G`-orbits, open stabilizers); §7.6 supplies the cpcf sheaves and Lemmes 2.8–2.9; the BKH filtration is imported from ClassicalAdicEtaleCohomology §4.7, whose `FormalBKHFiltration` block covers formal schemes. The gap's needs are supplied. SZ.6/geometric-multiplicity's general-`F` use of Corollaire 2.12 is served by §7.7 plus the finite-group step the Scholze design keeps.

**Ownership record.** (i) Strauch's connected components: planned in the Scholze design's SZ.0 (also requested by PadicLocalLanglandsForGL2QpPartII as `gap:drinfeld-components` against SZ.0); needed in §§7.1, 7.3–7.5 here, earlier in the order; the design states §7.1 and records the move down (README line 43). The intake should retarget SZ.0 and that gap to §7.1. (ii) PadicLocalLanglandsForGL2QpPartII (board design at head b81ec27) §§3.4–3.5 and 4.1–4.2 plan the `F = ℚ_p` equivariant semistable models, Hyodo–Kato structure, tower diagram and the `d = 1` half-plane isomorphisms, which are §§7.2–7.5 and §§6.2, 6.5, 6.9 here for every `F` and `d`; it imports SZ nodes, hence follows 318 and this roadmap. This roadmap is the owner (earlier, more general); the design records this under Downstream consumers. (iii) No other roadmap on main or at an open head owns `Sp_J(A)` with ring coefficients (SmoothRepresentationsOfLocalGroups SR.3 is over `ℂ`), graphs with legs and `N_µ`, the pattern/adoc geometry, or `X^r_st(M)` beyond VB3's rank-two Dimension example (corpus greps "generalized Steinberg|Sp_J(", "adoc|ghost circle|curve pattern", "graphs with legs|metrized graph").

**Cross-roadmap citations resolved** (section present with the cited content at main or the open head): AdicEtaleGeometry A1.10–A1.12; AdicSpacesPartIII F0, R3.4, R3.7; AdicSpacesPartIV F1.5–F1.9, F1.11; EnhancedDerivedSheaves E2 (E2:towers.1 derived limits, Milnor); StableReduction Layers 1, 2, 7; PadicPeriodRings §§4.1, 4.3 (see R04); CrystallineCohomology CR.5.1, CR.6.1, CR.6.5; SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.2, SR.3 *steinberg* (`C^∞(B∖G)/Σ C^∞(P∖G)`) and *segment-representations* (`L(Δ)` = generalized Steinberg, unique irreducible quotient, so `St = L([−1/2, 1/2]_1)` is in its convention); PadicLocalLanglandsForGL2Qp §6.9 `DivisionAlgebraTypes.jacquetLanglands`, `DrinfeldComparison.localJacquetLanglands`; ClassicalAdicEtaleCohomology §1.3 `ProEtaleSheaf.completedZp`, §1.4, §4.1, §4.5a, §4.6 `FormalScheme.IsSemistable`, `SemistableFormalNearbyCycles`, `FormalNearbySymbol`, §4.7 (`FormalBKHFiltration`), Layer 8, §§9.1, 9.6, 9.7; AInfCohomology AI.3.1 (carrier only, R03), AI.6.1–AI.6.3 `Semistable.aOmega`; LocallyAnalyticDistributions §0.0 `finiteDimensionalML_completedScalar`, §0.2 `naProjectiveLimit_cohomology_finiteDimensionalML`, §0.CR.6.6 `LogCrystalline.daggerHK.comparison`, `steinHK.limit`, `steinHK.operators`, Check `affine_line` (the finite-piece comparison is stated for quasi-compact strictly semistable weak formal schemes of any dimension, "no properness assumption"); GL2AutomorphicRepresentationsAndTransfer R16.3.1–R16.3.3; PadicDifferentialEquationsAndRigidCohomology RD.4.10, 4.11, 4.18, 4.29, 4.34, 4.38, 7.7; PadicHodgeTheory §§5.3, 5.4, 8.1; VectorBundlesAndIsocrystals VB0, VB3 ("Dimension of the semistable period space": `([L:ℚ_p], 2)`); EndoscopicTransferAndUnitaryTraceComparison §12.2 `TowerDatum`, §12.3 `LubinTate.level`, §12.4 `Drinfeld.level`, `Drinfeld.period` into `Ω_E^(n−1)`, §§12.5–12.8, §12.11, §12.12 `TowerCohomology.atLevel`, §12.14 `TowerSector.centralQuotient`, §12.19 (descent of `M_n^ϖ` to `E` with `G′`), §12.20 (supercuspidal `ρ` only, matching the Risk note and §7.4's hypothesis), §12.21; HilbertModularVarietiesAndShimuraCurves R18.5.1 `DrinfeldHalfPlane`, R18.5.2 `DrinfeldExhaustion`, R18.5.3 `DrinfeldFormalModel`; TropicalAndBerkovichArithmetic §§2.11, 2.13–2.17 (§2.16's strict formal-scheme reconstruction is stated over algebraically closed `K` for separated quasi-smooth curves with `S` containing the analytic boundary, so affinoids are covered); CohomologyComparisons §4.9a, §4.11 (under §4.8's countable-residue `C = Ĉ(K̄)`), §4.12 ("require the fundamental period exact sequence supplied elsewhere; this interface returns only the comparison and filtration data"); CohomologyComparisonsPartII §§4.1–4.5 (R02 for the names); CstConjectureForDaggerVarieties CS.1 `stein-affinoid-diagram` (same rows, `β̃ = p^{−r}βα_r^{−1}`, Fréchet/LB, `C` the completion of `K̄` with `K` of countable residue field) and `elementary-bicartesian-cases`; ModpRepresentationsOfGL2OverLocalFields MP.0/finite-presentation, finiteness-calculus, amalgam-coherence (Shotton; `G′ = GL₂(F)/⟨ϖ⟩`), MP.2/category-c, ordinary-banach (`F ≠ ℚ_p`, CDN23 Cor 1.34); JacobianChallenge Layer D; AbelianSchemesAndArithmeticModuli A4.2; ReductiveGroupsPartII RG2.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.25. The `roadmaps resolve` lead "PadicLocalLanglandsForGL2QpPartII §4.1 found nowhere" is a false lead: that package is a board design (pull request 392, head b81ec27) with §4.1 "The fundamental diagram of the Drinfeld tower".

**Library declarations opened at the pins.** Mathlib 6b7abb3: `Mathlib/RingTheory/Perfectoid/BDeRham.lean` line 75 `def BDeRhamPlus`; `Mathlib/RingTheory/WittVector/Isocrystal.lean` line 113 `class Isocrystal` (Frobenius-semilinear automorphism, no monodromy or topology, as the contract says); `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean` line 75 `def EllAdicCohomology` (schemes, as the contract says); `Mathlib/Topology/LocallyConstant/Basic.lean` line 398 `def comap` with `comapMonoidHom`/linear forms in `Algebra.lean` lines 316–324. Tau Ceti a91d3aa: `TauCeti/Algebra/Quaternion/Steinberg.lean` is the quaternion Steinberg-relation splitting, unrelated to `Sp_J`, as stated.

**Gaps.** All three gaps have a named supplier earlier in the order, the same slug in `plan.json` and the README, a one-sentence `needs`, and are not provided today (witnesses in the table); R04 asks for one `needs` to be made exact. R02 and R03 are not gaps: the cited sections exist (R02) or an earlier owner exists (R03).

**Shape and completeness.** Every definition has an API list and at least three Checks (plan.json: 17 definitions/constructions, 3–4 tests each; 137 tests in all); every theorem states its hypotheses with a locator; every layer ends with Examples and Dependencies; `How to read the build` matches plan.json (Layer 5 depends only on Layer 1; Layers 6–7 on 0, 1, 5 and 4–6 respectively). The Lean form, the `#check` comparison and the one-tactic padding probe do not apply: a design has no `Suggested.lean` (this lane does not elaborate). Headline theorems for the package stage, as the README names them: §3.5 (T1(a)), §2.4 and §3.3 (T1(b)), §3.4 (T1(c)), §§4.1–4.2 (T2), §4.7 and §§4.8–4.9 (T3), §§2.3, 2.5, 3.2(d), 4.3, 4.6 (T4), §5.5 (T5), §§6.2, 6.4, 6.5, 6.9, 6.10 (T6), §§7.2, 7.4, 7.5, 7.7, 7.8 (T7); the README's acceptance-test paragraph correctly expects only `Sp_r(A)` and the graph filtration to be statable at the pins.

**Counts.** 15 sampled targets verified at their locators (0 failures of statement, 2 precision slips: R06 §2.5, §6.3); 73 further source statements opened; 30 supplier roadmaps resolved with 95 section or declaration citations checked (4 nonexistent declaration names: R02; 2 statements not made by the cited section: R03, R04); 5 library files opened at the pins; 3 gaps checked; 41 adversarial rows computed; 1 policy grep pass (clean).

## Not verifiable

- SS91 §§3–4, IS01 Theorem 4.5, DS01 Theorems 5.7 and 7.7, NAK84 Theorem 4: paywalled, recorded `uncertified` in `sources.toml`; cited through CDN-STEIN Theorem 5.8/5.10, GK05 Proposition 6.5 and CDN23 Remarque 2.15(ii), which were read.
- GK05 Theorem 3.4 and Corollary 3.7, GK07 Theorem 4.4: located in the cached texts (GK05 lines 637, 673; GK07 line 1109) but their statements were not checked in detail; CDN-STEIN Proposition 3.12 and Proposition 6.5 restate them and were read.
- CN-I Theorems 1.1, 1.3, CGN23 Theorem 1.1, THO24 Theorems 3.5–3.6, CDN20 Théorème 0.6: boundary or Part II citations only; not opened.
- Elaboration of a `Suggested.lean`: not available at the design stage (this lane does not elaborate).

## Source issues

- **Misprint** in CDN-CURVES at §0.3 (introduction), printed page 13, line 536: the source refers to the symbols–syntomic comparison as prop. 6.24; it should be th. 6.24 (the statement at line 3630 is a Théorème); affects nothing.
- **Misprint** in CDN-STEIN at Proposition 6.1, proof, printed page 44, line 2200: the source writes the decomposition `r = (p−1)a + b` with `0 ≤ b ≤ p−1`, which is not unique (for `p = 2`, `r = 2` both `(a,b) = (2,0)` and `(1,1)` qualify); it should be `0 ≤ b ≤ p−2` (CohomologyComparisonsPartII §4.1 uses `0 ≤ b < p−1`); affects nothing (the rational statement is insensitive to the lattice).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eca65ea", "job": "REV-DESIGN-ProetaleCohomologyOfPAdicCurvesAndTowers", "model": "fable", "worker": "fable-rev183"} -->
