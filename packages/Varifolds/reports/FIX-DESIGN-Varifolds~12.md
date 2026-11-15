# FIX-DESIGN-Varifolds~12: repair of the Varifolds design

The review REV-DESIGN-Varifolds~11 has two findings, F01 (P3) and F02 (P3). Both are right. F01 is
applied, with one change to the suggested repair: the suggested sentence says "G_k(W') is empty", but
1.1 defined G(E, k) only for k ≤ dim E, so that sentence would have no meaning. I therefore also
extended 1.1's definition to every k ≥ 0. F02 is applied as asked.

Files edited:

- `packages/Varifolds/design/README.md`
- `packages/Varifolds/design/plan.json`

`packages/Varifolds/sources.toml` is unchanged: no new source is cited.

## F01 (P3) — applied

**Verified.** 1.1 defined G(E, k) only for 0 ≤ k ≤ dim E. In 3.1, M' is any Riemannian manifold,
so for the witness (f(y) = y_1 from ℝ² to ℝ, k = 2) the target bundle G_2(ℝ) was undefined. The two
sources do not cover this case either:

- Simon1983 line 7443–7448 (39.1) has source and target both open in ℝ^{n+k}.
- AgnolettoCorreaHoyosDaSilvaNardulli2025 line 188 (Definition 2.5) assumes d < min{d_1, d_2}.

The general statement nevertheless holds once the carrier is defined for every k:

- The set of rank-k self-adjoint idempotents of E is empty when k > dim E. This is also what the
  Conventions' Lean carrier gives, and what Tau Ceti's `TauCeti.finiteGrassmannian` gives (a
  subtype of submodules of finrank k).
- Mathlib's `LinearMap.normDet` is 0 exactly when the kernel is nonzero
  (`LinearMap.normDet_eq_zero_iff_ker_ne_bot`, `Mathlib/Analysis/InnerProductSpace/NormDet.lean`
  line 111). So J_S f ≡ 0 when dim M' < k.

**Changes.**

- **1.1.** Old: "E and 0 ≤ k ≤ dim E, define …". New: "an integer k ≥ 0 …; for k > dim E,
  G(E, k) = ∅, the fibre of 3.1's target bundle; the statements below take 0 ≤ k ≤ dim E."
- **1.1, image-plane bullet.** Adds "(empty when dim F < k)".
- **1.1, degenerate Check.** Adds "G(ℝ, 2) = ∅".
- **3.1.** Adds after the definition: "No bound on dim M' is assumed: if dim M' < k, then df_x is
  injective on no k-plane, J_S f ≡ 0, every G(T_yM', k) is empty (1.1), so G_k(W') = ∅ and
  f_#V = 0, the only k-varifold on W'; for dim M' ≥ k this case does not arise."
- **3.1, new Check.** Takes f(y) = y_1, k = 2 and V = v(D, 1) for the open unit disc D. Then
  normDet(df_x) = 0 and f_#V = 0. A model that drops the Jacobian and records the image line gives a
  1-varifold of weight 2√(1 − t²) dt, with mass π.
- **plan.json.** 1.1's statement, hypotheses, image-plane API entry and degenerate test now say the
  same. 3.1's statement and a new test "target of dimension below k" also say the same.

**Same pattern elsewhere.** I checked every use of G(F, k) or of a push-forward into another
manifold:

- 1.1's isometry bullets have dim F ≥ dim E ≥ k.
- 1.2's isometries and 3.2's dilations and blow-ups keep the dimension.
- 4.4's isometries keep the dimension.
- 5.2's inclusion goes into ℝ^L with L ≥ N ≥ k.
- 9.1–9.2 use diffeomorphisms and isometries.

1.1's image-plane bullet was the only other statement in which F may have dimension below k. It is
the one repaired above.

## F02 (P3) — applied

**Verified.** Take the review's witness V = v(L_1, 1) + v(L_2, 2), with L_1 and L_2 the coordinate
axes of ℝ², and x = (1, 0).

- The ball B_2(x) contains 0. It meets spt‖V‖ in the connected cross ((−1, 3) × {0}) ∪ ({0} × (−√3, √3)),
  which carries the multiplicities 1 and 2. So the "every neighbourhood with connected trace"
  reading of the bullet is false.
- The repaired reading is true. Let U ∋ x be open and suppose spt‖V‖ ∩ U is a connected C² embedded
  k-submanifold of U. Then:
  - the restriction of V to U is stationary in U, since fields with compact support in U extend by
    0 to W;
  - its support is spt‖V‖ ∩ U (1.3);
  - it is nonzero, since x ∈ spt‖V‖.

  So 6.4 gives the restriction as θ_0[spt‖V‖ ∩ U] with θ_0 > 0.
- Such U exist. Regularity gives a C² submanifold near x. The domain of one of its slice charts at
  x, with a cube as image, meets it in a k-cube, which is connected.

**Change (9.1).** Old: "on a neighbourhood U of x with spt‖V‖ ∩ U connected, V⌞U = θ_0[…]". New:
"for every open U ∋ x such that spt‖V‖ ∩ U is a connected C² embedded k-submanifold of U, the
restriction of V to U is θ_0[spt‖V‖ ∩ U] …". The new text adds the reasons above (stationary,
support, nonzero), "Such U exist" with the slice-chart argument, and the witness as a new Check.

**plan.json.** 9.1's "constant multiplicity" API entry now says the same. A test "connected support
is not enough" is added.

**Same pattern elsewhere.** I searched for other uses of "neighbourhood". 7.2's "locally bounded first
variation on a neighbourhood of x" is an existence hypothesis, so it is correctly quantified. 6.4
already assumes Σ connected. 7.3 applies 6.4 to a k-plane, which is connected.

## Adversarial pass (changed statements)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 G(E, k) for all k ≥ 0 | E = ℝ, k = 0, 1, 2; E = ℝ², k = 0, 2 | p² = p and p = p* on ℝ give p ∈ {0, 1}, of ranks 0 and 1, so G(ℝ, 0) = {0}, G(ℝ, 1) = {1}, G(ℝ, 2) = ∅; G(ℝ², 0) = {0}, G(ℝ², 2) = {1}; S ↦ P_S is a bijection ∅ → ∅ for k > dim E | sound |
| 1.1 API restricted to k ≤ dim E | complement map, E = ℝ, k = 2 | G(ℝ, dim E − k) = G(ℝ, −1) is meaningless, so the restriction is needed | restriction kept |
| 1.1 image plane, dim F < k | E = ℝ², F = ℝ, k = 2, P = 1, L = (1, 0) | ker L = span e_2 ≠ 0 on range P; A = Q*Q + 1 − P = diag(1, 0), which is singular; the open set is empty, G(ℝ, 2) = ∅ | sound |
| 3.1, dim M' < k | f(y) = y_1, k = 2, V = v(D, 1) | normDet(df_x) = 0 (ker ≠ 0), f_#V = 0; the wrong model's weight is ∫_{−1}^{1} 2√(1 − t²) dt = π | sound |
| 3.1 chain rule through a lower dimension | f(y) = y_1, h(t) = (t, 0), k = 2 | J_{ℝ²}(h ∘ f) = normDet(diag(1, 0)) = 0, so (h ∘ f)_#V = 0, and h_#(f_#V) = h_#0 = 0 | consistent |
| 3.1 other API bullets, dim M' < k | same f | spt‖f_#V‖ = ∅ ⊆ f(D̄) = [−1, 1]; the mass bound 0 ≤ (sup‖df‖)²‖V‖(f⁻¹A); Γ⁺ = ∅, so v(∅, ·) = 0; f is not an immersion (2 > 1), so the equality clause is vacuous | consistent |
| 3.1, dim M' = k (unchanged) | f(y) = y_1, k = 1, V = v([0, 1] × {0}, 1) | J = 1, f_#V = v([0, 1], 1) in G_1(ℝ) = ℝ × {1}, mass 1 | unchanged |
| 9.1 constant multiplicity | crossing axes with multiplicities 1, 2, x = (1, 0) | the ball B_2(x) is excluded (a cross, not a submanifold); B_{1/2}(x) gives spt ∩ U = (½, 3/2) × {0}, θ_0 = 1 | sound |
| 9.1, disconnected trace | parallel lines with multiplicities 1, 2 and a ball meeting both | the trace has two components and is excluded; balls meeting one line give θ_0 = 1 or 2 | sound |
| 9.1, k = N | V = c[W] with W connected | reg² V = W; every connected open U ⊆ W gives c[U], θ_0 = c | sound |
| 9.1, V = 0 | — | reg² V = ∅; the bullet is vacuous | sound |

## Checks run

**Dependency check.**

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 243 roadmaps, 2246 edges, 0 problem(s)

There is no UPWARD or CYCLE line. No supplier changed. No *Needs:* line changed. The new Checks use
only 1.1, 2.2, 6.4 and the Conventions, which are earlier in the build or already named.

**plan.json.** It parses, and is written back in its original formatting (one-space indent,
non-ASCII kept). The edited targets now have the following numbers of tests:

- 1.1: 7 (unchanged)
- 3.1: 5
- 9.1: 5

**Lean.** There is no `Suggested.lean` at the design stage. Nothing was elaborated, and the
`#check` comparison does not apply.

**Ownership.** No new object is introduced. `roadmaps grep -i varifold --readme-only` finds hits
only on main (GeometricCurrents, GeometricMeasureTheory, MinimalSurfaces), as in the previous
round.

**Style.** Grep for LaTeX delimiters, machine paths and pull-request numbers in the README found
none.

## For the maintainer

- No id changed or was removed. No name that another roadmap cites changed.
- 1.1 now defines G(E, k) for every k ≥ 0, empty for k > dim E. Its API is still stated for
  0 ≤ k ≤ dim E.
- The review's "Source issues" note (Simon1983, 41.1, connectedness of M ∩ U) is for the humans. It
  needs no edit: 6.4 already assumes Σ connected, and 9.1 now asks for spt‖V‖ ∩ U to be connected.
- The review's "For the human reviewers" items (licences of Simon1983 and of the arXiv preprint)
  are not findings. Nothing was changed for them.
