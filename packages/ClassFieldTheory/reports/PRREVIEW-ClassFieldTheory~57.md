# Review of ClassFieldTheory (pull request #1215 at 6aa9b5b)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since 693a416.

- **The folder:** nothing in `TauCetiRoadmap/ClassFieldTheory/` changed. `README.md` and `Suggested.lean` are byte-identical to the head the previous review accepted.
- **The change:** it is outside the folder, in the pull request's own `TauCetiRoadmap/QuadraticFormInvariants/`:
  - `README.md` lines 340–354, 1790–1794 and 1840–1843;
  - `Suggested.lean`, which drops the Layer 6D `example`.
- **Effect on this roadmap:** the change rewrites what QuadraticFormInvariants says this roadmap supplies, so those claims were checked against this README and against the pin. They hold, and no text of this roadmap becomes wrong.
- **Gate:** passes.
- **Findings:** none.

## Previous findings

- None. The previous report (at 693a416) raised no finding. Its only bullet under its own "Previous findings" was R01 of the review at c1d130b, which it marked repaired. README line 305 still carries that repair unchanged: "| TauCetiRoadmap.ClassFieldTheory.WeilGroup | `TauCeti.ClassFieldTheory.WeilGroup` | in the namespace `TauCeti.ClassFieldTheory`, …".

## Verified sound

### The change outside the folder, where it touches this roadmap

QuadraticFormInvariants' supplier contract "From TauCetiRoadmap.ClassFieldTheory" (its README lines 334–355) now makes three claims about this roadmap. Each was checked.

1. **"names the degree-two identification … only as the characteristic-zero existence statement `TauCeti.ClassFieldTheory.h2MuEquivZMod_mixed` (its Layer 5)".**
   - This README names it in Layer 5.1 at line 1082: "`H²(F, μ_n) ≃ ZMod n` for every `n ≠ 0` in mixed characteristic (`h2MuEquivZMod_mixed`)".
   - It also names it at lines 161, 633 and 1471, always as `h2MuEquivZMod_mixed`.
   - At the pin, `Brauer/RootsOfUnity.lean:145` is `theorem h2MuEquivZMod_mixed [CharZero F] (n : ℕ) (hn : n ≠ 0) : Nonempty (continuousCohomology 2 (muNRep n F) ≃+ ZMod n)`. It is an existence statement under `CharZero`, as claimed.
2. **"… and as the transport `TauCeti.ClassFieldTheory.h2EquivZModOfMuNRepIso` … (its table of names used elsewhere)".**
   - README line 290 is the row `h2FpEquivZMod_of_mu → h2EquivZModOfMuNRepIso`, with the difference "assumes `IsUnit (n : F)` and an isomorphism `muNRep n F ≅ T`".
   - At the pin, `RootsOfUnity.lean:156` is `def h2EquivZModOfMuNRepIso (hn : IsUnit (n : F)) {T : GalRep n F} (e : muNRep n F ≅ T) : continuousCohomology 2 T ≃+ ZMod n`. It is defined as the coefficient transport followed by `h2MuEquivZMod`, exactly as the row says.
3. **"The normalized equivalence on `μ_n` itself, `TauCeti.ClassFieldTheory.h2MuEquivZMod` … is Tau Ceti's".**
   - `grep` finds no occurrence of the bare name `h2MuEquivZMod` (without suffix) in this README or in `Suggested.lean`. This roadmap therefore never claimed to supply it, and moving that consumption to "from Tau Ceti directly" contradicts nothing here.
   - At the pin, `RootsOfUnity.lean:89` has `def h2MuEquivZMod (hn : IsUnit (n : F))` under `variable (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]` (line 68).
   - `h2MuToBr` is at `Brauer/Torsion.lean:67`.
   - The QuadraticFormInvariants sentence "defined for every nonarchimedean local field `F : Type` in which `n` is invertible" matches the pin.

**This roadmap's own text about QuadraticFormInvariants stays correct.**
- **Lines 210–225:** QuadraticFormInvariants consumes the Tau Ceti comparisons, and the direction is `ClassFieldTheory → QuadraticFormInvariants`.
- **Lines 2179 and 2214:** QuadraticFormInvariants consumes the cohomological Hilbert symbol of Layer 5, and the comparisons.
- **Why the change does not affect them:** after the change, QuadraticFormInvariants still consumes `muNRep`, `kummerClass`, `kummerCupPairing`, `localSymbol` and `invMap` (Layer 5), and `hilbertProductFormula` (Layer 14). It no longer attributes `h2MuEquivZMod` to this roadmap. None of the three passages mentions `h2MuEquivZMod`.

**The dropped Layer 6D `example`** was the pinned `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`. It uses nothing of this roadmap.

### Citation sweeps over main and the open heads, this round

**Full-name citations.** `roadmaps grep 'TauCetiRoadmap\.ClassFieldTheory\.[A-Za-z_]'`, imports excluded, finds:
- this README's row 305;
- SmoothRepresentationsOfLocalGroups `README.md:5021`, which cites `TauCetiRoadmap.ClassFieldTheory.WeilGroup` and resolves through row 305;
- main's `GlobalQuadraticForms/Suggested.lean:55–92`, which this pull request rewrites in its own folder.

No other roadmap cites a declaration this head drops.

**`ClassFieldTheory\.h2MuEquivZMod\b`.** The hits come from two pull requests, and neither cites the name as this roadmap's:
- **#617**, the later revision of this folder, ordered after this pull request in the description's generated "Shared folders" block. It cites `TauCeti.ClassFieldTheory.h2MuEquivZMod`.
- **ArithmeticGaloisDuality** (README 446, 2216, 3124). It also cites `TauCeti.ClassFieldTheory.h2MuEquivZMod`.

Both cite the Tau Ceti declaration at the pin, `RootsOfUnity.lean:89`.

**Unresolved names.** `scratch/citations.md` lists no cross-roadmap citation and no Lean name found nowhere.

### Gate, dependency check, build

- **Worker's gate** (`scratch/gate.md`): "Every check passed", with `build=0`.
- **Gate rerun** (`gate … ClassFieldTheory --base origin/main`): every folder check is 0 except `outside-folder=5`. All five files are in the pull request's own folders, which the brief names: `GlobalQuadraticForms/README.md`, `GlobalQuadraticForms/Suggested.lean`, `QuadraticFormInvariants/NativeCompletion.md`, `QuadraticFormInvariants/README.md` and `QuadraticFormInvariants/Suggested.lean`.
- **Dependency check, verbatim:** `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` reports no errors. Its only output is six ``declaration uses `sorry` `` warnings, at lines 81, 97, 130, 145, 156 and 170.
- **Signatures:** `scratch/signatures.md` lists 7 declarations (six theorems and `localAbsoluteUpperRamificationGroup`), 0 with dropped binders. The file is unchanged, so the signature comparison of the earlier rounds stands.
- **Pins:** `lake-manifest.json` and `lean-toolchain` are unchanged since 693a416.
- **Remark (no change asked):** outside the three named folders, `git diff --stat origin/main...HEAD` lists only `Completed/LocalGaloisGroups/Suggested.lean` (62+/50−).
  - It was last changed in 1abcd32c, before the previous two reviews.
  - The description explains it: that file imports this roadmap's `Suggested.lean`.
  - It uses `TauCeti.ClassFieldTheory.h2MuEquivZMod_mixed F n hn` (line 329), which matches the pinned signature above.

### Seeded sample

No sampled passage changed, so the locator verification of 0.1–14.1 by the review at c1d130b is carried forward. Two of its locators were re-read this round:
- **milne-adt line 1211 (printed p. 31) and line 1227:** I Theorem 2.8 gives the local Euler characteristic of a finite module of order prime to the characteristic as the inverse index `(R : mR)⁻¹`. This supports the 5.1 Euler-characteristic citation (README line 1106), in the form `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}`.
- **milne-cft line 10924 (printed p. 241) and line 10937:** VIII Theorem 4.2 is the exactness of `0 → Br K → ⊕_v Br K_v → ℚ/ℤ → 0` for every number field. This supports the 10.1 and 14.1 citations (README lines 1694 and 2173).

### Headlines and padding

`Suggested.lean` is unchanged. These carry forward from the previous rounds:
- the six theorems and one definition;
- the module docstring's account of what the pin already proves;
- the one-tactic probe: 24 attempts, 0 closures.

### Overlaps

`scratch/overlaps.md`:
- **Dropped ids:** none is cited, none is defined only by an open revision, and none is dropped.
- **#617 and #1411:** they conflict with this head. The description states the order "This pull request → #1411 → #617" for `ClassFieldTheory` and `LocalGaloisGroups`.
- **The change:** it adds no id and drops none of this folder.

### Adversarial table

Rows for the untouched statements are carried from the previous report (PRREVIEW-ClassFieldTheory~56 at 693a416). Its own rows are marked "(~56)", and the rows it carried from ~55 are marked "(~55)". One new row covers the degree-two identification that the change re-attributes. "Arithmetic" means that a uniformizer goes to arithmetic Frobenius and that `invMap(a ∪ δχ) = v(a)·χ(Frob)`.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| **5.1 `H²(F, μ_n) ≃ ZMod n`** (`h2MuEquivZMod_mixed`, README:1082; QuadraticFormInvariants' re-attribution) — new | `ℚ₂`, `n = 2`; `ℚ₃`, `n = 3` (`p ∣ n`); `ℚ₇`, `n = 3`, unramified cubic class; `n = 1`; `𝔽₃((t))`, `n = 3`; `𝔽₃((t))`, `n = 2` | **`ℚ₂`, `n = 2`:** `H² = Br[2] = {0, ½}`, so `#2`; the class of `(−1,−1)` has invariant `½`, which goes to `1 ∈ ZMod 2`. **`ℚ₃`, `n = 3`:** `IsUnit (3 : ℚ₃)` holds; `Br[3] = {0, ⅓, ⅔}`, so `#3 = #ZMod 3`; the case `p ∣ n` is covered, as line 1082 says. **`ℚ₇`, normalization:** invariant `⅓` goes to `1` (`toRatAddCircle_h2MuEquivZMod`, `RootsOfUnity.lean:103`), whereas the geometric convention gives `2`. **`n = 1`:** both sides are `0`. **`𝔽₃((t))`, `n = 3` (negative control):** `μ₃(Fˢ) = 1`, so `H² = 0 ≠ ZMod 3`; this is excluded both by `CharZero` and by `IsUnit (3 : F)` (`3 = 0`). **`𝔽₃((t))`, `n = 2`:** `h2MuEquivZMod` applies (`2` is a unit) but `_mixed` does not, which matches "in mixed characteristic" here and "odd positive characteristic included" in QuadraticFormInvariants | holds; the hypotheses are load-bearing | none |
| Row 288 `primaryComponent_tateCohomology_eq_bot` (~56) | `G = ℤ × C₂`, `S = C₂`, `A = ℤ[1/2]`, `p = 2`; `A = ℤ`; `p = 6`; `p = 0`; `p = 3` | `Ĥ⁰ = A/2A = 0`, so the component is `⊥`. `A = ℤ`: `ℤ/2 ≠ 0`, so the hypothesis is load-bearing. `p = 6`: `ℤ[1/6]/3 = 0`. `p = 0`: `A = 0`. `p = 3`: the 3-part of `ℤ/2` is `0` | holds | none |
| Row 294 `absoluteGaloisGroupExtend` (~56) | `ℚ(i)/ℚ`; `L = K`; `𝔽_p(t^{1/p})/𝔽_p(t)`; `ℚ₂(i)` | index `2 = finrank`; index `1`; inseparable: no `σ`, so no junk map; index `2` | holds | none |
| Row 305 `WeilGroup` (~56) | `ℚ_p`; Frobenius lift; inertia; `Ẑ ∖ ℤ` coordinate | the same three local-field instances; degree `1`; kernel `I_K`; `W/I ≅ ℤ ⊊ Ẑ` | holds | none |
| 0.1 Nakayama–Rim and Herbrand (~55) | `ℤ[C₂]`; trivial `ℤ` | `ℤ[C₂]`: `Ĥ⁰ = 0` and `Ĥ⁻¹ = 0`. Trivial `ℤ`: `Ĥ⁰ = ℤ/2`, `Ĥ¹ = 0`, `h = 2 = #C₂` | holds | none |
| 1.1 maximal abelian layer (~55) | `S₃`, `V = 1`; `V = G` | `[G,G] = A₃`, `G/A₃ = C₂`; degree `1`, quotient `0` | holds | none |
| 2.1 res, cor, inf (~55) | cyclic `4 → 2`, inflated to `8` | `inv(res u) = ½`; `cor∘res = 2`; inf: `2/8 = ¼` against `1/8` unscaled | holds | none |
| 3.1 Nakayama map (~55) | unramified cubic | `Frob ↦ [π]`, `Frob² ↦ 2 mod 3`; inverse convention gives `1` | holds | none |
| 4.1 quadratic test (~55) | `ℚ₃(√−1, √3)` | `ℚ₃ˣ/ℚ₃ˣ² ≅ V₄`; three distinct nonzero symbols | holds | none |
| 5.1 Euler characteristic (~55) | `ℚ₂`/`μ₂`; `𝔽₃`; `0`; `ℚ₃`/`μ₃` | `8 = 2·2·2`; `3`; `1`; `9 = 1·3·3` | holds | none |
| 5.1 invariant sign (~55) | `ℚ₇`, unramified cubic | `⅓` against `⅔` (geometric) | holds | none |
| 6.1 local reciprocity (~55) | `ℚ₉/ℚ₃`; `ℚ₂(ζ₅)`; `cd` | `Art(3) = Frob`; `ζ₅ ↦ ζ₅²` against `ζ₅³`; `cd₂ = 2` against `1` | holds | none |
| `cyclotomicCharacter_artinMap` (~55) | `ℚ₃`, `u = 4`, `μ₉`; `ℚ₂`, `u = −3`; `ℚ₉`, `u = 2` | `7` against `4`; `5` against `13`; `N(2) = 4`, `4⁻¹ ≡ 7` against `5` | holds | none |
| same, hypothesis automatic (~55) | `X^{ℓ^k} − a`; `v(p) < 0` | `‖f(1)‖ ≤ p⁻¹ < 1`; `1−p` is a unit, a contradiction | holds | none |
| `normResidue_map_unitFiltration` (~55) | `ℚ₃(ζ₉)`, `n = 0,1,2`; `ℚ₂(i)`; Artin–Schreier; unramified | orders `6,3,1` on both sides (lower numbering gives `3`); `U² ↦ 1`; `U⁰ ⊆ N` | holds | none |
| `localAbsoluteUpperRamificationGroup` (~55) | depth `−1`; `ℚ₂(ζ₈)`; `X³−5/ℚ₅`; `ℚ₅(ζ₅)` | `G_K`; images `{1,3,5,7},{1,3,5,7},{1,5},{1}`; `C₃ ↦ 1`; orders `4,1` | determines the object | none |
| `map_artinMap_unitFiltration_eq_upper` (~55) | `n = 0` on `ℚ₃`; `ℚ₃(ζ₉)`, `n = 2` | both sides project to `1`; `1 = G² = 1` | holds | none |
| 7.1 conductor Checks (~55) | `ℚ₂(√2)`, `ℚ₂(ζ₁₂)`, `ℚ₅(μ₅)`, `ℚ₃(ζ₉)` | `3 = 3`; `4 = 2·2`; `3` against `1`; sum `9`, max `2` (lower numbering gives `13`) | holds | none |
| 8.1 conductor of `U(K,n)⟨π⟩` (~55) | `ℚ₂`, `n = 1`; `ℚ₃`, `n = 1`; `ℚ₂`, `n = 2` | `0`; `1`; `2` | holds | none |
| 9.1 Weil transfer (~55) | `𝔽₂((s))/𝔽₂((t))`; unramified quadratic; `ℚ₂(i)` | index `1 ≠ 2`; `deg_K = 2·deg_L`; index `2` | holds | none |
| 10.1 lifting, sum formula (~55) | `ℚ(√13, √17)`; `(−1,−1)/ℚ`; `ℚ(i)` without `∞` | `2 < 4`; `½ + ½ = 0`; `½ ≠ 0` | holds | none |
| 11.1 reciprocity (~55) | `ℚ(ζ₅)`; `ℚ(ζ₇)` | `6 ≡ 1 mod 5`; orders `3` and `6` | holds | none |
| 12.1 Kummer index, moduli, meet (~55) | `ℚ(ζ₃)`; `ℚ(i)`; two `D₄` | `81/9 = 9` (dropping `r` gives `3`); `Cl = 1, 1, ℤ/2`; `8` against `4` | holds | none |
| `isPrincipal_map_hilbertClassField` (~55) | `ℚ`; `ℚ(√−5)`; `⊥` | `H = ℚ`; `𝔭𝒪_H = (1+i)`, `N = 4`; principal | holds | none |
| 13.1 extension of ideals (~55) | `ℚ → ℚ(i)` at `2`, `3` | `(1+i)² = (2)`; `3𝒪_E` | holds | none |
| `count_relDiscr_eq_finsum_abelianConductor_exponent` (~55) | `ℚ(i)`, `ℚ(ζ₈)`, `ℚ(ζ₅)`, `ℚ(√13, √17)`, `ℚ(ζ₉)` | `2`; `8`; `3`; `2`; `9 = 0 + 1 + 4·2` | holds | none |
| `abelianConductor_eq_lcm` (~55) | `ℚ(ζ₈)`; `ℚ(√2)`; product against lcm | `(8)∞`; `(8)`; `2⁸` against `2³` | holds | none |
| 13.1 Hasse and ring class Checks (~55) | `25`; `(−1,3)₃`; `ℤ + 2ℤ[i]`; `ℚ(ζ₇)⁺` | Milne VIII 3.2; `−1`; `h = 1`, disc `−16`; `14/9 < 2` | holds | none |
| 14.1 Hilbert and quadratic reciprocity (~55) | `(−1,−1)/ℚ`; `3, 7`; `5, 13` | `0`; `−1 = (−1)^{1·3}`; `1 = (−1)^{2·6}` | holds | none |

### Library declarations opened at the pin (this round)

Tau Ceti:
- `NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:68, 89, 103, 135, 145, 156`;
- `NumberTheory/ClassFieldTheory/Brauer/Torsion.lean:67`.

### Cross-roadmap citations resolved (this round)

1. QuadraticFormInvariants README:334–355 → this README:161, 290, 633 and 1082.
2. SmoothRepresentationsOfLocalGroups README:5021 → this README:305.
3. Completed/LocalGaloisGroups `Suggested.lean:329` → pinned `h2MuEquivZMod_mixed`.
4. ArithmeticGaloisDuality README:446, 2216 and 3124 → pinned `h2MuEquivZMod`. These are not citations of this roadmap.

## Not verifiable

- The locators cited only as uncertified or waived (serre-local-fields, neukirch-ant, nsw, engler-prestel, artin-tate). They are settled in the manifest, and the change touches none of them.
- `Completed/LocalGaloisGroups/Suggested.lean` was not elaborated. It imports other roadmaps' `Suggested` modules, which are not built in this worktree, and the brief allows building only Tau Ceti modules. It is unchanged since the previous two reviews.

## Source issues

- none
