# Review of HodgeTateAndCanonicalSubgroups (pull request #1084 at ed632e6)

**Verdict:** needs changes

The gate fails (`residue=155`, every hit an `<a id="section-k-n"></a>` line), so the folder cannot be accepted at this head whatever else holds. Beyond that there is one blocking finding (supplier labels that do not exist at the supplier's head) and five P3 notes. The mathematics of the 155 targets held up under the adversarial pass: every quantitative range, every lattice and residue computation and every convention witness recomputed as stated, and the sampled locators agree with the texts (one source gap and two source slips recorded under Source issues; the README already states the corrected forms).

## R01 (P2) — ShimuraCompactifications is cited by a `C2`–`C6` label scheme that does not exist at its head

Location: `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md` line 120 (`**`ShimuraCompactifications`.** C2: toroidal compactifications … C6: the Hilbert near-ordinary model`), and the 38 citations `ShimuraCompactifications C4 (semiabelian hasse boundary comparison)` etc. on lines 9, 394, 415, 425, 448, 474, 506, 514, 522, 716, 1151, 1173, 1334, 1663, 1794, 3235.

Claim: the Verschiebung determinant, degeneration data, character sheaves, Tate modules, integral toroidal and minimal models, higher-level normalisation and the Hilbert Hasse boundary objects are supplied by ShimuraCompactifications "C2", "C3", "C4", "C5", "C6" with parenthesised slugs.

Witness: ShimuraCompactifications at #1053 numbers its targets `### k.n` and says so (its README line 202: internal references `k.n` name target `n` of Layer `k`); no heading, label or slug `C2`…`C6` occurs in it. The only `C…` strings there point at ComplexComparisonPartII. The dependency check cannot resolve any of these 38 edges to a target, and a reader of the supplier cannot either.

Repair (every slug has a `### k.n` owner at #1053, verified by heading): C2 (toroidal compactifications / smooth normal crossings) → Layer 2, §2.9; C3 (refinement map) → §4.1; C4 (semi abelian scheme) → §6.1; C4 (constructible character sheaf) → §6.2; C4 (polarized degeneration data) → §6.4; C4 (formal universal degeneration) → §6.7; C4 (homomorphism extension) → §6.8; C4 (extended isogeny kernel) → §6.11; C4 (semiabelian tate module) → §6.14; C4 (semiabelian hasse boundary comparison) → §6.15 `SemiAbelianScheme.hasse_det` (and §6.18 for Frobenius/Verschiebung); C5 (integral toroidal space) → §7.3; C5 (minimal hodge ampleness) → §7.13/§7.17; C5 (integral minimal space) → §7.16; C5 (higher level toroidal normalization) → §7.19; C6 (hilbert hasse boundary comparison) → §8.46 `HilbertModular.hasseIdeal_compare`; C6 (hilbert near ordinary model) → §8.48 `HilbertModular.nearOrdinary_compare`. Rewrite line 120 and the 38 citations with these numbers (the same conversion AutomorphicBundles made in its round-1 repair), then rerun the depcheck.

## R02 (P3) — Gate failure: 155 HTML anchor lines

Location: README line 166 (`<a id="section-0-1"></a>`) and the 154 further anchors, one above every `### k.n` heading.

Claim: the anchors carry the `[k.n](#section-k-n)` links of the `*Needs:*` lines.

Witness: the gate's residue rule counts every `<a id=` line (`residue=155`, all other counters 0). The targets already sit directly under numbered `### k.n` headings, so no renumbering is needed.

Repair: delete the 155 anchor lines and rewrite every `[k.n](#section-k-n)` link (prose and `*Needs:*`) as `§k.n`; the two `[R07.1.24a, …](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#…)` fragment links on line 116 should become plain `R07.1.24a` citations for the same reason. After that the gate is all zeros (I ran the depcheck on the current README: `depcheck: 205 roadmaps, 1437 edges, 0 problem(s)`).

## R03 (P3) — AutomorphicBundles and three other suppliers are cited by retired labels or by slugs with no heading

Location: README lines 11, 125, 130 (contract), and citations `AutomorphicBundles B0 / B0.3 / B1 / B2 / B2.general / B3.7 / B3.general / B3.general.2 / B3.HT.1 / B3.HT.7 / B3.log.1–B3.log.3` on lines 780, 1005, 1028, 1047, 1072, 1119, 1143, 2351, 2756, 2778, 2808, 2837, 2865, 2904, 3128, 3141, 3179, 3235, 3253, 3306, 3323, 3349, 3375, 3392.

Claim: the horizontal log sites, period sheaves, unipotent comparison, Hodge tensor realizations, frame torsors and the rational HT Levi torsor are B3.log.1–3, B1, B3.HT.7 etc.

Witness: AutomorphicBundles at #1069 is numbered Layers 0–12 and its README lines 216–222 carry a concordance (B0 = Layer 0, B1 = Layer 1, B2 = Layer 3, B2.general = Layer 4, B3 = Layer 5, B3.general = Layer 6, B3.log = Layer 8, B3.HT = Layer 10). The declarations are where that concordance says: `horizontalLogSites` §8.1 (line 2654), `canonicalKummerCoefficient` §8.2 (2728), `unipotentLogPeriodComparison_poincare/_associated/_tensor/_graded` §8.3 (2827–2833), `siegelCanonicalSubgroups` §10.1 (3243), `rationalHTLeviTorsor` §10.7 (3647), the Hodge/opposite dictionary §0.3 (493). The worker's resolver already flags `B3.log.1` and `B0.3` as absent. The slug "automorphic vector bundles from representations of the centralizer" (lines 1047, 1119) matches no heading of Layer 3.

Repair: B0 → Layer 0, B0.3 → §0.3, B1 (absolute hodge propagation / hodge tensor realizations / tensor frame torsor / filtration reduction) → §§1.2–1.5, B2 → Layer 3, B2.general → Layer 4, B3.7 → §5.7, B3.general → Layer 6 (B3.general.2 → §6.3), B3.log.1/2/3 → §§8.1/8.2/8.3, B3.HT.1 → §10.1, B3.HT.7 → §10.7. Three further slugs resolve only by nearest heading and should name it: AbelianSchemesAndArithmeticModuli "A4 (p divisible group)" is §A4.5 (Barsotti–Tate groups), not A4.2 (universal vector extension) as line 118 suggests; NeronModelsAndSemistableAbelianVarieties "rigid uniformisation" is §3.14 (polarised uniformisation); ShimuraVarieties "minimal map extension" and "abelian instance" are §8.19 and §8.8.

## R04 (P3) — Declaration names attributed to PrismaticCohomologyPartIV §8.60 do not exist there

Location: README lines 9 and 131 (`NoetherianFsLogAdicSpace.kummerSite`, `.kummerTopology`, `.LocalSystem`, `.trivialLogSite`, `.inertiaExterior`), 1802 (`TauCeti.LogAdic.LogStructure`, `.logification`, `.logPullback`, `.IntegralChart`), 2092 and 2170 (`TauCeti.LogAdic.KummerEtaleSite`), 2213.

Claim: these are supplied declarations of PrismaticCohomologyPartIV §8.60.

Witness: §8.60 at #1080 (its README lines 1323–1345) is a prose target with six bullets (the Kummer-étale category, its jointly surjective topology, finite locally free Λ-sheaves, derived Kummer cohomology, the trivial-log comparison, the exterior formula for `R^iε_*(ℤ/n)`); it declares no Lean name, and none of the nine names above occurs anywhere in that README. The mathematics is supplied, the names are this roadmap's invention.

Repair: cite §8.60's bullets by description ("§8.60's Kummer-étale site and topology", "§8.60's finite locally free Λ-sheaves", "§8.60's exterior higher-direct-image formula") and drop the nine names, or keep them only as this roadmap's own aliases introduced in 6.0/6.12/6.15/6.17 with "alias of" wording, never as the supplier's.

## R05 (P3) — Catalogue residue and garbled code spans

Location: the 17 orphan lines `Uses \`…\`.` (lines 335, 626, 656, 674, 808, 828, 1197, 1326, 1433, 1463, 2252, 2475, 2707, 2873, 2891, 3018, 3149); garbled spans at lines 290 (`0.\`9/0\`.26`), 1138 (`degree \`0) P(φ) = Aut^⊗(forg∘φ\`)`), 1332 (`p.11 \`(\`Hilbert_adicfinal.pdf\`)\``), 2871 (`Lemmas 2.3.\`7/2\`.3.12`), 2925 (`6.\`15/6\`.23`); dangling enumerations "(3)" at line 814 and "(1)", "(2)" at lines 1788–1790, 2239–2240 that refer to no numbered clause.

Claim: none; these are leftovers of the catalogue-to-prose port.

Witness: `Uses \`Q_i\`.` (line 335) names a symbol that occurs nowhere else in 0.8; `Uses \`OnePoint.instGLAction\`, \`OnePoint.smul_some_eq_ite\`.` (line 1433) names two Mathlib declarations that do exist at the pin (`Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean` lines 125 and 148) and belong in 4.4's `*Needs:*` line, not in an orphan sentence.

Repair: delete the 17 `Uses` lines (move the two Mathlib names into 4.4's Needs), fix the five spans (`0.9/0.26`, `(concentrated in degree 0) \`P(φ) = Aut^⊗(forg∘φ)\``, `p. 11`, `Lemmas 2.3.7/2.3.12`, `6.15/6.23`), and either number the clauses the "(1)/(2)/(3)" refer to or drop the numerals.

## R06 (P3) — Duplicated Checks and Sources, and a missing shape heading

Location: Checks restated twice in 0.1 (lines 182–184 and 186–188), 0.2 (211–212 and 215), 0.4 (257–258 and 261), 0.6, 0.9, 0.13, 0.14, 2.9 (the modular-curve Levi check appears verbatim at lines 1021 and 1024); Sources lines that repeat the same locator twice: 472 (`§3.2.1, before Lem. 3.2.5, p. 33; §3.2.1, before Lem. 3.2.5, p. 33`), 1498, 1683, 1707, 3277, 3304, 3347, 3373; the front matter has `## Internal build order` (line 143) and `## Suggested signatures` (line 160) but no `## How to read the build`.

Claim: none (style).

Witness: line 1021 and line 1024 are character-for-character equal.

Repair: keep one copy of each Check and locator; rename line 143's section `## How to read the build` and fold the build-order table and the two following paragraphs into it (the Suggested-signatures paragraph can stay as its last paragraph).

## Verified sound

**Gate and order.** Gate at ed632e6: every counter 0 except `residue=155` (anchors, R02); `build=0` with `sorry` the only warning. Depcheck on the current README, run with the order file and `--movable`:

```
depcheck: 205 roadmaps, 1437 edges, 0 problem(s)
```

No UPWARD or CYCLE line; HodgeTateAndCanonicalSubgroups sits at line 164 of the merge order, after CohomologyComparisons (161) and AutomorphicBundles (163) and before its consumers PerfectoidShimuraVarieties (165) and OverconvergentAutomorphicForms (234), which are named only in Scope/Downstream, never in a `*Needs:*` line. Internal build order: I traced every intra-layer `*Needs:*` edge in Layers 0–7 (0.4←0.25←0.24, 2.8/2.9/2.11←2.14, 3.6←3.5←0.28, 4.6←4.7←4.8←3.9, 5.4←5.9←5.3, 6.5←6.7←6.6, 7.20←7.19←7.18←7.12←7.9←7.8←6.30) and found no cycle; the eight-batch Layer 0 table on lines 147–156 agrees with the Needs lines.

**Lean.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` for both declarations and the five library carriers: only the `sorry` warning. `characterDifferentialSpan R A : Submodule R (TauCeti.Bialgebra.CotangentSpace R A)` with `[Bialgebra R A]`; `farguesHodgeTateCokernel_finite` elaborates to exactly the README's 0.5 finite-flat clause (C complete algebraically closed ultrametric of characteristic 0 with `‖p‖<1`; A a finite projective cocommutative Hopf algebra over the valuation subring of rank `p^n`; `‖a‖^(p−1) ≤ ‖p‖` is `v(a) ≥ 1/(p−1)`; conclusion `a • x ∈ span{cotangentMap g : g group-like}`). No section binder is lost (the normed-field instances and `p` appear in the type). Library carriers at the pin: `TauCeti.Bialgebra.CotangentSpace`, `TauCeti.Bialgebra.cotangentMap : A →ₗ[R] CotangentSpace R A` (`TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`), `GroupLike`, `Coalgebra.IsCocomm` (`Mathlib/RingTheory/Coalgebra/GroupLike.lean`), `NormedField.valuation : Valuation K NNReal`, `OnePoint.instGLAction`/`smul_some_eq_ite` (`Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean:125,148`). One-tactic probe (`first | rfl | simp | infer_instance | exact Submodule.smul_mem _ _ (Submodule.mem_span_of_mem _)` in place of the `sorry`): unsolved goals, so the theorem is not padding. Mathematics of the statement: group-likes of the coordinate ring of H are the `O_C`-points of `H^D`, their classes `[g−1]` are `α_{H^D}`, so the statement is Fargues's finite-flat cokernel bound for `α_{H^D}` with `H^D` ranging over all finite flat `p`-power groups; FAR11 Thm 3 (2424f3b2 line 1307) states it for every finite flat `G/O_K` with no `p≠2` restriction, and Thm 2 (line 1268) the `p`-divisible form.

**Headline theorems.** From the README: (1) Fargues's cokernel bound 0.5 — stated; (2) Harder–Narasimhan filtration 0.19; (3) canonical-subgroup theorem 3.6; (4) BHW period inclusions 4.6; (5) open-tower `π_HT` 2.12; (6) AIP torsor comparison 5.12; (7) log primitive comparison 7.3, log Riemann–Hilbert 7.20 and 7.27; (8) finite-level package 8.1. The module docstring names (2)–(8) and what each lacks. (2) would need closed finite flat subgroup schemes of a Hopf algebra (Hopf ideals with projective quotients), degrees and slopes, which are constructions, not a few simple definitions, at the pins (`HopfAlgebra` has no quotient-by-Hopf-ideal API there); I agree it is not statable. No padding.

**Sampled locators (all read at the locator).** 0.20: FAR10 (67b58427) Prop. 1 line 234, p. 5 — codifferent invertible with inverse `D_{B/A} = Δ_{B/A}` for finite syntomic B étale off `V(t)`, t regular; Def. 3 line 313, p. 7 — `δ_G = Fitt₀ ω_G`, `Δ_{G/S} = f*δ_G`; Lemmas 1–2 lines 352–361 (additivity, `δ_G + δ_{G^D} = div|G|`). 1.1: CS17 (aa93df39) Thm 2.2.2 line 602 (locally free `R^iπ_*𝔽_p`, verified when algebraizable, footnote line 623), Prop. 2.2.3 line 617 (`M`, `M₀`, `(M∩Fil^jM₀)/(M∩Fil^{j+1}M₀) = Fil^{−j}⊗Ô(j)`), relative HT filtration line 633 `Fil_{−j} = (M∩Fil^jM₀)/(Fil¹M∩Fil^jM₀)`, Cor. 2.2.4 line 636 — all as restated in 1.1–1.2 and Conventions line 42. 1.5: CDM12 (85a0b85e) Prop. 4.15 line 1068 — the two HT sequences of `A/O_C` are dual; SCH13 (ed9187b3) Prop. 6.16(ii) line 1797 — `H⁰(X,gr^iOB_dR)=0` for `i≠0`, the vanishing 1.5 uses. 3.2: SCH15 (e15abf4e) Cor. III.2.2 line 1078, p. 32 — R p-adically complete flat `ℤ_p^cycl`-algebra, `0 ≤ ε < 1/2`, `C ⊗ R/p^{1−ε} = C₁ ⊗ R/p^{1−ε}`: identical hypotheses and conclusion. 3.3: Lemma III.2.4 line 1105 — `Ω¹` killed by `p^ε`, sections equal mod `p^δ`, `δ > ε`; 3.3 generalises the base to a rank-one valuation ring, which the proof (principal homogeneous spaces of lifts, lines 1108–1118) supports. 3.4: Cor. III.2.6 line 1133 (`Ha(A₁)^{S_m} | p^ε`, `ε<1/2`, uniqueness, points formula), Def. III.2.7 line 1167 (weak vs strong: `Ha^{p^m} | p^ε`), Prop. III.2.8 line 1177 ((i) levels, (ii) functoriality, (iii) quotient, (iv) `C_m(x̄) ≅ (ℤ/p^m)^g`) — 3.4/3.7/3.8(1) restate them with the strong hypothesis where Scholze needs it. 4.6: BHW arXiv v4 (8ee48970) Prop. 5.18 line 1147, p. 24 and Prop. 5.19 line 1152; proof line 1165–1200 (claim with `x = n − p^nε/(p−1)`, `y = n − δ`, `δ = S_nε`, cokernel degree `ε/(p−1)`): 4.6–4.8 follow it line by line; the inclusive endpoints of the source are the Source issue below, and the README's strict ranges are FAR11 Thm 6 line 2035 (`Ha(G) < 1/(2p^{n−1})`, `< 1/3^n` for p=3) and AIP15 (546120d2) Thm 3.1.1 line 479. 5.7: PIL20 (4c05724e) §12.7.1 line 3550, p. 77 — `ω^{mod,+}` the `O⁺`-subsheaf generated by HT images, étale not analytic (Rem. 12.7.1.1 line 3575), pullback to `X(p^n)` Zariski for `n ≥ 1` (`n ≥ 2` at p=2, excluded by the README's `p ≥ 3`). 5.10: BHW Prop. 7.11 line 1448, p. 30 — `s` factors through `F_m(ε)` for `0 ≤ ε ≤ ε_m^can` via `φ` and Cor. 7.6; Def. 7.3/Prop. 7.4/Def. 7.5 lines 1386–1407 give 5.3/5.4/5.8 verbatim (`I_m = p^mHdg^{−S_m}`, `I′_m = p^mHdg^{−p^m/(p−1)}`, `B_m`, open immersion, bound (7.1) with `x = m − εp^m/(p−1)`). 6.0: DLLZ-adic (209e5983) Conv. 2.2.1 line 338, Def. 2.2.2 line 342 (log structure, associated log structure as pushout, pullback, strict, exact), Rem. 2.2.3 line 384 (adjunction), Def. 2.3.1 line 580 (chart with `α(θ(P)) ⊂ O⁺`), Def. 2.3.5 line 625 (fs = étale-local fs charts). 6.5: Example 2.3.16 line 758 — normal rigid X, Cartier D, `M_X` = functions invertible off D, fs, `X−D` the maximal trivial open. 6.11: Def. 3.3.19 line 1999 (`Ω^{log,a} = ∧^a` for log smooth); DLLZ-RH (dccd18f6) Def. 3.1.7(4) line 1102 (k-linear coherent log connection, transversal filtration), (3.4.1) line 1537 (`Res_Z(∇) = ∇(T₁∂/∂T₁) mod T₁`), Thm 3.2.3(4) line 1159 (multiplicities `m_{WZ}`, `n_Z`). 7.4: DLLZ-adic Thm 6.2.1 line 4237, p. 85, consequences lines 4246–4248 (finite-dimensional, zero for `i ≫ 0`, `i > 2dim X` for normal-crossings X), Rem. 6.2.2 line 4249 (the disc), Cor. 6.2.3 line 4253 whose resolution-of-singularities input the README avoids by assuming the compactification. 7.9: DLLZ-RH (2.2.8) line 596 (`S_{i,r}`), (2.2.9) line 601 (`θ_log(e_a)=1`), `Ŝ_i` line 604, Def. 2.2.10(1) line 607, Rem. 2.2.12 line 629. 7.10: Def. 2.2.10(2)–(3) lines 610–615 (filtration completion, `Fil^r OB_dR,log = lim_s Fil^r/Fil^{r+s}`, `OC_log = gr⁰`), the ring remark line 617, Rem. 2.2.11 line 619. Also checked: 7.11 ↔ (2.2.13)–(2.2.17) lines 636–652; 7.31–7.35 ↔ BPC25 (d340c9a0) Rem. 4.4.39 and following lines 3736–3764 (`M`, `M⁰`, `Fil_{−j}`, `Gr_j(j) = Gr^jW_dR⊗Ô`, `P^{c,an}_µ` vs `P^{std,c,an}_µ`, `M_HT = M_dR ×^{µ,ℤ_p×} ℤ_p(1)`); 2.3 ↔ ECD (78ca42bb) Lemma 11.22 line 2606; 2.10 ↔ CS17 Prop. 2.3.9 line 919; 3.5/3.6 ↔ FAR11 Thm 5 line 2001 and Thm 6 (1)–(7) lines 2039–2052; 3.9 ↔ AIP15 Prop. 3.2.1 line 556 (cokernel of degree `v/(p−1)`); 4.2/4.3 ↔ SCH15 Thm III.2.15(ii)–(iii) lines 1408–1429; 0.19 ↔ FAR10 Thm 2 line 671.

**Supplier citations resolved (heads of 2026-10-31).** FiniteFlatGroupsAndIntegralPadicHodgeTheory #879: R07.1.1 (l.592), R07.1.3 finite part (730), R07.1.5 (862), R07.1.7 Cartier dual (947), R07.1.8 Tate module (989), R07.1.10 (1075), R07.1.11 (1108), R07.1.14 (1248), R07.1.15 (1278), R07.1.19 Hodge–Tate decomposition (1699), R07.1.20a (1781), R07.1.24a with `FiniteFlat.points` and `GaloisModel` (1977–1999), R07.1.34 Oort–Tate (2429), R07.1.40 Raynaud embedding (2637), R07.2 (3061), R07.2.21 (3831), R07.6.6 (8525). CohomologyComparisons #1064: §0.4 (142), §2.15 (453), §6.1 (1111), §6.2 with `smallHasseCanonicalSubgroups` (1153–1155); the ownership split (CC owns the cyclotomic-base family subgroups, this roadmap the pointwise HN subgroups and the 3.6 identification) is the one recorded in the CohomologyComparisons review. PadicHodgeTheory #1062: §§2.1–2.4 (455–529), §2.7 (600), §§7.1–7.3 (1226–1279, relative HT filtration inside §7.3 at 1299), §8.3 (1428). ShimuraData #1038: §3.7 `filtrationParabolic = P(µ_h⁻¹)` (506), §3.8 `parabolicTypeVariety` (529–535), §3.9 `reflexFlagDescent` of type `P(µ⁻¹)` (559) — so 2.14's claim that §3.9 supplies the opposite type and this roadmap must descend `P(µ)` separately is correct. ShimuraVarieties #933 Layers 1 (334) and 8 (2201–2645); PELModuli #966 M0 (424: M0.4/M0.5/M0.18) and M1 (1549); HilbertModularVarietiesAndShimuraCurves #1005 H2.7/H2.8 (691/714), H4.1/H4.3/H4.4/H4.8 (927–1061); NeronModels #852 Layer 3 (1353: 3.1, 3.10, 3.13 `RaynaudExtensionComparison`, 3.14); AbelianSchemes #849 A2 (1042), A2.6 (1231), A3 (1381), A3.5 (1511), A3.7 (1629), A4 (1811), A4.2 (1852), A4.3 (1900), A4.5 (1996); AlgebraicModuli #853 §1.3 with `flagBundle`/`coherentGrassmannian` (602–678); DiamondsAndVStacks #820 D0–D6 and D2.9 (973–9036); DiamondEtaleCohomology #922 C5 (1420), C7 (1638); ClassicalAdicEtaleCohomology #875 §§1.1–1.4, 8.2, 11.1–11.2 (92–5636); CrystallineCohomology #857 CR.5:log-algebra (7597) and CR.5 (8458); PrismaticCohomologyPartIV #1080 §8.60 (1323, R04); AutomorphicBundles #1069 (R03). On main: AdicSpaces (`Completed/AdicSpaces`, Huber pairs §2.1), AdicSpacesPartII R0/R1/R1.9, AdicSpacesPartIII F0/R2/R2.2/R2.10/R3.1–R3.8, AdicSpacesPartIV R4.7, AdicEtaleGeometry A1/A1.6/A1.6a/A1.11–A1.12/A4, PerfectoidSpaces P0/P1/P3/P5.3, EnhancedDerivedSheaves E1/E2, DerivedModuleAlgebra §§0.4–0.8, 0.10, 0.13, 0.25, ModularCurves 0B/0G, ReductiveGroups Layers 1/3/7/8 — all present as cited. Ownership against open pull requests was checked for the canonical subgroups (CC §6.2 owner, AutomorphicBundles §10.1 a consumer), the HT Levi torsor (AutomorphicBundles §10.7 owner, 2.10/7.35 import it), the log sites and periods (AutomorphicBundles §§8.1–8.3 own the smooth-proper-SNC-over-finite-k range, Layers 6–7 extend and identify), the Hodge parabolic type (ShimuraData §3.9 owns `P(µ⁻¹)`, 2.14 owns `P(µ)`), Fitting ideals and conormal (Tau Ceti, cited), and the Verschiebung determinant (ShimuraCompactifications §6.15). No second owner found; PerfectoidShimuraVarieties #1085 and OverconvergentAutomorphicForms #1422 consume, they do not rebuild.

**Adversarial pass.** One row per statement checked, with the values.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 `ω_{μ_{p^n}}` | `R[t]/(t^{p^n}−1)`, `I=(t−1)` | `I/I² = R/(p^n)` since `t^{p^n}−1 ≡ p^n(t−1) mod I²`; `ω_{ℤ/p^n}=0`; `ω_{α_p}` over `𝔽_p` = `𝔽_p` | holds |
| 0.5 Lean form, `n=0` | `A=𝒪` | cotangent space 0, statement trivial; `p=2`: `‖a‖ ≤ ‖2‖` = `v(a) ≥ 1 = 1/(p−1)` | holds |
| 0.5 finite-flat reduction | `0→H→G→G′→0` | `0→T_pG→T_pG′→H(C)→0` exact, `H^D ⊂ G′^D` closed so `ω_{G′^D}↠ω_{H^D}` | holds |
| 0.6 Check: supersingular `E[p]` subgroups | `[p](T)=pT+…+uT^{p²}`, inner coefficients `≡0 mod p` | Newton polygon slope `1/(p²−1)` for all `p²−1` roots; `deg=(p−1)/(p²−1)=1/(p+1)` | holds |
| 0.7 duality | `μ_p`, `E[p]` supersingular | `1+0=1`; `1+1=2` | holds |
| 0.8 formula | `ℤ/p→μ_p` over `ℤ_p[ζ_p]`, `1↦ζ_p` | Vandermonde `∏_{i<j}(ζ^i−ζ^j)` has valuation `p(p−1)/2·1/(p−1)=p/2`; `(2/p)(p/2)=1=deg μ_p−deg ℤ/p` | holds |
| 0.9 constant-degree iff | `Spf ℤ_p⟨T⟩`, `D_H=V(T)` | not vertical, excluded by "étale generic fibre" (support of `D_H` in the special fibre); `Spf ℤ_p[p^{1/2}]`: `2D_H=V(p)`, degree `1/2` | holds with the stated hypothesis |
| 0.9 Check p=2 irrational degree | `H=Spec R[x]/(x²−ax)`, `Δx=x⊗1+1⊗x−bx⊗x`, `ab=2` | Oort–Tate with `v(a)=r` irrational; `I/I²=R/(a)`, `deg=r`; `nr=m` impossible | holds |
| 0.10 Tate curve isogeny | `Tate(q)→Tate(q^{1/p})` by `id_{𝔾_m}` | kernel `⟨q^{1/p}⟩≅ℤ/p` étale, `Lie f = id`, `D_f=0`, kernel not finite over `q^{1/p}=0` | holds |
| 0.19 slopes | `E/O_C`, `w=Ha(E)` | `w<p/(p+1)`: degrees `1−w` (canonical) and `w/p` (others); `w≥p/(p+1)`: all `1/(p+1)`; semistable iff `max ≤ 1/2` iff `w ≥ 1/2` (`w/p ≤ 1/2` for all p since `w≤1`) | holds |
| 0.24 degree not injective | `V/p⊕V/p`, `V/p²` | `Fitt₀=(p²)` both, `Fitt₁=(p)` vs `V` | holds |
| 0.26 co-Lie of `μ_{p^n}` | `R=𝔽_p` | `[𝔽_p →^{0} 𝔽_p]`: `H⁰=H^{−1}=𝔽_p` | holds |
| 0.28 quotient | `H=μ_{p^∞}⊕ℚ_p/ℤ_p`, `D=μ_p` | `p^{−1}D/D` height 2, dim 1 | holds |
| 1.1 twists | `V=R¹f_*ℚ_p` at a point | `Hom(T_pA,ℚ_p)=T_pA^∨(−1)` via Weil pairing; `T_pA^∨=H¹_ét(1)` | holds |
| 1.2 filtration | CS17 formula | `F_{−j}=(M∩t^jM₀)/(tM∩t^jM₀)` = source line 633 | holds |
| 1.4 degeneration | abelian `A`, `g` | `dim E₂^{1,0}=dim E₂^{0,1}=g`, `dim H¹=2g` forces `d₂=0`; `X=Spa C`: all terms 0; `ℙ¹`: `H¹=0`, `H⁰(Ω¹)=0` | holds |
| 1.4 integral defect | supersingular `E` | cokernel of `HT⊗1` on `E[p]` has degree `w/(p−1)>0` (AIP15 Prop 3.2.1) | holds |
| 2.1 components / degree | `GL₂`, `K(N)^p`, `N≥3` | `π₀=(ℤ/Np^m)^×` via det; `[K(p^m):K(p^{m+1})]=|M₂(𝔽_p)|=p⁴` | holds |
| 2.2 centre test | `z=p·1`, `K(N)^p` | `[x,a·p_p]=[x,a·(p^{−1})^{(p)}]`; identity iff `p^{−1}∈K(N)^p` iff `p≡1 mod N` | holds |
| 2.2 `𝔾_m` datum | `K^p=Ẑ^{p×}`, `K′_p=1+pℤ_p`, `p` odd | `ℚ^×\𝔸_f^×/K^pK′_p = ℤ_p^×/(±1·(1+pℤ_p)) = 𝔽_p^×/±1`; kernel of `𝔽_p^×` action `{±1}` | holds |
| 2.3 `𝔾_m` limit | same datum | `lim = Ẑ^×/(±1·Ẑ^{p×}) = ℤ_p^×/±1`; `p` acts trivially (unit at `ℓ≠p`) so through `ℚ_p^×/±p^ℤ` | holds |
| 2.3 spatial / homeo | ECD Lemma 11.22 | limit of locally spatial diamonds with qcqs transitions is locally spatial, `|Y|≅lim|Y_i|` | holds |
| 2.7 chart action | `g=1`, `γ=(1 0;1 1)` | `z↦z/(z+1)`: `0↦0`, `−1↦∞`, image meets both standard charts | holds |
| 2.14 Euler sequence | `ℙ¹`, `O(−1)⊂O²` | `Ext¹(O(1),O(−1))=H¹(O(−2))=k`, `O²≇O(−1)⊕O(1)` | holds |
| 2.14 unitary `(1,2)` | `µ=diag(t,1,1)` | `P(µ)`: `g_{i1}=0`, stabiliser of the line `e_1`; `P(µ^{−1})`: `g_{1j}=0`, stabiliser of the plane | holds |
| 3.1 truncation | `v(Ha)=1/3` | height `1/3∈(0,1)`; uniformiser `→1` | holds |
| 3.4 ranges | `p=2,n=2`: `S_2=3` | `w=1/6`: `S_2w=1/2` not `<1/2`; `w=1/16`: `4/16<1/2` | holds |
| 3.4 degree | `m=1`, `g=1` | `deg C₁=1−w`, `deg(E[p]/C₁)=w` (FAR11 Thm 6(2)) | holds |
| 3.5 heights | `p=5` | `w=1/10<1/6`: `Ha(E)=pw=1/2`; `w=1/6`: `min(Ha(E),5/6)=5/6` | holds |
| 3.6 overlap | `p=5,n=2` | `w=1/12<1/10` HN range, `S_2w=1/2` outside weak range; `w=1/20,ε=2/5`: `1/4≤3/10≤2/5` | holds |
| 3.7 Check | `p=2,m=2,w=1/7` | weak `3/7<1/2`, strong `4/7≥1/2` | holds |
| 3.8 Hasse radius | `p≥5`, `Ha(E)=1/(2p)` | `Ha(E/C₁)=1/2`, `Ha(E/D)=1/(2p²)` | holds |
| 4.3 radii | `X_{Γ₀(p^n)}(p^nε)_a→X(ε)` | dividing by anticanonical `D` divides `v(Ha)` by `p^n`; needs `p^nε<1/2` for `C_n` to exist (SCH15 III.2.15(ii)) | holds |
| 4.4 cocycle | `γ=(1 0;c 1)`, `δ=(1 0;c′ 1)` | `j(γδ)=(c+c′)z+1 = (cz/(c′z+1)+1)(c′z+1)` | holds |
| 4.4 order | `g=(1 1;0 1)`, `h=(1 0;1 1)` | `gh=(2 1;1 1)`, `hg=(1 1;1 2)` | holds |
| 4.5 disjointness | `F=ℚ`, `r<1` | `B_r(1:pℤ_p)` has `|z|>1`, `B_r(ℤ_p:1)` has `|z|≤1`; at `r=1` both contain `z=1` | holds |
| 4.6 endpoints | `p=2,n=1`: `1/4` ok, `1/3` no; `p=5,n=1`: `1/3` ok, `1/2` no; `p=3,n=1`: `1/4` ok, `1/3` no | matches FAR11/AIP15 strict and HALO inclusive | holds |
| 4.6 radius | `p≥5,m=1,r=1/p,ε=1/(4p)` | `x=2−p/(4(p−1))≥27/16>1=m` so `|p^x|≤r`; in general `p^{m+1}ε/(p−1)<p/(2(p−1))≤1` | holds |
| 4.8 precision | `δ=S_nw`, `y=n−δ` | `y−w/(p−1)=n−w(p^n−1+1)/(p−1)=n−p^nw/(p−1)` | holds |
| 5.3/5.4 ideals | `Hdg_T^{p−1}=Hdg` | `I_m=p^mHdg^{−S_m}=p^mHdg_T^{−(p^m−1)}`, `I′_m=p^mHdg^{−p^m/(p−1)}=p^mHdg_T^{−p^m}`; `I′₁=p^{1−pw/(p−1)}` | holds |
| 5.3/5.5/5.7 colength | rank-one point, `F=ℚ` | `ω⁺/ω^int≅O_C/p^{w/(p−1)}` (cokernel degree `w/(p−1)`) | holds |
| 5.8 exponent | `x=m−εp^m/(p−1)` | `p=2,ε=1/8`: `3/4`; `p=3,ε=1/9`: `5/6`; `ε=0`: `1` | holds |
| 5.12 domains | `p=5,m=1,ε=1/25,n=2` | `ε≤p^{−2}` holds, `p^nε=1≥1/2` excluded; `u_n`: `diag(p^n,1)^∨=diag(1,p^n)` | holds |
| 6.2 nonintegral chart | `P=⟨u,e|u²=1,ue=e⟩`, `u↦−1`, `e↦0` | `N=C^×⊔⊔_{k≥1}(C^×/±1)e^k`, `(v,n)` and `(−v,n)` same image, `N̄≅ℕ≅M̄` | holds |
| 6.2 diagonal | `D→D²` | `ℕ²→ℕ`, preimage of `ℕ` in `ℤ²` is `{a+b≥0}≠ℕ²` | holds |
| 6.3 idempotent | `ℚ₂[C₂]`, `e=(1+u)/2` | `e²=(2+2u)/4=e`, coefficients `1/2∉ℤ₂` | holds |
| 6.6 saturated pushout | `ℕ⊕_ℕℕ`, maps `×n` | group `ℤ²/(n,−n)=ℤ⊕ℤ/n`, saturation `ℕ⊕ℤ/n`: `n` copies | holds |
| 6.13/6.14 indices | `P=ℕ^r`, root `n` | degree `n^r`, Galois `μ_n^r`; index at `s` vanishing coordinates `n` (cokernel `(ℤ/n)^s`), not `n^s` | holds |
| 6.17 log point | characteristic `ℕ²` | `∧^i(ℤ/n)²`: ranks 1,2,1 | holds |
| 6.20 punctured disc | `L=ℤ/n` | `R¹j_{ét,*}=ℤ/n(−1)` at 0, `R¹j_{két,*}=0` | holds |
| 6.26 characters | `P=ℕ` | `e^{1/2}` in the order-2 summand; invariants `k⁺[ℕ]` | holds |
| 6.31 `R¹lim` | `ℤ` with `×p` | `lim=0`, `R¹lim=ℤ_p/ℤ≠0`; `ℤ/p^i`: `ℤ_p`, `R¹=0` | holds |
| 7.1 trivial character | `Γ=Ẑ(1)^r` trivial action on `(k⁺/p)[P]` | `H^i=(k⁺/p)[P]^{C(r,i)}` | holds |
| 7.17 Higgs twist | `∇⁺=t∇`, `σ(t)=χ(σ)t` | `∇⁺(σe)=χ(σ)^{−1}σ(∇⁺e)` so `θ` lands in `Ω(−1)` | holds |
| 7.20/7.25/7.26 residues | characters `2/3`, `3/4` | `4/3→1/3`, `3/2→1/2`; `m_{WZ}=2`: pulled back `4/3` vs `1/3` | holds |
| 7.24 Tate | `L=ℚ_p(m)` | `D_dR=O·(e_m⊗t^{−m})`, only `gr^{−m}` | holds |
| 7.31 lattices | `M=Ae`, `M⁰=t^aAe` | `Fil^iM⁰=Fil^{a+i}M`, `M∩Fil^jM⁰=t^{max(0,a+j)}Ae` | holds |
| 7.32 jumps | `M⁰=t^aM` | `F_{−j}` full iff `a+j≤0`: `F_i` full for `i≥a`; Tate line `a=−1`: `F_{−2}=0`, `F_{−1}=Ô(1)`, `Gr_{−1}(−1)=Ô=Gr^{−1}W_dR⊗Ô` | holds |
| 7.34/7.35 convention | `Fil_i=⊕_{w≥−i}`, weight `w↔F_{−w}`, twist `Ô(w)` | Siegel: weight 1 Lagrangian = `Fil_{−1}` ↦ `Lie(A)⊗Ô(1)`; matches 2.10 (`Ô(a)`), 2.13, 7.32 `siegel_h1`, BPC25 line 3750 | consistent |
| 2.14 vs ShimuraData | `P(µ)` vs `P(µ⁻¹)` | SD §3.7: `P_h=P(µ_h⁻¹)` (limit `t→0`); 2.14 owns `Par_{type P(µ)}` | consistent, no double owner |
| 5.2 Igusa action | `diag(a,d)` | `γ^∨=det(γ)γ^{−1}=diag(d,a)`, `α′(e₁)=d·α(e₁)`, `ψ↦dψ` | holds |

Vacuity and context: every `sorry`'d Lean statement carries its standing hypotheses in its own signature; the README's statements quantified over arbitrary data (3.2's `C₁`, 3.5's `C`, 7.19's `L`) carry the tying hypothesis (homotopy on the co-Lie complex, Frobenius congruence, Kummer local system on the given pair). Generality: README and Lean agree (general complete algebraically closed `C`, not `ℂ_p`; finite projective Hopf algebras, not a discrete-valuation base). Unused hypotheses: none found that an instance separates. Duplication by object: conormal, Fitting ideal, group-likes, Grassmannian, `B_dR⁺`, `fontaineThetaInvertP` are cited from the pins, not restated; the Fargues degree (valuation of a principal Fitting ideal over a nondiscrete valuation ring) is absent at the pins and is 0.24.

## Not verifiable

- HALO author copy (`Halo_spectral.pdf`, Concordia host): timed out on three attempts, and Pilloni's page returns 404. I read the published version instead (Ann. Sci. ÉNS 51 (2018), Numdam, cache 38dc61c1, Appendice A at lines 1952–2190): Prop. A.1 (lifting with `p = ε²u`, `u` topologically nilpotent), Lemme A.2 (sections agreeing mod `a` agree mod `a²ε⁻¹`) and Cor. A.1 (canonical subgroup `H_m` with `ε ∈ Ha^{S_m}`, Frobenius reduction, points formula, `det ω_{L_m}`) carry the content cited in 3.2, 3.3, 3.9 and 3.10, but the author copy's numbering (Cor. A.2(1)–(6), Props. A.2–A.3, pp. 37–41) could not be matched item by item.
- ZIE is cited as arXiv 1111.1981v2 (SHA 7e553f59); the service returns v4 (742e6ecb), whose theorem numbers differ. Thm 3.52 / Thms 3.14–3.15 / Lem 3.23 of v2 were not checked.
- Sources outside the sample that I did not open at the locator: PS16, BP26, BCGP21, MILNE-SV, AIPH, SW13 Prop. 5.1.6, Scholze–Weinstein Berkeley lectures (7.6), Ogus (6.2), Conrad's Luminy notes (2.14).

## Source issues

- **Gap** in BHW at Prop. 5.19 (and Prop. 5.18), printed p. 24 (arXiv v4 lines 1147–1155; published AIF lines 1639–1651): the canonical-subgroup and period ranges are stated with inclusive endpoints `ε ≤ 1/(2p^{n−1})` for `p ≥ 5` and `ε ≤ 1/(3p^{n−1})` for `p = 3`, citing AIP15 Thm 3.1.1; that theorem and Fargues 2011 Thm 6 require strict inequality; it should read `<` for `p ≥ 3` (the `p = 2` endpoint from HALO is inclusive); affects a stated result (the endpoint cases).
- **Misprint** in BHW at Prop. 7.11, p. 30 (lines 1457 and 1462): the diagram writes `H_n → A[p^m]` and `(1,0) mod p^n` in a level-`m` statement; it should be `H_m` and `mod p^m`; affects nothing.
- **Error** in SCH15 at Cor. III.2.6, p. 33 (arXiv v2 line 1140): the points formula `C_m(R′) = {s : s ≡ 0 mod p^{(1−ε)/p^m}}` is asserted for every `p`-adically complete flat `ℤ_p^cycl`-algebra `R′`; it fails when `R′` is not integrally closed in `R′[1/p]` (`p = 2`, `R′ = {(a,b) ∈ O_C² : a ≡ b mod 2}`, `s = (−1,1) ∈ C₁(R′)`); it should assert `⊇`, with equality for `R′` integrally closed; affects a stated result (the README states the corrected form).
