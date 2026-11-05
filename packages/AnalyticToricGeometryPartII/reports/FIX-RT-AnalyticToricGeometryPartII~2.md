# FIX-RT-AnalyticToricGeometryPartII~2

Two reviews were merged. Pass a (verdict accepted) raises no finding. Pass b raises F01–F03. Each is settled below; they do not overlap.

## F01 (P2) — applied

Conventions: "Perfectoid statements additionally fix the residue prime p, the tilt …" → a perfectoid statement is one in which K is a perfectoid field (SCH12, Definition 3.1, p. 263; SCH12 line 726), followed by the list §§2.1, 2.2, 2.4, 3.1–3.7, 4.1–4.2, 5.2–5.3, 6.4 and the list of non-perfectoid parts. "Let K be perfectoid" now opens §§2.1, 2.2, 2.4, 3.1–3.6 and 5.2. A ℚ_p negative-control Check is added to §2.1.

Verified: SCH12 line 2414 states Theorem 8.5 for a perfectoid field K. ℚ_p has discrete valuation, so it has no tilt. In ℚ_p⟨t^(1/p^∞)⟩ the norms lie in p^ℤ, so no ϖ satisfies |p|≤|ϖ|ᵖ<1.

Same pattern elsewhere: §§3.7, 4.1, 5.3 and 6.4 already assumed K perfectoid, so they are unchanged. I also added §2.2 to the list, which the reviewer's repair left out: O_T(D) is a sheaf on TΣ,K, and TΣ,K is built only from perfectoid charts. §2.3 is pure combinatorics, and §5.1 lives on XΣ,Kᵃⁿ for any complete K, so neither gets the hypothesis. `sources.toml` SCH12 locator: added Definition 3.1 and p. 263, and "Conventions" to `cited_for`.

## F02 (P3) — applied

§6.3: "and H ample" → "and H an invariant ample Cartier divisor". "determined by the fan and divisor data" → "determined by the fan and the invariant divisors D₁,…,D_c and H". The statement now also says that §0.4 gives an invariant representative of every ample class and that §6.4 uses the same H over k₀, K and K♭. The "Here" line is changed to match. The first Check gains a witness: the two fibres give δ=4 against O(1,2).

Recomputed with O(a,b)·O(c,d)=ad+bc: (1,0)·(1,1)=1 per fibre, so δ=2. (1,0)·(1,2)=2 per fibre, so δ=4.

## F03 (P3) — applied

Verified: `packages/MotivesAndAlgebraicCyclesPartII/design/` does not mention this roadmap. Its only "toric" hit is plan.json line 1827, about toric components of nodal curves. `roadmaps grep 'AnalyticToricGeometryPartII'` finds nothing on main or in open heads. Two board designs do cite it: DeligneWeightsAndPurityPartII (NT.3–NT.6) and MixedHodgeModulesAndIrregularHodgeTheory (design README lines 1529 and 1613, `NT.0/divisor-sections`).

Changes: in Scope line 17, the MotivesAndAlgebraicCyclesPartII sentence is replaced by MixedHodgeModulesAndIrregularHodgeTheory, which consumes the Layer 0 divisor sections. In Downstream consumers, the MotivesAndAlgebraicCyclesPartII sentence becomes "MixedHodgeModulesAndIrregularHodgeTheory uses the integral divisor sections of §0.3". The sentence that follows is kept.

## Checks

- Elaboration: `lake env lean packages/AnalyticToricGeometryPartII/Suggested.lean`, run from the content checkout, exits 0 with no output. The file still declares nothing, so the `#check @name` sweep has nothing to compare. `Suggested.lean` is unchanged: its docstring already describes the headline theorems as perfectoid-field statements.
- Dependency check:

      depcheck: 56 roadmaps, 651 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.

## Adversarial pass on changed text

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions: perfectoid K | ℚ_p; ℂ_p; completed perfection of 𝔽_p((t)) | ℚ_p: value group p^ℤ is discrete, not perfectoid. ℂ_p: value group p^ℚ, Frobenius surjective on O/p. 𝔽_p((t^(1/p^∞)))^: perfect, so Frobenius is bijective | definition separates them; no change |
| §2.1 with K perfectoid | positive ray over ℂ_p; rank-zero fan | ℂ_p⟨t^(1/p^∞)⟩ is the perfected disc (PerfectoidSpaces P1.30); Spa(K,K°) | holds |
| §2.1 ℚ_p Check | ℚ_p⟨t^(1/p^∞)⟩ | Gauss norms in p^ℤ; |p|≤|ϖ|ᵖ<1 forces p^(-1/p)≤|ϖ|<1, which p^ℤ cannot meet | correct negative control |
| §6.3 with invariant H | two fibres on ℙ¹×ℙ¹, H=D₊₁+D₊₂ of class O(1,1); class O(1,2) | δ=2; δ=4 | δ depends on H; now part of the data |
| §6.3 field independence | same invariant H over k₀, K, K♭ | displacement degree is an integer computed from the fan alone | holds |
| Consumers line | grep of the board designs | Motives: 0 citations; MixedHodge: 2 (NT.0); Deligne: NT.3–NT.6 | lines match |

## Notes for the maintainer

- `design/plan.json` (around line 1484) and `design/README.md` still name MotivesAndAlgebraicCyclesPartII as a consumer. This job may edit only the plan's `gaps` list, so that text is unchanged.
- No Lean name, gap slug or supplier citation changed. No roadmap cites a name this round changed.
- Ownership against open pull requests was checked with the `roadmaps grep` index for the consumer claim only. No construction was added or moved.
