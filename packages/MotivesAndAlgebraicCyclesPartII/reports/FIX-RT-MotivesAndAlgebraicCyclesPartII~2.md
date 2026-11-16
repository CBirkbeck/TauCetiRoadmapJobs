# FIX-RT-MotivesAndAlgebraicCyclesPartII~2: red-team round 2 repaired

Files changed: `packages/MotivesAndAlgebraicCyclesPartII/README.md`, `packages/MotivesAndAlgebraicCyclesPartII/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged: no declaration and no gap is added or removed.

## RT-MotivesAndAlgebraicCyclesPartII~2a/F01 (P2) — applied differently

**Changed.** In the §4.4 route, the false sentence about the degree vectors of `∏(T − a_i)^{k_i} − t` is replaced. The route now defines product coordinates and the degree vector, and uses sections `(T − a_i)^m − ct` for a general `U` (discs `{|T − a_i| ≤ ρ_i}`, `δ_i = min(R, min_{j≠i}|a_i − a_j|)`). It names `P_t` as a non-example. E10 is added, E1's last sentence now points to E10, and E4 is reworded.

**Evidence.** The witness holds: `∏_r(T_r − a_j) = (−1)ⁿP_t(a_j) = (−1)^{n+1}t` for every `j`. The reviewer's repair assumed `U` normalised to equal radii with centres at mutual distance one. A configuration at several scales (centres `0, ϖ, 1`, radius `ρ < |ϖ|`) does not reduce to that form, so the repair is stated for a general `U`.

## RT-MotivesAndAlgebraicCyclesPartII~2a/F02 (P3) — applied

**Changed.** In the §7.4 API, "applied to the inclusions `ℤ ⊕ A_{<1} → B`" becomes "applied to the ring maps `ℤ ⊕ A_{<1} → B`, `(n, a) ↦ n · 1_B + a`, which carry `A_{<1}` isomorphically onto the ideal `A_{<1}` of `B` and need not be injective (`(p, −p) ↦ 0` for `ℚ_p`, `B = ℤ_p`)". This matches the hypothesis of gap:kh-excision.

**Pattern.** §7.1's "`B ⊃ I`" and "unital ring containing `I` as an ideal" are correct and stay.

## RT-MotivesAndAlgebraicCyclesPartII~2a/F03 (P3) — applied

**Changed.**
- §5.2 defines `(G_m, 1)`, the Tate unit (`− ⊗ ℚmot[(G_m, 1)]`) and Tate interchange (the swap on `ℚ(1)[1]^{⊗2}`, which is `−1` by §5.1 and the Koszul sign).
- §4.4: product coordinates and degree vector are defined (see F01). The Check now reads `V = V₁ ∩ ⋯ ∩ V_e`, giving `ℚ^{de}`, and E4 is reworded to match.
- §11.4 defines coconnectively faithfully flat (Scholze p. 60).
- §9.6 cites EnhancedDerivedSheaves §E5:presentability.4 `dualizable_filteredColimit`.
- §9.2: "`X = Marc(C)/G`…" (Scholze p. 54).

## RT-MotivesAndAlgebraicCyclesPartII~2a/F04 (P3) — applied

**Changed.** The items added are:

- Layer 0: gap replete-postnikov.
- Layers 1 and 2: gap compact-hausdorff-dimension.
- Layer 3: Mathlib `NormedField`, `IsUltrametricDist`; Tau Ceti `Subring.unitClosedBall`, `TauCeti.mem_unitBallIdeal`.
- Layer 4: EnhancedDerivedSheaves §E5:animation.1.
- Layer 7: EnhancedDerivedSheaves §E2.4, PerfectoidSpaces §P2.13 and TropicalAndBerkovichArithmetic §0.16.
- §6.2 *Needs*: §2.3.
- Scope: "Layers E1–E3 and E2" becomes "Layers E1–E3".

**Pattern.** A script compared every Dependencies line with the union of its layer's *Needs* lines and found nothing else.

## RT-MotivesAndAlgebraicCyclesPartII~2b/F01 (P1) — applied differently

**Changed.** The §6.2 route now passes from §1.3's sheaf cohomology to singular cohomology through ComplexComparisonPartII §C5.1 (`nonempty_sheafSingularComparison`: locally contractible spaces, natural in the space). It also proves that `U(n)/T → GL_n(ℂ)/T(ℂ)` is a homotopy equivalence: LieGroups Layer 8 writes every coset as `k u T(ℂ)`, and `u ↦ exp((1−s) log u)` contracts the fibres. The Scope, the supplier contracts, the §6.2 *Needs* line and the Layer 6 Dependencies are updated.

**Evidence.** The gap is real. One supplier on main (merge order line 40) gives the comparison directly, so the reviewer's added CharacteristicClasses §C1.2b is not needed.

## RT-MotivesAndAlgebraicCyclesPartII~2b/F02 (P2) — applied differently

**Changed.** Both routes are rewritten in this roadmap's words, with the steps made explicit; the reviewer's text was not copied.
- §4.9: §4.1 transfers give a trace, `p` is invertible on `M` (§4.8 over `X♭`), the composed retractions are compatible, and a split-injective map that is also split surjective is an equivalence.
- §7.1: `A = B[1/T]`, `E_K(A) = cofib(K(B on T) → K(ℤ))` by the octahedral axiom, completion is handled by §3.8, and `K(F_{<1})` is shown to be connective.

**Pattern.** The §7.4 API bullet that used the same source sentence is reworded too, and the field is renamed `F`.

## RT-MotivesAndAlgebraicCyclesPartII~2b/F03 (P3) — applied

**Changed.** §7.4 gains three Checks:
- The non-clopen cover `{|T| ≤ |ϖ|}`, `{|ϖ| ≤ |T| ≤ 1}` of `M(C⟨T⟩₁)`: the values of `Ḡ_m ⊗ ℚ` are `G, G, G ⊕ ℚ, G ⊕ ℚ`, the kernel is `G` and the map is onto.
- The negative control `f = T`, `g = 0`: the quotient is `C⟨T₁⟩`, a disc.
- A non-covering family `A⟨ϖ/T⟩`: `G` against `G ⊕ ℚ`.

**Evidence.** The reviewer's version of the last Check uses the Gauss-point family `A⟨T/ϖ⟩`, which does not discriminate: that disc has the same value `G`.

## RT-MotivesAndAlgebraicCyclesPartII~2b/F04 (P3) — applied

**Changed.** The `sources.toml` locator ends "§1 (pp. 4, 6), §2.3 (p. 12), §3 (pp. 14-15), §5.2 (p. 32) (arXiv v3 internal pagination)". Pattern: the README References now list §2.3, §3 and §5.2.

**Evidence.** The README cites §1 at p. 4 and p. 6 and §3 at pp. 14–15; Scholze §3 begins on page 14, at line 602. A script finds no Scholze theorem-type locator missing in either direction.

## Checks run

- `lake env lean` on `Suggested.lean` (unchanged): exit 0, no output. The file declares nothing, so there was no `#check @name` to compare.
- Dependency check: `depcheck: 260 roadmaps, 2504 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` (main e213fdd, 454 heads): no unresolved citation and no unresolved Lean name.
- Ownership: `roadmaps grep` for the sheaf/singular comparison over main and the open heads finds two other places. ArithmeticLocallySymmetricSpaces (on main) uses its own local step, and the open CohomologicalPointCounting is on the list of roadmaps never cited as suppliers. ComplexComparisonPartII §C5.1 (on main) owns the comparison, so it is cited, not restated. Nothing new is owned here.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §4.4 `P_t` | `a = (0,1)`, `k = (1,1)`; `k = (2,1)` | `T₊T₋ = −t = (T₊−1)(T₋−1)`; for `n = 3`: `∏T_r = ∏(T_r−1) = t` | always `(1,…,1)`: E10 |
| §4.4 `Q_{1,t}` | `ℂ₂`, `ρ = 1/4`, `b = 0`, `R = 2`, `s = (1/2, 2)` | `δ₁ = 1`, `m = 2`, `c = 4`; roots `|T| ∈ (2^{−3/2}, 2^{−1/2})`, `|T−1| = 1`; coordinates `−4t`, `1 − 4t` | vector `(1, 0)` |
| §4.4, `d = 1` | `δ₁ = R` | `|T − a₁| = |ct|^{1/m} ∈ (ρ₁, R)` | in `U` |
| §4.4 constants | `|T_k − a_i| ∈ (ρ_i, δ_i)` | `|T₁ − T₂| < δ_i ≤ |T₂ − a_j|` | one-unit ratio |
| §4.4 Check | `d = 3`, `e = 2` | `de = 6` against `e² = 4` | consistent with E4 |
| §6.2 deformation | `n = 2`, `u = [[1,x],[0,1]]` | `t⁻¹ut = [[1,t₁⁻¹t₂x],[0,1]]`, which is compatible; `w⁻¹uw` is lower triangular | only the inclusion is equivariant |
| §6.2 trace | `n = 2` | `+1` on `H⁰`, `−1` on `H²`, trace `0` | regular representation |
| §7.4 ring maps | `ℚ_p`, `ℤ_p` | `(p,−p) ↦ 0`; the identity on `pℤ_p` | gap:kh-excision applies |
| §7.4 cover Check | `C⟨T⟩₁` | kernel `{(u,(u,0))} ≅ G`, cokernel `0` | matches `H¹ = 0` |
| §7.4 unit ideal | `f = T`, `g = 0` | quotient `C⟨T₁⟩` | hypothesis needed |
| §7.1 cofibre | octahedron | `K(A) ⊔_{K(B)} K(ℤ) = cofib(K(B on T) → K(ℤ))` | sound |
| §7.1 `B[1/T]` | `B = ℤ ⊕ A_{<1}` | `T·(m,−m) = 0`: `T` is a zero divisor, but the derived fibre is unchanged by completion | sound |
| §7.1 field | `F`, `O_F`, `κ` | `π₋₁K(F_{<1}) = coker(ℤ → ℤ) = 0` | connective |
| §4.9 | `b` split mono, `b∘a` an equivalence | `b` is also split epi | `a` is an equivalence |
| §11.4 | fibre of a map of coconnectives | `H^{<0}(fib) = 0` | conservative ⇔ detects zero |

## For the maintainer

- ComplexComparisonPartII (on main) is a new supplier.
- No id is renumbered.
- E10 records a tenth slip in Scholze (Lemma 6.5, p. 38, lines 1626–1627).
- No suspicious instructions were found in the reviews.
