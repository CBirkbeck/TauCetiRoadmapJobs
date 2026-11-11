# FIX-RT-LefschetzPencilsAndVanishingCyclesPartII~1

Red-team round 1, two passes. Pass `RT-LefschetzPencilsAndVanishingCyclesPartII~1a` returned
"accepted" with no numbered finding: it lists only source issues (Poonen, Theorem 3.3 in
projective dimension one; the Kisin–Zhou citation of Poonen's Corollary 3.4), and the README
already does not repeat either as an assertion of this package (Scope "Not in this roadmap" and
"Downstream consumers"). Nothing in pass a needs a section below. Pass
`RT-LefschetzPencilsAndVanishingCyclesPartII~1b` has two findings; both were verified at the pins
and applied. The findings do not overlap.

## RT-LefschetzPencilsAndVanishingCyclesPartII~1b/F01 (P2) — applied

Verified: pinned Tau Ceti (`2fd255d`) proves `AlgebraicGeometry.Smooth.exists_etale_affineSpace`
(`TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean:98`, no `sorry`; affine
neighbourhood, étale map to `𝔸(ULift (Fin n); S)` over `S`), and the open revision of
SchemeAndStackFoundations itself maps `etale_coordinates` to that declaration.
Old → new: SchemeAndStackFoundations §0.8 `etale_coordinates` ("assumed" affine form) → Tau Ceti
`AlgebraicGeometry.Smooth.exists_etale_affineSpace`, in the diagram, ownership sentence,
owned-elsewhere bullet, supplier contracts, §2.4 step 1 and *Needs*, Layer 2 Dependencies and
References. `rational_point_component` stays (04KV is at neither pin).

## RT-LefschetzPencilsAndVanishingCyclesPartII~1b/F02 (P3) — applied

Verified: `AffineSpace (n : Type u) (S : Scheme.{u})` (`Mathlib/AlgebraicGeometry/AffineSpace.lean:43`),
so `AffineSpace (Fin m) (Spec k)` is ill-typed for `k : Type u`, `u ≠ 0`; the instance is about
`𝔸(n; S) ↘ S`, not `Spec k[T] → Spec k`. Changed: Convention 2 now uses
`𝔸(ULift.{u} (Fin m); Spec k)` with `SpecIso`, `renameEquiv`/`Equiv.ulift`, `uniqueAlgEquiv`;
§2.2, §2.4 and the Mathlib contract cite `smoothOfRelativeDimension_fin` with that transport.

## Outcome of the checks

- **Elaboration.** `lake env lean packages/LefschetzPencilsAndVanishingCyclesPartII/Suggested.lean`
  from the content checkout: exit 0; four warnings `declaration uses 'sorry'` (lines 55, 66, 81,
  105), nothing else. `Suggested.lean` is unchanged by this round: neither finding touches a Lean
  statement, docstring or import.
- **Signatures.** One scratch file with `#check @name` for the five declarations of
  `Suggested.lean` (and for every library name the repairs introduce) was elaborated once. The
  five elaborated types are identical to the job's signature listing and match the README
  statements clause by clause (`polynomialGraph`: `[CommRing k]`; `polynomialGraph_coeff`: support
  bound `hh` and query bound `he`; `exists_avoiding_graph`: `0 < m`, `h ≠ 0`;
  `exists_marked_etale_curve`: `[Field k]`, `[IsIntegral V] [IsAffine V] [Etale π]`, `hy`, `hU`;
  `exists_same_field_curve`: `[Field k]`, `hy`, `hyV`, `[Smooth (V.ι ≫ f)]`, `hU`). No binder lost;
  nothing changed. The library names elaborate with the types quoted in the README:
  `AlgebraicGeometry.Smooth.exists_etale_affineSpace`,
  `AlgebraicGeometry.SmoothOfRelativeDimension.exists_etale_affineSpace`,
  `AlgebraicGeometry.AffineSpace.SpecIso`, `AlgebraicGeometry.AffineSpace.SpecIso_inv_over`,
  `AlgebraicGeometry.AffineSpace.smoothOfRelativeDimension_fin`, `MvPolynomial.uniqueAlgEquiv`,
  `MvPolynomial.renameEquiv`, `Equiv.ulift`, `AlgebraicGeometry.smoothOfRelativeDimension_comp`,
  and an instance `Unique (ULift (Fin 1))` is found.
- **Bridge test (scratch only, not in `Suggested.lean`).** For `k : Type v` a field, a scratch
  `example` proving `SmoothOfRelativeDimension 1 (Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k))))`
  from `AffineSpace.smoothOfRelativeDimension_fin` at `n = 1`, `AffineSpace.SpecIso_inv_over`,
  `MvPolynomial.uniqueAlgEquiv`, `Etale.iff_smoothOfRelativeDimension_zero` (isomorphisms have
  relative dimension `0`) and `smoothOfRelativeDimension_comp 0 1` elaborates with exit 0. This
  is the transport named in Convention 2 and §2.2.
- **Dependency check.** Output, verbatim:

  ```text
  depcheck: 237 roadmaps, 2140 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name of
  `TauCetiRoadmap` found nowhere. The tool did not check library names, so every new library
  name was checked through the `#check` file above.
- **Gate failures.** None were listed for this round.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Tau Ceti contract `Smooth.exists_etale_affineSpace`, used in §2.4 step 1 | `Y = V = Spec k`; `Y = V = 𝔸²_k`, `y = 0`; `Y = Spec k[x, w]/(xw)`, `V = D(x)`, `y = (1, 0)`; the cone `x² − a w²` at `0` | `n = 0`: `𝔸(ULift (Fin 0); Spec k) ≅ Spec k`, chart an isomorphism, as in step 3 (`m = 0`). `n = 2`: identity chart through `SpecIso`. `D(x) = Spec k[x, x⁻¹]`, `n = 1`, chart the inclusion into `𝔸¹` with `π(y) = 1`, translated by `−1` to `x − 1`, value `0` at `y` (the `+1` translation gives `2`, nonzero for `char k ≠ 2`). Cone: `[Smooth f]` fails at `0`, theorem not applicable | holds; affine neighbourhood is in the pinned statement, so nothing is "assumed" beyond the pin | contract rewritten |
| Convention 2, universe of the index type | `u = 0`, `u = 1`; `m = 0, 1, 2` | `u = 0`: `AffineSpace (Fin m) (Spec k)` typechecks. `u = 1`: `Fin m : Type 0` against `Type 1`, ill-typed; `ULift.{1} (Fin m) : Type 1` typechecks. `Nat.card (ULift (Fin m)) = 0, 1, 2` | old text ill-typed for `u ≠ 0`; new text typed at every `u` | Convention 2 rewritten |
| Convention 2, `Spec k[T] ≅ Spec (MvPolynomial (ULift (Fin 1)) k)` over `Spec k` | `T ↦ X_⟨0⟩`; the structure maps | `uniqueAlgEquiv` sends `X_⟨0⟩` to `T` and is a `k`-algebra map, so it commutes with `algebraMap`; `Unique (ULift.{3} (Fin 1))` elaborates | holds | new sentence |
| §2.2: `s_C` smooth of relative dimension one | identity chart (`C = 𝔸¹`, `q = id`); 𝔽₃ branch `D(T + 1) → 𝔸¹`; `m = 0` (`C = 𝔸¹`); wrong model `Spec k → Spec k` | relative dimensions `0 + 1 = 1`, `0 + 1 = 1`, `0 + 1 = 1`; `Spec k → Spec k` has relative dimension `0 ≠ 1` (`IsStandardSmoothOfRelativeDimension.id`), so the clause discriminates a constant curve | holds; bridge elaborates in scratch | citation replaced by `smoothOfRelativeDimension_fin` with the transport |
| §2.4 *Needs* and Layer 2 Dependencies | each item against the route of §2.4 | step 1 needs the Tau Ceti chart, `SpecIso`, `renameEquiv`, `Equiv.ulift`; step 3 needs the `𝔸¹_k` dimension bridge; no remaining use of SchemeAndStackFoundations `etale_coordinates` | complete | updated |
| Ownership sentence of §2.1 | Tau Ceti `EtaleCoordinates.lean` and SchemeAndStackFoundations §0.8 (main) | neither states anything about images of closed subsets under the chart | the boundary polynomial still has no other owner | wording updated |

No Check or worked example uses the changed objects with different values: the relative
dimension `0 + 1 = 1` in the §2.2 and §2.3 Checks, and the `m = 0` constant curve of the §2.4
Checks, are recomputed above and unchanged.

## Pattern search

Every occurrence of `etale_coordinates`, `AffineSpace`, `𝔸(` and 054L in the README and
`Suggested.lean` was read: README lines for the diagram, the ownership sentence, the
owned-elsewhere bullet, Convention 2, both supplier contracts, the §2.2 *Needs* and API bullet,
§2.4 step 1 and *Needs*, Layer 2 Dependencies and References were changed; the §2.2 *Needs* line
now also lists the bridge names. `Suggested.lean` mentions neither `AffineSpace` nor étale
coordinates, so it does not change. The Stacks 054L locator is kept (it is the source of the
pinned theorem); `sources.toml` needs no change.

## For the maintainer

- This roadmap no longer consumes SchemeAndStackFoundations §0.8 `etale_coordinates`; it still
  consumes §0.8 `rational_point_component` (present on main and at the head of the open
  SchemeAndStackFoundations revision under the same name and section).
- `design/plan.json` still records the design-stage supplier node
  `SchemeAndStackFoundations:SF.0/etale-coordinates` in its target entries; only its `gaps` list
  is editable in this job, and no gap is needed, so it was left as is.
- No name of this roadmap changed; no other roadmap is affected.
- Ownership: the repairs add no target and no construction; they re-point one citation from a
  roadmap to the pinned library. The only open pull request read for this was the supplied head
  of the SchemeAndStackFoundations revision (which already resolves `etale_coordinates` to the
  same Tau Ceti declaration); no wider search of open pull requests was rerun this round.
- No untrusted text asked for any action.
