<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/163#issuecomment-6363213375 -->
Review (claude) of 725fd74

Verdict: needs_changes

1. **F01** (P3) Two remarks cite sections of `MotivicEtaleKTheory`, which has no README, outside any declared gap

   - **Location.** `packages/KatoEulerSystems/README.md`:
     - line 153: "this is the sign of `MotivicEtaleKTheory` §12.1";
     - lines 1012–1013: "For smooth projective curves it agrees with the Deligne regulator of `MotivicEtaleKTheory` §12.2.";
     - line 1050 (*Needs:* of 3.4) and line 1064 (Dependencies of Layer 3).
   - **Claim.** Sections §12.1 and §12.2 of `MotivicEtaleKTheory` supply the `K₂` Chern sign and the comparison with the Deligne regulator.
   - **Witness.** `MotivicEtaleKTheory` exists only as a board target job, opened as a supplier of `Polylogarithms`, with no README. So §12.1 and §12.2 resolve nowhere, it is not in the merge order, and the reliance is not a declared gap.
   - **Why P3.** No target uses either citation.
     - The sign is fixed in the same paragraph (`c_(2,2)({u,v})` is minus the Kummer cup product and `ch_(2,2) = −c_(2,2)`), and it agrees with `PadicFamilies` §4.0.1 ("the Chern image is the cup product").
     - `beilinsonArchimedeanRegulator` states Kato's Theorem 2.6 for Kato's 2.10 regulator and is proved through §7 (Eisenstein and Poincaré pairings). It never passes through Deligne cohomology.
     - The comparison sentence concerns smooth projective curves, whereas the targets live on the affine `Y(M,N)`.
   - **Repair.**
     - Delete ", this is the sign of `MotivicEtaleKTheory` §12.1".
     - Delete the Deligne-regulator sentence of 3.4 together with its *Needs:* entry (line 1050) and Dependencies entry (line 1064).
     - Tested on the refuting instance: after the edit, a search of the README for `MotivicEtaleKTheory` returns nothing, and 3.4 still states Kato 2.5, 2.6, 2.10 and 6.6(2) completely.
     - If a later target comes to need the Deligne comparison, that target needs a declared gap against `MotivicEtaleKTheory`, with slug, section and a precise needs sentence.
   - **Depcheck.** The dependency check reports 0 problems because it does not resolve a name outside the merge order. This is not evidence of supply.

2. **F02** (P2) `Suggested.lean` states no headline theorem; statable headlines are absent

   - **Location.** `packages/KatoEulerSystems/Suggested.lean`:
     - lines 3–8: "representative target signatures … records the light definitions and the milestones … with proved checks that fix their conventions";
     - lines 272–297: a catalogue of about 60 target names "without carriers at the pins".
     - `packages/KatoEulerSystems/README.md` lines 23–26 repeat the "light definitions … proved checks" description.
   - **Claim.** The README's headline theorems (7.3, 7.8, 7.9: Kato's finiteness and finite-generation theorems) cannot be stated at the pins.
   - **Witness.** Elaborated at the pins, with only `sorry` warnings:
     - `AddGroup.FG` of `(W.baseChange (IntermediateField.adjoin ℚ {x | ∃ n, x^(m^n) = 1})).toAffine.Point`, under a `CuspForm`/`qExpansion` modularity hypothesis;
     - `Finite W.toAffine.Point`, from an entire continuation `F` of `W.LSeries` with `F 1 ≠ 0`.
   - **Statement details for the fix worker** (not part of the witness).
     - The modularity hypothesis: some weight-2 `CuspForm` for `Γ₀(N)` has `qExpansion` coefficients `W.LFunction n`.
     - The continuation hypothesis: `F` agrees with `W.LSeries` on `Re s > 3/2` (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`).
   - **Repair.**
     - Rewrite the module docstring in the required form: "KatoEulerSystems: target signatures". Name each non-statable headline with its missing carrier, without a catalogue:
       - Iwasawa cohomology: 5.1, 7.1, 7.2;
       - Bloch–Kato Selmer groups of `V_λ(f)`: 7.9 parts 1–2;
       - the Kato zeta morphism and the analytic p-adic L-function: 6.4;
       - classical `Ш(E/ℚ)`: Mathlib's `ContinuousCohomology.tateShafarevich` exists, but the Galois module `E(ℚ̄)` does not;
       - `A_f` and `J₁(N)`: 7.9, abelian part.
     - State the two headlines above as `theorem … := by sorry`, with modularity either as the `CuspForm` hypothesis or imported from `EllipticCurveModularity`, which is earlier in the merge order.
     - Move every non-headline declaration out of the file (R05). The commutative-algebra lemmas `finite_of_pseudoNull` and `finite_of_regular_annihilator` are true (checked below) but are not headlines; they stay in the README as targets of 4.5.
     - Replace README lines 23–26 with the acceptance-test description.

3. **F03** (P2) 6.5 restates `ModularSymbolsPadicLFunctions` §3.3 under a hypothesis nobody supplies, and promises an unstated "vector comparison"

   - **Location.** `packages/KatoEulerSystems/README.md`:
     - lines 1747–1757, whose hypotheses include "an arithmetic zeta section on the same neighbourhood whose specializations are the scalar regulators of 6.2 at the noncritical points", followed by "no endpoint of this roadmap depends on this target";
     - line 1760: "state the vector comparison instead of a scalar α-equality";
     - line 1666 (6.2): "only the vector comparison of 6.5 applies".
   - **Claim.** `criticalBadReductionComparison` is a theorem of this roadmap.
   - **Witness.** `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md` §3.3 (open head): a jointly analytic `A^±` with `A^± = uL^±` at Zariski-dense noncritical points equals `uL^±` on `V × 𝒲`, "in particular at x". Here `A^±` is the hypothesis and the dense agreement is 6.4.
   - No vector comparison is stated anywhere.
   - **Repair.**
     - Delete the first paragraph of 6.5 and `criticalBadReductionComparison` (README and the Lean catalogue). In Scope and ownership, say that the critical-slope comparison is `ModularSymbolsPadicLFunctions` §3.3 applied to an arithmetic family section, which no roadmap constructs.
     - Delete "state the vector comparison …" (line 1760) and the 6.2 clause at line 1666, or replace them with a named target with exact hypotheses.
     - Tested on a newform supercuspidal at p (`a_p = 0`, `ε(p) = 0`): there is no crystalline line and `α = 0`. After the repair, 6.2 and 6.5 make no claim at this f, so the README no longer promises a comparison it never states.

4. **F04** (P2) 4.2(1) restates the boundary nonvanishing of `AutomorphicLFunctionsAndLocalFactors`

   - **Location.** `packages/KatoEulerSystems/README.md` lines 1140–1144: "(1) `L(f,s)` has no zero on `Re(s) ≥ (k+1)/2` (Jacquet–Shalika …) … only the line `Re(s) = (k+1)/2` needs Jacquet–Shalika."
   - **Claim.** This roadmap owns the Jacquet–Shalika nonvanishing for newforms.
   - **Witness.** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` Layer AL.3, "Rankin–Selberg nonvanishing on the boundary" (open head): `L^S(s,π₁×π₂)` has no zeros on `Re(s) ≥ 1`. With `π₂` trivial on `GL₁` and the shift by `(k−1)/2`, this is clause (1).
   - **Location of the supplier statement.** Subsection "Poles, functional equations and the closed boundary", anchor `rs-boundary-nonvanishing`. The supplier is earlier in the merge order.
   - **Repair.**
     - Replace clause (1) by a citation of that target with `π₂ = 1` and the newform-to-automorphic dictionary (`GL2AutomorphicRepresentationsAndTransfer`). Add both to the supplier contracts and to the *Needs:* of 4.2.
     - Keep Rohrlich's clause (2), which no roadmap states, and the derived twisted nonvanishing.
     - Tested at `k = 3`, `r = 2`, on the edge line: the cited target gives `L(f,2) ≠ 0` as before.

5. **F05** (P3) Padding in `Suggested.lean`

   - **Location.** `packages/KatoEulerSystems/Suggested.lean`:
     - `rationalSmoothing` and its 2 examples (lines 37–48);
     - `torsionIndexAction` and 2 examples (54–65);
     - `siegelLeadingExponent`, 2 examples and `siegelLeadingExponent_eq_bernoulli` (69–86);
     - `katoEulerPolynomial`, its example and `katoEulerPolynomial_eval_zero` (93–105);
     - `fullLevelEulerOperator` and 2 examples (113–122);
     - `modularFiltration`, 2 examples and 4 theorems (134–165);
     - `criticalSign` and 2 `decide` examples (170–177);
     - `upperUnipotent`, `HasOneDimFixedSpace`, 2 examples and 3 theorems (186–222);
     - `ordinaryEulerFactor` and 2 examples (261–270).
   - **Claim.** These are the roadmap's light definitions and milestones.
   - **Witness.** On a scratch copy:
     - `katoEulerPolynomial_eval_zero` closes by `simp [katoEulerPolynomial]`;
     - `siegelLeadingExponent_eq_bernoulli` closes by `simp […]; ring`;
     - `modularFiltration_antitone` closes by `split_ifs`/`omega`;
     - the 14 examples compute values that mirror README Checks.
   - **Also.** `ker_sub_one_eq_bot_of_division` follows from `IsUnit.map` and `Module.End.isUnit_iff`.
   - **Repair.** Delete all of these from `Suggested.lean`; the README keeps every statement and Check. Not "prove in place".

6. **F06** (P3) The README backticks about 75 of this roadmap's own Lean names that `Suggested.lean` does not declare

   - **Location.** `packages/KatoEulerSystems/README.md`, for example line 404 `rationalSiegelUnit`, line 679 "`katoEulerAdapter_component`, `katoEulerPolynomial`, `katoEulerAdapter_norm` and `katoEulerAdapter_ext`", and line 1406 `katoZetaMap_generator`.
   - **Claim.** These are proposed library names (line 25–26: "The names written inside a target are proposed library names.").
   - **Witness.** 21 declarations in `Suggested.lean`, against about 75 of this roadmap's own names backticked in the README with no declaration (for example `katoZetaMap`, `blochKatoSelmer_finite`, `operatorZeta_zero`). By house rule each such backtick claims a declaration.
   - **Repair.** Keep backticks only on names `Suggested.lean` declares after R02. Write the other targets' names in plain prose or drop them, and delete README lines 25–26.

7. **F07** (P3) Pinned Mathlib name drift: `EisensteinSeries.eisensteinSeries_MF`

   - **Location.** `packages/KatoEulerSystems/README.md` lines 183, 892 and 914.
   - **Claim.** Mathlib has `EisensteinSeries.eisensteinSeries_MF`.
   - **Witness.** At the pin the declaration is `EisensteinSeries.eisensteinSeriesMF` (`Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean` line 35). The underscored name occurs nowhere at the pin.
   - **Repair.** Rename all three occurrences to `EisensteinSeries.eisensteinSeriesMF`.

8. **F08** (P3) No sources manifest on the package branch

   - **Location.** The `packages/KatoEulerSystems/` folder at the package head has README, `Suggested.lean` and `metadata.toml`, but no `sources.toml`.
   - **Claim.** The README lists about 20 cited works with locators.
   - **Witness.** The only recorded entry (`FontaineMessing1987`, waived) lives in `packages/KatoEulerSystems/sources.toml` on the board's main branch, not on this branch.
   - **This review.** The sources service created the file on this branch with five fetched entries: `Kato2004`, `Nakamura2023`, `Rubin2000`, `Loeffler2017`, `BurungaleTian2025`.
     - `Rubin2000` is the public 1999 draft.
     - The `Kato2004` and `Rubin2000` entries lack `authors`, `title` and `year`.
   - **Repair.**
     - Merge the main-branch waiver entry.
     - Record every work in the References with `authors`, `title`, `year`, `locator_scheme`, `locator` and `cited_for`. Paywalled works are `uncertified`, by DOI and locator.
     - Complete the fields of the five entries.

9. **F09** (P3) Locator precision (5.4, 5.1, 1.1)

   - **Location.**
     - `packages/KatoEulerSystems/README.md` lines 1499–1501 (5.4): "(Nakamura Theorem A.1, pp. 265–267; Definition A.4 and Corollary A.5, pp. 268–269)";
     - line 1399 (5.1): "construction §§13.9–13.12, pp. 228–232";
     - line 583 (1.1): "proof 2.11, pp. 130–131".
   - **Claim.** These locators cover the stated facts.
   - **Witness.** Nakamura Remark A.6 (`Nakamura2023` arXiv v2, p. 89) states the corestriction factors and the positive conjugation; Theorem A.1, Definition A.4 and Corollary A.5 do not. Kato 13.9 begins on p. 229; 2.11 is on p. 131 only.
   - **Also.** In Remark A.6, `P_l(u) = 1 − T′_l u + l S′_l u²` comes from §3.1.2.
   - **Repair.**
     - Add "Remark A.6" to the 5.4 locator, with the published page once it is checked against the published version.
     - Change the 5.1 range to pp. 229–232.
     - Change "proof 2.11, pp. 130–131" to "proof 2.11, p. 131".

10. **F10** (P3) A 6.4 Check uses an unrealizable root α

   - **Location.** `packages/KatoEulerSystems/README.md` line 1740: "At `p = 3, k = 2, r = 1, α = 2, ε = 1` the product is `1/4`."
   - **Claim.** This is an instance of 6.4.
   - **Witness.** If `α = 2` is a root of `X² − a_3X + 3`, the other root is `3/2` and `a_3 = 7/2`. That is not an algebraic integer, so no weight-two newform has this α. The value `1/4` is right only for the bare formula.
   - **Repair.** Use `a_3 = 0`, `α = √−3` (slope 1/2 < 1). Both factors equal `1 − α⁻¹ = 1 + √−3/3`, and the product is `2/3 + (2/3)√−3`.

11. **F11** (P3) Incomplete *Needs:* lines (4.4, 7.3)

   - **Location.**
     - `packages/KatoEulerSystems/README.md` lines 1271–1273 (4.4: "at `p = 2`, Tate's global Euler-characteristic formula"), with its *Needs:* at lines 1289–1290;
     - lines 1913–1916 (7.3: χ-components of `E(ℚ_n)` from the Euler system of 2.1), with its *Needs:* at line 1938.
   - **Claim.** The *Needs:* lines list the inputs these proofs use.
   - **Witness.** The Euler characteristic is `ArithmeticGaloisDuality` §R02.4.4, which is not listed. χ-components need the twisted Euler systems of `EulerSystemsAndKolyvaginSystems` §2.5; the `φ_j` of 4.6 is the cyclotomic twist, not a finite-order character twist.
   - **Repair.** Add `ArithmeticGaloisDuality` §R02.4.4 to the *Needs:* of 4.4, and `EulerSystemsAndKolyvaginSystems` §2.5 to those of 7.3.

12. **F12** (P3) Two downstream consumers are named wrongly or do not exist

   - **Location.** `packages/KatoEulerSystems/README.md` lines 2280–2283: "`RankZeroOneBSD` uses … `EllipticRegulators` uses the Siegel-unit identities of Layer 0".
   - **Claim.** These roadmaps consume this one.
   - **Witness.**
     - `RankZeroOneBSD` exists nowhere. The board has the package job `RankZeroOneBSDPartII`, which is presumably the intended consumer, though its job text does not mention this roadmap.
     - `EllipticRegulators` is on none of main, the open pull requests, the board jobs or the merge order.
   - **Repair.**
     - Rename `RankZeroOneBSD` to `RankZeroOneBSDPartII`, keeping the cited targets (5.3, 7.1–7.2, 7.4, 7.8, 7.9).
     - Delete the `EllipticRegulators` sentence.
     - The other two named consumers exist (`ModularIwasawaMainConjectures`, `AutomorphicCongruences`). `HeegnerPointEulerSystems` also cites §§6.6, 7.4 and 7.7 and may be added.

The README is mathematically careful: every target in the seeded sample matches its source at the cited theorem and page, and the declared corrections to Kato are right (the square in 1.9, the space of `η′` in 16.4(ii), the integral modules in 12.5(4), the scope of 12.8.2, the misprinted (12.5.1) in 14.5(3), and the period in 14.13). The blocking problems are elsewhere:

- a `Suggested.lean` that is an API catalogue rather than an acceptance test;
- two targets that restate theorems other roadmaps already plan.

There are 12 findings, 3 of them blocking (R02, R03, R04, all P2). The other nine are P3.

## Verified sound

**Counts.**

| What | Count |
|---|---|
| Seeded targets verified against their texts | 15 |
| Supplier roadmaps named | 17 |
| Supplier roadmaps resolved at main or their open head | 16 (`MotivicEtaleKTheory` has no README, R01) |
| Cited supplier sections confirmed to exist under the cited number | about 130 |
| Supplier sections read for content | 32 |
| Pinned library declarations opened | 9 |
| Adversarial rows with computed values | 52 |

**Elaboration.**

- `lake env lean packages/KatoEulerSystems/Suggested.lean`, run from the content checkout, finishes in 12 s. The only warnings are 8 `sorry` warnings. There is no `set_option`, no sorry'd data, a single `import Mathlib`, and `theorem` only.
- A `#check @` dump of all 18 declarations matches the README generality. No section binder is lost; the only unused hypothesis is `hk` in `modularFiltration_antitone` (the statement holds for every k).
- `finite_of_pseudoNull` and `finite_of_regular_annihilator` are true. In the second, μ lies in no minimal prime, and a height-one prime containing p and μ would be associated to `R/μR`. The Checks `Λ/(p)` (with μ = p) and `ℤ_p[[T]]/(p,T)` discriminate.

**Dependency check output.** `depcheck: 26 roadmaps, 232 edges, 0 problem(s)` There is no UPWARD or CYCLE line and no `moved:` line. Every supplier the README names is on main or earlier in the merge order, except `MotivicEtaleKTheory`: it is a board target job outside the merge order with no README, and it is cited only by the two unused remarks of R01.

### Seeded sample (page images of `Kato2004`; `Rubin2000` draft, printed page = PDF page − 10; `Nakamura2023` arXiv v2)

| Target | Locators checked | Result |
|---|---|---|
| 0.1 | Kato 1.3(2),(4) pp. 121–122; 1.4 pp. 122–123; 1.10 pp. 124–125 | sound; Kato also needs `c ≠ ±1` (covered by `c ≥ 2`); integrality over `ℤ[1/N]` follows from 1.3 over a general base |
| 0.2 | Kato 1.6, Lemma 1.7(1),(2), p. 123 | sound (row action `(α,β)σ`, `A²`-element fibre) |
| 0.4 | Kato Lemma 2.12, p. 131; 2.13, p. 132 | sound (c prime to 6A and the orders; A roots β′) |
| 2.1 | Kato 8.9 p. 185; Prop. 8.12 p. 186; §13.1 p. 224; Ex. 13.3 p. 225 | sound (Ξ = {m : prime(m) ∩ Σ = {p}}; polynomial identical to 13.3) |
| 3.4 | Kato 2.5, Thm 2.6, 2.7 (pp. 127–128); 2.9 p. 129; 2.10 p. 130; §§7.7, 7.12, 7.18–7.20; Thm 6.6(2) p. 163 | sound (Euler factors, `Re s > 2`, `Z(0) = 0`, `prime(M) ⊂ prime(N)`, `δ⁻`, the form `η_(f,g)`) |
| 5.1 | Kato Thm 12.5(1) p. 221; Thm 13.6 p. 227; §§13.9–13.12 | sound (minus conjugation, integral membership by 13.12); page range in R09 |
| 5.2 | Kato Thm 12.6 p. 222; 13.10–13.12 pp. 230–232 | sound (both families and coprimality conditions; the μ step is 13.12) |
| 5.4 | Nakamura Thm A.1, Rem. A.2, Lemma A.3, Def. A.4, Cor. A.5, Rem. A.6 | sound; the unsquared `d` in `μ_n` is present in arXiv v2 too, so the correction stands; locator in R09 |
| 6.2 | Kato 16.1 p. 268; 16.2, Rem. 16.3(2) p. 269; 16.4 p. 270; 16.6(1) and proof p. 271 | sound (`ord_p(α) < k−1`, `a⁻¹b` scaling, weak admissibility in the proof) |
| 6.5 | Kato 16.4, Rem. 16.5(2) p. 270; proof of 16.6 p. 271; supplier §§3.0, 3.3 | locators sound; content in R03 |
| 7.2 | Kato 12.5(3),(4) p. 222; 13.13 pp. 233–234; 13.14 p. 234; Conj. 12.10 p. 224; Nakamura Thm 5.2 and Conj. 5.1 | sound; the printed 12.5(4) does use the rational modules, which are zero at 𝔭 ∋ p, so the integral reading is right; Nakamura's proof cites "Theorem 12.4 (4)" |
| 7.5 | Rubin, proof of Cor. III.5.17, p. 53 | sound (totally ramified layers, norm module free of rank one, citing Perrin-Riou and Schneider) |
| 7.6 | Rubin Lemma I.5.3; Cor. III.5.17, p. 53; `SelmerIwasawaCohomology` §3.20 | sound (Rubin has no parity hypothesis; the supplier criterion is for odd p) |
| 7.8 | Rubin Thm III.5.11(ii) p. 51; Cor. III.5.18 pp. 53–54 | sound |
| 7.9 | Kato 14.1–14.8 pp. 234–239; (14.9.3)–(14.9.4), (14.10.1), (14.10.3) p. 240; (14.10.5), 14.11(2), 14.12 pp. 241–242; 14.13–14.14 pp. 242–243; 14.22 pp. 249–250; 15.23 p. 267; [Ro1] = Invent. Math. 75 (1984) | sound (𝔭 = ker(σ_c ↦ c^(−r)), corrections to 14.5(3) and 14.13, CM vanishing not claimed) |

**Other source checks.** `Loeffler2017` Theorems 2.2.2 and 2.3.1 are on arXiv p. 6, and `BurungaleTian2025` Theorems 2.3–2.4 and Remark 2.5 are on pp. 4–5; the numbering exists as cited.

### Adversarial table

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Conventions, Frobenius polynomials | k=2, ℓ=3, a₃=2, ε=1 | geometric `1−2u+3u²`; arithmetic `1−(2/3)t+(1/3)t²`; twisted and evaluated `1−(2/3)X+(1/3)X²` | agrees with Kato (14.10.3), 13.3 | none |
| 2 | Conventions, norm direction | c=5, a=2, P ∈ E[2]∖0 | coefficient 0 in `25[0]−E[5]`; 25−1 = 24 after `[2]^*` | consistent | none |
| 3 | Conventions, row action | σ=[[1,1],[0,1]] at (1/5,0) | (1/5,1/5); transpose gives (1/5,0) | Kato 1.6–1.7 | none |
| 4 | 0.1 smoothing | c=5, c=7, index of order dividing 2 | c²−1 = 24, 48; 48·24g = 24·48g | consistent | none |
| 5 | 0.1 theta identity | c, d ≥ 2 | both sides have divisor `c²d²(0)−d²E[c]−c²E[d]+E[cd]` | Kato 1.3(2) | none |
| 6 | 0.2 distribution | A=1, 2 | fibre sizes 1, 4 = A² | Kato 1.7(2) | none |
| 7 | 0.3 exponent | x = 0, 1/2, 2/5 | 1/12, −1/24, −11/300; printed formula −23/300; `x↦1−x` invariant | printed 1.9 lacks the square (p. 124) | none |
| 8 | 0.4 degeneracy | A=4 | 4 roots β′, not 16 | Kato 2.12 | none |
| 9 | 1.1 prime sets | (2,3)→(6,9) | prime(2) ≠ prime(6): branch excluded | Kato 2.3 | none |
| 10 | 1.1 norm vs trace | s=2+i; s=1+i | N=5, Tr=4; N=Tr=2 | discriminates | none |
| 11 | 1.2 Euler operator | k=2, r=1, ℓ=3 | K₂ coefficient 3 vs cohomological 1/3; no quadratic term if ℓ \| N | Kato 2.4 | none |
| 12 | 2.1 adapter | ℓ=3, a=2 or 0, ε=1 | `1−(2/3)X+(1/3)X²`; `1+(1/3)X²`; value 1 at X=0 | Kato 8.12, 13.3 | none |
| 13 | 2.2 dictionary | k=2, 4; Sym² at p=2 | prefactor ratio ℓ^(k−2) = 1, ℓ²; det = −4b³, −4 at b=1 | Nakamura Lemma A.3 | none |
| 14 | 2.3 operator | T′=S′=σ=1, ℓ=3; σ=0 | 3; 1 | elaborated | none |
| 15 | 3.1 filtration | k=4; k=2, i=1 | F¹=F²=F³=M, F⁴=0, gr¹=0; F¹=M | consistent | none |
| 16 | 3.2 normalization | E^(4)_(0,0) | 3!·2ζ(4)/(2πi)⁴ = 1/120 times E₄; ζ(−3) = 1/120 | correct | none |
| 17 | 3.2 Fourier transform | double transform on (ℤ/N)² | N²; N^(k−2)·N^(−k)·N² = 1; wrong power N⁴ at k=3 | correct | none |
| 18 | 3.2 smoothing | k=2, c=5, 7 | c²−c⁰ = 24, 48 | matches 0.1 | none |
| 19 | 3.3 smoothing | k=2, r=1, c=5, d=7 | (u,v)=(1,1); 20, 42 | consistent with 3.2 exponents | none |
| 20 | 3.4 regulator | Y = 𝔾_m, η_(2,z); η_(f,f) | `log 2·i dθ`, integral 2πi log 2; 0; Z(0)=0 | Kato 2.10, 2.5 | none |
| 21 | 4.1 unipotent | x=2 over ℤ; x=0; diag(1,ζ) | coker ℤ/2⊕ℤ; fixed dim 2; fixed dim 1 | true | none |
| 22 | 4.1 division place | d ≠ 1 in a division algebra | d−1 a unit, so ker(ι d − 1) = 0 (probe compiles) | true | none |
| 23 | 4.2 nonvanishing | k=4, r=3; k=3, r=2 | 3 > 2.5 (absolute convergence); 2 = (k+1)/2 (edge) | true | R04 |
| 24 | 4.2a local term | T=ℤ_p(2), p odd | `T^∨(1) = (ℚ_p/ℤ_p)(−1)`; no G_(ℚ_p) invariants; all invariant under G_(ℚ_p(μ)); H²_Iw ≅ ℤ_p | true | none |
| 25 | 4.3 orbit argument | p=3 with 2 lines; p=2; q+1 lines | orbit sizes 3^a, so fixed; swap possible at 2; q+1 ≡ 1 mod p | true | none |
| 26 | 4.3 integral τ | upperUnipotent 1, p | coker ℤ_p; ℤ/p⊕ℤ_p | true | none |
| 27 | 4.4 torsion | ℚ×ℚ; 0 module | torsion-free yet (1,0)(0,1)=0; torsion of rank 0 | Mathlib `IsTorsion` (R⁰), `IsTorsionFree` (IsRegular) | none |
| 28 | 4.5 finite support | ℤ_p[[T]]/(p,T); Λ/(p) with μ=p | 𝔽_p finite; regularity fails, module infinite | statement true | none |
| 29 | 4.6 twist | κ(γ)=4 ∈ 1+3ℤ₃ | φ₁(γx) = (1/4)γφ₁(x) | supplier §3.7 | none |
| 30 | 4.7 open image | Weil pairing | G_(ℚ(μ)) = ρ⁻¹(SL₂) | Rubin 5.8 | none |
| 31 | 5.1 conjugation | γ ↦ ιγ | −σ₋₁ | Kato 12.5(1) | none |
| 32 | 5.2 finite index | μ=p | p-torsion in Λ/pΛ | Kato 13.12 | none |
| 33 | 5.3 sign | k=2, r=1; k=4, r=2 | χ(−1); −χ(−1) (`decide` examples) | Kato 12.5(1) | none |
| 34 | 5.4 twist-one | degrees; P_ℓ | (1−k)+k = 1; `det(1−Fr t\|V′(1))` at t=X/ℓ equals `1−a_ℓX+ℓ^(k−1)ε(ℓ)X²` | Nakamura §3.1.2, Rem. A.6 | R09 |
| 35 | 5.5 injectivity | Λ⊕Λ/(T) → Λ | iso at (0); kernel Λ/(T) | true | none |
| 36 | 6.1 (16.4.1) | V=ℚ_p(1); V=ℚ_p | holds; Fil⁰D_dR(ℚ_p(1)) = 0 ⊉ D_crys | Kato 16.4 | none |
| 37 | 6.1 Gauss sum | p=3, n=1 | G = i√3, G⁻¹ = −i/√3, ratio −3 | correct | none |
| 38 | 6.1 (ii) factor | r=1; r=0 | 1−φ⁻¹; 1−p⁻¹φ⁻¹ needs r=0 | Kato 16.4(ii) | none |
| 39 | 6.2 scaling | a=2, b=3 | a⁻¹b = 3/2 | Kato Rem. 16.3(2) | none |
| 40 | 6.3 Gauss product | χ mod 3 | G² = −3 = χ(−1)·3 | correct | none |
| 41 | 6.4 unramified factor | α=1, ε=0; α=−1, ε=0; α=2 at p=3 | 0; 2; 1/4, but α=2 is unrealizable | Kato 16.2(ii) | R10 |
| 42 | 6.5 critical slope | v_p(α) = k−1 | a log-type element vanishing at κ^rχ for r = 1..k−1 | uniqueness fails | R03 |
| 43 | 6.6 dyadic lattice | y²+xy=x³+1 | b₂=1, b₆=4, b₈=1, Δ = −1−432 = −433; log(2u) = 2u+2u²+(8/3)u³…; 2u(1+u) ∈ 4ℤ₂; tail 2ⁿ/n has v₂ ≥ 2 | image 4ℤ₂ | none |
| 44 | 7.2 lengths | (2,1,1), (2,1,0), (0,0,0); κ⁻¹ vs κ⁻²χ | ok, fails, ok; χ = κ impossible | correct | none |
| 45 | 7.3 descent | ℤ[1/p] | rank 1, torsion-free, not finitely generated | correct | R11 |
| 46 | 7.4 Coleman | α=1; α=−1 | 1−α⁻¹ = 0; 2 | Rubin 5.14 | none |
| 47 | 7.5 norms | Ẽ(𝔽_p) | norm = multiplication by p, nilpotent on the p-part | Rubin p. 53 | none |
| 48 | 7.6 finite submodule | Λ/(p,γ−1); N>1 | 𝔽_p torsion and finite; E(ℚ)[p] ↪ E(ℚ_q)_tors = 0 | correct | none |
| 49 | 7.7 control | unit root α | (1−α)(1−β) with 1−p/α a unit; same p-part as 1−α⁻¹ | correct | none |
| 50 | 7.8 | p=2; supersingular p=3 | factor 2 excludes; \|Ẽ\| ∈ {4,1,7} | Rubin 5.18 | none |
| 51 | 7.9 Selmer | k=2; k=3; [ℤ_p : p⁻¹] | r=1=k/2; r=1,2 ≠ 3/2; 1/p < 1 | Kato 14.2–14.5 | none |
| 52 | 7.9 cyclotomic FG | σ ↦ σP−P | homomorphism to T₀ killed by e; G^e open | correct | none |

### Duplication and ownership (open pull requests checked through `roadmaps grep`, by object)

- **Searches with no other owner:**
  - zeta morphisms (only consumed by `CompletedCohomologyAndLocalGlobalCompatibility`);
  - Siegel units and Beilinson elements (only `PadicFamilies` §4.0.1, which this roadmap imports);
  - Perrin-Riou maps (`PhiGammaModulesAndIwasawaCohomology` excludes them);
  - Kato's Eisenstein series, operator-valued zeta functions and formal-group universal norms;
  - Rohrlich's theorem;
  - the abelian-variety Bloch–Kato comparison. Only the elliptic §4.26 of `SelmerIwasawaCohomology` exists, and `NeronModelsAndSemistableAbelianVarieties` has no `H¹_f` statement, so this roadmap may own `abelianBlochKatoComparison`.
- **Duplicate found:** the Jacquet–Shalika clause (R04).
- **Fully qualified names:** no `Suggested.lean` name collides with a declaration of a readable roadmap.

### Supplier citations resolved (main or open head)

- **Section headings.** The following exist under the cited numbers:
  - `PadicFamilies` §§4.0.1–4.0.3, 4.5;
  - `ModularCurves` §§0A, 2A, 2D, 2E, 5B (main);
  - `ModularCurvesPartII` §§3.13–3.15, 4.5, 4.8, 5.8, 5.11–5.12, 5.15–5.16, 6.1–6.3, 8.1–8.5, 9.1–9.2, 9.12, 14.1–14.4, 14.8, 14.9a, 14.11–14.12, 16.2;
  - `SchemeKTheoryOperations` §§2.2–2.4, 3.6, 6.1;
  - `K2SymbolsBrauer` §§6.4, 6.7–6.9, 8.1;
  - `ModularForms` Layers 0, 7, 9 (main);
  - `AutomorphicGaloisRepresentations` §§1.2, 1.5, 1.6, 4.5, 4.8, 5.1–5.2, 6.1, 7.2–7.3, 7.5;
  - `SelmerIwasawaCohomology` §§0.7–0.11, 2.7, 2.8, 2.8a, 2.12, 2.12a, 2.15, 2.19–2.21, 3.0–3.3, 3.5–3.7, 3.9–3.11, 3.13, 3.15, 3.18–3.21, 4.9, 4.26;
  - `ArithmeticGaloisDuality` §§R02.1.2, R02.2.1–R02.2.3, R02.4.2–R02.4.3, D7.3–D7.4;
  - `EulerSystemsAndKolyvaginSystems` §§2.1, 2.2, 2.4, 2.5, 4.3, 4.17, 8.2, 8.3, 8.6, 8.7, 8.16, 8.37–8.39;
  - `PadicMeasuresIwasawaAlgebras` §§4.1–4.6 (main);
  - `PadicHodgeRegulators` §§1.4, 1.7, 1.11, 8.8, 8.13–8.16, 8.18, 8.20–8.22, 9.31–9.36 (board package);
  - `ModularSymbolsPadicLFunctions` §§0.2, 0.7, 0.8, 1.1–1.3, 2.5, 3.0, 3.2–3.3;
  - `CompletedCohomologyAndLocalGlobalCompatibility` §2.6;
  - `EllipticCurves` Layers 1, 4, 6 (main);
  - `HeightsRationalPointsAndObstructions` §1.7.
- **Content confirmed where read:**
  - `PadicFamilies` §4.0.1 factors `1 − ℓ^(−r)A_ℓ + ℓ^(k−1−2r)B_ℓ`;
  - `EulerSystemsAndKolyvaginSystems` §8.2 requires irreducibility over `G_(K∞)`, as in Rubin p. 27;
  - `SelmerIwasawaCohomology` §3.13 is for odd p only, which is why 4.4 uses the Euler characteristic at 2;
  - `PadicHodgeRegulators` §§8.22 and 9.36 are for odd p, and §9.35 covers all of weight space;
  - `ModularSymbolsPadicLFunctions` §3.3 (see R03).
- **Unresolved.** `MotivicEtaleKTheory` §§12.1 and 12.2: the roadmap exists only as a board target job with no README (R01).
- **Downstream names.**
  - Resolved: `ModularIwasawaMainConjectures` and `AutomorphicCongruences` (board packages).
  - `RankZeroOneBSD`: absent; the board package job is `RankZeroOneBSDPartII`.
  - `EllipticRegulators`: absent (R12).

### Pinned library declarations opened

| Declaration | File and line at the pin |
|---|---|
| `Module.IsTorsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` line 223 |
| `Module.IsTorsionFree` | `Mathlib/Algebra/Module/Torsion/Free.lean` line 45 |
| `WeierstrassCurve.LFunction`, `WeierstrassCurve.LSeries` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` |
| `EisensteinSeries.eisensteinSeriesMF` | `Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean` line 35 |
| `DirichletCharacter.LFunction` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` line 60 |
| `ContinuousCohomology.tateShafarevich` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean` line 71 |
| `CuspForm` | `Mathlib/NumberTheory/ModularForms/Basic.lean` line 80 |
| `UpperHalfPlane.qExpansion` | `Mathlib/NumberTheory/ModularForms/QExpansion.lean` line 171 |
| `TauCeti.kummerMap` | `TauCeti/FieldTheory/GaloisCohomology/Steinberg.lean` |

## Not verifiable

- **Nakamura, published pagination** (Invent. Math. 234): only arXiv v2 was read. The statement numbering agrees; the published page numbers were not checked.
- **Perrin-Riou (Invent. Math. 99, 1990), Théorème 3.1, and Schneider (Invent. Math. 79, 1985), §A.1, Lemma 6** (for 7.5): paywalled. Checked only through Rubin's citation on p. 53.
- **Bloch–Kato, Example 3.11** (for 7.9): Progress in Math., paywalled.
- **Diamond–Shurman, Theorem 6.6.6, and Ribet, Math. Ann. 253** (for 7.9): textbook not held; paywalled.
- **Fontaine–Messing** (for 7.9): waived in the board's manifest. Its role is confirmed only through Kato 14.22.
- **Outside the sample, sources not opened:** Colmez 1998, Greenberg LNM 1716, Serre 1972, Jacquet–Shalika 1976, Rohrlich 1984 and 1988, Momose 1981, Ghate–González-Jiménez–Quer 2005, Ribet's Katz–Lang appendix, Weibel's K-book, Nakamura arXiv:1201.6475.
- **Content of some supplier sections:** `AutomorphicGaloisRepresentations` §5.2 and `ModularCurvesPartII` §§9.1–9.2 were confirmed to exist, but their content was not compared line by line.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "725fd74", "job": "REV-PKG-KatoEulerSystems", "model": "opus", "worker": "fable-rev4"} -->
