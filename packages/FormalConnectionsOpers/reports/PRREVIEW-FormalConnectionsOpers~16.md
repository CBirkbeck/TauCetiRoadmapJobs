# Review of FormalConnectionsOpers (pull request #1056 at 4b3f57b)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: “Every supplier other than CrystallineCohomology and ComplexComparisonPartII is on main. … ReductiveGroupsPartII supplies the dual pinned group (RG2.5.1) and … the Iwahori–Bruhat and Cartan decompositions (RG2.4.2, RG2.4.4) … LieHighestWeight Layer 7 …”. All 18 suppliers are named.

## Verified sound

| Statement | Instances tried | Left-hand value | Right-hand value | Result / change |
| --- | --- | --- | --- | --- |
| `regularGauge_constantCoeff_bijective` (F2.4; description “regular-gauge classification”) | `R = ℚ`, `n = 1`, `A = t`, `B = 0`; controls `R = 𝔽₂`, `n` empty | `g′ = t·g`: `g₁ = 0`, `2g₂ = g₀`, `4g₄ = g₂`, so `g = c·exp(t²/2)`, `g₄ = c/8` | one solution per `c ∈ ℚˣ = GL₁(ℚ)`. Over `𝔽₂`, `2g₂ = g₀` forces `g₀ = 0`: no unit. Empty `n`: singleton to singleton | holds; `Algebra ℚ R` is needed |
| `formalLoop_eq_polynomial_mul_positive` (F3A.2; “polynomial factorization of formal loops”) | `G = 𝔾_m`; `R = ℂ`, `g = t⁻² + 1`; `R = ℂ[ε]/ε²`, `g = t + εt⁻¹` | `p = t⁻²`, `q = 1 + t²`; nonreduced: `p = t + εt⁻¹` with inverse `t⁻¹ − εt⁻³`, `q = 1` | `pq = t⁻² + 1`; `(t + εt⁻¹)(t⁻¹ − εt⁻³) = 1 − εt⁻² + εt⁻² = 1` | holds, also on nonreduced `R` |
| `exists_cyclicVector` (F6.2; “nonzero derivation”) | `F = ℚ(t)`, `V = F²`, componentwise `d/dt`; `v = (t, t²)`, `v = (1, 1)`; control `F = 𝔽_p(t)`, `V = F^(p+1)` | `Dv = (1, 2t)`, `det = 2t² − t² = t² ≠ 0`; `v = (1,1)`: `Dv = 0` | `2 = finrank`; control: `D^p v = 0` for every `v`, so the `p + 1` iterates are dependent | holds; existence is not “every `v`”; `CharZero` is needed |
| Cartan decomposition cited from RG2.4.4 and transported in §3A.5 (description, supplier paragraph) | `GL₂`: `diag(t,1)`, `diag(1,t)`, `diag(t²,1)`, `diag(t,t)` | first two conjugate by the permutation matrix in `K₀`: one double coset, `λ = (1,0)` | `O²/L`: `O/t²` for `(2,0)`, `(O/t)²` for `(1,1)`: not isomorphic, distinct strata with equal determinant valuation | consistent with RG2.4.4 on main |
| Description's supplier paragraph | supplier headings of the README against the roadmaps the description names | 18 `### From TauCetiRoadmap.*` headings (README:304–487) | 18 named: 16 with folders on main, 2 at open heads (ComplexComparisonPartII, CrystallineCohomology) | matches |
| Description's inventory sentence | declarations of `Suggested.lean` | 6 `def` (59, 95, 102, 113, 119, 153), 1 `local instance` (90), 3 `theorem` (74, 133, 163) | elaboration: 3 `sorry` warnings at 74, 133, 163 | matches |

The rows for the untouched statements stand as in the previous review, of `4b3f57b`.

- Delta: 0 folder lines changed since `4b3f57b`; `git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean.
- PR text: the title, the `roadmap-summary` block and every prose paragraph were read against the head. Each clause of the rewritten supplier paragraph was matched to README:86–94, 119–125, 304–487, 827–1008, 1412–1487, 1617–1866, 2220–2369; the other paragraphs to README:1–20, 140–158, 707–778, 1176–1552, 2533–2607, 2778–2811. No sentence is contradicted; the description states that the pull request adds the roadmap and changes only this folder.
- Cross-roadmap claims resolved now. On main: ReductiveGroupsPartII RG2.1, RG2.3, RG2.4.1 (5533), RG2.4.2 (5711), RG2.4.4 (6213), RG2.5.1 (6724); KacMoody 8.1 (1135), 8.4 (1205); ReductiveGroups 3A.5e; LieHighestWeight Layer 7; AffineLieAlgebras (36–38, consumer). At open heads: ComplexComparisonPartII C5.1 (2994), CrystallineCohomology CR.1.3 (1121).
- Pins named in the description match `lake-manifest.json` and `lean-toolchain`: Lean v4.36.0-rc2, Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.
- Gate: every check 0, `OK`, exit 0.
- Direct elaboration (`lake env lean`) exits 0; the only warnings are three `sorry` warnings at `Suggested.lean:74,133,163`.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`, exit 0, no UPWARD or CYCLE line.
- Seeded source sample: no target or locator changed in this zero-line delta; the sampled targets stand as verified in earlier rounds.

Overlap check: read AffineLieAlgebras, GeometricRepresentationCategories and NilpotentOrbits (main), and ComplexComparisonPartII and CrystallineCohomology (open), for the description's claims; nothing shared. Owners as stated: the classical completion is FCO §7.5's and its comparison with the mode completion AffineLieAlgebras'; principal parts are ComplexComparisonPartII C5.1's; the connection carrier is CrystallineCohomology CR.1.3's. The overlap tool lists no dropped id and no other pull request changing this roadmap.

Source independence: changed passages only; 0 passages compared with 0 sources, because the folder is unchanged and the description is not roadmap content; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- “Closes #1055” and the AI-assistance statement concern the issue tracker and the authoring process, not the folder; not checked.
- Unchanged from earlier rounds: Kazhdan–Lusztig 1980/1988, Chevalley 1955, Matsushima 1960 and Drinfeld–Sokolov 1985 are cited by settled uncertified (paywalled) locators.

## Source issues

- none

## For the human reviewers

- none
