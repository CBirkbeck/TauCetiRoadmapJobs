# Review of FieldOfNorms (pull request #1812 at 5b260a9)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/FieldOfNorms/README.md` and `TauCetiRoadmap/FieldOfNorms/Suggested.lean` at 5b260a9. Nine findings, five of them blocking (three P1, two P2). The worker's gate fails (`build=1` on Lake's module-system warning, `sorry-data=2`, `prnum=4`); each failure is a finding below. Sources read: Wintenberger 1983 (cache `a816a3da`), Wintenberger 2004 (`90013ec1`), Abrashkin 2010 (`e45b5a3e`), Keating 2009 (`e95d8e7f`); Tate 1967 and Sen 1972 resolve only to paywalled pages and are recorded `uncertified`.

## R01 (P1) — sorry'd data: the fixing-subgroup model is a `def` with body `sorry`

Location: `TauCetiRoadmap/FieldOfNorms/Suggested.lean:43–45` (`noncomputable def absoluteGaloisGroupEquivFixingSubgroupOfSeparable : … ≃ₜ* … := sorry`), the theorem at :50–56 that mentions it, and `fieldOfNorms` at :81–84 (`mul_mem' := sorry`, `one_mem' := sorry`).

Claim: the file has no sorry'd data.

Witness: the gate reports `sorry-data=2`; the `#check @absoluteGaloisGroupEquivFixingSubgroupOfSeparable` probe elaborates to `(K : Type) → [Field K] → (L : IntermediateField K (AlgebraicClosure K)) → absoluteGaloisGroup L ≃ₜ* L.fixingSubgroup`, so the def also lost `[Algebra.IsSeparable K L]` (its type does not mention it). The statement is in fact true for every algebraic `L` (`AlgebraicClosure K` is an algebraic closure of `L`), so the dropped binder is harmless, but a `≃ₜ*` built by `sorry` is data.

Repair: delete the def and the theorem `absoluteGaloisGroupRestrictEquiv_absoluteGaloisGroupEquivFixingSubgroupOfSeparable`; 0.0 stays a README target with its intended signature, citing FilteredLocalGaloisGroups 2.0 (`absoluteGaloisGroupEquivFixingSubgroup'`) for the finite case, and stated for algebraic `L` (separability is not needed). For `fieldOfNorms`, give the two proofs: `one_mem'` is `fun E E' h ↦ Subtype.ext (by simp [map_one])` and `mul_mem'` is `Subtype.ext (by simp [map_mul, ha E E' h, hb E E' h])`, since `Algebra.norm` is a monoid homomorphism.

## R02 (P1) — `norm_one_sub_of_minpoly_eq` is false at `n = 0`

Location: `TauCetiRoadmap/FieldOfNorms/Suggested.lean:130–134`: `(hx : E⟮x⟯ = ⊤) (hmin : minpoly E x = X ^ n - C a) : Algebra.norm E (1 - x) = 1 - a`.

Claim: for any `n`, a generator with minimal polynomial `X^n − a` has `N(1 − x) = 1 − a`.

Witness: `n = 0`, `a = 1`, `E' = E(X)` the rational function field, `x = X`. Then `X ^ 0 - C 1 = 0 = minpoly E X` (`minpoly.eq_zero`, `Mathlib/FieldTheory/Minpoly/Basic.lean:63`, `X` is not integral), `E⟮X⟯ = ⊤`, and `Algebra.norm E (1 - X) = 1` because `E(X)` is not a finite `E`-module (`Algebra.norm_eq_one_of_not_module_finite`, `Mathlib/RingTheory/Norm/Defs.lean:76`), while `1 - a = 0`. For `n ≥ 1` the statement is true: `N(1 − x) = ∏(1 − x_i) = f(1) = 1 − a`.

Repair: delete it from `Suggested.lean`: it mirrors the cyclotomic worked example (its docstring says so) and is not a headline; the README keeps the statement with the hypothesis `n ≥ 1`. If it is kept, add `(hn : 0 < n)`, which excludes the instance above (a nonzero minimal polynomial makes `x` integral and `E'` finite).

## R03 (P1) — the gate's build step fails on Lake's module-system warning

Location: `TauCetiRoadmap/FieldOfNorms/Suggested.lean:1–4` (`import Mathlib` and three `import TauCeti.…` lines).

Claim: the targeted build passes with `sorry` the only warning.

Witness: gate `build=1`: `warning: … imports Mathlib from package mathlib, which is designed for use with the module system; consider adding module`. `lake env lean` on the file exits 0 with 7 `declaration uses sorry` warnings and nothing else, so the file elaborates; the failure is Lake's.

Repair: the header used by the other roadmaps at this pin: line 1 `module`, blank line, `public import Mathlib`, `public import TauCeti.NumberTheory.LocalField.Herbrand.Basic`, `public import TauCeti.NumberTheory.LocalField.RamificationIndex`, `public import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Extension`, the module docstring, `@[expose] public section`, then the namespace. Rebuild with the gate's targeted build.

## R04 (P2) — 4.0 re-plans PadicPeriodRings §2 (`tateSen_character`)

Location: `TauCetiRoadmap/FieldOfNorms/README.md:408–414` (4.0 Tate's vanishing for ramified characters) and the Scope bullet at :54–58 ("Tate's vanishing theorem for ramified characters").

Claim: this roadmap owns `(Ĉ(η))^{G_K} = 0` for continuous `η : G_K → ℤ_p^×` with `η(G_K(0))` infinite, with a route through PadicPeriodRings §1.4.

Witness: PadicPeriodRings (open head 32476ef, earlier in the merge order), §2 "Tate–Sen over a general `p`-adic field", item 3 and its API line `tateSen_character`: for `K` complete discretely valued of characteristic `0` with perfect residue field and a continuous character `η : G_K → 𝒪_K^×` whose image is finite or contains an open subgroup isomorphic to `ℤ_p`, `H⁰` and `H¹_cont` of `C(η)` vanish when `η(I_K)` is infinite. A continuous `η` into `ℤ_p^×` has closed image, which is finite or contains an open `ℤ_p`, so 4.0 is the `H⁰` half of that target on a narrower base. PadicPeriodRings §2 also states `completedUnramifiedDescent`, which 4.2 uses in its "η is unramified" step.

Repair: delete 4.0 and the Scope bullet; add PadicPeriodRings §2 (`tateSen_character`, `H⁰` part; `completedUnramifiedDescent`) and §1.2 (`padicComplex_fixed_closure_eq`) to the supplier contracts, and let 4.2 cite them; in "Ordering" replace "§§1.2–1.4" by "§1.2 and §2".

## R05 (P2) — 4.2 mixes two normalisations of `e(Γ)` and misstates Lemma 1

Location: `TauCetiRoadmap/FieldOfNorms/README.md:434–437` ("`e(Γ) = lim_n i_n/p^n` equals `e(Γ')` [Wintenberger 2004, Lem. 1] … `e(Γ)` is `p e_K/(p − 1)`") and :450 ("a unit because `v(ε − 1) = e(Γ)/(p − 1)` and `e(Γ) = e(Γ')`").

Claim: with `e(Γ) := lim i_n/p^n`, one has `v(ε − 1) = e(Γ)/(p − 1)` and `e(Γ) = e(Γ')`.

Witness: Wintenberger 2004 defines `e(σ)` by `i_{n+1} − i_n = p^{n+1} e(σ)` for `n` large (p. 430, `90013ec1` lines 71–74) and shows `e(σ) = e_K` with `lim i_n/p^n = p e_K/(p − 1)` (§2.1, p. 433, lines 179–184); `v_X(ε − 1) = e(Γ)/(p − 1)` (§2.8, p. 437, line 321) is in that normalisation. With the README's `e(Γ)` and its `ε` (`ε_0 = ζ_p`, as in Wintenberger 1983, 4.3.9.1, `a816a3da` line 1105): for `K = ℚ_p`, `v_p(ε − 1) = lim p^n · v_p(ζ_{p^{n+1}} − 1) = 1/(p − 1)`, while the README's formula gives `p/(p − 1)²`. And `e(Γ) = e(Γ')` fails when `X'/j(X)` is ramified: `K = ℚ_p`, `K' = ℚ_p(√p)`, `p` odd, `L` the cyclotomic `ℤ_p`-extension of `ℚ_p`, `L' = LK'`, so `X' = X(√π)`: `lim i'_n/p^n = 2 · lim i_n/p^n = 2p/(p − 1)`. Lemma 1's proof (Serre IV Prop. 3 applied to the `j(X)`-embeddings of `X'`, `90013ec1` lines 303–313) gives `e(Γ') = e(X'/j(X)) · e(Γ)`, which is what the unit argument needs: `v_{X'}(j(ε) − 1) = e(X'/j(X)) · e(Γ)/(p − 1) = e(Γ')/(p − 1) = v_{X'}(ε' − 1)`.

Repair: define `e(Γ)` as Wintenberger does (`i_{n+1} − i_n = p^{n+1} e(Γ)` for `n` large, equal to `e_K` in characteristic `0`, `∞` in characteristic `p`, with `lim i_n/p^n = p e(Γ)/(p − 1)`); state Lemma 1 as `e(Γ') = e(X'/j(X)) · e(Γ)`; and write the unit argument as above.

## R06 (P3) — Hasse–Arf is cited as a Tau Ceti declaration that does not exist at the pin

Location: `TauCetiRoadmap/FieldOfNorms/README.md:169–170` ("**Hasse–Arf**, `TauCeti.LocalFieldsRamification.hasseArf` on `UpperJump` (`Herbrand/HasseArf/Abelian.lean`)") under "implemented in Tau Ceti"; consumed by 0.6.

Witness: at the pinned Tau Ceti there is no `hasseArf` and no `Herbrand/HasseArf/Abelian.lean`; `NumberTheory/LocalField/Herbrand/HasseArf.lean:137` has only the prime-degree case `UpperJump.exists_eq_intCast_of_finrank_prime`. The abelian theorem is a target of `Completed/LocalFieldsRamification/README.md:1022–1039` (Layer 3, "Hasse–Arf", Lean-facing exports `UpperJump` and `hasseArf`).

Repair: cite "the local fields and ramification roadmap, Layer 3, Hasse–Arf" as a roadmap target (not as implemented), and name the pinned prime-degree case for what is available now.

## R07 (P3) — suppliers cited by pull-request number

Location: `TauCetiRoadmap/FieldOfNorms/README.md` lines 68, 71, 115, 149, 158, 232, 318, 390, 411, 413, 447, 454, 488, 552, 584, 587 (`TauCetiProject/TauCetiRoadmap#1795`, `#1410`, `#940`, `#1474`) and `Suggested.lean:22–23`.

Witness: gate `prnum=4` (it lists four of the eighteen lines). The dependency check sees none of these edges: run as is, `depcheck: 241 roadmaps, 2309 edges, 0 problem(s)`; on a probe copy with the four names written (`FilteredLocalGaloisGroups`, `RamificationOfCompleteDiscretelyValuedFields`, `PadicPeriodRings`, `FunctionFieldArithmetic`), `241 roadmaps, 2310 edges, 0 problem(s)`.

Repair: replace every pull-request number by the roadmap name and section, in the README and in the module docstring.

## R08 (P3) — the Kummer and cyclotomic fields of norms are built by earlier roadmaps and not cited

Location: `TauCetiRoadmap/FieldOfNorms/README.md:64–96` (Scope, "It does not own") and the worked examples at :555–578.

Witness: FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3 (open head, earlier in the merge order) proves `kummerFieldOfNorms`: for the Kummer tower `K_∞ = K(π^{1/p^∞})` of a finite `K/ℚ_p`, `K_∞/K` is strictly APF, `X_K(K_∞) ≅ k((u))`, `L ↦ X_K(L)` gives `G_{K_∞} ≅ Gal(k((u))^sep/k((u)))`, and the embedding into `Fr R`; its check `K = ℚ_p, π = p` is this roadmap's Kummer worked example (including the sign `(−2^{1/2^n})_n` at `p = 2`). NoncommutativeAndEquivariantIwasawa §F.6 stage 1 builds the completed Amice field `E_C` with reduction `k_C((ū))` and the cyclotomic Frobenius, the cyclotomic norm field in Fontaine's explicit form, which PhiGammaModulesAndIwasawaCohomology §1.0 consumes.

Repair: in Scope, list both as owned elsewhere (the Kummer-tower instance by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3, the cyclotomic Amice field by NoncommutativeAndEquivariantIwasawa §F.6 stage 1), say that 1.5 and 2.2 specialise to the first and that the identification `X_{ℚ_p}(ℚ_p(μ_{p^∞})) ≅ 𝔽_p((π))` with the Amice field is a Check of the cyclotomic worked example; have the Kummer worked example cite §R07.4.3.

## R09 (P3) — README and Lean do not agree, and the docstring is not in the required form

Location: `TauCetiRoadmap/FieldOfNorms/Suggested.lean:6–26`, :68, :73, :50.

Witness: the Lean names `FiniteSubextension`, `IsNormCompatible` and `absoluteGaloisGroupRestrictEquiv_absoluteGaloisGroupEquivFixingSubgroupOfSeparable` appear nowhere in the README (grep of backticked names). The docstring opens with "suggested forms, not an exhaustive checklist" and says which carriers are missing, but does not name the headline theorems that are not statable: 2.2's `ι_{L/K} : G_L ≃ₜ* G_{X_K(L)}` (needs `X_K(L)` as a field), 3.3 (needs `G_K^u`), 0.6 (needs APF), 4.2–4.3 (need `ΓEXT`/`ΓAUT`), 5.2–5.4 (need `Λ_{L/K}`).

Repair: title the docstring "The field of norms: target signatures", say that `README.md` is the roadmap and this file is not, list the headline theorems above with the carrier each lacks, and mention the two kept definitions in the README's conventions (or inline their names where `fieldOfNorms` is introduced).

## Verified sound

Gate and build: `lake env lean TauCetiRoadmap/FieldOfNorms/Suggested.lean` exits 0 with 7 `declaration uses sorry` warnings and nothing else. `#check @name` for all nine declarations elaborated on a probe copy; the types agree with the worker's `signatures.md`; the only lost binder is the one in R01. One-tactic probes (`simp_all`) on `eq_zero_or_forall_ne_zero` and `norm_one_sub_of_minpoly_eq` fail, so neither is padding by that test. Dependency check: `0 problem(s)` as is and with the suppliers named (R07). No file outside the folder is changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FieldOfNorms'` is empty). No `set_option`, no LaTeX, no process words.

Library declarations opened at the pins: Tau Ceti `absoluteGaloisGroupEquivFixingSubgroup` (`FieldTheory/Galois/AbsoluteGaloisGroup/Extension.lean:181`, no finiteness hypothesis), `absoluteGaloisGroupRestrictEquiv` (`…/Basic.lean:325`), `absoluteGaloisGroupExtend` (`…/FiniteExtension.lean:205`), `finiteIntermediateFieldValuativeRel`/`…Topology`/`…_isNonarchimedeanLocalField` (`NumberTheory/LocalField/FiniteExtension/IntermediateField.lean:71–99`), `TauCeti.LocalFieldsRamification.upperRamificationGroup` (`Herbrand/Basic.lean:417`), `herbrand`/`inverseHerbrand` (:254, :258), `lowerRamificationGroup`/`lowerRamificationGroupReal` (`RamificationGroup.lean:97, :262`), `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:98`), `TauCeti.ramificationGroupGradedToResidueField` (`UnitFiltration/RamificationGroup.lean:481`, `G_{n+1}/G_{n+2} → 𝓀[L]`), `TauCeti.tameCharacter` (:566), `normalizedValuation_norm` (`Norm/Basic.lean:118`, `v_K(N x) = f · v_L(x)`), `exists_norm_one_add_eq_of_mem_maximalIdeal_pow` (`Norm/PrimeDegree.lean:56`), `TauCeti.IsTotallyRamified` (`RamificationIndex.lean:188`), `TauCeti.IsLocalRing.lowerIndex` (`RingTheory/LocalRing/RamificationGroup.lean:347`, `ℕ∞`-valued infimum of `v(σx − x)`), `teichmullerLift` (`LocalField/Teichmuller.lean:63`), `unramifiedExtension`/`maximalUnramifiedExtension`; Mathlib `Tilt` (`RingTheory/Perfection.lean:825`, `FractionRing (PreTilt O p)`), `PreTilt.untilt` (`RingTheory/Perfectoid/Untilt.lean:49`), `WittVector.fontaineTheta` (`…/FontaineTheta.lean:165`), `NormedField.valuation` (`Topology/Algebra/Valued/NormedValued.lean`), `PadicComplex` (`NumberTheory/Padics/Complex.lean:137`, no Galois action at the pin, so 4.0 is not statable here either way).

Cross-roadmap citations resolved: FilteredLocalGaloisGroups (#1795 at f235b83) Layer 1 `GroupFiltration`, `GroupFiltration.quotient`, `GroupFiltration.herbrandPsi` (defined for every subgroup `H` through `Subgroup.index`, so its use on the closed `G_L` of an APF extension is consistent), `strictMono_herbrandPsi`/`surjective_herbrandPsi` (open `H`), `exists_isFiltered_restrict`, 2.0 `absoluteGaloisGroupEquivFixingSubgroup'`, 2.1, 2.2; RamificationOfCompleteDiscretelyValuedFields (#1410 at bf98cae) §4a.1 (closed normal antitone `G_K^u`, finite projections, `G_K^0` inertia, `G_K^{0+}` wild inertia) and §4a.2 (`ψ_{L/K}`, tower law, open-subgroup identity, integral formula with `1/f`); PadicPeriodRings (#940) §1.2 `padicComplex_fixed_eq`/`padicComplex_fixed_closure_eq` and §1.4 (the `i ≠ 0` case), §2 (R04); FunctionFieldArithmetic (#1474) §3.1 Artin–Schreier–Witt operator and cyclic `p`-power extensions; PerfectoidSpaces on main P1.11 (`README.md:4355`), P3.8 (:8478, `Perfectoid.fontaineWintenberger` at :8535, `Perfectoid.fontaineWintenberger_nonempty` in its `Suggested.lean:80`, `fontaine_wintenberger_test_kummer_tower` at :8503, *finite-etale-under-completed-perfection* at :8526); AdicEtaleGeometry A1.0.5 (`README.md:143`); Completed/LocalFieldsRamification Layer 3 (Hasse–Arf, R06). Ownership against open pull requests was checked with `roadmaps grep` over all 457 heads (R08); no roadmap on main mentions the field of norms or APF extensions.

Sources, the seeded sample of 15 targets, each read at its locator in the cached text: Wintenberger 1983 1.2.1 (APF, `ψ`, strictly APF by `liminf`, `i(L/K)`, `c(L/K)` as `inf_{u ≥ i}`, which equals the README's `inf_{u > i}` because the value at `u = i` is the larger `i`) lines 129–149; 1.2.3 (stability, four parts) 156–163; 1.3.1 (elementary of level `i`: `G^i G_L = G_K`, `G^{i+ε} G_L = G_L`; equivalently every embedding `≠ id` has index `i`) 204–211; 1.4.1 (tower, criterion `i_n/[K_{n+1} : K] > c`, `c(L/K) = inf i_n/[K_{n+1} : K]` when `K = K_1`) 218–238; 2.1.2 (`v`, residue embedding by `[E : K_1]`-th roots of `[x]`) 262–272; 2.1.4 (`f_{L/K'} = f_{L/K} ∘ σ^r`) 282–285; 2.2.1 (both norm estimates with `(p − 1)i/p`) 288–295; 2.2.3 (`r(E)` the least integer `≥ (p − 1)i(L/E)/p`) 360–361; 2.3.2.1 (`v_{E'}(α − β) ≥ t ⇒ v_E(Nα − Nβ) ≥ φ(t)`) 408–411; 3.1.1–3.1.2 (`𝓔_τ`, `X_K(τ)`, degree, Galois case) 463–475; 3.3.1 (`i_X(σ) = v_X(σπ/π − 1)`, one less than Serre's index) 629–640; 3.3.4 (`G^u = G_{ψ(u)}`) 675–680; 3.3.6 (`H^{ψ(u)} = G^u ∩ H`) 698–701; 4.2.2.1 (`v_E(Nα/α^{[E':E]} − 1) ≥ c(E'/E)`) 892–895; 4.3.2/4.3.4/4.3.7/4.3.9.1 993–1106. Wintenberger 2004: 2.1, 2.5 Prop. 2 (proof as in 4.2), 2.6 Prop. 3, 2.7 (both categories, `n_0`), Thm. 2 and its proof (lines 172–332), Lemma 1 (R05). Abrashkin 2010 §7.1–7.4 (`e45b5a3e` 1900–1978): the categories `Ψ`, `~Ψ`, full faithfulness attributed to [10], and the lifting along an inductive system with `lim E_α = E(p)`, which 4.3–4.4 reproduce for the systems `F·E_∞`. Keating 2009 §3 (`e95d8e7f` 346) proves faithfulness as cited.

Adversarial pass (values on each side):

| Statement | Instance | Computed | Result |
| --- | --- | --- | --- |
| Conventions, `ψ_{L/K}` with `1/f` | `L/K` unramified of degree `f`; `K = ℚ_3`, `L = ℚ_3(ζ_3)` | index `[G_K : G_K(t)G_L] = f` for all `t ≥ 0`, `ψ = id`; tame: `f = 1`, index `2`, `ψ(u) = 2u` (agrees with RamificationOfCDVF §4a.2's check) | sound |
| Conventions, lower index | `σ` trivial on residue field | `v_X(σπ/π − 1) = v_X(σπ − π) − 1`; nontrivial on residue field: `−1` vs Serre `0` | sound (W1983 3.3.1) |
| 0.1 `K^ur` not APF; finite separable APF | `G_K(0)G_{K^ur} = G_{K^ur}` | index `= ∞`; open `H` gives finite index | sound |
| 0.3 index identity | `K ⊆ M ⊆ N` | `(G_K : G_K(u)G_N) = (G_K : G_K(u)G_M)(G_M : (G_M ∩ G_K(u))G_N)` by the modular law, `G_N ≤ G_M` | sound |
| 0.4 `i(L/K) > 0` iff totally ramified `p`-extension | Kummer `ℚ_p(p^{1/p})/ℚ_p`, Galois closure `C_p ⋊ C_{p−1}` | `i = p/(p − 1) > 0` while the Galois closure is not a `p`-group: "p-extension" means `p`-power degree, as in W1983 1.3.1 | sound, wording |
| 0.5 elementary tower, Kummer | `K_n = ℚ_p(p^{1/p^{n−1}})` | lower break of `K_n(ζ_p, p^{1/p^n})/K_n(ζ_p)`: `v(a) = p − 1` prime to `p`, so `t = p·e/(p−1) = p^n`; upper `t/(p−1) = p^n/(p−1) = i_n`; embedding index `v(ζ_p − 1) + v(p^{1/p^n}) − 1 = p^n/(p−1)` | sound |
| 0.5 criterion | Kummer, `K = K_1` | `[K_{n+1} : K] = p^n`, `i_n/p^n = 1/(p − 1)`, `c = 1/(p − 1)`; on `(b_n, b_{n+1}]` the ratio `ψ(u)/p^n` increases from `i_n/p^n` | sound |
| 0.6 abelian ⇒ strictly APF | `ℚ_p(μ_{p^∞})/ℚ_p` | `I_n = (p − 1)p^{n−1}`, `I_n/I_{n+1} = 1/p = 1/q_L`; `ψ(n) ≥ I_n` since `G^t = G^n` on `(n−1, n]`; `G^{0+} = G^1` by integrality of jumps | sound, tight at `q_L = p` |
| 0.6 graded pieces | `n ≥ 1`, `j = ψ_{M/K}(n)` | `j ∈ ℤ` (integer slopes between integer jumps), `G^{n+1} = G_{j+1}`, `G_j/G_{j+1} ↪ k_M^+` through `ramificationGroupGradedToResidueField (j−1)` | sound |
| 1.2 residue embedding | `E ⊆ E'` in `𝓔_{L/K_1}`, `[E : K_1] = p^k`, `[E' : K_1] = p^{k'}` | `N_{E'/E}([x]^{1/p^{k'}}) = [x]^{p^{k'−k}/p^{k'}} = [x]^{1/p^k}`; for `E ⊇ K_0` only, the `e_0`-th root is not a Teichmüller representative | sound |
| 1.3 norm estimate | `K = ℚ_3(ζ_3)`, `L = ℚ_3(ζ_9)`, `i = 2`, bound `⌈4/3⌉ = 2`; `α = β = 1`: `N(2) − 2 = 6`, `v_K(6) = 2`; `α = ζ_9 − 1`, `β = −1`: `N = ζ_3 − 8`, difference `−6`; `p = 2`, `ℚ_2(i)/ℚ_2`, `i = 1`: `2(ac + bd)` | tight | sound |
| 1.3 degenerate | `r = 0` (`L = K`), `i = 0` | difference `0`; `𝓂^0 = ⊤` | sound |
| 1.1 `eq_zero_or_forall_ne_zero` | arbitrary `L/K` (not algebraic) | `α_E = 0`, `E'' ⊆ E ⊔ E''` finite, `N_{E⊔E''/E''}(α_{E⊔E''}) = 0` with `α_{E⊔E''} = 0` | sound |
| 1.6 change of base | `K' = ℚ_p(μ_p)`, `p` odd | `p^r = [K'K_1 : K_1]` = `p`-part of `e(K'/K)`; `e = p − 1`, `r = 0`, `f_{L/K'} = f_{L/K}` | sound |
| 3.2 on the cyclotomic example | `χ(γ) ∈ 1 + p^nℤ_p ∖ 1 + p^{n+1}ℤ_p` | `ψ(n) = p^n − 1`; `v_{E_m}(ζ_{p^m}^a − ζ_{p^m}) = e(E_m)/e(ℚ_p(μ_{p^{m−n}})) = p^n` for `m > n`; lower index `p^n = ψ(n) + 1` | sound |
| 4.1 `ΓAUT`, `n_0` | `Γ' → Γ` | kernel finite and `Γ'` torsion-free ⇒ injective; closed image `≅ ℤ_p` ⇒ `p^{n_0}Γ` | sound |
| 4.2 `e(Γ)`, `v(ε − 1)` | `K = ℚ_p` | README `e(Γ) = p/(p − 1)`, `e(Γ)/(p − 1) = p/(p − 1)²`; actual `v_p(ε − 1) = 1/(p − 1)`; W2004 `e(Γ) = e_K = 1` | R05 |
| 4.2 Lemma 1 | `K' = ℚ_p(√p)`, `L' = LK'` | `e(X'/j(X)) = 2`, `lim i'_n/p^n = 2 lim i_n/p^n` | R05 |
| 4.2 "η ramified" step | `η(G_K(0))` finite | `K_η ⊆ F·K^ur`, bounded `e`; `v((1 + x)^p − 1) ≥ v(x) + 1` so a compatible system of `p`-power roots of a principal unit is trivial | sound |
| 4.3 ⇐ 4.4 | `E_F = F·E_∞` | residue extension of `E_F/F` finite, lies in some `F·E_m`; `Gal(E_F/F·E_m) ≅ p^mℤ_p`, normal (`F·E_m/E` Galois), totally ramified; strictly APF by 0.6 then 0.3 | sound |
| 5.1 lemma | elementary `E'/E` of level `i` | `N(α)/α^{[E':E]} = ∏(1 + (σα − α)/α)`, `v_{E'}((σα − α)/α) ≥ i` for all `α ∈ E'^×`, so `v_E ≥ i/[E' : E] = c(E'/E)` | sound (W1983 4.2.2.2) |
| 5.3 Frobenius on `𝒪_{L̂}/p` | 5.2 with `M = L` | `x ↦ x_0 mod p` onto ⇒ every class is `(x_1)^p mod p`; value group contains `1/e(E/K)` for all `E` | sound |
| 0.0 generality | `L` inseparable over `K` | `AlgebraicClosure K` is an algebraic closure of `L`, so the model holds without separability | R01 note |
| Kummer at `p = 2` | `t = (2^{1/2^n})` | `N(x) = −a` for `X^2 − a`, not norm-compatible; README restricts to `p` odd, FiniteFlatGroups §R07.4.3 uses `(−π_n)` | sound |
| `norm_one_sub_of_minpoly_eq` | `n = 0`, `a = 1`, `E(X)` | LHS `1`, RHS `0` | R02 |

## Not verifiable

- Tate 1967, §3.1 and §3.3 Theorem 2 (DOI 10.1007/978-3-642-87942-5_12): paywalled; recorded `uncertified`. Wintenberger 2004 (§2.5, line 256) applies it exactly as 4.2 does, which is the only check available here.
- Sen 1972 (DOI 10.1007/BF01390204): paywalled; cited only as not owned.
- Serre, *Local Fields*, and the two 1979 Comptes rendus notes and Wintenberger 1980: not fetched; cited as background only.
- Wintenberger 2004, Lemma 1's displayed formula is image-only in the Numdam text layer; R05 reconstructs it from the proof (lines 303–313) and from 2.8.

## Source issues

- none
