# FIX-DESIGN-PELModuliPartII~3 — repair report

Files edited: `packages/PELModuliPartII/design/README.md`, `packages/PELModuliPartII/design/plan.json`, `packages/PELModuliPartII/sources.toml`. The design stage has no `Suggested.lean`, so nothing was elaborated.

## F01 (P1) — applied

Verified. Witness recomputed: K imaginary quadratic, p split, A ordinary with CM by O_K, A′ = A with the conjugated action. Hom_K(A,A′) = 0 because f∈K and (a−ā)f = 0, while Hom_K(V_ℓA,V_ℓA′) has ℚ_ℓ-dimension 2. RZ96 line 8959–8964 has the same gap. U9/basic-hom-comparison: the hypothesis "each factor isoclinic" becomes "N_𝔭 and N′_𝔭 isoclinic **of the same slope** (equivalently, A×A′ is isoclinic at every 𝔭)". The proof now runs Lemma 6.28 on A×A′ and takes the K-linear corner. "Basic pair" now means that A₀×A satisfies the hypothesis: the slopes at a banal place are |Φ_w|/[F_w:ℚ_p], and 1/2 at the distinguished place. Added the negative-control Check and source correction E8 (RZ96 Corollary 6.29), in both README and plan.json. The consumers U9/nearby-framing-datum and U9/uniformization-morphism apply it only to basic pairs, so they need no change.

## F02 (P1) — applied

Verified with LL22 line 402–405 and Lemma 2.4 (line 437–438), which work over Spf O_Ĕ with Ĕ the ramified field. U3/exotic-smoothness: "over Spf O_K̆" → "over Spf O_L̆". Added a Check: at n=2 the fibre over the closed point of O_K̆ is k[u]/(u²)[[t]], which is nonreduced, while over O_L̆ it is k[[t]]. U0/rz-representability: "Spf O_L̆ (resp. Spf O_K̆)" → "Spf O_L̆ in every case (O_L̆=O_K̆ when L/K is unramified)". I checked the other O_K̆ occurrences (U5 δ∈O_K̆×, and the global K of U9 at lines for exotic- and CM-product uniformization) and they are correct as they stand.

## F03 (P2) — applied differently

Verified. ShimuraCompactifications §C5.18 (quasi-projectivity of the neat M2.8 moduli) and §C5.5 (properness for a complete Σ) hold over good primes in Lan's sense (its hypothesis (C4-b)). LTXZZ22's special inert prime is such a prime for the product datum.

What changed:
- **The gap's needs sentence** now covers only a base that contains a prime where Layer C5 does not apply. Those primes divide the discriminant of the order, or carry a multichain other than a single self-dual lattice. The reviewer suggested a prime-by-prime restriction; I phrased it per base instead, because quasi-projectivity is not local on the base.
- **U8/ltxzz-smooth-moduli** gains a clause and a proof step: a finite comparison morphism to the PEL moduli of A₀×A. It also gets a Check that separates λ from cλ.
- **U8/smooth-geometry-tangent** drops the gap. It now cites §§C5.5 and C5.18 together with Stacks Tags 0B3H, 0C4M, 0C4N, 01WN and 0BCL, and states "projective ⇔ generic fibre proper" (no cusp label ⇔ V anisotropic). New Check: F⁺=ℚ, N=2.
- **U7/localized-smoothness** gets the same comparison clause. It uses C5.18 when every prime of O_E[1/d] is unramified in F⁺, and the gap otherwise.
- **E4** and the gap's `detail` and `neededBy` were updated to match.

## F04 (P3) — applied

Source editions, plan.json `sources` and `sourceVersions`: for Zhang21 the Tsinghua PDF with digest `6f8ac537…` → arXiv 1909.02697v3 with `f58b275c…`. For LTXZZ22 the NSF copy with `dd821abd…` → arXiv 1912.11942v3 with `84dc7c83…`. Both entries carry the manifest's version notes (pages are those of the published version). The manifest entries are unchanged.

## F05 (P3) — applied

Verified against RZ96 lines 2349–2411 (printed pp. 64–67) and line 8838–8844. In U9/formal-arithmetic-quotient, the citation "§§6.13–6.16, pp. 282–285" → "Propositions 2.34–2.37, pp. 64–67; Theorem 6.23 and its proof, p. 289; Theorem 6.30, p. 293". Added a sentence saying that (ii) is what makes the quotient a formal scheme rather than the formal algebraic space of Proposition 2.37. Route step 3 now cites the proof of Theorem 6.23 and Proposition 2.34. The RZ96 read locators and the manifest locator are updated. I did not add the reviewer's unchecked "tested" argument that (ii) follows from Proposition 2.34 and Corollary 2.35.

## F06 (P3) — applied

Verified: Mih19 line 2114–2121 is Proposition 12.11, printed pp. 47–48, stated for totally ramified O′/O. That matches the target's hypothesis. Proposition 12.3 (line 1993–1999) is the existence of Lubin–Tate displays. In the Source line and in step 3, "Proposition 12.3, p. 44" → "Proposition 12.11, pp. 47–48". The manifest locator is updated.

## F07 (P3) — applied

Deleted the stale "fails the target signature when n≥2" Check of U1/product-embedding. The check at n=1, (2,0)≠(1,1), stays. The deleted item was not in plan.json's `tests` or `acceptance`, so plan.json needed no edit.

## F08 (P3) — applied differently

I rewrote the four `\[…]` quotients (U9/uniformization-morphism, exotic-uniformization, inert-uniformization, cm-partition-and-product) as `∖(…)` with the set-minus sign, in both README and plan.json. I did not use the reviewer's `\(…)` because it is itself a LaTeX delimiter. I left the backticked API names alone. They are the design-stage format, used by the other board designs too (for example AdicCoefficientsAndComparisonsPartII and FaltingsFinitenessAndIsogenyTheoremsPartII). The reviewer's own repair for them applies only once `Suggested.lean` exists.

## Checks

Dependency gate, verbatim:

    candidate: PELModuliPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 642 edges, 0 problem(s)

Exit 0. There is no UPWARD, CYCLE or moved line. ShimuraCompactifications is earlier in the merge order; I checked §§C5.5 and C5.18 and (C4-b) at that roadmap's open head.

A script over plan.json confirms: every `gap:` prerequisite is listed in that gap's `neededBy` and the reverse; every node source id is in `sources`; the JSON parses. No `\[`, no machine path.

## Adversarial pass on the new text

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| basic-hom-comparison, common slope | ordinary CM curve with conjugated action; supersingular, K=ℚ | 0 vs 2 is now excluded (slopes 0 and 1 at 𝔭); supersingular: 4=4 at ℓ, slopes 1/2=1/2 | holds |
| "basic pair" slopes | banal w: ht n[F_w:ℚ_p], dim n\|Φ_w\|; w=w̄ | n\|Φ_w\|/(n[F_w:ℚ_p]) = \|Φ_w\|/[F_w:ℚ_p] = slope of A₀; w=w̄ gives 1/2 | agree |
| A×A′ isoclinic ⇔ common slope | N⊕N′ | isoclinic iff both isoclinic with equal slope | ok |
| U3 base ring | n=2 | O_L̆[[t]]/ϖ = k[u]/(u²)[[t]], nonreduced; over O_L̆: k[[t]], dim 1 | O_L̆ |
| product datum good at p | O_F×O_F, p unramified, Λ₀⊕Λ self-dual, type A, p odd | p∤disc, I_bad=1, p∤[L^#:L] | good |
| cusp label ⇔ V isotropic | F⁺=ℚ, N=2, V=diag(a,b) with ab<0 | isotropic ⇔ −ab∈Nm F^× ⇔ cusp label ⇔ noncompact | consistent |
| comparison separates cλ | c≠1 | λ₀×cλ = m(λ₀×λ) forces m=1 and m=c | distinct |
| finite ⇒ quasi-projective, proper | Tags 0B3H, 0C4M, 0C4N, 01WN, 0BCL (Stacks line 4268, 4244, 4273, 4931, 4764) | as stated at those lines | ok |

## For the maintainer

- **New source.** `Stacks` was added through the sources service (morphisms chapter, certified). No `needs-references.toml` entry was needed.
- **No renames.** No name that other roadmaps cite changed.
- **gap:bad-prime-projectivity is narrower.** ShimuraCompactifications is asked only for the bad-prime and parahoric case, and U8/smooth-geometry-tangent no longer consumes the gap.
- **Ownership against open pull requests** was checked only for ShimuraCompactifications and PELModuli, the suppliers this round touched.
- **Source issue for the review record.** RZ96 Corollary 6.29 (p. 293), now E8.
- **Suspicious text.** None found in the review.
