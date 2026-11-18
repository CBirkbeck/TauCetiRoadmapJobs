# Review of SmallRamificationAndAbelianVarietyBaseCases (pull request #2517 at 31d7cdb)

**Verdict:** accepted

**Summary.** Accepted: no finding. The sampled locators and the adversarial pass hold, including the four-case table at weight fourteen in characteristic eleven (§5.10). There are two small corrections, neither blocking: the revised notes on later users name only SerreModularityByCompatibleSystems S4, although its Layer S3 uses §5.6, its S4 uses §5.9 and other roadmaps use §§5.0d and 5.1; and two sentences of the description say more than the heads show. There is one format note, and one licence question is left for a human.

## C01 — The notes on later users name only SerreModularityByCompatibleSystems S4, although that roadmap and others use more of this roadmap

A reader deciding whether a change to §5.6, §5.9, §5.0d or §5.1 affects other roadmaps is told there is one consumer. That is the sentence in the opening (line 13): “The consumer is `SerreModularityByCompatibleSystems:S4`.” The *Downstream consumers* section (line 2648) and the §6.1 table say the same thing. The table's “Selected `p+1`” row (line 2602) names no user at all. At the open head of SerreModularityByCompatibleSystems:

- the *Needs* line of `S4/dp-terminal-characteristic-five-and-the-schoof-base-case` lists §5.9. Its weight-six branch at five is §5.9 at `p = 5`, and §5.12 here lists “the `p+1` exclusion at five” among its inputs;
- the *Needs* line of `S3/paso-5-killing-the-good-dihedral-prime` lists §5.6.

Other roadmaps also use this one:

- on main, AutomorphicGaloisRepresentationsPartII (its README line 92) takes the compatible-system data of §5.0d;
- at their open heads, PotentialModularityAndCompatibleSystems and GL2ModularityLifting use §5.0d, EllipticCurveModularityPartIIGL2TypeAbelianVarieties imports the GL₂-type data of §5.1, and ClassicalSerreModularity's `I.1/ordinary-exact-level` needs §5.0e.

The smallest repair would be to replace line 13 by “Its base cases are used by SerreModularityByCompatibleSystems, whose Layer S3 uses §5.6 and whose Layer S4 uses Layers 2 and 4 and §§5.3–5.4, 5.6–5.7, 5.9 and 5.12; the data of §§5.0d and 5.1 have further users.” Then put “S4 at `p = 5`” in the consumer column of the `p+1` row, and add S3 and those further users to *Downstream consumers*.

## C02 — Two sentences of the description say more than the heads show

The summary block says that §§5.8, 5.9 and 5.11 “were used only by Khare's level-one proof; they remain as results and no longer name a later user”. For §5.9 that is contradicted by the S4 *Needs* line quoted in C01. The sentence would be right as “The weight-two and small-weight theorems (§§5.8 and 5.11) and the Fontaine row were used only by Khare's level-one proof …; §5.9 at `p = 5` is used by SerreModularityByCompatibleSystems S4.”

The same block says that “the layers named here no longer exist”. At the open head of ClassicalSerreModularity, R26.5 and R33.4 are gone, but a Layer R26.1 still exists: it is now “Böckle's presentation of minimal deformation rings”, which uses none of these base cases. The accurate wording would be “R26.5 and R33.4 no longer exist, and R26.1 no longer uses these base cases”.

## N01 — `RankTwoOrdinaryEndpoints` (lines 167, 2097, 2580) is in code font but is declared nowhere

LocalGaloisDeformationRings on main has §0.3 “Ordinary period comparisons and rank-two endpoints” but no identifier of this name, and no roadmap or pinned file declares it. Writing the section's name in prose, or dropping the code font, would let a reader see that it is not a declaration.

## Questions for the author

- The §6.1 remark (lines 2622–2623) now assigns “Failure of (A1) away from level one” to `SerreModularityByCompatibleSystems:S2`. At that head, S2 holds the insertion of the good-dihedral prime and Lemma 2.1 on large images. The check that members are not bad dihedral is `S1/fontaine-laffaille-member-not-bad-dihedral`, which S3 and S4 apply. Is S2 the intended pointer, or should S1 be named with it? I could not tell from that roadmap's text which layer it means to own this branch.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.2 cubic power maps (fesenko-vostokov lines 775–851, (5.7) pp. 14–15, (5.8) Cor. 2 p. 16) | unramified ℚ₃; `e = 2` | `e/(p−1) = 1/2`, `pe/(p−1) = 3/2` give `U² ⊆ (U¹)³`; at `e = 2` the critical map `a³+θ₀a` has kernel ≤ 3, `U⁴ ⊆ (U²)³` | Holds as stated |
| §1.2 Borel form (moon-taguchi lines 63–76, p. 2; lines 118–123, p. 3) | `S₃` over 𝔽₃; unitriangular order 4 over 𝔽₄ | Normaliser of a unipotent group is Borel; action by `ψ₁/ψ₂`; `diag(−1,1)` sends `(1,1;0,1)` to `(1,−1;0,1)` | Matches source and Check |
| §1.5 kernel g (odlyzko-survey p. 122, rendered) | `x = 0, ±1/2, 3/4, 1, 2` | `g = 1, 1/π, 0.0483` (truncated: −0.1768), 0, 0; `∫₀¹ g = 4/π² = 0.4053`; `2(h*h)(0) = 1` | All Checks true |
| §1.5 “not the optimised kernel” | poitou-dpp line 248 vs lines 325–331 | README g is Poitou's (9); Tartar's function has Fourier transform `v*v`, `v = 1−x²` | Remark correct |
| §1.6 Lorentzian (odlyzko-survey p. 122, (2.4)) | `x = c_j`; unscaled density | `c²/(c²+x²) = 1/2`; unscaled `1/(1+4π²) = 0.0247`; `4a²(c²+x²)+(1−4a²)c² = c²+4a²x²` | Checks true |
| §1.7 Checks, numerical | `P(1,1,1)`, `P(2,0,1)`, `P(2,2,3/2)`, `I₁(13/2)`, `I₁(8)` | −0.0834 ∈ (−0.09,−0.08); 1.058 ≤ 1.0986; 1.597 ≤ 1.609; 0.99897 < 1.0037; 0.91713 < 0.9217 | All hold |
| §1.9 table, 13 rows | `exp(P(n,0,b)/n)` at first excluded degree | (a) 8.417 (b) 7.001 (c) 9.769 (d) 19.127 (e) 14.609 (f) 6.132 (g) 4.549 (h) 13.349 (i) 16.989 (j) 10.627 (k) 10.427 (l) 13.048 (m) 11.659 | Every bound exceeds its threshold |
| §2.0 X₀(11) model and Checks (schoof lines 839–861, p. 858) | `(0,−1,1,−10,−20)` | `b₂ = −4`, `b₄ = −20`, `b₆ = −79`: `4X³−4X²−40X−79`; ℚ(ζ₁₂) disc 144; ℚ(ζ₉)⁺ disc 81 | True; Faber Thm B–C p. 3, ghitza-yamauchi §2.3 pp. 4–6 seen |
| §2.4 `tate_no_levelOne_char_two` | dihedral; `SL₂(𝔽_q)` | `2^{3/2} = 2.83 < 3`, `B₆ = 985.6 > 3⁶`; `rd ≤ 4`, `B₁₂ = 1.909·10⁷ > 4¹² = 1.678·10⁷` | Contradictions hold |
| §2.5 `serre_no_levelOne_char_three` | 3-part 3; larger | `3^{11/6} = 7.494 < 7.5` vs bound 10.63 at `n = 24`; `3^{13/6} = 10.809` vs 12.48 at `n = 36` | Holds; projective orders 12, 24, 60, ≥360 |
| §1.3 `localRootDiscrExp_le_two_of_char_two` | ℚ₂; ℚ₂(√2); ℚ₂(ζ₈) | δ = 0; 3/2 with `|G₁| = 2`; 2 with `|G₁| = 4` (conductors 0,2,3,3) | Sharp; `G₀` is inertia at the pin, so `G₁` is wild |
| §1.3 `localRootDiscrExp_le_of_char_three` | split X³−3; ℚ₃(ζ₃,∛2,∛3); ℚ₃(ζ₉) | 11/6 = 13/6 − 1/3; `d = 28+9 = 37`, `e = 18`: 37/18 = 13/6 − 1/9; 3/2 ≤ 11/6 | Equalities as claimed |
| `poitouLowerBound_le_log_abs_discr` | ℚ, `b = 1/2, 1, 2` | −0.051, −0.083, −0.883, all ≤ 0 = log 1 | No counterexample |
| §3.2 `simple_two_groupScheme_over_int` (schoof lines 531–583, p. 854) | trivial G; `ℤ/2 → μ₂`, `1 ↦ −1` | order 1 fails `order G ≠ 1`; image `{(a,b): a ≡ b mod 2}`, not a closed immersion | Hypotheses exclude both wrong models |
| §3.3 Ext and filtration (mazur lines 883–884, p. 49; lines 1269–1274, p. 60; fontaine lines 83–84, 909–911) | ℤ[1/2] square classes; `G₋₁` | −1 ≡ 7 mod 8, ±2 odd valuation: kernel 0; −1 not a square in ℤ, so reversed Ext ≠ 0 | Steps 1–2 and (3.1) are prime-independent |
| §3.4 point counts (schoof lines 276–288, pp. 850–851) | 𝔽₅, `y² = x³∓x` | 7+1 = 8 and 3+1 = 4; twist by the non-square 2; 8+4 = 2(5+1) | Check true |
| §3.6 `dim_eq_zero_of_goodReduction_everywhere` (fontaine lines 78–90, pp. 516–517) | ℚ(√29) curve; cubic fields | `Δ = ε⁶(1−27ε²)`, `N = (727²−29·135²)/4 = 1`; Minkowski 12.49 so `|d| ≥ 13` | Discriminant hypothesis needed and exact |
| §4.6 three criteria | (2,3), (3,2), (5,2) | `2^{2/3}3^{3/2} = 8.248`, `4√3 = 6.928`, `4√5 = 8.944`; ℚ(ζ₃,∛2) rd 5.719, ℚ(i,√5) rd 4.472 | Below thresholds; `L = M` admissible |
| §4.7 `fieldCriterion_seven_three` (schoof lines 758–790, pp. 857–858) | K, K′ | `3^{3/2}7^{2/3} = 19.014`; `3^{7/6}7^{2/3} = 13.183`; `a = 2`: `3^{25/18}7^{2/3} = 16.829`; 𝔽₂₇ˣ order 26 | All steps check |
| §4.8 `fieldCriterion_thirteen_two` (schoof lines 791–838) | quadratic over ℚ(i,√13) | `4√13 = 14.422`; `δ = 1+a/4 < 2`, `a ∈ {0,2,4,5}` gives 2; `2^{3/2}√13 = 10.198` | Holds |
| §5.1 GL₂-type (snowden lines 1538–1542, p. 29; kw-preprint lines 585–597, p. 16) | `E×E`, `K = ℚ`; J₀(23) | `[ℚ:ℚ] = 1 ≠ 2`; `dim J₀(23) = 2 = [ℚ(√5):ℚ]`; dimension 0 fails | Checks discriminate |
| §5.2 descent (snowden lines 1553–1582, pp. 29–30) | hypotheses | irreducible before and after restriction; Faltings at line 1574; credit to Taylor at line 1552 | Matches |
| §5.3 realisation (snowden lines 1525–1528, 1584–1596; lines 288–289, p. 6) | ℚ; ℚ(√5); real quadratic, unramified | (A2) automatic; `[F(ζ₅):F] = 2`; B would ramify at one place, odd | Both branches as stated |
| §5.6 dihedral (khare lines 849–884, pp. 20–21; dieulefait-pacetti lines 325–328, p. 8) | p = 5, 7, 23 | 5 ≡ 1 mod 4; h(ℚ(√−7)) = 1; h(ℚ(√−23)) = 3, weight 12 | Statement as sourced |
| §5.7 ordinary terminal (dieulefait-pacetti lines 671–677; kw-preprint lines 715–781) | (5,6), (7,8), (13,14) | `k−1 = p ≡ 1 mod p−1`, characters 1, ω distinct; `dim S_k = 0` at k = 2,4,6,8; `M₁₄` rank 1 | Holds |
| §5.10 weight 14 at 11 (kw-annals lines 791–793, p. 247; kw-preprint lines 764–767, p. 21) | cases (a)–(d), table of AlgebraicModularFormsAndSerreWeights §4.3 | (d) α = 2, β = 1: `1+11+2 = 14`; twists 22 and 10; (a) twists to 2; ω₂: `13·11 ≡ 23 mod 120` | Four cases correct |
| §5.11 `not_isLevelOneResidual_of_mem_two_three_five_seven` (kw-annals lines 823–824) | p = 11 | Δ mod 11 has weight 12; hypothesis excludes 11 | Holds |
| §6.1 table (dieulefait-pacetti lines 104–123, p. 3; line 685, p. 15; khare lines 46–98) | (11,12), (11,14), J₀(11) | no row covers them; J₀(11) is semistable, good away from 11 | Rows match §§2.4–5.12 |
| C01 consumer notes | S3, S4 *Needs* lines at their head | §5.6 and §5.9 listed; README names only S4 and no user for §5.9 | Small correction |
| N01 `RankTwoOrdinaryEndpoints` | roadmap search on main and open heads | 0 declarations; only this README uses it | Format note |

- Source locators checked against the text: 54 README locators in 14 sources: schoof 10, dieulefait-pacetti 8, snowden 6, kw-preprint 5, odlyzko-survey 4 (page 122 rendered for the displayed (2.3)–(2.5)), fontaine 4, khare 3, moon-taguchi 3, kw-annals 2, mazur 2, jones 2, fesenko-vostokov 2, ghitza-yamauchi 2, faber 1. Poitou's 1976/77 Delange–Pisot–Poitou exposé (poitou-dpp, Numdam) was also read, to settle the §1.5 remark.
- Library declarations opened at the pins: `NumberField.abs_discr_ge'` (Discriminant/Basic.lean:210), `NumberField.abs_discr_gt_two` (:275), `isPrincipalIdealRing_of_abs_discr_lt` (NumberField/ClassNumber.lean:201), `classNumber_eq_one_iff` (:75), `three_pid` (Cyclotomic/PID.lean:35), `CuspForm.rank_eq_zero_of_weight_lt_twelve` (LevelOne/DimensionFormula.lean:167), `ModularForm.rank_eq_one_add_rank_cuspForm` (:183), `dimension_level_one` (:262), `Complex.tendsto_euler_sin_prod` (EulerSineProd.lean:272), `Real.pi_gt_d6`/`pi_lt_d6` (Pi/Bounds.lean:178, 184), `eulerMascheroniSeq_lt_eulerMascheroniConstant` (EulerMascheroni.lean:159), `NumberField.finrank_eq_one_of_unramified` (ExistsRamified.lean:51), `natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow` (Discriminant/Different.lean:90), `Ideal.isUnramifiedAt_iff_inertia_eq_bot` (Tau Ceti Frobenius/DecompositionGroup.lean:106), `TauCeti.LocalFieldsRamification.lowerRamificationGroup` (RamificationGroup.lean:99, `G₀` = inertia at :129). No continued Dedekind zeta, semiabelian scheme or abelian-variety Tate module exists at the pins, so the docstring's list of statements that cannot be stated stands.
- Cross-roadmap citations resolved: the three changed ones (SerreModularityByCompatibleSystems S2 and S4, and ClassicalSerreModularity R27.1, at their open heads). Spot-checked on main: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.G5, `admissible-global-ext-vanishing`, `admissibleConnectedEtaleFiltration`, R07.6.5, R07.1.30, R07.1.36, `mayerVietoris_exact`; NeronModelsAndSemistableAbelianVarieties §§1.8, 1.9, 3.5, 3.11, 6.10; AbelianSchemesAndArithmeticModuli A6.12 `traceDegreeSubfield`, A6.30–A6.33; GL2AutomorphicRepresentationsAndTransfer R17.3.10, R17.4.10, R17.6.4, R17.6.18; ShimuraVarieties §§8.18–8.19; LocalGaloisDeformationRings §§0.3, 5.4, 5.5; PadicExtensionFamilies §§2.3, 3.3, 7.1–7.3; ClassicalArithmeticCompletion §5.1; ProfiniteCohomology Layer 9; LFunctions Layer 3; JacobianChallenge Layers D–F; ArithmeticGaloisRepresentations §§6.1, 6.4 (`lambdaTateModule`); InverseGaloisAndArithmeticFundamentalGroups IG.0.T1 (`curveEndomorphismTrace`); AlgebraicModularFormsAndSerreWeights R15.4 = its Layer 4 (README line 17); ModularCurves 0B = its 0.2 (its old-to-new table, line 4504).
- Automatic checks: every gate check passed at this head. `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds `README.md`, `Suggested.lean` and `metadata.toml`. Dependency check: `depcheck: 211 roadmaps, 2271 edges, 0 problem(s)`, with no UPWARD or CYCLE line. SerreModularityByCompatibleSystems and ClassicalSerreModularity appear only as users of results proved here or as owners of other branches, never as suppliers.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings (lines 61, 72, 98, 143, 148, 153, 188, 209, 233, 236, 239, 242, 245) and nothing else. All 31 elaborated signatures were compared with the README. `IsUnramifiedAt`, `IsOdd` and `IsLevelOneResidual` drop `[Finite F] [DiscreteTopology F]`, which they do not use, and the three theorems about them carry both.
- One-tactic probe, decided by reading: none of the 13 theorems closes by one tactic. Each needs a discriminant, finite-flat or field-theoretic argument absent from the pins. The 18 definitions are simple ones with real bodies on native carriers, and there is no padding.
- Previous findings: none open. The review of 62c25a3 accepted with no finding, after its two earlier findings were repaired there. The change at this head is the 17 lines of consumer notes.
- Pull request text: title and description agree with the head, apart from C02. The diff is 17 insertions and 17 deletions, in `README.md` only. No heading, statement, section number or Lean declaration changes.

Overlap check: read SerreModularityByCompatibleSystems, ClassicalSerreModularity, PotentialModularityAndCompatibleSystems, EllipticCurveModularityPartIIGL2TypeAbelianVarieties and GL2ModularityLifting (open), and FiniteFlatGroupsAndIntegralPadicHodgeTheory, AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation and SmallRamificationAndAbelianVarietyBaseCasesPartII (main). The base cases, Snowden's realisation, the compatible-system data of §5.0d and the GL₂-type data of §5.1 are owned here and cited by the others. The Serre-weight recipe is owned by AlgebraicModularFormsAndSerreWeights Layer 4 and cited here. Dieulefait–Pacetti Theorem 1.4 at `p = 5` is a §5.12 target here and a case of GL2ModularityLifting §12.1, as used in SerreModularityByCompatibleSystems S1. This roadmap is on main, so the open roadmap cites §5.12 or narrows its statement; nothing here changes.

Source independence: 13 passages compared with 10 sources, none shared beyond forced terms (longest common run four words, “odd degree over F”). Largest share schoof, about 35 of 142 locators. Contents compared with schoof: Layer 4's §§4.1–4.9 follow its §§2–7 in order but not one to one. §4.3 adds the completion Kummer target, §4.5 separates the class numbers, and §4.6 uses Proposition 5.1 where Schoof uses 5.2. The order is forced: §§4.2 and 4.4 need §4.1's category, §§4.6–4.8 need §§4.4–4.5, and §4.9 needs all of them. The other five layers do not follow any one source. Result: independent.

Research link: Layers 2–5 prove the base cases of Tate (1994), Serre, Fontaine (1985) and Schoof (2005), and Snowden's 2009 realisation. Khare–Wintenberger (2009) and Dieulefait–Pacetti (2023) rest their proofs of Serre's modularity conjecture on these. The line rests on the README's §§2.5, 5.12 and 6.1 and on dieulefait-pacetti §1.1 and Paso 6.

## Not verifiable

- None in the seeded sample. Odlyzko's displayed formulas (2.3)–(2.5), which the text extraction drops, were read from the rendered page 122.
- Not reopened this round, being outside the sample: Bosch–Lütkebohmert–Raynaud §§9.3–9.4 and Neukirch–Schmidt–Wingberg Ch. I §5 and Ch. VI (books), Raynaud (1974) §2.1, Allen et al. §7.1 and Carayol Théorèmes (A)–(B).

## Source issues

- **Misprint** in schoof at §6, case l = 7, p = 3, printed p. 858: the source bounds the relative degree of unramified extensions of K′ by 120/36; K′ has degree 54 = 3·18, so it should be 120/54 < 3; affects nothing.
- **Misprint** in snowden at Lemma 9.4.3, §9.4, p. 29: the conclusion ends with “a GL₂-type abelian” and no noun; it should end “a GL₂-type abelian variety”; affects nothing.
- **Error** in kw-preprint at the proof of Theorem 4.3, p. 21: the source says every level-one weight-14 representation at p = 11 is a cyclotomic twist of a weight-2 one; it should exclude the non-split type with subcharacter ω and quotient ω², whose twists have weights 22 and 10; affects a stated result; corrected in print at Annals 169 (2009), Theorem 5.4, p. 247.

## For the human reviewers

- Licence: Khare–Wintenberger's version of record (Theorem 5.4, p. 247, cited in §§5.0d, 5.10 and 5.11) was read from the publisher's PDF on annals.math.princeton.edu. The sources service does not classify that host as open, so whether it is an open copy is for a human to confirm.
