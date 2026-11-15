# Repair of LieGroupsPartII design

The review REV-DESIGN-LieGroupsPartII~5 has three findings. Each was checked against:

- LieGroups on main (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`, Layer 9, and its `Suggested.lean`);
- RealSemisimpleLieGroups at the head of its open pull request, read with `roadmaps show`;
- the pinned Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.

All three findings are right. F01 and F03 are applied with a different proof route from the one the review suggested; the reasons are given below. F02 is applied as asked.

Only `packages/LieGroupsPartII/design/README.md` and `packages/LieGroupsPartII/design/plan.json` changed. `sources.toml` needed no change: `knapp2002` already lists 2.2 and 6.3 in `cited_for`. No source was fetched and no request file was written.

There is no acceptance file at the design stage. So no Lean command was run, and no `#check` comparison was possible.

## F01 (P2) — applied differently

Old: §2.2 imported `Ad(K⁰)`-conjugacy and exhaustion from LieGroups Layer 9, with no plan target. New: §2.2 is a target here. It proves (a) `𝔭 = ⋃_{k∈K⁰} Ad(k)𝔞`, (b) `Ad(K⁰)`-conjugacy of maximal abelian subspaces, (c) `K = N_K(𝔞)·K⁰` and `G = N_K(𝔞)·G⁰`, and (d) `𝔷_𝔭 ⊆ 𝔞`. It has a proof sketch and five Checks, and plan target 2.2 is `ReductiveCartanDatum.exists_conj_maximalAbelian`.

Verification of the finding: LieGroups README line 1361 (Layer 9, "Restricted roots and KAK") says only "First prove Ad(K)a=p by the maximal-abelian symmetric-pair argument". In LieGroups' `Suggested.lean`, `𝔞` is a field of `IwasawaData` (line 509ff), and no declaration states conjugacy. A search of main and the open heads finds only RealSemisimpleLieGroups §1.3, which proves the Lie-algebra form for semisimple `𝔤₀` under `K_θ ⊆ Int(𝔤₀)`.

Why the route differs from the review's:

- **The route for (a).** The review would apply Layer 9 to the restriction to `G⁰`. But Layer 9 states `Ad(K)𝔞 = 𝔭` only for the `𝔞` of an `IwasawaData`. Applying it to an arbitrary maximal abelian subspace of the `G⁰` datum would first need §2.6, which builds that `IwasawaData` and comes later in Layer 2.
- **The route used instead.** §2.2 runs the symmetric-pair argument directly on the compact group `K⁰`:
  - Choose a regular `H ∈ 𝔞`, using the joint eigenspaces of the commuting `B_θ`-symmetric operators `ad 𝔞`. Mathlib supplies these as `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute` (`Mathlib/Analysis/InnerProductSpace/JointEigenspace.lean`), which is live at the pin; the deprecated alias is the doubled-namespace name.
  - Maximize `k ↦ B(Ad(k)X, H)` over `K⁰`.
  - The first-order condition is `B(Z, ⁅Y, H⁆) = 0` for every `Z ∈ 𝔨`. Since `B` is negative definite on `𝔨`, this forces `⁅Y, H⁆ = 0`.
  - Its inputs are §1.1, LieGroups Layers 1 and 9 (compactness of `K`, polar decomposition), and Tau Ceti `map_lieExp`, which gives `lieExp 𝔨 ⊆ K`.
- **Clause (c) added.** §2.4's proof, §4.2 step 1 and the new §6.3 route all use `K = N_K(𝔞)·K⁰`. They previously cited "the proof of §2.4" for it, so it is now stated as clause (c) and cited as §2.2(c).

The same pattern was repaired everywhere it occurs:

- Scope: Layer 9 now owns "`Ad(K)𝔞 = 𝔭` for the maximal abelian subspace of an `IwasawaData`". This roadmap now owns `K⁰`-conjugacy and the two factorizations. The RealSemisimpleLieGroups paragraph mentions its §1.3.
- LieGroups contract: "maximal-abelian conjugacy and exhaustion are consumed directly" is replaced by a sentence saying §2.2 proves the `K⁰` form without consuming it.
- Mathlib contract: a new bullet for the joint-eigenspace theorem.
- "How to read the build": "the imported conjugacy" became "the conjugacy … under `K⁰`".
- Layer 7 Dependencies: "maximal-abelian conjugacy" is dropped from the LieGroups Layer 9 item.
- Layer 2 Dependencies: `map_lieExp` and the Mathlib theorem are added.
- §2.4 proof sketch and §4.2 step 1 now cite §2.2(c), and the §4.2 *Needs* line gains §2.2.
- Plan: `target:2.2` is added to the prerequisites of 2.3, 2.4, 2.5, 3.1, 4.2, 6.3 and 7.3b. The LieGroups supplier `what` no longer lists "maximal-abelian conjugacy/exhaustion".

All other Layer 9 attributions were rechecked and are present in LieGroups lines 1199–1365: central periods (1220), the polar decomposition `cartan_polar_decomposition` (1230), compactness and maximality (1226), and the normalizer quotient, reflection representatives and chamber coverage (1355–1361).

## F02 (P3) — applied

Old: "`linearLieAlgebra G` contains every `X` with `exp(tX) ∈ G` … closed under sums, scalars, commutators and transposition." New: "For closed `G` it is closed under sums, scalars and commutators and is the Lie algebra of `G` as an embedded Lie subgroup. When `G` is transpose-stable, so is `linearLieAlgebra G`, by `Matrix.exp_transpose`." The sentence that restated the definition is deleted.

Also changed:

- The unitriangular Check in §7.1 now records that `linearLieAlgebra G = ℝE₁₂` is a Lie subalgebra while `E₂₁ ∉ ℝE₁₂`.
- Plan 7.1b gains the test `unitriangular`. Its API already carried both hypotheses.

The pattern was searched across Layer 7 and the plan, and no other statement about `linearLieAlgebra` lacks a hypothesis. Three were checked:

- `ad X` is real-diagonalizable for symmetric `X` with no hypothesis, since `ad X` is self-adjoint for `tr(AᵀB)`.
- `K = G ∩ unitarySubgroup` is the `θ`-fixed group for every `G`.
- §7.1 proper is stated for self-adjoint linear groups.

Note for the reviewer: closure under sums and commutators actually holds for every subgroup. If `exp(ℝX)` and `exp(ℝY)` lie in `G`, the subgroup they generate is arcwise connected, so by Yamabe's theorem it is an analytic subgroup whose Lie algebra contains `X` and `Y`. Only transposition really fails without its hypothesis. The closed form is kept because the roadmap uses only closed `G`, plan 7.1b already states it, and Yamabe's theorem is not available at the pins or from any supplier.

## F03 (P3) — applied differently

Old: §6.3 assumed "a reductive Cartan datum whose Iwasawa triple satisfies the component condition". New: it holds for every Iwasawa triple. Its first proof bullet now shows that every `Ad(G)`-conjugate of a `𝔮_{Π'}` is an `Ad(G⁰)`-conjugate of some `𝔮_{Π''}`, using:

- `G = G⁰·N_K(𝔞)` (§2.2(c));
- some `n₀ ∈ N_{K⁰}(𝔞)` with `n₀n·Σ⁺ = Σ⁺`, from §2.3 and RealSemisimpleLieGroups §1.2;
- `Ad(n₀n)𝔮_{Π'} = 𝔮_{n₀n·Π'}`.

Two Checks are added, `Aut(𝔰𝔩_3(ℝ))` and `O(1,1)`.

Why the route differs: the review's bullet uses "`Ad(g)` carries a Borel subalgebra of `[𝔤,𝔤]_ℂ` to one". Read at `TauCeti.borelSubalgebra`, that means the image of `borelSubalgebra H b` under a Lie algebra automorphism is `borelSubalgebra (φH) (φ_*b)`. No such transport lemma exists in `TauCeti/Algebra/Lie/Weights/Borel.lean` (declarations at lines 123–727, none about maps or automorphisms), nor in any supplier. The `N_K(𝔞)` route needs only §§2.2–2.3 and RealSemisimpleLieGroups §1.2.

Plan 6.3 changes:

- the statement and the comparison sentence: no component condition, for every Iwasawa triple;
- the hypothesis "the component condition holds" is removed;
- `target:2.4` is dropped and `target:2.2`, `target:2.3` and `roadmap:RealSemisimpleLieGroups 1.2` are added;
- tests `AutSL3_outer` and `O11_abelian` are added.

README changes outside §6.3: the *Needs* line, Layer 6 Dependencies (RealSemisimpleLieGroups §1.2 added), the RealSemisimpleLieGroups §1.2 contract bullet (consumers now §§2.1, 2.4–2.6, 4.1, 4.2, 6.3), and the Scope and Summary lines ("without the component condition").

Every other use of the component condition was checked; each is needed, with its witness in the README:

- §3.1 last bullet;
- §3.3(f) (`O(1,1)`: `N_G(P) = G ≠ P`);
- §2.5's "`M` under the condition" (`O(1,1)`: the stabilizer of `Σ⁺` is `K ≠ M`);
- the RealSemisimpleLieGroups clauses of §4.2;
- §6.2(ii) (`Aut(𝔰𝔩_3(ℝ))`: `Q(X₀) = P ⊔ σAd(w₀)P ≠ Q_∅`);
- the `LinearComponentCondition` statements of §7.3 (`O(1,1)`).

## Adversarial mathematics pass (changed or added statements)

`S = ((0,1),(1,0))`, `R_φ` = rotation through `φ`, `Y = ((0,1),(1,0))` in `O(1,1)`, `d = diag(1,−1)`.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.2 step 1 (regular `H`) | `GL_2`, `𝔞` diagonal; `O(1,1)`; compact | `(e₁−e₂)(diag(1,−1)) = 2 ≠ 0`, `Z_𝔭(diag(1,−1))` = diagonal; `Σ(𝔞) = ∅` so every `H` is regular and `Z_𝔭(H) = 𝔭 = 𝔞`; `𝔞 = 𝔭 = 0`, `H = 0` | Holds | — |
| §2.2(a) | `GL_2`, `X = S`, `H = diag(1,−1)`; `H = 1` | `Ad(R_φ)S = ((−sin2φ, cos2φ),(cos2φ, sin2φ))`, `B(Ad(R_φ)S, H) = −2 sin 2φ`, maximum `2` at `φ = −π/4`, value `diag(1,−1) ∈ 𝔞`; for `H = 1`, `B(Ad(k)S, 1) = tr S = 0` constant, maximizer `k = 1` gives `S ∉ 𝔞` | Holds; regularity needed | Checks added |
| §2.2(a) degenerate | `O(1,1)`; `ℝ ⋊ C₂`; compact | `K⁰ = 1`, `𝔨 = 0`, `𝔭 = 𝔞 = ℝY`; `K_a = {(0,0),(a/2,1)}`, `K⁰ = 1`, `𝔭 = 𝔞 = ℝ`; `𝔭 = 0` | Holds with `k = 1` | Check added |
| §2.2(b) | `GL_2`, `𝔞' = ℝ1 ⊕ ℝS`; `ℝS` | `SM = MS` for `M = ((a,b),(b,c))` iff `a = c`, so `Z_𝔭(S) = 𝔞'`; `Ad(R_{−π/4})𝔞' = span(1, diag(1,−1)) = 𝔞`; `dim ℝS = 1 < 2` and `1 ∉ ℝS` | Holds; maximality needed | Checks added |
| §2.2(c) | `O(1,1)`; `Aut(𝔰𝔩_3(ℝ))`; `ℝ × S¹`; `ℝ ⋊ C₂` | `|K| = 4`, all normalize `𝔞` (`d` acts by `−1`), `K = K·1`, 4 components; `σ ∈ K ∖ K⁰` acts on diagonal `𝔞` by `−1`, so `σ ∈ N_K(𝔞)`; `K = {0} × S¹` connected; `G = K_a·ℝ` | Holds | — |
| §2.2(d) | `GL_2`; `ℝ × S¹` (`θ_c`); `SL_2` | `𝔷_𝔭 = ℝ1 ⊆` diagonal; `𝔷_𝔭 = 𝔭_c = 𝔞`; `𝔷 = 0` | Holds | — |
| §2.4 sketch via §2.2(c) | `O(1,1)`, `GL_2` | `N_K(𝔞) = K`, `K⁰ = 1`, `(|W_G|, |W(Σ)|) = (2, 1)`, condition fails; signed permutations (8 elements) meet `det < 0` | Consistent with §2.4 Checks | Citation only |
| §4.2 step 1 `G = N_K(𝔞)·G⁰` | `GL_2`; `O(1,1)` | `diag(−1,1) ∈ N_K(𝔞)` has `det = −1`; `N_K(𝔞) = K` meets all 4 components | Holds | Citation only |
| §6.3, `Ad(n)𝔤^β = 𝔤^{n·β}` | `SL_2`, `n = ((0,−1),(1,0))` | `nE₁₂n⁻¹ = −E₂₁ ∈ 𝔤^{−α}`; `Ad(n)` acts on `𝔞` by `−1`, so `α ∘ Ad(n)⁻¹ = −α` | Holds | — |
| §6.3 criterion without the condition | `Aut(𝔰𝔩_3(ℝ))`, `𝔮_{{α₁}}` | `σ𝔮_{{α₁}} = {X₁₃ = X₂₃ = 0}` = stabilizer of `ℝe₃` = `Ad(w₀)𝔮_{{α₂}}`; `det(−w₀) = 1`, so `Ad(w₀) ∈ Int = G⁰`; `n₀σ: diag(h₁,h₂,h₃) ↦ −diag(h₃,h₂,h₁)`, `α₁ ↦ h₂ − h₃ = α₂`; it contains the lower triangular Borel, `𝔷 = 0` | Both sides hold | Check added |
| §6.3 degenerate | `O(1,1)` | `𝔤 = 𝔷 = ℝY`, `𝔨 = 0`, `𝔮_∅ = 𝔤`, `[𝔤,𝔤] = 0` with Borel `0`; subalgebras `0` (fails `⊇ 𝔷`, not parabolic) and `𝔤` (both hold) | Both sides agree | Check added |
| §6.3 centre condition | `GL_2`, trace-zero upper `𝔮`; `ℝ·1` | `dim 𝔮 = 2` against `dim 𝔮_∅ = 3`, `dim 𝔮_Π = 4`; `ℝ·1 ⊗ ℂ ∩ 𝔰𝔩_2(ℂ) = 0` has no Borel | Unchanged Check still holds | — |
| §7.1 API (F02) | unitriangular; `GL_n`; `SL_n`; discrete | `linearLieAlgebra = ℝE₁₂`, `[E₁₂, E₁₂] = 0`, `E₂₁ ∉`; all matrices, transpose-stable; `tr Xᵀ = tr X`, so trace-zero is transpose-stable; `0` | Hypotheses needed only for transposition | Bullet and Check rewritten |

## Check outcomes

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

Other checks:

- **Citations.** `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found nowhere. That run did not check Mathlib and Tau Ceti names, so the new names `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute` and `map_lieExp` were opened at the pins by hand.
- **Plan graph.** The plan has 33 targets, and every `target:` prerequisite exists. One prerequisite points forward: 2.3 → 2.6. It predates this round, is not part of any finding, and creates no cycle, since 2.6 needs only 1.1, RealSemisimpleLieGroups §1.2 and LieGroups Layer 9. It was left as it is.
- **Lean.** There is no acceptance file at the design stage, so there was no elaboration and no `#check` comparison.

## Ownership and maintainer notes

- **Ownership.** `roadmaps grep` for conjugacy of maximal abelian subspaces finds only RealSemisimpleLieGroups §1.3 (open), which covers semisimple `𝔤₀` under `K_θ ⊆ Int(𝔤₀)`. It is cited in Scope and in §2.2 for ownership only, not consumed. Nothing on main states the `K⁰` group form with centre, so this roadmap owns it (§2.2). The open heads were searched through the tool's index of the 474 open roadmap pull requests.
- **New name.** The plan target `ReductiveCartanDatum.exists_conj_maximalAbelian` (2.2) is new. No id was dropped or renumbered, and no other roadmap cites a changed id.
- **Suspicious text.** The review contains no instruction-like text.
