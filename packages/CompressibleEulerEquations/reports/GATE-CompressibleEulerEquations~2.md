# GATE-CompressibleEulerEquations~2: answers to human review of 4ae1090

Head after repairs: `aea6db3` (one commit on `4ae1090`). Only
`TauCetiRoadmap/CompressibleEulerEquations/README.md` changed; `Suggested.lean` is unchanged.

The review by kim-em (2026-11-24T04:23Z) makes two suggestions; they are H01 and H02. The rest of
the comment assesses the text and asks for no change: the coverage split with Part II, the split
of the null-hypersurface material with LorentzianGeometry, the timelike `B` and the time
orientation, and the counterexample of §8.2. The counterexample numbers were recomputed: for
`p = ρ²` at `ρ = 1/2`, `c = √(2ρ) = 1`, so `v − c = 1` on the left and `v + c = −1` on the right;
`(2, 0)` lies in `{x < −1 + t}` and in `{x > 1 − t}`, with velocities `2` and `−2`. The full-data
version of the Worked example also holds. `D₁ = T_L ∪ ([0, ε) × ℝ) ∪ (T_R ∩ {t < 1})`, with the
§7.3 solution on the slab, is a development: backward causal curves from `T_L` have `x − t`
nonincreasing towards the past, so they stay in `T_L`. Its mirror `D₂` is one too, and they
disagree at `(2, 0)`.

## H01 (kim-em) — applied

§8.1 gains one paragraph (README lines 1867–1873). Data posed on a Λ-invariant closed set `F` with
nonempty interior, as LuoYu2023b lines 658–660 pose them on `{x¹ ≥ 0}` before taking the trace on
the boundary of their domain of dependence, are treated as data on `S = int F`. In a slab `O` of
§8.3, two classical solutions with the same data on `S` agree on `D⁺_O({t₀} × S)` and, by
continuity, on its closure in `O`, so in particular on its boundary there. The Part II bullet of
Downstream consumers (lines 2164–2172) now says that Part II §2.1 compares
`D⁺_O({t₀} × S)`, for regular open `S` such as `{x¹ > 0}`, with the domain of dependence of
`{t₀} × closure S`. This was checked against the Part II README at the head of its open pull
request, §2.1, where `S` is required to be `interior (closure S) = S`.

## H02 (kim-em) — applied

The Rarefaction waves bullet (lines 2179–2185) said "the future domain of dependence of data on a
half-space and its null boundary (§8.3, §8.4) are the carriers of their main theorems". It now
says these, with the trace (§8.1), give the solution to which the rarefaction waves are connected.
It adds that the main theorems are stated on the development of characteristic data on that
boundary and part of a slice `t = δ`, and on centered rarefaction waves: LuoYu2023a line 1458
(data on `Σ_δ^{u*}` and `C₀`) and LuoYu2023b lines 745 and 769 (Corollary 1 on `D(δ)`, Theorem 2).
Finally it says the papers also consume Part II, its §3.3 and Layer 4. The same omission was
repaired in the Shock formation bullet (lines 2174–2178). It cited only §7.2 and §§8.2–8.4,
although Scope and ownership says shock formation consumes both roadmaps. It now adds Part II's
acoustical (eikonal) functions and coordinates, its Layers 1–2. Those papers build on an eikonal
function: Speck2016 line 40, LukSpeck2018 line 64, AbbresciaSpeck2022 line 211 and
Christodoulou2019 line 3490.

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.1: data on closed `F` taken on `S = int F` | `F = {x¹ ≥ 0}`; `F = E`; `F` with empty interior; `F = [−1, 1] ∪ {5}` (`n = 1`) | `int F = {x¹ > 0}`, `E`, `∅` (excluded by "nonempty interior"; `S = ∅` would give only `(∅, ∅)`), `(−1, 1)`. The point `5` has no effect for `t > t₀`, since the classical domain of dependence of a point of `Σ_{t₀}` is the point itself | holds | none |
| §8.1: `int F` is Λ-invariant | `F` Λ-invariant, translation `x ↦ x + λ` a homeomorphism | `int(F + λ) = int F + λ = int F` | holds; this is why the paragraph says "Λ-invariant closed set" | "Λ-invariant" added |
| §8.1: two solutions on `O` with the same data on `S` agree on `D⁺_O({t₀} × S)` | §8.3 largest-development statement applied to `U` and to `U′` | `D⁺′ ⊆ D⁺` with `U′ = U` on `D⁺′`, and symmetrically, so `D⁺ = D⁺′` and `U = U′` there | holds (follows from §8.3 as stated) | none |
| §8.1: they agree on the closure in `O` | constant state `(ρ₀, v₀)`, `S = {x¹ > 0}`, `O = [t₀, t₀ + T) × E` | `D = {x¹ > (v₀¹ + c₀)(t − t₀)} ∩ O`; boundary in `O` is `{x¹ = (v₀¹ + c₀)(t − t₀), t₀ ≤ t < t₀ + T}`, containing the edge `(t₀, x¹ = 0)`; both solutions are continuous on `O`, value the constant state there | holds | none |
| Part II bullet: §2.1 hypothesis `interior (closure S) = S` | `S = {x¹ > 0}`; `S = int F` for closed `F`; `S = (−1, 0) ∪ (0, 1)` | `int{x¹ ≥ 0} = {x¹ > 0}`. For closed `F`, `int F ⊆ int cl(int F) ⊆ int F`, so `int F` is always regular. `int[−1, 1] = (−1, 1) ≠ S` (Part II's own negative Check) | holds; for `F` regular closed, such as `{x¹ ≥ 0}`, `closure S = F` | none |
| Rarefaction bullet: main theorems stated on characteristic data on the boundary and `t = δ` | LuoYu2023a lines 985–989 and 1458; LuoYu2023b lines 740–776 | Main Theorem: "data posed on `Σ_δ^{u*}` and `C₀`", conclusion `𝒟 ⊃ 𝒟(1, u*)`. Theorem 1: data on `Σ_δ`. Corollary 1: solution on `D(δ)`. Theorem 2: rarefaction waves with `(v, c)` on `C₀` equal to the right state | holds | none |
| Rarefaction bullet: these are Part II §3.3 and Layer 4 | Part II README at its head, §3.3 and §§4.1–4.2 | §3.3 says the development `𝒟(δ)` on `Σ_δ ∪ C₀` is one of its developments; §4.1 defines centered rarefaction waves (LuoYu2023b Definition 2.13) | holds | none |
| Shock bullet: also stated against Part II Layers 1–2 | Part II's own Downstream bullet; eikonal functions in Speck2016 line 40, LukSpeck2018 line 64, AbbresciaSpeck2022 line 211, Christodoulou2019 line 3490 | Each paper builds its estimates on an acoustical (eikonal) function. Part II owns these in Layer 1 and the characteristic boundary in Layer 2 | holds | none |

There are no new Lean names and no new targets, and `Suggested.lean` is unchanged. The elaborated
signatures in the worker's `signatures.md` therefore still apply, with 0 lost section binders, and
no `#check @name` re-run was needed. The repair states no new construction, so ownership needs no
new check. All the locators are in LuoYu2023a, LuoYu2023b, Speck2016, LukSpeck2018,
AbbresciaSpeck2022 and Christodoulou2019, which are already in the manifest, so no source request
is needed.

Part II is cited only under Downstream consumers. The §8.1 paragraph points there and does not
cite Part II itself, so no new supplier edge appears. The depcheck confirms this.

## Build

`lake build TauCetiRoadmap.CompressibleEulerEquations.Suggested`: `Build completed successfully
(18246 jobs).`, with 14 `declaration uses 'sorry'` warnings, all from the file's sorry'd headline
theorems.

## Gate

`gate CompressibleEulerEquations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency check

`depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`. There is no UPWARD or CYCLE line, and the count
is the same as before the edits.
