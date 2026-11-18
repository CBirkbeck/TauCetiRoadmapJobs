# Review of SmallRamificationAndAbelianVarietyBaseCases (pull request #2517 at 31d7cdb)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every sampled locator was read at its place and supports the statement, and the recomputed discriminant, different, class-number and Poitou values agree with the text, including all thirteen rows of the degree table and the four-case table at weight fourteen in characteristic eleven. There are three small corrections, none blocking: the notes on later users name one consumer where several sections have others; two sentences of the description say more than the heads show; and the Paso 6 target of §5.12 has hypotheses that §5.11 of the same roadmap shows are never met. There are two format notes, and one licence question is left for a human.

## C01 — The notes on later users name only SerreModularityByCompatibleSystems S4, although that roadmap and others use more of this roadmap

A reader deciding whether a change to §5.6, §5.9, §§1.1 and 1.9 or §5.0e touches other roadmaps is told there is one consumer: “The consumer is `SerreModularityByCompatibleSystems:S4`” (the opening, line 13), repeated in *Downstream consumers* (line 2648) and in the §6.1 table, whose “Selected `p+1`” row (line 2602) names no user.

At the open head of SerreModularityByCompatibleSystems, the *Needs* line of `S4/dp-terminal-characteristic-five-and-the-schoof-base-case` lists §§5.12, 5.6, 5.3, 5.4, 5.9, 5.7 and Layers 4 and 2, and the *Needs* line of `S3/paso-5-killing-the-good-dihedral-prime` lists §5.6. On main, SmallRamificationAndAbelianVarietyBaseCasesPartII (its README, line 444) needs §§1.1 and 1.9, row (b). At the open head of ClassicalSerreModularity, `I.1/ordinary-exact-level` needs §5.0e and its supplier table takes §§5.0b–5.0e and 5.1–5.4.

The smallest repair would be to replace line 13 by “Its base cases are used by SerreModularityByCompatibleSystems, whose Layer S3 uses §5.6 and whose Layer S4 uses Layers 2 and 4 and §§5.3–5.4, 5.6–5.7, 5.9 and 5.12; the data of §§1.1, 1.9, 5.0 and 5.1 have further users”, to put “S4 at `p = 5`” in the consumer column of the `p+1` row, and to add S3 and the further users to *Downstream consumers*.

## C02 — Two sentences of the description say more than the heads show

The summary block says that §§5.8, 5.9 and 5.11 “were used only by Khare's level-one proof; they remain as results and no longer name a later user”. For §5.9 the S4 *Needs* line quoted in C01 contradicts it. The sentence would be right as “The weight-two and small-weight theorems (§§5.8 and 5.11) and the Fontaine row were used only by Khare's level-one proof; §5.9 at `p = 5` is used by SerreModularityByCompatibleSystems S4.”

The same block says “the layers named here no longer exist”. At the open head of ClassicalSerreModularity, R26.5 and R33.4 are gone, but a Layer R26.1 exists: it now holds Böckle's presentation of minimal deformation rings and uses none of these base cases. The accurate wording would be “R26.5 and R33.4 no longer exist, and R26.1 no longer uses these base cases”.

## C03 — By §5.11, no representation satisfies the hypotheses of the Paso 6 target, so its modularity branch asks an implementer for nothing

An implementer reading §5.12 and the last row of the §6.1 table (line 2605) is told that for residual weights two and four the target “give[s] modularity of the original system”, and will look for a modularity argument; but the roadmap's own §5.11 already shows the case is empty.

The hypotheses are a system with empty ramification set whose 5-adic member is odd with a stable lattice whose reduction satisfies (A1). That reduction is then odd, absolutely irreducible and unramified outside five, over a finite field of characteristic five: a level-one residual representation in the sense of §2.1. The corollary of §5.11 (stated in `Suggested.lean` as `not_isLevelOneResidual_of_mem_two_three_five_seven`), proved before §5.12 and without it, says there is none. The text of §5.12 also reads against §5.7: at (3,2) and (3,4), §5.12 says the ordinary criterion “makes this member modular” (line 2549), while §5.7 concludes for the same member that it “cannot exist” (line 2397).

Nothing here is false; all three weights are impossible and the stated implications hold. The smallest repair would be one sentence in §5.12, and three words in the table row, saying that by §5.11 at `p = 5` the hypotheses are never met, and that the target is kept in the conditional form of Dieulefait–Pacetti's Paso 6 because that is the form SerreModularityByCompatibleSystems S4 quotes. Alternatively the row could state its content directly: no such system has a 5-adic member with residual (A1).

## N01 — `RankTwoOrdinaryEndpoints` (lines 167, 2097, 2580) is in code font but is declared nowhere

LocalGaloisDeformationRings on main has §0.3 “Ordinary period comparisons and rank-two endpoints” and no identifier of this name; no roadmap or pinned file declares it. Writing the section's title in prose would let a reader see that it is not a declaration.

## N02 — Three slips of wording

“by §5.0d and §5.0d” (§5.11, line 2496) repeats one reference; “ClassicalArithmeticCompletion ClassicalArithmeticCompletion §5.1” (Dependencies of Layer 4, lines 1811–1812) repeats the name; and the *Needs:* line of the quaternionic Jacobian target is run into the last Check bullet of §5.0c (line 1975).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.5 kernel `odlyzkoKernel` (odlyzko-survey p. 122, (2.4)–(2.5), read from the rendered page) | `x = 0, ±1/2, 3/4, 1, 2`; half-line integral | `g = 1, 0.31831 = 1/π, 0.04830, 0, 0`; `∫₀¹ g = 0.405285 = 4/π²`; `2(h*h)(0) = 1`; `g′ = −π(1−x)sin πx` | All six Checks true |
| §1.6 positivity on the strip (odlyzko-survey p. 122, text between (2.3) and (2.4)) | factor at `x = c_j`; `a = ±1/2`; unscaled density | `(c²+4a²x²)/(c²+x²) = 4a²+(1−4a²)c²/(c²+x²)`; density `πc·e^{−2πc|t|}` has mass 1, transform `1/2` at `x = c`; unscaled gives `1/(1+4π²)` | Holds; source requires `F ≥ 0`, `Re Φ ≥ 0` on the strip |
| §1.7 `poitouLowerBound_le_log_abs_discr` | `ℚ` at `b = 1/2, 1, 2`; quadratic fields | `P(1,1,b) = −0.0509, −0.0834, −0.8833 ≤ 0`; `P(2,0,1) = 1.0584 ≤ log 3 = 1.0986`; `P(2,2,3/2) = 1.5973 ≤ log 5 = 1.6094` | No counterexample; pole term `−16b/π²` |
| §1.7 integral bounds and thresholds | `I₁(13/2)`, `I₁(8)`; `n = 24, 36`; `b → ∞` | `0.99897 < 1.0037`, `0.91713 < 0.9217`; `P/n = 2.3634 > log 10`, `2.5240 > log 12`; `I₁(b) ↓ log 2` | Hold |
| §1.9 table, rows (a)–(m) | `exp(P(n,0,b)/n)` at the first excluded degree | 8.417, 7.001, 9.769, 19.127, 14.609, 6.132, 4.549, 13.349, 16.989, 10.627, 10.427, 13.048, 11.659, each above the hypothesis of its row | Every row exceeds its threshold |
| §1.3 `localRootDiscrExp_le_two_of_char_two` | `ℚ₂(i)`, `ℚ₂(√2)`, `ℚ₂(ζ₈)`; `a = 1`, `a = 2` | `∫(1−1/|G^u|) = 3−1/a−2/|P|`: 1; 3/2; `3−1/2−2/4 = 2` (conductors 0,2,3,3, sum 8, degree 4) | Sharp; `G₀` is inertia at the pin, so `G₁` is wild |
| §1.3 `localRootDiscrExp_le_of_char_three` | split `X³−3`; `ℚ₃(ζ₃,∛2,∛3)`; `ε = ±1`, `I = P` | `d = 1+2·5 = 11`, `11/6 = 13/6−1/3`; `5/2−1/9−1/3 = 37/18 = 13/6−1/9`; `2−3/(2|P|)` and `2−2/|P|` both below | Equalities as claimed |
| §1.4 Minkowski thresholds | `n = 3, 6, 12` | `B₃ = 9.81 > 8`, `B₆ = 985.6 > 729`, `B₁₂ = 1.909·10⁷ > 1.678·10⁷` (`1.897·10⁷` with `π > 3.14`); ratios 4.41, 4.99, 5.36 | Hold |
| §2.0 carriers (schoof p. 858–859; faber Theorems B–C, p. 3; khare §1, p. 2) | `(0,1;1,1)` over `𝔽₂`; `X₀(11)`; cosets mod 9 | square `(1,1;1,0)`, polynomial `X²+X+1`; `b₂ = −4`, `b₄ = −20`, `b₆ = −79`, so `4X³−4X²−40X−79`; `2·2 = 4`, `2·4 = 8 ≡ ±1` | Checks true |
| §2.1 `IsLevelOneResidual` (khare lines 40–47, p. 2; dieulefait-pacetti lines 106–108, p. 3) | `1 ⊕ ω̄₃`; `X₀(11)[2]`; char 2 | odd, unramified outside 3, reducible; image `S₃`, ramified at 11; `c² = 1` gives `det = 1 = −1` | Three conditions independent |
| §2.4 `tate_no_levelOne_char_two` | dihedral `D_{2r}`, `r` odd; `SL₂(𝔽_q)`, `q ≥ 4` | `D = P`, `rd ≤ 2^{3/2} = 2.83 < 3` at `n ≥ 6`; `rd ≤ 4` at `n ≥ 60 ≥ 12` | Contradictions hold |
| §2.5 `serre_no_levelOne_char_three` | projective `A₄, S₄, A₅`; `q ≥ 9` | orders 12, 24, 60, ≥ 360; `3^{11/6} = 7.494` against 10.63 at 24; `3^{13/6} = 10.808` against 12.48 at 36 | Holds |
| §3.2 `simple_two_groupScheme_over_int` (schoof lines 531–583, p. 854) | trivial `G`; `μ₂`, `ℤ/2ℤ`; `(ℤ/2ℤ)²` | order 1 fails `order G ≠ 1`; order 2 has subgroups of order 1, 2 only; rank-2 proper subgroup of rank 4 | Hypotheses exclude the wrong models |
| §3.1 small two-ramified fields | orders ≤ 11 not powers of 2 | odd orders and `C₆, C₁₀` have odd abelian quotients; `S₃, D₁₀` over `ℚ(i), ℚ(√±2)`: `rd ≤ √8 = 2.83 < 3` at degree 6, 10 | Holds |
| §3.3 Ext and filtration (mazur lines 883–884, 1269–1274; fontaine lines 83–84, 909–911; schoof line 311) | `ℤ[1/2]` square classes | `−1 ≡ 7`, `±2` of odd valuation: all three nonsquare in `ℚ₂`; `−1` not a square in `ℤ`, so the reversed Ext is nonzero | Direction and Checks true |
| §3.5 good-reduction contradiction (fontaine lines 915–932, pp. 536–537; schoof lines 276–288, pp. 850–851; brumer-kramer lines 12–13, p. 1) | `𝔽₅`: `y² = x³−x`, twist by 2 | 7+1 = 8 and 3+1 = 4 points; `2^{2gn} ≤ #A(k)²` for all `n` forces `g = 0` | Holds |
| §3.6 `dim_eq_zero_of_goodReduction_everywhere` | `ℚ(√29)`; cubic fields; three pairs `(E,p)` | norm of `1−27ε²` is `(727²−29·135²)/4 = 1`; Minkowski 12.49 so `|d| ≥ 13`; `10.392 < 10.40`, `12.950 < 12.96`, `11.619 < 11.62` | Discriminant hypothesis needed and exact |
| §4.2 cyclotomic splitting (schoof lines 268–275, p. 850) | `P` a finite `p`-group, `p ≠ ℓ` | `P^{ab}` cyclic by Kronecker–Weber, so `P` cyclic; `μ₂` over `ℤ` not an iterated extension of `ℤ/2ℤ` (rank 2, length 1, non-étale) | Matches source |
| §4.3 Ext dimension (schoof lines 427–435, p. 852) | (2,3), (3,2), (5,2), (7,3), (13,2), (17,2) | `2, 7 ≢ ±1 mod 9`; `3, 5, 13 ≢ ±1 mod 8`; `17 ≡ 1 mod 8` | Vanishing at the five pairs; dimension one at (17,2) |
| `fieldCriterion_two_three`, `_three_two`, `_five_two` | `F`, `M` from the Lean `if`; degrees | `F = ⊥, ℚ(ζ₃), ℚ(√5)`; `8.248 < 8.25`, `6.928 < 6.93`, `8.944 < 8.95`; degrees 6; 4, 8; 4, 8, 16 | Hold |
| `fieldCriterion_seven_three` (schoof lines 758–790, pp. 857–858) | `K`, `K′` | `19.014 < 19.02`; `13.184 < 13.19`; `(63+6a)/54 = 7/6+a/9 < 3/2`, so `a = 2`; `16.829 < 16.83`; `c` of order 13 or 26 | All steps check |
| §4.8 `fieldCriterion_thirteen_two` (schoof lines 791–838, p. 858, read also from the rendered page) | quadratic and degree-four abelian extensions of `ℚ(i,√13)` | `14.422 < 14.43`; `1+a/4 < 2` leaves `a = 2`; `η³ = 3+10η ≡ 1 mod 2`; degree four: `2+3+3 = 8`; `10.198 < 10.199` | Holds |
| §4.5 class numbers | `ℚ(ζ₁₂)`, `ℚ(i,√13)` | `144 < (4π²/3)² = 173.2`; Minkowski bound `7.90 < 8`; primes over 3, 5, 7 have norm 9, 25, 49; prime over 2 is `(1+i)` | Principal |
| §5.3 Snowden's realisation (snowden lines 1525–1528, p. 29; 1584–1596, p. 30; 84–89, p. 2; 288–289, p. 6) | `ℚ`; `ℚ(√5)` at `p = 5`; real quadratic, unramified | degree 1 odd, `[ℚ(ζ₅):ℚ] = 4`; `[F(ζ₅):F] = 2`; one real place alone is an odd ramification set | Both branches as stated; `p = 2` excluded at snowden line 41 |
| §5.5 class numbers (khare lines 849–853, p. 20) | `p = 7, 11, 19, 43, 67, 163`; 23 | `7 < π² = 9.87`; others `≡ 3 mod 8`; `(2/π)√163 = 8.13`, `(−163/q) = −1` at 3, 5, 7; `−23 ≡ 1 mod 8` | List equals the source's |
| §5.6 dihedral exception (khare lines 857–882, pp. 20–21) | terminal weights | `p = 2k−1`: `k = 2, 4, 6` give 3, 7, 11 (class number one); `k = 8, 14` give 15, 27, not prime | (A1) at the terminal weights |
| §5.7 ordinary terminal members | five pairs | `k−1 ≡ 1 mod p−1` in each; cusp space zero at 2, 4, 6, 8; `M₁₄` of rank 1 | Holds |
| §5.9 `p+1` exclusion (kw-preprint lines 672–673, p. 18; dieulefait-pacetti lines 678–682, p. 14) | `p = 5, 7, 13`; `p = 11` | Schoof's set contains 5, 7, 13 and not 11; `v₁₁(Δ) = 5`, not divisible by 11 | Holds; boundary correct |
| §5.10 weight 14 at 11 | cases (a)–(d) | `1+11·1+2 = 14`; twists `1+11+10 = 22`, `1+0+9 = 10`; peu ramifié `2+12 = 14`; `23·11 ≡ 13 mod 120`; no other `(a,b)` | Four cases complete |
| `not_isLevelOneResidual_of_mem_two_three_five_seven` (§5.11) | `p = 5, 7, 11` | normalised weights ≤ 6, ≤ 8, all excluded; at 11, Δ has weight 12 and 11 is not in the set | Holds |
| §5.12 (dieulefait-pacetti lines 140–147, p. 4; 656–682, p. 14; 685–688, p. 15; 297–301, p. 7) | hypotheses against §5.11 | residual member is level one in characteristic 5, excluded by §5.11 | True; see C03 |
| §6.1 table (dieulefait-pacetti lines 104–123, p. 3; khare lines 46–98, pp. 2–3) | (11,12), (11,14), `J₀(11)` | no row covers them; `J₀(11)` semistable, good away from 11 | Rows match §§2.4–5.12 |
| C01 consumer notes | *Needs* lines at the two open heads and on main | §§5.6, 5.9, 5.0e, 1.1, 1.9 have users the README does not name | Small correction |
| N01 | roadmap search on main and at the open heads | 0 declarations of the name | Format note |

- Source locators checked against the text: 45 README locators in 10 sources read this round: schoof 10, dieulefait-pacetti 8, snowden 6, fontaine 5, khare 4, kw-preprint 4, odlyzko-survey 3 (pages 121–122 rendered for the displayed formulas), mazur 2, faber 2, brumer-kramer 1.
- Library declarations opened at the pins: `NumberField.abs_discr_ge'` (Discriminant/Basic.lean:210), `rootDiscr_def` (:82), `classNumber_eq_one_iff` (ClassNumber.lean:75), the two PID criteria (ClassNumber.lean:184, 201), `three_pid` (Cyclotomic/PID.lean:35), `Real.pi_gt_d2`/`pi_lt_d2`/`pi_gt_d6`/`pi_lt_d6` (Pi/Bounds.lean:159–184), `eulerMascheroniSeq_lt_eulerMascheroniConstant` (EulerMascheroni.lean:159), `Module.finrank_subsingleton` (Finrank.lean:64), `not_dvd_discr_iff_isUnramifiedIn` (Discriminant/Different.lean:192), `NumberField.finrank_eq_one_of_unramified` (ExistsRamified.lean:51); Tau Ceti `lowerRamificationGroup` (RamificationGroup.lean:99, `G₀` inertia at :129), `FinitePadicExtension` (AbsoluteRamificationIndex.lean:64), `kummerIso` and `kummerIso_res` (Kummer.lean:384, 693), `IsPositiveDefiniteSub.add`/`real_smul`/`mul`/`prod`/`comp_smul`/`of_tendsto` (PositiveDefinite/AddGroup.lean:275–335), `unitFiltration_le_range_powMonoidHom_two` and `_iff` (Squares.lean:113, 263), the two Frattini lemmas (ProP/Burnside.lean:132, Frattini/Basic.lean:160).
- Cross-roadmap citations resolved: the three changed ones (SerreModularityByCompatibleSystems S4 and S2 at its open head, where ClassicalSerreModularity's scope section maps its former R33.2 to S2; ClassicalSerreModularity R27.1 at its open head); on main, AlgebraicModularFormsAndSerreWeights R15.4 (its line 17 names Layers 1–5 so), ArithmeticGaloisRepresentations `TateModule.lambdaTateModule` (line 4313), InverseGaloisAndArithmeticFundamentalGroups IG.0.T1 (line 358), LocalGaloisDeformationRings §0.3 (line 1228).
- Automatic checks: all passed at this head. No change outside the folder; the folder holds `README.md`, `Suggested.lean` and `metadata.toml`. Dependency check output: `depcheck: 200 roadmaps, 2194 edges, 0 problem(s)`, no UPWARD or CYCLE line; the two roadmaps not on main are named only as later users or as owners of other branches.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings (lines 61, 72, 98, 143, 148, 153, 188, 209, 233, 236, 239, 242, 245) and nothing else. The 31 elaborated signatures were compared with the README: `IsUnramifiedAt`, `IsOdd` and `IsLevelOneResidual` do not carry `[Finite F] [DiscreteTopology F]`, which their bodies do not use, and the three theorems about them carry both.
- One-tactic probe, decided by reading: none of the 13 theorems closes in one tactic; each needs a discriminant, finite-flat or class-field argument absent from the pins. The 18 definitions have real bodies on native carriers. No padding.
- Previous review (same head): no finding to repair. Its two small corrections and its format note are unchanged in the text and are C01, C02 and N01 here. Its question on the pointer to S2 is settled by the former-layer mapping in ClassicalSerreModularity's scope section.
- Pull request text: title and description agree with the head apart from C02; 17 insertions and 17 deletions in `README.md` only, no heading, statement, section number or Lean declaration changed.

Overlap check: read SerreModularityByCompatibleSystems and ClassicalSerreModularity (open) and SmallRamificationAndAbelianVarietyBaseCasesPartII, AlgebraicModularFormsAndSerreWeights and LocalGaloisDeformationRings (main); PotentialModularityAndCompatibleSystems, EllipticCurveModularityPartIIGL2TypeAbelianVarieties, GL2ModularityLifting, FiniteFlatGroupsAndIntegralPadicHodgeTheory and SerreWeightAndLevelOptimisation were not reopened this round. The base cases, Snowden's realisation, the raw compatible-system data of §5.0d and the `GL₂`-type data of §5.1 are owned here and cited by the others. The Serre-weight recipe is owned by AlgebraicModularFormsAndSerreWeights Layer 4. Dieulefait–Pacetti's Theorem 1.4 at `p = 5` is a target of §5.12 here and a case of `S1/lifting-theorems-over-the-rationals` in SerreModularityByCompatibleSystems; this roadmap is on main, so the open roadmap cites §5.12 or narrows its statement, and nothing here changes.

Source independence: 13 passages compared with 9 sources, none shared beyond forced terms (the closest is §4.8 beside schoof lines 791–838: same steps, own bounds and wording); largest share schoof, about 34 of 172 locators; contents compared with schoof: §4.1 ↔ §2, §4.2 ↔ §3, §4.3 ↔ §4, §4.4 ↔ §5, §§4.6–4.8 ↔ §6 inside one of six layers, with §4.3's completion target, §4.5 and §4.9 added and §4.6 argued through Proposition 5.1 where the source uses 5.2; §§4.2 and 4.4 need §4.1 and §§4.6–4.8 need §§4.4–4.5; the other five layers follow no single source: independent.

Research link: Layers 2–5 prove the base cases of Tate (1994), Serre, Fontaine (1985) and Schoof (2005) and Snowden's realisation (2009), on which Khare–Wintenberger (2009) and Dieulefait–Pacetti (2023) rest their proofs of Serre's modularity conjecture; README §§2.5, 5.12, 6.1 and dieulefait-pacetti §1.1 and Paso 6.

## Not verifiable

- None in the seeded sample.
- Not reopened this round, outside the sample: Khare–Wintenberger's version of record (Theorem 5.4, p. 247), so the correction locator in the third source issue below rests on the README's citation; Jones, Moon–Taguchi, Ghitza–Yamauchi and Fesenko–Vostokov; Bosch–Lütkebohmert–Raynaud §§9.3–9.4, Neukirch–Schmidt–Wingberg, Raynaud (1974) §2.1, Allen et al. §7.1, Carayol and Milne.

## Source issues

- **Misprint** in schoof at §6, case l = 7, p = 3, printed p. 858: the source bounds the relative degree of unramified extensions of K′ by 120/36; K′ has degree 54, so it should be 120/54 < 3; affects nothing.
- **Misprint** in schoof at §6, case l = 13, p = 2, printed p. 858: the source writes the conductor exponent of a quadratic character as a ≤ 2 before deducing a ≤ 3 and a = 2; it should be a ≥ 2, the prime over 2 being wildly ramified; affects nothing.
- **Error** in kw-preprint at the proof of Theorem 4.3, p. 21: the source says every level-one weight-14 representation at p = 11 is a cyclotomic twist of one of weight 2; it should exclude the non-split type with subcharacter ω and quotient ω², whose twists have weights 22 and 10; affects a stated result; corrected in print at Annals 169 (2009), Theorem 5.4, p. 247.
- **Misprint** in snowden at Lemma 9.4.3, §9.4, p. 29: the conclusion ends with “a GL₂-type abelian” and no noun; it should end “a GL₂-type abelian variety”; affects nothing.

## For the human reviewers

- Licence: schoof was read from the author's page (the URL in the README redirects to a personal site); that copy carries the publisher's download stamp. Fontaine's paper was read from the author-hosted publisher scan the README links. Whether these two hosts are legal author copies was judged by this review and is for a human to confirm.
