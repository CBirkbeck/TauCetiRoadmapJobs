# Repair report: red-team round 2 (passes a and b)

Two reviews were merged. Pass a (RT-HeightsRationalPointsAndObstructionsPartII~2a) raises F01–F04; pass b (RT-HeightsRationalPointsAndObstructionsPartII~2b) accepts the head and raises no finding, so no section of this report carries a pass-b id. Every finding of pass a is settled below. All finding-driven edits are in `packages/HeightsRationalPointsAndObstructionsPartII/README.md` and `packages/HeightsRationalPointsAndObstructionsPartII/sources.toml`; `Suggested.lean` changes only in its import header (see "Gate repairs" below); `metadata.toml` and `design/plan.json` are unchanged.

## RT-HeightsRationalPointsAndObstructionsPartII~2a/F01 (P1) — applied

I verified the witness. For X = {0} in a non-constant elliptic curve A over K = acl(k(t)), Stab(X) = 0, X is special for k (torsion subvariety), but k_A = K. So the implication "special for k′ ⇒ k_A ⊆ k′" that the §9.6 route asserted after the stabilizer quotient is false without the reduction of xy-2022 lines 606–610 (replace (A, X) by (T_X − a, X − a), T_X the smallest torsion coset containing X). §9.6 route, old: stabilizer quotient, then the implication. New: stabilizer quotient; existence of T_X (the component through X of an intersection of torsion cosets is a torsion coset); the replacement by (T_X − a, X − a), with the reason specialness over every k′ is preserved (with finite stabilizer the abelian part of a special expression vanishes, and the constant part moves into T_X − a after a torsion translation); only then "special for k′ ⇒ k_A ⊆ k′" (the trace image contains a torsion translate of X, hence T_X = A); the second case for k′ ⊇ k_A, now stated as "special iff the image in A₀ ⊗ K̄ is defined over k′", which uses the finite stabilizer (the torsion part is one point over the algebraically closed k′). Added the Check with the witness: the reduced pair is the zero abelian variety, `k_{A,X}` = k although k_A = K. Pattern search: `k_A` and "special for k′" occur only in §§9.5–9.6; §§7.4, 9.9, 9.19 use specialness through §9.6 and are unchanged.

## RT-HeightsRationalPointsAndObstructionsPartII~2a/F02 (P2) — applied differently

The witness holds: on 𝒜 = E × ℙ¹ with L = pr₁^*O(3·0), M = O(1), the Segre embedding (n = 1) and P = (0, [T:1]), the sum n⁻¹h(P′) + h_{S̄,M}(π(P)) is 2 log T while the Weil height of L′ is log T + O(1). The function gh-2019 lines 187–189 call h_{A,L′} is defined as that sum; it is not the Weil height of L′, and the README's "up to O(1)" identity was wrong. I did not adopt the reviewer's sentence "h_{𝒜,L′}(P) = n⁻¹h(P′) + O(1)": the total space is not proper over S (GH remove finitely many points of S for the immersion), so a Weil height of L′ is not a well-defined class there, and no such identity is needed. §8.3 statement, old: "`h_{𝒜,L′}(P)` ≤ c(1 + ĥ)". New: ι is a closed immersion over S arising from (L′)^n, ι(P) = (P′, π(P)), the naive height `h_ι(P)` := n⁻¹h(P′) + h_{S̄,M}(π(P)) is defined, and h_{S̄,M}(π(P)) ≤ h_ι(P) ≤ c(1 + ĥ(P)) on X*. Route: the lower bound is h(P′) ≥ 0; the upper bound is Silverman–Tate (GH (10.2)) plus (1.1); no identity with a Weil height of L′ is used. Added the witness as a Check. Locator extended to gh-2019 lines 180–189; the `sources.toml` locator of gh-2019 names the naive height. No other section uses h_{𝒜,L′} (grep over the README).

## RT-HeightsRationalPointsAndObstructionsPartII~2a/F03 (P3) — applied

All three proposed Checks were recomputed and added, in the roadmap's own words.
- §9.1: the zero abelian variety descends over every subfield; the quadratic twist E of E₀ ⊗ k(t) by t (char k ≠ 2) has K̄/k̄-trace of dimension one but K/k-trace zero, because a homomorphism from a constant abelian variety becomes, over k(√t), a homomorphism between constants, hence defined over k and σ-fixed, while the twisting datum makes σ act by −1; so E is not defined over k up to isogeny. The Legendre Check now also records geometric trace zero (non-constant j has poles, a curve isogenous to a constant one has good reduction everywhere). The "generic j" of the proposal is not needed and is omitted.
- §9.5: lines y = tx and y = ux in 𝔸² over acl(k(t, u)) have minimal fields acl(k(t)) and acl(k(u)) (the algebraically closed subfields of acl(k(t)) are k and itself; the reduced generator has coefficient t ∉ k); they intersect in k, neither line is defined over k; y = 0 has minimal field k.
- §11.1: in characteristic two on the constant genus-two curve, the classes α with 2α = ω_C form a torsor under J[2](K̄) = J₀[2](k̄) (the K̄-points of a finite k̄-scheme, reduced or not, are its k̄-points), so every such pair is isotrivial.

## RT-HeightsRationalPointsAndObstructionsPartII~2a/F04 (P3) — applied

The witness holds: the translates of X = E × {0} in E² are E × {b}, parametrized by E, dimension 1 ≠ g = 2. §1.5 Check, old: "(dim S = g)". New: S is the image of A/Stab(X), dim S = g − dim Stab(X); for E × {0} in E² the dimension is one and (0, b) pins the translate, so m₀ = 1; finite stabilizer gives dimension g; X = A gives one point. The §1.4 Check and the Layer 1 Examples (translates of the diagonal in E × E form a one-dimensional family: 2 − 1 = 1) already agree with the corrected formula.

## Checks run

- `lake build TauCeti.AlgebraicGeometry.AbelianVariety.Albanese` from the content checkout (the object file was missing at the pin): exit 0, 3130 jobs.
- `lake env lean` on `packages/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` (after the header repair below): exit 0, exactly three warnings "declaration uses `sorry`" at lines 59, 77, 98, and no module-system warning. No declaration, docstring or statement changed this round.
- `#check @name` for the three declarations in a scratch copy of the file: elaborated once, exit 0. The printed types carry every binder of the README statements (F with its field and closure or number-field instances, X smooth proper geometrically integral of Krull dimension 1, x₀, J with J.dim = g, the Albanese hypothesis, c, ρ, s, Γ and the division-hull hypothesis); nothing was lost to `variable` scoping since the file uses none. No change.
- Dependency gate, exact output:

      depcheck: 207 roadmaps, 1786 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: the single lead "ArakelovGeometryAndAbelianHeightsPartII §§3.1" is the known false positive (that roadmap is the board design package `packages/ArakelovGeometryAndAbelianHeightsPartII`, earlier in the merge order); no Lean name is unresolved.

## Adversarial pass on changed statements

| Statement | Instances tried, values | Result, change |
|---|---|---|
| §9.6 route, T_X reduction | X = {0} in non-constant E over acl(k(t)): Stab = 0, T_X = {0}, reduced pair (0, {0}); special for every k′; `k_{A,X}` = k; k_A = K. X = E × {0} in constant E²: Stab = E × 0, quotient X = point, same conclusion `k_{A,X}` = k. X = E × {η} (η generic): quotient point (0, η) in E, T_X = E, tr ≠ 0 but = A over k′ = K only; special iff K ⊆ k′: field K, as the existing Check says. | Both existing Checks and the new one agree with the route; change applied. |
| §9.6, "intersection of torsion cosets through X is a torsion coset" | B₁ + t₁, B₂ + t₂ with X in both: component through X is (B₁ ∩ B₂)⁰ + c with c = b₁ + t₁ = b₂ + t₂; lifting t₂ − t₁ to torsion of B₁ × B₂ gives c ∈ (B₁ ∩ B₂) + torsion. Instance E² with B₁ = E × 0 + (0, τ), B₂ = 0 × E + (τ′, 0): intersection the torsion point (τ′, τ). | True; stated in one clause. |
| §9.6, specialness preserved under (T_X − a, X − a) | X = tr(Y) + (a′ + C′), Stab(X) finite ⇒ C′ = 0. Instance: A = E₀ ⊗ K × E (E non-constant), X = (C₀ ⊗ K) × {τ} with τ torsion: T_X = E₀ ⊗ K × {τ}, reduced pair (E₀ ⊗ K, C₀ ⊗ K), special for k on both sides. | True. |
| §9.6, "special ⇒ k_A ⊆ k′" after reduction | tr(A^{K/k}) ≠ A, X = tr(Y) + a′ ⇒ X ⊆ I′ + a′ with I′ = tr(A^{K/k′}) ⇒ T_X = A ⊆ I′ + a′ ⇒ I′ = A. Negative control: without T_X = A the Legendre witness gives I′ = 0 ⊉ A. | True with the reduction only; change applied. |
| §8.3 naive height | E × ℙ¹, Segre, P = (0, [T:1]): h(P′) = 0 + log T; h_ι = 2 log T; h_{L′} = log T + O(1); lower bound log T ≤ 2 log T; T = 1: 0 ≤ 0. Torsion section of a non-isotrivial family: ĥ = 0, h_ι ≥ h_{S̄,M} unbounded, so the upper bound fails off X*, as the existing Check says. | Identity replaced by a definition and two inequalities. |
| §1.5 translate family | E × {0} in E²: g − dim Stab = 2 − 1 = 1, one point pins; X = A: 2 − 2 = 0, S a point, m₀ = 1 (§1.5 first Check); finite stabilizer: g. Diagonal in E × E (Layer 1 Examples): 2 − 1 = 1. | Consistent; change applied. |
| §9.1 twist Check | B ⊗ K → E, over k(√t): g = ψ∘f′ defined over k, σ(g) = g; σ(ψ) = [−1]ψ, σ(f′) = f′ ⇒ σ(g) = −g ⇒ 2g = 0 ⇒ g = 0. char 2 excluded (twist by √t is inseparable, and 2g = 0 would not force g = 0); over K̄: E ≅ E₀ ⊗ K̄, trace dimension 1. | True; hypothesis char ≠ 2 kept. |
| §9.1 Legendre geometric trace | j = 256(t² − t + 1)³/(t²(t − 1)²) has poles at 0, 1, ∞; an isogeny preserves good reduction, a constant curve has good reduction at every place of a finite extension of k(t), so j would be integral everywhere, hence constant. | True. |
| §9.5 lines Check | y = tx: ideal (y − tx), coefficient t; algebraically closed fields k ⊆ k′ ⊆ acl(k(t)): trdeg 0 gives k, trdeg 1 gives all of acl(k(t)); minimal field acl(k(t)). y = ux: acl(k(u)). acl(k(t)) ∩ acl(k(u)) = k (linear disjointness over algebraically closed k). y = 0: coefficient 0 ∈ k. | True. |
| §11.1 characteristic-two Check | Theta characteristics of a genus-two curve: torsor under J[2]; J₀[2](K̄) = J₀[2](k̄) for a finite k̄-scheme (p-rank 0, 1 or 2 gives 1, 2 or 4 points, never a K̄-point outside k̄); shift 2α − ω = 0 constant and α constant, consistent with the §11.2 bullet (b)⇔(c). | True. |

## Notes for the maintainer

- Pass b's three non-finding notes (the §6.2 Needs line citing Hilbert irreducibility that the Masser route does not use; the range "JacobianChallengePartII §§3.2–3.13" containing a number the supplier skips; §5.6 proving ≤ where ggk-2026 line 1794 writes <) were not acted on: none changes a statement and the brief limits this round to the findings.
- Ownership: no new target or declaration was introduced, so no new ownership search was needed; the earlier rounds' ownership results stand. Ownership against open pull requests other than the sibling checkouts named in the brief was not checked.
- No name cited by another roadmap changed. `Suggested.lean` keeps its three declarations verbatim; only its import header changed.
- No source was requested; `needs-references.toml` was not created.

## Gate repairs

The worker's checks reported, twice, the warning that `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` imports `Mathlib`, a package designed for the module system, and suggested adding `module` at the start of the file. At the pins both `Mathlib.lean` and every Tau Ceti file (including `TauCeti.AlgebraicGeometry.AbelianVariety.Albanese`) begin with `module` and use `public import`, and the roadmap CoboundaryExpansion on main already has the header `module` / `public import Mathlib`. Repair: `Suggested.lean` now begins with `module`, a blank line, `public import Mathlib`, `public import TauCeti.AlgebraicGeometry.AbelianVariety.Albanese`; the two imports are `public` so that the signatures of the three sorried theorems, whose types mention Mathlib and Tau Ceti constants, remain well-formed for any importer. Nothing else in the file changed. Re-elaboration: exit 0, only the three `sorry` warnings, the module-system warning gone. The `#check @name` scratch test was rerun on the repaired file: the three elaborated types are identical to those recorded above. The README nowhere describes the import header, so no README text changed for this repair. The dependency gate after the repair printed exactly

      depcheck: 208 roadmaps, 1804 edges, 0 problem(s)

  with no UPWARD, CYCLE or `moved:` line (the roadmap and edge counts differ from the run recorded above only because the board gained a package between the two runs).
