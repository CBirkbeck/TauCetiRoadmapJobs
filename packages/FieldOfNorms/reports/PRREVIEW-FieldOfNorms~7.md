# Review of FieldOfNorms (pull request #1812 at 2f82b82)

**Verdict:** accepted

**Summary.** Accepted: no stated result is false or unsupported at this head, and the three findings of the previous review (the converse construction of 0.5, the set `ε^{ℚ_p}` in 4.2, the wildness hypothesis for `e(Γ)`) are repaired, as are its six small corrections and two format notes. There are four small corrections and one format note, none blocking; the main one is that the Kummer worked example still justifies its elementary tower by "the levels increase strictly", the inference 0.5 now says is not enough. Three points are left for the human reviewers (the arrangement against Wintenberger 1983, the excluded `p`-adic Lie case, the source manifest).

## C01 — The Kummer worked example identifies its elementary tower by the criterion that 0.5 now says does not suffice

The example says "The levels increase strictly, so by 0.5 this is the elementary tower" (line 574). Since the repair of 0.5, that section states the converse construction as an equivalence with `b_n → ∞` and ends "Strictly increasing levels alone do not suffice" (line 203); the bounded-breaks example a few lines below the Kummer one is a tower with strictly increasing levels that is not APF. So the sentence uses the implication the roadmap itself refutes, although its conclusion is true here.

The missing value: `d = 1`, `r_n = 1`, `i_n = p^n/(p − 1)`, so `i_n − i_{n−1} = p^{n−1}` and `b_n = p/(p − 1) + (n − 1) → ∞`. Replace the sentence by "The levels increase strictly and `b_n = p/(p − 1) + n − 1 → ∞`, so by 0.5 `L/K` is APF and this is its elementary tower". The value `b_1 = p/(p − 1)` is the upper break of `ℚ_p(p^{1/p})/ℚ_p`, which makes it a usable Check of the formula for `b_n`.

## C02 — The summary states the tilt comparison for every APF extension; Layer 5 proves it for strictly APF ones

The opening paragraph fixes `L/K` infinite APF and then says "The completed perfection of `X_K(L)` is the tilt of the completion of `L`" (line 18). Layer 5 opens with "Let `L/K` be an infinite strictly APF extension" (line 476), the embedding `Λ_{L/K}` of 5.1 needs `c(L/K) > 0`, and Wintenberger 1983 states §4.2–4.3 for strictly APF extensions only (line 881 of the Numdam text). The layer guide in the same overview has the hypothesis; the summary sentence does not. Insert "for `L/K` strictly APF" (and "in characteristic `0`" if "tilt" is meant in the perfectoid sense of 5.3).

## C03 — The proof note of 0.3 names the wrong monotone function

"The strict part uses the monotonicity of `v ↦ (G_K^0 : (G_K^0 ∩ G_M)G_K(v))`" (line 162). That function is the integrand of `ψ_{M/K}` itself. The inequality the strict part rests on is `ψ_{N/K}(u) ≤ ψ_{M/K}(u)·B(u)` with `B(v) = (G_M^0 : (G_M^0 ∩ G_K(v))G_N^0)`: the integrand of `ψ_{N/K}` is the product `A(v)·B(v)` of the two indices, and one bounds `B(v) ≤ B(u)` under the integral. Monotonicity of `A` gives nothing here. This is also the function of Wintenberger 1983, 1.2.4 (lines 181–183 of the Numdam text, as far as the text layer shows). Replace the function by `v ↦ (G_M^0 : (G_M^0 ∩ G_K(v))G_N^0)`.

## C04 — The description of `X(i)` in 4.1 leaves the base field of 2.1 unclear

"`X(i)` is `X_{K'}` of `i` (2.1), after the change of base `X_K(L) = X_{K_n}(L)` (1.6) for the layer `K_n` with `i(K_n) ⊆ K'`" (line 384). Section 2.1 defines `X_K(τ)` for a `K`-embedding between two extensions of the same base, and `L` is not an extension of `K'`; also `i(K_n) ⊆ K'` holds for every `n ≤ n_0`, so "the layer" is not determined. What is meant: with `F = i(K_{n_0}) = i(L) ∩ K'`, apply 2.1 over `F` to `i : L → L'` and then identify `X_F(L') = X_{K'}(L')` by 1.6 (possible since `K'/F` is finite). Concretely `X(i)(α)_{K'_m} = i(α_{K_{m+n_0}})`. Saying this in the item would let an implementer write the functor down.

## N01 — In 1.4 the family `s(E)` needs its index set

"Fix an increasing integer family `0 < s(E) ≤ r(E)`" is possible only for `E ⊇ K_1`: for `K_0 ⊆ E ⊉ K_1`, `i(L/E) = 0` and `r(E) = 0`. The restriction "for `E ⊇ K_1`" stands on the next clause only; moving it to the family (as in Wintenberger 1983, 2.2.3.3) removes the doubt.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0.0 fixing-subgroup model | types of the three maps at the pin | `G_L → Gal(L^sep/L) → σL.fixingSubgroup ≤ Gal(K^sep/K) ← L.fixingSubgroup`; `τ` fixes `L` iff `τ|K^sep` fixes `σL` | sound |
| 0.0 open subgroups above `G_L` | characteristic `p`, `U` open `⊇ G_L` | `Fix(U) = E^perf`, `E` separable part; `[G_K : U] = [E:K]_s = [E:K]`; `E ⊆ L^perf ∩ K^sep = L` | sound |
| 0.1 APF, `K^ur` not APF | `G_K(0)·G_{K^ur}` | equals `G_{K^ur}`, index `∞`; finite `L`: `H` open | sound; source line 129 |
| 0.3 stability (Prop. 1.2.3) | index identity; strict part | `(G_K(u)G_M : G_K(u)G_N) = (G_M : (G_M ∩ G_K(u))G_N)`; `ψ_N ≤ ψ_M·B(u)` | sound; C03 on the note |
| 0.4 strictly APF, `i`, `c` | `i > 0` iff tot. ram. `p`-extension; finite `L` | `G_K(0+)G_E = G_K` iff tame part trivial; index bounded, `ψ → ∞` | sound; source lines 136–144 |
| 0.5 converse construction | slopes; `𝔽_2((t))`, levels `2n − 1` | `ψ(b_1) = d·b_1 = i_1`, `ψ(b_2) = i_1 + (i_2 − i_1)`; `b_n < 3`, not APF | sound (previous R01 repaired) |
| 0.6 abelian ⇒ strictly APF | `ψ(n)` integral; `ℚ_p(μ_{p^∞})` | `ψ(n) = Σ_{k≤n} I_k ≥ I_n`; ratio `≥ I_n/I_{n+1} ≥ 1/q_L`; cyclotomic: `1/p` | sound, tight |
| 1.1 `eq_zero_or_forall_ne_zero` | `α_E = 0`, `F = E ⊔ E''` | `N_{F/E}(α_F) = 0 ⇒ α_F = 0 ⇒ α_{E''} = N(0) = 0` | sound |
| 1.2 valuation, `f_{L/K}` (2.1.2) | `K_0 ⊆ E ⊆ E'`; `E ⊇ K_1` | `f(E'/E) = 1`; `N(x_{E'}) = x_{E'}^{[E':E]} = x_E` | sound; source lines 265–272 |
| 1.3 norm estimates, Lean form | `ℚ_3(ζ_9)/ℚ_3(ζ_3)`; `ℚ_2(i)/ℚ_2`; `r = 0` | `i = 2`, `⌈4/3⌉ = 2`, `v(N(2) − 2) = v(6) = 2`; `2(ac + bd)`, bound `1`; `0` | sound, tight |
| 1.4 ring `A_K(L)` (2.2.3–2.2.4) | `E ⊇ K_1`; `E = K_0 ≠ K_1` | `r(E) ≥ 1`; `r(K_0) = 0` | sound; N01 |
| 1.5 field structure (2.1.3, 2.3.1) | Lem. 2.3.2.1 at `t = 0` | `φ(0) = 0`; statement as source lines 273–281, 401–411 | sound |
| 1.6 change of base (2.1.4) | `K'_1 = K'K_1`; `K' = ℚ_p(μ_p)` | `[K'_1 : K_1] = p^r`; `[x]^{p^r/[E:K_1]} = f_{L/K}(x^{p^r})_E`; `r = 0` | sound |
| 2.3 Galois `L/K` (3.2.4, 3.3.4) | source lines 516–519, 675–694 | faithful, closed image, topologies agree, description of `G_K` as stated | sound |
| 3.2 on the cyclotomic tower | `χ(γ) ∈ 1 + p^nℤ_p ∖ 1 + p^{n+1}ℤ_p`, also `p = 2` | `ψ(n) = p^n − 1`; `γπ − π = (1 − π)(1 − (1 − π^{p^n})^u)`, valuation `p^n` | sound |
| 3.3 (Cor. 3.3.6), 3.4 (Prop. 3.4.1) | `u = −1`; source lines 698–723 | both sides `H`; statements as source | sound |
| Layer 4, `e(Γ)` | cyclotomic `ℤ_p`-extension of `ℚ_p`; `K' = ℚ_p(√p)` | `i_n = (p^{n+1} − 1)/(p − 1)`, difference `p^{n+1}`, `e = 1`; `e(Γ') = 2·1 = e_{K'}` | sound (previous R03 repaired) |
| 4.1 categories (w2004 2.7) | kernel and image of `Γ' → Γ` | kernel in finite `Gal(X'/jX)`, so trivial; image closed nonzero, so open | sound; C04 on `X(i)` |
| 4.2 Prop. 2 and the unit `a` | `u = ε^{1/p}`; `a = p^k·unit` | `u_0` of order `p²`, in `ε^{ℚ_p}`; `v(ε'^a − 1) = p^k·v(ε' − 1)`, so `k = 0`; `θ(Σ[ε]^i) = Σζ_p^i = 0` | sound (previous R02 repaired) |
| 4.3, 4.4 | `E_F = F·E_∞` | `Γ'_1` trivial on `k_{L'}`; `Gal(E_F/F·E_m)` open in `ℤ_p`, normal, totally ramified for `m` large | sound |
| 5.0 on Mathlib's `Tilt` | `E = ℚ_p`; `𝔽_p((t))`; trivially valued `𝔽_p(t)` | both sides `𝔽_p` in all three | sound |
| 5.1 (Prop. 4.2.1, Lem. 4.2.2.1) | elementary `E'/E` of level `i` | `v_E(∏(1 + (σα − α)/α) − 1) ≥ i/[E':E] = c(E'/E)` | sound; source lines 888–902 |
| 5.2, 5.3 | `M = L`, characteristic `0` | `x_0 = x_1^p` gives Frobenius onto `𝒪/p`; `e(E/K)` unbounded | sound; C02 on the summary |
| Cyclotomic example, `1 − π` | `p` odd; `χ(γ) = −1` | `N(ζ_{p^{n+1}}) = (−1)^p(−ζ_{p^n}) = ζ_{p^n}`; coefficients of `π²`: `−1` and `1` | sound |
| Kummer example | `K_n = ℚ_p(p^{1/p^{n−1}})` | `i_n = p^n/(p − 1)`, `b_n = p/(p − 1) + n − 1`, `c = 1/(p − 1)`, `Λ(t)_n = p^{1/p^n}` | sound; C01 on the justification |
| Bounded-breaks example | `𝔽_2((t))`, `y² − y = π_n^{−(2n−1)}` | `b_n = 1 + 2(2⁻¹ + … + 2^{−(n−1)}) < 3`; `G_K(3) ⊆ G_L` | sound |

- Source locators checked against the text: 26 in Wintenberger 1983 (Numdam text, lines 93–1106), 10 in w2004 (lines 61–332), abrashkin2010 §7.1 (lines 1900–1923), keating2009 §3 (lines 346–355).
- Library declarations opened at the pins (17): Tau Ceti `absoluteGaloisGroupRestrictEquiv` (`FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:340`), `absoluteGaloisGroupEquivFixingSubgroup` (`…/Extension.lean:188`), `absoluteGaloisGroupExtend` (`…/FiniteExtension.lean:252`), the three finite-intermediate-field adapters (`NumberTheory/LocalField/FiniteExtension/IntermediateField.lean:69, 75, 97`), `hasseArf` (`Herbrand/HasseArf/Abelian.lean:50`), `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:98`), `ramificationGroupGradedToResidueField`, `tameCharacter` (`UnitFiltration/RamificationGroup.lean:481, 566`), `normalizedValuation_norm` (`Norm/Basic.lean:130`), `exists_norm_one_add_eq_of_mem_maximalIdeal_pow` (`Norm/PrimeDegree.lean:56`), `lowerRamificationGroupReal` (`RamificationGroup.lean:278`), `lowerIndex` (`RingTheory/LocalRing/RamificationGroup.lean:351`); Mathlib `PreTilt`, `Tilt` (`RingTheory/Perfection.lean:623, 815`), `PreTilt.untilt` (`RingTheory/Perfectoid/Untilt.lean:49`), `WittVector.fontaineTheta` (`RingTheory/Perfectoid/FontaineTheta.lean:166`).
- Cross-roadmap citations resolved (15): FilteredLocalGaloisGroups (open head) 1.4, 2.0 (`exists_continuousMulEquiv_fixingSubgroup`), 2.1, 2.2 and its cyclotomic worked example; on main ClassFieldTheory Layer 7, RamificationOfCompleteDiscretelyValuedFields §4a.1, §4a.2, PadicPeriodRings §1.2, §2 (`tateSen_character`), PerfectoidSpaces P1.11, P3.8, AdicEtaleGeometry A1.0.5, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3, NoncommutativeAndEquivariantIwasawa §F.6 stage 1, PhiGammaModulesAndIwasawaCohomology §1.0; FunctionFieldArithmetic (open head) §3.1. The consumer LocalAnabelianGeometryPartII cites 0.2, 0.6, 1.4, 2.2, 2.3, 3.3, 4.3, 4.4 here; all exist.
- Previous findings: R01 repaired ("Then the union `L` is APF if and only if the sequence is finite or `b_n → ∞`", with the negative control as a worked example); R02 repaired ("then `η = χ_cyc` and `u ∈ ε^{ℚ_p}`", and `v_p(a) = 0` from the valuations); R03 repaired ("of wildly ramified continuous automorphisms (lower index at least `2`, as in 4.1)"). C01–C06 and N01–N02 repaired: the subfield in the faithfulness step, the attribution of `F_K`, target 0.0, the build-order sentence, the Amice Check (now `ū ↦ −π`, with `ū ↦ π` excluded by a computed coefficient), the description, `###` headings, `K_Γ` and `k_L`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/FieldOfNorms/Suggested.lean` gives three `declaration uses sorry` warnings and nothing else. The six elaborated types were compared with README 1.1 and 1.3: no binder lost; 1.3 is stated in the Galois case, as its docstring says. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp_all`, `aesop`) on a copy closes none of the three theorems.
- Dependency check: `depcheck: 172 roadmaps, 2002 edges, 0 problem(s)`. FilteredLocalGaloisGroups is an open new roadmap not yet in the merge order; this roadmap is placed after it. No file outside the folder is changed.
- Automatic checks: all pass on this head.
- Headline theorems (the local-field structure of `X_K(L)`, `G_L ≅ G_{X_K(L)}`, 3.3, 4.2–4.3, 5.2–5.4): none statable at the pins (no absolute upper filtration, no `GroupFiltration`, no field structure on the carrier); each is named in the module docstring with what it lacks. The pull request's title and description agree with the head.

Overlap check: read LocalAnabelianGeometryPartII, FilteredLocalGaloisGroups, LocalAnabelianGeometry, RamificationOfCompleteDiscretelyValuedFields, LocalFieldsRamification, PadicPeriodRings; filtered groups, `herbrandPsi` and `F_K` are owned by FilteredLocalGaloisGroups, `G_K^u` and `ψ_{E/K}` by RamificationOfCompleteDiscretelyValuedFields, the Kummer-tower field of norms by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3 and the cyclotomic one by NoncommutativeAndEquivariantIwasawa §F.6 stage 1, each cited in Scope; APF extensions and the general `X_K(L)` have no other owner, and LocalAnabelianGeometryPartII lists them as not its own.

Source independence: 12 passages compared with 4 sources, none shared (the two main sources are in French; 1.2–1.4 restate the definitions of Wintenberger 1983, 2.1.2 and 2.2.3, which admit little variation); largest share Wintenberger 1983, 32 of 51 locators; contents compared with Wintenberger 1983: Layers 0 and 1 cover its §1 and §2 (Layer 1 reordered, statement after the ring), Layers 2 and 3 split its §3, Layer 5 covers §4.2–4.3 and replaces §4.1 by Mathlib's `Tilt`, in the order the dependencies force (1.4 needs `i(L/E)` and the tower of 0.5, Layer 2 the field of 1.5, Layer 3 the `X_K(σ)` of 2.1, Layer 5 needs 2.1 and `c(L/K)`); 0.0, 0.6, Layer 4, 5.0, 5.3 and 5.4 are not in it.

Research link: The construction is Fontaine–Wintenberger's (Wintenberger 1983); Layer 4 is the full faithfulness of Wintenberger 2004, Thm. 2, which Abrashkin 2010, §7 uses for the local analogue of the Grothendieck conjecture; Layer 5 compares with Scholze 2012, Thm. 3.7. Rests on the README and the three texts read.

## Not verifiable

- Tate 1967, §3.3 Thm. 2: paywalled, recorded uncertified; used only through PadicPeriodRings §2.
- Sen 1972: paywalled; cited only as not owned.
- Serre, *Local Fields*, IV Prop. 3 and V §3; Wintenberger 1980; the two 1979 notes of Fontaine and Wintenberger; Abrashkin 2000; Scholze 2012, Thm. 3.7: not opened; none carries a target of its own.
- w2004 Lemma 1 and Prop. 2: the displayed formulas are missing from the text layer; Prop. 2's conclusion is read from its use at line 320, Lemma 1 from its proof (lines 303–313) and 2.8.
- Wintenberger 1983, 1.2.4: the displayed indices are garbled in the text layer (lines 177–189); C03 rests on the computation, not on the reading.

## Source issues

- none

## For the human reviewers

- **Scope / arrangement.** Wintenberger 1983 carries 32 of 51 locators; Layers 0, 1, 2–3 and 5 follow its §1, §2, §3 and §4.2–4.3 in order. I judged the order forced by the dependencies and did not raise it.
- **Wording.** README 1.2–1.4 state the definitions of Wintenberger 1983, 2.1.2 and 2.2.3 (in French) clause by clause in English; I treated them as definitions that can be written one way.
- **Not a target by choice.** Full faithfulness on all `p`-adic Lie extensions (Wintenberger 1980, as Abrashkin 2010 §7.1 uses it) is excluded because no proof is in print (README Scope); Layer 4 proves the `ℤ_p` case.
- **Licence / record.** The board's source manifest has no entry for Wintenberger 1983 (read from the Numdam copy), and its entry `sen1972` carries the authors and title of Montgomery–Vaughan 1977; the README cites Sen, Invent. Math. 17 (1972).
