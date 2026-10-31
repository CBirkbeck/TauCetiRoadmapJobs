# Review of PotentialModularityAndCompatibleSystems (pull request #1075 at 29f6025)

**Verdict:** needs changes

The mathematics of the folder held up under the adversarial pass and the seeded source sample: no false statement, no vacuous target, no unowned prerequisite, no padding and no missing statable headline were found. The verdict is "needs changes" only because the push gate fails (R01, a style rule) and the gate must pass before acceptance. R02–R05 are notes the author may take or leave.

## R01 (P3) — Gate failure: 116 `<a id=…>` anchor tags in the README

Location: `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md` lines 92, 98, 120, 150, … (every layer and target heading is preceded by `<a id="target-…"></a>`).

Claim: the gate's residue rule forbids `<a id=` anchor tags; the worker's gate reports `residue=116 … FAIL`, and no acceptance is possible while the gate fails.

Witness: `gate.md` for this head lists the 116 lines; the first is line 92 `<a id="layer-r24-5-operations"></a>`.

Repair: delete every `<a id="…"></a>` line. The *Needs:* lines link to these anchors (for example line 136 `[Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n)`), so replace each such link by a plain section citation in house style (`§1.1`, `§2.8 (the integral-point theorem)`); the dependency check parses `*Needs:*` text, not anchors, so nothing else changes. Re-run the gate; it must report `residue=0`.

## R02 (P3) — Supplier declarations cited by names that do not exist at the suppliers' open heads

Location and claim: the README cites the following backticked declaration or slug names of open-pull-request suppliers. Each cited section exists and states the mathematics the README consumes, but the name does not occur in the supplier's README or `Suggested.lean` at its current head (index of 2026-10-31):

- line 1569 and line 1596: SerreWeightAndLevelOptimisation §6.6 `kwOptimisationData` — §6.6 "KW optimisation data" exists at #1013 but declares no such name.
- lines 74, 108, 120, 128 and §12.4: AutomorphicGaloisRepresentations §7.1 `AutomorphicSystemData.IsAlmostStrictlyCompatible` and `HilbertSystemRealizations` — §7.1 at #1007 defines almost-strict compatibility in prose only (lines 3008–3016 of that README) and names neither.
- lines 318, 338, 397: AutomorphicGaloisRepresentations §3.13 `geometricCharacter_isHeckeAvatar`, `geometricCharacter_totallyReal` — §3.13 exists, neither name occurs.
- line 1694: OrdinaryAutomorphicFormsAndModularityLifting §2.1 `IsOrdinary`, `IsSmoothOrdinary` — §2.1 states the ordinary/smooth-ordinary distinction in prose (`δ_v`, `ν_v`) without these names.
- lines 872, 892: GL2AutomorphicRepresentationsAndTransfer §R16.1.7 `chevalley_finiteIndex_congruence` — only `chevalley_power_congruence` and `finite_hecke_full_local_prescription` exist there.
- line 2119: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5 `savitt-residual-types` — the sections are headed "R07.5.9 Savitt's reductions …" and "R07.5.10 Residual types of potentially Barsotti–Tate representations …"; no slug.
- lines 2034 and 2143: GL2ModularityLifting `Layer 5/kw-i-theorem-4-1-odd-prime`, `Layer 6/kw-i-theorem-4-1-dyadic`, `§9.2/totally-real-dyadic-lifting` — the targets are §5.18, §6.16 and §9.2 of #1071; the slugs do not exist.

Witness: `roadmaps show --pr N <Name>` for each; `grep -c` of each name in the printed README and `Suggested.lean` returns 0 (worker's `citations.md` lists the first five under "Lean names found nowhere").

Repair: cite each by roadmap and section only (for example "SerreWeightAndLevelOptimisation §6.6", "AutomorphicGaloisRepresentations §7.1 (almost-strict compatibility)", "GL2ModularityLifting §§5.18, 6.16, 9.2"), dropping the invented names.

## R03 (P3) — Backticked names of this roadmap's own that `Suggested.lean` does not declare

Location: throughout the README's API bullets, for example line 134 `CompatibleSystem.IsAlmostStrict`, line 505 `LarsenData.componentField`, line 604 `SkolemDatum.IntegralPoint`, line 1580 `AuxiliaryField.piA`, line 2070 `brauerSystem`; the worker's `citations.md` lists 47 such qualified names and every unqualified API name (`induce`, `characterSystem`, `partialLFunction`, …) is in the same position.

Claim: house style says an API bullet carries a backticked Lean name only when `Suggested.lean` declares it; `Suggested.lean` declares exactly `additiveStrongApproximationAwayFromPlace`, `maximalSplitExtension`, `splitField_points_dense` and `Presentations.finite_presentation_complete_intersection`.

Witness: `Suggested.lean` lines 46, 63, 74, 92 are its only declarations.

Repair: keep backticks only on those four names and on library or supplier declarations; write the other API items as prose names (the gate's `readme-ids-missing` check passes either way, so this is style only).

## R04 (P3) — Two loose locators

- Line 33: "AlgebraicVectorBundles Layer 0 supplies geometric tensor/dual infrastructure". AlgebraicVectorBundles on main has no "Layer 0" heading; its layers are "L0A — sheaves of modules", "L0B — quasicoherent and finite locally free sheaves", "L0C — polynomial operations" (main README lines 215–254). Cite "AlgebraicVectorBundles L0C (polynomial operations)".
- Line 308 (§1.8): "[BLGGT v4] §2.1, p.31; §5.1, p.62; tensor-product use in §4.3". §4.3 of arXiv:1010.2561v4 is "Lifting Galois representations II" (Theorem 4.3.1, blggt-2014-v4 lines 2469–2500); it contains no tensor-product multiplier rule. The multiplier and sign rules of §1.8 follow from the pairing identities of §2.1 p.31 (lines 1394–1409) alone; drop "§4.3" or replace it by the place where a tensor with an induced character is formed.

## R05 (P3) — Conventions paragraph names a module path, not a declaration

Line 33: "Tau Ceti's `HeckeCharacter/Purity.lean` supplies the purity of infinity types". The declarations are `TauCeti.GlobalNumberFields.HeckeCharacter.exists_weight` and `IsAlgebraic.exists_weight_norm_apply` (`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Purity.lean` lines 112 and 136), already cited correctly in the supplier contract at line 65 and in §1.10. Cite the declaration names here too.

## Verified sound

**Gate and dependency check.** The worker's gate at 29f6025 passes every check except `residue` (R01): `set_option=0 … sorry-data=0 … depcheck=0 … build=0`. I re-ran the dependency check:

```
depcheck: 205 roadmaps, 1452 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The merge order lists this roadmap at line 156, after GL2ModularityLifting (155) and ClassicalSerreModularity (150), and before its consumers PotentialAutomorphyInfrastructure (173) and ModularityAndLanglandsExtensions (176). `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Lean.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all four declarations: `sorry` the only warnings, exit 0. The four elaborated types agree with the README statements (§2.5a, §2.10, §10.2); no section binder is lost (each declaration carries `K`/`[NumberField K]` or `O`/`R` with its instances explicitly). One-tactic probes: replacing each `sorry` by `simp` or `aesop` leaves all three goals unsolved (`probe-tactics.log`, exit 1 both times); `infer_instance` does not apply to `Prop` goals of this shape. No padding, no `set_option`, no sorried data, a single `import Mathlib` plus one existing `TauCeti.*` module.

**Headline coverage.** The README's headline theorems are the integral-point theorem (§2.8), split-field density (§2.10), controlled residual potential modularity (§4.13), potential modularity of a given lift (§5.1), global-ring finiteness (§§8.2, 8.7), prescribed lifts (§10.4), families through lifts (§§12.4–12.5), linked-system transfer (§13.3), and in Layer 1 the monodromy and density-one theorems (§§1.17–1.21). The module docstring names the carriers each unstatable one lacks (Skolem data and local analytic topology, compatible-system data, Weil–Deligne parameters, Hilbert moduli, Hecke algebras, deformation rings); I confirmed none of these exist at the pins (no number-field strong approximation, no `AutomorphicSystemData`, no deformation-ring or Hilbert-moduli carrier in Mathlib `6b7abb3c` or Tau Ceti `a91d3aaf`). The three statable headlines are stated; `maximalSplitExtension` is the one simple definition they need and has a real body.

**Ownership.** `roadmaps grep --lean-only` for Moret-Bailly, split-field density, `maximalSplitExtension`, strong approximation and `complete_intersection` finds no other `Suggested.lean` declaring these objects (AdelicAlgebraicGroups #792 declares `HasStrongApproximation` for algebraic groups, a different object). Completed/GlobalNumberFields Layer 6 owns only `FiniteAdeleRing.denseRange_algebraMap` (archimedean places omitted); the README says so and §2.5a's "away from one arbitrary place" statement is a genuine extension, not a restatement. Sibling checkouts named in the brief were searched by object through the roadmaps index; ownership against pull requests whose files the brief does not provide was not checked.

**Seeded source sample.** Cache files are cited as `<id> line N`.

| Target | Source and locator | Lines read | Result |
| --- | --- | --- | --- |
| 1.2 | KW I §5 pp. 7–8 (kw-serre-modularity-I 3c389dc3 lines 288–326) | strict / plain / almost-strict definitions | matches: plain compares WD only for q∤l and asks crystallinity for l≫0; almost strict adds the irreducible-residual and (l≠2, r_q unramified) clauses |
| 1.2 | DP Definition 1.10 pp. 6–7 (dieulefait-pacetti 0c6850da lines 273–301) | 5-tuple, (4) de Rham at ℓ|N(𝔭), exception clause | matches, including "odd and unramified still requires (6)" |
| 1.3 | ACC+ §7.1 pp. 1084–1085 (acc-2023 c5429e4f lines 7592–7628) | very weak (5b)(5c), extremely weak = drop (5b) | matches |
| 1.8 | BLGGT v4 §2.1 p. 31 (c953df62 lines 1394–1409); §5.1 p. 62 (lines 2852–2858) | pairing laws, ε_v = −μ(c_v), polarized systems | matches; §4.3 locator loose (R04) |
| 1.16 | BLGGT v1 §5.4 items (1)–(9) pp. 61–63 (697e2d31 lines 2785–2878) | ring, trace, dim, pairing, (5)–(9) | matches item by item |
| 1.19 | BLGGT v4 Lemma 5.2.1 pp. 66–67 (c953df62 lines 3063–3119) | (1)–(4) | matches, including the integral-unit comparison `S̃(ℤ_l)=O^×` |
| 1.20 | BLGGT v4 Prop. 5.2.2 pp. 68–70 (lines 3122–3257); Larsen–Pink Props 8.7–8.9 (larsen-pink 7b904ef1 lines 862–899); Bruhat–Tits II 5.1.40 printed p. 161 (bruhat-tits-II 8ebdf6e3 line 5982) and 5.2.8 (line 6109) | six conclusions and the four cited inputs | matches; Larsen 1995 Thm 3.17 and Bogomolov not readable (below) |
| 2.17 | Qian Prop. 4.2, arXiv v1 p. 23 (qian 4110023d lines 1156–1170) | S₁⊔S₂⊔S₃, S₂ nonarchimedean, Galois-invariant opens, disjoint from H | matches |
| 2.20 | Bianchi Prop. 4.5.1 pp. 48–49 (bianchi 0ad015df lines 2453–2488); BLGGT v4 Prop. 3.1.1 p. 41 (line 1824) | F CM Galois over ℚ, σ(L_v)=L_{σv}, F′_w≅L_v, surjective finite quotient via Serre Cor. 9.12 and Jordan | matches |
| 2.23 | BHKT Thm 9.3 (bhkt arXiv v2 ec54cf92 lines 2367–2376); Calegari 3.2 pp. 5–6 (calegari 8c95a021 lines 223–241) | S-split K′, H-Galois M/K′, local isomorphisms; real c_v, disjointness | matches |
| 3.5 | Taylor 2006 Lemma 4.2 p. 757 (taylor-2006 6ec26bfc lines 1326–1340), Lemmas 4.4–4.5 pp. 761–762 (lines 1494–1545); Snowden Prop. 5.3.1 pp. 16–17 (snowden b0c0008a lines 799–848) | unit η≡ζ mod 𝔞 by transfer; B=A⊗O_{EM}, κ′_σ=κ_σ⊗η_σ, trace polarization, two residue characteristics kill automorphisms; CM point | matches |
| 8.1 | KW II §2.7 pp. 14–16 (kw-serre-modularity-II 53f45f8b lines 602–693), §3.3.4 pp. 36–37 (lines 1763–1785), proof of Thm 10.1 pp. 90–91 (lines 4146–4205) | inertia-rigid universal DATA; twist-of-semistable matrices; the four field conditions incl. universal τ unramified outside p | matches |
| 10.10 | Snowden Thm 7.2.1 p. 21, Thm 7.6.1, Props 7.7.1, 7.8.1 (lines 1066–1068, 1166–1180, 1247–1248); DP Thm 1.9(4) p. 6 (lines 253–261) | finitely many solutions, exists iff local; compatible definite type on Σ′ | matches |
| 10.11 | DP proof of Thm 1.9 p. 6 (lines 258–261); KW I §8.2 pp. 13–15 (kw1 lines 539–640) | mod 3: (2) then (4) with ω²_{3,2}; mod 5: (2) then (3) with ω₅², new member (2)/(1) by 3∣N; inductive step (2), (3) with ω_P^i, new member by p∣N | table rows match |
| 11.1 | KW II §10.2 p. 92 (lines 4206–4229) | weight part of Serre for (α),(β); N>4 remark; k=p separate | matches |
| 13.3 | KW I §8.2 p. 14 "linked at 2" (line 585); DP Remark 4 p. 7 (lines 308–315) | link, Brauer–Nesbitt transfer | matches |

Headlines: Taylor FM Theorem G p. 5 (taylor-2002-fontaine-mazur e00ebd58, OCR, lines 153–160) is exactly `splitField_points_dense` (quasi-projective in the source; the Lean's separated smooth finite type form follows by the affine-open reduction stated in the docstring). Moret-Bailly II Lemma 3.8 p. 191 (moret-bailly-1989-II fcd52552 lines 414–427) is the torsor strong approximation of §2.5a, citing Cassels–Fröhlich II §15. Böckle Lemma 2 p. 5 (bockle-appendix-2003 67de08f6 lines 140–153) is `finite_presentation_complete_intersection`; its proof gives all five conclusions. Also checked: Taylor FM Lemma 1.1 pp. 7–9, Thm 1.6 p. 15, Cor. 1.7 p. 16; Taylor 2006 §6 p. 773 and Lemma 6.5 p. 774 (§§1.1, 1.14), Corrections pp. 776–777 (§§3.2, 4.7), §3 formula `i†∘i` (line 1111, matches §4.5); KW II §10.3.2 pp. 93–94 (§§12.1–12.2); Khare level one §2.1 p. 10 and Prop. 3.1 p. 16 (khare-level-one 3012a517 lines 417–426, 687); DDT Lemma 4.11 p. 119 (ddt 9884b64e line 4422); Dieulefait 2004 Thm 1.1 (dieulefait-2004 164b3f5d lines 32–39); Tung odd Thm 4.7 p. 15 (tung-odd 22017bc9 line 765), Tung dyadic Lemma 4.3.3 p. 21 and Thm 8.0.3 pp. 38–39 (tung-dyadic a601da37 lines 993, 1797); Rogawski–Tunnell Thm 2.9 (rogawski-tunnell 6a020942, OCR, line 1091: congruent weight>2 form only for Nλ ≥ N(π), as the Conditional inputs say); BLGG Prop. A.2.1 (rank-two-adequacy 31838df4 line 1532: non-adequate exactly PSL₂(𝔽₃) at 3 and PSL₂(𝔽₅) at 5, as §8.5 says); BLGGT v4 Lemmas 5.3.1 and 5.4.5 (lines 3264–3301, 3517–3550) for §§1.17, 1.22; Larsen–Pink Prop. 4.9, Lemma 4.10 p. 11 and Props 6.11–6.14 pp. 14–15 (lines 573–581, 728–748) for §1.17.

**Library declarations opened at the pins** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `IntermediateField.LinearDisjoint.inf_eq_bot`, `.iff_inf_eq_bot` (`Mathlib/FieldTheory/LinearDisjoint.lean`); `Representation.dual` (`Mathlib/RepresentationTheory/Basic.lean` line 670); `Representation.IsIrreducible` (`Mathlib/RepresentationTheory/Irreducible.lean` line 29); `Representation.ind`, `Rep.indResAdjunction` (`Mathlib/RepresentationTheory/Induced.lean`, `FiniteIndex.lean`); `RingTheory.Sequence.IsRegular` with its `top_ne_smul` field (`Mathlib/RingTheory/Regular/RegularSequence.lean` line 146, so "nonzero final quotient" is part of the definition as the README says); `Complex.Gammaℝ_mul_Gammaℝ_add_one` (`Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean`); `NumberField.Set.HasDirichletDensity` (`Mathlib/NumberTheory/NumberField/DirichletDensity.lean` line 82); `NumberField.IsCMField` (`CMField.lean` line 69); `PadicAlgCl`, `cyclotomicCharacter`, `Field.absoluteGaloisGroup`, `GeometricallyIrreducible`, `GeometricallyIntegral`, `topologicalKrullDim`, `IsModuleTopology`, `InfinitePlace.Completion`, `FinitePlace.embedding`; Tau Ceti `TauCeti.GlobalNumberFields.Place` (`Global/Places/Basic.lean` line 70), `Chebotarev.frobeniusPrimeSet`, `RigidifiedLineBundleClass` with `mk_eq_mk_iff`, `lift`, `pullback`, `toLineBundleClass` (`LineBundle/Rigidified/Basic.lean`), `mk_mk_eq_mk_mk_iff`, `stabilizer_eq_range`, `range_toLineBundleClass` (`Rigidified/Automorphisms.lean`), `rigidifiedPicardFunctor_map_mk` (`PicardFunctor/Rigidified.lean`), `TauCeti.repRing` (abbrev, `RepresentationRing/Basic.lean` line 106), `repRingCharacter`, `repRingRes`, `repRingInd`, `TauCeti.exists_simple_character_eq_of_characterPairing_self_eq_one` (`CharacterTable/VirtualCharacter.lean`), `TauCeti.GlobalNumberFields.HeckeCharacter.exists_weight` and `IsAlgebraic.exists_weight_norm_apply` (`HeckeCharacter/Purity.lean` lines 112, 136), `TauCeti.isOpen_range_powMonoidHom` (`LocalField/PowerSubgroup/Open.lean` line 42), `unitFiltration_one_le_range_powMonoidHom_of_isUnit` (`PowerSubgroup/Basic.lean`), `TauCeti.Place.exists_forall_mem_valuation_sub_le_and_forall_mem_integers` (`FunctionField/Consequences/StrongApproximation.lean` line 88), `InvertibleSheaf.trivial`, `LineBundleClass.mk_eq_mk_iff`, `Scheme.Modules.pullback`. All exist as cited.

**Cross-roadmap citations resolved.** On main: Completed/Chebotarev Layer 10, Completed/GlobalNumberFields Layers 0–1, 5–11 (`weakApproximation_denseRange` line 162), Completed/HeightsAndUnits §§4.2–4.3, Completed/RestrictedProducts Layers 0–2, Completed/LocalGaloisGroups Layer 0, ClassFieldTheory Layers 5, 7, 10–12 (`eq_zero_of_localInv_eq_zero`, `brRes`), RepresentationTheory/InductionRestriction Layer 6, SchemeAndStackFoundations §§1.15–1.16, 2.6, 2.20, 3.7, 4.12–4.14, 5.11 (`weil_bound`), EtaleCohomologyFoundations F.0, F.0.A1–A2, ReductiveGroupsPartII RG2.0.1–RG2.0.3, RG2.0a.2, RG2.2–RG2.3 with all twelve cited slugs (`scheme-point-topology` … `hyperspecial-vertices`), AlgebraicCurves Layers 0–5, JacobianChallenge Layer D, ReductiveGroups Layer 6, AlgebraicModularFormsAndSerreWeights (#928) "R15.4" = Layer 4 by that roadmap's own alias (its line 18), R15.6 = Layer 7. At open heads: ClassicalSerreModularity #1020 `I.2/full-kw-global-finiteness`, `I.3/prescribed-lifts`, `I.3/families-through-prescribed-lifts`, `I.3/residual-links-and-modularity-transfer`, `R26.1/bockle-appendix-minimal-deformation-ring-presentation` (lines 491, 553, 582, 598, 637; it lists this roadmap as consumer at line 80); GL2ModularityLifting #1071 §§1.7 (`cht_soluble_prescribed_completions`), 5.4, 5.18, 6.15, 6.16, 8.7, 9.2, 12.1–12.4, LL1–LL3/CC1–CC5/LC (line 190); SmallRamification #970 §5.0d `AutomorphicSystemData`; AGRPII #1006 AG2.P "Arbitrary-rank compatible data and operations" with `Weak`, `Strict`, AG2.6 "Weak, very weak and extremely weak automorphic data" with `ExtremelyWeak`, `VeryWeak`, AG2.0 `AlgHeckeChar`, AG2.7; AGR #1007 §§3.13, 6.10, 7.1, 7.3 (almost-strict predicate in prose, lines 3008–3016, agreeing with DP Definition 1.10 as §1.2 says); HMVSC #1005 H1.1, H1.8, H2.2, H2.2a–b, H2.6, H6.1–H6.9 (H6.5 with (C1)–(C6), (C6) being the norm-image condition the README carries as a conditional input), R18.3.1, R18.3.3, R18.3.5, R18.3.22; OAFML #1066 §§1.4–1.5, 2.1, 2.9–2.11, 4.20, 6.14 (Skinner–Wiles level-lowering base change), Layer 6; GlobalGaloisDeformations #920 §§3.3–3.8, 4.2, 5.1, 5.7, 6.1–6.4, 8.1–8.5, R04.6; LocalGaloisDeformationRings #923 §§1.3, 1.6, 1.9, 1.13, 2.15, 3.13, 6.7, 6.24, 8.2, 8.12, 8.15–8.19; DDPA #1034 Layers 3–6 and the cited subsections; PadicFamilies #1019 §§0a.4, 0a.14, 5.8; AMAG #853 §§3.1–3.5, 7.3 `rigidification_gm_torsor`, 7.6.1 `relativePicardSheaf`; CCPII #848 C3.2d.2 `relative_picard_algebraicSpace`, C3.2f.1–2 `picardZeroSheaf`, `picardZeroCriterion`, C5.1, C5.3; AFRG #1037 §§5.6, 7.4–7.6; ETUTC #999 §6.29; IHGD #1689 §§0.5, 1.3; WIEC #1001 R34.6; FFG #879 R07.3.4, R07.3.7, R07.5.9–R07.5.10, R07.1; NMSAV #852 §§3.14, 5.1, 5.3; ShimuraVarieties #933 §§5.3, 5.5, 5.10; ASAM #849 Layers A2, A5, A6, §§A6.30–A6.31; AGD #858 D7, R02.4; IGAFG #850 IG.2, IG.2.5, IG.2.6; AdelicAlgebraicGroups #792 Layer 1; ArithmeticGaloisRepresentations #856 Layers 1–7 and §§1.3, 1.6, 1.7–1.9, 1.12, 2.5, 2.7, 5.1, 5.3, 5.10, 7.1, 7.4 (`PolarizedRep`), 7.6, 7.9; PadicHodgeTheory #1062 §§4.4, 5.1–5.4, 6.1–6.2, Layers 3–6; G2ART #931 R16.1.7 (`chevalley_power_congruence`), R16.1.8 (`finite_hecke_full_local_prescription`), R17.3, R17.4.2–R17.4.16, R17.5, R17.6, R17.6.19. The only unresolved items are the names in R02 and R04. Every supplier is earlier in the merge order or on main; consumers named (PotentialAutomorphyInfrastructure #1081, ModularityAndLanglandsExtensions #1180, EllipticCurveModularityPartIIGL2TypeAbelianVarieties #1036) are later and are not cited as suppliers; WeightZeroCrystallineAutomorphyLifting is mentioned only as a future consumer.

**Adversarial table.** Values computed on each side; "no change" where both sides agree.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Δ dual polynomial | roots α,β with α+β=−24, αβ=2048 | dual (X−1/α)(X−1/β) = X² − (α+β)/(αβ)·X + 1/(αβ) = X² + (3/256)X + 1/2048 | matches `wcs_newform_delta` | none |
| Conventions: η(4z)⁶ at 3 | a₃=0, ψ(3)=χ_{−4}(3)=−1, k=3 | X² − 0·X + (−1)·3² = X² − 9 | matches | none |
| §1.6 extremely regular | H={0,1,3,7}; H={0,1,2,3} | 2-subset sums 1,3,7,4,8,10 distinct; {0,3} and {1,2} both sum to 3 | both Checks correct | none |
| §1.6 `pred_odd_purity` | n odd, v real (cτ=τ) | H_τ = w − H_τ forces the middle element w/2 ∈ ℤ | w even | none |
| §1.7 Sym²/tensor regularity | h₁≠h₂; H={0,1}, H′={0,−1} | {2h₁,h₁+h₂,2h₂} distinct; tensor sums {0,−1,1,0} | Sym² regular, tensor not | none |
| §1.7 ranks | n=2,k=3; k=0 | binom(2,3)=0 (zero system); ∧⁰ = unit X−1 | matches rank-zero Checks | none |
| §1.8 tensor multiplier | ε=ε′=+1, μ(c)=μ′(c)=−1 | uncorrected μμ′(c)=+1 gives ε=−μμ′(c)=−1≠εε′; μμ′δ(c)=−1 gives +1 | δ correction required | none |
| §1.8 dual / unit | μ(c)=−1; k=0 | μ⁻¹(c)=−1, sign unchanged; μ^0δ^{−1}=δ | matches `polarized_dual_sign`, unit multiplier δ | none |
| §1.9 cyclotomic family | ‖·‖ with geometric Artin convention, HT(ε)=−1 | Q_p=X−p⁻¹, H={−1}, |p⁻¹|²=p^{−2} ⇒ weight −2 | matches | none |
| §1.11 induced purity | residue degree f block | β^f=α, q_w=q_v^f ⇒ |β|²=q_v^w | matches BLGGT restriction rule (v4 line 2983) | none |
| §1.15 Euler factor | monic Q_v of degree n | det(1−r(Frob)q^{−s})⁻¹ = q^{ns}/Q_v(q^s); roots of modulus q^{w/2} ⇒ nonzero for Re s>w/2 | matches, convergence Re s>1+w/2 | none |
| §1.15 archimedean Checks | trivial: n=1,w=0,det c=1; cyclotomic: w=−2, det c=−1; E/ℚ: n=2,w=1; rank one det c=−1 | d±=(1±1)/2=(1,0) ⇒ Γ_ℝ(s); d+=(1+(−1)(−1))/2=1 ⇒ Γ_ℝ(s+1), ε=i⁰; Γ_ℝ(s−½)Γ_ℝ(s+½)Γ_ℂ(s)/Γ_ℂ(s−½)=Γ_ℂ(s), ε=i²=−1; (d+,d−)=(0,1), ε=i | all five Checks correct against v4 lines 2906–2934 | none |
| §1.15 complex place | H=H̄={0,1}, w=1 | Γ_ℂ(s−½)²·(Γ_ℂ(s)/Γ_ℂ(s−½))² = Γ_ℂ(s)², ε=i^{½+½+½+½}=−1 | matches | none |
| §1.16 pairing | A=2[V₁]−[V₂]; A=3·1−ε on C₂ | (A,A)=4+1=5; (A,A)=9+1=10, dim 2 | matches both Checks; criterion dim>0 ∧ (A,A)=1 ⇔ BLGGT's dim≥0 (A=±[V], dim≠0) | none |
| §1.18 `disconnected_centre` | G⁰=SO₄ | centre μ₂, connected centre 1, Spin₄→SO₄ kernel μ₂ | README's connected-centre convention consistent with BLGGT v4 lines 3003–3015 (which uses the full centre; both give a finite central isogeny) | none |
| §1.18 `theta_bound` | ℛ=ε^k over ℚ | θ_l: x↦x^{±k}, exponent |k| unbounded in ℛ | C(ℛ) depends on ℛ | none |
| §1.20 `SL₂` Check | Γ(l)⊂SL₂(ℤ_l) | compact open, not maximal | openness ≠ maximality | none |
| §2.1 `skolem_complete_Z` | R=ℤ, Σ={∞}, X=𝔾_m, Ω_∞={0<|z|<1} | unit x with all |σx|<1 ⇒ |N(x)|<1 but N(x)=±1 | no integral point; completeness kills the theorem | none |
| §2.1 geometric irreducibility | X=Spec O_E[1/2], E real quadratic, one real embedding | any point field contains E, half its real embeddings land outside Ω_∞ | Check correct; X_ℚ=Spec E not geometrically irreducible | none |
| §2.5 fibre dimensions | 𝔸¹⊂ℙ¹, Z={∞}; 𝔾_m, Z={0,∞}; g=1,z=1,d=1 | d+1−0−1=d; d−1; 1<2g+z−1=2 | matches Lemme 3.6 bound | none |
| §2.5 dual numbers | 𝔽₂(t), Z=V(x²−t) | over 𝔽̄₂: k[x]/(x−√t)²; units a(1+bε), quotient by scalars ≅ 𝔾_a | boundary torus fails | none |
| §2.5a strong approximation | K=ℚ: w=∞; w=2,T={∞}; no omitted place with (¼,¾) | ℚ dense in 𝔸_f; ℤ[1/2] dense in ℝ; integral everywhere ⇒ x∈ℤ∉(¼,¾) | Lean hypotheses `harch` force all other archimedean opens; statement is Cassels–Fröhlich II §15 as MB cites | none |
| `additiveStrongApproximationAwayFromPlace` degenerate | S=∅; K=ℚ, w=∞ (T=∅ forced); several infinite places with w finite | reduces to GNF Layer 6 when w=∞; else an open of the restricted product away from w | true in all instances | none |
| `maximalSplitExtension` model | S=T=∅; v complex; E₁,E₂ split at v | sSup = ⊤ (K̄); ℂ⊗E≅ℂⁿ always; K_v⊗E₁E₂ a quotient of (K_v⊗E₁)⊗E₂≅K_v^{n₁n₂} of dimension n₁n₂ ⇒ split | set is directed, sSup is the compositum = K_S; condition "K_v⊗E ≅ K_v^{[E:K]}" ⇔ v splits completely | none |
| `splitField_points_dense` | X nonempty (GeometricallyIrreducible ⇒ IrreducibleSpace ⇒ Nonempty); S=T=∅; U⊂X affine open | closed points dense; smooth X with x∈X(K_v) has U(K_v)≠∅ by the implicit function theorem | Theorem G exactly (Taylor FM lines 153–160); separated finite-type form by affine-open reduction | none |
| §2.11 count | D=K𝔽_{q^d}, C={φ^n}; D=K; quadratic constant extension | (#C/#G)·d·q^m/m = q^m/m for m≡n (d); q^m/m; identity class q^m/m in even degree, 0 in odd | all four Checks correct | none |
| §2.13 disjointness | K′ Galois split at Frobenius generators of Gal(D/K) | K′∩D normal, generators act trivially ⇒ K′∩D=K ⇒ linearly disjoint (Galois hypothesis of `iff_inf_eq_bot` met on K′) | correct | none |
| §2.14 towers | C⊆B⊆A, C⊆D, A⊗_C D ↪ AD | A⊗_B BD is a quotient of A⊗_B(B⊗_C D)≅A⊗_C D mapping injectively ⇒ A⊗_B BD ↪ A·BD, A∩BD=B | correct | none |
| §2.15 congruence proof | m=2^k with i∈B′; odd prime powers | Gal(ℚ(ζ_{2^k})/ℚ(i)) cyclic of order 2^{k−2}; (ℤ/p^k)^× cyclic; kernel over B′(ζ_m) acts freely on roots, Chebotarev fixed point ⇒ trivial | route sound; Checks `sUnitCongruence_sign` (Γ={±2^r}, Γ²∌−1) and `wang_control` (Gal(ℚ(ζ₈)/ℚ) not cyclic) correct | none |
| §2.20 Jordan via Burnside | H⊊G meeting every class | average fixed points 1 while fix(1)=[G:H]>1 ⇒ some g fixes nothing | correct; ℚ(i), 5 Check: Galois over ℚ forces equal local degrees | none |
| §3.2 Checks | l=5,k=𝔽₅; a²−a+5=0; [[0,−1],[1,−1]] over 𝔽₅ | N₀=ℚ(i,√−19), 5∤19, N₀/ℚ(√19) unramified at 2 (e=2 already) and 19; a a^c=5, a^c=1−a; X²+X+1 irreducible (disc 2 non-residue), M³=1 | all correct | none |
| §3.5 fineness | two residue characteristics p,q | automorphism trivial on both markings has p-power and q-power order ⇒ identity | matches Taylor Lemma 4.4 (line 1519–1521) | none |
| §4.5 nonminimal Check | q_x≡1 (l), F=I+t·diag(1,−1), T=I+tE₁₂ | FTF⁻¹=T^{q} mod t² (binom(q,2)B²=0); mod t³ needs [diag(1,−1),E₁₂]=2E₁₂=0 | fails for l odd; Check correct (l>2 suffices, l>3 is the standing hypothesis) | none |
| §4.5 Ihara adjoint | Taylor §3 | i†∘i = ψ(ϖ)(Nx)(1−Nx)(T²−(1+Nx)²ψ(ϖ)) (taylor-2006 line 1111) | matches README | none |
| §4.6 step 2 | p=3 vs p>3 | ε̄_p on index-2 inertia subgroup has order (p−1)/2 | trivial at 3, nontrivial for p>3; `aux_transfer_p_three` correct | none |
| §4.12 l=3 auxiliary prime | DDT Lemma 4.11 d=2 | if (tr)²/det=0 for all g∉ker ε̄₃ then ρ̄|ker reducible; contrapositive gives g with ε̄₃(g)=−1 and nonzero trace | correct; Nr≡−1 (3) and tr≠0 as stated | none |
| §4.15 dimensions | v|p over ℚ_p, v∤p, fixed determinant | framed relative dim (n²−1)+[F_v:ℚ_p]·1 = 3+[F_v:ℚ_p], Krull 4+[F_v:ℚ_p]; away: n²−1=3, Krull 4 | matches "5 at p, 4 away" and §8.8 "R† Krull dimension 5" | none |
| §8.3 `unitaryTwo_parity`; `scalar_q` | L/L⁺ unramified at all finite places; constant function at Iwahori level | [L⁺:ℚ] even (no imaginary quadratic field is unramified at every finite prime); U¹=q on constants, q^{r!}→0 | both Checks correct | none |
| §8.4 ℤ₃ example | Frob=[[1,6],[3,1]] | char poly (T−1)²−18, roots 1±3√2, √2∉ℚ₃ (2 non-residue mod 3), residual trivial | no stable ℚ₃-line though ordinary-image condition holds | none |
| §8.5 adequacy | rank two | BLGG A.2.1: non-adequate iff l=3 with PSL₂(𝔽₃) or l=5 with PSL₂(𝔽₅) | matches `rankTwoRT_adequacy_l3` | none |
| §8.6 δ_v Check | k=(2,4), v_τ=(1,0), l=3, u=4 | δ_v(u)=4^{−1}·4⁰=1/4≠1 | fails IsOrdinary, passes smooth-ordinary; agrees with OAFML §2.1's own Check (u=1+p) | none |
| §8.7 prolongation | ρ(c)=diag(1,−1); ρ(c)=1; J=(0,1;−1,0) | ρ(c)J⁻¹=(0,−1;−1,0) symmetric ⇒ ((A,1)j)²=(AA^{−t},1)=1, multiplier −1; J⁻¹ skew ⇒ square −1; J g^{−t}J⁻¹=g/det g for 2×2 | correct | none |
| §10.2 `finite_presentation_complete_intersection` | n=m=0; m<n with R finite; f with a unit entry | R≅O: flat, [] regular (O≠0), O[1/π]≠0; dim R≥n+1−m≥2 contradicts dim≤1, so vacuous; R=0 excluded by `Nontrivial R` | Böckle Lemma 2 proof (lines 143–153) gives m=n, (π,f) regular (permutation allowed in a Noetherian local ring), flat, R[1/π]≠0 | none |
| §10.5 dyadic type-4 Check | q=5: 𝔽₂₅^× of order 24, (i,j) with i+5j∈{3,9,15,21}, 0≤j<i≤4, i+j even; q=7: (6,0) | q=5: (3,0),(4,1) have odd i+j, 15 and 21 not representable ⇒ none; q=7: ω^6 of order 8, level 2, i+j even | both Checks correct | none |
| §10.5 `type3_parity_p2` | p=2,q=5 | ω₅ (i=1) odd excluded, ω₅² allowed, 2∣4 | correct | none |
| §12.5 p=5 Check | Ind ω₂² from unramified quadratic | inertia ω₂²⊕ω₂¹⁰, det ω₂¹²=ω² | correct | none |
| §13.1 cyclotomic irreducibility | l>2(a−b)+1, k=a−b+1 | DP Lemma 1.14: bad dihedral ⇒ l=2k−3 or 2k−1, both < l | correct | none |
| §2.7 unit quotient | 𝔽_q[t,t⁻¹], Σ={0}; Σ={0,∞}; Σ=∅ | t^ℤ absorbs the valuation, quotient of compact O_0^×; degree sum gives an unbounded ℤ-quotient; a point | three Checks correct | none |

Quantifier and context audit: every Lean statement carries its `[NumberField K]`, `[Smooth f] [IsSeparated f] [QuasiCompact f] [GeometricallyIrreducible f]` or `[IsDiscreteValuationRing O] [IsAdicComplete …] [Module.Finite O R] [Nontrivial R]` binders explicitly (signatures above); no `variable` is silently dropped. Unused hypotheses: `hf` (f i in the maximal ideal) in `finite_presentation_complete_intersection` is implied by `Nontrivial R` (a unit relation kills R); harmless, noted here only.

## Not verifiable

- Larsen 1995 (Duke 80, Theorem 3.17 and §§1.12–1.13, cited in §1.20): paywalled; the DOI landing page at Project Euclid offers no open PDF. Cited by locator; the statements are quoted through BLGGT v4 Prop. 5.2.2 (lines 3154–3157, 3190–3214), which I read.
- Bogomolov 1980 (C. R. Acad. Sci. 290, cited in §1.20): no open copy sought beyond the DOI; the use is as quoted in BLGGT v4 line 3002.
- Sen 1973 (Annals 97, Theorem 1, cited in §1.17): JSTOR DOI only; the application is BLGGT v4 lines 3281–3283, which I read.
- Altman–Kleiman 1976 (Bull. AMS 82, cited in §2.7): the AMS journal page fetch failed; not read.
- Skinner–Wiles, Base change and a problem of Serre (Duke 107, cited in §§4.4, 4.6): only a CiteSeerX/Internet Archive copy of unclear licence; not read. The statement is consumed through OrdinaryAutomorphicFormsAndModularityLifting §6.14, which I read.
- Thorne 2017 (Math. Z. 285, cited in §8.5): the Cambridge repository landing page returned HTTP 500 at fetch time; not read.
- Savitt corrected version and corrigendum (cited in §12.4): the JHU host answered 403; not read. The KW I remark after Theorem 5.1 (kw1 lines 418–420) attributes the weight computations to Savitt Cor. 6.15 and Remark 6.17 as the README says.
- Not in the sample and only partially read: Thorne 2012 (bigness), Calegari–Geraghty, Conrad–Diamond–Taylor, Gee–Geraghty, Geraghty, Newton–Thorne, Skinner 2009, CHT, KW Annals, BCGP, BLGHT, Poonen, Swinnerton-Dyer, Li–Long–Tu, Moret-Bailly I (all fetched into the cache from legal hosts; locators not checked line by line).
- Taylor FM (fm.pdf) and Rogawski–Tunnell are image-only scans read through OCR; Theorem G, Lemma 1.1, Theorem 1.6, Corollary 1.7 and RT Theorem 2.9/Prop. 2.8 were legible.

## Source issues

- **Error** in bhkt at Lemma 9.1(i), arXiv v2 p. 51 (published Acta p. 76): the source says the Isom scheme Z_{ψ,ϕ} is a geometrically connected finite étale K-scheme; it should be finite étale over Y_K, hence a geometrically connected curve over K; affects a stated result (the proof of Prop. 9.2 uses only Moret-Bailly on Z, so its conclusion stands); corrected in print at Beuzart-Plessis–Harris–Thorne, arXiv:2502.20611v1, p. 28.
- **Misprint** in moret-bailly-1989-II at Lemme 3.10.2, printed p. 192: the source numbers the Jacobian compactness lemma "3.30.2"; it should be 3.10.2 (its position between 3.10.1 and 3.10.3); affects nothing.
- **Error** in taylor-2002-fontaine-mazur at the standing hypotheses printed p. 130 (preprint p. 6), Lemma 1.4 and Theorem 1.6: the source omits det ρ = ε in the hypotheses and the proof of Lemma 1.4 is wrong; it should read det ρ = ε with the quadratic square-root reduction for Theorem 1.6; affects the proof; corrected in print at Taylor, Documenta Math. Extra Vol. (2006), Corrections, pp. 776–777.
