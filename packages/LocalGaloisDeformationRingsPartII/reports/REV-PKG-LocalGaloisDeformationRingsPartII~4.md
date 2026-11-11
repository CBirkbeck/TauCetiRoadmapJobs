<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12941#issuecomment-6788976405 -->
Review (claude) of 84e56c7

Verdict: needs_changes

1. **F01** (P2) 1.3 and 1.4 fix an arbitrary residual eigenbasis; the source fixes a gauge basis

   **Location.** `packages/LocalGaloisDeformationRingsPartII/README.md` line 209 (1.3): "Fix a residual module `𝔐̄` with residual eigenbasis `β̄` and shape `w̃_j = w_j t^{ν_j}`"; line 223 (1.4): "a gauge basis lifting `β̄` exists".

   **Claim.** For every eigenbasis `β̄` of `𝔐̄` and every lift `𝔐` over `R`, an eigenbasis lifting `β̄` satisfies the degree conditions.

   **Witness.** `R = 𝔽`: the only lift of `β̄` is `β̄`, so 1.4 makes every eigenbasis gauge. But eigenbases differ by Iwahori elements (1.2), gauge bases by `T(𝔽)^f` (1.4). `BHHMS23 line 859` fixes a gauge basis.

   **Repair.**

   1. In 1.3 replace "with residual eigenbasis `β̄` and shape" by "with a residual gauge basis `β̄`, that is, an eigenbasis of `𝔐̄` whose matrices `A^(j)` satisfy over `𝔽` the two conditions below (BHHMS23, §3.1.1, p. 19), and shape".
   2. Add to the Checks of 1.3: "An eigenbasis of `𝔐̄` need not be gauge: eigenbases differ by Iwahori elements (1.2), residual gauge bases only by the periodic torus `T(𝔽)^f` (1.4 at `R = 𝔽`). For a non-gauge `β̄` no gauge basis lifts it, already over `R = 𝔽`; the hypothesis on `β̄` is needed."
   3. In 4.2 after "it has an eigenbasis with `A^(j) = D_j w̃_j`, `D_j ∈ T(𝔽)`" add ", which is a residual gauge basis in the sense of 1.3 (BHHMS23, proof of Proposition 4.2.1, p. 28)".

   Tested on the refuting instance: with `R = 𝔽` and `β̄` gauge, `β = β̄` satisfies the conditions; a non-gauge `β̄` is now outside the hypothesis. For 4.2: `D w t^(2,1) = [[0, d₁v], [d₂v², 0]]` has pivots of degrees `1 = ν₂` and `2 = ν₁`, lower-left entry in `v𝔽[v]`, the other entries zero, so the monomial basis is gauge and 5.2 keeps its input.

2. **F02** (P2) 2.1–2.3 are stated for rings topologically of finite type; Layer 5 applies them to complete local rings, through an undefined "supplier's extension"

   **Location.** README line 245 (2.1): "Let `R` be a `p`-adically complete `𝒪`-flat `𝒪`-algebra topologically of finite type … For a complete local deformation base apply the supplier's extension through admissible `p`-complete finite-type thickenings". Also line 69 (gap:relative-monodromy-criterion) and its `needs` in `design/plan.json`.

   **Claim.** 2.1–2.3 supply the monodromy equations that 5.2 imposes on `R = ⊗̂_j R_j`, `R_j = 𝒪⟦eight variables⟧`.

   **Witness.** `R_j/ϖ = 𝔽⟦x₁,…,x₈⟧` is not finitely generated over `𝔽`, so `R_j` is not topologically of finite type. Line 77 supplies `Y^{[0,h],τ}(R)` only for complete Noetherian local `R`. No section or gap states the "extension".

   **Repair.**

   1. In 2.1 replace the first hypothesis by "Let `R` be a `p`-adically complete `𝒪`-flat `𝒪`-algebra that is either topologically of finite type or complete Noetherian local with residue field `𝔽`".
   2. Replace the sentence "For a complete local deformation base … arbitrary `R`." by "The chart rings of Layer 5 are of the second kind (`𝒪⟦x₁,…,x₈⟧` is `p`-adically complete, and not topologically of finite type since `𝔽⟦x₁,…,x₈⟧` is not finitely generated over `𝔽`); `𝒪^rig_R`, `λ` and `N_∇` are given there by the same formulas, and the source uses the derivation and its jets over such `R` (BHHMS23, proof of Proposition 4.2.1, pp. 28–29)."
   3. In gap:relative-monodromy-criterion (README line 69 and the `needs` of the same slug in `design/plan.json`) replace "for a `p`-adically complete `𝒪`-flat `𝒪`-algebra `R` topologically of finite type" by "for a `p`-adically complete `𝒪`-flat `𝒪`-algebra `R` that is topologically of finite type or complete Noetherian local with residue field `𝔽`", and "base change along continuous maps of such `R`" by "base change along continuous `𝒪`-algebra maps between such rings, in particular to the ring of integers of a finite extension of `E`".

   Tested on the refuting instance: `R_j = 𝒪⟦x₁,…,x₈⟧` and `R = ⊗̂_j R_j` are complete Noetherian local, `𝒪`-flat, with residue field `𝔽`, so they satisfy the repaired hypothesis of 2.1 and of the gap, and line 77 defines `Y^{[0,h],τ}(R)` for them; a finite flat local `𝒪`-algebra satisfies both alternatives, and the two definitions of `𝒪^rig_R` are the same formula. The README and the plan stay word for word equal on the gap after the same replacement in both.

Two findings, both P2, both in the README; `Suggested.lean`, `metadata.toml` and `sources.toml` need no change. The two findings of round 3 are repaired. Both new findings are hypotheses of Layers 1–2 that do not match the source or the rings Layer 5 applies them to; neither was touched by an earlier repair, and both sit in targets of this round's seeded sample (1.3, 2.1, 2.2).

## Round-3 findings

| Id | Status | Repaired passage (README line) |
| --- | --- | --- |
| F01 (P2), `gap:regular-local-factorial` asks for what PurityForFlatCohomology §7.4 states | repaired | line 19: "Factoriality of regular local rings in every dimension (Auslander–Buchsbaum): `PurityForFlatCohomology`, §7.4"; line 93: "§7.4 (`isRegularLocalRing_uniqueFactorizationMonoid`) …"; line 554: "`A` is a regular local ring by induction on `n` … hence factorial (`PurityForFlatCohomology` §7.4)"; the slug is gone from the README and from `design/plan.json` (9 gaps in both) |
| F02 (P3), GHLS17 hypothesis | repaired | line 79: "for `K/ℚ_p` unramified, `p ≠ n` and `r̄ : G_K → GL_n(𝔽̄_p)`"; the plan's `needs` carries the same words |

Pattern search: no other gap asks for something a roadmap, Mathlib or Tau Ceti states (searched by object, below); no other transcription of a cited hypothesis differs from its source among the statements read this round.

## Verified sound

**Principles.** Every statement keeps the full profile set `{(3,0),(2,1)}^f`, reducible and irreducible `ρ̄`, ramified `𝒪`. The base roadmap is imported by section, not re-planned. No copied passage, no algorithm, no sorried data, no `set_option`. Supply runs one way. The layers are named by their mathematics and their order is forced by the *Needs:* lines.

**Elaboration.** `lake env lean` on `packages/LocalGaloisDeformationRingsPartII/Suggested.lean`, run from the content checkout: one message, `47:8: warning: declaration uses 'sorry'`. The import header is `import Mathlib` alone, and no Tau Ceti module is used.

**Binder check.** `#check @crossing_prime` (the worker's elaborated signature and my own scratch file agree): `CommRing O`, `IsDomain O`, `IsDiscreteValuationRing O`, `IsAdicComplete (IsLocalRing.maximalIdeal O) O`, `Irreducible ϖ`, `0 < d`, a unit `u` of `MvPowerSeries (Fin (n + 2)) O`, conclusion `Prime (X 0 * X 1 + C (ϖ ^ d) * ↑u)`. This is README 5.3's first assertion at the same generality (`n + 2 ≥ 2` variables). Nothing changed.

**Padding probe** on the one sorried theorem, in a scratch copy: `simp` leaves the goal, `rfl` fails, `infer_instance` fails, `aesop` fails, `exact?` finds only the sibling probe copy; `UniqueFactorizationMonoid (MvPowerSeries (Fin (n + 2)) O)` is not found by instance search. Not padding.

**Headlines.** 6.1, 6.2, 6.3, 7.3, 7.5, 4.3, 3.6, 3.9 and 5.3. Only 5.3 is statable at the pins and it is stated; the module docstring names the others with the missing carriers (framed deformation rings and their potentially crystalline quotients, Serre weights and `σ(τ)`, étale `φ`-modules with their realization). The only backticked name of this roadmap's own in the README is `crossing_prime`, which the file declares; `roadmaps resolve` lists no name found nowhere.

**Pinned declarations**, each elaborated with `#check` in one scratch file: `TauCeti.PowerSeries.isRegularLocalRing` (`[IsRegularLocalRing R] → IsRegularLocalRing (PowerSeries R)`), `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` (needs `ringKrullDim R ≤ 2`), `MvPowerSeries.finSuccEquiv` (`MvPowerSeries (Fin (n + 1)) R ≃ₐ[R] PowerSeries (MvPowerSeries (Fin n) R)`), `MvPowerSeries.isEmptyEquiv`, `IsRegularLocalRing.of_ringEquiv`, `PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`, `IsLocalRing.notMem_maximalIdeal`, `Ideal.span_le`, `Ideal.minimalPrimes`, `Matrix.det_fin_two`, `Matrix.adjugate`, `Polynomial.derivative`, `Field.absoluteGaloisGroup`, `modularCyclotomicCharacter`, `LaurentSeries`, `TauCeti.inertiaTameCharacter`, `TauCeti.quotientWildInertiaSubgroupEquiv`. All 18 exist. The induction of 5.3's route compiles without `sorry`: `IsRegularLocalRing (MvPowerSeries (Fin n) O)` for every `n` over a regular local `O`, and `inferInstance : IsRegularLocalRing O` for a discrete valuation ring.

**Dependency check** (the brief's command):

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Suppliers resolved now** (heads of the index of 2026-11-11).

- LocalGaloisDeformationRings §§1.1, 1.2, 1.8, 3.1, 3.4, 3.5, 3.9, 3.10, 6.9, 6.28, 8.10 at its lines 1276, 1284, 1399, 2241, 2292, 2300, 2388, 2396, 3052, 3380, 3810. §6.9 is rank three, `r ∈ {1,2,3}`, with `𝒪_{ℰ,K,R}` and a contravariant `T*_dd`, as line 76 says.
- PadicLocalLanglandsForGL2Qp §§0.3, 0.4, 4.4 at 268, 292, 1473. §0.3 builds fundamental characters at every niveau from the Kummer character of a root of a uniformiser, with Teichmüller lift, norm compatibility, `ω₁^{e_K} = ω|_{I_K}` and the `q`-power conjugation; it has no Artin-map statement, so the gap is not redundant. §0.4 defines the framed functor for every profinite group, with tangent space `Z¹(ad ρ̄)`, and proves representability under `Φ_p`.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.1, .2, .5, .6, .24, .36, .39 at 5483, 5559, 5684, 5715, 6528, 7307, 7412; `kisinOpenDiscBounded` and `KisinModuleCoeff` are there; `T_A` is covariant.
- DeformationAndDerivedPatchingAlgebra §§1.8, 1.9, 1.11, 1.12, 1.13, 1.14, 4.6, 4.7, 6.8 at 213, 233, 262, 282, 305, 325, 991, 1006, 1327.
- PurityForFlatCohomology §7.4 at 2299, with `isRegularLocalRing_uniqueFactorizationMonoid`; merge order 221 against 353.
- ModpRepresentationsOfGL2OverLocalFields (a board package, merge order 264) §§3.1, 3.2, 3.4, 5.5 at 938, 963, 1008, 1373.
- LocalFieldsRamification "Layer 4: the tame quotient of the absolute Galois group" (1155) and ClassFieldTheory Layer 7 (1205), both on main.

**Gaps.** The nine gaps agree between `design/plan.json` and the README by slug, supplier and `needs` (compared by script); none has supplier `none`. Minimality, by object: the suppliers' texts contain no Hamann or power-invariance statement, no Kummer tower in LocalFieldsRamification, no GHLS17 statement in LocalGaloisDeformationRings, no Deligne–Lusztig reduction formula in ModpRepresentationsOfGL2OverLocalFields. The acceptance, once R01 and R02 are applied, is conditional on the nine gaps.

**Ownership and overlaps.** `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped id. "Cyclotomic free" occurs in no other roadmap (main, open heads, board packages), so 3.7–3.10 have one owner. `crossing_prime` is declared in no other `Suggested.lean`. The other packages that mention Auslander–Buchsbaum use the depth formula, not factoriality; §7.4 of PurityForFlatCohomology is the single owner. Neither pinned library contains the crossing statement.

**Sources, seeded sample**, each read at its locator in the cached text.

| Target | Locator checked | Result |
| --- | --- | --- |
| 0.3 | BHHMS23 lines 668–674 (p. 15): orientation, Remark 2.3.6, equation (13); `α′`, `a′` at 623–629 (p. 14) | matches |
| 0.4 | LLHL19 Proposition 2.2.16, lines 508–512 (p. 14); BHHMS23 Remark 2.3.5, lines 665–667 (p. 15); §4.1, lines 1143–1146 (p. 25) | matches; rank two gives `d − 1` for `d ≥ 2` |
| 1.3 | Proposition 3.1.5, lines 863–872 (p. 19); Definition 3.1.6, lines 875–877 (p. 20); line 859 | conditions match; hypothesis on `β̄` dropped (R01) |
| 2.1 | Proposition 3.1.7, lines 905–909 (p. 20); `𝒪^rig_R`, `λ`, `N_∇` at 878–901; LLHLM23 Proposition 7.1.3, line 4383 | matches for finite-type `R`; scope (R02) |
| 2.2 | Definition 3.1.8, lines 913–917 (p. 20) | matches |
| 3.2 | Lemma 3.2.3, lines 1025–1032 (p. 22) | matches |
| 3.4 | Definition 3.2.5, lines 1048–1052 (p. 22); LLHL19 Proposition 3.1.2, lines 596–599 (p. 16), tame restriction at 573–580 | matches |
| 3.6 | Proposition 3.2.7 and (19), lines 1075–1093 (p. 23) | matches; the README's coefficient extension is needed (Source issues) |
| 3.8 | Lemma 3.2.8, lines 1097–1103 (pp. 23–24); LLHLM18 Lemma 3.10 (line 1130, p. 29), Lemma 3.11 (1184, p. 30), Proposition 3.12 (1223, p. 31); LLHLM23 Lemma 7.2.10, lines 4806–4809 (p. 107) | matches |
| 4.1 | lines 1175–1190 (p. 25) | matches |
| 4.2 | Lemma 4.1.1, lines 1201–1215 (pp. 25–26) | matches |
| 5.7 | equation (22), lines 1415–1423 (p. 29); LLHLM18 Proposition 5.11 and Theorem 5.12, lines 2068–2074 (p. 53) | matches |
| 5.8 | lines 1517–1558 (p. 32), Lemma 4.2.4 at 1539–1554 | matches |
| 7.3 | Proposition 4.3.1, lines 1644–1897 (pp. 34–38) | matches: variables at 1704–1711, tangent bound at 1764–1766, `p ∈ I_{w̃} + I_{w̃′}` at 1872–1887, dimensions at 1890–1893 |
| 7.5 | Proposition 4.3.3, lines 1918–1954 (pp. 39–40) | matches |

Also read: Definitions 2.3.1, 2.3.3, 2.3.4 (pp. 14–15), Proposition 2.4.3 (lines 722–740, p. 16), Definition 3.1.1 and Remarks 3.1.2–3.1.3 (pp. 18–19), equation (16) and Proposition 3.1.9 (p. 21), Definitions 3.2.1, 3.2.4, Lemma 3.2.6, Corollary 3.2.9, Lemma 3.3.1 (pp. 22–24), Lemma 4.1.2 (pp. 26–27), Proposition 4.2.1 with its proof, equation (23), Lemma 4.2.3 and the Elkik step (pp. 28–33), Remark 4.2.5, Figure 2 (p. 38), Lemma 4.3.2 (p. 39); LLHLM18 Definition 3.8 and Proposition 3.9 (p. 29). All eight cited works are in `sources.toml`; the manifest has no local path. The author flagged no locator as unverified.

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 5.3 route (changed in round 4): regularity of `𝒪⟦x₁..x_n⟧` | `n = 0, 1, 2`; pins | dimensions `1, 2, 3` with `n + 1` generators of `𝔪`; the induction elaborates at the pin; Tau Ceti factoriality needs `dim ≤ 2`, so `n = 2` needs §7.4 | holds | none |
| 5.3 / `crossing_prime` | `d = 0`; `u = x₁` non-unit; root `b` in the proof; residue characteristic 2 | unit; `x₁(x₂ + ϖ^d)` reducible; `ϖ ∣ b` and `ϖ ∣ b + x₂` would give `ϖ ∣ x₂`, so `ϖ^d` divides one factor, then `g(b,…) = −c(ϖ^d c + x₂) ∈ 𝔪`; no division by 2 | hypotheses needed and present | none |
| 5.3 converse Check | `u₁ = 1`, `u₂ = 1 + x₁x₂` | difference `ϖ x₁x₂`; a prime `x₁x₂ + ϖ` dividing it would divide `ϖ`, `x₁` or `x₂` | ideals differ | none |
| gap:ghls-existence (changed) | `n = 2`; `n = 4, p = 2` | `p ≠ 2`; `≠` holds, an extended Fontaine–Laffaille weight forces `p > 4` | as source | none |
| 0.3 orientation | `f = 1`, `s = w`, `p = 5`, `μ = (1,0)` | `s′_or = (w, 1)`; `α′ = ((2,0),(0,2))`; `a′^(0) = (2,10)`, `a′^(1) = (10,2)`; `w(2,10) = (10,2)` dominant; (13): `w(2,0) = (0,2)` both sides, and at `j′ = 1`: `(0,2) = (0,2)` | holds | none |
| 0.4 | `N = 13`; `N = 1` | 12-deep; 0-deep, the definition | holds | none |
| 1.3 degree bounds | three shapes | `t^(2,1)`: `(1,2)` entry `≤ 0`, `(2,1)` entry `≤ 2`; `w t^(2,1)`: diagonal `≤ 1`, pivots `1` and `2`; `t^(1,2)`: `(2,1)` entry `≤ 1`, `(1,2)` entry `≤ 1`; all met by `A₁, A₂, A₃` | consistent with 5.2 | none |
| 1.3–1.4 existence | `R = 𝔽`, `β̄` not gauge | the only lift is `β̄`; eigenbases move by Iwahori elements, gauge bases by `T(𝔽)^f` | fails | R01 |
| 2.1 Frobenius rule | `u′e` in the trivial module | `−p(u′)^p λ` and `−E(u′)^p φ(λ)`, equal by `λ = (E/p)φ(λ)`; supplier's factor `p/E(0) = 1` for `E = v + p` | holds | none |
| 2.1–2.3 domain | `R_j = 𝒪⟦x₁..x₈⟧` | `R_j/ϖ = 𝔽⟦x⟧`, uncountable dimension, not finitely generated | outside the stated hypothesis | R02 |
| 2.2 | `h = 1`; `h = 3` | no condition; value and first derivative | holds | none |
| 3.1 / 3.2 | `f = 1`, `s = w`: `μ = (1,0)`, `(3,1)` at `p = 5`, `(a,a)`; `f = 2`, `p = 3`, `δ = (2,−1)` | exponents `1, p`; `8 ≡ 2` mod 6; `(p+1)a`; `|2 − 3| = 1 < 9` | holds; wall excluded | none |
| 3.6 | `s′ = w`, `μ′ = (a,a)` (not good); `s′ = 1`, `μ′ = (a,a)`; niveau two | the family gives only `ω^a ⊗ (nr(γ) ⊕ nr(−γ))`; an unramified representation irreducible over `𝔽` splits only over the quadratic extension; a twist by `nr(α)`, `α² ∈ 𝔽`, is `D ↦ (α²d₁, d₂)` | goodness and the coefficient extension are needed and present | none |
| 3.7 | digits `δ_i ∓ 1`; `ω ⊕ 1`; `p = 7`, `ω³ ⊕ 1` | absolute values in `[2, p − 2]`, sum nonzero and `< p^{f′} − 1`; presentations `(1,0)` and `(p−1,1)` only, coordinates `1` and `p − 2`, 1-generic and not 2-generic; `ω³` of order 2 | holds; depth 2 sharp | none |
| 3.8 | `ρ₁ = ρ₂ = 1`; `W = ω`; `W = 𝔽`, `p = 2` | `𝔽` on both sides; Kummer cocycle of `−p` nonzero on `G_K`, zero on `G_{K∞}`; `ℚ₂(√−2)/ℚ₂` Galois, and `ω` trivial, so not cyclotomic free | holds; hypothesis needed | none |
| 4.1 depth | `μ(τ)_j + η = (r_j, 0)` or `(r_j+1, −1)` | coordinate `r_j` or `r_j + 2`, in `(N − 1, p − N + 1)` | `(N−1)`-deep | none |
| 4.1 types at `f = 1`, `s = 1` | `U₁, U₂, U₃` | `ω̃^r ⊕ 1`; niveau two with exponent `r + 1 − p`; `ω̃^{r+1} ⊕ ω̃^{−1}` | pairwise distinct | none |
| 4.2 | `N ≥ 12` | coordinate `≥ 12 > 3` and `≤ p − 11 < p − 4`; `D w̃` monomial, hence gauge | holds | R01 adds the clause |
| 5.2 constants | `−⟨(ws^{−1}μ − ν)_j, α^∨⟩` for the three shapes, `s = 1, w` | `−r`, `r+2`; `r+2`, `−r`; `−r−2`, `r`; `a₂ ± 1`, `a₂ − 2`, `a₃ − 1` nonzero mod `p` for `12 ≤ r ≤ p − 14` | units | none |
| 5.4 identity | 2000 random rational `(x, y, p, κ)`, my own run | both sides equal `p³(κ−1)²` exactly | holds | none |
| 5.5 | `N = 12` | `n = 7 > 6`; `p³(1 − p^{n−3}x)` with a unit bracket; correction in `p⁴` | holds | none |
| 5.7 | `f = 1`; general | `8 − 5 = 3`, `3 + 4 − 2 = 5 = 4 + f`; `3f + 4 − 2f = f + 4` | holds | none |
| 5.8 | `ψ(X_i) = X_i + p^{N−8}ε_i`, `N = 9` | identity on `𝔪/(𝔪² + ϖ)` | automorphism | none |
| 6.3 | `m ≤ f` | `2m ≤ f + 4 + m`; dimension `f + 4` | well formed | none |
| 7.3, `p ∈ I_{w̃} + I_{w̃′}` | Table 4, `U₁` against `U₂` | transported `G₁`: `c₁₂ − p d₁₂* + (a₁−2)d₁₁d₂₂/d₂₁*`; difference `p(a₂−1)d₁₂* + (a₁+a₂−2)d₁₁d₂₂/d₂₁*`; `a₁ + a₂ ≡ 2`, `a₂ − 1 ≡ ±(r+1)` | holds | none |
| 7.3 tangent bound | `r_j + 1 < p − 12` | `r_j + 3 < p − 10 < p − 1` | holds | none |
| 7.5 | elimination | `(a₂−1)d₂₁* · 2p/(a₂(a₂−1)) = (2p/a₂)d₂₁*`; `(a₂−2)(a₂+1) = a₂(a₂−1) − 2`; unit bracket for `N ≥ 10` | holds | none |
| 6.1, 6.2 | source lines 1319–1333, 1555–1565 | index `λ_{f−1−j}`; `2^f` components | matches | none |

For the Tables 1–5 transcriptions of 5.2, 7.1 and 7.4 I recomputed what the body text of the source determines (the constants, `G₁` of chart 1 after transport, `G₁`, `G₂` and `G₅` of chart 2, the two substitution rows of Figure 2, the four ideals of Lemma 4.3.2) and relied on round 3's computed rows for the rest.

**Shape and style.** Every definition has its API and at least three Checks; every theorem has hypotheses and a locator; every layer ends with Examples and Dependencies. No LaTeX delimiter, pull-request number, date, machine path, HTML anchor or process word in the README; `theorem` only, no `#eval`, no `set_option` in the Lean file.

**Remark for the maintainer (no change here).** HilbertModularVarietiesAndShimuraCurvesPartII cites this roadmap by `T.0`, `T.6–T.7` (its lines 14, 396, 427) and declares on it the gaps `tame-types`, `single-type-rings`, `breuil-mezard-pbt`, which lie outside this roadmap's scope. That is a point for its own review.

## Not verifiable

- Kisin06, Corollary 1.3.15: recorded `uncertified`; it is cited behind BHHMS23 Proposition 3.1.7, which states the result used.
- LLHLM18, LLHL19 and LLHLM23 were read in their arXiv versions; their numbering was not compared with the published versions beyond BHHMS23's own citations.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-11 and in the board's packages; nothing newer was looked at.

## Source issues

- **Gap** in BHHMS23 at Proposition 3.2.7, printed page 23: the proof splits every semisimple representation with the given inertia into pieces matching the orbits; it should assume the residue field large enough, since two equal inertial characters allow a non-split irreducible; affects a stated result.
- **Gap** in BHHMS23 at the proof of Proposition 4.2.1, printed pages 28–29: Proposition 3.1.9 is applied to a complete local ring, though stated for algebras topologically of finite type; it should state the complete local case or reduce to it; affects the proof.
- **Misprint** in BHHMS23 at Remark 2.3.5, printed page 15: the remark refers to the cited paper's Proposition 2.2.16 for the loss of one unit of depth of a generic type; it should refer to Proposition 2.2.15, which states exactly that; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "84e56c7be87a843000047691f4030e28e9d70c25", "job": "REV-PKG-LocalGaloisDeformationRingsPartII~4", "model": "fable", "worker": "chris-x17"} -->
