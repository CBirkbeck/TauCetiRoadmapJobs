# Review of AdelicAlgebraicGroups (pull request #792 at 883177b)

**Verdict:** needs changes

This is an incremental re-review of the 102 changed lines since `3750db2`. All of them are in `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`; `Suggested.lean` and the pins are unchanged. Line numbers refer to that README at `883177b` unless another file is named.

The gate passes and r19's only finding is repaired. The repair adds a new owned target, *finite-covolume-unimodular* (AA.2.3). Its mathematics, Checks and pinned inputs are correct, but its *Needs:* line omits two inputs that its own statement uses. That is one new P3 finding.

## R01 (P3) — *finite-covolume-unimodular*: the *Needs:* line omits *quotient-measure* and the closedness of `Λ`

**Location.** `README.md:1899–1902`, "Consequently … *quotient-measure* (AA.2.2) applies to `Λ ≤ T` and, with the counting measure on `Λ`, gives a `T`-invariant measure on `Λ\T` of total mass `μ(D)`". Also `:1910` ("*Compact sets lift to a closed homogeneous quotient* (AA.2.2) gives a compact `K`") and the *Needs:* line `:1913–1921`.

**Claim.** The *Needs:* line lists what the statement and its route use, item by item.

**Witness.** The line names only *Compact sets lift* from AA.2.2. Missing:
- *quotient-measure*, used by the total-mass clause;
- closedness of `Λ`, which *Compact sets lift* (`:1831–1832`) assumes: Mathlib `Subgroup.isClosed_of_discreteTopology` (`Mathlib/Topology/Algebra/OpenSubgroup.lean:377`).

**Repair.** Append to the *Needs:* line at `:1913–1921`: "AA.2.2 (*quotient-measure*, for the invariant measure on `Λ\T` and its total mass `μ(D)`); Mathlib `Subgroup.isClosed_of_discreteTopology`".

Alternatively, delete the total-mass clause and keep only the closedness entry. Both consumers already cite *quotient-measure* on their own *Needs:* lines (AA.3.4 at `:3298–3300`, AA.4.6 at `:5211–5213`).

**Tested** on `ℤ ≤ ℝ` with `D = [0, 1)`:
- `ℤ` is closed in `ℝ`, as the instance gives for a discrete subgroup of a T1 group.
- With counting measure on `ℤ`, the quotient measure has total mass `∫_ℝ 1_D = 1 = μ(D)`. This agrees with the first Check of AnalyticNumberTheoryPartII §5.3k (mass `1`).
- The repaired line then covers every input that the statement and its route name.

## Previous findings (r19 at `3750db2`)

- R01 — repaired: `:5199–5213` "Let `G` be a second countable locally compact Hausdorff group … *Needs:* AA.2.3 (*finite-covolume-unimodular*: compactness of `Λ\T` makes `T` unimodular); AA.2.2 (*quotient-measure*, which then gives the invariant probability measure `ν` …)".

## Verified sound

**Gate, build and dependency check.**
- My gate run on `883177b` exits 0 and prints `gate AdelicAlgebraicGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- The movable dependency check prints `depcheck: 240 roadmaps, 2367 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- The changed passages add no cross-roadmap supplier. Their new edges go to AA.1.5, AA.2.2 and AA.2.3, all earlier than their consumers (AA.2.3, AA.3.4 and AA.4.6). The rest is Mathlib and Tau Ceti at the pins.

**Lean** (`Suggested.lean` unchanged).
- `lake env lean` on it exits 0 in 15 s with 19 warnings, all ``declaration uses `sorry` ``.
- A scratch copy with `#check @name` appended for all 61 declarations elaborates with 0 errors. The `at` and `it` entries of `signatures.md` are words from docstrings, not declarations.
- The five dropped-binder leads are the same harmless ones as in r18 and r19: `box`, `InfinitePoints`, `IsCentralCocharacter`, `algebraicPointMap` and `IsFaithfulAlgebraicPointHom`.
- One-tactic probe: every `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (trivial; done) | (decide; done) | (norm_num; done) | (aesop; done)`. This gives 19 errors on the 19 theorems, so nothing is padding.
- Headline coverage is unchanged from r19.

**Pinned declarations opened for the changed passages** (10).
- **Tau Ceti** `TauCeti/MeasureTheory/Group/ModularCharacter.lean`:
  - the section variables at `:212–214` (`LocallyCompactSpace`, `BorelSpace`) and `[μ.Regular]` at `:322`;
  - `measure_preimage_mul_right_eq_modularCharacter_mul_of_regular` at `:336`. It states `μ((· * g)⁻¹' s) = Δ(g) μ(s)`, so `μ(S g⁻¹) = Δ(g) μ(S)` as the supplier row `:333` says, and `μ(Dt) = Δ(t)⁻¹ μ(D)` as the target says;
  - `quasiMeasurePreserving_mul_right_of_regular` at `:351`.

  Both live in `namespace MeasureTheory.Measure` (`:208`), so the README's qualified names are right.
- **Mathlib** `Mathlib/MeasureTheory/Group/FundamentalDomain.lean`:
  - `measure_ne_zero` at `:139` (`Countable`, `SMulInvariantMeasure`, `μ ≠ 0`);
  - `image_of_equiv` at `:167`. With `f = (· * t)` and `e = id`, the semiconjugacy holds: `(λx)t = λ(xt)`;
  - `measure_eq_tsum` at `:274` (`μ t = Σ' g, μ(g • t ∩ s)`);
  - `IsFundamentalDomain.measure_eq` at `:317`, under the section variables at `:187` and `:206`.
- **Mathlib, other files:**
  - `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` (`Mathlib/MeasureTheory/Measure/Regular.lean:1183`). It needs a pseudometrizable σ-compact space, and a second countable LCH group is both;
  - `modularCharacter` (`Mathlib/MeasureTheory/Group/ModularCharacter.lean:130`).
- **Ownership.**
  - No pinned declaration states that a lattice forces unimodularity: a grep of both pins for `modularCharacter`/`unimodular` near fundamental domains finds none.
  - AnalyticNumberTheoryPartII §5.3k (at its open head) assumes that the modular characters already agree.
  - `roadmaps grep` across main and all open heads finds no owner either.

  This roadmap is therefore the right owner.

**Changed passages, by computation.**
- ***finite-covolume-unimodular*** (`:1893–1941`). The route works step by step:
  - countability of `Λ`, then `μ(D) > 0`;
  - `Dt` is a fundamental domain of equal measure;
  - `μ(Dt) = Δ(t)⁻¹ μ(D)`;
  - the compact case, via `D ⊆ ⋃_λ (λK ∩ D)`.

  All five Checks evaluate as stated (table below).
- **Supplier row** `:333` and the **supplier paragraphs** `:432–434` and `:522–524`: every name occurs at the pin, in the file named.
- **Layer 2 introduction** (`:1556–1561`) and ***Dependencies*** (`:2367–2376`) are consistent with the new target.
- ***Finite volume of `G(F)\G(𝔸)^1`*** (`:3295–3300`):
  - the Lean statement `exists_fundamentalDomain_normOne_lt_top` (`Suggested.lean:291–296`) is the Haar form, a fundamental domain of finite `IsHaarMeasure` measure;
  - `G(𝔸)^1` is a closed subgroup of a second countable LCH group, so *finite-covolume-unimodular* applies.
- ***Arithmetic lattices*** (`:3404–3406`): AA.1.5 (`:1445–1453`) proves `Δ` trivial on compact subgroups, which covers both `Δ_{𝐇(ℝ)⁰}|_{ker p}` and `Δ_{ker p}`.
- **AA.4.6** (`:5199–5235`):
  - the injection `Λt ↦ Λtg` is well defined and injective, since `tg = λt′g` gives `t = λt′`;
  - invariance under `g⁻¹Tg` follows from `Λtg·g⁻¹sg = Λtsg`;
  - `π(T)` is compact as the image of compact `Λ\T`, hence closed in Hausdorff `C`.

**Sources: the seeded sample, where it falls in the changed passages.**

| Sample target | Changed passage | Locator read | Result |
|---|---|---|---|
| 2.3 (new target, not sampled) | *finite-covolume-unimodular* | witte-morris line 1940–1942 (Def 4.1.16, p. 46), line 1944–1951 (Prop 4.1.18, pp. 46–47; the printed page 47 header is at line 1949) | supports "argues … in the same way, for Lie groups … finite invariant measure by definition" |
| 3.4 | *Arithmetic lattices* (*Needs:* only) | milne line 1531–1546 (Prop 3.6, pp. 34–35): the arithmetic quotient maps onto `Γ\H`, using (3.3a) | supports; the modular-character remark is the roadmap's own and is correct |
| 3.4 | *Finite volume* | Platonov–Rapinchuk–Rapinchuk Theorem 5.24 (paywalled; text unchanged) | taken as given |
| 4.6 | *Pushforward …* | khayutin line 912–919 (Def 3.1, p. 22), line 1022–1037 (proof of Prop 3.6, p. 25), fetched through the sources service into a scratch manifest, not the package's | supports |
| 2.2 (cited by the changed text) | *quotient-measure*, *Compact sets lift* | text unchanged; r18's reading stands | — |

The other sample targets contain no changed line, so this incremental review did not re-read them: 0.1, 0.4, 1.2, 2.4, 3.5, 3.7, 4.2, 4.4, 4.5, 5.1, 5.2 and 5.3. The README flags no locator as unverified.

**Remarks on untouched text (no change requested).**
- The locator of AA.4.6 is Khayutin's Definition 3.1, which states only the whole-quotient case `T = G`. The orbit case `π_+([T(𝔸)])` is used in the proof of Proposition 3.6, p. 25 (khayutin line 1022–1037).

**Adversarial table.**
- Rows marked "new" were computed this round.
- Rows marked "r19" are carried from r19's report for statements the diff leaves untouched; r19 in turn carried the r18 rows. They are abbreviated here, with the values as r19 recorded them.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| new: *finite-covolume-unimodular* | `ℤ ≤ ℝ`, `D = [0,1)`; Heisenberg `ℤ³`, `D = [0,1)³`; compact `SO(2)`, `Λ = 1` | `μ(D) = μ([t,t+1)) = 1`, `Δ = 1`; right translation by `(a,b,c)` has Jacobian `1`, mass `1`, `Δ = 1`; `μ(D) = μ(T) = 1`, `Δ = 1` | true |
| new: same, negative control | `ax+b`, left Haar `da db/a²`, `Λ = ⟨(2,0)⟩`, left action `(a,b) ↦ (2a,2b)` | `μ([1,2)×ℝ) = ∫_1^2 da/a² · ∞ = ∞`; `Δ(2,0) = 2`; `Λ\T ≅ (ℝ_{>0}/2^ℤ)×ℝ` via `b/a`, noncompact | hypothesis and conclusion both fail; consistent |
| new: same, scaling direction | `ax+b`, `S = [1,2)×[0,1)`, `t = (2,0)` | `μ(S) = 1/2`; `St = [2,4)×[0,1)`, `μ = 1/4 = 2⁻¹·1/2`; `S t⁻¹ = [1/2,1)×[0,1)`, `μ = 1 = 2·1/2`, matching `ModularCharacter.lean:336` | true |
| new: same, converse and compact clause | `Λ = 1 ≤ ℝ`; `ℤ\ℝ`, `K = [0,1]`, `D = [0,1)` | `μ(D) = ∞` and `Δ = 1` (converse fails, as the Check says); `μ(D) = 1 ≤ Σ_n μ((n+K) ∩ D) = μ(K) = 1` | true |
| new: same, total mass | `ℤ ≤ ℝ`, counting measure on `ℤ` | `dġ(ℤ\ℝ) = ∫_ℝ 1_{[0,1)} = 1 = μ(D)` | true; *Needs:* R01 |
| new: supplier row *Right translation of Haar measure* | `f = (·*t)`, `e = id`; `μ = 0` | `f(λx) = λf(x)`, `image_of_equiv` applies; `measure_ne_zero` needs `μ ≠ 0`, and a Haar measure is nonzero | true |
| new: AA.3.4 finite volume, non-reductive | Borel `B ⊂ SL₂/ℚ`; `G_a/ℚ` | `Δ_{B(𝔸)}(diag(a,a⁻¹)) = \|a\|_𝔸² = \|α\|_𝔸`, trivial on `B(𝔸)^1`; `B(ℚ)\B(𝔸)^1` compact; `𝔸/ℚ` compact, `Δ = 1` | true |
| new: AA.3.4 arithmetic lattices, AA.1.5 entry | `SO₀(n,1) × ∏SO(n+1)`; `SL₂(ℝ) → PSL₂(ℝ)` | `ker p = ∏SO(n+1)` compact: `Δ_{𝐇(ℝ)⁰}\|_{ker p} = 1 = Δ_{ker p}`; `ker p = {±1}`: both `1` | true |
| new: AA.4.6 pushforward, `g⁻¹Tg` | `S₃`, `T = {1,(12)}`, `g = (13)`, sign | `g⁻¹Tg = {1,(23)}`; `Tg = {(13),(132)}`, `Tg(23) = {(132),(13)}`, `Tg(12) = {(123),(23)}` disjoint; signs `−1, +1`, masses `½, ½` | true |
| new: AA.4.6, normalizing `g` and degenerate cases | `C₄`, `T = {0,2}`, `g = 1`; `T = Λ = 1`; `ax+b` | `T`-invariant, mass `½` at `1, 3`; point mass at `π(g)`; noncompact `Λ\T`, excluded | true |
| r19: row *Geometric torsors and classes* | 10 names on main | §1.13: 1 name; §1.15: 8 names; §2.3: 1 name; 2 of the 10 in its `Suggested.lean` | true |
| r19: 4.1 canonical `μ₂` class | `ℚ[t]/(t²−2)` over `ℚ`, `ℝ` | no sections / `±√2`; `[2] ≠ 1` / `= 1` | true |
| r19: 4.1 real-class realization | Hamilton `SL₁(D)` | 2 classes ↦ 2 classes, `−1 ↦ −1` | true |
| r19: 4.5 level change | `G_m`, `[U:U′] = 4` | `2+2 = 4·1` | true |
| r19: 4.7 Fourier convergence | `∏_ℕ{±1}` | `∫χ_S dm_n = [S∈{∅,{n}}]`, limit `[S=∅]` | true |
| r19: Lean `exists_unique_convergentHaarProduct` | `ι = ∅`; `C₄ ⊃ {0,2}` | `1`; box mass `2` | true |
| r19: 0.1 Borel boxes; 0.2 right invariance | `ℤ/4 ⊃ 2ℤ/4`; `C₂` | not open; invariant | true |
| r19: 0.4 normalizations, idele mass | `[0,1)×ℤ̂`; `1+4ℤ₂` | `1`; `½` | true |
| r19: Lean Weil restriction, `exists_restrictedProductEquiv` | `ℚ(i)/ℚ`; `G_m` | `i ↦ i`; `𝔸_f^× ≃ Πʳ` | true |
| r19: 1.2, 2.1 | `SO(x²−y²)`; idele `(2,½)` | 2 components; norm `1` | true |
| r19: 2.2 modulus, compact lifting | `ax+b`; `ℝ_d → ℝ` | `δ⁻¹`; finite compacts miss `[0,1]` | true; Arthur misprint (r18) |
| r19: 2.4, 2.5 gauge and Tamagawa | `GL₂(𝔽₂)`; `G_a/ℚ`; `ℚ(i)/ℚ` | `6`; `1`; `½ = 4^{−1/2}` | true |
| r19: 3.3–3.7 Siegel, heights, triple sets | `SL₂`; `GL₁` point `2`; `t = ¾` vs `1` | `g·i = x+iy`; `√17`; `0.45+0.9i` blocks `t = 1` | true |
| r19: Lean `arithmetic_finite_volume_iff`, `finite_classes`, `finite_volume_iff`, `exists_compact_normOne_iff` | `G_m`, `SL₂`, `G_a`, `GL₂` | infinite/finite; `Cl(ℤ) = 1`; compact `𝔸/ℚ`; noncompact `GL₂` | true |
| r19: Lean `exists_reduced_GLZ`, approximation pair, `exists_isNeatLevel_le`, `isCoveringMap_levelMap` | `n = 0, 1`; `μ₂`; `GL₂(ℤ̂)`; `Γ(9) → Γ(3)` | `1 < C`; not dense; index `48`; `27` | true |
| r19: 4.4, 5.3 fibre masses | `Γ̂(2)`; Hurwitz `U₁(9)` | `3·½ = 6/4`; `72/24 = 3` | true |
| r19: Lean `nrd_image`, `compactSpace_ideleClassGroup_quotient_squares`, `isMulLeftInvariant_of_tendsto` | Hamilton `c = −1, 3`; `−1` at `3`; repeated `χ` | false/true; survives; excluded by `hχ` | true |
| r19: Lean `nonempty_connectedComponent_homeomorph`, `exists_componentHomeomorph` | `ℚ`, `ℚ(√2)`; `GL₂(ℤ̂)` | point, circle; one component | true |

## Not verifiable

- **Paywalled:** Platonov–Rapinchuk–Rapinchuk 2023, Theorem 5.24 (cited in the changed AA.3.4 target, locator text unchanged) and Theorem 3.64 (*quotient-measure*, cited by changed passages). These are taken as given, as in r19.
- **Ownership of the new object against open pull requests:** checked by `roadmaps grep` across main and every open head, and by `overlaps.md` (no dropped ids, no other pull request changing this roadmap). The READMEs of ArithmeticLocallySymmetricSpaces, ShimuraVarieties and ShimuraData were not read in full.

## Source issues

- **Gap** in witte-morris at Proposition 4.1.18, pp. 46–47: the proof identifies the given invariant finite measure on `H/Λ` with the image of Haar measure on a strict fundamental domain, quoting Proposition 4.1.3, whose setting is unimodular; it should first show the two are proportional (quotient integral formula), so `μ(F) < ∞`; affects nothing.
- **Misprint** in witte-morris at the proof of Proposition 4.1.18, p. 46: the source quantifies over Borel sets `A` in `G`; it should say Borel sets in `H`, the Lie group of the proposition; affects nothing.
- **Misprint** in khayutin at the proof of Proposition 3.6, p. 25: the source calls the torus `T` isotropic over `ℚ` when deducing compactness of `[T(𝔸)]`; it should say anisotropic; affects nothing.
