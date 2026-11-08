## H01 (roed-math) — applied differently

The layer-number citations "LocalFieldsRamification, Layer(s) 1–2" at `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md` lines 19, 58, 1027, 1063, 1071, 1073 and 1139 now cite the pinned Tau Ceti declarations that realize that material, with files: `TauCeti.unitFiltration`, `TauCeti.card_squareClasses`, `TauCeti.unitFiltration_le_range_powMonoidHom_two_iff`, `TauCeti.IsUnramified`, `TauCeti.isUnramified_iff_etale`, `TauCeti.existsUnique_isUnramified_finrank_eq`, plus the dyadic `TauCeti.card_squareClasses_padic_two`, `Padic.not_isSquare_five` and the two `SerreSigns.lean` unit-class theorems. LocalFieldsRamification stays named as owner, without a layer number. The diagnosis is correct: at #617's head, Layers 1–2 are Sen's congruence and Hasse–Arf, and its own "former layer numbers" table sends old Layer 1 to *Units*/*Power classes*/§0.3 and old Layer 2 to *Unramified extensions*. The suggested fix (depend on #617 and cite its new structure) is not used, because #617 revises a roadmap already on main, and such a revision may not be a dependency. Citing the declarations is valid on main now and after #617 merges, since both versions place this material in Tau Ceti. Every named declaration was checked at main's pin (Tau Ceti `2fd255d9`).

## H02 (roed-math) — applied

`README.md` line 74 now credits K3SurfacesAndSymplecticBoundedness §6.0b only with the fibre root quotients and the Jacobian comparisons: J has no multiple fibres, R¹j_*O_J is invertible, and χ(O_X)=χ(O_J), including the quasielliptic case. The carrier, canonical formula and regular Jacobian are cited to NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 4.1–4.2 and 4.17. The same split is applied at line 20 (scope) and at the last sentence of line 75. Two related citations also changed:
- Line 1181: "§6.0b for field change of the Enriques pencil" → NeronModelsAndSemistableAbelianVarietiesPartII §2.1.
- Line 1189: χ, the absence of multiple fibres and invertibility now come from §6.0b; R¹j_*O=O(−1) comes from NeronModelsAndSemistableAbelianVarietiesPartII §4.2 with T=0; ω_J=O(−F) comes from its §4.1.

The source is K3SurfacesAndSymplecticBoundedness at #1375 head `c1d6da06`, `README.md` lines 777–853. Its §6.0b opens by consuming genus-one theory from NeronModelsAndSemistableAbelianVarietiesPartII and owns only the root quotients, Jacobian comparisons, numerical laws, quasielliptic unirationality and rank-five pencils. NeronModelsAndSemistableAbelianVarietiesPartII (#870) was read: §2.1 is the carrier with field change, §§4.1–4.2 the canonical formula with torsion T and the Hodge-line degree, §4.17 the regular minimal Jacobian.

## Additional repairs needed for the build and gate

- **E₈ carrier missing at main's pin.** `Suggested.lean` imported `RootLattice/D8Plus/Basic.lean` and used `IntegralLattice.d8PlusLattice`. Neither exists at main's Tau Ceti pin `2fd255d9`, where the spinor-glue model is `IntegralLattice.checkerboardPlusLattice` and the worker's signature elaboration failed on that missing object file. `enriquesNumericalLattice` is now `hyperbolicPlane.orthogonalSum (-typeE₈RootLattice)`. That model is isometric to the old one (`typeE₈IsometryD8Plus`), so every statement on it keeps its truth value. The import is `RootLattice.D8Plus.Isometry`, the one module that exists at both the branch's manifest pin `a91d3aaf` and main's pin and publicly imports the module defining `typeE₈RootLattice` (`RootLattice.TypeE` at `a91d3aaf`, `RootLattice.TypeE.Basic` at `2fd255d9`). Once the branch's manifest reaches main's pin, it can import `TypeE.Basic` directly. The README is updated to match at lines 54, 144, 604 and 635.
- **Pins.** `README.md` and the `Suggested.lean` docstring now name main's pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The `IntegralLattice` structure locator moved from line 63 to line 61. `card_squareClasses_padic_two` is still at `SquareClass.lean` line 128.
- **Gate statement-hygiene.** The two P3 findings (the theorems concluded `Nonempty (… ≃+ ZMod 2 × ZMod 2)`) are repaired. `firstLattice_discriminant_group` and `secondLattice_discriminant_group` now state `Nat.card … = 4 ∧ AddMonoid.exponent … = 2`. For a group this is equivalent to being isomorphic to (ℤ/2)². README lines 1591 and 1616 now say so, and §6.2 has a new negative-control Check: the Gram matrix [−4] has order 4 but exponent 4.

Citations were checked by hand for this round. "IntegralLattices Layer 6, milestone 6A" exists on main (`TauCetiRoadmap/IntegralLattices/README.md` line 1643) and at #1239's head, so the "only an open revision defines" lead in the overlap file is a false positive. No citation now depends only on an open revision.

The new suppliers K3SurfacesAndSymplecticBoundedness and NeronModelsAndSemistableAbelianVarietiesPartII are both new-roadmap pull requests earlier in the merge order. No construction is added here, so there is no new ownership question. Ownership of the cited objects was checked against main, #617, #1239, #1375 and #870; other open pull requests without supplied checkouts were not checked for ownership. `roadmaps resolve` on the final README finds no unresolved cross-roadmap citation or Lean name. Its library lookup was unavailable on this host, so every changed Tau Ceti and Mathlib name was grepped directly at main's pin.

## Signature check

All ten declarations plus `TauCeti.IntegralLattice.typeE₈RootLattice` were run through `#check @name`: the lines were appended to `Suggested.lean`, built with the brief's command, then removed. The file has no `variable` block, so no binders were dropped. Each elaborated type matches its README statement:
- `positive_cone_decomposition`: elements of the carrier with h²>0, d²>0, d·h>0, and both summands nonzero with nonnegative square and positive pairing.
- `dyadic_square_classes`: `x ≠ 0` and `∃!` over `Fin 2 × Fin 2 × Fin 2`.
- The two discriminant theorems: `Nat.card … = 4 ∧ AddMonoid.exponent … = 2`.

The only Lean changes are the carrier and the two conclusions.

## Adversarial pass on changed statements

| Statement | Instances | Computed values | Result; change |
| --- | --- | --- | --- |
| `enriquesNumericalLattice` (new E₈ block) | Mathlib `CartanMatrix.E 8` negated, plus U | det E₈=1, det(U⊕E₈(−1))=−1, signature (1,9), diagonal 0,0,−2⁸; e²=0, e·f=1, (e+f)²=2, simple root r²=−2, (e+f)·r=0 | Unimodular even (1,9); README Checks still hold; carrier changed |
| `positive_cone_decomposition` | 5 fixed pairs and 4 random pairs in U⊕E₈(−1) (scratch search) | h=d=e+f: split f,e with squares 0,0, pairings 1,1. h=e+f, d=2e+f+r₁: split e, e+f+r₁, squares 0,0, pairings 1,2. h=e+5f, d=e+f: pairings 1,5. h=e+2f+r₁, d=3e+f+r₁+r₃ (d²=4, d·h=6): split e, rest, squares 0,2, pairings 2,4. Random pair h²=2, d²=12, d·h=13: squares 0,6, pairings 2,11. Negative control d=−(e+f): d·h=−2, no split | Holds in all 9; matches Lang1983 line 760 (Theorem 4.2: h²>0, d²>0, d·h>0); unchanged |
| `firstLattice_discriminant_group` | N₁ (equals `firstGram` entrywise) | det −4, rank mod 2 = 8, 2N₁⁻¹ integral, N₁⁻¹ not integral, lcm of inverse denominators 2 | Order 4, exponent 2; [−4] gives order 4, exponent 4 and is rejected; restated |
| `secondLattice_discriminant_group` | N₂ (equals `secondGram`) | det −4, rank mod 2 = 8, 2N₂⁻¹ integral, N₂⁻¹ not integral | Order 4, exponent 2; restated |
| `card_squareClasses` contract (README line 58) | ℚ₂, ℚ₃ | 4·2¹=8 and 4·3⁰=4 | Agrees with `card_squareClasses_padic_two`; added |
| Local square theorem (README line 58) | ℚ₂ | v(2)=1, so U(ℚ₂,n) ⊆ squares iff n≥3; 5∈U(ℚ₂,2) is not a square (`Padic.not_isSquare_five`) | Agrees; added |
| Class-five étale model (README line 58) | z²−z−1 | discriminant 1+4=5; reduction z²+z+1 irreducible over 𝔽₂ | Agrees; unchanged |
| §4.2 Jacobian route (README line 1189) | Jᵍ over k̄, χ(O)=1, T=0 | deg L=−χ−length T=−1, so L=O(−1); ω_J=j*(O(−2)⊗O(1))=O(−F) | Agrees with NeronModelsAndSemistableAbelianVarietiesPartII §§4.1–4.2; attribution changed |

## Build and gate

`lake build TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence.Suggested` succeeded: "Build completed successfully (9040 jobs)", exit 0. There were four warnings, all "declaration uses `sorry`", at lines 51, 69, 117 and 123.

Gate summary line, after commit `4cf6a98b`:

`gate EnriquesSurfacesAndIntegralNonexistence: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

The dependency check (`gate --depcheck … --movable`) reported `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

No sources were fetched and no `needs-references.toml` entry was written. The locators used are SCH23 §12 matrices (14) and (16), already cited, and Lang1983 line 760, re-read in the cache.
