# FIX-RT-ZagierConjecturePolylogarithms~2

Red-team round 2, passes a and b, settled on the mathematics. Seven findings, five distinct defects; all were verified and all are applied. Files changed: `packages/ZagierConjecturePolylogarithms/README.md`, `Suggested.lean` (module docstring only), `design/plan.json` (one `gaps[].needs` string), `sources.toml` (two locator strings).

## RT-ZagierConjecturePolylogarithms~2a/F01, RT-ZagierConjecturePolylogarithms~2b/F01 (P2) — applied

Verified. Over a point, the kernel of the cobracket of `L^HT_m` is `ℂ/(2πi)^mℚ`. The class `(2πi)^m√2` there is nonzero (`√2 ∉ ℚ`) but lies on `ℝ(m)`, so its projection to `ℝ(m−1)` is zero and `R = 0`. The inference "constant, zero period, hence zero" therefore fails with rational coefficients.

Old → new: `r_X` now lands in `L^{HT,ℝ}_•(η_X)`, with the real coalgebra and the forgetful map defined in §3.6. In §3.7, `P` is built on the real coalgebra, real rigidity is added, and `R` is injective on real primitive classes (G08 Lemma 1.13). (3) asserts vanishing in `L^{HT,ℝ}`, and the motivic step goes through the regulator. The witness is a §3.6 Check.

Notes:
- **Real coefficients rather than 2b's options.** 2b's (B) divides out an ad hoc subspace and has the same effect on every consumer (§§5.1, 5.4, 5.7 use only `P∘r_X`, `R∘r_X`). 2b's (A) needs an unowned claim that limit structures at rational collision points are motivic. The real Lie coalgebra is what GR's period map is built on (GR lines 3496, 3528–3531, 3554).
- **Correction to 2a's wording.** "R is the identity" became "R is injective, a nonzero multiple".
- **Pattern repaired.** The generic-relation step of the same proof route claimed zero cobracket rationally, by an induction that uses the vanishing of lower-weight specialized relations. It now works in `L^{HT,ℝ}`.
- **Added proof step.** To identify the period of the limit object with the limit of the periods, the proof route now uses the fact that near `t = 0` a unipotent variation's period is a polynomial in `log|t|`.
- **Other places updated.** Scope, Summary and How to read the build now say "real framed Hodge–Tate variations".

## RT-ZagierConjecturePolylogarithms~2a/F02 (P2) — applied

Verified. MixedHodgeModulesAndIrregularHodgeTheory §§3.2–3.3, at its open head, give one limit mixed Hodge structure per punctured disc. No cited section makes the pointwise limits into a variation on the divisor.

Old → new: (3) now defines the limit as the unipotent nearby cycles of the mixed Hodge module of the variation along `t` (that roadmap's §§4.6, 5.1, 5.3). It adds the obligation that this is a good Hodge–Tate variation on a dense open of `X × {0}`: its local system, weight filtration `= W`, fibre and framings are stated. *Needs*, Scope, contract and Layer 3 Dependencies now cite §§4.6, 5.1, 5.3.

Notes:
- **Why §5.1 as well.** 2a's repair named §§4.6 and 5.3 only. §5.1 is added because the module must be extended across `t = 0`, by the open-embedding direct image, before `ψ_t` applies.
- **The weight filtration.** Translating §5.3's shift convention (`L_kψ = ψ(W_{k+1}M)`) to variations gives the relative monodromy filtration with respect to `W`. That filtration equals `W` because `N` lowers `W` by two and vanishes on `gr^W`; the Kummer variation is a witness (that roadmap's §3.3, Checks).
- **Supplier order.** MixedHodgeModulesAndIrregularHodgeTheory is line 261 of the merge order and this roadmap is line 323, so no direction changes.
- **The diagonal Check.** The `D₃₁(x, x+t)` Check of §3.13 is updated to the nearby-cycles reading.

## RT-ZagierConjecturePolylogarithms~2a/F03, RT-ZagierConjecturePolylogarithms~2b/F02 (P2) — applied

Verified (2a rated it P3, 2b P2). §6.3 → §6.2 → §6.1 → §5.8 → §5.7 was the only *Needs* path from §6.3 to the lift: I recomputed the closure from every *Needs* line. That contradicted §5.7's statement that the every-family theorem does not depend on the lift.

Old → new: "§5.2 and the conversions of §6.2" → §5.2, `r_Bo = −2r_Be` (BorelRegulators §6.2), and division of `R = i·p` by `(2πi)³` giving `−p/(8π³)` (Conventions; BorelRegulators §1.1). *Needs* drops §6.2 and adds BorelRegulators §1.1. Recomputed closure from §6.3: §§5.7, 5.8, 6.1, 6.2 are not reached.

## RT-ZagierConjecturePolylogarithms~2b/F03 (P2) — applied

Verified. HodgeStructures L2 (`Completed/HodgeStructures/README.md`, L2 block) and the pinned `TauCeti/Geometry/Hodge/Mixed/` have no tensor product of mixed Hodge structures. The pinned `TauCeti/Geometry/Hodge/TensorProduct/Basic.lean` covers pure structures only. MixedHodgeModulesAndIrregularHodgeTheory §3.1, at its open head, has tensor products of graded-polarizable variations, which on a point are graded-polarizable mixed Hodge structures.

Old → new: in the README contract and in `design/plan.json` (`gaps`, slug `mixed-tate-hodge-realization`, `needs` only), "to the mixed ℚ-Hodge structures of HodgeStructures Layer L2" → "to the graded-polarizable mixed ℚ-Hodge structures (HodgeStructures Layer L2, with the tensor product of MixedHodgeModulesAndIrregularHodgeTheory §3.1 on a point)". The MixedHodge contract now names this use.

## RT-ZagierConjecturePolylogarithms~2b/F04 (P3) — applied

Verified: line 14 of the module docstring began with "theorem". Old → new: the sentence is reflowed to "…three steps of which no cited source proves. The every-family / statement does not use that lift." No line of `Suggested.lean` now begins with a declaration keyword except the ten real declarations (checked by grep).

## Checks run

**Elaboration.** `lake env lean packages/ZagierConjecturePolylogarithms/Suggested.lean`, run from the content checkout, gives two warnings and no errors: `declaration uses 'sorry'` at 132:8 (`zagier_four_exists`) and at 143:8 (`zagier_four_everyFamily`). There are no `TauCeti.*` imports.

**Elaborated signatures.** I put `#check @name` for all ten declarations into one scratch file and elaborated it once. Every elaborated type agrees with README §6.4 and with the supplied signature table:
- `[Field F]` on the field-level definitions;
- `[AddCommGroup V] [Module ℚ V]` on `TrilogRelationFunction`;
- `[NumberField F]` on `periodMatrixFour`, `zagierDeterminantFour` and both theorems;
- `hc` on `zagier_four_everyFamily`.

No binder was lost and no signature changed; only the docstring moved. The eleventh entry `does` of the earlier table came from the docstring line repaired under 2b/F04.

**Dependency check.**

```text
depcheck: 256 roadmaps, 2436 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line for this roadmap.

**Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere.

**House style.** Scanning the added README text found no LaTeX delimiters, process words or machine paths. `design/plan.json` differs from its previous content only in `gaps` (checked by comparing the JSON with `gaps` removed). `sources.toml` parses. Its G08 locator gains "§1.8, p. 14" and "§1.11, Lemma 1.13 with (46)–(47), p. 20"; its GR locator range (178)–(180) becomes (178)–(181).

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.6 real primitive part over a point | `m = 1, 2, 3`; `m = 0` | `ℂ/2πiℝ ≅ ℝ` (via `Re`); `ℂ/ℝ(2)`, `ℝ(2) = −4π²ℝ = ℝ`, quotient `iℝ = ℝ(1)`; `ℂ/iℝ ≅ ℝ = ℝ(2)`; weight zero is not part of `L^{HT}` | one-dimensional over ℝ in each weight `m ≥ 1`, agreeing with G08 line 610 (`dim = 1`) | stated |
| §3.6 forgetful map on primitives | class `(2πi)^m√2`, `m = 2, 3` | `−4π²√2`: nonzero mod `(2πi)²ℚ` (ratio `√2`), zero mod `ℝ(2)`; `−8π³√2·i`: nonzero mod `(2πi)³ℚ`, in `ℝ(3) = iℝ`, so projection to `ℝ(2)` is 0 | projection is not injective; this is the reviews' witness | Check added |
| §3.6 weight one | `x = 2`, `x = e^i`, `x = −1` | `log 2 ≈ 0.6931`; `e^i` not torsion (π irrational) but `log|e^i| = 0`; `−1` torsion, so 0 on both sides | forgetful map not injective in weight one either | Check added |
| §3.7 real rigidity | `m = 1, 2` | `ℝ(m)` has type `(−m,−m)` and `F^{−1}ℝ(m)_ℂ = 0` iff `m ≥ 2`; at `m = 1` the Kummer variation of the coordinate on `𝔾_m` is not constant | holds exactly for `m ≥ 2` | stated |
| §3.7 `R` injective on real primitives | weight 1 at `x = 2`; weight 2 at `ζ₆`; weight 3 at `S₃(1)`; weight 4 at `S₄(i)` | `P = log 2`, multiple 1; `1 − ζ₆ = ζ₆⁻¹` torsion so `δ = 0`, `R = i·D(ζ₆)/2 ≈ 0.5075i`; `δ = [1]₂⊗u(1) = 0`, `R = −ζ(3)/4 ≈ −0.3005`; `δ = [i]₃⊗u(i) = 0`, `R = iβ(4)/8 ≈ 0.1236i` | nonzero in weights 1–4 | Check added (weights 1, 3) |
| §3.13(3) limit equals specialization, period step | Kummer of `1+t`; Kummer of `t·f`; `S₂(t)`; `S₂(1−t)` | `log|1+t| → 0`, split limit, period 0; `log|t| + log|f|`: `log|t|` coefficient 1, constant term `log|f|` is the period of the limit (Kummer of `f`, i.e. `sp_π` with `π = t`); `D(t) → 0`, split limit; `D(1−t) → 0`, limit class `ζ(2) ∈ (2πi)²ℚ`, specialization `[1]₂ = 0` | "the limit of converging periods is the period of the limit" holds; divergence shows as a nonzero `log|t|` coefficient | proof clause added |
| §3.13(3) weight filtration of the nearby variation | Kummer variation; constant `ℚ(n)` | `N: gr_0 → gr_{−2}` nonzero, `N|gr^W = 0`, relative monodromy filtration `= W` (MixedHodgeModules §3.3, Checks); constant: `N = 0`, `ψ = ` the fibre | `M = W` | stated |
| §3.13 motivic step | `F = ℚ`, `m = 2, 3`; `F = ℚ(√2)`, `m = 3` | `K₃(ℚ)_ℚ = 0`, trivial; `K₅(ℚ)_ℚ = ℚ` with regulator `ζ(3) ≠ 0`; `K₅(ℚ(√2))_ℚ` has rank `r₁ + r₂ = 2`, and a single real embedding is not injective | injectivity needs all embeddings together, which is what the text says | wording fixed |
| §3.13 generic relations | `Q₄` over `M₀,₇`; weight two | constant real class whose fibre at a rational configuration is the image of `Ext¹_{MT(ℚ)}(ℚ(0),ℚ(4)) = 0`; `Ext¹_{MT(ℚ)}(ℚ(0),ℚ(2)) = 0` | zero, already rationally | moved to `L^{HT,ℝ}` (pattern) |
| §6.3 conversions | `[i]` over `ℚ(i)`, `σ(i) = i` | `p = β(4)/8 ≈ 0.123618`; `R/(2πi)³ = i·p/(−8π³i) = −p/(8π³) ≈ −0.00049836`; `L₄`-period `= β(4) = 8p` | agrees with the §6.2 Check | edge removed |
| §6.3 *Needs* closure | from §6.3 | §§1.1–1.7, 2.1–2.5, 3.1–3.2, 3.4–3.13, 5.1, 5.2 | §§5.7, 5.8, 6.1, 6.2 not reached | — |
| gap mixed-tate-hodge-realization | `ℚ(1)⊗ℚ(2)` | goes to `tate 1 ⊗ tate 2 = tate 3` (weight `−6 = −2 − 4`) | consistent with a tensor functor | supplier of `⊗` named |
| Suggested.lean docstring | lines beginning with keywords | 10 declarations, none in the docstring | — | reflowed |

## Ownership and overlaps

- **Real Lie coalgebra.** The real Lie coalgebra `L^{HT,ℝ}` of good real mixed Hodge–Tate variations is owned here, alongside `L^HT`, which this roadmap already owned. A search of the roadmaps on main and the open heads by object found no other owner. MappingClassGroupsAndCanonicalRepresentations uses real mixed Hodge structures at single points, an unrelated construction.
- **Suppliers.** No new supplier roadmap is introduced. The new citations are MixedHodgeModulesAndIrregularHodgeTheory §§4.6, 5.1, 5.3, read at its open head (in the brief's checkout list, merge order line 261), and BorelRegulators §1.1, which was already a supplier.
- **Overlaps.** `scratch/overlaps.md` lists no second copy, no dropped id and no other pull request changing this roadmap.

## For the maintainer

- **Weaker realization statement.** §3.13(3) now asserts that the relations vanish in the real Lie coalgebra `L^{HT,ℝ}`, not in `L^HT`. Every consumer in this roadmap (§§5.1, 5.4, 5.7 Checks, 6.3, and the motivic part of §3.13) uses only `P∘r_X`, `R∘r_X`, or the regulator, so no downstream statement changes.
- **Consequence for Polylogarithms.** A roadmap that wants the rational realization of `L₃`, `L₄` in families would need a statement that limit structures at rational collision points are motivic. No cited source proves this. GR §5.3, p. 57 (GR lines 2594–2597) asserts in one sentence that the specialization constant is the realization of an element of `Ext¹_{MT(ℚ)}`, and gives no argument for it.
- **Supplier text read at open heads.** MixedHodgeModulesAndIrregularHodgeTheory §§4.6, 5.1, 5.3 were read at the head of its open pull request. Its section numbering there carries a former-numbering map; the overlap tool reports no dropped id.
- **Names.** No Lean name changed. Nothing in other roadmaps cites the changed sentences by name.
- **Suspicious text.** None found in the reviews.
