# Repair of LocallyAnalyticRepresentationsOfLocalGroups (package, round 6)

One review, one finding. It is right and is applied, together with the same defect in the lattice convention of Layer 4. Files changed: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` and `packages/LocallyAnalyticRepresentationsOfLocalGroups/sources.toml` (OS15 `cited_for` gains "Layer 4"). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged. No new supplier gap.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~5/F01 (P2) — applied

§10.1: "G a locally L-analytic group … algebraic representation of g_(Σ∖σ)" → σ-analyticity and D_σ(G, E) stay general; algebraicity away from σ now needs a split connected reductive 𝐆, a torus 𝐓 and an open G ⊆ 𝐆(L) as data: U(g_(Σ∖σ))·v lies in O^g_alg (4.2) for ∏_(τ≠σ) 𝐆 ×_(L,τ) E. Added claims (1)–(3), Needs, Dependencies and a torus Check.

**Verification of the witness** (L = E = ℚ_3(√3), e_L = 2, Σ_L = {σ = id, τ}):
- H = 1 + 3O_L is open in L^×. On it, v_3(h − 1) ≥ 1 > 1/(p − 1) = 1/2, so log : H → 3O_L is an isomorphism with inverse exp.
- j(g) = g² becomes multiplication by 2 ∈ ℤ_3^× after log, so it is an L-analytic automorphism of H.
- dχ_1 = (0, 1) on g_σ × g_τ for χ_1 = τ|_H, and dχ_(1/2) = (0, 1/2) for χ_(1/2) = exp(½·log τ(·)). Also χ_1 ∘ j⁻¹ = χ_(1/2).
- Along the inclusion, the rational characters t^m pull back with differential m, so χ_1 is algebraic and χ_(1/2) is not.
- Along j they pull back to τ(·)^(2m), with differential 2m, and 2m = 1 has no integer solution.

So any condition that depends only on H, or only on g, cannot tell χ_1 and χ_(1/2) apart. The finding is correct, and Ding (DING25 lines 1935–1939, §3.1.4, p. 48) states the condition only for GL_n(K).

**Repair, and why split connected reductive.**
- **Connected.** It makes the condition stable under submodules. For O_2 the weight-1 line of the 2-dimensional SO_2-module is not the differential of an O_2-representation. With connectedness, (1) follows from 4.2 (i).
- **Reductive.** Claim (3) needs it: an extension of σ-analytic representations that is algebraic away from σ is itself σ-analytic. The route is that finite-dimensional objects of O^g_alg are semisimple (4.2 (ii)). Without reductivity this fails: the unipotent 2-dimensional representation of 𝔾_a is algebraic, has trivial composition factors and has a nonzero Lie action.
- **Split.** It matches 1.6 and Layers 4–6 and gives the lattice X of 4.2.

The definition also says, through 4.2 (iii) at 𝔭 = 𝔤, that the module is the differential of an algebraic representation of 𝐆_(Σ∖σ). GL_n stays the application.

**Same pattern elsewhere.** The preamble of Layer 4 defined X as "differentials of algebraic characters of a split maximal torus T of a split reductive group with Lie algebra 𝔤". That does not fix the group: for sl_2, SL_2 gives X = ℤϖ and PGL_2 gives X = 2ℤϖ, and OS15 (lines 275, 301–304, §2.5 and Definition 2.6, pp. 7–8) fixes G. The changes:
- **Layer 4 preamble.** 𝔤 = Lie(𝐆) with 𝐆 and 𝐓 fixed as part of the data, the dependence of O_alg on 𝐆 stated, and the application group (Res_(L/ℚ_p)𝐆) ×_(ℚ_p) E named.
- **4.2.** A new Check for SL_2 against PGL_2. The existing Verma Check now names 𝐆 = GL_2. ReductiveGroups Layers 1, 4, 7, 8 are added to its Needs line and to the Layer 4 Dependencies.
- **Supplier contract.** The ReductiveGroups contract now lists Layer 4 and §8.1. §8.1 on main carries the same SL₂/PGL₂ Check.

The other uses of "algebraic" already fix a group and are unchanged: 0.2, 0.3, 1.6, 1.10, 3.10 (analytic integrability, no lattice), 4.3, 5.2, 6.1, 6.6 and 10.2–10.7, which are about GL_n.

## Checks run

- **Elaboration.** `lake env lean` on the absolute path of `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean`, run from the content checkout, exits 0 with no output. The file is unchanged: only `import Mathlib`, no declarations, and a docstring naming the headlines that are not statable. No Tau Ceti module was needed.
- **Mechanical `#check @name` comparison.** There are zero declarations, so there was nothing to compare and no binder changed.
- **Dependency check.** Output, exactly:

  ```text
  depcheck: 206 roadmaps, 1907 edges, 0 problem(s)
  ```

  There were no UPWARD, CYCLE or moved lines.
- **Citation resolver.** It reports one lead, the same as before: "LocallyAnalyticDistributionsPartII §1.1". That roadmap is a board package earlier in the merge order, and the earlier review confirmed §1.1 is readable there. The lead is a false positive and this round did not touch it. The resolver found no Lean names missing.
- **Gate failures.** The brief listed none.

## Ownership and suppliers

- `roadmaps grep` finds the notion "algebraic away from σ" nowhere on main or in any open roadmap pull request. Among board packages, only PadicHodgeParametersInLocallyAnalyticRepresentations uses it, and it imports it from here for GL_n(K). This roadmap stays its owner.
- The new citations were read on main:
  - ReductiveGroups Layer 2: the differential and the Lie algebra.
  - ReductiveGroups Layer 4: tori.
  - ReductiveGroups §8.1: split reductive data, with the SL₂/PGL₂ lattice Check.
  - ReductiveGroups Layer 6: reductive groups are linearly reductive in characteristic 0. This is consistent with 4.2 (ii).
- ReductiveGroups is on main, so the dependency direction is unchanged. Ownership against the open pull requests was checked with `roadmaps grep` for the objects (the σ-algebraic condition; O_alg / O^p_alg). No second owner appeared.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| 10.1 definition, algebraic away from σ | L = ℚ_p | Σ∖σ = ∅, 𝐆_∅ = 1, g_∅ = 0; U(0)·v = Ev with weight 0 ∈ X = {0} | Every representation qualifies, so Ext¹_σ = Ext¹ and the first Check stands |
| Same | Torus witness above | dχ_1 = (0,1), dχ_(1/2) = (0,1/2); pullback differentials m (inclusion) or 2m (j); 2m = 1 has no solution | Depends on the model; new Check added |
| Same | GL_n, C(I, s_(i,τ)) with τ ≠ σ | U(g_τ)·v is infinite-dimensional | Not algebraic, consistent with 10.2 |
| (1) stability | O_2, not connected | Weight-1 line in the 2-dim module ±1: a submodule, but not the differential of an O_2-representation | Connectedness needed and assumed |
| (1) direct sums | v_1, v_2 | U·(v_1,v_2) ⊆ U·v_1 ⊕ U·v_2, a submodule in O^g_alg | Holds by 4.2 (i) |
| (3) σ-analytic extensions | n = 1, L = ℚ_p(√p), V = W = χ, ψ ∈ Hom(L^×, E) | g_τ acts by [[μ_τ, dψ_τ],[0, μ_τ]], semisimple iff dψ_τ = 0. Ext¹ has dim 1 + 2 = 3, Ext¹_σ = Hom_σ(L^×, E) has dim 2 | Agrees with the Checks of 10.1 and 10.3 (dim 2) |
| (3), reductivity | 𝔾_a, representation [[1,a],[0,1]] | Algebraic, trivial composition factors, Lie action ≠ 0 | Would fail for non-reductive 𝐆; reductive assumed |
| API: locally algebraic ⇒ algebraic away from σ | GL_2(ℚ_p(√p)), W = std_σ ⊠ std_τ, π smooth | U(g_τ)·x ⊆ Σ_j π_j ⊗ W, finite-dimensional, weights (1,0), (0,1) ∈ ℤ² | Holds; restricted to G = 𝐆(L) |
| Layer 4 X depends on 𝐆 | sl_2 with SL_2 or PGL_2 | ϖ(H) = 1, α(H) = 2; X = ℤϖ or 2ℤϖ; std ∈ O^g_alg only for SL_2 | Group fixed; Check added |
| Layer 4, other Checks | GL_2: μ = (1/2, 0); 𝔾_m: k[t]/(t² − 3) over ℚ_3 | 1/2 ∉ ℤ, so not in O_alg; no ℚ_3-root, so not in O | Unchanged and consistent |
| 10.3–10.7 dimensions | n = 1, 2, 3; d_L = 1, 2 | n + 1 = 2 (n = 1); 5, 8, 2 and 3 + 3 (n = 2, d = 2); 4 + 4 − 3 = 5 | Use 𝐆 = GL_n, which the definition now names; unchanged |

## Notes for the maintainer

- No section, target or Lean name was renamed or removed, and no id that other roadmaps cite changed. PadicHodgeParametersInLocallyAnalyticRepresentations uses 10.1 only for GL_n(K), so it is unaffected.
- Layer 4's O_alg and O^p_alg are now explicitly relative to a fixed split connected reductive group. Every consumer here (Layers 6–10) already works with a named group, so no statement changes meaning.
- No source was fetched, and no source passage was copied.
