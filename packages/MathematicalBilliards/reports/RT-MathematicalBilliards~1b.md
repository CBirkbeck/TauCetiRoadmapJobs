<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13476#issuecomment-6795961339 -->
Red team round 1 pass b (claude) of e5e370d

Verdict: needs_changes

1. **F01** (P2) Invariance of `sin δ dδ ds` is restricted to `k ≥ 2`, but holds for every table

   **Location.** `packages/MathematicalBilliards/README.md:277` ("for a table `γ` of class `C^k` with `k ≥ 2`, `MeasureTheory.MeasurePreserving (ConvexTable.billiardMap γ) μ_A μ_A`"); also README lines 3, 203, 363, 415; `packages/MathematicalBilliards/Suggested.lean:154–156` (`(hk : 2 ≤ k)`) and its module docstring, lines 15–16.

   **Claim.** The headline theorem is stated, and the acceptance test is typed, only for `k ≥ 2`; §2.2 says the invariant measure is "claimed only for `k ≥ 2`".

   **Witness.** The statement is true for `k = 1`, with a proof from targets the README already has. With `Λ(s, δ) = (e, e × γ(s))`, `e = exp(iδ)τ(s)` (§1.4):

   - `Λ` carries `μ_A` to `dθ ⊗ Lebesgue`: `(s, δ) ↦ (s, δ + θ(s))` is a translation in each fibre, and for fixed `e`, `∂_s(e × γ(s)) = e × τ(s) = −sin δ`. Only `C¹` is used.
   - `Λ⁻¹ ∘ R ∘ Λ = I ∘ T` for `R(e, c) = (−e, −c)` (third Check of §1.4), and `R` preserves `dθ ⊗ Lebesgue`.
   - `I` preserves `μ_A` (§2.4). So `T = I ∘ (Λ⁻¹ R Λ)` preserves `μ_A`.

   Unit circle: `Λ(s, δ) = (exp(i(s + δ + π/2)), −cos δ)`; `Λ(I(T(s, δ))) = Λ(s + 2δ, π − δ) = (−exp(i(s + δ + π/2)), cos δ) = R(Λ(s, δ))`; Jacobian of `Λ` is `sin δ`. The instance the present statement excludes is the `C¹` circle–ellipse table of §1.1 (`k = 1` exactly, one-sided `∂s₁/∂s` equal to `1` and `7` at the diameter state): the argument above applies to it unchanged. BialyMironov2022 lines 172–178 give the same `(p, φ)` description of the form.

   **Repair.**

   1. README §3.3, replace "for a table `γ` of class `C^k` with `k ≥ 2`," by "for every table `γ` (`k ≥ 1`),", and replace the sentence "Route: the Jacobian identity of §3.2 … does not see the values off `A`." by:
      "Route: by §1.4, `Λ(s, δ) = (exp(iδ)τ(s), exp(iδ)τ(s) × γ(s))` is a homeomorphism of `A` onto the open set of oriented lines meeting the interior of `Ω`. It carries `μ_A` to the restriction of `dθ ⊗ Lebesgue` on `Circle × ℝ`: with a continuous tangent angle `θ`, `(s, δ) ↦ (s, δ + θ(s))` is a translation in each fibre, and for a fixed direction `e` the function `s ↦ e × γ(s)` is `C¹` with derivative `e × τ(s) = −sin δ` on the arc of states of direction `e`. The reversal `R(e, c) = (−e, −c)` preserves `dθ ⊗ Lebesgue` and `Λ⁻¹ ∘ R ∘ Λ = I ∘ T` (§1.4), so `T = I ∘ Λ⁻¹ ∘ R ∘ Λ` preserves `μ_A`, as `I` does (§2.4); `μ_A` does not see the values off `A`. For `k ≥ 2` the Jacobian identity of §3.2 and change of variables on `[0, ℓ) × (0, π)`, with `AddCircle.measurePreserving_mk`, give a second proof."
      Change `*Needs:* §3.2;` to `*Needs:* §1.4, §2.4; §3.2 (second proof);`.
   2. README §3.3 Checks, add: "The `C¹` circle–ellipse table of §1.1 (`k = 1`): `T` preserves `μ_A` although it is not `C¹`; on the unit circle `Λ(s, δ) = (exp(i(s + δ + π/2)), −cos δ)`, with Jacobian `sin δ`, and `Λ(I(T(s, δ))) = (−exp(i(s + δ + π/2)), cos δ) = R(Λ(s, δ))`."
   3. README line 3: "for `k ≥ 2` it proves that the map is a `C^{k−1}` diffeomorphism and an exact area-preserving monotone twist map with the chord length as generating function" and move "`sin δ dδ ds` as invariant measure" to the `k ≥ 1` clause; in the end-theorem sentence replace "under the billiard map of a table of class `C^k`, `k ≥ 2`" by "under the billiard map of every table". Line 203: delete "and invariant measure" and "–3.3" from "the differentiable twist, exactness and invariant measure of §§3.2–3.3 and 4.3". Line 363 (§4.4, first Check): "For every table". §5.3: add, before the Lipschitz statement for billiards, "For every table (`k ≥ 1`), every rotational invariant curve `C ⊆ A` of `ConvexTable.billiardMap γ` is the graph of a continuous function `AddCircle ℓ → (0, π)` (the graph theorem with §4.3 and §4.4)."
   4. `Suggested.lean`: delete `(hk : 2 ≤ k)` from `ConvexTable.measurePreserving_billiardMap`; docstring "The billiard ball map of every convex table (class `C^k`, `k ≥ 1`) preserves …"; module docstring, Layer 3 bullet, "`k ≥ 1`".

2. **F02** (P3) `hcop` is not needed in `ConvexTable.exists_two_periodic_orbits`

   **Location.** `packages/MathematicalBilliards/Suggested.lean:236` (`(hcop : p.Coprime q)`); README:527 ("and coprime `0 < p < q`, there are two periodic configurations").

   **Claim.** Two `Γ`-inequivalent configurations of type `(p, q)` exist for coprime `p`, `q`.

   **Witness.** `(p, q) = (2, 4)`: a configuration `s` of type `(1, 2)` has `s (j + 4) = s j + 2ℓ`, the same gaps and the same reflection law, so `IsPeriodicConfiguration 2 4 s` holds; the conclusion `∀ m n, ∃ j, s′ j ≠ s (j + m) + n ℓ` does not mention `(p, q)`. So the `(1, 2)` pair proves the `(2, 4)` case.

   **Repair.** `Suggested.lean`: delete `(hcop : p.Coprime q)`; docstring "and integers `0 < p < q`". README §6.4: "for every table of class `C^k`, `k ≥ 1`, and integers `0 < p < q`, there are two periodic configurations … The coprime case is the content: for `d = gcd(p, q)`, a configuration of type `(p/d, q/d)` is one of type `(p, q)` (for `(2, 4)`, the two `(1, 2)` orbits traversed twice), and the relation by `Γ` does not depend on the type." Keep "coprime" in §§6.1–6.3 and in the route.

3. **F03** (P3) "orientation-preserving" is undefined in §5.2, and §4.1 asserts an isotopy with no route or owner

   **Location.** README:401 ("Let `H` be an orientation-preserving homeomorphism of `AddCircle ℓ × Ico a b`"); README:310 ("descends to a homeomorphism of the annulus … isotopic to the identity, hence orientation preserving").

   **Claim.** §5.2 has a hypothesis on a homeomorphism that the roadmap never defines; §4.1 derives it from "isotopic to the identity".

   **Witness.** No section, supplier contract or pinned declaration defines orientation preservation of a homeomorphism of a surface with boundary. That a boundary-preserving homeomorphism of the closed annulus is isotopic to the identity is a theorem (Alexander trick on the annulus) that no layer proves and no `*Needs:*` line cites; nothing consumes it. Herman1983 line 1150 uses the hypothesis only to fix left and right.

   **Repair.** README:310: "A twist lift descends to a homeomorphism of the annulus `AddCircle ℓ × [a, b]` that preserves each boundary circle and its direction (the boundary restrictions are increasing, being equivariant injective continuous maps of `ℝ`); it maps each boundary line onto itself." README:401: "Let `H` be a homeomorphism of `AddCircle ℓ × Ico a b` with a lift `F` to `ℝ × Ico a b` commuting with `(x, y) ↦ (x + ℓ, y)` (this is the orientation-preserving case of Herman1983, Appendice, line 1150: `H` preserves the boundary circle, and `F` is increasing on the boundary line), whose lift deviates the verticals". Instance: the reflection `(x, y) ↦ (−x, y)` has only lifts with `F(x + ℓ, y) = F(x, y) − (ℓ, 0)` and is excluded; the shear is included.

4. **F04** (P3) Herman1983 3.4.3 does not define the non-wandering set

   **Location.** README:352 ("Define `nonwanderingSet f` … (Herman1983, Chapitre I, 3.4.3, lines 425–432)"); `Suggested.lean:172–173`.

   **Claim.** The locator supports the definition by returns of neighbourhoods.

   **Witness.** Herman1983 lines 425–432 assume that the non-wandering set is the whole space and restate that assumption as a property of open sets `U` with `f(U) ⊂ U`; the set itself is named, not defined, and no neighbourhood-return condition appears.

   **Repair.** README:352: "(the standard definition, stated here; Herman1983, Chapitre I, 3.4.3, lines 425–432, uses the notion, in the case where every point is non-wandering, without defining it)". `Suggested.lean` docstring of `nonwanderingSet`: replace "(Herman1983, Chapitre I, 3.4.3)" by "(the standard definition; used in Herman1983, Chapitre I, 3.4.3)".

One P2 finding (R01) and three P3 findings (R02–R04). No statement of `Suggested.lean` or bold target of the README was found false; no supplier citation is broken; the dependency check is clean.

## Verified sound

Counts: 16 declarations of `Suggested.lean` read (9 definitions, 7 theorems) and the proved `example`; 52 README subsections with every bold target read; 31 line locators verified against the cached texts (Herman1983 10, Hochman2012 8, BialyMironov2022 8, ChaikaForni2026 5), one of which does not support its claim (R04); 182 Check bullets read, every one with a numerical value recomputed (the values are in the table below and in R01), none found false or vacuous, and every definition has at least three; 11 sibling citations resolved (9 sections on main, 2 at an open head); 56 pinned declarations grepped (38 Mathlib, 18 Tau Ceti), all present with the stated content.

**Dependency check** (output): `depcheck: 229 roadmaps, 2056 edges, 0 problem(s)`. No UPWARD or CYCLE line. The roadmap is line 404, the last, of `merge-order/ORDER.txt`.

**Policy.** `git diff --stat origin/main...HEAD` touches only `packages/MathematicalBilliards/` (10 files). No pull-request number, process word, `lemma`, `set_option`, `#eval`, `True` placeholder or sorry'd data in the README or the Lean file. Imports: `import Mathlib` and `TauCeti.Analysis.Semigroups.Group.Unitary`, which exists at the pin and is used. No gap is declared (`design/plan.json` has `gaps = []`) and none is needed.

**Binders.** I compared the 16 elaborated types of `scratch/signatures.md` with the README statements; no binder is lost (I ran no Lean). After R01 and R02 the two changed signatures must be checked again with `#check @name`.

**Headlines and padding.** End theorems of the README: (1) invariance of `sin δ dδ ds`, (2) Birkhoff's graph theorem, (3) two Birkhoff orbits, (4) measure preservation and reversibility of the polygonal flow, (5) the unfolding theorem, (6) the eigenfunction criterion. (1), (2), (3), (6) are stated; (4), (5), with non-ergodicity and the genus formula, are named in the module docstring as not statable, each with the missing carrier (the polygonal flow, the glued surface). No declaration is padding: none follows from one tactic or one pinned lemma (no Wiener lemma, continuous-time mean ergodic theorem, non-wandering set or weak mixing of `ℝ`-actions exists at the pins; `TauCeti.Probability.metProjection` and Mathlib's `tendsto_birkhoffAverage_orthogonalProjection` are discrete). The one `example` (the unit circle is a `ConvexTable ⊤ (2π)`) is proved and tests the orientation convention of the carrier.

**Ownership.** Searched main and the open heads by object (`billiard`, `translation surface`, `weak mixing`, `mean ergodic`, `Wiener`, `non-wandering`, `twist map`, `Koopman`, `cone angle`, `rotation number`, `invariant curve`). Owners found and correctly cited: SymplecticGeometry/CotangentLagrangian C3.1 (smooth billiards), FactorRigidity §8.2, ProbabilisticAndMetricNumberTheory §4.9a (`scalarLpKoopman_strong`, continuous actions). Not duplications: OperatorTheory/UnboundedOperators (open) constructs one explicit translation surface with a `14π` cone point and no general carrier; IncompressibleFlows (open, not citable) plans Koopman groups of continuous flows. No `Suggested.lean` declares one of this file's fully qualified names.

**Adversarial pass.**

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `ConvexTable` | unit circle; clockwise circle; stadium; superellipse; `C¹` circle–ellipse | `1 − cos(t − s) > 0`; `cos(t − s) − 1 < 0`; `0` along a segment; tangent `x = 1` meets only `(1, 0)`; curvatures `1` and `a/b² = 4` | determines orientation, strictness; sound |
| `ConvexTable.billiardLift` | `δ ∈ (0, π)`; `δ = 0`; `δ = π`; `δ ∈ (π, 2π)`; `δ = 5π/2` | `e × τ(s) = −sin δ < 0`, set `[s₁, s + ℓ)`; set `(s, s + ℓ)`, `s₁ = s`, `δ₁ = 0`; set `∅`, `sInf = 0`; set `(s, s₁′]`, `sInf = s`; `e = −1`, image `(π, π/2)` | agrees with README §2.1, §3.3 |
| `ConvexTable.billiardMap` | circle `R` | `(s, δ) ↦ (s + 2Rδ, δ)`; wrong angle gives `I ∘ T`, square `(s + ℓ, δ)` | sound |
| implicit derivatives §2.2 | circle; general | `∂Φ/∂s = sin δ − κL`, `∂Φ/∂s₁ = sin δ₁`, `∂Φ/∂δ = −L`; circle `1` and `2R` | sound |
| `phaseMeasure` | total mass; `δ < π/2` | `2ℓ`; `ℓ` | sound |
| `ConvexTable.measurePreserving_billiardMap` | ellipse `(2 cos u, sin u)` at `(2, 0)`, `δ = π/4`; `k = 1` | exit `(6/5, 4/5)`, `cos δ₁ = 11/√146`, `sin δ₁ = 5/√146`, `det = √73/5`, `sin δ₁ · det = 1/√2 = sin δ`; line-space proof needs only `C¹` | true; `hk` not needed (R01) |
| `IsTwistLift` | shear; rotation `(x + 1/4, y)`; inverse of a positive lift; `a = b` | `F₁ = x + y` increasing; constant, fails; boundary maps `f_a < f_b` so `f_b⁻¹(c) < f_a⁻¹(c)`, decreasing; vacuous, excluded by `hab` | sound |
| `nonwanderingSet` | `(x, y²)` on `AddCircle 1 × [0, 1]`; `x + 1` on `ℝ` | interior box moves off itself when `(y₀ + ε)² < y₀ − ε`; empty | sound |
| `IsRotationalInvariantCurve` | `δ = c`; small circle; two circles | degree `1`; null-homotopic; not an injective image of `Circle` | sound |
| `isGraph_of_isRotationalInvariantCurve` | rotation by `1/4` with `t ↦ (t + 0.1 sin 8πt, 1 + 0.1 sin 8πt)`; shear; boundary circles | `dx/dt = 1 + 0.8π cos 8πt < 0` somewhere, map not a twist; graph of `1`; excluded by `hCo` | hypotheses of Herman1983 line 1150 all present |
| Lipschitz bound §5.3 | circle; shear conjugated by `y + ε sin 2πx` | `1/(2R)` and `−1/(2R)`, graph constant; slopes of `C` at most `2πε`, bound `1 + 2πε` | sound |
| `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve` | circle | all curves `δ = c`: an invariant graph `ψ` is constant on orbits, dense for `ψ/π ∉ ℚ` | sound |
| rotation numbers §5.4 | circle; `α = √2/2`, `q = 7`, `p = 5`; two lifts with fixed points | `c/π`, `1/3`, `2/3 = 1 − 1/3`; `p − qα = 0.0503 < 0.1`; both `0` with `g₁ < g₂` | sound |
| `ConvexTable.IsPeriodicConfiguration` | equilateral; `(0, π/2, π)`; `s_j = jπ√2` with `q = 0`; collapsed `(0, 0, 0, ℓ)` | `1/2 = 1/2`; `0 ≠ 1/√2`; excluded by `0 < q`; excluded by strict gaps | sound |
| `ConvexTable.exists_two_periodic_orbits` | `(1, 2)` on the ellipse; `Γ`; `(2, 4)` | `W = 8` and `4`; `σ^q = d^p`, stabiliser forces `mp + nq = 0`; doubled `(1, 2)` orbits | true; `hcop` not needed (R02) |
| collapsed limits §§6.3–6.4 | gaps `(0, 0, ℓ)` | `W′(0+) = 4ℓ/3 = 2p(q − p)ℓ/q` | sound |
| polygonal layers 7–9 | square with hole; corners `π/2`, `2π/3`, `3π/2`, `0.9π`; `π/8` triangle | angle sum `8π = (8 − 2 + 2)π`; `2, 2, 1, 2 = ⌈π/α⌉`; `N = 8`; `f = Re((conj d · v)^N)` fixed by rotations `2π/N` and conjugated by reflections | sound |
| translation surfaces 10–11 | octagon; cone disc `k`; `S_P` of square with hole | cone angle `8 · 3π/4 = 6π`; `k · π(r^k/k)² = πr^{2k}/k`; `χ = 0 + 8 − 16 = −8`, `Σ(m_v − 1)|G|/(2n_v) = 8` | sound |
| unfolding §11.4 | `θ = 1` on the square; reflection step | two labels `id`, `conj`; `σ_S gθ` goes to copy `g⁻¹σ_S`, glued to `g⁻¹` along `S` | sound |
| `IsWeaklyMixing` | half-torus under the horizontal flow; one point | `μ = |1/2 − t|`, mean of `||1/2 − t| − 1/4|` is `1/8`; `0` | sound |
| `tendsto_average_norm_charFun_sq` | `δ₀`; `(δ₀ + δ₁)/2`; Lebesgue on `[0, 1]` | `1`; `1/2 = 1/4 + 1/4`; `0`; sum at most `σ(ℝ)²`, summable | sound |
| `exists_tendsto_twistedAverage` | `e₁` on `AddCircle 1`, `a = 0, 1`; identity group | `⟨e₁, U_t e₁⟩ = exp(2πit)`, atom at `2π`; `A_T⁰e₁ → 0`, `A_T¹e₁ = e₁`; `(1 − exp(−2πiaT))/(2πiaT) → 0` | signs agree with `charFun` |
| `isWeaklyMixing_iff` | non-ergodic action; `a = 0` atom; `a ≠ 0` | indicator of an invariant set is a non-constant `f`; `⟨1, P₀f⟩ = ⟨1, f⟩ = 0`; `∫f = 0`, `|⟨f, U_t f⟩|² = ‖f‖⁴` | both directions sound |

Supplier statements read at their source and found to match the contracts: C3.1 (`v` tangential component, `S = −‖χ(t) − χ(s)‖`, `β̃*λ − λ = dℓ`, `exists_billiard_periodic_reflection`, the circle formula, finite-volume recurrence), I5.0 (`y = −∂₁S`, `Y = ∂₂S`), I5.4 (continuity for a compact subset, the cup-length bound), Surfaces §3.1 (`integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi`), GeometricTopology §2.3 (the cases `n + 1 ≤ 3`) and §1.7 (genus `(2 − χ − b)/2`).

## Not verifiable

- KatokHasselblatt1995 (Sections 9.2, 9.3, Chapter 13), Tabachnikov2005 (Chapters 3, 7), ChernovMarkarian2006 (Chapter 2), BoldrighiniKeaneMarchetti1978 (§2), ZemlyakovKatok1975, KerckhoffMasurSmillie1986 (Theorem 1): waived, no text. From memory, twist maps and their Birkhoff orbits are KatokHasselblatt1995 Section 9.3 and billiards Section 9.2, so the two section numbers in §4.1 and §§6.1–6.4 may be exchanged; I could not check it.
- MasurTabachnikov2002 (§1) and Birkhoff1927 (§§1–3): uncertified; the cached text of Birkhoff1927 is a blocked-request page.
- Elaboration: I ran no Lean. The signatures are those of `scratch/signatures.md`.
- Board packages on other pull requests' heads were not read; ownership was checked against main and the open roadmap heads only.

## Source issues

- **Misprint** in Hochman2012 at Lemma 6.1.6, items 2 and 3, printed p. 57: the source says the Cesàro averages of `|a_n − a|` and of `(a_n − a)²` equal `0`; it should be that they tend to `0`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e5e370d0cfccf9605f5eb0ca83a614264ecca59f", "job": "RT-MathematicalBilliards~1b", "model": "fable", "worker": "chris-l"} -->
