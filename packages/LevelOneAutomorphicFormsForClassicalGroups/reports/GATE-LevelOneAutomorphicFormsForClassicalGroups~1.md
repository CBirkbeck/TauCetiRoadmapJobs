# GATE-LevelOneAutomorphicFormsForClassicalGroups~1: answers to human review

Review answered: CBirkbeck, 2026-11-15T14:26:27Z, on head `9e876d8`. It carries the red-team
findings F01–F12, numbered H01–H12 below. The comment text as received ends partway through F12's
retest ("…while the identity's i"). Any findings after F12 are not visible here and are not answered.

Repairs are in commit `7466633a` on the pull-request branch. Line numbers refer to
`TauCetiRoadmap/LevelOneAutomorphicFormsForClassicalGroups/README.md` at that commit.

## H01 (CBirkbeck) — applied

§4.10 (line 1709) now reads "For a monic integral polynomial `P` of degree `d_G`, such as an element of
`P(G)` or the characteristic polynomial of an element of `G`", replacing "For an integral polynomial `P`",
so the bullet `e_j = (−1)^j [X^{d_G−j}]P` holds. A fourth Check (line 1734) records the counterexample
`2(X − 1)²`: roots give `(e₀, e₁, e₂) = (1, 2, 1)`, signed coefficients give `(2, 4, 2)`.

## H02 (CBirkbeck) — applied differently

The route is the reviewer's, with three corrections.

- **Section order.** The route needs the Rallis relation. Citing it forward would add a second own
  forward reference to a README that otherwise has none (the other is the one H11 removes). So the
  two sections are swapped: §6.8 is now the Rallis relation and §6.9 "The small-rank lattice
  eigenparameters and their degrees" (lines 2292, 2311). All own references are renumbered: §§6.10,
  7.6, 8.1, 8.2, 8.9, 8.10, the Layer 6 Examples and the Layer 7 Dependencies. No other roadmap cites
  either number.
- **Attribution.** §6.5 (line 2231) adds the two injectivity targets. The genus-4 one is attributed to
  CL14 V Proposition 2.1, p. 138, where the Fourier coefficient at `D₄` separates the two series. The
  reviewer's "Witt's conjecture, proved by Igusa and Kneser" is the genus ≤ 3 *equality* (CL14 lines
  5240–5243), not this inequality. Erokhin is cited where CL14 states his theorem (V §3, p. 140;
  IX Lemme 2.9, p. 290), so the manifest needs no new key.
- **Degree-0 line.** The route now also handles it: `Σ_L |O(L)|⁻¹[L]` spans a `T_p`-stable complement of
  `ker θ₀` (CL14 V §1, p. 137).

The low-genus Eichler sentence and its API bullet are removed from the old §6.8. §8.1 (line 2727) proves
surjectivity for every `g` by showing `θ_g(ker θ_{g−1}) = S_k(Γ_g)`, through the degree counts of §6.9
and §7.9. The Layer 6 Dependencies gain ModularityAndLanglandsExtensions §3.8 with its standing
premises. Enumeration confirms the counts used: exactly 24 formal sums for `SO₂₄` (CL14 IX Théorème
4.4, p. 326, matching the table), 2 for `SO₁₆`, and in rank 16 only `Δ₁₁[4] ⊕ [1]` at `g₀ = 4`.

## H03 (CBirkbeck) — applied

The Conventions (line 140) now say that for `n = 0` each permitted group is trivial, with
`EP = T_ell = 1`. Such a group enters only as the Levi factor `G′` of §4.3, and §3.16 is stated for
`n ≥ 1` (line 1465). A §3.16 Check (line 1479) records `SO₁`: `m_G = 0`, there is no rank-zero element
of `Π_alg` and so no `κ`, while `EP = 1`. "Permitted" is not narrowed globally, because §§4.3 and 4.11
use the trivial groups. The §4.7 and `Suggested.lean` rank stays unrestricted.

## H04 (CBirkbeck) — applied

§6.11 is retitled "Central orders in motivic weight at most 22" (line 2390). It now states, for every
`π ∈ Π_alg` of motivic weight ≤ 22, that the order at `1/2` is `(1 − ε(π))/2`, with `ε = −1` exactly for
`Δ₁₇` and `Δ₂₁` (CL14 IX Proposition 3.38, p. 322). The route: parity from the functional equation;
order < 2 from the explicit formula on `t₁π + t₂·1` with the central zero counted twice; then §2.12 at
`ℓ = log 4` (proof, p. 323). The two nonvanishing instances stay as Checks, and the `Δ₁₇` Check now says
order exactly 1.

## H05 (CBirkbeck) — disputed

The §4.9 values and the §8.7 orders are mathematical facts, consumed by §§4.13–4.17 and 8.8; they are
not source passages. The 32 cardinalities recompute exactly from the README's own definitions in
§§4.4 and 4.8, including `|P(Sp₁₄)/∼| = 1158` where CT20 Table 2 prints `1157`. The README already
departs from the printed table there.

The proposed replacement (orbits = half of indices plus fixed points) holds for any involution and
drops the theorem. No edit.

## H06 (CBirkbeck) — applied

The Conventions (line 134) now use the irreducible algebraic representation of highest weight `k`. It
is `det^{k_g}` times the polynomial representation of highest weight `(k₁ − k_g, …, k_{g−1} − k_g, 0)`,
and polynomial exactly when `k_g ≥ 0`. At `g = 1, k = −1` this is `det⁻¹`; at `(1, −1)` it is
`det⁻¹ ⊗ Sym²`.

## H07 (CBirkbeck) — applied

The §AL.3.6 contract (line 287) now gives the supplier's statement at its open head (AL.3.6.1):
- if the ranks agree, the only poles are simple, at `s = iσ` and `1 + iσ`, for the real `σ` with
  `π^∨ ≅ π′ ⊗ |det|^{iσ}`;
- otherwise `Λ(s, π × π′)` is entire;
- on `Π_alg`, algebraic infinity types force `σ = 0`.

This matches the reasoning already in §2.6, which needed no change.

## H08 (CBirkbeck) — applied

The contract (line 191) now says `ModularForm.dimension_level_one` is for natural even `k`, with `⌊k/12⌋`.
It adds `ModularForm.levelOne_neg_weight_rank_zero` (`LevelOne/Basic.lean:121`) for negative weight and
names `ModularForm.levelOne_odd_weight_rank_zero` (`DimensionFormula.lean:162`). The negative-weight
lemma is added to the *Needs:* of §§2.20 and 4.12, whose weights `w + 1` and `2k + 2` go below 12, so
`k − 12 < 0` there.

## H09 (CBirkbeck) — applied

The first §8.4 Check (line 2807) now says that a codeword sign change acts diagonally on wedge monomials
`e_T`, not by a scalar on `σ_T`:
- `σ_C` is fixed because codewords meet evenly;
- for an orientable `T ∉ G₂₄`, a codeword meeting `T` oddly exists by self-duality and negates `e_T`;
- the singleton witness gives 8 negative and 16 positive coefficients.

The non-orientable Check (line 2813) now says that `σ_T` is defined only for orientable `T`: for any
other `T` the sum over all of `M₂₄` vanishes.

## H10 (CBirkbeck) — applied

The §4.11 Check (line 1750) now gives a wide example: `A = [[1,0,0],[0,1,0]]` has full row rank 2, yet
`Am = 0` has the solutions `(0,0,0)` and `(0,0,1)`. Uniqueness needs rank equal to the number
`|P₁(G)/∼|` of columns.

## H11 (CBirkbeck) — applied differently

Freitag's spanning theorem moves from §6.2 to §6.4 (line 2202), with an API bullet and the `θ₉[E₈]`
Check (line 2224). §6.2 is retitled "Boundary and vanishing theorems at level one" and its *Needs:* no
longer cite §6.4. §8.14 now cites §6.4, and the Scope paragraph now says SiegelModularForms reads
"§§6.1–6.2 and 6.4".

Three differences from the suggested repair:
- The proposed sentence "formerly included here is now…" is process narrative and was not added.
- The §6.2 Check that used `θ₉` now uses `S₀(Γ₉) = 0`, `M₀(Γ₉) = ℂ` (line 2160).
- The moved statement gains `g ≥ 1`: at `g = 0`, `k < 0` it would contradict the genus-zero convention.

## H12 (CBirkbeck) — applied

The non-discriminating Check in §4.1 (line 1531) is replaced. `u = [[1,1],[0,1]] ∈ SL₂` has the
characteristic polynomial `(X − 1)²` of the identity, but `u^r = [[1, r],[0,1]] ≠ 1` for all `r ≥ 1`.
So its geometric class is not in `C(G)`.

## Build and gate

- `lake build TauCetiRoadmap.LevelOneAutomorphicFormsForClassicalGroups.Suggested`: Build completed
  successfully (18292 jobs). The only warnings are the four `declaration uses 'sorry'` at lines 87, 130,
  143 and 155.
- Gate at `7466633a`: `gate LevelOneAutomorphicFormsForClassicalGroups: set_option=0 blob=0 latex=0
  tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0
  mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0
  readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0
  depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`. There are no UPWARD, CYCLE or
  `moved:` lines, and no notion was moved down from a later roadmap.
- `roadmaps resolve`: no cross-roadmap citation or Lean name found nowhere. The new Mathlib names were
  checked by hand at the pin; the tool skips names outside TauCetiRoadmap on this host.

## Notes

- **`Suggested.lean`.** It is unchanged. The `#check @name` comparison uses the elaborated signatures supplied
  with this job for this file, since this job may run no Lean command other than the module build. All 8
  elaborated types match their README statements (§§4.7, 8.5, 8.6), with no dropped binders.
- **Ownership.** Searched main and the open heads with `roadmaps grep` for Erokhin, Witt, Igusa–Kneser
  and `E₈ ⊕ E₈`/`D₁₆⁺` theta series. No roadmap owns the two injectivity theorems of §6.5, so this
  roadmap owns them; IntegralLattices mentions the two rank-16 classes only for genus and
  non-isometry.
- **Consumer.** SiegelModularForms (open) describes this roadmap's §§6.1–6.2 as holding "the
  singular-range vanishing and spanning theorems". After this commit the spanning theorem is in §6.4.
  The vanishing it cites by number (its 2.6 → §6.2's Resnikoff–Freitag) is unchanged.

## Adversarial pass on the changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| Coefficient rep (Conv.) | `g=1,k=−1`; `g=2,k=(1,−1)`; `(3,3)` | `det⁻¹` (not polynomial); `det⁻¹⊗Sym²`, h.w. `(2,0)+(−1,−1)=(1,−1)`; `det³` | holds |
| `n = 0` convention | `SO₁`, `Sp₀`, `SO₀`; `SO₃` Levi term | `EP = T_ell = 1`; `1/2 · T_ell(SO₁) = 1/2`, matching §4.3 Check | holds |
| Dimension contract | `k = 0, 2, 12, 14, −24, 13`; `S₁₀`, `S₂` | `1, 0, 2, 1, 0, 0`; `M₋₂ = M₋₁₀ = 0` via negative-weight lemma | holds |
| Pole contract | `(1, \|·\|^{2i})`; `(1,1)`; `(Δ₂₃^a, Δ₂₃^b)`; `(Δ₁₁, 1)` | `σ = −2`, poles `−2i, 1−2i`; poles `0, 1`; no pole (`σ = 0` forced); entire (ranks differ) | holds |
| §3.16 `n ≥ 1` | `SO₃`; `SO₁`; `Sp₀` | `EP = −N⊥ + δ_{k,0}`; `EP = 1`, no rank-0 class; `κ = 1, N⊥ = 1` (consistent, excluded) | holds |
| §4.1 Check | `u^r`, `r = 1, 2, 3` | upper-right `1, 2, 3 ≠ 0`; charpoly `X² − 2X + 1` | holds |
| §4.10 monic | `(X−1)²`; `2(X−1)²` | signed coeffs `(1,2,1) = e`; `(2,4,2) ≠ (1,2,1)` | holds |
| §4.11 Check | `A` (2×3) | `A·(0,0,1) = (0,0)`, rank 2, nullity 1 | holds |
| §6.2 Check | `k = 0, g = 9` | `S₀ = 0`, `M₀ = ℂ` | holds |
| §6.4 spanning | `(k,g) = (4,9), (0,1), (1,3), (2,5), (−1,1), (8,17), (12,25)`; `g = 0, k = −1` | dims `1, 1, 0, 0, 0, 2, 24` (agree with §§8.2, 8.12, 8.14); `g = 0` would give `0` against convention `ℂ` | `g ≥ 1` added |
| §6.5 injectivity | `ℂ[X₁₆]`: `θ₀` fixes the sum; Prop 2.1 | `c_{D₄}/\|O(D₄)\| = 4480 ≠ 0`; max table degree 12 | holds |
| §6.9 route | enumeration of formal sums | `SO₂₄`: 24; `SO₁₆`: 2; `SO₈`: 1; rank-16 `g₀ = 1..4`: only `g₀ = 4`; rank-24 `g₀ = 1..10`: `1,1,1,2,2,3,3,4,2,2`, no `[d ≥ 3]`; `g₀ = 11`: 14 sums, 1 without `[d ≥ 3]`; `g₀ = 12`: 10 sums, only `Δ₁₁[12] ⊕ [1]` in (I)/(H1); `1 + 23 = 24` | holds |
| §6.11 orders | `ε` of the 11 classes | `1,1,1,−1,1,−1,1,1,1,1,1` for `1,Δ₁₁,Δ₁₅,Δ₁₇,Δ₁₉,Δ₂₁,Δ₁₉,₇,Δ₂₁,₅,Δ₂₁,₉,Δ₂₁,₁₃,Sym²Δ₁₁`; off-diagonal for central order `r`: `−J − rB_F/2` (`r = 1` gives §2.9's `β`); `ζ(1/2) ≈ −1.46 ≠ 0` | holds |
| §8.1 route | `k = 12, 8, 4` | degree counts `1,1,1,2,2,3,3,4,2,2,1,1` = §7.9 weight-12 dims; `k = 8`: one in genus 4 = row `(4,8)`; `k = 4`: none = no rows; `g = 13`: `0 = 0` | holds |
| §8.4 Checks | `T = {p}`, octad `S ∋ p`; `T` = octad; `T = C + {p}`, `S = Ω∖C` | 8 negative / 16 positive; intersections `0, 2, 4, 8`, even; `\|S ∩ T\| = 1`, odd | holds |
