# FIX-PKG-KloostermanMomentsAndPotentialAutomorphy~4

This round repairs the five findings of `REV-PKG-KloostermanMomentsAndPotentialAutomorphy~3`
(one P1, three P2 and one P3). I checked each finding against the supplier texts at their current
heads, FSY, the MixedHodgeModulesAndIrregularHodgeTheory board package and the pinned Mathlib. All
five are correct. All five are applied as asked; the only extra is that F02 also says where the
regularity of `M` comes from. Only `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`
changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged:
no headline, Lean name or supplier gap is affected.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~3/F01 (P1) — applied

Verified at PadicDifferentialEquationsAndRigidCohomology §RD.6.53, read at its pull-request head. The
supplier states `r·χ(U) − Σ [κ(z):F]·Irr_z` with `χ(U) = 2 − 2g − Σ [κ(z):F]`, for `C` geometrically
connected.

Change, old → new. Contract (l. 236): `r·χ(U) − Σ_z Irr_z(E)` → `r·χ(U) − Σ [κ(z):F]·Irr_z(E)`, with
`χ(U)` defined, `C` geometrically connected, `Z ≠ ∅` and `H² = 0`; the `𝔾_m` case is kept. New §2.3
Check (l. 799): `ℙ¹_ℚ ∖ {x²+1}`, `E^{1/(x²+1)}` has index `−2`, as over `ℚ(i)`, where the old formula
gives `−1`.

Pattern: the other uses (§2.3 index Check, §5.5) are on `𝔾_m`, whose boundary points are rational,
so they are unchanged. CongruenceSpectralGap's `deg(x)·Sw_x` was already weighted.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~3/F02 (P2) — applied

Verified. MixedHodgeModulesAndIrregularHodgeTheory §6.6 (board package, l. 652) needs a regular `N`
in `FT ΠN ≅ (FT N)(∗0)`. At `r = 2`, `k = 1`, `j_{0,!*}K̃l₂` has factors `E^{±2t}` at `∞`
(irregularity 2). FSY lines 679–689 take regularity from the Gauss–Manin side.

Change, old → new:
- Contract (l. 275): "on regular inputs" → the `N`-form for regular `N`; regularity is on `N`, not on
  `FT N`.
- §3.6 (l. 1054): a new bullet derives the regularity of `M` from `H⁰g_+O` (MHM §§4.6, 6.6;
  Springer §9.7), and the `ΠM` bullet now applies §6.6 to `M`.
- A new `k = 1` Check, and the Needs line updated.

No supplier gap is needed.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~3/F03 (P2) — applied

Verified. MHM §6.1 (l. 568) excludes nonzero constants from EMHS, and §6.2 kills them. FSY line 698
(Proposition 2.21) puts the weight `2k + 1` in `MHM(𝔸¹)`, and lines 761–766 give the variation
weight `2k`.

Change, old → new, in §3.6:
- "pure of weight `2k + 1` as an exponential structure" → "as a mixed Hodge module on `𝔸¹`
  (`a^*V[1]`, `V` of weight `2k`)";
- the theorem text names `M′^H`;
- a new Check at `k = 1`: `RΓ = ℚ(−1)[1] ≠ 0` and `ΠM′^H = 0`, with weights 3, 2 and 4 (the class
  `(2,2)` of §6.4).

Pattern: the phrase occurs nowhere else.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~3/F04 (P2) — applied

Verified. FSY line 2005 defines the open `K′` inside `Bl_S 𝔾_m^k`, and line 2024 its closure `K̄′`
inside `Bl_S X`. At `k = 4`, `gr²H³_c(K)^χ` is one-dimensional (FSY lines 1997–1999), while the
smooth projective `K̄′` has pure `H³`.

Change, old → new. §7.3 (l. 1684): "strict transform `K′` of `K̄`" → over `ℤ[1/2]`, two resolutions:
- the open `π : K′ → K`, carrying (5.18);
- the proper `π̄ : K̄′ → K̄`, an instance of §7.1's `Y` with `K̄′ ∖ K′ ≅ D`, carrying (5.19)–(5.20).

The `k = 4` Check now reads: open dimension 1, proper dimension 0.

Pattern: §7.4 (l. 1740), the §8.4 sketch (l. 1895) and §9.1 (l. 1991) now name both spaces.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~3/F05 (P3) — applied

Verified at the pin:
- `Mathlib/NumberTheory/EulerProduct/Basic.lean:225` requires `f 0 = 0`;
- `Mathlib/NumberTheory/LSeries/Basic.lean:74` makes `LSeries.term` vanish at `n = 0`.

Change, old → new. §10.4 (l. 2165): "applied to `n ↦ eulerCoeff L n·n^{−s}`" →
"applied to `f = LSeries.term (eulerCoeff L) s`". The bullet also names where each hypothesis comes
from (`Complex.natCast_mul_natCast_cpow`, `summable_norm_iff`, normalization at `j = 0`), and the
contract and Needs line add these names. New Check (l. 2187): for `L = 1`, `s = 0` the raw sum is 2,
the series and product 1.

## Checks run

- **Elaboration.** `lake env lean packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean`,
  run from the content checkout, exits 0. Its only output is the four expected
  `declaration uses 'sorry'` warnings, at lines 90, 109, 191 and 206. There are no `TauCeti.*`
  imports, so nothing had to be built.
- **Signatures.** A scratch copy of the file with `#check @name` for all 21 declarations elaborated
  with exit 0. I compared each elaborated type with its README statement: every binder and
  hypothesis is present (`[Field F] [Finite F]`, `[Fact p.Prime]`, `0 < k`, `Odd k`, `Even k`,
  `0 < k`), and nothing changed from the previous signatures. Three scratch `example`s compiled
  and confirm the F05 witness: `eulerCoeff (fun _ => 1) 0 = 1`, the raw zero-index summand at
  `s = 0` equals 1, and `LSeries.term … 0 0 = 0`.
- **Depcheck.** The command output was exactly:

  ```text
  depcheck: 236 roadmaps, 2153 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` gives one lead: "164: MixedHodgeModulesAndIrregularHodgeTheory
  §2.1: no roadmap …". It is a false positive: this is the board package
  `packages/MixedHodgeModulesAndIrregularHodgeTheory`, earlier in the merge order, whose §2.1 is at
  its l. 212. The new Mathlib names (`LSeries.term`, `summable_norm_iff`,
  `Complex.natCast_mul_natCast_cpow`) were checked by hand at the pin:
  `LSeries/Basic.lean:74`, `Analysis/Normed/Module/FiniteDimension.lean:605` and
  `Analysis/SpecialFunctions/Pow/Complex.lean:202`, inside `namespace Complex`.
- **Gate failures.** None were listed for this round.

## Adversarial pass on changed statements

| Statement | Instances | Values (left / right) | Result; change |
|---|---|---|---|
| §RD.6.53 contract | `ℙ¹_ℚ∖{x²+1}`, `E^{1/(x²+1)}`; `𝔾_m`, `O`; `𝔾_m`, `Kl_r`; `𝔸¹`, `E^x`; `Z = ∅` on `ℙ¹` | `−2 / 0−2·1 = −2` (old: `−1`); `1−1 = 0 / 0`; `0−1 / −1`; `0−0 / 1·1−1 = 0`; `Z = ∅`: `H² ≠ 0` (`1−0+1 = 2`), hence excluded | Residue degree and `Z ≠ ∅` added |
| MHM §6.6 contract and §3.6 `ΠM` | `N = δ₀`; `N = O`; `r = 2`, `k = 1` | `FT δ₀ = O`, `O(∗0) = FT K`, so `Πδ₀ = K`; `δ₀(∗0) = 0`, so `ΠO = 0`; `M` has rank 1 and is regular, `FT M` has Irr 2, `ΠM` has rank 2 | Input moved to `M` |
| Regularity of `M` | `r = 2`, `k = 1` | `N = g_*O` rank 2, so `(ΠN)^χ` rank 2 contains `M` of rank 1; subquotients stay regular | Route stated |
| `M′^H` weights | `k = 1`, `k = 3` | `k = 1`: module 3, `V` 2, `H¹` 4 with type `(2,2)`; `k = 3`: 7, 6, 8 with type `(4,4)`, as in the §6.4 Check | Category corrected |
| `M′^H ∉ EMHS` | `k = 1` | `RΓ = ℚ(−1)[1] ≠ 0`; `ΠM′^H = 0`; `ΠM^H` has weights `1, 3`, so it is not pure | Check added |
| §7.3 open/proper | `k = 4`, `6`, `2`; `p = 2` | `binom(4,2) = 6`, `binom(6,3) = 20` points; open `gr²` 1 vs proper 0 at `k = 4`; `k = 6`: correction `0 = δ₄∣₆`, `d₆ = 2`; sections collide mod 2, hence `ℤ[1/2]`; `S ∩ D = ∅`, so `K̄′∖K′ ≅ D` | Two spaces defined |
| §7.4 even bullet | `k = 4`, `6` | `χ`-kernel dimensions `0 = d₄` and `2 = d₆` | Uses `K̄′` |
| §10.4 Euler product | `L = 1` with `s = 0` and `s = 2`; `(1−a_pT)⁻¹`; `L(2) = 2` | raw `2` vs `1`; raw `f(0) = 0^{−2} = 0` (Lean) but undefined mathematically; `f(p^j) = a_p^j p^{−js}`; product `2` vs `1` (normalization needed) | `LSeries.term` |

## Ownership and suppliers

This round adds no new construction; it corrects contracts and the definition of spaces this
roadmap already owned (§§3.6 and 7.3). So no new ownership question arises. The suppliers consumed
were read at their heads with the roadmaps tool:
- PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a–RD.6.53;
- SpringerResolutionAndCharacteristicCycles §9.7, which supplies closure of regular holonomic
  modules under subquotients;
- the board package MixedHodgeModulesAndIrregularHodgeTheory, §§4.6, 5.1 and 6.1–6.6.

None of them is later in the merge order. Ownership against the open pull requests that the brief
names without files was not rechecked this round.

## Notes for the maintainer

- The MHM package's §6.6 has an ambiguity of its own: its "equivalently … on regular inputs" clause
  can be read as requiring the transform to be regular. This roadmap now consumes only the
  unambiguous `N`-form. The maintainer of that package may want to say "on modules whose inverse
  transform is regular".
- No §-number, target or Lean name of this roadmap changed. §7.3 keeps its number and now defines
  both `K′` and `K̄′`, so other roadmaps' citations are unaffected.
- The review's "Source issues" list concerns FSY, XZ and Serre-orthogonal, not this roadmap. The
  README's "Corrections to the sources" already covers the ones it relies on.
