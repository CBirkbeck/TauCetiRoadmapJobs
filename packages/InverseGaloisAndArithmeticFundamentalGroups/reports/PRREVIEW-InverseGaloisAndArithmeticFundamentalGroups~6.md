# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at 506a7ed)

**Verdict:** needs changes

Full re-review: the folder changed by 202 lines since a5186ac. The head adds two group-theory targets, IG.3 *Conjugacy of coprime complements* and IG.4 *The Fitting subgroup*, with seven Lean declarations, and it merges a pin bump (Mathlib 6b7abb3 → 1b1ccf4, Tau Ceti a91d3aa → 2fd255d). Three findings block: the two new targets duplicate an open roadmap, and two supplier citations break when open revisions merge. Two P3 findings follow.

## Previous findings

The previous review (at a5186ac) accepted the folder with no findings. The three repairs it recorded are still in place at this head:

- the ArithmeticGaloisDuality contract still reads “with transport to the absolute localization kernel only when `S` is the set of all places” (README:413);
- the quaternion headline is unchanged at `Suggested.lean:340`;
- the five layer comments are at `Suggested.lean:54`, 132, 263, 372 and 392.

## R01 (P2) — Two owners for Schur–Zassenhaus conjugacy and the Fitting subgroup

**Location.** README:3273 *Conjugacy of coprime complements*; README:4195–4198 *The Fitting subgroup* (“there is no second, relative Fitting carrier”); `Suggested.lean:257` and 274–295 (`exists_conj_eq_of_isComplement'_of_coprime`, `fitting`, `isNilpotent_sup_of_normal`, `fitting_characteristic`, `le_fitting`, `fitting_nilpotent`, `frattini_le_fitting`).

**Claim.** This roadmap now owns two things:
- conjugacy of coprime complements when `N` or `G/N` is solvable;
- the Fitting subgroup, with its nilpotence, characteristicity, maximality and `Φ(G) ≤ F(G)`.

The previous head consumed both from LocalFiniteGroupTheory L1 and L2.

**Witness.** LocalFiniteGroupTheory (#1634) owns both objects already:
- README:145 states the conjugacy, as `exists_conj_eq_of_isComplement'` at its `Suggested.lean:73`;
- README:159 owns the relative `fitting H` with nilpotence, characteristicity, maximality and `frattini G ≤ fitting ⊤` (its `Suggested.lean:88`).

Other roadmaps already treat #1634 as the owner: FiniteGroupExtensionSplitting (on main) README:41 leaves this conjugacy to its L1, and OddOrderTheorem README:164 consumes its `fitting`.

**Repair.** Restore the a5186ac form.
1. Delete the two targets and the seven declarations, and the two module-docstring sentences that list them.
2. Cite LocalFiniteGroupTheory L1 (Schur–Zassenhaus conjugacy for finite `G` with `N` or `G ⧸ N` solvable) and L2 (`fitting ⊤`: nilpotent, characteristic, containing every nilpotent normal subgroup, `frattini G ≤ fitting ⊤`) in:
   - the supplier contracts;
   - IG.3 *Coprime semidirect products* (3);
   - IG.4 *Fitting supplements* and *Coprime profinite complements*;
   - *How to read the build*;
   - the IG.3 and IG.4 *Dependencies*.

L1 concludes `∃ g : G`. Since `G = NH`, this is the `∃ n ∈ N` that IG.3 needs; README:3279 already makes this remark.

**Tested.** LocalFiniteGroupTheory names no roadmap supplier, so it is placed before this roadmap. The brief's dependency check, run on the a5186ac README (which cites L1 and L2), prints `depcheck: 240 roadmaps, 2385 edges, 0 problem(s)`.

## R02 (P2) — LocalFieldsRamification Layers 2–4 are dropped by an open revision

**Location.** Eleven supplier citations: README:153, 395, 426, 1095, 1109, 1514, 4003, 4377, 4689, 5336, for example “Frobenius `a ↦ a^q` (LocalFieldsRamification Layer 2)” (README:1095) and “LocalFieldsRamification Layers 2–4 supply Frobenius, local ramification and the tame quotient” (README:1514).

**Claim.** These ids name the Frobenius, unramified, ramification and tame-quotient layers of LocalFieldsRamification.

**Witness.** At #617's head, `Completed/LocalFieldsRamification/README.md:475` makes Layer 2 “the Hasse–Arf theorem”, and Layers 3 and 4 no longer exist. Its README:27–60 declares that content “already in the library” at Tau Ceti 2fd255d, which is this pull request's pin.

**Repair.** Replace the eleven citations with the pinned Tau Ceti declarations and add them to the *From Tau Ceti* table. All are at the pin:
- `TauCeti.frobeniusAlgEquiv` (`TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:164`);
- `TauCeti.maximalUnramifiedGaloisGroupEquivZHat` (`…/LocalField/Unramified/ZHat.lean:197`);
- `TauCeti.inertiaSubgroup` and `TauCeti.IsArithFrobeniusLift` (`…/Unramified/Inertia/Basic.lean:112`);
- `TauCeti.wildInertiaSubgroup` and `TauCeti.maximalTameExtension` (`…/LocalField/WildInertia.lean:251`, 137);
- the tame character of `…/UnitFiltration/RamificationGroup.lean:566`.

The citations then hold both on main and after #617 merges.

## R03 (P2) — ClassifyingSpaces §Stage 4 item 17 is dropped by open revisions

**Location.** README:373 (supplier table row “`K(π, 1)` group/topological cohomology | ClassifyingSpaces §Stage 4 / item 17”) and README:2622 (“Supplied by ClassifyingSpaces §Stage 4 / item 17”).

**Claim.** IG.3.1 takes the comparison between group cohomology and the cohomology of a CW `K(π, 1)`, with finite trivial coefficients, from that item.

**Witness.** At the heads of #1807 and #1808, ClassifyingSpaces has no Stage 4; the comparison is Layer 2, §2.2 (README:659 at #1807, README:666 at #1808). That section says the bare comparison is pinned Tau Ceti's `classifyingSpaceSingularCohomologyIsoGroupCohomology`, transported along `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`.

**Repair.** Cite these two pinned Tau Ceti declarations directly in the *From Tau Ceti* table:
- `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology` (`TauCeti/AlgebraicTopology/ClassifyingSpace/Cohomology.lean:89`);
- `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` (`…/ClassifyingSpace/Uniqueness.lean:94`).

Replace both citations with them. For the circle (`π = ℤ`) both sides are `ℤ/n` in degree one.

## R04 (P3) — Suggested.lean gains an API catalogue for the Fitting subgroup

**Location.** `Suggested.lean:272–295`; module docstring lines 17–20.

**Claim.** The seven declarations are presented as headline theorems of the roadmap.

**Witness.**
- On a scratch copy, `le_fitting` closes with the single term `le_iSup₂_of_le N ‹_› (le_iSup (fun _ => N) ‹_›)`. It restates the defining property of a supremum.
- `frattini_le_fitting` closes with `haveI := frattini_nilpotent (G := G); exact le_fitting (frattini G)`.
- No headline mentions `fitting`.

**Repair.** Delete `fitting` and its five lemmas from `Suggested.lean`, together with the docstring clause “the Fitting subgroup with its basic theory”. The README keeps the statements as targets or, after R01, as citations. If R01 is repaired as proposed, this deletion is already part of it.

## R05 (P3) — Mathlib names and links not updated to the new pin

**Location.**
- README:528: “Mathlib Noether normalization (`Algebra.exists_finite_inj_algHom_of_fg`)”.
- README:1593, 1618, 1640, 1680, 1782, 1799, 1856, 7643: links to `mathlib4/blob/6b7abb3…/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean`.

**Claim.** These are presented as pinned Mathlib.

**Witness.** At the pin (1b1ccf4):
- `#check @Algebra.exists_finite_inj_algHom_of_fg` gives “Unknown constant”;
- `#check @exists_finite_inj_algHom_of_fg` prints its type: root namespace, `Mathlib/RingTheory/NoetherNormalization.lean:292`;
- `6b7abb3` is the previous pin.

**Repair.**
- Write `exists_finite_inj_algHom_of_fg` at README:528.
- Point the eight links at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. The file still has `RatFunc.eval` (line 145), `eval_add` (183) and `eval_mul` (202).

## Verified sound

**Gate, build, elaboration.**

The worker's gate recorded `build=2 FAIL`: two copies of lake's advisory that `import Mathlib` is “designed for use with the module system”. That is not a statement about the file. Re-running the brief's gate command on this head printed every counter at zero and `OK`, so the failure did not reproduce.

`lake env lean` on `Suggested.lean` exits 0 with 24 diagnostics, all `declaration uses 'sorry'`: the previous 18 plus the six new theorems.

A scratch file with `#check @` for all 43 declarations printed 43 types and no error. Each elaborated type keeps its binders. For example, the new conjugacy theorem keeps `[N.Normal]`, `Nat.Coprime (Nat.card N) N.index`, the solvability disjunction and both `IsComplement'` hypotheses, and `fitting_nilpotent` and `frattini_le_fitting` keep `[Finite G]`.

The file has one `import Mathlib` and four `TauCeti.*` imports, no `set_option`, and no sorry'd data. The worktree is clean, and the diff outside the folder against `origin/main` is empty.

**Dependency check.** The brief's command printed `depcheck: 240 roadmaps, 2385 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Padding probe on the new declarations.** On a scratch copy:
- `le_fitting` and `frattini_le_fitting` close as described in R04.
- `fitting_characteristic` fails under `infer_instance` and `simp [fitting]`.
- `isNilpotent_sup_of_normal` fails under `infer_instance`.
- `exact?` finds nothing in Mathlib for the conjugacy theorem or for `fitting_nilpotent`; it only returns the sorried declarations themselves.
- No Fitting subgroup and no complement-conjugacy theorem exist at either pin. `grep` finds only Lie-algebra Fitting components and Fitting ideals; `Mathlib/GroupTheory/SchurZassenhaus.lean` has existence (:277) and the abelian `exists_smul_eq` (:103).

**Pinned declarations opened.**
- `Subgroup.lowerCentralSeries` (`Mathlib/GroupTheory/Nilpotent/LowerCentralSeries.lean:61`). Its 0-th term is `H` itself, so README:4209's `γ_k(S) = S.lowerCentralSeries (k − 1)` is right.
- `Subgroup.isNilpotent_iff_lowerCentralSeries` (`Nilpotent.lean:376`).
- `Subgroup.Characteristic` (`Algebra/Group/Subgroup/Basic.lean:238`), `frattini_nilpotent` (`GroupTheory/Frattini.lean:58`, `[Finite G]`).
- `Subgroup.QuotientDiff`, `Subgroup.exists_smul_eq`, `isComplement'_stabilizer_of_coprime` (`SchurZassenhaus.lean:39`, :103, :114).
- `RatFunc.eval`, `eval_zero`, `eval_one`, `eval_algebraMap`, `eval_add`, `eval_mul` (`FieldTheory/RatFunc/AsPolynomial.lean:145–202`).
- `TauCeti.Place.adicOfIrreducibleResidueFieldEquiv` (`TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:296`).
- 340 backticked README names were checked with `#check` at the Mathlib pin, and every `TauCeti.*` name by source grep at the Tau Ceti pin. Apart from R05, every name that did not resolve belongs to a supplier roadmap or to this roadmap's own declarations.

**Cross-roadmap citations resolved (51 leads).**
- 5 leads are this roadmap's own `Suggested.lean` names.
- 44 resolve at main, in EtaleCohomologyFoundations, SchemeAndStackFoundations, EnhancedDerivedSheaves, AdicEtaleGeometry and AdicSpacesPartIII. Three of them, `curveEndomorphismTrace`, `etaleTraceFormulaFinite` and `etaleTraceFormula`, are this roadmap's own IG.0.T1–T3 targets, which SchemeAndStackFoundations consumes.
- `Approximation.hasWeakApproximation_of_simplyConnected` resolves at AdelicAlgebraicGroups (#792), which is earlier in the merge order.
- `VanishingCycles.pointCountTrace` is this roadmap's own IG.0.T4 name, consumed by SchemeAndStackFoundations (main README:7388) and EtaleDualityAndPerverseSheaves.
- `End.trace` is AbelianSchemesAndArithmeticModuli A6.10 at its head.

**Overlap leads.**
- PolynomialGaloisGroups Layer 9 is a false positive. #763 and #986 add a separate folder named PolynomialGaloisGroups (a Part III roadmap). `Completed/PolynomialGaloisGroups` keeps “Layer 9: `Sₙ` as a Galois group over `ℚ`” at line 1385 on main and at both heads.
- The other two leads are R02 and R03.
- No open pull request changes this roadmap.

**Ownership.**
- Apart from R01, nothing in this head's diff has a second owner. There is no profinite Schur–Zassenhaus elsewhere: the roadmap tool's grep over main and all open heads returned no match.
- The trace targets IG.0.T1–T4 are owned here, as SchemeAndStackFoundations on main records.

**Seeded sample (15 targets; locator, page, hypotheses, support).**

| Target (README line) | Source text read | Result |
| --- | --- | --- |
| Finite Galois algebras and torsors (585) | merkurjev-scavia lines 36–61 (§1.2, pp. 1–2: lifts as Galois algebras); lines 329–352 (Lemma 3.2 and proof, pp. 8–9: Galois `G`-algebra `M/K`, `H¹(K, G)` classifying them); stacks-00HQ line 4383 (Lemma 10.39.16: flat + surjective on Spec ⇔ faithfully flat) | Locators and support correct |
| Integral local systems have finite monodromy (668) | sga1 lines 4693–4706 (Exposé V §7, fundamental group of a connected prescheme); stacks-0GIY line 4714 (Lemma 59.65.2, irreducible geometrically unibranch, finite-type locally constant sheaves ↔ continuous `π₁`-modules); schroer lines 659–665 (Prop. 5.5, PDF p. 15, rank-ten `Num`, Minkowski) | Correct |
| Evaluation on the regular subring (1629) | debes lines 5087–5134 (§§5.2.1–5.2.2, printed pp. 135–137, specialization `P(t, Y)`); Mathlib `RatFunc.eval` at the pin | Correct; link pin is R05 |
| Coefficients after specialization (1700) | same Dèbes pages; `Polynomial.coeff_sum`, `coeff_monomial`, `mem_support_iff` resolve | Correct |
| Finite-extension permanence (1963) | Serre, *Topics*: not readable legally | Not verifiable (below); mathematics checked in the table |
| Hilbert points with weak approximation (2283) | bcdt line 868 (Thm 2.2.1, p. 17), line 969 (proof, author p. 19: Ekedahl Thm 1.3, 3-adic open on the rational curve `X_ρ`) | BCDT locator correct; Serre not verifiable |
| Hilbert specialization with local conditions (2319) | bcdt line 969 as above | Correct; Serre §3.5 not verifiable |
| Nielsen transitivity questions (2813) | chen-nonabelian line 222 (Conj. 1.1.3 citing Garion, p. 5), line 504 (Question 1.4.1, p. 11); mccullough-wanderley-preprint line 198 (Conjecture W), line 342 (Thm 5.1) | Chen correct; published McCullough–Wanderley not verifiable |
| Marked central extensions (3141) | wood-lifting lines 45–60 (§2, Lemma 2.1 with `ỹ[x]ỹ⁻¹ = [yxy⁻¹]`, p. 2), lines 90–130 (Lemmas 2.2–2.4, Thm 2.5, pp. 3–4) | Correct |
| Unramified Brauer classes of finite quotients of `SL_n` (4663) | lucchini-arteche lines 558–595 (good places, Thms 6.1–6.2, surjection onto `∏_S X(k_v)`, Cor. 6.3, pp. 14–15; proofs pp. 15–16); dlan line 365 (Prop. 2.4, p. 1018), line 188 (tame approximation, p. 1013); harpaz-wittenberg lines 143–145 (p. 4) | Correct |
| Configurations and punctured-disc groups (5426) | evw-arxiv lines 351–369 (§2.1: `B_n ≅ π₁(Conf_n)`, `Conf_n` a `K(B_n, 1)`) | Numbering correct; published pages not verifiable |
| Forgetting the boundary marking (5531) | evw-arxiv lines 421–447 (§§2.2–2.3, conjugation action commuting with `B_n`), lines 1341–1353 (Cor. 6.2: stabilizer `C_G(H)`, free on `CHur` when centreless) | Correct |
| Component bound from finite étale degree (5746) | wood-moments-arxiv lines 878–899 (Thm 4.5(1): finite étale over `Conf_n` over `ℤ[|G′|⁻¹]`; (2): open and closed pieces by infinity type) | Correct |
| Admissible G-covers of marked curves (5810) | chen-nonabelian lines 592–700 (Defs 2.1.1–2.1.6 and Remark 2.1.5, pp. 13–15: charts `x = ξ^e`, `ξη = a`, balanced node, `C/S` smooth iff `D/S`, connected variant open and closed) | Correct |
| Patching Galois algebras with prescribed local pieces (6608) | harbater-hartmann line 512 (Thm 4.13, p. 13), lines 859–866 (Thm 7.1(v), p. 22), lines 965–1047 (§7.2, Thm 7.3, pp. 24–26), line 1048 (Remark 7.4(a), p. 26) | Correct. Part (3) supplies an argument the source omits (Source issues) |

Also read: lwzb lines 467–471 (p. 10). Schur–Zassenhaus is cited there from Ribes–Zalesskii Thm 2.3.15 for *Coprime profinite complements*. The README's solvability hypothesis is stricter than the source, which leaves it implicit.

**Computed adversarial pass.**

| Statement (line) | Instances and values computed on each side | Result |
| --- | --- | --- |
| `IsHilbertian` (Lean 71) | `K = 𝔽₃`, `s = {Y² − T, Y² − 2T}`: `t = 0, 1, 2` give `Y²`, `Y² − 1`, `Y² − 1` (since `2·2 = 1`), all reducible, so the definition is false for `𝔽₃`. `K = ℂ`, `Y² − T`: every `Y² − t` splits | Definition discriminates |
| `isHilbertian_ratFunc` (78) | `K = 𝔽₃`, same family over `𝔽₃(S)` at `t = S`: `S` and `2S` have odd valuation, so both specializations are irreducible, as asserted. `s = ∅`: any `t` | Holds |
| `isHilbertian_of_numberField` (82) | `ℚ`, `Y² − T`, `t = 2`: denominators `1`, degree `2 = 2`, `Y² − 2` irreducible | Holds |
| `hilbert_irreducibility` (89) | `r = 0`: the unique `t`, `eval t g = g ≠ 0`, `f` unchanged. `r = 1`, `f = Y² − T₀`, `g = T₀`: `t = 2`, `g(2) = 2`, `Y² − 2` irreducible. `f = T₀Y − T₀`: at `t₀ = 0` degree drops to `0`; at `t₀ = 3` `3(Y − 1)` is irreducible of degree 1 | Holds; the guard handles degeneration |
| `infinite_full_group` (104) | `(Y² − T)(Y² − 2)` at `t = 3`: groups of order `4` and `4`; at `t = 2`: order `2`, excluded. `f = 1`: degree `0`, trivial groups, every `t`, an infinite set. `f = 0`: not separable | Holds |
| Weissauer (112) | `M = ℚ`, `L = ℚ(√2)`: `finrank 2 > 1`, Hilbertian. `L = M = ℚ̄`: `finrank 1`, excluded, and `ℚ̄` is not Hilbertian (`Y² − T`) | Hypothesis needed |
| `not_isTopologicallyFinitelyGenerated` (119) | `ℚ`: `ℚ(√2, …, √p_r)` gives the quotient `C₂^r`, needing `r` generators. `ℝ` (not Hilbertian): `G_ℝ = C₂`, one generator | Hilbertian hypothesis needed |
| `normal_subgroup_absoluteGaloisGroup_eq_bot` (127) | `ℝ`: `N = G_ℝ ≅ C₂` is closed, normal and finitely generated but `≠ ⊥`; excluded by `hK`. `ℚ`, `N = ⊥`: holds | Holds |
| Rigidity (181) | `S₃`, classes `(2A, 2A, 3A)`: `3·2 = 6` tuples, `Z = 1`, one free orbit, rational. `G = 1`, `r = 0`: the empty tuple, `L = K(T)`, `K` integrally closed in `K(T)`. `C₃`, `(g, g, g)`: `g² = g⁻¹ ∉ {g}`, not rational, centre `C₃` | Holds; negative control excluded |
| `stable_classification` (236) | `C₂`, `c = {g}`: `U ≅ ℤ`, the degree of `[g]^r` is `r`, equal invariants ⇔ equal length ⇔ Hurwitz-equivalent constant lists. `z = 1` (degree 0) is reached only by the empty, non-generating tuple, so `M ≥ 1` is forced | Holds |
| Conjugacy of coprime complements (3273; Lean 257) | `S₃`, `N = C₃`: 3 complements of order 2, conjugate by `C₃`. `A₄`, `N = V₄`: 4 complements, `V₄` orbit `4/|V₄ ∩ N(C₃)| = 4/1 = 4`. `G = ℤ`, `N = ⊤`: `gcd(0, 1) = 1`, only complement `⊥`. `C₂ × C₂`, `N = C₂ × 1`: `gcd(2, 2) = 2`, excluded; `1 × C₂` and the diagonal are not conjugate | True; owned elsewhere (R01) |
| The Fitting subgroup (4195; Lean 274–295) | `S₃`: normal subgroups `1, C₃, S₃`, so `F = C₃`. `A₄`: `F = V₄`. `S₄`: `F = V₄`. `D₈`: `F = D₈`. In the restricted product of `D_{2^n}`: `F = G` and classes `n − 1` are unbounded, so `[Finite G]` in `fitting_nilpotent` is needed. Two transpositions of `S₃` generate `S₃`: normality is needed | True; R01, R04 |
| Fitting's theorem proof sketch (4209) | Classes `c, d`, `k = c + d + 1 ⇒ i > c` or `j > d`; `[C, N] ≤ N = γ₁(N)` when `C ≤ G`, and `[γ_i(N), N] = γ_{i+1}(N)`, so the `i`-entry bound holds by induction | Correct |
| Fitting supplements (4237) | `S₃`: `Φ = 1 < F = C₃`, `U = C₂`, `F ⊔ U = S₃`. `S₄`: `F = V₄`, `U = S₃`, `4·6/|V₄ ∩ S₃| = 24` | Holds |
| Coprime semidirect products (3) (3306) | `G = S₃`: `x = (12)` has order 2, equal to its image's; `⟨x⟩` and `⟨γ⟩` are complements of `C₃` in `S₃`, conjugate by `C₃`. `C₆ = C₃ × C₂`: `c = {(0,1)}`; an order-6 element (outside `c`) would contain `H` | New use correct |
| Coprime profinite complements (4860) | Finite level `E/U`: `N/U` is a normal Hall subgroup and `Γ` or `N/U` is solvable, so the finite target applies; lwzb p. 10 cites Ribes–Zalesskii 2.3.15 | Correct; R01 |
| Split nilpotent (267) | Kernel `1`: `β = s ∘ φ` is surjective. `C₄ → C₂` has no section, so it is excluded; `ℚ(i)` lies in no `C₄`-field | Holds |
| Shafarevich (299) | `S₃`/`ℚ`: `ℚ(∛2, ω)`, degree 6. `G = 1`: `L = K`. `A₅`: not solvable, no claim | Holds |
| `IsSupersolvable` (306) | `S₃`: `1 < ⟨(123)⟩ < S₃`, each step one generator. `A₄`: the normal chain must pass `V₄`, which is not cyclic, so not supersolvable. `G = 1`: `n = 0` | Definition discriminates |
| Supersolvable Grunwald (315) | `S₃` at `5`: `6 ∉ (5)`, allowed. `C₈` at `2`: `8 ∈ (2)`, excluded (Wang) | Holds |
| Quaternion Grunwald (340) | `n = 0, 1, 2`: orders `8, 16, 32 = 2^(n+3)`. Unramified quartic at `2`: `8 = 2·4` | Holds |
| Coprime degrees (362) | `G = 1`: `n = 1`, `E 0 = ⊥`, degree `1`, gcd `1`. `n = 0`: the gcd over `Fin 0` is `0 ≠ 1` | Holds |
| Abhyankar (381) | `g = 0`, `D = {∞}`: bound `0`. `C_p`: `p(G) = G`, rank `0`, `y^p − y = x`. `C_ℓ`: rank `1 > 0`, none. `D = ∅` (excluded): `0 + 0 − 1 = 0` in `ℕ` would admit `C_p` over the simply connected `ℙ¹` | `hD` needed |
| `exists_realization` (406) | `ℚ`, `C₂`, `ℚ(T)(√T)` at `T = 2`: `ℚ(√2)` | Holds |
| Disjoint realizations (413) | `ℚ`, `C₂`, `M = ℚ(i)`: `L₀ = ℚ(√2)`, `L₁ = ℚ(√3)`; `ℚ(√3) ∩ ℚ(i, √2) = ℚ`. `G = 1`: `L n = ⊥` | Holds |
| `inverseGaloisProblem_of_regular` (423) | `exists_realization` with `K = ℚ` and `isHilbertian_of_numberField`; `G : Type`, `L : Type` on both sides | Holds |
| Finite Galois algebras (585) | `K × K` with swap: tensor and product dimensions `4 = 4`. Zero algebra: `0 → 0` is an isomorphism but the fibre is empty, excluded. `𝔽₂ × 𝔽₂` with swap: accepted although `2 = |H|` | Holds |
| Integral local systems (668) | Nodal curve, `[[1,1],[0,1]]^n = [[1,n],[0,1]]`, infinite, excluded by normality. `Spec ℤ`: `π₁ = 1`, constant | Holds |
| Evaluation on the regular subring (1629) | `e₀(1) = 1`; `e₃(T) = 3`; `e₃(1/(T − 1)) = 1/2`; `e₂(T − 2) = 0`; `e₅(7) = 7` | Checks correct |
| Coefficients after specialization (1700) | `sp₀(T⁻¹Y)`: `RatFunc.eval 0 (T⁻¹) = 1/0 = 0` in Lean, so `sp₀ = 0` | Correct |
| Finite permanence (1963) | `L = K`: degree 1. `ℚ(√2)`: degree 2. `ℚ̄/ℚ` infinite: `Y² − T` never irreducible | Holds |
| Hilbert points with weak approximation (2283) | `𝔸¹/ℚ`, `S = {∞}`, interval `(1, 3)`: `t = 2` is a nonsquare | Holds |
| Local conditions (2319) | `t = 17`: `17 > 0` and `17 ≡ 1 mod 8`, so a square in `ℚ₂`; nonsquare in `ℚ`. `t = 4`: `Y² − 4 = (Y − 2)(Y + 2)` | Checks correct |
| Nielsen questions (2813) | `C₂`, `r = 2`: 3 epimorphisms, `GL₂(ℤ)` transitive on `𝔽₂² ∖ 0`. `C₅`, `r = 1`: 4 generators, orbits `{g, g⁻¹}`, 2 orbits | Checks correct |
| Marked central extensions (3141) | `C₄ → C₂` marked by a generator of order 4: equivariant (abelian), not a splitting. `G = 1`, `c = ∅`: the empty marking | Correct |
| Unramified Brauer (4663) | `F = 1`: `Br_nr(G) = Br k` (Sansuc), both parts trivial. `C₈` at `2`: `2 ∣ 8`, not good; Wang | Correct |
| Configurations (5426) | `B₀ = B₁ = 1`; `B₂ ≅ ℤ`, image of `sigma 0` a transposition, square pure. `n = 1`: `π₁(ℂ − a) = ℤ`; in `ℙ¹ − {a, ∞}` the two loops are inverse | Correct |
| Forgetting the marking (5531) | `((12), (23))`: stabilizer `C_{S₃}(S₃) = 1`. `(1, …, 1)`: stabilizer `S₃`. `C₂`: trivial action | Correct |
| Component bound (5746) | Split degree 3: 3 components, at most 3. Connected degree 2: 1 component, at most 2 | Correct |
| Admissible covers (5810) | `(ζ, ζ⁻¹)`: `ξη ↦ ξη`. `(ζ, ζ)`: `ξη ↦ ζ²ξη`, with `ζ² ≠ 1`, forcing `a = 0` (chen-nonabelian line 678) | Correct |
| Patching (6608) | All `H_i = 1`: `A = F^G`, disconnected for `G ≠ 1`. `C₂ × C₂` from `H₁ = C₂ × 1` and `H₂ = 1 × C₂`: `J = G`, a field. `T = ℝ[[t]]`, `ℙ¹_{ℂ[[t]]}`: `H⁰ = ℂ`, `ℂ((t))` algebraic over `ℝ((t))` | Correct |
| Frobenius normalisation (1093, R02) | `μ₅` over `𝔽₂`: arithmetic exponent 2, geometric 3, `2·3 = 6 ≡ 1 mod 5` | Mathematics correct; citation breaks (R02) |
| `K(π, 1)` comparison (373, 2620, R03) | `S¹ = K(ℤ, 1)`: `H¹(S¹; ℤ/n) = ℤ/n = H¹(ℤ, ℤ/n)`; Tau Ceti `classifyingSpaceSingularCohomologyIsoGroupCohomology` at the pin | Content available at the pin (R03) |
| Finite trace, Noether normalization (528, R05) | `#check @exists_finite_inj_algHom_of_fg`: `∀ k R [Field k] [CommRing R] [Nontrivial R] [Algebra k R] [Algebra.FiniteType k R], ∃ s g, Injective g ∧ g.Finite`; the `Algebra.` form is unknown | Name wrong (R05) |

**Headline theorems.** The statable headlines are all stated. This head added none; the conjugacy theorem and the Fitting block are inputs, not headlines (R04). The not-statable headlines (trace formulas, local-system categories, Noohi and pro-étale groups, tame specialization, Hurwitz schemes, Brauer–Manin density, Property E, patching) are still named in the module docstring.

## Not verifiable

- **Serre, *Topics in Galois Theory*.** Cited at §3.2.1, Prop. 3.2.1, Cor. 3.2.2, pp. 21–22, and at Thms 3.5.3, 3.5.7 and Lemma 3.5.5, pp. 28–33, for the seeded targets *Finite-extension permanence*, *Hilbert points with weak approximation* and *Hilbert specialization with local conditions*. The sources service found no legal copy. The statements were checked mathematically above.
- **McCullough–Wanderley, Glasgow Math. J. 55 (2013) 481–509.** Cited at §4, p. 487 and for the trace theorem, pp. 481–482. Cambridge Core shows no open-access licence. The authors' earlier preprint on McCullough's page (different title) states Conjecture W for `q ≥ 13` (mccullough-wanderley-preprint line 198). Its Theorem 5.1 (line 342) also covers `q = 2, 4, 8`, which matches the README's exceptional set `{3, 5, 7, 9, 11}`. The published quantifier is uncertified.
- **Ellenberg–Venkatesh–Westerland, published pages** (Annals 183, pp. 738–740, 763–764). The Annals host is in no licence class. The numbering was checked against arXiv 0912.0325v4.
- **Wood, *Nonabelian Cohen–Lenstra moments*.** The NSF PAR copy timed out. Thm 4.5 was checked in arXiv 1702.04644v2, pp. 20–21. The published pp. 403–405 are uncertified.
- **BCDT, published p. 864.** Author copy p. 19 read. Ekedahl's Theorem 1.3 is cited through BCDT and was not read.
- **Books.** Ribes–Zalesskii, *Profinite Groups*, Thm 2.3.15 (paywalled publisher); Aschbacher, *Finite Group Theory*, Chapter 6 (landing page in no licence class); Huppert, *Endliche Gruppen I*, Kap. III §§3–4 (no copy found). After R01 these leave the folder.
- **Carried from the previous reports.** Demarche (2010), Cor. 3 and Rem. 7; Fried–Jarden, Thms 13.4.2, 13.9.1(b) and Prop. 16.11.6.

## Source issues

- **Gap** in harbater-hartmann at Theorem 7.3, proof, arXiv p. 26 (lines 1039–1040): the source infers that `K` is algebraically closed in `A₀` from its being algebraically closed in `F`; it should show that `K` is algebraically closed in `F₀` (uniformizer `t`, residue field `k(x)`, so `e = f = 1`); affects the proof.
