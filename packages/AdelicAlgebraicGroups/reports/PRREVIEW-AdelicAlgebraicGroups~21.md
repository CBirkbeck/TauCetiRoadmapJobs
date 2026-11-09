# Review of AdelicAlgebraicGroups (pull request #792 at 989a3a7)

**Verdict:** accepted

This is an incremental re-review of the 35 changed lines since `883177b`. All of them are in `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`. `Suggested.lean`, `metadata.toml` and the pins are unchanged. Line numbers refer to that README at `989a3a7` unless another file is named.

The only finding of the previous review, r20's R01, is repaired. The repair introduces no new defect, and the gate passes. No finding remains.

## Previous findings (r20 at `883177b`)

- R01 — repaired: `:1919–1923` "*Needs:* AA.2.2 (*Compact sets lift …*; *quotient-measure*, for the invariant measure on `Λ\T`); AnalyticNumberTheoryPartII §5.3k (… for its total mass `μ(D)`); … Mathlib `Subgroup.isClosed_of_discreteTopology` (closedness of `Λ`, which both AA.2.2 targets assume)".

## Verified sound

**Gate, build and dependency check.**
- My gate run on `989a3a7` exits 0. It prints `gate AdelicAlgebraicGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run on the same head adds `build=0`.
- The movable dependency check prints `depcheck: 239 roadmaps, 2332 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- The new edges are as follows:
  - AA.2.3 → AA.1.3 and AA.3.4 → AA.1.3, both downward inside this roadmap.
  - AA.2.3 → AnalyticNumberTheoryPartII §5.3k. That roadmap is line 51 of the merge order, directly above this one (line 52), and the supplier contract `:569–577` already lists §5.3k as consumed by AA.2.2–AA.2.3.
  - AA.2.3 and AA.4.6 → Mathlib.

**Lean** (`Suggested.lean` is unchanged since r20, which ran the full `#check @name` and one-tactic probes).
- `lake env lean` on `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 in 7 s. All 19 warnings are ``declaration uses `sorry` ``, and there is no other message.
- `signatures.md` lists 63 entries. Its five dropped-binder leads are the same five that r18–r20 found harmless: `RestrictedHaar.box`, `AdelicPoints.InfinitePoints`, `Reduction.IsCentralCocharacter`, `Neat.algebraicPointMap` and `Neat.IsFaithfulAlgebraicPointHom`. In each, the dropped instance does not occur in the type.
- None of the 50 citation leads in `citations.md` falls in a changed line. The nearest is `:3318`, `Reduction.exists_fundamentalDomain_normOne_lt_top`, which is declared at `Suggested.lean:291`.

**Pinned declarations opened for the changed passages** (6).
- `Subgroup.isClosed_of_isDiscrete`, at `Mathlib/Topology/Algebra/OpenSubgroup.lean:372`. Its hypotheses are `[T1Space G]` and `IsDiscrete (U : Set G)`, with the conclusion `IsClosed (U : Set G)`.
- `Subgroup.isClosed_of_discreteTopology`, at `:377`. It is an `instance` with `[T1Space G]` and `[DiscreteTopology U]`.
  - Both lemmas sit in `namespace Subgroup` (`:265`), under `[Group G] [TopologicalSpace G]` (`:267`) and `[IsTopologicalGroup G]` (`:337`).
  - The README's "discrete subgroup of a Hausdorff group" (`:1901–1902`, `:5230–5231`) is therefore covered, since T2 implies T1. The qualified name in the supplier list (`:452–453`) and on the three *Needs:* lines is right.
- `IsFundamentalDomain`, at `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:69–73`. Its fields are `nullMeasurableSet`, `ae_covers` and `aedisjoint`. These are exactly what the new null-set clause uses (next block).
- `IsFundamentalDomain.quotientMeasure_eq` at `:630` and `QuotientMeasureEqMeasurePreimage` at `:747`. Both concern the pushforward `(μ.restrict s).map π`. Neither identifies Weil's quotient measure `dġ` of §5.3k with it, so the new total-mass clause restates nothing at the pin.

**The repaired passage, by computation** (*finite-covolume-unimodular*, `:1894–1954`).
- *Right invariance.* `Δ_T ≡ 1` gives `μ(St) = Δ_T(t)⁻¹ μ(S) = μ(S)`, so `μ` is a right Haar measure. This makes `dg = μ` admissible in *quotient-measure*, which is stated for right Haar measures (`:1854`).
- *Counting measure on `Λ`.* `Λ` is countable and discrete, so its Borel sigma algebra is the power set, and counting measure is a two-sided Haar measure. `Δ_T|_Λ = 1 = Δ_Λ`.
- *The null-set clause.* Write `n(t) = #{λ : λt ∈ D} = #{λ : t ∈ λ⁻¹D}`.
  - `n(t) = 0` only on the null set excluded by `ae_covers`.
  - `n(t) ≥ 2` only on `⋃_{λ≠λ′} λ⁻¹D ∩ λ′⁻¹D`. This is a countable union of null sets, by `aedisjoint`.
  - `n(λ′t) = n(t)` by reindexing `λ ↦ λλ′`, so `N = {n ≠ 1}` is `Λ`-invariant.
  - For invariant null `N`, the formula applied to `1_N` gives `0 = ∫_{Λ\T} |Λ|·1_{q(N)} dġ`, hence `dġ(q(N)) = 0`.
  - Then `μ(D) = ∫_{Λ\T} n dġ = dġ(Λ\T)`.
- *Supplier text.* AnalyticNumberTheoryPartII §5.3k, read at its open head (README line 733 there), states:
  - the extension of the integration formula to nonnegative Borel `f` with values in `[0, ∞]`;
  - the inner integral `∫_H f(hg) dh`, which is `Σ_λ f(λt)` for counting `dh`;
  - the scaling `c·dh ↦ c⁻¹·dġ`, which the new S₃ Check uses.
- *The new S₃ Check* (`:1951–1954`).
  - `A₃·1 = A₃ ∋ 1` and `A₃·(12)` is the three transpositions, which contain `(12)`. So `D = {1, (12)}` meets each coset once. The translates `D`, `(123)D`, `(132)D` are pairwise disjoint and cover `S₃`, and `μ(D) = 2`.
  - Formula with `f = 1`: `6 = 3 · dġ(Λ\T)` gives `dġ = 2 = μ(D)`.
  - The normalized counting measure (`c = 1/3`) gives `6 = 1 · dġ`, so `dġ = 6`. The Check therefore separates the two normalizations.
- *Closedness.* The *Needs:* line's "both AA.2.2 targets assume" closedness is right: *Compact sets lift* assumes it at `:1833` ("a closed subgroup `H ≤ G`") and *quotient-measure* at `:1853` ("`H ≤ G` a closed subgroup").

**The other changed passages.**
- **`:1991–1993`** (*The measure on the automorphic quotient*, AA.2.3). The new entry is correct:
  - AA.1.3's *Rational points are discrete in the full adeles* (`:1260–1267`) proves the image discrete and closed.
  - AA.2.1's norm-one target (`:1696–1704`) proves `G(𝔸)^1` closed and containing `G(F)`, and it is already on the line.
  - Discrete and closed in `G(𝔸_F)` gives discrete and relatively closed in `G(𝔸_F)^1`.
- **`:3315–3317`** (*Finite volume*, AA.3.4). The entry is correct. *finite-covolume-unimodular* needs `Λ = G(F)` discrete in `T = G(𝔸_F)^1`, and *quotient-measure* needs it closed. AA.1.3 is earlier than AA.3.4.
- **`:5230–5232`** (AA.4.6). The entry is correct. `T` is a closed subgroup of the Hausdorff group `G`, so `T` is Hausdorff and the discrete `Λ ≤ T` is closed in it, as *quotient-measure* requires.
- **`:452–453`** (Mathlib supplier paragraph). The new name `Subgroup.isClosed_of_discreteTopology` exists at the pin, next to `Subgroup.isClosed_of_isDiscrete`, which AA.1.3 uses.
- **Policy.** The changed lines contain no LaTeX, no process words, no pull-request numbers and no backticked name of this roadmap's own.

**Ownership and overlaps.**
- The change adds no owned object. It adds *Needs:* entries, a consequence clause of an existing target, and one Check.
- `overlaps.md` reports none of the following: another pull request changing this roadmap, a dropped id, or an id that only an open revision defines.
- AnalyticNumberTheoryPartII is not on main. It is cited at its open head, as r18–r20 accepted, and it is a new-folder pull request earlier in the merge order.

**Sources: the seeded sample, where it falls in the changed passages.** The changed lines cite AA.1.3 and rely on AA.2.1's norm-one target. Those sampled targets were read at their locators:

| Sample target | Cited by | Locator read | Result |
|---|---|---|---|
| 1.3 *Rational points are discrete in the full adeles* | `:1991–1993`, `:3315–3317` | conrad line 115–116 (Example 2.3; p. 3 starts at line 98): `X(F) → X(𝔸_F)` is an embedding onto a discrete subset, for affine finite type `X` | supports discreteness; closedness is the README's Mathlib step `Subgroup.isClosed_of_isDiscrete` with the T2 adeles, as stated |
| 1.3, same target | same | borel line 113–116 (§1.2, printed p. 7, header at line 97): principal adeles form discrete subgroups | supports |
| 2.1 *The norm-one subgroup* | `:1991–1993` ("the closed subgroup `G(𝔸_F)^1` containing it") | borel line 716–722 (Theorem 5.8, printed p. 22, header at line 709): `G^1` contains `G_k` by the product formula; arthur line 763–764 and 814 (§3, p. 16, header at line 745): `G(𝔸)^1` is a normal factor and contains `G(ℚ)` | supports |
| 2.3 (not sampled) *finite-covolume-unimodular* | — | witte-morris locator text unchanged; r20's reading (line 1940–1951) stands | — |

The other sample targets contain no changed line and are not cited by one: 0.1, 0.2, 0.3, 1.2, 1.5, 3.1, 3.5, 3.6, 4.1, 5.1, 5.2 and 5.3. This incremental review did not re-read them. The README flags no locator as unverified.

**Remarks on untouched text (no change requested).**
- The *Needs:* line of *quotient-measure* (`:1862–1863`) cites "AA.2.2", its own section, without naming the target. The neighbouring *Inversion* target, which converts the book's `G/H` to `H\G`, is presumably meant.

**Adversarial table.**
- Rows marked "new" were computed this round for the changed statements.
- Rows marked "r20" are carried, abbreviated, from r20's report (`PRREVIEW-AdelicAlgebraicGroups_r20`). They cover statements the diff leaves untouched, with the values that report recorded. Its rows marked "r19" are carried in turn.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| new: *finite-covolume-unimodular*, total mass `μ(D)` | `T = S₃` counting, `Λ = A₃`, `D = {1,(12)}` | `∫ 1 = 6`, inner sum `3`, `dġ = 2 = μ(D)`; normalized `dh`: inner `1`, `dġ = 6 ≠ 2` | true; Check discriminates |
| new: same, the "off a null set" clause | `ℤ ≤ ℝ`, closed `D = [0,1]` | `n(t) = 2` on `N = ℤ` (`t` and `t−1` or `t+1`), `1` elsewhere; `N` invariant, Lebesgue-null; `q(N)` one point, null on the circle; `dġ(ℤ\ℝ) = 1 = μ([0,1])` | true |
| new: same, closedness of `Λ` (T1 needed) | `ℤ ≤ ℝ`; non-discrete `ℤ + √2ℤ ≤ ℝ`; `{0} ≤ ℤ/2` indiscrete | closed; dense, not closed (discreteness used); `{0}` discrete as a subspace but not closed (T1 used) | true; README assumes Hausdorff |
| new: same, `Δ_T\|_Λ = Δ_Λ` and right invariance | `ℤ ≤ ℝ`; Heisenberg `ℤ³`; `ax+b` with `Λ = ⟨(2,0)⟩` | `1 = 1`; `1 = 1`; `Δ(2,0) = 2 ≠ 1`, but `μ(D) = ∞`, hypothesis fails | true |
| new: AA.2.3 automorphic quotient, AA.1.3 entry | `G_m/ℚ`; `G_a/ℚ` in finite adeles | `ℚ^× ∩ ((½,2) × ∏ℤ_p^×) = {1}`, so discrete and closed; `\|2\|_∞\|2\|_2 = 2·½ = 1`, so `ℚ^× ⊂ 𝔸^1`; `ℚ ∩ Ẑ = ℤ` infinite, not discrete in `𝔸_f` (full adeles needed) | true |
| new: AA.3.4 finite volume, AA.1.3 entry | `G_a/ℚ`; Borel `B ⊂ SL₂/ℚ` | `ℚ ⊂ 𝔸 = 𝔸^1` discrete and closed, `D = [0,1) × Ẑ`, `μ(D) = 1`, `Δ = 1`; `B(ℚ)` discrete and closed in `B(𝔸)^1`, `Δ = 1` there (r20) | true |
| new: AA.4.6, closedness entry | `G = C₄`, `T = {0,2}`, `Λ = 1`; norm-one torus of `ℚ(i)/ℚ` | `{1}` closed in T2 `T`; `T(ℚ)` discrete in `T(𝔸)`, closed, quotient compact (anisotropic) | true |
| r20: *finite-covolume-unimodular*, main claim | `ℤ ≤ ℝ`, `[0,1)`; Heisenberg; compact `SO(2)` | `μ = 1`, `Δ = 1`; Jacobian `1`; `μ(T) = 1` | true |
| r20: same, negative control and scaling | `ax+b`, strip `[1,2)×ℝ`; `S = [1,2)×[0,1)`, `t = (2,0)` | mass `∞`, `Δ = 2`; `μ(St) = 1/4 = 2⁻¹·½`, `μ(St⁻¹) = 1` | true |
| r20: supplier row *Right translation of Haar measure* | `f = (·*t)`, `e = id` | `f(λx) = λf(x)`; `μ ≠ 0` for Haar | true |
| r20: AA.3.4 arithmetic lattices | `SO₀(n,1) × ∏SO(n+1)`; `SL₂(ℝ) → PSL₂(ℝ)` | `Δ\|_{ker p} = 1 = Δ_{ker p}` | true |
| r20: AA.4.6 pushforward, `g⁻¹Tg` | `S₃`, `T = {1,(12)}`, `g = (13)` | `g⁻¹Tg = {1,(23)}`; masses `½, ½` | true |
| r20: AA.4.6 degenerate | `C₄`, `T = {0,2}`; `T = Λ = 1` | mass `½` at `1, 3`; point mass | true |
| r20: *Geometric torsors and classes* | 10 names on main | 1 + 8 + 1 names found | true |
| r20: 4.1 `μ₂` class; real-class realization | `ℚ[t]/(t²−2)`; Hamilton `SL₁(D)` | `[2] ≠ 1` over `ℚ`, `= 1` over `ℝ`; 2 classes ↦ 2 | true |
| r20: 4.5 level change; 4.7 Fourier | `G_m`, `[U:U′] = 4`; `∏_ℕ{±1}` | `2+2 = 4·1`; limit `[S = ∅]` | true |
| r20: Lean `exists_unique_convergentHaarProduct` | `ι = ∅`; `C₄ ⊃ {0,2}` | `1`; box mass `2` | true |
| r20: 0.1, 0.2, 0.4 | `ℤ/4 ⊃ 2ℤ/4`; `C₂`; `[0,1)×Ẑ`; `1+4ℤ₂` | not open; invariant; `1`; `½` | true |
| r20: Weil restriction, `exists_restrictedProductEquiv` | `ℚ(i)/ℚ`; `G_m` | `i ↦ i`; `𝔸_f^× ≃ Πʳ` | true |
| r20: 1.2, 2.1 | `SO(x²−y²)`; idele `(2,½)` | 2 components; norm `1` | true |
| r20: 2.2 modulus, compact lifting | `ax+b`; `ℝ_d → ℝ` | `δ⁻¹`; finite compacts miss `[0,1]` | true |
| r20: 2.4, 2.5 | `GL₂(𝔽₂)`; `G_a/ℚ`; `ℚ(i)/ℚ` | `6`; `1`; `½ = 4^{−1/2}` | true |
| r20: 3.3–3.7 | `SL₂`; `GL₁` point `2`; `t = ¾` vs `1` | `g·i = x+iy`; `√17`; `0.45+0.9i` blocks `t = 1` | true |
| r20: Lean `arithmetic_finite_volume_iff`, `finite_classes`, `finite_volume_iff`, `exists_compact_normOne_iff` | `G_m`, `SL₂`, `G_a`, `GL₂` | infinite/finite; `Cl(ℤ) = 1`; compact `𝔸/ℚ`; noncompact | true |
| r20: Lean `exists_reduced_GLZ`, approximation pair, `exists_isNeatLevel_le`, `isCoveringMap_levelMap` | `n = 0, 1`; `μ₂`; `GL₂(Ẑ)`; `Γ(9) → Γ(3)` | `1 < C`; not dense; index `48`; `27` | true |
| r20: 4.4, 5.3 fibre masses | `Γ̂(2)`; Hurwitz `U₁(9)` | `3·½ = 6/4`; `72/24 = 3` | true |
| r20: Lean `nrd_image`, `compactSpace_ideleClassGroup_quotient_squares`, `isMulLeftInvariant_of_tendsto` | Hamilton `c = −1, 3`; `−1` at `3`; repeated `χ` | false/true; survives; excluded | true |
| r20: Lean `nonempty_connectedComponent_homeomorph`, `exists_componentHomeomorph` | `ℚ`, `ℚ(√2)`; `GL₂(Ẑ)` | point, circle; one component | true |
| r20: Lean `exists_fundamentalDomain_normOne_lt_top` | `G_a/ℚ`; `B ⊂ SL₂` | `μ([0,1)×Ẑ) = 1 < ∞`; compact `B(ℚ)\B(𝔸)^1` | true |

## Not verifiable

- Two theorems of [Platonov–Rapinchuk–Rapinchuk] are paywalled and are taken as given, as in r20:
  - Theorem 3.64, on which *quotient-measure* rests; it is cited by the changed passages.
  - Theorem 5.24, cited in the AA.3.4 target, whose locator is unchanged.
- **Ownership against open pull requests.** The change adds no owned object, so no new search was needed. `overlaps.md` reports no dropped id and no other pull request changing this roadmap.

## Source issues

- none
