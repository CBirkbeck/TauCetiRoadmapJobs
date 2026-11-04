# FIX-RT-RootSystemsPartII~2: repair report

## RT-RootSystemsPartII~2b/F01 (P1) — applied

Verified at the pin. The content manifest pins Tau Ceti at 358314d4. In `TauCeti/LinearAlgebra/RootSystem/Chamber.lean`, `namespace RootPairing` opens at line 91 and closes at line 381, and line 135 defines `dominantChamber` (`{x | ∀ i ∈ b.support, 0 ≤ P.coroot' i x}`, with `[Preorder R]`). The pinned tree has no `TauCeti.dominantChamber` alias or export.

Change: `TauCeti.dominantChamber` → `RootPairing.dominantChamber` everywhere. That is 14 occurrences in `packages/RootSystemsPartII/Suggested.lean` and 3 in `packages/RootSystemsPartII/README.md` (Conventions, the Tau Ceti contract bullet, the §4.1 *Needs:* line). The contract bullet now also says "(namespace `RootPairing`)". The definition's body and binders are unchanged, so no statement changes meaning.

Pattern check: every other backticked `TauCeti.*` and `RootPairing.*` name in the README (55 names) was put through `#check @name` in a scratch file at the pin. All elaborate with no errors, so no other name was moved.

## RT-RootSystemsPartII~2a/F01 (P3) — applied

Verified. In A₁, identify α with 1. `Q⁺ = ℕ` is closed and discrete in `ℝ`, so its topological closure is still `ℕ` and does not contain `1/2`. The real conical hull is `ℝ≥0`, and it does contain `1/2`.

Change (README §1.1, last Check): "A topological cone closure would admit half a simple root." → "The real conical hull of the simple roots admits half a simple root and is therefore larger than Q⁺; in A₁, topological closure alone leaves Q⁺ = ℕα unchanged."

Pattern check: no other place in the README mentions topological closure. The "saturation" Checks (the PGL₂ rational ray containing 1) already name the right operation.

## Adversarial pass on changed text

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `RootPairing.dominantChamber P b` (rename) | A₂, λ = 0, μ = α₁ + α₂; empty base | simple-coroot values (0,0) and (1,1), both ≥ 0, so both are in the chamber; with empty support the chamber is all of M | same set as the definition the README describes | rename only |
| §1.1 Check, conical hull vs closure | A₁, x = 1/2 | in ℕ: no; in the closure of ℕ in ℝ: no; in ℝ≥0: yes | the new wording names the operation that actually changes membership | Check reworded |
| §1.1 Check, x = y | any x | difference 0 ∈ Q⁺ | holds | none |

## Checks run

- `lake build TauCeti.LinearAlgebra.RootSystem.Chamber TauCeti.LinearAlgebra.RootSystem.DynkinType` (the imports of `Suggested.lean`): Build completed successfully.
- `lake env lean packages/RootSystemsPartII/Suggested.lean`: exit 0. The only messages are 10 "declaration uses `sorry`" warnings, one per theorem.
- Build-check repair (module-system warning on `import Mathlib`): the file header is now `module`, then `public import Mathlib` and the two `public import TauCeti.LinearAlgebra.RootSystem.*` lines, with `public section` before the namespace. This follows the pinned Tau Ceti files it imports and `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` on main. The import list and its order are unchanged, and no declaration changed. Re-elaboration: exit 0. The module-system warning is gone, and the only messages are the 10 `sorry` warnings.
- Signature audit: I put `#check @name` for all 15 declarations of `Suggested.lean` in one scratch file and elaborated it at the pin. Every chamber hypothesis now elaborates as `P.dominantChamber b` or `F.pairing.dominantChamber F.base`. The binders are the same as before, so no binder was lost and nothing else in the signatures changed.
- README library-name audit: `#check @` on the 55 `TauCeti.*` and `RootPairing.*` names gave no errors.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 186 roadmaps, 1212 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.

## Notes for the maintainer

- Neither repair changed any declaration name of this roadmap.
- `design/plan.json` still carries the reference `tauceti:TauCeti.dominantChamber` (lines 54 and 1172). This job may only edit the plan's `gaps` list, so I left it unchanged. The design stage should rename it to `RootPairing.dominantChamber`.
- The earlier repair round elaborated against an older Tau Ceti pin (a91d3aaf). This round elaborated against the current pin 358314d4.
- Ownership: no new construction was introduced, so no new ownership question arises. No supplier gap was added. No source was fetched; both findings were settled from the pinned library and a direct computation.
