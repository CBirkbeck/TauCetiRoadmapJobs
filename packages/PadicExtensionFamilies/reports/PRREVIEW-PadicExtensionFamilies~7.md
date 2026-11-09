# Review of PadicExtensionFamilies (pull request #1713 at 5e8f0af)

**Verdict:** needs changes

Incremental re-review of 110 changed lines since `f85522c` (51 insertions, 59 deletions: 104 in `README.md`, 6 in `Suggested.lean`). The change moves the non-Galois Herbrand function to RamificationOfCompleteDiscretelyValuedFields §4a.2, deletes §2.0, and repoints `cyclotomicInvariants` to the spectral-norm adapters. The merge from main in this range also moved the pins: Tau Ceti `358314d` → `2fd255d`, Mathlib `f6090c7` → `1b1ccf4`, Lean `v4.35.0-rc3` → `v4.36.0-rc2`. The new Tau Ceti pin ships a Newton-polygon library, so some text that was right at the old pin is now wrong. R01–R03 come from that; R04 is in the new supplier text.

## R01 (P2) — The slope-polygon headline can be stated at the new pin but is missing, and the docstring says it cannot be stated

- **Location.** `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean:21–23`: "The polygon-to-break and slope-polygon theorems cannot be stated at the pins: the native Newton polygon and its slope multiset are missing." Also `Suggested.lean:113` (`IsPolygonSegment`): "so that it needs no polygon API".
- **Claim.** These carriers are now pinned. The slope-polygon theorem (README 2.4) and the Newton-slope form of the ramification-polygon statements (1.2, 2.5) can be stated at the pins, and `Suggested.lean` states neither.
- **Witness.** Tau Ceti `2fd255d` has:
  - `Polynomial.newtonPolygon` (`TauCeti/NumberTheory/NewtonPolygon/Basic.lean:218`);
  - `Polynomial.newtonSlopes` (`NewtonPolygon/Slopes.lean:110`);
  - `TauCeti.lowerConvexEnvelope` (`TauCeti/Analysis/Convex/Sequence/Envelope.lean:159`).

  None of them existed at `358314d`. A scratch copy of `Suggested.lean` elaborates with no errors and 14 `sorry` warnings. It defines `slopePolygon := TauCeti.lowerConvexEnvelope (slopePoints K L)`, states 2.4's slope `u + 1` between consecutive break vertices, and defines `intRealAddVal` (Mathlib's `addVal` mapped to `WithTop ℝ`) feeding `newtonSlopes`.
- **Repair.**
  - State 2.4 over `TauCeti.lowerConvexEnvelope` and `embeddingOrbitCount`: the slopes `> 1` of `slopePolygon K L`, with their `log_p` multiplicities, are the Artin slopes; or state it in vertex-and-slope form.
  - State the 1.2/2.5 ramification-polygon statement through `Polynomial.newtonSlopes` of the ramification polynomial over `𝒪[L]`, with a real additive valuation built from `IsDiscreteValuationRing.addVal`.
  - In the module docstring, name only the carriers that are still missing.
  - Restate `IsPolygonSegment` and `residualPolynomial_additive` through the faces of `Polynomial.newtonPolygon`, or delete the "needs no polygon API" rationale.
  - Give each new Lean name its README API bullet.

  Tested on `ℚ_2(∜2)`, whose orbit counts are `1, 2, 4` on `(0,2]`, `(2,3]`, `(3,∞)`. The probe statement gives `P(2) = P(1) + 3·1 = 3 = c(ℚ_2(√2))` and `P(4) = 3 + 4·2 = 11 = c(L)`, matching the 2.4 Check points `(1,0), (2,3), (4,11)`.

## R02 (P3) — The Newton-polygon contract cites a roadmap for declarations now pinned in Tau Ceti

- **Location.** `README.md:116–121` and `README.md:365`: "`lowerConvexEnvelope` (§0.1), `ConvexPolygon.FiniteSlopeData` (§0.6), `Polynomial.newtonPolygon` (§2.1); the finite slope multiset and its product law (§3.2), the root-valuation identification (§3.3) and the denominator theorems … are cited by section". The same citations appear in the §1.2 *Needs:* (`README.md:574`) and the 2.4 *Needs:* (`README.md:856`).
- **Claim.** Anything that exists at the pins should be cited by its pinned name and file. The name `ConvexPolygon.FiniteSlopeData` also differs from the pinned one.
- **Witness.** At Tau Ceti `2fd255d`:
  - `TauCeti.lowerConvexEnvelope` (`Analysis/Convex/Sequence/Envelope.lean:159`);
  - `TauCeti.FiniteSlopeData` (`Analysis/Convex/Sequence/SlopeData/Basic.lean:69`);
  - `Polynomial.newtonPolygon_mul` (`NewtonPolygon/Mul.lean:282`);
  - `Polynomial.newtonSlopes_eq_map_roots_map` (`NewtonPolygon/Roots.lean:123`);
  - `Polynomial.den_dvd_card_newtonSlopes` (`NewtonPolygon/Slopes.lean:274`);
  - `Polynomial.den_dvd_of_forall_mem_newtonSlopes_eq` (`NewtonPolygon/Ramification.lean:68`).
- **Repair.**
  - List these under "From Tau Ceti at the pin" with these names and files.
  - Replace `ConvexPolygon.FiniteSlopeData` with `TauCeti.FiniteSlopeData`.
  - Keep NewtonPolygons section citations only for items not at the pin.
  - Update the §1.2 and 2.4 *Needs:* lines to match.

  Tested: Convention 4's orientation (slope `m` ↔ root valuation `−m`) is the one stated in the `NewtonPolygon/Basic.lean` docstring, so the repointing changes no sign.

## R03 (P3) — The Hasse–Arf locator broke with the pin, and the abelian theorem is now pinned

- **Location.** `README.md:359`: "(`Herbrand/HasseArf.lean`; the abelian theorem is Local fields and ramification Layer 3 *Hasse–Arf*, specified there as the abelian theorem)". `README.md:766`: "(Hasse–Arf, Local fields and ramification Layer 3)".
- **Claim.** The file no longer exists at the pin, and the abelian theorem now has a pinned declaration.
- **Witness.**
  - At `358314d` the two prime-degree theorems were in `Herbrand/HasseArf.lean` (lines 48, 137).
  - At `2fd255d` that path is a directory, and they sit at `Herbrand/HasseArf/PrimeDegree.lean:48, 137`.
  - `TauCeti.LocalFieldsRamification.hasseArf` is at `Herbrand/HasseArf/Abelian.lean:50`: with `[IsAbelianGalois K L]`, `UpperJump K L w → ∃ z : ℤ, (w : ℝ) = z`.
- **Repair.**
  - In row 359, write `Herbrand/HasseArf/PrimeDegree.lean`.
  - Add `hasseArf` (`Herbrand/HasseArf/Abelian.lean`) to that row.
  - In 2.2, cite Tau Ceti `hasseArf` in the sentence at line 766 and in its *Needs:* line.

  Tested: for `ℚ_2(ζ_8)` (abelian), 2.2's Check gives Artin slopes `2, 3`, so Swan slopes `1, 2`, which are integers, as `hasseArf` asserts.

## R04 (P3) — The new supplier text calls `ψ_{L/K}` the Herbrand function, the reverse of Tau Ceti's naming

- **Location.**
  - `README.md:721–722`: "`ψ_{L/K} = φ_{M/L} ∘ ψ_{M/K}` on `[−1, ∞)` is the Herbrand function of the separable extension `L/K` and `φ_{L/K}` its inverse".
  - `README.md:280–285`: "the Herbrand function `ψ_{L/K}` … and its inverse `φ_{L/K}` … agreement with Tau Ceti's `herbrand` and `inverseHerbrand`".
- **Claim.** The pairing reverses Tau Ceti's convention, which is also Serre's and the README's own at line 891. A reader matching the names in order maps `ψ` to `herbrand`.
- **Witness.**
  - Tau Ceti `TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean:257–263`: `herbrand` is "the Herbrand function `φ_{L/K}`", and `inverseHerbrand` is `ψ_{L/K}`.
  - `README.md:891` calls `φ_{L/K}` the LMFDB's Herbrand function.
  - For `ℚ_7(∛7)` (Galois, tame, `e = 3`): `herbrand` at `3` is `1`, while `ψ_{L/K}(3) = 9`.
- **Repair.**
  - At 721–722: "… is the inverse Herbrand function of `L/K`, and its inverse `φ_{L/K}` is the Herbrand function (Tau Ceti's `inverseHerbrand K L` and `herbrand K L` when `L/K` is Galois)".
  - At 280–285: "the inverse Herbrand function `ψ_{L/K}` … and the Herbrand function `φ_{L/K}` …, agreeing with Tau Ceti's `inverseHerbrand` and `herbrand` respectively".

  Tested on `ℚ_7(∛7)`: `φ_{L/K}(3) = 3·(1/3) = 1`, which is `herbrand`'s value; `ψ_{L/K}(3) = 9`, which is `inverseHerbrand`'s.

## Previous findings

- None to account for. The previous report (r6, at `f85522c`) raised no finding. The item it closed from r5 still holds: Conventions items 12 and 13 are in order at `README.md:239` and `:243`, and `README.md:1128` still cites item 12 for `e_L`.

## Verified sound

### The changed passages (all 51 added lines read)

- **§2.0 deleted, notation moved into the Layer 2 preamble (`README.md:718–724`).**
  - No reference to §2.0 remains: grepping `2.0` in the README and in `Suggested.lean` finds nothing.
  - No roadmap cites PadicExtensionFamilies §2.0. `roadmaps grep PadicExtensionFamilies` finds only ArtinRepresentations (2.7), FiniteGroupInvariants, EtaleMassFormula (Scope and Layer 1) and RamificationOfCompleteDiscretelyValuedFields (Downstream consumers).
  - 2.1–2.7 keep their numbers.
- **Every `§2.0` replaced by `RamificationOfCompleteDiscretelyValuedFields §4a.2`:**
  - Scope (`README.md:52–53`, `81–82`);
  - suppliers (`278–285`) and the contract row (`367`);
  - How to read the build (`371–377`);
  - 2.1, 2.2, the 2.2 *Needs:*, 2.4, 2.5 and its *Needs:*;
  - Layer 2 Dependencies (`968`);
  - 6.4 *Needs:* (`1558–1559`), 6.5 *Needs:* (`1642`);
  - Dependency order (`2051`).
- **2.3 corollary (`README.md:811–818`).** The new justification `f ψ_{L/K}'(u) = [G : G^u H]` a.e. on `(−1, ∞)` splits the range correctly:
  - for `u > 0` it is the derivative of §4a.2's integral formula at continuity points;
  - on `(−1, 0)`, `ψ' = 1` and `[G : G_0 H] = f` (2.1).

  The *Needs:* line gains 2.1 and §4a.2. Values are in the table below.
- **Policy.** The added lines contain no process words, pull-request numbers, LaTeX or machine paths (scanned with a grep over the diff).

### Supplier RamificationOfCompleteDiscretelyValuedFields (new roadmap folder, open at `c948d04`, read with `roadmaps show`)

- **§4a.2** (its `README.md:909–1005`) states every input this roadmap takes:
  - the definition `ψ_(L/K) = φ_(M/L) ∘ ψ_(M/K)`;
  - independence of `M`, and agreement with 3a.2 in the Galois case;
  - continuity and the identity on `[−1, 0]`;
  - the tower law `ψ_(N/K) = ψ_(N/L) ∘ ψ_(L/K)`;
  - the finite-level subgroup identity;
  - the integral formula for `u ≥ 0`, with `f = f(L/K)`.
- **Declaration.** `TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields.subgroupOf_upperRamificationGroup` is in its `Suggested.lean:264`: `(upperRamificationGroup G S u).subgroupOf H = upperRamificationGroup H S (herbrandFun H S (inverseHerbrandFun G S u))`, the identity cited.
- **Agreement.** §3a.2's agreement names `TauCeti.LocalFieldsRamification.herbrand`, `inverseHerbrand`, `psiNat` and `upperRamificationGroup`. All are at the pin (`Herbrand/Basic.lean:258, 262`).
- **Ownership.**
  - Its Scope (lines 116–121) claims the non-Galois `ψ_(L/K)` on local fields and asks consumers to cite §4a.2.
  - Its Downstream consumers (line 1144) names PadicExtensionFamilies for §4a.2.
  - It has no *Needs:* on this roadmap, so there is no cycle.
  - A search of main and every open roadmap pull request (`roadmaps grep` for "non-Galois Herbrand" and "not necessarily Galois") finds no second owner.
- **Merge order.** It is line 2 of the merge order; this roadmap is line 396. The pull-request description names it under "Depends on".

### Gate, dependency check, elaboration

- **Gate.** My run of the full gate on this head:

```text
gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

  The worker's gate (with `build=0`) also passed.
- **Dependency check** (`--movable`, content main `8d9e0a0`): `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean` exits 0 with exactly 13 warnings, all `declaration uses sorry`.
- **Binder audit.** A scratch copy with `#check @` for all 39 declarations elaborates. The 39 types equal the worker's `signatures.md` up to binder-type printing.
  - `cyclotomicInvariants` keeps its type `(K) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] → ℕ → ℕ → ℕ × ℕ`.
  - The six binder-loss leads are the defs r4 judged benign; their theorems carry the binders.
- **Adapters.** These exist at the pin with the hypotheses a splitting field meets (`[Algebra.IsAlgebraic K M]`, `[Module.Finite K M]`):
  - `algebraicExtensionValuativeRel` (`AlgebraicExtension/Basic.lean:130`);
  - `algebraicExtensionNormedFieldTopology` (`:86`);
  - `algebraicExtension_valuativeExtension` (`:147`);
  - `finiteExtension_isNonarchimedeanLocalField` (`FiniteExtension/Basic.lean:54`, stated for exactly those two structures);
  - `finiteIntermediateField_valuativeExtension` (`FiniteExtension/IntermediateField.lean:81`).
- **Pin sweep.** Every backticked Lean-like name in the README (299 tokens) was matched against declarations at the new pins. What did not match:
  - math notation;
  - LMFDB knowl ids (the 20 `citations.md` leads, all written after "knowl");
  - roadmap contract names: MassFormula's names (pinned by r4) and the RCDVF declaration above;
  - `lowerRamificationGroup_one` (remark below).

  Every file locator was checked; only `Herbrand/HasseArf.lean` (R03) broke. The others are planned module paths (`README.md:29–33`) or exist.
- **Headlines** (step 7):
  - Stated:
    - root-difference invariance (`conjugateBreaks_eq_of_irreducible`, `card_filter_conjugateBreaks_eq_zero`);
    - `residualPolynomial_additive`;
    - `discriminantExponent_eq_integral`;
    - inseparability invariance;
    - Miki;
    - `ore_realizability`;
    - `krasner_refined_count`;
    - `monge_class_count`;
    - `mass_completeness`;
    - the GRD product formula.
  - Not stated:
    - polygon-to-break, slope polygon (R01);
    - slope dictionary;
    - Galois slope content;
    - jump-set classification;
    - family polynomial and family mass.
  - The one-tactic probe from r4 stands: the theorems' text is unchanged.

### Adversarial table: fresh rows for the changed statements

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Layer 2 preamble: `ψ_{L/K} = φ_{M/L} ∘ ψ_{M/K}` | `ℚ_2(∜2)`, `D_4`-closure, `#G_t = 8,8,4,4,2,2,2,2,1`, `H` a reflection with `H_t = H` for `t ≤ 1` and `1` for `t ≥ 2` | `φ_{M/K}(1,3,7) = 1, 2, 3`; `φ_{M/L}(3) = 1 + 2/2 = 2`, `φ_{M/L}(7) = 1 + 6/2 = 4`; so `ψ_{L/K}(2) = 2`, `ψ_{L/K}(3) = 4` | pass |
| Same, through the tower law | `ℚ_2 ⊂ ℚ_2(√2) ⊂ ℚ_2(∜2)` | `ψ_{E/K} = u` on `[0,2]`, then `2u − 2`; `ψ_{L/E} = u` on `[0,4]`, then `2u − 4`; composite at `2, 3` is `2, 4` | pass |
| 2.1: count beyond the last break, divided by `f`, is `e` | `ℚ_2(∜2)`; unramified quadratic; `ℚ_3(∛3)` | `4/1 = 4 = e`; `2/2 = 1 = e`; `3/1 = 3 = e` | pass |
| 2.2: lower break `t` ⇔ upper break `φ_{L/K}(t)` | `ℚ_2(∜2)` | lower breaks `2, 4`; `φ_{L/K}(2) = 2`, `φ_{L/K}(4) = 3`; upper breaks `2, 3` | pass |
| 2.3 corollary: `f ψ' = [G : G^u H]` a.e. | identity; unramified quadratic; `ℚ_5(∛5)` (`G = S_3`); `ℚ_2(i)`; `ℚ_2(∜2)`; `ℚ_3(∛3)` | on `(−1,0)`: `1 = 1`, `2 = 2`, `1 = [S_3 : C_3 H] = 1`; for `u > 0`, `ℚ_5(∛5)`: `3 = [S_3 : H] = 3`. `c = f∫(e − ψ')` gives `0, 0, 2, 2, 3·3 + 2·1 = 11, 2 + 2·(3/2) = 5`; discriminants `0, 0, 2, v_2(−4) = 2, v_2(2^11) = 11, v_3(3^5) = 5` | pass |
| 2.4: tower law in the denominator theorem | `ℚ_2(∜2)`, runs of length `d = 1` | composite `ψ` as above; `(2 − 1)·r_k ∈ ℕ` for rams `2, 4` | pass |
| 2.5: ram `φ_{M/L}(t) = ψ_{L/K}(φ_{M/K}(t))` | `t = 3, 7` | `ψ_{L/K}(2) = 2 = φ_{M/L}(3)`; `ψ_{L/K}(3) = 4 = φ_{M/L}(7)` | pass |
| §4a.2 subgroup identity, as consumed | `D_4` example, `u = 1, 2` | `u = 1`: `G^1 ∩ H = H`, `H^{ψ_{L/K}(1)} = H_1 = H`; `u = 2`: `G^2 = G_3` (order 4, `H ⊄`), `∩ H = 1`, `H^{2} = H_{ψ_H(2)} = H_3 = 1` | pass |
| `cyclotomicInvariants` (new body) | `ℚ_2`, `p = 2`, `i = 0, 1, 2`; `ℚ_3`, `i = 1`; `ℚ_2`, `p = 3`, `i = 1`; `𝔽_2((t))`, `p = 2` | `(1,1)`, `(1,1)` (`−1 ∈ ℚ_2`), `(2,1)` (`ℚ_2(i)`); `(2,1)`; `(1,2)` (`ℚ_2(ζ_3)` unramified); `(1,1)` (`(X−1)^{2^i}` splits) | pass; type unchanged |
| R01 probe: 2.4 at the new pin | `ℚ_2(∜2)`, counts `1, 2, 4` | `P(2) = 0 + 3·1 = 3`, `P(4) = 3 + 4·2 = 11`; elaborates | statable (R01) |
| R04 naming | `ℚ_7(∛7)` | `herbrand(3) = 1`, `ψ(3) = 9` | fails (R04) |

### Rows carried from r6, for the statements the diff leaves untouched

Each row is as r6 recorded it (most of them carried from r4 and r5). The r6 row for §2.0 is replaced by the Layer 2 preamble rows above.

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions 12, 13 order | positions vs numbers | `12, 13`; `i_0 = 2` for `X² + 2^m u X + 2`, `m ≥ 2` | pass, r6 |
| Convention 13 left action | `σ, τ ∈ Gal(K_f/K)` | `σ·(τ·[L]) = (στ)·[L]` | pass, r6 |
| EtaleMassFormula §1.2 weighted identity | `ℚ_2(ζ_12)`, `ℚ_2(∜−3)` over `ℚ_4` | `w/4`; `w/2` | pass, r6 |
| §1.2 automorphisms, inseparable member | `𝔽_2((t))(√t)` | `1 = 1·1` | pass, r6 |
| Layer 0 Examples | `ℚ_4`, `n = 2` | `16`, `15`, `10 = N_2(2,2)` | pass, r6 |
| §6.3 class–orbit bijection | `ℚ_2`, `f = e = 2`; `f = 1` | `14`, `10`; singletons | pass, r6 |
| §6.4 Check `ℚ_4` | `j = 1, 2` | `6, 8`; mass `1`; Serre `2` | pass, r6 |
| §6.5 reduced polynomials | `[1]` over `ℚ_4` | `1`; `2` | pass, r6 |
| §6.7 Monge count | `ℚ_2 (2,2)`; `ℚ_4 (2,1)`; `ℚ_2 (2,1)` | `10`; `14`; `6` | pass, r6 |
| §0.1 tame/wild split | `ℚ_2(∜2)` tower; tame cubic | `w = 2`, `ε = 1`; `e = 3` | pass, r6 |
| §0.3 height, mean | `ℚ_2(i)`, `ℚ_2(√2)`, tame cubic, unramified | `(1,1/2), (2,1), (0,0), (0,0)` | pass, r6 |
| §0.4 square class | `(1,√2)`, `(1,2√2)` | `8`, `32` | pass, r6 |
| §0.5 tame Galois criterion | `ℚ_5(∛5)`, `ℚ_7(∛7)` | `#Aut = 1`, `3` | pass, r6 |
| §1.1 coefficients | `X⁴−2`; `X⁴+2X³+2`; `X⁴+2X³+2X²+2` | `(8,4,8,0)`; `(3,3,3,0)`; `(3,2,3,0)` | pass, r6 |
| §1.2 rams | `X⁴−2`; `X⁴−4X²+2` | rams `(2,4)`, Swan `[2,3]`, `c = 11` | pass, r6 |
| §1.2 slope count | degree 1; tame cubic; `X⁴+2X+2` | `0`; `2`; `−1/3` | pass, r6 |
| §1.3 residual polynomials | two quartics | `z³+1`, `z³+z+1` | pass, r6 |
| §1.3 additivity needs positive slope | tame cubic over `ℚ_5` | not additive | pass, r6 |
| §1.4 scaling orbit | `α⁴ = 2`, `δ³ = 1` | `(z²+δ², δ²z+δ)` | pass, r6 |
| §1.5 unramified transport | `ℚ_2(ζ_3)` | `{−1}`, `{0}`, both empty over `L^{ur}` | pass, r6 |
| §2.1 orbit count | `ℚ_2(∜2)`; `S_3`, `H = C_2` | `1,1,2,4`; `1` then `3` | pass, r6 |
| §2.2 breaks, `card = w` | `ℚ_2(∜2)`; `ℚ_2(ζ_8)`; tame cubic | `2, 3`; `2, 3`; `0` | pass, r6 |
| §2.3 integral | four cases | `c = 0, 0, 2, 11` | pass, r6 |
| §2.4 slope polygon | three cases | slopes `3,4`; `1`; `0` | pass, r6 |
| §2.5 non-normal sum | `σ = r²`, `r` in `D_4` | `10 = 8+2`; `6 = 4+2` | pass, r6 |
| §2.6 identities | `ζ_8` | `m = (1/2, 5/4)`, `c = 8` | pass, r6 |
| §2.7 top slope | four cases | `0, 0, 1, 4` | pass, r6 |
| §3.1 slope content degrees | `D_4, S_4, S_3, []^2` | `8, 24, 6, 2` | pass, r6 |
| §3.2 hidden slopes | three cases | `[2]`; `[3]`; `[]` | pass, r6 |
| §3.3 Galois mean slope | four contents | `3`; `7/6`; `2/3`; `0` | pass, r6 |
| §3.4 normalizer | `S_3`; `C_2²` | `1`, `4` | pass, r6 |
| §3.5 splitting models | `x³−5`, `x³−7` | `(6,6)`; `(3,6)` | pass, r6 |
| §3.6 prefix | `ℚ_2(√2)`; identity | `2.1.2.3`; `2.1.1.0` | pass, r6 |
| §4.1 indices | three polynomials | `(8,4,0)`; `(2,0)`; `(2m−1,0)`, `(∞,0)` | pass, r6 |
| §4.2 Miki, jump sets | `ℚ_2(√2)`; `p = 2, e = 2` | `l = 1`; `T = {1,3}` | pass, r6 |
| §5.1 Ore | `ℚ_2, n = 4`; `n = 1`; `𝔽_2((t))` | `{1,3,5,6,7,8}`; `0`; odd `j` | pass, r6 |
| §5.2 boxes | `ℚ_2, n = 2` | `1/16`, `1/16`; `1/8` | pass, r6 |
| §5.3 Krasner | `ℚ_2, n = 2`; `ℚ_3, n = 3`; `𝔽_2((t))` | `2, 4`; `6, 6, 9`; `2^m` | pass, r6 |
| `krasnerCount` | `n = 1, j = 0` | `1` | pass, r6 |
| §5.4 totals | `ℚ_2`; `𝔽_2((t))`; `𝔽_3((t))` | `6`; `∞`; `2` | pass, r6 |
| §6.2 compatibility | `ℚ_2, e = 2` | `[3]` rejected | pass, r6 |
| §6.4 point types, interval counts | nine band tests | `1, 2, 2, 4, 0, 1, 0, 1, 1` | pass, r6 |
| §6.5 Serre comparison | `ℚ_2, e = 2`; `𝔽_2((t))` | `1`; `1 − 2^{−M}` | pass, r6 |
| §6.6 packets | two pairs | `D_4` vs `C_4`; residual sets differ | pass, r6 |
| §6.7 Lean transcription | `mongeSigma`, `mongeDelta`, `mongeCount` | (6), (7), Theorem 1 | pass, r6 |
| §6.8 completeness | `n = 1`; `𝔽_3((t))` | `1`; `2/4 + 4/8 = 1` | pass, r6 |
| `totallyRamifiedHeight`, `mass_completeness` | member; duplicates | `c + 1 − n ≥ 0`; `hpair` needed | pass, r6 |
| §7.1–7.3 GRD | `ℚ`; `ℚ(√5)`; `ℚ(∜2)`; `ℚ(ζ_5)` | `1`; `√5`; `8`; `5^{3/4}` | pass, r6 |
| Boundary Eisenstein checks | three quadratics | yes, no, no | pass, r6 |

### Source sample

- The diff touches three sampled targets: 2.1, 6.5 and 6.7.
  - In 2.1, the changed sentence moves the integral formula to RamificationOfCompleteDiscretelyValuedFields §4a.2; its own locator (Serre, IV §3, Prop. 15) is unchanged.
  - In 6.5 and 6.7, only the *Needs:* lines changed; they contain no source locators.
- The only locator text the diff changes is "Deligne, loc. cit., A.6.2" → "Deligne, Appendix §A.6, Prop. A.6.2", which spells out the reference that §2.0 used to carry.
- No source text was opened this round. The other sampled targets (0.1, 0.5, 1.1, 1.3, 2.6, 2.7, 3.2, 3.3, 5.2, 5.3, 6.6, 7.1) are untouched; their checks carry from r3–r5.

### Remarks on untouched text (no change requested)

- The ASCII diagram at `README.md:2041–2047` does not draw RamificationOfCompleteDiscretelyValuedFields into Layer 2. The paragraph under it names it, and the diagram also omits EtaleMassFormula and ClassFieldTheory.
- `README.md:758` cites `lowerRamificationGroup_one`, which is not a declaration at either pin. `upperRamificationGroup_le_lowerRamificationGroup_one` (`Herbrand/PPrimary.lean:63`) states `G^u ≤ G_1` for `u > 0`.
- Row `README.md:358` places `RamificationIndexDomain` under `Herbrand/`; at both pins it is in `RamificationGroup.lean:84/86`.
- The References entry for Deligne still lists Prop. A.6.1, which no target cites now.
- `README.md:888` uses "Herbrand function" for `ψ_{L/K}` as well. Reading `ψ` off the polygon reads `φ` too, so it can stay once R04 fixes the definitions.

## Not verifiable

- These are carried from r4–r6, and their passages are unchanged:
  - the LMFDB knowls behind the CAPTCHA (`lf.family_ambiguity`, `lf.family_invariants`, `lf.family_mass`, `lf.family_polynomial`, `lf.galois_splitting_model`, `lf.heights`, `lf.jump_set`, `lf.means`, `lf.packet`, `lf.rams`, `lf.subfamily`, `lf.top_slope`, `nf.galois_root_discriminant`);
  - Deligne's Appendix A.6, now cited as Prop. A.6.2 at 2.5 (not obtained from a legal source);
  - Serre's *Local Fields*, Krasner 1966, Serre 1978, Ore 1928, Fried 1974 (paywalled or not obtained);
  - Jones–Roberts, Pagano and Heiermann, compared only in preprint numbering.
- Serre, *Sur les corps locaux à corps résiduel algébriquement clos*, n° 3.1, Prop. 4 is RamificationOfCompleteDiscretelyValuedFields' locator for §4a.2, not this roadmap's. I did not open it.

## Source issues

- none
