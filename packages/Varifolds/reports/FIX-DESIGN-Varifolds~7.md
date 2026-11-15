# FIX-DESIGN-Varifolds~7: repair of the Varifolds design

The review REV-DESIGN-Varifolds~6 has three findings, all P3. All three are verified. Two are applied
as written. One (F01) is applied with a corrected supplier description and a shorter route.

Files edited: `packages/Varifolds/design/README.md` and `packages/Varifolds/design/plan.json`.
`packages/Varifolds/sources.toml` is unchanged: no new work is cited, and the new citations are
pinned Tau Ceti and Mathlib declarations. The review's "For the human reviewers" section (two licence
questions) lists no finding, so nothing was changed for it.

## F01 (P3) — applied differently

**Verified at the Tau Ceti pin `2fd255d9`.** The pin has the following:

- `TauCeti.finiteGrassmannian` (`TauCeti/Topology/Grassmannian/Basic.lean:52`) with the frame-quotient
  topology (line 240).
- `CompactSpace` for `RCLike 𝕜` (`Orthonormal.lean:225`).
- `T2Space` (`Plucker.lean:89`).
- `Unique` at rank 0 (`Basic.lean:185`) and `Subsingleton` at rank N (`Basic.lean:198`).

The README did not mention this carrier.

**Change.** Old: 1.1 proved compactness with no comparison, and the Tau Ceti contract had no
Grassmannian. New:

- A "From Tau Ceti" contract entry.
- A scope clause in "Owned here" saying why the projection presentation is kept.
- An "Owned elsewhere" bullet.
- A 1.1 API bullet: V ↦ e⁻¹P_V e is a homeomorphism `TauCeti.finiteGrassmannian ℝ k N` ≅ G(E, k).
- A 1.1 Check.
- Additions to *Needs:*, the Mathlib contract (`Continuous.homeoOfEquivCompactToT2`), Layer 1's
  Examples and Dependencies, the Summary, and `plan.json` 1.1 (5 prerequisites, 1 API entry, 1 test).

**Why the suggested repair was not taken verbatim.** It says the Tau Ceti carrier "carries no metric
and no projection operator". The second half is false at the pin:
`TauCeti.finiteGrassmannian.continuous_starProjection_toEuclidean` (`Tautological.lean:110`) is the
continuous map V ↦ orthogonal projection onto V.

So the route uses that lemma for continuity, `toEuclidean_injective` for injectivity, and
compact-to-Hausdorff to get a homeomorphism. It does not descend F(F*F)⁻¹F* through the frame
quotient.

Two more corrections:

- The contract now says only "no metric".
- I added the base-change law: replacing e by O∘e precomposes the map with V ↦ O⁻¹V.

**Same pattern.** Layer 1's Dependencies already omitted Tau Ceti's Prokhorov lemma, which 1.4 uses.
It is now listed. No other passage cites a Grassmannian supplier.

## F02 (P3) — applied

**Verified.** For a segment from a to b with unit tangent τ, δ(X) = ⟨X(b), τ⟩ − ⟨X(a), τ⟩. So the
outward co-normals are τ at b and −τ at a.

- At the peak (1/2, 1/2): (1, 1)/√2 + (−1, 1)/√2 = (0, √2).
- At a trough (i = 3, corner (2/3, 0)): (1, −1)/√2 + (−1, −1)/√2 = (0, −√2).

The vectors (1, ±1)/√2 named in the README are the tangents; their sum is (√2, 0).

**Change (7.4 zigzag Check).** Old: "the two unit co-normals (1, ±1)/√2 there add up to a vector of
length √2". New: the co-normals and their sums at a peak and at a trough as above, plus "the unit
tangents would add up to the horizontal (√2, 0), the wrong direction for the atom". The masses
√2(i − 1) + 2 and the value √2 + 2 at i = 2 are unchanged.

**Same pattern.** The other co-normal values in the README are correct:

- README line 135 and the 4.4 Check: half hyperplane, η = −e_1.
- 6.4 Check: a line with multiplicity 1, then 2, gives δV(X) = −X¹(0), so η = −e_1.
- 6.4 Check: half-line, σ = δ_0.

## F03 (P3) — applied

**Verified.** The README used F both for a closed subset of W and, inside φ ∘ F, for the unnamed map
(x, S) ↦ (f(x), df_x S). Simon1983 line 7448 calls that map F.

**Change (3.1, continuity bullet).** Old: "(the integrand J_S f · (φ ∘ F) extends continuously by 0
to {J = 0})". New:

- The integrand is (x, S) ↦ J_S f(x) φ(f(x), df_x(S)), for φ compactly supported and continuous on
  G_k(W'). It extends by 0 to {J = 0}.
- On G_k(F) it vanishes outside the compact set G_k(f⁻¹(π(spt φ)) ∩ F).
- A cutoff χ∘π, with χ = 1 on that set, turns it into a test function with the same integrals.
  This uses the fact that every V_j and V is carried by G_k(F) (1.3).

`plan.json` 3.1's "continuity" API entry previously said "uniformly proper", a term the README never
defines. It now matches the README.

**Same pattern.** "∘ F" occurs nowhere else; the other "φ ∘" uses (1.3 line 401, 2.3 chart) are
well-typed.

## Adversarial pass on the changed text

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 comparison, degenerate ranks | k = 0; k = N; N = 0 | {⊥} ↦ e⁻¹0e = 0 = G(E,0); {⊤} ↦ e⁻¹1e = 1 = G(E,N); EuclideanSpace ℝ (Fin 0) = 0, one point each side | sound | Check added |
| 1.1 comparison, k > N | finiteGrassmannian empty (`isEmpty_of_lt`) | G(E, k) empty too; excluded by 0 ≤ k ≤ dim E | sound | none |
| 1.1 comparison, values | e = id, V = span(cos θ, sin θ) | ff^T = [[cos²θ, cos θ sin θ], [cos θ sin θ, sin²θ]] = P_{ℓ_θ} | sound | Check |
| 1.1 direction convention | e = R_φ | e⁻¹P_{ℓ_θ}e = R_{−φ}P_{ℓ_θ}R_φ = P_{ℓ_{θ−φ}}; the wrong convention ePe⁻¹ gives P_{ℓ_{θ+φ}} | pinned | Check |
| 1.1 wrong model F F* | frame (1, 1) | ½[[1,1],[1,1]] is idempotent; [[1,1],[1,1]]² = 2[[1,1],[1,1]], not idempotent, so not in G | excluded | Check |
| 1.1 base change O∘e | e = id, O = R_φ | (Oe)⁻¹P_V(Oe) = P_{O⁻¹V}: ℓ_θ ↦ P_{ℓ_{θ−φ}} = map_id(O⁻¹ℓ_θ) | sound | stated |
| 1.1 surjectivity | P ∈ G(E, k) | ePe⁻¹ is self-adjoint idempotent, range e(range P) of dim k, = starProjection of its range | sound | route |
| 1.1 self-adjointness | e a linear isometry equivalence | (e⁻¹Pe)* = e*P*(e⁻¹)* = e⁻¹Pe since e* = e⁻¹ | sound | route |
| 1.1 homeomorphism | compact source, Hausdorff target | `CompactSpace` (Orthonormal.lean:225) for ℝ; G(E,k) ⊆ normed space | sound | none |
| 3.1 integrand continuity | fold f(t) = t², V = v([−1,1],1) | \|2t\|φ(t²) → 0 at t = 0 (J = 0); ∫_{−1}^{1} \|2t\|φ(t²)dt = 2∫_0^1 φ | sound | none |
| 3.1 compact support on G_k(F) | (x,S) ∈ G_k(F), integrand ≠ 0 | J ≠ 0 and f(x) ∈ π(spt φ) = K ⇒ x ∈ f⁻¹(K) ∩ F, compact by properness; π proper (1.2) | sound | text |
| 3.1 properness of F needed | V_j = v({j}×[0,1],1) → 0, f = (0, y_2) | f_#V_j = v({0}×[0,1],1) for every j, but f_#0 = 0: no compact f⁻¹(K) ∩ F | hypothesis needed, present | none |
| 3.1 cutoff | χ = 1 on f⁻¹(K) ∩ F | V_j carried by G_k(spt‖V_j‖) ⊆ G_k(F) ⇒ ∫(χ∘π)·integrand dV_j = ∫ integrand dV_j | sound | text |
| 7.4 peak, i = 2 | corner (1/2, 1/2) | (1,1)/√2 + (−1,1)/√2 = (0, √2), mass √2; total √2 + 2 | sound | text |
| 7.4 trough, i = 3 | corner (2/3, 0) | (1,−1)/√2 + (−1,−1)/√2 = (0, −√2); total 2√2 + 2 = √2(3 − 1) + 2 | sound | text |
| 7.4 wrong model (tangents) | peak | (1,1)/√2 + (1,−1)/√2 = (√2, 0): same length, wrong direction | excluded | Check text |

## Checks run

Dependency check (output verbatim):

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2229 edges, 0 problem(s)

There is no UPWARD or CYCLE line.

`roadmaps resolve packages/Varifolds/design/README.md` reports no cross-roadmap citations and no
Lean names found nowhere. The tool does not check Lean names outside TauCetiRoadmap on this host.
So I opened every new name at the pins myself:

- `TauCeti.finiteGrassmannian` (Basic.lean:52).
- `TauCeti.finiteGrassmannian.toEuclidean`, `TauCeti.finiteGrassmannian.toEuclidean_injective`,
  `TauCeti.finiteGrassmannian.continuous_starProjection_toEuclidean` (Tautological.lean, namespace
  `TauCeti.finiteGrassmannian`).
- `Continuous.homeoOfEquivCompactToT2` (Mathlib `Topology/Homeomorph/Lemmas.lean:479`, namespace
  `Continuous`; Mathlib pin `1b1ccf4b`).

There is no `Suggested.lean` at the design stage, so no elaboration and no `#check` comparison was
run. `plan.json` still parses: 34 targets, every new test kind and API role is one already in use, and
`gaps` is empty.

I also checked the edited text for LaTeX delimiters, machine paths and process words: none.

## Gate failures

None were listed for this round.

## Notes for the maintainer

**Ownership.**

- The projection presentation G(E, k) of an abstract finite-dimensional inner product space is still
  owned here.
- The coordinate carrier is Tau Ceti's, at the pin, and is now cited.
- `roadmaps grep` over main and the open heads finds no roadmap that owns a homeomorphism between
  `TauCeti.finiteGrassmannian` and rank-k star projections. The open TopologicalKTheory revision
  (the multi-roadmap pull request carrying it) uses `continuous_starProjection_toEuclidean` only to
  prove Hausdorffness of the coordinate carrier.
- GeometricCurrents G6 (main) compares its unoriented fibre with the same coordinate carrier
  (TopologicalKTheory T1.5). With 1.1 and 1.2, the three presentations now agree by stated maps.

**Names.** No name other roadmaps cite was renamed or dropped; no id moved.

**Sources.** No new source was fetched, and `needs-references.toml` was not written.
