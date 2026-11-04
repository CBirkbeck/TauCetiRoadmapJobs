# GATE-ClassFieldTheory~1: answers to the review of head 705a0ec

Repairs are two commits on top of `705a0ec`, neither pushed:

- `37e556e5` answers the review (H01–H03).
- `a8e432bd`, "ClassFieldTheory: review repairs (headline-only Suggested.lean on Tau Ceti carriers; README interface, TeX, fence)", repairs the gate failures the worker reported: `set_option`, `tex`, `sorry-data`, `imports`, `long-fences`, and the build warnings from the imported `ProfiniteCohomology` module.

`TauCetiRoadmap/ClassFieldTheory/Suggested.lean` is now the acceptance test the policy asks for:

- 4290 lines are reduced to 17 headline theorems and two definitions with real bodies;
- it has no `set_option` and no roadmap import;
- it has no sorry'd data;
- everything Tau Ceti proves at the pin is cited, not restated.

## H01 (roed-math) — applied differently

The gap was real: no target compared the norm-defined conductors with the upper filtration. It is now closed on native carriers, which the pinned Tau Ceti has:

- `TauCeti.LocalFieldsRamification.upperRamificationGroup` (`NumberTheory/LocalField/Herbrand/Basic.lean:417`);
- `TauCeti.unitFiltration`, `TauCeti.normGroup` and `TauCeti.discriminantExponent`;
- the proved `TauCeti.ClassFieldTheory.normResidue` (`Local/Reciprocity.lean:158`).

Two targets are stated in Lean (Layer 7):

- `normResidue_map_unitFiltration`: `normResidue ∘ mk` maps `U_K^(n)` onto the image of `G^n` in `Gal(L/K)^ab`, for `L/K` finite abelian.
- `discriminantExponent_eq_finsum_characterConductorExp`: `δ(L/K) = ∑ᶠ χ, characterConductorExp K L χ`. Here `characterConductorExp` is a real definition, the least `n` with `U_K^(n)` in the kernel of `Abelianization.lift χ ∘ normResidue ∘ mk`.

The earlier version stated these on this roadmap's sorry'd `normResidue`. It also carried a free family `chi` pinned by an equation. Both are gone.

The global product and lcm formulas (`count_relDiscr_…`, `abelianConductor_eq_lcm`) are not in Lean. They need the conductor of a global abelian extension, and that needs the global Artin map as a carrier. That map exists here only through the existence statement `exists_globalArtinMap`. They stay as README Layer 13 targets, and the module docstring names them as not statable at the pins.

## H02 (roed-math) — applied

The pattern repair the previous round deferred is done.

- **Deleted.** Every declaration of Layers 0–14 that restated or shadowed a Tau Ceti object is gone: 64 sorry'd definitions and every theorem mentioning one. Examples are `invMap`, `brRes`, `localClassFormation`, `localArtinEquiv`, `normResidue`, the absolute `artinMap`, `localNormSubgroup`, `muNRep`, `tateDual` and `tateDualityPairing`.
- **Lean.** The remaining statements use the Tau Ceti declarations directly: `localNormSubgroup`, `normResidue`, `Br`, `finiteInvAt`, `infiniteInvAt`, `GalRep`, `cohomologicalDimensionAt`, `ideleNormMap` and `ideleClassNormMap`.
- **README §3.** It now has two tables: the Tau Ceti declarations consumed, each name checked to exist at the pin, and this roadmap's headline declarations.
- **README §6.** It describes the new file.
- **README §2.3.** The TeX subscripts `inv_{U,V}` and `u_{U,V}` became `inv(U,V)` and `u(U,V)`.
- **README §7.** The 51-line graph fence became a layer/prerequisite table.

## H03 (roed-math) — answered

`Global/IdeleClass/SecondInequality.lean` does not exist at the pinned Tau Ceti, so it cannot be a supplier. The second inequality stays a README Layer 10 target. It is not a headline of `Suggested.lean`, whose global statements go through `exists_globalArtinMap` and the Brauer sequence instead.

## Headline theorems of `Suggested.lean`

**Stated.** Each has its locator in the docstring:

| Layer | Declaration | Locator |
|---|---|---|
| 5 | `eulerCharacteristic_mixed` | Milne ADT I Thm 2.8, `milne-adt` line 1227 |
| 6 | `cohomologicalDimensionAt_…_eq_two`, `strictCohomologicalDimensionAt_…_eq_two` | Milne ADT I Remark 1.12 (line 983), Cor 2.3 (line 1138) |
| 7 | `normResidue_map_unitFiltration`, `characterConductorExp`, `discriminantExponent_eq_finsum_characterConductorExp` | see note below |
| 8 | `localAbelianExistence`, `…_primeToResidueCharacteristic` | Milne CFT III Thm 5.1 (`milne-cft` line 5186), I Thm 1.4 (line 1275) |
| 10 | `finite_support_finiteInvAt_and_sum_localInv_eq_zero`, `eq_zero_of_forall_localInv_eq_zero`, `exists_br_of_sum_eq_zero` | Milne CFT VIII Thm 4.2, line 10937 |
| 11 | `exists_globalArtinMap` | Milne CFT V Thm 5.3, line 8123; V Thm 3.5, line 7041 |
| 12 | `globalAbelianExistence`, `ideleClassNormMap_range_le_iff` | Milne CFT V Thm 5.5, line 8152; Cor 5.6, line 8162 |
| 13 | `cyclicHasseNorm` | Milne CFT VIII Thm 3.1, line 10629 |
| 13 | `exists_hilbertClassField` | Milne CFT V Example 3.9, line 7092 |
| 13 | `kroneckerWeber` | Milne CFT I Thm 4.16, line 2541 |
| 14 | `quaternionNormForm`, `hilbertReciprocity` | Milne CFT V Example 5.4, line 8142; VIII Thm 4.2 |

Note on Layer 7: the locators are Neukirch V Thm 6.2 and Serre *Local Fields* IV §1, VI §2 and XV §2. All are uncertified (paywalled) and are carried over from the README.

**Named in the module docstring as not statable at the pins:**

- The local Weil group and its reciprocity isomorphism. Mathlib and Tau Ceti have no Weil-group carrier with its own topology; a grep for `WeilGroup` and "Weil group" finds only Mordell–Weil.
- The global conductor–discriminant formula and the description of class fields by admissible moduli. These need the global Artin map as a carrier.

## Adversarial pass

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| `eulerCharacteristic_mixed` | `n = 1`, `A = 0` | `1 / 1·1·p⁰` | holds |
| | `ℚ_p`, `p` odd, `A = ℤ/p` trivial | `#H¹ = p² / p·1·p¹` (`H² = μ_p(ℚ_p)^∨ = 0`) | holds |
| | `ℚ_2`, `A = ℤ/2` | `8 / 2·2·2` | holds |
| | `ℓ ≠ p`, `ℓ ∤ p−1`, `A = ℤ/ℓ` | `ℓ / ℓ·1·1` | holds |
| `cd`, `scd = 2` | `ℓ = p` and `ℓ ≠ p` over `ℚ_p` | `H²(G, μ_ℓ) ≅ ℤ/ℓ ≠ 0` gives `≥ 2`; Remark 1.12 gives `scd ≤ 2` | holds (`2 = 2`) |
| `normResidue_map_unitFiltration` | `L = K` | trivial / trivial | holds |
| | unramified, `n = 0` | units are norms; `G^0 = 1` | holds |
| | `ℚ_2(i)`, `n = 1, 2` | image `G` (`−1` is not a norm) / `G^1 = G`; image `1` / `G^2 = 1` | holds; a shift `G^{n−1}` fails at `n = 2` |
| `characterConductorExp` | trivial `χ` | `0` (`U^0` is in the kernel) | correct |
| | ramified quadratic `χ` of `ℚ_2(i)` | `2` | correct |
| | set of levels empty | never: the kernel contains the open `normGroup` | no junk `sInf ∅` |
| `discriminantExponent_eq_finsum_…` | `L = K` | `0 / 0` | holds |
| | `ℚ_2(i)` | `2 / 0+2` | holds |
| | `ℚ_2(√2)` | `3 / 0+3` | holds |
| | `ℚ_p(μ_p)` | `p−2 / (p−2)·1` | holds |
| | `ℚ_2(ζ₁₂)` | `4 / 0+0+2+2` | holds; the different exponent `2` on the left would fail |
| `localAbelianExistence` (both scopes) | `N = Kˣ` | `V = ⊤`, norm group `Kˣ` | holds |
| | `N = (Kˣ)²` in `ℚ_p`, `p` odd | index 4, the biquadratic layer | holds |
| | prime-to-`p` scope, `p`-power index | excluded by the coprimality hypothesis | — |
| Brauer sequence (three theorems) | `x = 0` | `0 / 0` | holds |
| | Hamilton `(−1,−1)/ℚ` | `inv₂ = inv_∞ = 1/2`, sum `1 = 0` | holds |
| | `f = 1/3` at 2, `2/3` at 3, `g = 0` | a degree-3 cyclic algebra exists | holds |
| | complex `g = 1/2` | excluded by `_hcomplex` | — |
| `exists_globalArtinMap` | `L = K` | `φ = 1`; `IsArithFrobAt` for `id` is `x ≡ x^q mod Q` on `𝓞/Q = 𝔽_q` | holds |
| | `ℚ(i)/ℚ`, `v = 3` | inert, so Frobenius `≠ 1`; `3 ∉ Nm` locally (odd valuation) | consistent |
| | geometric normalization | `σx ≡ x^{1/q}` fails `IsArithFrobAt` at `ℚ(ζ₅)`, `v = 2` | excluded |
| `globalAbelianExistence` | `N = C_K` | `L = K` | holds |
| `ideleClassNormMap_range_le_iff` | `L₁ = K` | `Nm C_{L₂} ≤ C_K`; `K ↪ L₂` | true ↔ true |
| | `L₂ = K` | `C_K ≤ Nm C_{L₁}` iff `L₁ = K`; `L₁ ↪ K` iff `L₁ = K` | holds |
| `cyclicHasseNorm` | `L = K` | both sides true | holds |
| | `ℚ(i)`, `x = 3` | not `a² + b²` / not a local norm at 3 | false ↔ false |
| | `ℚ(√13, √17)`, non-cyclic | the classical counterexample | `IsCyclic` is load-bearing |
| `exists_hilbertClassField` | `K = ℚ` | `H = ℚ`; trivial groups; Minkowski gives maximality | holds |
| | `ℚ(√−5)` | `H = K(i)`, degree `2 = h`; Frobenius of the nonprincipal prime above 2 or 3 is `≠ 1` | holds |
| `kroneckerWeber` | `ℚ`, `ℚ(√5) ⊆ ℚ(ζ₅)` | witnesses `n = 1, 5` | holds |
| `hilbertReciprocity` | `a = 1` | form isotropic everywhere; count `0` | even |
| | `a = b = −1` over `ℚ` | anisotropic at 2 and at `∞`; count `2` | even |
| | `a = −1`, `b = 3` | ramified at 3 and `∞`; count `2` | even |
| `quaternionNormForm` | `⟨1, −a, −b, ab⟩` with `a = 1` | `x² − y²` part is isotropic | matches split `(1, b)` |

**Context.** Every declaration carries its binders in its own signature: the file has no `variable` block and no section instances.

**Signature check.** I appended `#check @…` for all 19 declarations to the file, elaborated once, and reverted. Every elaborated type matches its README statement. The check led to two corrections:

- **`exists_hilbertClassField`.** `IsArithFrobAt` failed to synthesize `SMulCommClass Gal(H/K) (𝓞 K) (𝓞 H)` while `IsAbelianGalois` was a conjunct. It is now an `∃` instance binder.
- **`localAbelianExistence_primeToResidueCharacteristic`.** The residue-field notation needed `open scoped ValuativeRel`.

## Sources

- **Fetched this round.** Milne, *Class Field Theory* v4.03 (`milne-cft`, author page) and Milne, *Arithmetic Duality Theorems* (`milne-adt`, author page). Every locator in the tables above was read there.
- **NSW, *Cohomology of Number Fields*.** The fetch returned only the author's index page, so the Lean docstrings no longer cite NSW for `cd`/`scd`; they cite Milne ADT instead.
- **Uncertified, cited by locator only.** Neukirch and Serre *Local Fields*.
- **Manifest.** No `needs-references.toml` request is needed. The roadmap still has no `sources.toml`, and this job may not create one.

## Ownership and citations

- Every Tau Ceti name in README §3 was checked to exist at the pin (file-level grep). None of `Suggested.lean`'s declarations reuses the qualified name of a declaration in a readable roadmap.
- Ownership against open pull requests was checked through the listed checkouts and `roadmaps grep` only for the objects added in H01.
- No supplier edge changed.

## Build and gate

- **Build.** `lake build TauCetiRoadmap.ClassFieldTheory.Suggested`: Build completed successfully (9458 jobs). The 17 theorems give 17 `declaration uses sorry` warnings. There are no other warnings: the `ProfiniteCohomology` linter warnings came from the deleted roadmap import.
- **Gate summary line.** `gate ClassFieldTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`
- **The one remaining failure.** It is `depcheck: NOT IN ORDER: ClassFieldTheory (insert it after its last supplier)`, the board's to settle. The `--movable` check against the worker's `ORDER.txt`, where ClassFieldTheory is line 349, prints `depcheck: 152 roadmaps, 1022 edges, 0 problem(s)`: no UPWARD or CYCLE line.
- **Residual, not addressed.** README Layers 0–14 and §5 still name many intended targets in backticks (for example `localArtinMap_uniformizer`, `globalArtinMap_Qi_prime`), none of them declared in `Suggested.lean`. The gate's `readme-ids-missing` check does not flag them, but the house rule reserves backticked own-names for declared ones. Rewording them into prose is a whole-README pass beyond this repair.

No text in the review asked for anything outside the job.
