# FIX-PKG-PadicLocalLanglandsForGL2QpPartII~7

This round settles the five findings of review REV-PKG-PadicLocalLanglandsForGL2QpPartII~6. All five were checked against the sources and the supplier roadmaps and all five were applied. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Old: "The Banach radius algebras … are taken from PadicLocalLanglandsForGL2Qp §0.1, through the explicit radius-algebras contract of LocallyAnalyticDistributionsPartII…".

New: LocallyAnalyticDistributionsPartII §1.5 supplies ‖·‖_r, D_r(H,L) and D(H,L) = lim_r D_r(H,L) under (HYP), and their identification with the §0.1 stages for r ∈ p^ℚ∩(1/p,1). Noetherianity stays with the base §0.1. The explicit (HYP) p-valuation on G_i is stated.

Verification:

- The base §0.1, at the head of PadicLocalLanglandsForGL2Qp, line 220, gives only the Fréchet–Stein property with noetherian radius algebras.
- LocallyAnalyticDistributionsPartII at its head states §1.5, *The Banach radius algebras D_r(H, K) in ordered coordinates*. Its §0.1 contract (its README line 58) sends the coordinate description to §1.5.

The suggested repair said "for 1/p ≤ r < 1" for the identification as well. §1.5 states the identification only for r ∈ p^ℚ ∩ (1/p,1), so the README now says that.

The README now also states the valuation itself:

- ω = v_p(g−1)−i+1 for p odd;
- ω = v_2(g−1)−i+2 for p = 2;
- the ordered basis 1+pⁱE_jk.

It explains why the unshifted valuation fails (HYP). The same citation was repaired everywhere it occurred:

- the Scope paragraph (line 37);
- the §3.1 route (line 481);
- §3.1 *Needs* (line 522);
- Layer 3 *Dependencies* (line 580).

Each now reads "LocallyAnalyticDistributionsPartII §§1.5 and 2.2–2.3".

## F02 (P2) — applied

Old: "For v P-finite and N divisible enough, a power of 1−u(p^N) carries v into Π_c^P-fin". This is vacuous, because (1−u(p^N))^k v = 0 for N ≥ n.

New: for every b ∈ ℚ_p, (1−u(b))^k v ∈ Π_c^P-fin, with the witness for m ≥ −v_p(b) and N ≥ max(1, m+n) (DLB17 lines 1500–1519) and a route. A Check was added.

The suggested repair needed two corrections:

- **N ≥ 1.** N ≥ m+n can be ≤ 0 when v_p(b) > 0. The definition requires an exponent of at least 1, so the bound is now N ≥ max(1, m+n).
- **Continuity.** For b ∉ ℤ[1/p], the proof uses the compact subgroup u(p^Nℤ_p). On the span of the (u(p^N)−1)^j w, u(p^N y) acts as Σ_(j<k) binom(y,j)(u(p^N)−1)^j for every y ∈ ℤ_p. This holds by continuity from y ∈ ℤ and cannot be done abstractly.

The pattern repair follows from the second point. The existing API bullet "Π^P-fin and Π_c^P-fin are P-stable" uses the same step: stability under u(b), and under diag(ℤ_p^×,1) on Π_c^P-fin. So the §1.3 API is now stated for representations on Hausdorff spaces with continuous orbit maps. That covers every use in the roadmap: Π(V) in §§1.5–1.6 and its locally analytic vectors.

The new Check computes two things:

- (1−u(p^N))^k v = 0 for N ≥ n.
- In LP_c(ℚ_p^×, L_∞)^Γ, φ on ℤ_p^× gives (1−ε(x/p))φ ≠ 0, and Σ_(i<p²) ε(ix) = 0 on p⁻¹ℤ_p^×.

## F03 (P2) — applied

Old: five route bullets for §6.4 that followed CDN23 lines 2791–2836 clause by clause.

New: an opening sentence on the strategy (annihilate at each torsion stage, then take the limit), followed by four steps grouped by what they prove:

- reduction to a lattice, using bounded images from the compact P_B;
- the lattice J and the block quotient Y_B;
- torsion stages see only the block, through a general finite-length criterion with a one-line proof;
- annihilation, then the limit.

What changed besides the grouping:

- The criterion is now stated on its own, with its own proof (a directed union containing a finite generating set).
- The fact that J kills Y_B is derived from the centre acting through R_B^(ps,δ_M)[1/p] → R_(B,M) (LocalGaloisDeformationRings §3.8, checked at its head). Before, it was only asserted.
- A negative-control Check shows that both hypotheses of the criterion are needed:
  - an infinite direct sum of copies of one irreducible in B;
  - c-Ind_(KZ)^G k_L, which is free over k_L[T] (base §2.7, checked at its head) and so has infinite length.

The locator (CDN23, Théorème 5.24(i), lines 2779–2836) and the existing Checks are kept. The other route bullets of the package were compared with their sources. The neighbouring §6.5 route is a list of five one-line steps and does not render CDN23 clause by clause.

## F04 (P3) — applied

Old: "The coefficient form of supercuspidal projectivity, the fixed-radius form … and the globalisation … are supplier gaps".

New: "Four inputs are supplier gaps, …". The list now includes the tensor comparison for continuous Galois cohomology of C⊗V^∨ with Banach coefficients (PadicHodgeTheory §4.4), and each gap names its supplier section. This matches the four slugs of `design/plan.json` and the four "What … must provide" lines. No other paragraph lists the gaps.

## F05 (P3) — applied

The `cited_for` lists in `sources.toml` now match the README section by section:

- **DLB17:** added 0.2, 4.7, Conventions, Scope and ownership, How to read the build, Layer 0 (its Examples), Downstream consumers; removed 4.1 and 4.9.
- **CDN20:** added Conventions, How to read the build, Layer 4; removed 0.1.
- **CDN23:** added Conventions, Exact supplier contracts, Scope and ownership, Layer 5.

The review listed only some of these. The others came from re-running the same per-section listing on the edited README. After the edit, each id occurs in exactly its listed sections, apart from the References section itself.

## Checks run

- **Elaboration.** `lake env lean` on `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean`, run from the content checkout, exits 0 with no output. The only import is `import Mathlib`, so no Tau Ceti module had to be built. The file is unchanged this round.
- **Binder check.** The file declares no named declaration, so the `#check @name` comparison has nothing to run on, and nothing changed. No README backticked name of this roadmap's own was added.
- **Dependency check.** Full output, exit 0, with no UPWARD, CYCLE or `moved:` line:

      depcheck: 245 roadmaps, 2246 edges, 0 problem(s)

- **`roadmaps resolve` on the README.** Cross-roadmap citations found nowhere: none. Lean names found nowhere: none.
- **Citations checked at their heads this round:**
  - LocallyAnalyticDistributionsPartII §§0.1-contract, 1.5, 2.2 and 2.3;
  - PadicLocalLanglandsForGL2Qp §§0.1, 2.7 and 5.12;
  - LocalGaloisDeformationRings §3.8;
  - DLB17 lines 1466–1525;
  - CDN23 lines 2779–2840.
- **Ownership against open pull requests.** I searched main and the 475 open heads with fixed-string `roadmaps grep` for "condition (HYP)", "D_r(H" and "radius algebras". Only LocallyAnalyticDistributionsPartII owns the coordinate radius algebras, in its §1.5. LocallyAnalyticRepresentationsOfLocalGroups uses them, and the base mentions noetherian radius algebras only. This roadmap cites the owner and states nothing of its own about them.
- **Sources.** No fetch was needed; every locator used is in the five cached texts. `needs-references.toml` was not created.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| (HYP) for G_i, p odd, ω = v_p(g−1)−i+1 | p = 3, i = 1; p = 3, i = 2 | basis ω = 1, 1+1 = 2 > 3/2; ω > 3/2 ⇒ ω ≥ 2 ⇒ g ∈ G_(i+1) = G_i³; ω(g^p) = ω(g)+1 from (1+pⁱX)^p ≡ 1+p^(i+1)X | holds | stated in contract |
| (HYP) for G_i, p = 2, ω = v_2(g−1)−i+2 | i = 2, 3 | basis ω = 2, 2+2 = 4 > 2; ω ≥ 3 ⇒ G_(i+1) = G_i²; ω ≥ 2 > 1/(p−1) = 1; (1+4X)² = 1+8X+16X² | holds | stated |
| Unshifted v_p(g−1) on G_i | p = 3, i = 2: g = 1+9E₁₂; p = 2, i = 3: g = 1+8E₁₂ | value 2 > 3/2 (resp. 3 > 2); p-th powers of G_i are G_(i+1) ∌ g | not saturated | stated as negative control |
| §0.1 / §1.5 identification range | r = 1/p; r ∈ p^ℚ∩(1/p,1) | LocallyAnalyticDistributionsPartII §1.5 proves it for r ∈ p^ℚ ∩ (1/p,1) only | review wording too wide | range stated |
| Old §1.3 bullet | N ≥ n | u(p^N)−1 = (u(pⁿ)−1)·Σ_(j<p^(N−n)) u(jpⁿ) ⇒ (1−u(p^N))^k v = 0 | vacuous | replaced |
| New §1.3 bullet | b = 0; b ∈ pⁿℤ_p; b = p⁻¹ (n = k = 1); p = 2 | b = 0: vector 0; b ∈ pⁿℤ_p: 0; b = p⁻¹, m = 1, N = 2: Σ_(i<p²) ζ_p^(iu) = p·0 = 0; p = 2: 1−ε(x/2) = 2, Σ_(i<4)(−1)^i = 0 | holds | Check added |
| New §1.3 bullet, sign of N | b = p³, n = 1 | m ≥ −3, m = −3 gives m+n = −2 < 1 | review bound N ≥ m+n too weak | N ≥ max(1, m+n) |
| Key identity of the route | — | Σ_(i<p^N)u(i) − Σ_(i<p^N)u(i+1) = 1 − u(p^N) | holds | — |
| Conjugation | diag(p^m,1)u(b)diag(p^(−m),1) | = u(p^m b); diag(a,1)u(b)diag(a,1)⁻¹ = u(ab) | holds | — |
| P-stability of Π^P-fin (u(b)) under continuity | w_a = diag(a,1)v | w_a killed by (u(apⁿ)−1)^k; on its span u(pⁿ) = (1+T_a)^(a⁻¹) ⇒ (u(pⁿ)−1)^k w_a = 0; orbit of u(b)v ⊂ Σ over the cosets of pⁿℤ_p in bℤ_p+pⁿℤ_p of u(x_i)E, dim ≤ k·dim W per coset | holds with continuity; abstract proof not available | API scoped to continuous orbit maps |
| Π_c^P-fin subspace | (n,k,m) ⇒ (n+1,k,m+1) | Σ_(i<p^(n+1)) u(i/p) = (Σ_(r<p) u(r/p))·S_n | holds | — |
| Trivial representation Check | v ≠ 0, P trivial | S_n^k v = p^(nk)v ≠ 0; (1−u(b))v = 0 ∈ Π_c^P-fin | consistent | — |
| §6.4 criterion | ⊕_ℕ σ; c-Ind_(KZ)^G k_L | the first is a union of finite-length subrepresentations, not finitely generated, infinite length; the second is cyclic and free over k_L[T], with Tʲ·c-Ind ⊋ T^(j+1)·c-Ind | both hypotheses needed | Check added |
| §6.4 J kills Y_B | R_(B,M) = 0 | I is the unit ideal, J = Z_B, LL_B(M) = 0 ⇒ Y_B = 0 (torsion-free) | consistent with the Check m_(B,M) = 0 | — |
| §6.4 torsion vs limit | ℤ_p/p^k | length k at each stage, limit of infinite length | consistent with the existing Check | — |
| §6.4 Z_B = R^ps/torsion | p = 3; p ≥ 5 | LocalGaloisDeformationRings §3.8: torsion-free quotient at p = 3, integral isomorphism for p ≥ 5 | "p > 2" is correct | — |
| F04 gap count | plan.json gaps | 4 slugs; README scope names 4 | holds | — |
| F05 manifest | per-section id listing | after the edit, the only difference is References (the bibliography) | holds | — |

## For the maintainer

- No Lean name changed, and no name that other roadmaps cite changed. No section, layer or target was renumbered.
- LocallyAnalyticDistributionsPartII was already a supplier (§§2.2–2.3). Its §1.5 is now cited as well, so no new dependency edge was added. That roadmap is still a pull request, earlier in the merge order. If it renumbers §1.5 before merging, the contract in this README must follow.
- PadicLocalLanglandsForGL2Qp §2.7 is newly cited in a §6.4 Check. The base was already a supplier.
- The review's text contained no instruction aimed at the worker. Nothing suspicious was met.
