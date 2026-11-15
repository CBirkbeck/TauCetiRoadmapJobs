# FIX-DESIGN-Varifolds~8: repair of the Varifolds design

The review REV-DESIGN-Varifolds~7 has two findings, both P3. Both are verified and both are applied.
The same-pattern search for F02 found five more places where a letter fixed by the Conventions names
a second object. All five are repaired.

Files edited:

- `packages/Varifolds/design/README.md`
- `packages/Varifolds/design/plan.json`

`packages/Varifolds/sources.toml` is unchanged: no new work is cited and no source was fetched. The
review's "For the human reviewers" section (two licence questions) lists no finding, so nothing was
changed for it. The review contains no instruction-like text.

## F01 (P3) — applied

**What changed.** README 6.3 lower bound, old: "‖δV‖ ≤ Λ‖V‖ on U … for the ρ admitted in 6.2". New:
U is open in W, and for x ∈ spt‖V‖ ∩ U the mass bound holds for 0 < ρ < ρ_0, where κ and ρ_0 are
as in 6.2 and B_{ρ_0}(x) ⊆ U. Also: one new Check, and plan.json 6.3 statement, API and test.

**Verified.** Take V = v([−a, a] × {0}, 1) in W = ℝ², U = B_a(0), Λ = κ = 0 and x = 0.

- δV(X) = ⟨X(a, 0), e_1⟩ − ⟨X(−a, 0), e_1⟩, so ‖δV‖ = δ_{(−a,0)} + δ_{(a,0)}. Both atoms lie outside
  the open ball U.
- 6.2 admits any ρ_0 in ℝ² with κ = 0.
- At ρ = 2a: ‖V‖(B̄_{2a}(0)) = 2a < 4a = ω_1·2a.

The old wording "for the ρ admitted in 6.2" is therefore false. 6.2's ratio hypothesis on (0, ρ_0)
follows from "‖δV‖ ≤ Λ‖V‖ on U" only when B_{ρ_0}(x) ⊆ U.

**Details (README 6.3, lower bound).** Old: "‖δV‖ ≤ Λ‖V‖ on U … for the ρ admitted in 6.2". New:

- ‖δV‖ ≤ Λ‖V‖ on an open U ⊆ W.
- If moreover x ∈ spt‖V‖ ∩ U, κ ≥ 0 and ρ_0 are as in 6.2 (the three conditions are restated) and
  B_{ρ_0}(x) ⊆ U, then 6.2's ratio bound holds for 0 < t < ρ_0, and the mass bound holds for
  0 < ρ < ρ_0.
- A new 6.3 Check gives the segment witness and the equality case 2ρ = ω_1ρ for ρ < a.

**plan.json 6.3.** The review says this entry needs no change. That is not right:

- Its "lower bound" API line read "Theta >= 1 on spt for rectifiable V with Theta >= 1 a.e.", with no
  ratio-bound hypothesis. It is false at the endpoint (a, 0) of the same segment, where Θ = 1/2.
- The statement's last clause had the same gap.

Both now carry the hypothesis on U and the mass bound with B_{ρ_0}(x) ⊆ U. The witness was added as
the test "ball inside U", so the README and plan.json both have 7 Checks for 6.3.

**Same pattern.** Every other use of a ratio bound states its ball explicitly:

- 6.1's two companion bullets.
- 6.3's existence clause and both semicontinuity clauses, which are local.
- 7.1's route, which uses the ratio bound on chart balls of A_{ij}.
- 8.2, which uses only the density.

No other passage uses the mass lower bound.

## F02 (P3) — applied

**What changed.** 7.5: W → V (statement, route, Checks). 7.6: W_i → Ṽ_i, the rescalings of V_i,
with h_i and ψ_i named. plan.json 7.5: W → V. Same pattern: N → m (7.6), σ → σ_V (6.4 Check),
M(V) → 𝐌(V) (1.3, 2.2, 3.2), and V → S for subspaces (1.1, Tau Ceti contract, plan.json 1.1).

**Verified.** The Conventions say "W ⊆ M is open", and Layer 7's standing setting and 7.4 use W in that
sense. 7.5 used W for an integral varifold, and 7.6's route used W_i for rescaled varifolds. 7.5
contains no other V.

**Details.**

- README 7.5 (statement, route and the three Checks that name it): W → V. This covers ‖V‖(B_3(0)),
  ‖δ_h V‖, dV(y, S), Θ^k(‖V‖, y), spt‖V‖, ‖V‖(B_2(x)) and ‖δV‖(B_ρ(y)).
- README 7.6 route: W_i → Ṽ_i, "the rescaled varifolds of V_i at x with scale λ_i (4.5's blow-up
  form, with the chart exp_x of g and the metric g_i)". The metrics are named:
  h_i(z) = (exp_x^* g_i)(λ_i z). They converge to g_x in C², because D h_i = λ_i DG_i(λ_i·) and
  D²h_i = λ_i² D²G_i(λ_i·), where G_i = exp_x^* g_i.
- ψ_i is now defined: the fibre sum of multiplicities of Ṽ_i over the slab {|q| < ε}.
- plan.json 7.5: W → V in the statement and the hypotheses. plan.json 7.6 contains no W, so it is
  unchanged.

**7.6 wording.** "Convergence of the fibre multiplicities in L¹" is now "the convergence of the fibre
multiplicities given by the area formula". L¹ convergence of ψ_i would make 7.5 superfluous. What the
area formula and tilt → 0 give is convergence of ψ_i·Lᵏ as measures.

**Same pattern: a letter fixed by the Conventions naming a second object.**

- **7.6:** "min(ψ_i, N) … integers N > θ(x)" → m. N is the ambient dimension, and 7.5's ε(δ, Λ, k, N)
  uses it in that sense.
- **6.4 Check** (half-line): "σ = δ_0" → "σ_V = δ_0". In Layer 6, σ is also the radius of 6.1–6.3.
- **Mass M(V) → 𝐌(V)** in 1.3 (definition), 2.2 (𝐌(v(Γ, θ))) and the 3.2 Check. M is the manifold;
  bold 𝐌 is the literature's mass symbol.
- **V → S** for a point of `TauCeti.finiteGrassmannian` in:
  - the 1.1 comparison bullet (P_V → P_S, O⁻¹(V) → O⁻¹(S), e⁻¹(V) → e⁻¹(S));
  - the Tau Ceti contract entry;
  - plan.json 1.1's API entry.

  In the Conventions, V is the varifold and S the plane. The 1.1 Check values are unchanged: e = R_φ
  gives P_{ℓ_{θ−φ}}.

**Considered and left unchanged.**

- B_i, the exceptional sets of 7.1 and 7.4. The Conventions' balls always carry a centre, and B_i is
  introduced as a set in the same clause (as in Simon1983 line 7570).
- η_{x,λ} against η_V. The Conventions fix both, side by side, with different subscripts. Undecorated
  η occurs only next to σ_V or H_V.
- The flat metric e (introduced at the 4.5 Check) against 1.1's local isometry e, and U in 1.1. U is
  not a Conventions letter.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 6.3 mass lower bound | segment [−a, a], U = B_a(0), Λ = κ = 0, x = 0 | ρ = 2a: 2a against 4a (old wording fails); ρ < ρ_0 ≤ a: 2ρ against 2ρ | old false, new holds with equality | B_{ρ_0}(x) ⊆ U added; Check added |
| 6.3 mass lower bound | unit circle in ℝ², U = ℝ², Λ = 1 (\|H\| = 1, σ_V = 0), κ = 0 | ρ = 0.5: 4 arcsin(ρ/2) = 1.011 against e^{−ρ}2ρ = 0.607; ρ = 1: 2.094 against 0.736; ρ = 1.9: 5.013 against 0.568 | holds | none |
| 6.3 mass lower bound | great circle on S², κ = 1, Λ = 0, ρ_0 ≤ π/2 | ρ = 0.5: 1.0 against 0.607; ρ = 1.5: 3.0 against 0.669 | holds | none |
| 6.3 mass lower bound | triple junction, x = 0; v(L, 1/2) | 3ρ ≥ e^0·2ρ; v(L, 1/2): ρ < 2ρ, with Θ = 1/2 violating the hypothesis | holds; the hypothesis is necessary | none |
| 6.3 density ≥ 1 on spt ∩ U | endpoint (a, 0) of the segment | Θ = 1/2; if U ∋ (a, 0), then ‖δV‖({(a,0)}) = 1 > Λ·0, so the hypothesis fails | consistent; old plan.json line false | plan.json fixed |
| 7.5 (renamed) | m v(ℝ^k × {0}, 1), h = e | m ≤ (1 + δ)m + δ | holds | W → V |
| 7.5 (renamed) | two sheets ℝ × {±ε/2}, k = 1 | 2(1 + δ)(1 − ε²/16)^{1/2} + δ: 3.496 (δ = 0.5, ε = 0.2) and 2.900 (δ = 0.3, ε = 0.05), each ≥ 2 | holds | W → V |
| 7.6 route (renamed) | v(L, 1) + v(L_i, 1) at x ∈ L; h_i | ψ_i = 2 off a small set, min(ψ_i, 3) → 2 = θ; h_i − g_x = G_i(λ_i z) − G(0) → 0, Dh_i = O(λ_i), D²h_i = O(λ_i²) | sound | W_i → Ṽ_i, N → m |
| 7.6 min against max | θ non-integer, m > θ | max(ψ_i, m) ≥ m > θ cannot tend to θ; min is used | sound | none |
| 1.1 comparison (renamed) | e = id, S = span(cos θ, sin θ); e = R_φ; O-law | P_{ℓ_θ}; R_{−φ}P_{ℓ_θ}R_φ = P_{ℓ_{θ−φ}}; (Oe)⁻¹P_S(Oe) = e⁻¹P_{O⁻¹S}e | sound | V → S |
| 1.3 mass (renamed) | δ_{(x,P)}; v(Γ, θ); V_{0,λ} of [0, 1] × {0} | 𝐌 = 1; ∫_Γ θ dHᵏ; λ⁻¹ = λ^{−1}·1 (k = 1) | sound | M → 𝐌 |
| 6.4 Check (renamed) | half-line [0, ∞) × {0} | δV(X) = ∫_0^∞ ∂_t X¹ dt = −X¹(0), so σ_V = δ_0 and η_V = −e_1 | sound | σ → σ_V |

## Checks run

Dependency check (`gate --candidate packages/Varifolds/design/README.md --only Varifolds`):

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2232 edges, 0 problem(s)

There is no UPWARD and no CYCLE line. No supplier was added or removed.

Other checks:

- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `plan.json`: valid JSON, 34 targets, 34 distinct ids, at least 3 tests per target.
- README: no LaTeX delimiters.

There is no `Suggested.lean` at the design stage, so the `#check` comparison was not run.

## For the maintainer

- No new construction, target or supplier was introduced. Ownership against open pull requests needed
  no new search.
- No name or section that other roadmaps cite changed. Layer and section numbers are unchanged.
- The notation changes are 𝐌 for mass, S for points of the finite Grassmannian, V in 7.5 and Ṽ_i in
  7.6. They are internal to this roadmap.
