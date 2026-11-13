# FIX-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~7

One review was settled: REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~6, with one finding.

## F01 (P3) — applied differently

The docstring of `Suggested.lean` now names every theorem in the README's headline-targets table. Six bullets were added for MS.0.4, MS.1.2, MS.1.4–MS.1.5, MS.2.2–MS.2.3, MS.2.6–MS.2.7, MS.2.9, MS.3.6, MS.4.3–MS.4.4, MS.5.3, MS.5.5–MS.5.6, MS.6.3, MS.6.6–MS.6.7 and MS.6.10. Each bullet gives the source locator and the carriers the theorem lacks. Three parts of the proposed wording were corrected:

- MS.0.4 concerns `φ`-modules with no connection (README MS.0.4 says "No connection is needed"), and it also covers D'Addezio's generic pair with residue field `k(t)`. The proposed "Amice and bounded Robba differential Frobenius modules" was wrong on both counts.
- MS.1.5 lives over `K[[t]]₀`. Tau Ceti already has this ring (`PowerSeries.HasGaussNorm.subring`), so what is missing is the `(φ,∇)`-modules over it, not the ring.
- MS.6.7 is now explicitly marked as not a headline when stated on a bare representation. Its averaging step is Mathlib's `Representation.averageMap`, so stating it there would be linear algebra on free variables.

No Lean declaration was added. The README is unchanged, since it does not describe the contents of `Suggested.lean`.

## Checks

- **Elaboration.** `lake env lean packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. No `TauCeti.*` import is used, so no module had to be built.
- **`#check @name` audit.** `Suggested.lean` declares nothing; it has only the module docstring and an empty namespace. The scratch `#check` file is therefore empty and no signature changed.
- **Dependency check:**

  ```text
  depcheck: 240 roadmaps, 2176 edges, 0 problem(s)
  ```

  There are no UPWARD, CYCLE or `moved:` lines.
- **Gate failures.** None were listed for this round.

## Adversarial pass on the changed text

Only the docstring changed. No theorem, definition, convention or Check was added or modified. The pass below checks each new bullet against the target it names and against what exists at the pins.

| New docstring claim | Instance or evidence | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| MS.0.4 needs `φ`-modules without a connection, over two pairs | README MS.0.4: two pairs (local `k((t))`, generic `k(t)`); "No connection is needed" | Proposed wording: one pair, with a connection. Actual: two pairs, no connection | Proposed wording corrected | Bullet names both pairs and says "with no connection" |
| `K[[t]]₀` exists at the pins only as a ring | Pinned `TauCeti/RingTheory/PowerSeries/Bounded.lean:63` (`PowerSeries.HasGaussNorm.subring`); grep for Frobenius-lift coefficient-ring structures finds 0 hits | Ring: present. `(φ,∇)`-modules over it: absent | Consistent | Bullet says "only as a ring" |
| No Amice field, bounded Robba field or overconvergent F-isocrystal at the pins | Case-insensitive grep for `robba` and `overconvergent` (as a carrier), and for `structure`/`class`/`def` names containing `Isocrystal` or `Amice` | `robba`: 0 hits. `overconvergent`: only bibliography and comment lines. `Isocrystal` names: only `WittVector.Isocrystal` (no connection, no base scheme). `Amice` names: only measure transforms (`unitsMeasureAmiceEquiv`) | Consistent | None |
| No weak completion of a lifted curve at the pins | Grep for `weakCompletion` and `MonskyWashnitzer`; the only "overconvergent series" are multivariable series restricted at some radius > 1 (`MvPowerSeries/Primitive/GaussNorm.lean:29`) | 0 hits for a weak completion of an arbitrary smooth lift | Consistent | None |
| MS.2.6 needs pullback and direct image | README MS.2.6 uses `f^*N†` and `f_*M†` | Both are used | Consistent | Bullet names both |
| MS.3.6 and MS.4.4 need saturated quotients | MS.3.6 uses `Sat(G_i(N†))` over `E†`; MS.4.4 uses `Sat_C(G_i(N†))` and `B_C` (MS.2.7, MS.3.10) | Two saturated quotients and the convergent bounded quotient are used | Consistent | None |
| MS.5.3 needs Frobenius pullback and finite étale direct image of `F^n`-isocrystals | README MS.5.3 uses `F^(i*)` and `MS(f_*M)` | Both are used | Consistent | None |
| MS.6.6 locators | README MS.6.6 cites Proposition 7.10, Lemma 7.11, Proposition 7.12 and Corollary 7.13 | Bullet cites the same | Consistent | None |
| MS.6.7 and MS.6.10 locators | README: Proposition 7.15(2) for MS.6.7 and 7.15(1) for MS.6.10 | Bullet cites Proposition 7.15 | Consistent | None |
| `Representation.averageMap` exists at the pin | `Mathlib/RepresentationTheory/Invariants.lean:126`, `averageMap_invariant` at :131, `averageMap_id` at :137 | Present | Consistent | None |
| Coverage of the headline table | Theorem entries in the README table at `README.md:27–35`: MS.0.4, 0.7, 1.1, 1.2, 1.4, 1.5, 1.8, 2.2, 2.3, 2.5, 2.6, 2.7, 2.9, 3.6, 3.7, 4.2, 4.3, 4.4, 4.6, 4.8, 5.3, 5.5, 5.6, 5.7, 5.8, 6.3, 6.6, 6.7, 6.10, 6.13, 6.14 | 31 theorems in the table, 31 named in the docstring | Consistent | None |

The remaining table entries are definitions or constructions and stay README targets. They are the completed generic field, bounded generic solutions, the maximally bounded quotient, PBQ modules, saturation, quasi-saturation, the saturated quotient, dagger hulls, the minimal slope property, the Lefschetz condition and `Q̄_p`-coefficient objects. The MS.2.8 two-step example is an example, not a theorem.

## For the maintainer

- No Lean name, target id, section or supplier contract changed. Nothing that other roadmaps cite is affected.
- No new target, gap or source was added, and `sources.toml` and `design/plan.json` are unchanged. Ownership is therefore the same as in the previous round, with no new owned object to check against open pull requests.
- Nothing in the review text read as an instruction outside this job.
