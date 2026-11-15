# Review of FormalConnectionsOpers (pull request #1056 at 4b3f57b)

**Verdict:** needs changes

## R01 (P3) — The description's supplier sentence omits ReductiveGroupsPartII, LieHighestWeight and eight other suppliers

**Location:** PR description, fourth prose paragraph: “ReductiveGroups, LieGroups, CharacteristicClasses and ComplexKahlerGeometry supply the algebraic-group and analytic comparison inputs specified in the README.”
**Claim:** The sentence assigns all the README's algebraic-group inputs to these four. The head takes the loop-group decompositions and the dual group from ReductiveGroupsPartII and the Chevalley restriction from LieHighestWeight. Ten of the eighteen suppliers are never named in the description.
**Witness:** `TauCetiRoadmap/FormalConnectionsOpers/README.md:339–359` (RG2.1, RG2.3, RG2.4, RG2.5.1) and `:1433–1437`: the Cartan and Iwahori–Bruhat decompositions are RG2.4's, “cited … and not proved again”. `:441–448` covers LieHighestWeight Layer 7. Supplier headings are at `:304–472`.
**Repair:** Replace the sentence with: “ReductiveGroups; ReductiveGroupsPartII (RG2.1 and RG2.3–RG2.4: the affine Weyl, parahoric and Iwahori–Weyl groups and the Cartan and Iwahori–Bruhat decompositions over ℂ((t)), of which §3A.5 proves only the lattice form; RG2.5.1: the dual group); RootSystems; LieHighestWeight (Layer 7, the Chevalley restriction theorem); LieGroups; CharacteristicClasses; ComplexKahlerGeometry; ComplexManifolds; AnalyticToricGeometry; SmoothBundlesConnections; FormalLaurentPuiseux; AlgebraicVectorBundles; AffineMorseLefschetz; and ProfiniteCohomology, all on main, supply the remaining inputs specified in the README.”

## Previous findings

- R01 — repaired: “Suggested.lean states regular-gauge classification, polynomial factorization of formal loops and the cyclic-vector theorem, with six supporting definitions and one local instance. … with three `sorry` warnings.” This matches defs at 59, 95, 102, 113, 119 and 153, the instance at 90 and the theorems at 74, 133 and 163.
- R02 — repaired: “FCO §7.5 constructs the classical mode completion independently. AffineLieAlgebras consumes it and owns its comparison with the generic mode completion.” AffineLieAlgebras is no longer named as a supplier.
- R03 — repaired: “F2.2 imports the characteristic-free differential-operator and all-order principal-parts API from ComplexComparisonPartII C5.1 … Its PBW theorem assumes projectivity, and its comparison with ordinary differential operators assumes smoothness and characteristic zero.” This matches README:709–745.
- R04 — repaired: “FCO §3A.4 consumes KacMoody §§8.1 and 8.4 on main … KacMoody owns the minimal-derived-group homomorphism and central kernel; those are not inputs here. This PR changes only FormalConnectionsOpers.”
- R05 — repaired: “This PR adds the new FormalConnectionsOpers roadmap: …README.md, …Suggested.lean and …metadata.toml.” The summary also opens with “This new roadmap constructs …”.

## Verified sound

| Statement | Instances tried | Left-hand value | Right-hand value | Result / change |
| --- | --- | --- | --- | --- |
| `regularGauge_constantCoeff_bijective` (F2.4; description “regular-gauge classification”) | `R = ℚ`, `n = 1`, `A = 1`, `B = 0`; control `R = 𝔽_p` | `1 − g′/g = 0` ⇔ `g = c·eᵗ`, constant term `c ∈ ℚˣ` | bijection onto `GL₁(ℚ) = ℚˣ`. Over `𝔽_p`, `(j+1)g_(j+1) = g_j` forces `g₀ = 0`, so no unit solution | holds; the `ℚ`-algebra hypothesis is needed |
| `formalLoop_eq_polynomial_mul_positive` (F3A.2) | `G = 𝔾_m`, `R = ℂ[ε]/ε²`, `g = 1 + t + εt⁻¹` | `p = 1 + εt⁻¹` (inverse `1 − εt⁻¹`); `q = 1 + t − ε`, constant term a unit | `pq = 1 + t − ε + εt⁻¹ + ε = g` | holds on a nonreduced `R` |
| `exists_cyclicVector` (F6.2; description “nonzero derivation”) | `F = ℚ(t)`, `V = F²`, componentwise `d/dt`; `v = (1, t)`; control `F = ℚ`, zero derivation, `D = 0` | `Dv = (0, 1)`, `det[(1,t),(0,1)] = 1`; `v = (1,0)` gives `Dv = 0` | `2 = finrank`; under the control, `(v, 0)` is dependent for every `v` | holds; `hd` excludes the control |
| Cartan decomposition in lattice form, §3A.5 (touched by R01) | `SL₂`; `diag(t,t⁻¹)`, `diag(t⁻¹,t)`, `diag(t²,t⁻²)` | first two conjugate by `[[0,1],[−1,0]] ∈ K₀`, dominant `α^∨` | elementary divisors `(t,t⁻¹) ≠ (t²,t⁻²)`: distinct strata in `Y⁺ = ℕα^∨` | consistent with RG2.4.4 on main |
| Inventory sentence of the description | count of the declarations in `Suggested.lean` | 6 `def` + 1 `local instance` + 3 `theorem` | build: 3 `sorry` warnings (74, 133, 163) | matches |

The rows for the untouched statements stand as in the previous review of `4b3f57b`.

- Delta: 0 folder lines changed since `4b3f57b`; nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside the folder is empty); the worktree is clean.
- PR text: the title, the `roadmap-summary` block and all eleven prose paragraphs were compared with the head. One finding (R01); every other sentence checked against README:1–20, 22–158, 160–508, 707–782, 1176–1566, 1597–1616, 1885–1895, 2107–2125, 2533–2565, 2707–2715, 2735–2812.
- Cross-roadmap claims of the description were resolved. On main: AffineLieAlgebras 118–130 and 1052–1118; NilpotentOrbits 60 and 63; SchubertGeometry 111; ReductiveGroups 3A.5e (1914); KacMoody 8.1 (1135) and 8.4 (1205); ReductiveGroupsPartII RG2.1, RG2.3, RG2.4.1/2.4.2/2.4.4 and RG2.5.1. At open heads: ComplexComparisonPartII #848 C5.1 (2994, 3096) and CrystallineCohomology #857 CR.1.3 (1121). All 18 suppliers were located: 16 on main, plus #848 and #857.
- Pinned declarations opened: Mathlib `LieRinehartRing` and `LieRinehartAlgebra` (`Algebra/LieRinehartAlgebra/Defs.lean:30,43`); Tau Ceti `TauCeti.HopfAlgebra.points` and `pointsFunctor` (`Algebra/AlgebraicGroup/PointsFunctor.lean:56,135`).
- Gate: every check is 0, `OK`, exit 0. The targeted build `TauCetiRoadmap.FormalConnectionsOpers.Suggested` exits 0 (18,586 jobs) with three `sorry` warnings.
- Direct elaboration (`lake env lean`) exits 0; the only warnings are three `sorry` warnings at `Suggested.lean:74,133,163`.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`, exit 0, with no UPWARD or CYCLE line.
- Seeded source sample: no changed target or locator in this zero-line delta; the sampled targets stand as verified in earlier rounds.

Overlap check: read AffineLieAlgebras, NilpotentOrbits, SchubertGeometry and GeometricRepresentationCategories (main), and ComplexComparisonPartII and CrystallineCohomology (open), for the description's claims. Owners: the classical completion belongs to FCO §7.5 and its mode-completion comparison to AffineLieAlgebras; principal parts belong to ComplexComparisonPartII C5.1; the connection carrier to CrystallineCohomology CR.1.3; the fixed-model manifold to FCO §2.4. The overlap tool lists no dropped ids and no other pull request changing this roadmap. The remaining closest roadmaps are unchanged from the settled audit.

Source independence: changed passages only. 0 passages compared with 0 sources, because the folder is unchanged and the description is not roadmap content; arrangement not reopened (no layer added, removed or reordered).

## Not verifiable

- “Closes #1055” and the AI-assistance statement concern the issue tracker and the authoring process, not the folder; they were not checked.
- These earlier source limits remain, untouched by this zero-line delta: Kazhdan–Lusztig 1980/1988, Chevalley 1955, Matsushima 1960 and Drinfeld–Sokolov 1985 are cited by settled uncertified (paywalled) locators.

## Source issues

- none

## For the human reviewers

- none
