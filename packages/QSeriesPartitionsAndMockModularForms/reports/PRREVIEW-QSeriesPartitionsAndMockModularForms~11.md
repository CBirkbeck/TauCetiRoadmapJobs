# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at d8a67db)

**Verdict:** needs changes

This is an incremental re-review of the 108 lines that changed in `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/` since 08e719f: 41 in the README and 67 in `Suggested.lean`. Nothing outside the folder changed. Five of the six previous findings are repaired, and the repairs introduce no new defect. The remaining finding is P3 and concerns the pull-request description only.

## R01 (P3) — ModularForms §0.2 and the normalized Fricke convention exist only at the open ModularForms revision, which the description still does not name

This is the previous report's R03, not repaired.

**Location.** README line 836: “*Needs:* TauCetiRoadmap.ModularForms §0.2; Mathlib `ModularForm.eta_ne_zero`, …”. The same citation is at lines 13, 47, 48, 826, 846, 976 and 1770. Line 101: “the normalized Fricke operator, (√N)^(2−k) times the native weight-k slash by (0,−1;N,0)”.

**Claim.** §5.2 consumes ModularForms §0.2, and §4.8a consumes ModularForms' normalized Fricke convention.

**Witness.**
- ModularForms on main (ad30d94) has no §0.2 and no normalized Fricke operator in its conventions; it treats Fricke only in Layer 6, line 678.
- The open revision #1706 (head 75cafd5) has §0.2 (cited at its lines 28–33 and 124–125) and the Fricke normalization at line 95.
- The description's “Depends on” list still ends at #1063, and its merge order still ends “#1314 (HabiroCyclotomicCompletions) → this pull request”.

**Repair.** Description only. Add ModularForms (#1706) to “Depends on”, and place it before this pull request in the merge-order paragraph. The README keeps its roadmap-and-section citations. Tested: #1706 names this roadmap only as a consumer (its line 1541), so no cycle arises, and `gate --depcheck` prints 0 problems at this head.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 353–407 add `rankGenFun`, `rankCompletion`, `rankCompletion_modular` (Γ(N), common χ, 0<j<t) and `rankResidueDeviation_mock`. The docstring lists both laws. README §11.2 (lines 1717, 1724), §11.3 (line 1742) and line 133 name them.
- R02 — repaired: line 103 now reads “For a finite-rank holomorphic vector bundle E on a compact Riemann surface C and an effective divisor D of positive degree on every connected component, prove H¹(C;E(nD))=0 …”. The new subsection at line 109 cites ComplexKahlerGeometry K2 and K5b.1, as does §8.6's *Needs:*.
- R03 — not repaired: the description's “Depends on” and merge order still omit ModularForms #1706, whose §0.2 lines 13–1770 cite. Raised again as R01 above.
- R04 — repaired: line 69 now reads “HabiroCyclotomicCompletions §1.1 states these objects without Lean names; they are cited here by object.” Lines 188 and 315 cite “§1.1’s integral infinite Pochhammer product”. A grep finds no `QToolkit`, `pochhammerInf` or `integralPochhammerInf` left.
- R05 — repaired: line 121 reads “Layer 5 (elliptic regularity, §§5.1–5.7, targets E20–E26) … §3.1 proves real-analyticity only for harmonic functions”, and line 125 reads “Part II extension at Layer 5”. No “Lane” is left.
- R06 — repaired: line 1579 reads “Starting A₁ at n=0 would add the summand q⁰/P₀(q⁰;q)=1 … give A₁(0)=1 (likewise A₂(0)=2)”. This agrees with §10.3's A₂=Σ_(n≥1)q^(n(n−1))/Pₙ(qⁿ;q).

## Verified sound

### Gate and dependency check

- This review ran `gate … --base origin/main` at d8a67db. Every counter printed 0, from `set_option=0` through `source-material=0`, then `OK`, exit 0. The worker's gate adds `build=0`.
- `gate --depcheck … --movable` printed `depcheck: 229 roadmaps, 2316 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Placement in the merge order: this roadmap is at line 246. Its suppliers HabiroCyclotomicCompletions (47), GeometryOfNumbersAndQuadraticArithmetic (52), AutomorphicSpectralTheory (95), ArithmeticStatisticsPartIV (114) and MetaplecticAutomorphicForms (151) all come earlier. ComplexKahlerGeometry and PDE are on main, and neither cites this roadmap, so there is no cycle.

### Elaboration, signatures, padding

- `lake env lean` on `Suggested.lean` (Mathlib 6b7abb3c, Tau Ceti a91d3aaf) took 46 s and printed exactly 19 `declaration uses sorry` warnings and nothing else. That is 17 before this change plus the 2 new theorems.
- `signatures.md` lists 41 declarations, with 0 binders lost. The file has no `variable` line.
- A scratch copy added `#check @rankGenFun`, `@rankCompletion`, `@rankCompletion_modular` and `@rankResidueDeviation_mock`. The elaborated types match README §§11.2–11.3: t>1 and 0<j<t; t>0 with `r : ZMod t`; principal `Complex.sqrt`; `CongruenceSubgroup.Gamma N` with 0<N.
- One-tactic probe: each of the two new theorems was run with `first | rfl | simp | infer_instance | decide | (intro; simp) | (refine ⟨1, one_pos, fun _ => 1, ?_⟩; simp)`. Both fail with unsolved goals, so neither is padding.
- `rankResidueDeviation_mock` is not padding either. Its first conjunct needs §4.3's Durfee-square identity at all t-th roots of unity, and the only other rank identity in the file, `thirdOrderF_rank`, covers w=−1 alone.
- No sorry'd data and no `set_option`. The imports are unchanged.

### Context and degenerate cases of the new statements

- `0<N` matters. `Gamma 0` is the kernel of reduction to `ZMod 0 = ℤ`, so it is {1}, and with it the law holds vacuously (χ(1)=1).
- With t=1, `Finset.Ioo 0 1 = ∅`, so Φ=0. The deviation is N(0,1,n)−p(n)=0 and both sides vanish (computed 0 = 0).
- `ZMod.val` is used only with t>0.
- `rankGenFun`'s denominators 1−w^(±1)q^(i+1) are nonzero for |w|=1 and |q|<1, and cτ+d≠0 for Im τ>0.

### Library declarations opened at the pins

- `CongruenceSubgroup.Gamma`: `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`:41, the kernel of `SLMOD(N)`; `Gamma_mem` is at :50.
- `Complex.sqrt a = a ^ (2⁻¹ : ℂ)`: `Mathlib/Analysis/RCLike/Sqrt.lean`:26.
- `ZMod.val`: `Mathlib/Data/ZMod/Basic.lean`:57.

### Cross-roadmap citations resolved

**ComplexKahlerGeometry on main (ad30d94).**
- K2 is at line 193. Its closing paragraph proves `H^q(M;𝒪(Ω^p⊗E))≃H^(p,q)(M;E)` for finite-rank holomorphic E, with naturality, and `Ω^(n,q)(E*)≃Ω^(0,q)(E*⊗K_M)`, after K4 (line 444) constructs 𝒪(E).
- K5b.1 is at line 1208. It assumes a compact base, “including rank zero and empty M”, with no connectedness hypothesis, and gives `H^q(M;E)*≃H^(n−q)(M;E*⊗K_M)`.
- The open revisions keep both labels. #1398 (head 4f5ca96) has §2.1 (K2) at 406, with the comparison at 590–591, and §5.8 (K5b.1) at 1884, with duality at 1914. #1234 has K2 at 210 and K5b.1 at 1465.

**PDE on main.**
- Layer 5 is at 1827, with §§5.1–5.7 (E20–E26) at 1837–2132. A grep finds no “analytic” in Layer 5.
- §3.1 is at 1304, and “Harmonic functions are real analytic” is at 1319.

**HabiroCyclotomicCompletions §1.1 at #1314 (head ff6a775), README lines.**
- Empty, concatenation, shift and base-change laws, and the unit inverse-parameter formula: 227–230.
- The q=1 value of the Pochhammer product, as the Check `(x;1)_3=(1−x)^3`: 333.
- `E_q(t)=(1−t)E_q(qt)`, `E_qU_q=1` and the general q-binomial identity: 270–272.
- The integral product in ℤ[[q]][[t]], with projections, shift, Euler reciprocal and coefficient change: 280–284.

**ModularForms §0.2 at #1706:** see R01.

### Declared gaps

`vector-bundle-dolbeault` is now precise and minimal; the computed instances are in the table. The slug matches in the README (lines 103, 1330) and in `plan.json`.

### Seeded sample, where the change touches it

- §8.6: BruinierFunke2003, read in the cached text.
  - Theorem 3.7 is at line 626, p. 13.
  - The proof is at lines 663–696, pp. 14–15. It tensors the Dolbeault resolution with L_(k,L)⊗O_(nD), uses Serre duality to get H¹=0 for n≫0, and descends from a normal free subgroup. That is the route §8.6 now attributes to ComplexKahlerGeometry K2 and K5b.1 plus the gap.
  - Corollary 3.8 is at lines 697–699, p. 15.
- §4.3, now cited by §11.3 and `rankGenFun`:
  - Zagier2009 R(w;q) is at lines 914–922, p. 986–17.
  - Theorem 7.1 is at line 929, and the corollary at lines 952–965.
  - AndrewsGarvan1988 Theorem 1 is at line 87 (n>1).
- §2.4: Gasper1995 (1.2.8) at lines 136–142, (1.3.6) at 294, (1.3.8) at 301–306, and (1.3.11) at 317–323, each matching the README's domain.

### Adversarial table

The new and changed rows were computed for this review in double precision, by series and `math.erfc`, with partitions enumerated to n=45. Rows marked (r10) are carried from the previous report for untouched statements, with that report's values.

| Statement / object | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| `rankGenFun` (new) | q=0.3+0.2i; w=1, −1, e(1/5) vs e(−1/5) | R(1;q)=1.2466747023+0.6187812874i = 1/(q;q)_∞; R(−1;q)=1.1979880710+0.0665615617i = `thirdOrderF`; R(e(±1/5)) both 1.3307791487+0.2461160269i | Keep |
| `rankCompletion` (new), docstring α=½ | τ=0.17+1.1i, i, −0.3+0.8i, 0.45+0.6i | F_½ = H₃ component 0 = 0.5786585666−0.0247959850i, 0.5065660287, 0.3416057652+0.0208056219i, 0.1344870203−0.0091610318i; residuals ≤1.0×10⁻¹⁵ | Keep |
| `rankCompletion_modular` (new), t=5 | γ=(1 0;25 1), j=1…4, τ=−0.04+0.04i, −0.0348+0.036i | all ratios e(1/24)=0.9659258263+0.2588190451i, deviation ≤3.9×10⁻¹²; ν_eta(γ)=e(−25/24) from s(1,25)=1.84 | Keep |
| same, t=4 and t=3 | (1 0;N 1), N=4,8,16,32 and 3,9,18,36 | α=¼ gives e(N/96) and α=½ gives e(N/6), which agree at N=32 (e(⅓)); α=⅓ gives e(N/24); τ-spread <10⁻⁵ turns, \|ratio\|=1.0000 | Keep (common χ exists) |
| same, t=6, including the order-three α=⅓, ⅔ | Γ(24): (1 0;24 1), (1 24;0 1), (577 24;24 1) | all five j: ratio 1 (0.00000 turns) at both τ | Keep |
| same, negative control: sign of correction | +D/2 for −D/2, α=⅕, the two τ above | −0.1071 and −0.0988 turns, moduli 1.0000 and 1.0156: not constant | Keep −D/2 |
| `rankResidueDeviation_mock` (new), HasSum | t=1…7, every r, τ=0.13+0.5i, −0.21+0.37i | worst residual 9.4×10⁻¹⁶; t=3,r=0: 0.7827788946−0.0041168931i both; t=5,r=1: −0.2348184856+0.0020493826i both; t=1: 0 = 0 | Keep; ζ↦ζ̄ gives the same value by rank symmetry |
| `rankResidueDeviation_mock`, Φ law | t=5, r=0,1,2 at (1 0;25 1); t=4, r=1,2 at (1 0;32 1) | e(1/24) to ≤5.8×10⁻¹⁵; e(⅓) to 4.1×10⁻⁸ (r=1, where F_¼ cancels) and 3.8×10⁻¹⁵ | Keep |
| §11.2 Check “rank common multiplier” (new) | as stated | e(1/24) for F_⅕, F_⅖; +D/2 arguments −0.107, −0.099, moduli 1.000, 1.016: match | Keep |
| §10.3 Check, A₁/A₂ start (R06 repair) | q=10⁻⁶ | A₁: 1.000001×10⁻⁶ (n≥1) vs 1.000001 (n≥0); A₂: 1.000001 vs 2.000001 | Keep |
| `gap:vector-bundle-dolbeault` (narrowed) | C elliptic, E=O, D=pt; C=ℙ¹, E=O(−5), D=pt; C=E₁⊔E₂, D⊂E₁; rank 0 | H¹(O(nD))≅H⁰(O(−nD))*=0 for n≥1; h⁰(O(3−n))=4,3,2,1,0 at n=0…4, so vanishing for n≥4; H¹(E₂,O)≅ℂ survives, so the per-component hypothesis is needed; rank 0 trivial | Keep |
| `qBinomial` (r10) | (0.3+0.2i,0.4−0.3i,0.5+0.1i); (2−i,−0.5+0.2i,−0.3+0.7i); q=0 | 1.8736257319−0.4684739279i; 1.2420422671−1.0390689318i; 1.45 (each both sides) | Keep |
| `qBinomial_largeBase` (r10) | (0.5,2,0.7); (0.3,1.5+0.8i,1.1−0.4i); a=8 off-domain | 0.65 both; 0.5205210755+0.9375321564i both; terms diverge | Keep |
| `euler_qExponential` (r10) | q=0.4−0.3i, z=0.5+0.1i, 3−2i; q=0 | 2.4874562632−0.3500169047i; −4.1980805035−4.0442739905i; 1+z | Keep |
| `ramanujanOnePsiOne_hasSum` (r10) | four tuples, b=0, q=0 | 1.1892209225; −0.6482294967; 0.9663838972; 2.0945634402−0.6242419523i | Keep |
| `baileyPair`, `baileyLemma_transform` (r10) | exact a=⅓, q=½, ρ=(3/5,−2/7) | β′ equal at n=0…6 (β′₁=17052/13585); δ₁ non-example 8/3 | Keep |
| `rogersRamanujan_count`, `_count_two` (r10) | n=0…20 | 1,1,1,1,2,2,3,…,31; 1,0,1,1,1,1,2,…,20 (both sides) | Keep |
| `rogersRamanujan_hasSum` (r10) | q=0.45+0.3i, −0.6+0.1i | 1.2605476441+0.7632052939i, …; 0.7135856425−0.0432006090i, … | Keep |
| `quintupleProduct_hasSum` (r10) | two (q,z) | 0.4315355615+0.3836699677i; 5.4863846113−3.4789339271i | Keep |
| `partitionRank`, `partitionCrank` (r10) | (3,2,1,1),(1),(3,3),(2,2,2),() | rank −1,0,1,−1,0; crank −1,−1,3,2,0 | Keep |
| `rank_equidistribution_five_seven` (r10) | sizes 4…24 mod 5, 5…26 mod 7 | equal classes [1],[6],[27],[98],[315]; [1],[11],[70],[348] | Keep |
| `crank_equidistribution_five_seven_eleven` (r10) | same, 6,17,28 mod 11 | [1],[27],[338]; rank mod 11 control unequal | Keep |
| `partition_primePowerCongruences` (r10) | all ℓʳn+δ≤1400 | divisible; p(243)≡245 mod 343 forces ⌊r/2⌋+1 | Keep |
| `zwegersOddTheta`, `zwegersR`, `zwegersMu`, `zwegersMuHat` (r10) | τ=0.17+1.1i, i; u=⅓, v=¼ | ϑ′(0)=−2πη³ to 10⁻¹⁰; μ̂=−0.7325888912i; wrong correction sign −1.0557856775i | Keep |
| `zwegersMuHat_elliptic`, `_modular` (r10) | 4 shifts; S,T,−I and four more γ at two τ | residuals ≤5.5×10⁻¹⁶ and ≤7.5×10⁻¹⁵ | Keep |
| `thirdOrderF`, `thirdOrderF_rank`, `thirdOrderOmega` (r10) | coefficients; q=0.3+0.25i | signed rank counts match; f=1.2056564842+0.0794678723i | Keep |
| `thirdOrderCompletion_T`, `_S` (r10) | four τ | T ≤3.0×10⁻¹⁶, S ≤7.8×10⁻¹⁶; F+G fails S by 2.14 | Keep |
| 4.4a, 4.8a, 5.4–5.7, 6.1, 7.x, 8.5, 10.3a, 10.6–10.8, 11.2 Lerch form, 1.5, 2.1–2.3 (r10) | as in r10 | residuals ≤6×10⁻¹² (4.8a) and ≤4.4×10⁻¹⁵ elsewhere; exact values as in r10 | Keep |

The table has 28 rows: 11 new or changed and 17 carried. All keep.

### Remarks on untouched text (no change requested)

- IntegralLattices on main was restructured on 2026-11-08 (47fc6a3). Its label 0G now names native Tau Ceti rows (`hyperbolicPlane`, line 438), and 1G and 1H moved to lines 571 and 615. The citation at lines 127 and 1307 still resolves.
- `design/plan.json` still carries the design-stage wording of two gaps: PDE “Lane E”, and the broader Dolbeault needs. The README contracts at lines 103 and 123 are the narrowed ones; the slugs match.
- Ownership against open pull requests was checked by `roadmaps grep`. No other roadmap owns rank completions, the rank generating function or rank-residue deviations.

## Not verifiable

- GasperRahman2004 and BFOR2017 are waived; Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified. No changed passage cites them.
- The common multiplier of `rankCompletion_modular` was sampled on a few generators of Γ(N) for t=3, 4, 5 and 6, not proved for every t. Zagier2009 Theorem 7.1 (line 929) asserts mock modularity for every root of unity ξ≠1. Remark 2 at line 933 notes that Bringmann–Ono prove it only for odd order.

## Source issues

- none
