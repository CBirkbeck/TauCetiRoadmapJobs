# FIX-DESIGN-DynamicalDegreesOfRationalMaps~11

Findings of `REV-DESIGN-DynamicalDegreesOfRationalMaps~10` (one finding, P3).

## F01 (P3) — applied

Verified: the first §6.1 Check cites ArithmeticDynamics §§0.18 and 0.26, and the §6.2 Check cites only §0.18. Both headings exist at that roadmap's head.

- README Scope: "used in a Check of §6.2" → "used in Checks of §§6.1 and 6.2".
- `plan.json`: target 6.1 gains both prerequisites; target 6.2 loses §0.26.
- `plan.json` supplier `what`: "(Check of §6.2)" → "(Checks of §§6.1 and 6.2)".

## Pattern repair for F01

The pattern is a supplier section that a Check uses but the bookkeeping does not record, or records under the wrong roadmap. A script compared every supplier-section mention in the README and in each target's tests with the target prerequisites, the layer Dependencies and the `plan.json` supplier sections. It found these cases:
- **§2.2.** The Check on the blow-up of `ℙ²` uses Riemann–Roch from SchemeAndStackFoundations §5.10, but neither target 2.2 nor Layer 2 recorded §5.10. Added `roadmap:SchemeAndStackFoundations §5.10` to the 2.2 prerequisites, and "and §5.10 (a Check of §2.2)" to Layer 2 Dependencies. The supplier contract already lists §5.10 Riemann–Roch.
- **§3.1.** The Check "Full nef cone" cites the Checks of AlgebraicModuliForArithmeticGeometryPartII §1.2 (`ρ(E × E) = 3`) and §1.4 (the nef cone is the positive semidefinite matrices). These appeared in no Dependencies line, no supplier contract and no `plan.json` entry. They are now recorded in:
  - the 3.1 prerequisites;
  - the `plan.json` sections and `what` for that supplier;
  - Layer 3 Dependencies ("§§1.2, 1.4 (a Check of §3.1)");
  - a new supplier-contract bullet;
  - one sentence in the Scope bullet for that supplier.

  Both Checks were read at that roadmap's open head: §1.2 states `ρ(E × E) = 2 + rank End(E) ∈ {3, 4, 6}`, and §1.4 states the positive-semidefinite nef cone for `End(E) = ℤ`.
- **Three references to this roadmap's §2.2 that read as SchemeAndStackFoundations §2.2.** On main, SchemeAndStackFoundations §2.2 is "Leray and Čech spectral sequences".
  - §3.1: "SchemeAndStackFoundations §3.3 and §2.2" → "… and §2.2 here".
  - §4.1: "SchemeAndStackFoundations §5.3 and §2.2" → "… and §2.2 here".
  - §2.2: "by its §5.9, without §2.2" → "by its §5.9, without this section".

## Checks run

Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2247 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every supplier section added is from a supplier that was already declared, so no new edge arises.

- **Citation resolve** (`roadmaps resolve` on the README): no citations and no Lean names found nowhere.
- **`plan.json`:** parses; the diff touches only the entries listed above.
- **Lean:** the design stage has no `Suggested.lean`, so nothing was elaborated and the `#check` comparison had nothing to run on.
- **`sources.toml`:** unchanged; no source was added or fetched.

## Adversarial pass (changed statements)

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| §6.1 Check, `d = 1` against ArithmeticDynamics §§0.18, 0.26 | `f = [x_0² : x_1²]`, `f ∘ f` | Reduced forms `(x_0², x_1²)`, coprime, degree `2`. Composite `(x_0⁴, x_1⁴)`, degree `4 = 2·2`, matching the §0.18 multiplicativity and the §6.1 equality for a morphism. Scheme map `z ↦ z²` under §0.26 | holds; citation bookkeeping only |
| §6.2 Check, `d = 1` | same `f` | `deg_{1,H} = 2 = deg f` (§0.18); `λ_1 = 2 = e(f)` | holds; §0.26 not used, so it was dropped from 6.2 |
| §2.2 Check via SchemeAndStackFoundations §5.10 | blow-up of `ℙ²`, `b = 1, 2` | Exact sequences: `χ(O_S(bE)) − χ(O_S((b−1)E)) = χ(O_{ℙ¹}(−b)) = 1 − b`, giving `1` and `0`. Riemann–Roch: `½·bE·(bE + 3L − E) + 1 = ½(b − b²) + 1`, giving `1` and `0` (using `E·L = 0`, `E² = −1`) | agree; §5.10 recorded |
| §3.1 Check via AlgebraicModuliForArithmeticGeometryPartII §§1.2, 1.4 | `E × E`, `End(E) = ℤ` | `ρ = 2 + 1 = 3`. Gram matrix of `F_1, F_2, Δ` is `[[0,1,1],[1,0,1],[1,1,0]]`, determinant `2 ≠ 0`, so they span. `F_1 ↦ [[1,0],[0,0]]` is PSD and nef. `F_1 − F_2 ↦ diag(1,−1)` is not PSD, square `−2`, not nef | holds; sections recorded |

## Notes for the maintainer

- No name that other roadmaps cite changed; no section, layer or target was renumbered.
- Ownership against open pull requests is unaffected: every added citation names a supplier this roadmap already consumed.
- No text read during this round contained instructions.
