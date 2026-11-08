# Review of LocalAnabelianGeometry (pull request #1811 at 748d0bb)

**Verdict:** needs changes

The mathematics is in good shape: every sampled locator in Hyeon 2025 and Mochizuki 1997 supports the statement cited to it, the worked examples agree with the theorems, the sign of the Hodge–Tate criterion is pinned correctly against ClassFieldTheory's arithmetic normalization, and the proof routes of Layers 1–8 follow the sources step by step. The defects are structural: three `sorry`'d definitions in `Suggested.lean`, one unowned prerequisite (unit-filtration reciprocity, cited to a revision pull request that is never a dependency), four Lean statements whose hypotheses silently widened to every nonarchimedean local field, and a README that is not in TauCetiRoadmap form and cites its suppliers by pull-request number.

## R01 (P1) — `Suggested.lean` has three definitions whose body is `sorry`

Location: `TauCetiRoadmap/LocalAnabelianGeometry/Suggested.lean` lines 48, 80, 106: `padicModelEquiv`, `topologicalTransfer`, `absoluteTransfer`, each `noncomputable def … := sorry`.

Claim: the file states the roadmap's targets against the pins.

Witness: the gate reports `sorry-data=3` at exactly these lines; `padicModelEquiv` is a `ContinuousMulEquiv` with no body, `topologicalTransfer` and `absoluteTransfer` are homomorphisms with no body. The theorems `coe_padicModelEquiv` (52), `coe_padicModelEquiv_eq_conj` (60), `topologicalTransfer_mk` (84), `continuous_topologicalTransfer` (89) and `absoluteTransfer_artinMap` (112) mention them, so they are about data that does not exist; `topologicalTransfer_mk` and `coe_padicModelEquiv` moreover only restate what the definitions would be.

Repair: delete the three definitions and the five theorems from `Suggested.lean`. The README keeps 0.1–0.3 as targets with their intended signatures in prose (`G_K ≃ₜ* K_ι.fixingSubgroup`, `Ver : G^ab → H^ab`, `Ver ∘ Art_K = Art_L ∘ (Kˣ → Lˣ)`), without backticked names of this roadmap's own. `padicModelField` (line 43) has a real body and may stay only if a kept headline needs it; nothing kept does, so delete it too. Tested: with these eight declarations removed the remaining file has no reference to them (checked by grep on a scratch copy).

## R02 (P1) — Unit-filtration reciprocity is unowned

Location: `TauCetiRoadmap/LocalAnabelianGeometry/README.md` lines 144–146 ("from the Layer 7 amendment TauCetiProject/TauCetiRoadmap#1411, unit-filtration reciprocity `map_unitFiltration_normResidue` in its absolute form") and line 226 ("the images from unit-filtration reciprocity (#1411)").

Claim: the images of `G_K(n)` in `G_K^ab` are the closures of `Art_K(U_K^(n))`, consumed by 0.4, and through 0.4 by the Layer 2 comparison (torsion of `G_L^ab`), Layer 4 (`U(H) = Art_L(U_L^(1))`), Layer 5 (`U'(H) = Art_L(U_L^{(ε e_L)})`), 7.2 and 8.1.

Witness: the pull request #1411 revises the existing roadmap ClassFieldTheory, and the brief's rule is that a pull request revising an existing roadmap is never a dependency: the roadmap is cited as it is on main. ClassFieldTheory on main (`TauCetiRoadmap/ClassFieldTheory/README.md`) contains no `map_unitFiltration_normResidue` and no unit-filtration reciprocity target; its only mention of the unit filtration is a remark at line 1428. At the pin, `TauCeti/NumberTheory/LocalField/Norm/Conductor.lean` has only the prime-degree conductor criterion `UpperJump.unitFiltration_le_normGroup_iff_of_finrank_prime` (line 165), not the identity of the upper filtration with the unit filtration. No layer here states it.

Repair: either state it as a Layer 0 target of this roadmap, with its exact hypotheses (`K/ℚ_p` finite, `n ≥ 0` an integer, the upper filtration of `G_K` from FilteredLocalGaloisGroups 2.1: the image of `G_K(n)` in `G_K^ab` equals `Art_K(U_K^(n))`, closed since `U_K^(n)` is compact; locator Serre, Local Fields, XV §2, Thm 1 and its corollary, the finite-level form that `hyeon2025` line 586 and `mochizuki1997` line 145 both cite), with a `*Needs:*` line naming Hasse–Arf and the finite-level Artin maps `artinMap_restrict`; or declare it as a gap against ClassFieldTheory under `## Exact supplier contracts` (`What ClassFieldTheory must provide (gap:unit-filtration-reciprocity): …`), with the same slug in the plan. In both cases remove the citation of the amendment pull request.

## R03 (P2) — Four theorems elaborate for every nonarchimedean local field, including positive characteristic

Location: `TauCetiRoadmap/LocalAnabelianGeometry/Suggested.lean` lines 128 (`log_mul_of_mem_unitFiltration_one`), 181 (`map_inertiaSubgroup`), 185 (`map_wildInertiaSubgroup`), 203 (`localCyclotomicCharacter_comp_continuousMulEquiv`).

Claim: the README's standing convention (line 75) is `K` a finite extension of `ℚ_p`, and the Scope (line 64) excludes local fields of positive characteristic.

Witness: the section variables `{p} [Fact p.Prime] [FinitePadicExtension K p]` are dropped because `p` does not occur in these four types. The elaborated signatures (scratch `signatures.md`, confirmed by `#check @` on all 20 declarations) carry only `[IsNonarchimedeanLocalField K]`, which at the pin (`Mathlib/NumberTheory/LocalField/Basic.lean` line 45) is "valuative topology, locally compact, nontrivial" and so includes `𝔽_q((t))`. For `log_mul_of_mem_unitFiltration_one` on `K = 𝔽_2((t))`, `u = w = 1 + t ∈ U(K,1)`: the statement holds only because `NormedSpace.log` takes the junk value `0` on a ring with no `ℚ`-algebra structure (`Mathlib/Analysis/Normed/Algebra/Logarithm.lean` lines 89–94); with the series it defines, `log(1 + t²) = t² + t⁶ + … ≠ 0 = 2·log(1 + t)`. The three recovery statements are plausibly true for equal-characteristic fields, but the roadmap's route does not prove them: Layer 1's `d(A) = log_p #(A_{/tor}/p) − 1` is `log_p 0 − 1` (junk) when `U_K^(1) ≅ ℤ_p^ℕ`, which is the only route this README gives to `e(H^ab)` in Layer 3.

Repair: carry the binders explicitly in each signature, for instance `(p : ℕ) [Fact p.Prime] [FinitePadicExtension K p]` (and `[FinitePadicExtension K' p']` with its own prime in the Recovery section, `[FinitePadicExtension K' p]` in the Cyclotomic section), or name the instance variables and `include` them; then re-run `#check @` on the four. Tested on a scratch copy: with `(p : ℕ) [Fact p.Prime] [FinitePadicExtension K p]` added, `log_mul_of_mem_unitFiltration_one` elaborates and its type carries the instance.

## R04 (P3) — The README is not in TauCetiRoadmap form

Location: `TauCetiRoadmap/LocalAnabelianGeometry/README.md`, whole file.

Claim: the README follows the shape of the roadmaps on main.

Witness: no opening `**Summary.**` paragraph (line 3 starts the mathematics); `## Scope` instead of `## Scope and ownership`; `## Standing conventions` instead of `## Conventions`; `## What this roadmap consumes` instead of `## Exact supplier contracts`; no `## How to read the build`; the layers (lines 196–454) have no `*Needs:*` lines, no `### Examples` and `### Dependencies` subsections (the single `## Ordering` at line 478 stands in for all of them); none of the definitions `p(A)`, `d(A)`, `f(A)`, `a(A)`, `e(A)` (Layer 1), Kummer sequence and `T_ℓ(G)` (Layer 2), `I(G)`, `P(G)` (Layer 3), `U(H)`, `(k^m)_+(G)` (Layer 4), `U'(H)`, `(𝒪_{k^m})_+`, `(ℂ_{k^m})_+` (Layer 5), `d^i_m` (6.4), `IsUniformizing` (7.1) has a `**Checks.**` list; no `## Downstream consumers`. The worked examples at lines 456–476 are correct but are not attached to the definitions they test, and Layer 1's definitions have none at all beyond example 3.

Repair: rewrite in the upstream shape (read two roadmaps on main, e.g. `TauCetiRoadmap/ClassFieldTheory/README.md` and `TauCetiRoadmap/PadicPeriodRings/README.md` at its open head, which is already in that form). Each definition gets at least three discriminating Checks; the following are computed here and can be used directly: for `p(A)`, `d`, `f`, `a`, `e` the values on `ℚ_2` (`1, 1, 1, 1`), on `ℚ_3(μ_3)` (`2, 1, 1, 2`), and the boundary `ℚ_p` where `#(A_{/tor}/p) = p²` exactly; for Kummer sequences the standard sequence `K(μ_{ℓ^ν})` for `ℓ = p` and for `ℓ ≠ p` (unramified), and the negative control that a sequence with `H_ν^ab[ℓ^ν]` not cyclic is not Kummer; for `I(G)` worked example 2 as the negative control at `m = 0`; for `IsUniformizing` the three models on `ℚ_p` in the adversarial table below (trivial character, `χ_cyc`, `χ_cyc⁻¹`). Every target gets a `*Needs:*` line, and every layer `### Examples` and `### Dependencies`.

## R05 (P3) — Suppliers cited by pull-request number and prose name

Location: `TauCetiRoadmap/LocalAnabelianGeometry/README.md` lines 54, 58, 60, 63, 67, 119, 144, 148, 156, 226, 480, 482; `Suggested.lean` lines 22–24.

Claim: cross-roadmap citations name the roadmap and its section.

Witness: the gate reports `prnum=7`; the roadmaps `FilteredLocalGaloisGroups`, `PadicPeriodRings`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory` and `AnabelianGeometryAndNonabelianChabauty` are never named by folder name, only as "the filtered local Galois groups roadmap (#1795)" and so on. Consequence: the dependency check reports `depcheck: 241 roadmaps, 2296 edges, 0 problem(s)` although the roadmap's main supplier `FilteredLocalGaloisGroups` is not in the merge order at all (it is an open roadmap pull request not yet placed); the check cannot see the edge.

Repair: replace every `TauCetiProject/TauCetiRoadmap#NNNN` and `#NNNN` by the roadmap name and section (`FilteredLocalGaloisGroups §2.3`, `PadicPeriodRings §1.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3`, `AnabelianGeometryAndNonabelianChabauty`), in the README and in the Lean docstring, and re-run the dependency check: it should then list `FilteredLocalGaloisGroups` as a supplier (a `moved:` line is expected, not a defect).

## R06 (P3) — README and Lean names disagree

Location: `README.md` lines 218 (`artinMap_transfer`), 228 (`map_wildInertiaSubgroup_abelianization`), 332 (`additiveModule`), 420 (`exists_ringEquiv_of_isFiltered_two`), 433 (`exists_ringEquiv_conj_of_isFiltered`), 445 (`bijective_toFilteredOut`); `Suggested.lean` lines 12–13 and 220–234.

Claim: a backticked name of this roadmap's own in the README is declared in `Suggested.lean`.

Witness: none of the six names above is declared; the Lean file's 0.3 theorem is `absoluteTransfer_artinMap`, not `artinMap_transfer`. The module docstring (line 12) says "suggested forms, not an exhaustive checklist" rather than the "target signatures" form. Layer 7's preamble (README line 393) assumes `E/ℚ_p` finite Galois, while `IsUniformizing` and `exists_isUniformizing` (Lean lines 223, 230) take any `FinitePadicExtension E p`; the Lean is the right generality (neither the definition nor Hyeon's Ex. 5.4 construction uses Galois), so the README should say in 7.1 that Galois is first used in 7.3.

Repair: remove the backticks from the six README names (or, after R01, keep only names the file declares); rename or drop `artinMap_transfer`; put the docstring in the "<title>: target signatures" form, listing which headline theorems are not statable and what each lacks (it already does the second part); add the one clause in 7.1.

## R07 (P3) — Declarations at the pin to cite in the supplier contracts

Location: `README.md` lines 171–175 and Layer 3 (line 311).

Claim: Layer 3 cites only the abstract `IsProPSylow.eq_of_normal` for the Sylow step; 0.2 presents the continuous transfer descended to a quotient as new.

Witness: `TauCeti/NumberTheory/LocalField/WildInertia.lean` lines 553–579 already prove `isProPSylow_wildInertiaSubgroup` and `eq_subgroupOf_wildInertiaSubgroup_of_isProPSylow` (wild inertia is the unique Sylow pro-`p` subgroup of inertia, for `G_K`), which is the `G_K` case of the Layer 3 comparison and the input to `map_wildInertiaSubgroup`. `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClassModule/Transfer/Basic.lean` lines 47–75 define `abelianizationProPTransfer`, prove `continuous_abelianizationProPTransfer` for an open subgroup and `abelianizationProPTransfer_eq_one_of_mk_eq_one` (it kills the kernel of `G → G^ab(p)` for compact `G`): the pro-`p` version of 0.2's descent, whose proof 0.2 should reuse.

Repair: cite the four declarations in the supplier contracts, and in 0.2 say that the full-abelianization transfer is built the same way as `abelianizationProPTransfer`.

## Verified sound

**Gate.** `prnum=7`, `sorry-data=3` are R05 and R01. `build=1` is the lake advisory `imports Mathlib from package mathlib, which is designed for use with the module system; consider adding module`: `lake env lean TauCetiRoadmap/LocalAnabelianGeometry/Suggested.lean` exits 0 in 7.6 s with eighteen `declaration uses sorry` warnings and nothing else, and 88 of the 141 roadmaps on main start with the same plain `import Mathlib`, so I take this line as a false positive of the gate's build parser, not a finding. Dependency check: `depcheck: 241 roadmaps, 2296 edges, 0 problem(s)` (see R05 for why this is blind). Imports: `import Mathlib` plus six `TauCeti.*` modules, all present at the pin. No `set_option`, no `lemma`, no `#eval`. `#check @` on all 20 declarations elaborated in a scratch file; the types agree with `signatures.md`; the dropped binders are R01 (defs) and R03 (four theorems).

**Padding probe.** Every sorried theorem was tried with `first | rfl | (simp; done) | infer_instance | exact?` on a scratch copy: 14 failed, `coe_padicModelEquiv_eq_conj` hit the heartbeat limit; none closed. No small-value, boundary or Check-mirroring declaration is present.

**Sources.** `hyeon2025` = arXiv 2405.16950v4 (24 pages, read in full for §§1–6); `mochizuki1997` = the author's copy on the KURIMS page (9 pages, read in full). Seeded sample and headlines:

| Target | Source | Checked |
|---|---|---|
| Layer 1 Recovery (`p, d, f, e, a` from `G^ab`) | hyeon2025 lines 338–360, Prop. 3.1 with formula (4) | definitions of `p(G), a, d, f, e` identical to the README's; `(G_tor)^{(p')}` is the quotient by the `p`-Sylow, same cardinality |
| Comparison for every Kummer sequence of `G_K^2` | hyeon2025 lines 364–456, Prop. 3.2 | conditions (i) cyclic `H_ν^ab[ℓ^ν]`, (ii) `G/H_ν` abelian; the transfer diagram with `Art_{L_ν}` (lines 380–392); `T_ℓ ≅ ℤ_ℓ(1)` for every prime `ℓ`; the README's extra condition that `Ver` is an isomorphism `H_ν^ab[ℓ^ν] ≅ H_{ν+1}^ab[ℓ^ν]` is what Hyeon derives at line 391, harmless |
| Layer 2 Recovery (`G_K` form) | mochizuki1997 lines 76–89, Prop. 1.1 | via local duality, as the README says |
| Layer 3 | hyeon2025 lines 463–477, Lem. 4.1; mochizuki1997 lines 105–113, Prop. 1.2, Cor. 1.3 | `I(G)`, `P(G)` as defined; `m ≥ 1` |
| Layer 4 | hyeon2025 lines 484–546, Prop. 4.2; mochizuki1997 line 135, Prop. 2.1 | `𝓗_m(G)`, `U(H)`, colimit, diagram (6) with `Art⁻¹` and `log` |
| Layer 5 | hyeon2025 lines 552–648, Prop. 4.3; mochizuki1997 lines 141–193, Prop. 2.2, Def. 2.3 | `U'(H) = U(H, ε e(H^ab))`, `p^{−ε}`, completion `⊗ ℚ_p`; Mochizuki's index set is all positive reals |
| Layer 6 | hyeon2025 lines 657–753, Lem. 5.1, Def. 5.2, Prop. 5.3; mochizuki1997 lines 211–222, Cor. 3.1 | `d^i = dim_K (ℂ_p ⊗ V(χ^{−i}))^{G_K}`, Ax–Sen–Tate step, `d^i_m = dim_{ℚ_p}(…)/d(G^ab)` |
| Layer 7 | hyeon2025 lines 755–781, Ex. 5.4, Prop. 5.5, Cor. 5.6; mochizuki1997 lines 223–237, Def. 3.2, Cor. 3.3 | definition of uniformizing, the transfer construction, the criterion (sign: see Source issues), Cor. 5.6 |
| 0.6 | hyeon2025 lines 785–790, Lem. 6.1; mochizuki1997 lines 259–268, Lem. 4.1 | open subgroup spans |
| 8.1 weak theorem | hyeon2025 lines 133–135 and 791–821, Thm. 1.4 = Thm. 6.2 | `α_1(I∘) = I•`, `ι• ∘ α_1 = ι∘` on `I∘`, `f = ι•⁻¹ ∘ ι∘` |
| 8.2–8.3 strong theorem | hyeon2025 lines 136–142 and 822–866, Thm. 1.5 = Thm. 6.3 | `m ≥ 0`, `G^{m+3} → K^{m+1}`, uniqueness for `m ≥ 1`, of `θ|_K` for `m = 0`; the gluing over finite Galois `L ⊆ K^{m+1}` and the reduction of the conjugation identity to units |
| 8.4 Mochizuki | mochizuki1997 lines 270–288, Thm. 4.2 | `Isom_{ℚ_p}(K,K') → Out_Filt` bijective, filtration with index `> 0` |

**Adversarial table.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Layer 1 invariants | `ℚ_2` | `A_{/tor} = ℤ_2 × Ẑ`: `#(A_{/tor}/2) = 4 = 2²`, `#(A_{/tor}/ℓ) = ℓ` for `ℓ` odd, so `p(A) = 2` unique; `d = log_2 4 − 1 = 1`; `A_tor = ℤ/2`, prime-to-2 part trivial, `f = log_2(1+1) = 1`; `a = 1`; `e = 1` | matches worked example 3 |
| Layer 1 invariants | `ℚ_3(μ_3)` | `#(A_{/tor}/3) = 27`, `d = 2`; `A_tor = μ_2 × μ_3`, `f = log_3(2+1) = 1`, `a = 1` (`μ_9 ⊄ K` since `[ℚ_3(μ_9):ℚ_3] = 6`), `e = 2` | matches |
| Layer 1, boundary | `ℚ_p`, `d = 1` | `#(A_{/tor}/p) = p^{d+1} = p² ≥ p²` with equality | `p(A)` still unique; the `≥ ℓ²` threshold is tight |
| Layer 2 Kummer sequence | `K = ℚ_p`, `ℓ = p` and `ℓ ≠ p` | `L_ν = ℚ_p(μ_{ℓ^ν})`, `H_ν^ab[ℓ^ν] = Art(μ_{ℓ^ν})` cyclic of order `ℓ^ν`; transition `ζ ↦ ζ^ℓ`; `T_ℓ = ℤ_ℓ(1)` | both primes fine; unramified for `ℓ ≠ p` |
| Layer 3 `I(G)` | `K = ℚ_p`, `m = 1` | `H ⊇ G^[1]` ↔ `L/K` abelian; `e(L) = e(K)` ↔ unramified; `⋂` = image of `G_{ℚ_p^{ur}}` | equals inertia |
| Layer 3 at `m = 0` (negative control) | worked example 2, `p` odd | `G^ab ≅ μ_{p−1} × ℤ_p × Ẑ`, inertia `μ_{p−1} × ℤ_p × 0`; swapping the `ℤ_p` factor of `Ẑ` with the middle one is continuous and moves `0 × ℤ_p × 0` into `0 × 0 × Ẑ` | `G^ab` alone does not see inertia; `m ≥ 1` needed |
| 0.4 wild inertia image | `p` odd | `Art(ℤ_p^×) = μ_{p−1} × U^(1)`; unique Sylow pro-`p` = `U^(1) = Art(U^(1))` | matches |
| 0.5 kernel of `log` | `ℚ_2`, `u = −1`; `ℚ_p(μ_p)`, `u = ζ_p`; `ℚ_p`, `u = 1+p` | `−1 ∈ U(ℚ_2,1)` (`v(−2) = 1`), `2 log(−1) = log 1 = 0`; `v_K(ζ_p − 1) = 1`, `p log ζ_p = 0`; `v(log(1+p)) = v(p) = 1 ≠ 0` and `1+p` is not torsion | iff holds in all three |
| 0.6 span | `ℚ_p(√p)`, `I = μ_{p−1}` (not open); `I = 1 + p𝒪` | span `= ℚ_p ≠ K`; span `⊇ p𝒪 ⊗ ℚ_p = K` | openness is necessary and sufficient |
| 0.6 ring homs are `ℚ_p`-linear | `ℚ_p^× = p^ℤ × μ_{p−1} × U^1` (`p` odd); `ℚ_2^× = 2^ℤ × {±1} × (1+4ℤ_2)` | elements with `n`-th roots for all `n` prime to `p`: `p^k` needs `k = 0`, `μ_{p−1}` needs trivial, so the set is `1 + pℤ_p`; for `p = 2`, `−1` has all odd roots and `±(1+4ℤ_2) = 1 + 2ℤ_2` | characterization of `ℤ_p` holds for `p = 2` too |
| 7.1 `IsUniformizing`, wrong models | `K = E = ℚ_p` | trivial `ρ`: `ρ(Art u) = 1 ≠ u` on any open `I`; `ρ = χ_cyc`: `χ(Art u) = u⁻¹ = u` only for `u = ±1`, not open; `ρ = χ_cyc⁻¹`: `ι = id` works | definition excludes the two wrong models and admits the right one |
| 7.3 sign | `K = E = ℚ_p`, `ρ` of 7.2 | `ρ(Art u) = u`, `ρ(Art p) = 1` (`Art(p)` fixes `μ_{p^∞}`: pinned private lemma, `Cyclotomic.lean` line 268), so `ρ = χ_cyc⁻¹`; `ρ ⊗ χ^{−i} = χ^{−1−i}` has invariants iff `i = −1`; `d^{−1} = 1`, `d^0 = 0 = 1·(1−1)`; sum `1 = dim_{ℚ_p} E` | worked example 1 correct; agrees with `HT_τ = −m_τ` of FiniteFlatGroups R07.P7.3 and `χ_cyc(Art u) = N(u)⁻¹` of ClassFieldTheory |
| 6.2 orbit count | `E/ℚ_p` Galois, `K ⊆ E` | `E ⊗_{ℚ_p} K ≅ ∏_{τ:K→E} E`: `[K:ℚ_p]` orbits of size `[E:K]`, total `[E:ℚ_p] = #Hom_{ℚ_p}(E, ℂ_p)` | formula `d^i = [E:K]·#{τ : HT_τ = i}` consistent |
| Layer 5 depth | `p` odd, `ε = 1`; `p = 2`, `ε = 2` | `e_L < (p−1)e_L` iff `p ≥ 3`; `e_L < 2e_L`; `𝓂_L^{ε e_L} = p^ε 𝒪_L` | `deepUnitExpLogEquiv` applies in both cases |
| 8.2 at `m = 0` | worked example 5 | every `σ ∈ G^1` conjugates `α_1 = id` on the abelian `G^1`; `θ|_K = id` always | only `θ|_K` unique, as 8.2 says |
| 8.4 | `K = K' = ℚ_p` | `Isom = {id}`, so `Out_Filt(G_{ℚ_p})` is trivial | worked example 6 |
| `eq_of_continuousMulEquiv_abelianization` | `K = ℚ_p(√p)`, `K' = ℚ_p(√(pu))`, `u` a non-square unit, `p` odd | both `d = 2, f = 1, e = 2, a = 0` | no contradiction with non-isomorphic fields having isomorphic `G^ab` |
| Lean `log_mul_of_mem_unitFiltration_one` as elaborated | `𝔽_2((t))`, `u = w = 1 + t` | `NormedSpace.log = 0` (no `ℚ`-algebra), `0 = 0 + 0`; with the series, `log(1+t²) = t² + t⁶ + … ≠ 0 = 2 log(1+t)` | true by junk only: R03 |
| `map_inertiaSubgroup` | `α = id`; `⋂_m I_K·G_K^[m+1]` | `I_K` closed, `G_K^[m]` decreasing to `1`, compactness gives `⋂ = I_K` | Layer 3's `G_K` reduction holds |
| Index sets | Mochizuki Def. 2.3 vs Hyeon §2 | positive reals (`Set.Ioi 0`) vs `v ≥ 0` (`Set.Ici 0`) | README's convention paragraph is right; Layer 3 bridges them |

**Library declarations opened at the pins.** Tau Ceti: `FinitePadicExtension` (`AbsoluteRamificationIndex.lean` 63), `deepUnitExpLogEquiv` (`DeepUnits/Basic.lean` 117), `log_mul_of_mem_unitFiltration` (82, hypothesis `e < (p−1) i`), `exists_mem_unitFiltration_log_eq_smul` (157), `hasSum_log_of_mem_unitFiltration_one` and `continuous_log_unitFiltration` (`Logarithm.lean` 97, 165, both `[FinitePadicExtension K p]`), `inertiaSubgroup` (`Inertia/Basic.lean` 106), `wildInertiaSubgroup` (`WildInertia.lean` 235), `isProPSylow_wildInertiaSubgroup` and `eq_subgroupOf_wildInertiaSubgroup_of_isProPSylow` (553–579), `localCyclotomicCharacter` (`Cyclotomic/Character.lean` 33, any prime), `zpowHat` and `zpowHat_eq_padicPow_component` (`ZHat/Pow.lean` 77, 255), `continuous_transfer` (`Transfer.lean` 42), `MonoidHom.transfer_transfer` and `transfer_apply_of_mulEquiv` (`GroupTheory/Transfer.lean` 40, 125), `absoluteGaloisGroupExtend` and `galoisSubgroup` (`FiniteExtension.lean` 205, 115), `artinMap` (`Local/ArtinMap.lean` 109), `continuous_artinMap` (215), `artinMap_norm` (310), `artinMap_congr` (356), `unramifiedCoordinate_artinMap` (`Unramified.lean` 383), `abelianizedLocalCyclotomicCharacter_artinMap_norm` (`Cyclotomic.lean` 254), `ClassFormation.artinMap_groundInclusion` (`Formation/ArtinMap.lean` 281), `abelianizationProPTransfer` (`ClassModule/Transfer/Basic.lean` 47), `upperRamificationGroup` (`Herbrand/Basic.lean` 417, finite Galois `L/K` only: no filtration on `G_K` at the pin, so the headline theorems are indeed not statable). Mathlib: `IsNonarchimedeanLocalField` (`NumberTheory/LocalField/Basic.lean` 45), `NormedSpace.log` (`Analysis/Normed/Algebra/Logarithm.lean` 89), `TopologicalAbelianization` (`Topology/Algebra/Group/TopologicalAbelianization.lean` 42), `PadicAlgCl` and `PadicComplex` (`NumberTheory/Padics/Complex.lean` 54, 137), `IntermediateField.fixingSubgroupEquiv` (`FieldTheory/Galois/Basic.lean` 266), `cyclotomicCharacter` (`NumberTheory/Cyclotomic/CyclotomicCharacter.lean` 307), `ValuativeExtension` (`RingTheory/Valuation/ValuativeRel/Basic.lean` 1243). Not at the pin, as the README says: `injective_artinMap`, `cyclotomicCharacter_artinMap` (targets of ClassFieldTheory on main, README lines 565 and 1368 there), `map_unitFiltration_normResidue` (R02).

**Cross-roadmap citations resolved.** FilteredLocalGaloisGroups at the head of its open pull request: Layers 0–3 exist (README lines 219, 259, 292, 350), with `absoluteGaloisGroupEquivFixingSubgroup'`, `artinCoordinateHom`, `center_solvableQuotient_eq_bot` (`2 ≤ m`), `center_absoluteGaloisGroup_eq_bot`, `GroupFiltration`, `IsFiltered`, `FilteredOut`, `GroupFiltration.quotient`, `GroupFiltration.restrict`, `exists_isFiltered_restrict`, `closedDerivedSeries_add_le`, `iInf_closedDerivedSeries_eq_bot`, `SolvableQuotient` all declared in its `Suggested.lean` (lines 41–280); its Scope (line 65) leaves the anabelian theorems to this roadmap, so ownership is consistent in both directions. ClassFieldTheory on main: §2.6 arithmetic Frobenius, `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹` (line 1368), `injective_artinMap` for finite extensions of `ℚ_p` (line 565). PadicPeriodRings at its open head: §1.1 `completedGaloisAction`, `completedGaloisAction_continuous`; §1.2 `padicComplex_fixed_eq`, `padicComplex_fixed_closure_eq`; §1.4 `tateSen_H0` (lines 90–106, 173–205, 369). FiniteFlatGroupsAndIntegralPadicHodgeTheory at its open head: §R07.P7.1 (line 1548, `HT_τ(χ_p) = +1` at 1571), §R07.P7.3 (line 1624, locally algebraic `x ↦ ∏ τ(x)^{m_τ}` with `HT_τ = −m_τ` under arithmetic reciprocity at 1632). AnabelianGeometryAndNonabelianChabauty at its open head: Mochizuki 1996/1999 on curves only; no local-field reconstruction target, no overlap. Ownership was also searched by object across all open roadmap pull requests and main (`roadmaps grep` for Mochizuki's theorem, uniformizing characters, the `p`-adic model, the continuous transfer, and the four Lean names): no second owner. Merge order: this roadmap at position 380, after PadicPeriodRings (18) and FiniteFlatGroupsAndIntegralPadicHodgeTheory (46); FilteredLocalGaloisGroups unplaced (see R05).

## Not verifiable

- Serre, Local Fields XV §2 Thm 1 (unit-filtration reciprocity at finite level), Serre, Abelian ℓ-adic representations III App. §5, Tate 1967 §3.3, Neukirch II §5, Yamagata 1976, Jarden–Ritter 1979: cited as background, not as locators of targets; not opened. Hyeon cites the first two at lines 586 and 776, and Mochizuki at lines 145 and 232, in the same roles the README gives them.

## Source issues

- **Error** in hyeon2025 at Proposition 5.5, printed page 17: the source says a one-dimensional `E`-linear representation is uniformizing iff its Hodge–Tate number at `i = 1` is `[E:K]` and at `i = 0` is `[E:K]([K:ℚ_p]−1)`; it should be `i = −1` in place of `i = 1`, since the paper normalizes `Art_K` with arithmetic Frobenius (page 9) and defines `d^i` through `V(χ^{−i})` (page 15), so that the character of Example 5.4 on `ℚ_p` is `χ_cyc⁻¹`; affects a stated result (the proof is a citation to Mochizuki §3 and Serre, and Corollary 5.6 is unaffected because only the pair of values is used).
- **Misprint** in mochizuki1997 at §3, printed page 6: the source calls `d_V(i)` the `ℚ_p`-dimension of the `Γ_K`-invariants of `V(−i) ⊗ \hat{\bar K}`; it should be the `K`-dimension, as `V = ℚ_p` on `K ≠ ℚ_p` gives invariants `K` of `ℚ_p`-dimension `[K:ℚ_p] > dim V`, contradicting the bound stated three lines later; affects nothing (Hyeon states the `K`-dimension).
