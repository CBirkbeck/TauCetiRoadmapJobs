# Review of ClassFieldTheory (pull request #1215 at 693a416)

**Verdict:** accepted

This is an incremental re-review of 3 changed lines since c1d130b. The only change in the folder is three new rows in the README's table of names used elsewhere (`TauCetiRoadmap/ClassFieldTheory/README.md:288, 294, 305`). `Suggested.lean` is unchanged, and no file outside the folder changed since c1d130b.

- **Previous finding:** the only one (R01) is repaired.
- **New rows:** the two extra rows are correct against the pinned Tau Ceti and against the statements they replace.
- **Gate:** passes.
- **Findings:** none.

## Previous findings

- R01 — repaired: README line 305 now reads "| TauCetiRoadmap.ClassFieldTheory.WeilGroup | `TauCeti.ClassFieldTheory.WeilGroup` | in the namespace `TauCeti.ClassFieldTheory`, with `K : Type u` universe-polymorphic rather than `K : Type` |".

## Verified sound

### The three changed rows, against the pin and against main

All three were elaborated with `#check @…` in one scratch file. It imports `Mathlib` and the four Tau Ceti modules named below, whose object files are built at the pin.

**Row 288: `TateCohomology.primaryComponent_tateCohomology_eq_bot` → `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot`.**
- **At the pin:** `TauCeti/RepresentationTheory/Homological/TateCohomology/PrimaryComponent.lean:81`. The elaborated type is `∀ {k G : Type u_1} [CommRing k] [Group G] (p : ℕ) (A : Rep k G), Bijective (p • ·) → ∀ (S : Subgroup G) [Fintype S] (n : ℤ), AddCommGroup.primaryComponent (tateCohomology (Rep.res S.subtype A) n) p = ⊥`.
- **On main:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:171` carried `[Fact p.Prime]` explicitly. `[Finite G]` came from the section variable at line 144, which a theorem keeps.
- **The row's difference is exact:** no primality, no finiteness of `G`, and `S` finite.
- **The extra generality is sound:** `AddCommGroup.primaryComponent G p` is defined at Mathlib `GroupTheory/Torsion.lean:450` (from line 268) as `{g | ∃ k, p ^ k • g = 0}`, with no prime hypothesis. The proof only needs injectivity of `p •` on Tate cohomology.
- **Consistency:** the row agrees with the README's own Layer 0 bullet (lines 822–824, "for every finite subgroup `S`") and line 174.
- **Who cites it:** `Completed/LocalGaloisGroups/README.md:180, 831, 836` on main. The row is therefore warranted.

**Row 294: `absoluteGaloisGroupExtend` → `TauCeti.absoluteGaloisGroupExtend`.**
- **At the pin:** `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:252`. The elaborated type is `(K : Type u_1) → [Field K] → (L : Type u_2) → [Field L] → [Algebra K L] → (L →ₐ[K] SeparableClosure K) → [FiniteDimensional K L] → G_L →* G_K`.
- **Same map as main:** the body is the same composite as main's `Suggested.lean:1980`: `galoisSubgroupEquiv`, then the inclusion of `galoisSubgroup`, between the two `absoluteGaloisGroupRestrictEquiv` (main's `absoluteGaloisGroupComparison`, row "none"). The explicit arguments come in the same order `K L σ`, and `SeparableClosure` is Mathlib's (`FieldTheory/IsSepClosed.lean:348`) in both.
- **The difference holds:** against main's README statement (Layer 7, local fields, main README:1350–1353), "no local-field hypotheses" is a real generalisation.
- **Consistency:** the row agrees with README:166 and 1229.
- **Who cites it:** `Completed/LocalGaloisGroups/README.md:178, 280, 287, 515, 551` on main.

**Row 305: the Weil group.**
- **At the pin:** `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181`. The elaborated type is `(K : Type u_1) → [Field K] → [ValuativeRel K] → [TopologicalSpace K] → [IsNonarchimedeanLocalField K] → Type u_1`.
- **Same object as main:** it is `localWeilGroup K` (line 91), the preimage of `zpowers` of arithmetic Frobenius under restriction to `K^ur`. Main defined its `localWeilGroup` the same way: the preimage of `ℤ ⊆ Ẑ`, main README:1512.
- **The topology:** it is `instTopologicalSpaceWeilGroup` (`WeilGroup/Topology.lean:78`), characterized by `weilTopology_unique` (line 141, by the open embedding of inertia). That is main's README:1515 characterization.
- **The difference is exact:** against main's statement "for every nonarchimedean local field", the namespace and the universe are the only differences.
- **Consistency:** the row agrees with Layer 9.1 (README:1580–1592).
- **The citation that prompted R01 now resolves:** SmoothRepresentationsOfLocalGroups (#1688) `README.md:5021` cites "`TauCetiRoadmap.ClassFieldTheory.WeilGroup`".
- **No other full-name citation is affected:** `roadmaps grep 'TauCetiRoadmap\.ClassFieldTheory\.[A-Za-z_]'` over main and the 458 open heads finds no other citation of a dropped declaration. The other hits are imports of this module, which the previous review already examined, and main's GlobalQuadraticForms `#check`s, which this pull request rewrites.

**Remark (no change asked).** At the pinned toolchain, a `def` keeps no unused instance-implicit section variable.
- **The probe:** a scratch `def` declared in a section with `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` elaborated to `(K : Type) → [Field K] → …`.
- **Consequence for main:** main's former `absoluteGaloisGroupExtend`, `localWeilGroup` and `WeilGroup` elaborated with no local-field binders at all.
- **Effect on the rows:** none. They compare with main's README statements, which are for local fields, and against those they are exact. The defect was main's, and this head deletes those declarations.

**Remark (no change asked).** Row 294 says the map is "defined for every finite extension". The type of `σ` is empty when `L/K` is inseparable, for example `𝔽_p(t^{1/p})/𝔽_p(t)`. So the map exists for the finite separable extensions, which is all it claims to cover.

### Gate, dependency check, build

- **Worker's gate:** `scratch/gate.md` reports "Every check passed" (`build=0`).
- **Gate rerun:** `gate … ClassFieldTheory --base origin/main` at this head reports every folder check 0 except `outside-folder=5`. All five files are in the pull request's own folders: `GlobalQuadraticForms/README.md` and `Suggested.lean`, and `QuadraticFormInvariants/NativeCompletion.md`, `README.md` and `Suggested.lean`.
- **Dependency check, verbatim:** `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` reports no errors. Its only output is six ``declaration uses `sorry` `` warnings, at lines 81, 97, 130, 145, 156 and 170.
- **Signatures:** `scratch/signatures.md` lists 7 declarations and 0 with dropped binders. The file is unchanged since c1d130b, so the previous review's signature comparison stands.
- **Outside the folder (remark):** `git diff --stat origin/main...HEAD` outside the three named folders lists `Completed/LocalGaloisGroups/Suggested.lean` (62+/50−). It is unchanged since c1d130b. The previous review read the whole diff and found it described in the pull request. `roadmaps grep` lists LocalGaloisGroups among #1215's folders.

### Seeded sample

The changed rows carry no source locators. They touch 0.1, 7.1 and 9.1 only through Tau Ceti declarations, which are verified above. The previous review's locator table for 0.1–14.1 is carried forward. I re-read two of its entries:
- serre1961 lines 931–938, p. 128: Prop. 3 (Herbrand) and the passage to infinite Galois extensions (7.1);
- milne-cft line 4822, p. 107: III Thm 3.1 (4.1/W.2).

### Headlines and padding

`Suggested.lean` is unchanged. These carry forward from the previous review:
- the six theorems and one definition;
- the docstring's list of what the pin proves;
- the 24-attempt one-tactic probe with 0 closures.

### Overlaps

`scratch/overlaps.md`:
- **Dropped ids:** none cited, none only defined by an open revision, none dropped.
- **#617 and #1411:** they conflict with this head. The description's merge order "This pull request → #1410 → #1411 → #617" settles that.
- **The new rows:** they add aliases only and drop no id.

### Adversarial table

Rows for untouched statements are carried from the previous review (PRREVIEW-ClassFieldTheory~55 at c1d130b), marked "(~55)". The three changed rows have new computed values. "Arithmetic" means `χ(Art u) = u⁻¹`, with a uniformizer going to arithmetic Frobenius.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| **Row 288** `primaryComponent_tateCohomology_eq_bot` (new) | `G = ℤ × C₂`, `S = C₂` trivial on `A = ℤ[1/2]`, `p = 2`; negative control `A = ℤ`; non-prime `p = 6`, `A = ℤ[1/6]`, `S = C₃`; `p = 0`; `p = 3`, `A = ℤ[1/3]`, `S = C₂` | `Ĥ⁰ = A/2A = 0`, so the primary component is `⊥`, with `G` infinite. `A = ℤ`: `2·` is not surjective, `Ĥ⁰ = ℤ/2` and its 2-primary part is `ℤ/2 ≠ 0`, so the hypothesis is load-bearing. `p = 6`: `Ĥ⁰ = ℤ[1/6]/3 = 0`. `p = 0`: bijectivity forces `A = 0`, and `primaryComponent(0,0) = ⊤ = ⊥`. `p = 3`: `Ĥ⁰ = ℤ/2`, whose 3-primary part is `{0}` | holds; the row's generality is right | none |
| **Row 294** `absoluteGaloisGroupExtend` (new) | `ℚ(i)/ℚ`, σ the inclusion; `L = K`; `𝔽_p(t^{1/p})/𝔽_p(t)`; `ℚ₂(i)/ℚ₂` | index of the range `= finrank = 2` (`index_range_absoluteGaloisGroupExtend`, `FiniteExtension.lean:318`) with no local-field structure; `L = K` gives index `1`, range `G_K`; inseparable: `L →ₐ[K] Kˢ` is empty, so there is no junk map; `ℚ₂(i)` gives index `2`, as main's local version | holds | none |
| **Row 305** `WeilGroup` (new) | `K = ℚ_p`; an arithmetic Frobenius lift; inertia; an element with coordinate in `Ẑ ∖ ℤ` | the same instances `[ValuativeRel] [TopologicalSpace] [IsNonarchimedeanLocalField]` as main's statement; universe `Type u_1` against `Type`; degree `1` (`weilDegree_eq_ofAdd_one_iff`, `Basic.lean:265`); kernel `I_K` (`ker_weilDegree`, `:290`); not in `W_K`, since `localWeilGroup_ne_top` (`:168`) gives `W/I ≅ ℤ ⊊ Ẑ ≅ G/I` | holds | none |
| R01 (~55): the name table against #1688 | `WeilGroup` on main; at this head; the table | main `Suggested.lean:2697`; this head declares none; the table now has row 305 → Tau Ceti `WeilGroup/Basic.lean:181` | resolves | repaired |
| 0.1 Nakayama–Rim and Herbrand (~55) | `ℤ[C₂]`; trivial `ℤ` | `ℤ[C₂]`: `Ĥ⁰ = 0` and `Ĥ⁻¹ = 0`. Trivial `ℤ`: `Ĥ⁰ = ℤ/2`, `Ĥ¹ = 0`, `h = 2 = #C₂` | holds | none |
| 1.1 maximal abelian layer (~55) | `S₃`, `V = 1`; `V = G` | `[G,G] = A₃`, `G/A₃ = C₂`; degree `1`, quotient `0` | holds | none |
| 2.1 res, cor, inf (~55) | cyclic `4 → 2`, inflated to `8` | `inv(res u) = ½`; `cor∘res = 2`; `inf`: `2/8 = ¼` against `1/8` unscaled | holds | none |
| 3.1 Nakayama map (~55) | unramified cubic | `Frob ↦ [π]`, `Frob² ↦ 2 mod 3`; inverse convention gives `1` | holds | none |
| 4.1 quadratic test (~55) | `ℚ₃(√−1,√3)` | `ℚ₃ˣ/ℚ₃ˣ² ≅ V₄`; three distinct nonzero symbols | holds | none |
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
| 9.1 Weil transfer (~55) | `𝔽₂((s))/𝔽₂((t))`; unramified quadratic; `ℚ₂(i)` | index `1 ≠ 2`; `deg_K = 2deg_L`; index 2 | holds | none |
| 10.1 lifting, sum formula (~55) | `ℚ(√13,√17)`; `(−1,−1)/ℚ`; `ℚ(i)` without `∞` | `2 < 4`; `½+½ = 0`; `½ ≠ 0` | holds | none |
| 11.1 reciprocity (~55) | `ℚ(ζ₅)`; `ℚ(ζ₇)` | `6 ≡ 1 mod 5`; orders 3 and 6 | holds | none |
| 12.1 Kummer index, moduli, meet (~55) | `ℚ(ζ₃)`; `ℚ(i)`; two `D₄` | `81/9 = 9` (dropping `r` gives `3`); `Cl = 1,1,ℤ/2`; `8` against `4` | holds | none |
| `isPrincipal_map_hilbertClassField` (~55) | `ℚ`; `ℚ(√−5)`; `⊥` | `H = ℚ`; `𝔭𝒪_H = (1+i)`, `N = 4`; principal | holds | none |
| 13.1 extension of ideals (~55) | `ℚ → ℚ(i)` at 2, 3 | `(1+i)² = (2)`; `3𝒪_E` | holds | none |
| `count_relDiscr_eq_finsum_abelianConductor_exponent` (~55) | `ℚ(i)`, `ℚ(ζ₈)`, `ℚ(ζ₅)`, `ℚ(√13,√17)`, `ℚ(ζ₉)` | `2`; `8`; `3`; `2`; `9 = 0+1+4·2` | holds | none |
| `abelianConductor_eq_lcm` (~55) | `ℚ(ζ₈)`; `ℚ(√2)`; product against lcm | `(8)∞`; `(8)`; `2⁸` against `2³` | holds | none |
| 13.1 Hasse and ring class Checks (~55) | `25`; `(−1,3)₃`; `ℤ+2ℤ[i]`; `ℚ(ζ₇)⁺` | Milne VIII 3.2; `−1`; `h = 1`, `disc −16`; `14/9 < 2` | holds | none |
| 14.1 Hilbert and quadratic reciprocity (~55) | `(−1,−1)/ℚ`; `3,7`; `5,13` | `0`; `−1 = (−1)^{3}`; `1 = (−1)^{12}` | holds | none |

### Library declarations opened at the pin (this round)

- Tau Ceti:
  - `PrimaryComponent.lean:61, 81`;
  - `FiniteExtension.lean:135, 184, 252, 309, 318`;
  - `AbsoluteGaloisGroup/Basic.lean:327, 340`;
  - `WeilGroup/Basic.lean:82, 91, 161, 168, 181, 265, 290`;
  - `WeilGroup/Topology.lean:78, 141`.
- Mathlib: `GroupTheory/Torsion.lean:268, 450` and `FieldTheory/IsSepClosed.lean:348`.

## Not verifiable

- The locators cited only as uncertified or waived (serre-local-fields, neukirch-ant, nsw, artin-tate), as in the previous review. None is touched by the change.
- `Completed/LocalGaloisGroups/Suggested.lean` was not elaborated. It imports other roadmaps' `Suggested` modules, which are not built in this worktree, and the brief allows building only Tau Ceti modules. It is unchanged since the previous review.

## Source issues

- none
