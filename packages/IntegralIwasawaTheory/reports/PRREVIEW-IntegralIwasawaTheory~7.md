# Review of IntegralIwasawaTheory (pull request #1306 at 7fdfbc8)

**Verdict:** needs changes

## Previous review's findings (at 92927d1)

All four are repaired at this head.

- **R01 (padding in `Suggested.lean`): repaired.** The file now has 13 declarations: the six headline theorems and the seven definitions they need. `section BakerBrumer` keeps only `padicExpRadius` and `bakerBrumer_expDisc`. `import Mathlib` is the only import. Layer headers for Layers 1, 3, 4, 5 and 7 are present. Docstring lines 29–35 name `bakerBrumer_expDisc` and say that "Its supporting statements of §§4.1a–4.1d … are README targets". README line 560 now reads "Prove that `0<ρ_p<1`", and the Summary (line 3) names `bakerBrumer_expDisc`.
- **R02 (Baker–Brumer attribution): repaired.** README line 686 now reads "(Rousseau, exposé 11, Théorème, p. 11-01, credited there to Brumer 1967: the homogeneous case …; Baker, Chapter 2: the complex theorem with a constant term …) The constant term `β_0` and the general field Ω go beyond the cited p-adic statement". The locators are correct: rousseau line 38 (p. 11-01), Lemme 1 at rousseau line 86 (p. 11-03) and Lemme 2 at rousseau line 132 (p. 11-05).
- **R03 (four locators): repaired.**
  - Line 1313: "Theorem 3.2, p. 24".
  - Line 1332: "equations (102), (103), (105) and (107), Theorems 8.8–8.23, pp. 54–65". In dk these are on p. 57 (line 2133), p. 59 (line 2211), p. 61 (line 2299) and p. 62 (line 2348).
  - Line 1334: "Lemma 3.10, p. 27", at dksw line 961.
  - Line 836: "(Oesterlé, §4 and Propositions 1–2, pp. 173–175.)"
- **R04 (Tau Ceti exp/log variants): repaired.**
  - Lines 9 and 49 name `Padic.norm_exp_sub_one`, `Padic.norm_log`, `Padic.log_exp`, `Padic.exp_log` (`TauCeti/NumberTheory/Padics/ExpLog.lean:95–119`), `Padic.rpow_neg_div_le_norm_factorial` (`Factorial.lean:108`), `TauCeti.exp_add_of_mem_maximalIdeal_pow` (`LocalField/Exponential.lean:181`) and `TauCeti.valuation_exp_sub_one` (`LocalField/ExpLog.lean:174`).
  - Both lines say how §4.1a differs from these.
  - The new Check (line 571) compares the two on ℚ_p.

## R01 (P2) — The Galois representation of a parallel-weight Hilbert eigenform has four owners

**Location.** `TauCetiRoadmap/IntegralIwasawaTheory/README.md`:
- line 1362: "The construction includes the primitive rank-two Galois multiplicity in quaternionic curve cohomology, its coefficient model and Hecke comparison in the Carayol range, and the degree-one parabolic realization";
- line 1378: "Those downstream comparisons reuse this core".

**Claim.** §9.5 constructs `finiteWeightHilbert_classicalAttachment` for every totally real F, including F=ℚ (Check at line 1338). That construction includes:
- Carayol's rank-two multiplicity;
- Taylor's congruence branch;
- the degree-one parabolic realization.

Three open roadmaps later in the merge order construct the same objects without citing §9.5. Line 1378 says that they "reuse this core", which is false at their heads.

**Witness.** None of these READMEs mentions IntegralIwasawaTheory:
- #1001 WeightsInEtaleCohomology (position 145), lines 497 and 759–772: Carayol's models and eigensummand;
- #1005 HilbertModularVarietiesAndShimuraCurves (159), line 4012: "rank-two multiplicity … supplied by WeightsInEtaleCohomology R34.6";
- #928 AlgebraicModularFormsAndSerreWeights §6.1 (97), line 1383: F=ℚ.

**Repair.** This roadmap comes first in the merge order (28), so it remains the owner.
1. In line 13 and in the paragraph at line 1378, name WeightsInEtaleCohomology R34.3/R34.6, HilbertModularVarietiesAndShimuraCurves §R18.3.29 and AlgebraicModularFormsAndSerreWeights R15.5A.1 as consumers. Say that they import `finiteWeightHilbert_classicalAttachment` for parallel weight rather than construct the multiplicity, the Taylor branch or the F=ℚ parabolic realization.
2. Delete the sentences "On common eigenpackets it is identified … R34.6 …" and "Those downstream comparisons reuse this core". Make the same change to line 1880's "shared Carayol/Saito/Taylor member".
3. The matching edits are citations of §9.5 in #1001, #1005 and #928.

Test: after these edits, `roadmaps grep 'IntegralIwasawaTheory §9.5'` must hit those three READMEs, as it already hits AutomorphicGaloisRepresentations (#1007, lines 72 and 2222).

## R02 (P2) — CyclotomicClassGroupsAndStickelberger also owns the prime-power Hasse index and a Vandiver predicate

**Location.** `README.md` line 1874: "The common domain with CyclotomicClassGroupsAndStickelberger §§3.4, 6.1–6.4 and 7.1–7.3 is … unit groups, Hasse index, circular regulator/index, Vandiver predicate … The two Vandiver predicates agree at odd primes after the maximal-real-field comparison."

**Claim.** `primePowerHasseUnitIndex_one` (§1.5; `Suggested.lean` line 105) and `VandiverCondition` (§7.4) are stated and proved a second time in a roadmap later in the merge order. Line 1874 treats this as a shared domain with a comparison. The principle is single ownership: one owner, earlier roadmaps cited.

**Witness.** #1260 CyclotomicClassGroupsAndStickelberger (position 33):
- `Suggested.lean` line 157 declares `primePower_indexRealUnits_eq_one` (`indexRealUnits K = 1`, cyclotomic `{p^r}`);
- README line 623 says "prove" it from Sharifi Lemma 4.2.17;
- README line 1128 defines its own Vandiver condition.

**Repair.**
1. Rewrite line 1874 to say that CyclotomicClassGroupsAndStickelberger §§3.4, 6.1–6.4 and 7.1–7.3 import:
   - `primePowerHasseUnitIndex_one` (§1.5);
   - `primePowerCircularUnitIndex` (§§1.5–1.6);
   - `classNumberGrowth` (§3.3);
   - `VandiverCondition` (§7.4).
2. Delete the sentence about two Vandiver predicates.
3. The matching edit in #1260 drops `primePower_indexRealUnits_eq_one` and the second Vandiver definition and cites §§1.5 and 7.4 instead. Its README lines 1114 and 1202 already present `circularUnit_index` and `cyclotomic_class_number_growth` as specializations of ours.

Test: §1.5's statement covers that roadmap's hypotheses (p^r>2 with a CM instance) as a special case, so the citation loses nothing.

## R03 (P3) — The `Suggested.lean` docstring lists five undeclared README targets and carries contract details

**Location.** `TauCetiRoadmap/IntegralIwasawaTheory/Suggested.lean`:
- lines 21–27: "The definitions below support the README's generator-membership target `cyclotomicNumbers_generator_mem` and unit-membership target `cyclotomicUnits_mem_iff` …";
- lines 49–50, 53–56 and 62–63.

**Claim.** Lines 21–27 list README target names that the file does not declare. Their only effect is that the gate's README-identifier check finds those names in the Lean file. The three later passages state hypotheses of README targets:
- the Sinnott–Kurihara smoothing set;
- `hilbertHasseLift`'s threshold N₀;
- the S of the dyadic descent.

None of them says which headline is not statable or what it lacks. That is the only content the docstring should carry beyond the headlines.

**Witness.** On a scratch copy without lines 21–28, the gate's `readme_identifiers_missing` returns exactly `cyclotomicNumbers_generator_mem`, `cyclotomicUnits_generators`, `cyclotomicUnits_mem_iff`, `realCyclotomicUnits_cyclic` and `realCyclotomicUnits_generators`. At the head it returns [].

**Repair.**
1. Delete lines 21–27 and the three passages.
2. In README lines 155, 176 and 187, state those five facts in prose without backticked names. For example: "membership of each generator", "the unit-membership criterion", "generation of `D_a` and `D_a^+` by roots of unity, −1 and the γ_a(b)", and "cyclic generation of `D_a^+` by γ_a(b)".
3. The gate check then returns [] again.

## R04 (P3) — Layer 2 depends on Layer 3

**Location.** `README.md`:
- line 418: `uniformCapitulationBound` "*Needs:* §3.2 for the arithmetic transition quotients";
- line 420: `realUnitRadical` "*Needs:* §3.2 and `uniformCapitulationBound`";
- line 438: Layer 2's Dependencies;
- line 542: Layer 3's Dependencies.

**Claim.** Two §2.8 targets need §3.2. Layer 2's Dependencies (line 438) list neither Layer 3 nor §3.2, while Layer 3's Dependencies (line 542) list Layer 2. This is a layer-level cycle, which the build note at line 59 works around instead of resolving.

**Witness.** Lines 418, 420, 438 and 542, as quoted.

**Repair.** Move `uniformCapitulationBound`, `realUnitRadical` and `realUnitRadical_kummer`, with the second and third §2.8 Checks, into a new §3.6 after §3.2. Then:
- update the references to "§2.8" for these objects at lines 1563 (C_F) and 1565 (the unit theorem);
- delete the note at line 59.

If the author prefers to keep them in §2.8, add §3.2 to Layer 2's Dependencies and say that only these two targets use it.

## R05 (P3) — §7.5's locator does not contain the closure comparison

**Location.** `README.md` line 1058: "Prove `principalClosure_completionComparison` … (RJW, Proposition 13.13 and its proof, p. 193.)"

**Claim.** The cited proposition does not state the comparison of the closure with the completed units.

**Witness.**
- rjw line 3982: Proposition 13.13 is the class-field exact sequence.
- The closure is Definition 13.12 (line 3972).
- Closure = ℤ_p-span is Lemma 12.20 (line 3715, p. 186), applied via `V⊗ℤ_p↠E` in Corollary 13.16(iii)'s proof (lines 4027–4036).

**Repair.** "(RJW, Definition 13.12, p. 193, and Lemma 12.20, pp. 186–187, as used in the proof of Corollary 13.16(iii), p. 194.)"

## R06 (P3) — `0 < a` is not needed in three headlines

**Location.** `Suggested.lean` lines 93, 105 and 174, `(ha : 0 < a)`; README §1.5 line 193, "For every prime p and `a≥1`", and §7.4.

**Witness.** At a=0, K≅ℚ and ζ=1:
- `cyclotomicNumbers 1 1={±1}=𝓞_ℚ^×`, so both indices are 1 = h(ℚ);
- `indexRealUnits ℚ=1`;
- p∤`classNumber ℚ`=1.

The statements therefore hold without `ha`.

**Repair.** Delete `ha` from `primePowerCircularUnitIndex`, `primePowerHasseUnitIndex_one` and `vandiver_propagation`. Write a≥0 in §§1.5 and 7.4, noting that a=0 is ℚ.

## Verified sound

**Gate, build and dependency check.**
- `tauceti-roadmap … gate … IntegralIwasawaTheory --base origin/main` exits 0 with every check 0 and ends with `OK`.
- `lake env lean …/Suggested.lean` exits 0 in 4.4 s with exactly six `declaration uses sorry` warnings, at lines 93, 105, 126, 148, 159 and 174.
- The dependency check prints `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)` and exits 0: no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/IntegralIwasawaTheory'` is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`).
- No `lemma`, `set_option`, `#eval`, `True`, LaTeX or process words.
- No citation of any roadmap on the brief's never-cite list.

**Signatures and padding.**
- `#check @` of all six theorems on a scratch copy gives the types in signatures.md, with no binder lost. Each matches its README statement and generality (§§1.5, 3.3, 4.1e, 5.6, 7.4).
- One-tactic probe (`first | simp | rfl | norm_num | decide | infer_instance | (intros; simp_all)`): all six fail with unsolved goals, so there is no padding.
- Every statable headline is stated. The docstring names the unstatable ones and their missing carriers:
  - §1.8: the norm-generated circular group;
  - Layer 2 and §4.4: completed unit localization and 𝔛_S;
  - Layers 5–6: Kubota–Leopoldt and Deligne–Ribet; Tau Ceti at the pin has neither;
  - §§9.7, 11.7 and Layer 12: ∇, the Burns–Flach complex, and equivariant L-values. Tau Ceti has `heckeLFunctionC` for ray class characters but no global Artin map relating Gal(H/F) to them.

**Library declarations opened at the pins.**
- `NumberField.IsCMField.indexRealUnits` (`CMField.lean:358`) is `(realUnits K ⊔ torsion K).index` and needs no CM instance. `realUnits` is defined at line 269.
- `maximalRealSubfield` (`TotallyRealComplex.lean:126`) is `{x | ∀ φ, star (φ x) = φ x}`, which is all of ℚ for ℚ.
- `Ideal.span_singleton_mul_left_mono` needs `IsDomain` (`Operations.lean:431`), as the §9.4 Check says.
- `AddSubgroup.index_range` (`GroupTheory/Index.lean:915`, `to_additive`).
- `exteriorPower.pairingDual_ιMulti_ιMulti` (`ExteriorPower/Pairing.lean:71`).
- `IsPrimitiveRoot.geom_sum_isUnit` and `associated_sub_one_pow_sub_one_of_coprime` (`CyclotomicUnits.lean:100, 61`).
- Each of the following `#check`s at the pin: `Rat.classNumber_eq`, `add_pow_char_pow`, `LinearIndependent.units_smul_iff`, `PadicComplex.isAlgClosed`, `IsUltrametricDist.of_normedAlgebra`, `Nat.Prime.sub_one_mul_multiplicity_factorial`, `NormedSpace.exp_add_of_mem_ball`, `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `dedekindZeta_residue_def`, `IsCyclotomicExtension.Rat.isCMField`, `Representation.dual_apply`, `DomMulAct.mk` and `NumberField.classNumber_pos`.
- All 133 backticked names in lines 33–51 exist at the pins. The 17 that are not declarations are existing module files, plus `IntegralRibet.local_ribet`.
- Tau Ceti `Padic.*` exp/log (`ExpLog.lean:95–119`) carry the hypothesis `1<(p−1)i` on closed discs, as line 49 says.

**Cross-roadmap citations resolved.**
- On main (`3d6e09e`): ClassFieldTheory Layers 5, 7–8 and 10–13; ProfiniteCohomology; DerivedModuleAlgebra §§0.I.1, 1.1.1 and S.1 (lines 555, 1666, 2316); EtaleCohomologyFoundations §§F.0–F.4.6 and 0.11 (line 1157); SchemeAndStackFoundations §2.6 `ample_serre_vanishing` (line 3445); LFunctions Layers 3 and 5; ModularForms Layer 8; ModularCurves Layer 10; RepresentationTheory/CharacterTheory Layer 3 and CompactGroups Layers 4–5; PadicMeasuresIwasawaAlgebras §§4.7, 5.2, 6.1 and 6.7.
- In `Completed/` on main: GlobalNumberFields Layers 2 and 10; LocalFieldsRamification Layer 3; LocalGaloisGroups Layer 0; ProfiniteArithmetic §1.3.
- IntegralHeckeAndGaloisDeterminants (#1689, head 0609cf2, merge position 26, before 28): `IntegralRibet.local_ribet` at `Suggested.lean:582`, Layer 6 at README line 3499. Its hypotheses match §9.6: coincident residues, an Artinian principal ideal ring, and the finite lattice Λ with induced adic topology.
- Every consumer named in "Downstream consumers" is later in the merge order: ColemanPowerSeries 30, CyclotomicClassGroupsAndStickelberger 33, ArithmeticGaloisDuality 59, SelmerIwasawaCohomology 83, DirichletPadicLFunctions 93, EulerSystemsAndKolyvaginSystems 102, AutomorphicGaloisRepresentations 164, EulerSystemsCyclotomicMainConjecture 166 and PadicFamilies 170.
- ArithmeticGaloisDuality (line 131), DirichletPadicLFunctions (line 4), ColemanPowerSeries (line 21) and EulerSystemsAndKolyvaginSystems (lines 77 and 4067) import §2.0, §5.0, §§7.1–7.3 and §12.6 by name. For these objects this roadmap is the single owner, being earliest. The exceptions are R01 and R02.
- overlaps.md lists no pull request changing this roadmap and no dropped identifier. I checked this against the five closest roadmaps above.

**Seeded sample (15 targets), checked against the texts.**

| § | Locators verified |
|---|---|
| 2.0 | sharifi Thm A.0.6 and Rem A.0.7 (lines 6023, 6028, p. 186); Thm A.0.8 (line 6034, p. 187); `Aᴰ=T^∨(1)` and the Ш shift 3−i match. |
| 2.3 | sharifi Rem 3.2.5, Prop 3.2.6, Cor 3.2.7 (lines 2366–2388, p. 79); Def 3.2.10 and Prop 3.2.11 with (3.2.1) (lines 2400–2414, p. 80); Props 3.2.20–3.2.21 (lines 2497–2506, p. 83); Rem 3.2.9 (real place stays real). |
| 2.8 | sharifi Props 3.4.1–3.4.2 (lines 2690 and 2719, pp. 90–91, p odd); Prop 3.2.15 (p. 82) and Cor 3.2.16 (p. 83). kolster1989 norm-minus convention (line 47, p. 249); Iwasawa's `H¹=B⊕(ℚ₂/ℤ₂)^r`, `H²=(ℚ₂/ℤ₂)^{r−1}`, `1≤r≤d` and `|H¹(Γ,μ₂⊗ℰ)|=2^{s+r−1}` with `2^s=|₂B|` (lines 72–81, pp. 249–250). yamashita Lemma 3 (line 86, p. 77); Lemmas 4, 5, 7 (p. 78); theorem (line 167, p. 79). |
| 4.1a | Mathematics recomputed (table). Koblitz not readable (below). |
| 4.2 | sharifi Thm 1.5.17 (line 962, p. 33), stated for p-adic units; the reduction from all algebraic α via `α^N=p^k u` is sound. rousseau Théorème (line 38, p. 11-01). |
| 6.1 | dk Σ,Σ′ and Θ definition (lines 103–115, p. 3; requires Σ⊇S_∞); dksw (1)–(4) and Thm 1.2 (lines 111–171, pp. 3–5), which drop that requirement, so the README's generality is supported; dk (5) p. 5 and (7) p. 7. |
| 6.2 | dk (1) and (2) (lines 125 and 129, p. 4); kurihara (4) (line 237, p. 7); kurihara (11) `τ(θ^#)=g` with `τ(σ)=κ(σ)⁻¹σ` (line 875, p. 23). |
| 7.3 | rjw Lemma 12.18 (line 3659, p. 185); Lemma 12.20 (p. 186); Lemmas 12.21–12.22 (lines 3754 and 3772, p. 187); Thm 12.23 (line 3790, pp. 188–189). `q_a=wγ_{n,a}` with `w=ω(b)⁻¹`, and `Col(c(a))=([σ_a]−1)ζ_p`. |
| 7.5 | rjw Def 13.12 and Prop 13.13 (p. 193); Cor 13.14 (p. 193); Cor 13.16 (p. 194). The first locator is R05. |
| 7.8 | sharifi-aws Thm 2.5.1 (line 677, p. 21); Thm 2.5.4 (line 708, p. 22); Thms 2.5.6–2.5.7 (lines 740 and 748, p. 23); `f_k=1` for `k≡0 mod p−1` (line 673). |
| 9.4 | dk Thm 8.23, including `ϕ(U)y=0⇒y∈(Θ#)` (lines 2425–2438, p. 64); dksw Cor 3.6 (line 871, p. 25), Cor 3.8 and Thm 3.9 with divisor `2^n` (lines 900–928, p. 26). |
| 9.5 | dk (110) (line 2488, p. 66); dk §9.2 (113)–(116) (pp. 68–69); dksw (43)–(44) (p. 27), Lemmas 3.10–3.12 (pp. 27–28), Thm 3.14 (line 1039, p. 29). The README's "absolutely irreducible" is stronger than Thm 3.14(2), and true for classical weight ≥2. carayol Thm A (p. 410) and §§0.10–0.11 (pp. 411–412). |
| 10.4 | kolster2009 Lemma 1.1, `|M^Γ|/|M_Γ|=|f(0)|` (line 98, p. 6); Lemma 1.2, `f*(κ(γ)^{−n}(1+T)−1)` (line 126, p. 7); Props 3.1–3.2 (lines 383 and 391, p. 14). kurihara Thm 4.1 (line 882, p. 24); first remark, `(γ−1)g` at the augmentation prime (line 993, p. 27). |
| 11.4 | kurihara Thm 2.12 (p. 14) and Lemma 4.2 (line 924, p. 25). The relation-lifting argument was rechecked: minimal cover, cancellation to size r, `K∩I_nR^r⊂𝔪K` by Artin–Rees once `ω_n∈𝔪^N`, then Nakayama. |
| 12.4 | kolster1989 Thm 1 (line 51, p. 249) and Lemma 2, `|(T⊗A⁻)^Γ|∼f(u⁻¹−1)` (line 91, p. 250). That value is consistent only with the covariant dual, as the README states. kurihara Lemma 4.2 (p. 25). |

**Adversarial pass.** One row per statement, with values computed on each side.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `primePowerCircularUnitIndex` | p^a=2, 5, 8; a=0 | 2: `⟨−1,2⟩∩ℤ^×={±1}`, index 1=h(ℚ). 5: `γ=ζ²+ζ³=−φ` generates the units of ℚ(√5) mod ±1, index 1. 8: `ζ⁻¹+1+ζ=1+√2`, index 1=h(ℚ(√2)). a=0: both indices 1 (R06) | holds |
| `primePowerHasseUnitIndex_one` | ℚ, ℚ(i); F(12) as negative control | ℚ: realUnits = all units, index 1. ℚ(i): `μ₄` = all units, index 1. F(12): `(1−ζ)/(1−ζ̄)=−ζ₁₂` generates μ₁₂, index 2 | holds; prime-power hypothesis needed |
| `classNumberGrowth` | cyclotomic ℤ₂ over ℚ; base shift | `v₂(h)=0` at every layer, so (0,0,0). `e_{n+r}` gives `(p^rμ,λ,ν+rλ)`; `e_n=2^n` shifted gives μ=2 | holds |
| `bakerBrumer_expDisc` | ι=∅; ℓ=1 in ℂ_p; p=2, x=2 | ∅: β₀=0. ‖1‖=1>ρ_p and exp(1)=0, with −1+1·1=0, so the disc hypothesis is needed. `‖2ⁿ/n!‖₂=2^{−s₂(n)}`=1/2 at powers of 2, so the disc is open | holds |
| `ferreroWashington` | E=ℚ, p=2 | ℚ(ζ_{2^{n+1}}) are the layers of ℚ(i) shifted by 1; h odd, so (λ,ν)=(0,0) | holds |
| `vandiver_propagation` | p=3; p=2; a=0 | h(ℚ)=h(ℚ(ζ₉)⁺)=1; p=2 makes the condition false; a=0 gives h=1 | holds |
| §2.0 real places | p=2, ℤ/4 trivial | `H⁰=ℤ/4` and `Ĥ⁰=ℤ/4/2=ℤ/2` differ; p odd gives Tate groups 0 | Checks correct |
| §2.3 ranks | ℚ(i), totally real | `rank_Λ 𝔛_S=r₂=1` and 0; X torsion | correct |
| §2.8 cohomology | B=ℤ/4; r=1, B=0; ℤ/6 with j=1 | #B[2]=2, #B=4; order 1·2⁰=1; minus quotient ℤ/2 against eigenspace {0,3} | Checks correct |
| §4.1a disc | p=2, 3; n=4 | ρ₂=1/2=‖2‖; ρ₃≈0.577>1/3; ‖24‖₂=1/8=ρ₂³ against Tau Ceti's 1/16; ‖x‖<ρ₂ iff ‖x‖≤1/4 (i=2) | correct |
| §4.2 kernel | α=−1, p=2; i=1 | N=2, u=1, ℓ=0; i=1 violates e<(p−1)i (1<1), and exp(log(−1))=1 | correct |
| §6.1 Θ | ℚ, Σ={∞}; split prime | Θ(0)=ζ(0)=−1/2, and #Σ=1 so no antisymmetry; depletion 1−1=0 against smoothing 1−Nv | correct |
| §6.2 smoothing | T={3}, {2}; τ transport | (1−3)(−1/2)=1; (1−2)(−1/2)=1/2 and −1≡1 mod 2; `(τ⁻¹(σ−1))^#=−σ⁻¹(σ−κ(σ))` | correct |
| §7.3 generator | p=3, b=2 | (1−b)/2=−1/2≡1 mod 3; `c̄=ζ^{1−b}c`; `c≡b mod π`, so `ω(b)⁻¹b≡1` | correct |
| §7.5 first layer | p=3 | F(1)⁺=ℚ, units ±1, −1≢1 mod 3, closure trivial | correct |
| §7.8 | k≡0 mod p−1 | excluded; the AWS convention `f_0=1` is not the cleared numerator | correct |
| §8.2 Check | ℚ(ζ₃₇), T={3} | `Σaω(a)^{−5}≡0`, `Σaω(a)^{−31}≡777=21·37 mod 37²`; factors 22 and 12; χ₃₁(Θ)≡−21·12≡7 | correct |
| §8.3 Check | ℚ, Σ={∞,3}, Σ′={7} | 3 has order 3 in (ℤ/7)^×/±1; generator −27; with {∞,2}: 8 and ord₂=3, giving ℤ/3 | correct |
| §8.4 Check | ℚ(i), T={5} | i≡3 mod (2+i); Cl^T cyclic of order 4; 3+2i↦(4,2) and 1+i↦(4,3), both generators | correct |
| §9.4 cancellation | x=0, A=0, J=R | xJ=0⊂(0) but J⊄(0); regularity needed | Check correct |
| §9.5 oldform basis | A=aI₂ over E[U]/(U−a)² | stays scalar, so cannot reach diagonal U; nonscalar case gives the companion basis | correct |
| §10.4 determinant | ×2 in degrees (1,2), (2,3); M=Λ/T | Det⁻¹=(2) and (1/2); n≠0 gives `|u^n−1|⁻¹`, n=0 infinite | correct |
| §10.5 Check | ℚ, n=2, S₀∪{3} | `v₂(24·(−1/12))=1`, then ×#ℤ₂/(3−1)=2, total 4 | correct |
| §11.4 lifting | M=0; M=R | r=0 with det 1; zero 1×1 matrix, so not torsion | correct |
| §12.4 involution | γ=u²; ι∘ι | `ι_u(u²)=u⁻¹`; `char X(S)=2^d f_F(u/(1+S)−1)` from §10.6 | correct |
| §3.3 Check | B₃₂ | B₃₂=−7709321041217/510, with numerator 37·208360028141 | correct |
| §6.3 Check | N=3, odd χ | χ(B₃)=−1/6−1/6=−1/3; L(χ,0)=1/3 | correct |
| R01 target (§9.5) | F=ℚ | Deligne's parabolic H¹: the same object as AlgebraicModularFormsAndSerreWeights §6.1 | duplicated |
| R02 target (§1.5) | ℚ(ζ₃), ℚ(ζ₈) | Q=1 in both; the #1260 statement is the p^r>2 case of ours | duplicated |
| R04 targets (§§2.8, 3.2) | Needs edges | §2.8 needs §3.2, and §3.2 needs §§2.1–2.4 | coarse cycle |

## Not verifiable

- **NSW, *Cohomology of Number Fields*, electronic edition 2.3** (§§2.0, 2.2, 2.6, 10.5): the sources service resolves the PDF to the author's HTML index page.
- **Burns–Flach, Math. Ann. 305** ((1.9) and Prop 1.20, used in §§2.0 and 10.1): the GDZ volume link returns only a script page, with no article text.
- **Koblitz, GTM 58, Ch. IV §1** (§4.1a): no legal open copy.
- **Wiles, Invent. Math. 94, and Taylor, Invent. Math. 98** (§9.5): only GDZ volume landing pages are linked. The attribution is corroborated by dk line 2474 ("[53, Theorems 1 and 2]").
- **Baker, Chapter 2; Hindry–Silverman §D.4; Katz, Cor. 4.4.2**: not legally available.

## Source issues

- none
