# FIX-PKG-MotivesAndAlgebraicCyclesPartII~6

Findings of `REV-PKG-MotivesAndAlgebraicCyclesPartII~5` (two findings), settled on the mathematics.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~5/F01 (P2) — applied

Verified. The supplier's analytic spaces need not be Hausdorff: TropicalAndBerkovichArithmetic §0.21 says "Hausdorffness is a separate property", and its Check admits a nonseparated doubled disc. Take the doubled-origin line with `x = 0₁` and `x′ = 0₂`. The points `ϖⁿ` converge to both origins, so every open set containing both origins is non-Hausdorff. Such a set cannot embed in the Hausdorff `X̄ᵃⁿ` of §0.22.

I used the review's second repair: separation becomes the convention for the two auxiliary targets, and the headline §4.6 is not restricted. This matches the source. Scholze line 1556 gets the compactification from van der Put, and van der Put's affinoids are separated. Scholze line 2196–2197 (p. 52) says his smooth analytic spaces are Berkovich's, which correspond to *separated* rigid spaces.

Changes, old → new:

- **§4.2.** "smooth connected analytic curve" → "separated smooth connected analytic curve", with "separated" defined (closed diagonal, hence Hausdorff). "an embedding into a smooth projective curve" → "an open embedding into the analytification". Added three Checks:
  - the doubled origin, as a negative control;
  - the open disc, as a positive instance;
  - a good-reduction elliptic curve, to show that the choice of `W` matters.
- **§4.5.** Separated hypothesis added, with one sentence saying why.
- **§4.6 route.** The curve models are connected opens of analytifications of smooth projective curves, so they are separated (TropicalAndBerkovichArithmetic §0.22). Its *Needs* line gains §0.22.

**Also fixed: the §4.2 route.** The old route said "refine the residue discs … to closed discs and remove them". That step is wrong for two reasons:

- Shrinking the discs leaves `U′ ⊄ U`.
- Enlarging them fails when a boundary point of `W` has positive genus. Example: in a genus-2 curve, an affinoid `W` stopping at a genus-1 skeleton vertex.

The new route takes `W` from a triangulation of the separated curve (TropicalAndBerkovichArithmetic §2.16). Each boundary point of `W` then lies on an annulus and has one leaving branch, so the complement of `W` enlarges to closed discs. Accordingly §2.16 was added to the *Needs* line of §4.2, the Layer 4 *Dependencies*, the TropicalAndBerkovichArithmetic supplier contract and Scope and ownership.

**Other places checked for the same pattern.** §5.2's "étale spaces may be nonseparated where points collide" uses neither §4.2 nor §4.5, so it needs no change. §4.4 works with opens of `A¹`, which are separated. The only consumer of §4.5 is §4.6.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~5/F02 (P3) — applied

Verified against vanDerPut:

- line 57 states Theorem 1.1 on printed p. 156;
- line 163 ends its proof on p. 159;
- line 165 states Corollary 1.3 on p. 159;
- lines 167 onward begin §2 (unique factorization, pp. 159–161), which is not used here.

Old → new: "Theorem 1.1 (pp. 155–158); Corollary 1.3 (p. 159, proof pp. 159–161)" → "Theorem 1.1 (p. 156, proof pp. 156–159); Corollary 1.3 (p. 159)". Changed in three places: the References entry, the §4.2 route, and the `vanDerPut` manifest locator in `sources.toml`. The key, provenance and hash are unchanged.

## Checks

- **Elaboration.** `lake env lean packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. `Suggested.lean` is unchanged: one `import Mathlib`, its module docstring, the namespace, zero declarations and zero `sorry`. No Tau Ceti module needed building.
- **`#check @name` audit.** I did it: zero declarations, so there was nothing to elaborate or compare, and nothing changed.
- **Dependency check** (rerun on the final text): `depcheck: 245 roadmaps, 2246 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve`): no cross-roadmap citation and no Lean name found nowhere. The `Perf.Spd` lead from the earlier scan no longer appears. TropicalAndBerkovichArithmetic §2.16 resolves at its open head; that roadmap is earlier in the merge order and already a supplier.
- **Ownership.** I searched for the object (shrinking a curve so it compactifies with closed-disc complement, and uses of van der Put) across main and the open heads. ColemanIntegrationPartII *uses* wide opens with closed-disc complements but does not prove the shrinking result. ClassicalAdicEtaleCohomology only lists van der Put 1980 in its references. §4.2 stays owned here.
- **Sources.** No new source was fetched. Scholze and vanDerPut were read in the cache.
- **No gate failures** were listed.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §4.2 without separation | Doubled-origin `A¹` over `ℂ_p`, `x = 0₁`, `x′ = 0₂`, `ϖ = p` | Distance to origin `\|pⁿ\| = p^{−n} → 0` in both charts, so the limits are `0₁` and `0₂`, which are distinct. Every open `U′ ∋ 0₁, 0₂` contains `pⁿ` for large `n`, so it is non-Hausdorff. `ℙ¹ᵃⁿ` is Hausdorff (§0.22). | Fails without the hypothesis; separated hypothesis and negative Check added. |
| §4.2, positive | `U = {\|T\| < 1}` over `ℂ_p`; `x = 0`, `x′ = p²`; `ρ = 1/p` | `\|p²\| = p^{−2} < 1/p < 1`. Complement of `U` in `ℙ¹`: one disc `{\|1/T\| ≤ 1}`, containing `∞`. Route: `W = {\|T\| ≤ 1/p}`, `U′ = {\|T\| < 1/p}`, complement `{\|1/T\| ≤ p}`; one disc, nonempty. | Holds; Check added. |
| §4.2, proper `U` | `U = ℙ¹ᵃⁿ`, `x = 0`, `x′ = 1`, `W = {\|T\| ≤ p}` | `\|1\| = 1 < p`. Boundary point `ζ(0,p)` lies on the annulus `{1 < \|T\| < p²}`, with one leaving branch. `U′ = {\|T\| < p} ≠ U`, complement `{\|1/T\| ≤ 1/p}`: one disc, nonempty. | Nonemptiness clause holds even for proper `U`. |
| §4.2, `x = x′` | `U` an open disc, `x = x′ = 0` | `max(\|x\|, \|x′\|) = 0 < ρ` for any `ρ ∈ (0,1) ∩ \|C^×\|`, which is nonempty since `\|C^×\|` is dense. One disc. | Holds. |
| §4.2 route, choice of `W` | Good-reduction elliptic `E` (Gauss point `ζ` of genus 1); `x, x′` in residue disc `B₀` | Bad choice `W = E ∖ B₁`: the boundary `{ζ}` has genus 1, so no closed disc contains it (disc points have genus 0) and there is no `U′`. Good choice `W = {\|R\| ≤ σ}`: `X̄ = ℙ¹`, genus 0 ≠ 1 = genus of `E`, so `X̄` depends on `W`; one complementary disc. | The old "refine" step was flawed; route corrected; Check added. |
| §4.2 route, `x, x′` in distinct residue discs at `ζ` | `W = E ∖ {\|S\| < ρ}` | Boundary point `ζ(0,ρ)` has genus 0 and lies on `{ρ/2 < \|S\| < 1}`. `X̄ = E`, `U′ = E ∖ {\|S\| ≤ ρ}`, one disc containing `S = 0`. The path through `ζ` avoids the residue discs at `ζ(0,ρ)`. | Holds. |
| §4.2 route, triangulation input | TropicalAndBerkovichArithmetic §2.16 at its head | Stated for separated quasi-smooth curves; vertices of type II only in the strict case. Contract worded to match (type II/III; virtual discs/annuli become discs/annuli over an algebraically closed `C`). | Supplier section cited at the matching generality. |
| §4.5 restricted to separated curves | Doubled line, intermediate point `y = 1`; `ℓ = 2` over `ℂ₂` | `[0₁] + ℓA ∼ [1] + ℓB` and `[1] + ℓC ∼ [0₂] + ℓD` give `[0₁] + ℓ(A+C) ∼ [0₂] + ℓ(B+D)`. Degrees: `1 + ℓ(a+c) = 1 + ℓ(b+d)`, since `a = b` and `c = d`. So the conclusion is true there but not claimed. `ℓ = 2` equal to the residue characteristic is still allowed. | Kept at the source's generality; the only consumer, §4.6, uses separated models. |
| §4.6 curve models | `C′` = completed algebraic closure of `C(t)` with `\|t\| = 1` | The point is `ζ(0,1) ∈ ℙ¹ᵃⁿ`. Models: connected opens around it, e.g. `{1/2 < \|T\| < 2}`. Hausdorff and separated as opens of `ℙ¹ᵃⁿ`. They contain the `C`-point `T = 1`. | Separation holds; §4.5 applies. |
| "separated ⇒ Hausdorff" (as defined in §4.2) | Doubled line versus `A¹` | `A¹`: closed diagonal, Hausdorff. Doubled line: the pair `(0₁, 0₂)` is a limit of diagonal points `(pⁿ, pⁿ)`, so the diagonal is not closed, and the line is not Hausdorff. | Consistent. |
| F02 locators | vanDerPut lines 57, 163, 165, 167, 183–184 | Theorem stated p. 156; proof ends p. 159; corollary p. 159; §2 starts p. 159 and runs to p. 160 and beyond. The old "pp. 159–161" range lands on §2. | Corrected in three places. |

## For the maintainer

- `design/plan.json` (around line 1777, node `BM.4/curve-shrinking`) still has the old van der Put locator "Corollary 1.3, p. 159 (proof pp. 159–161)". This job may edit only the plan's top-level `gaps`, so it is unchanged.
- No new gap was added: TropicalAndBerkovichArithmetic §2.16 already supplies triangulations of separated curves.
- This roadmap now cites TropicalAndBerkovichArithmetic §2.16 in addition to its earlier sections. That roadmap is still an open pull request; keep §2.16's id (and its separated-curve existence statement) stable there.
- No name that another roadmap cites was changed. `Suggested.lean` is unchanged.
- Ownership against open pull requests was checked with `roadmaps grep` / `roadmaps show` at the open heads.
- No suspicious instructions were found in the review text.
