# FIX-PKG-PadicFamiliesPartII~5

Repair of the two findings of REV-PKG-PadicFamiliesPartII~4. Only `packages/PadicFamiliesPartII/README.md` changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-PadicFamiliesPartII~4/F01 (P2) — applied

§4.6: undefined J, untyped `i`, `Tr`, `T̃_w`, special-fibre congruence "for n large", empty `min` → defined J, `Jᶜ`, strata, degree `(p+1)^{|Jᶜ|}`, §4.6.8 weight hypotheses, formal completions, flat `A_κ`, `B_κ`, typed ι, Tr, `T̃_w`; congruence for every `n ≥ 1` modulo `p^r A_κ` (`Jᶜ ≠ ∅`); empty case separate; both comparisons with C quantifiers; API, eight Checks, Needs.

Verified against BCGP21 lines 5283–5580 (pp. 109–114). The finding is right. Lemma 4.6.16 (line 5439) is stated for every `n ≥ 1` on the 𝓘-adically complete, ℤ_p-flat formal section modules of lines 5417–5429, not on the special fibre. Two points go beyond the review's text:
- The comparison map is `e(U^I) ∘ ι`, not ι: ι does not commute with the operators at `Jᶜ`.
- The injectivity argument needs only `r > |Jᶜ|`. The source's `k_w − l_w > p^{|Jᶜ|}` implies this, and C absorbs both.

The review calls the cover "mixed-level". In the source the cover is Klingen level at every place with multiplicative `H_v`; that is the mixed level of §4.1 restricted to the stratum, so the README uses that wording. A new Source-issues entry records that the source writes order `p^{3n}` where its own extension description has order `p^{4n}`.

## REV-PKG-PadicFamiliesPartII~4/F02 (P1) — applied

§7.1b, old → new: "Because `HCS_{w,λ}` and `VB⁰` are exact and contravariant" → "`HCS_{w,λ}` is exact and contravariant (BCGP25 Definition 3.4.17, p. 56) and `VB⁰` is exact and covariant on these sheaves (Theorem 4.5.20(5), p. 79); their composite is exact and contravariant". Verified: BCGP25 lines 3431–3437 keep the arrow directions and line 2583 says contravariant. The degree-reversal Check gains a sentence: the reversal comes only from HCS. It uses the dual `(a, b) ↦ a` of the first-factor inclusion; the review called this "E → E²", but the diagonal's dual would be `a + b`.

## Checks

- `lake env lean packages/PadicFamiliesPartII/Suggested.lean`, run from the content checkout: exit 0, no output, 8.7 s. The only import is `import Mathlib`, so no Tau Ceti module needed building.
- `Suggested.lean` declares nothing. The mechanical `#check @name` comparison therefore has an empty domain, and no elaborated type could change. The new §4.6 objects need Hilbert–Siegel formal models, which do not exist at the pins, so no headline was added. The docstring already names §4.7 as not statable.
- Dependency check (`gate --depcheck … --movable`), exit 0:

```text
depcheck: 237 roadmaps, 2163 edges, 0 problem(s)
```

  It printed no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README gives the same three leads as before: HigherHidaAndColemanTheory §9.6, LocallyAnalyticDistributionsPartII §2.5 and LocallyAnalyticRepresentationsOfLocalGroups §4.2. All three exist in the board packages, earlier in ORDER.txt (lines 255, 199 and 253 against this roadmap's 256), and the tool does not index board packages. No Lean names were reported.
- The newly cited supplier sections were opened at their open heads:
  - AutomorphicBundles §12.1 (coefficient trace, unit law `Tr ∘ π^♯ = deg π`);
  - ShimuraCompactifications §4.3 and §7.16;
  - HodgeTateAndCanonicalSubgroups §0.14 and §0.16;
  - AutomorphicBundlesPartII §5.1 and §5.2 (board).

  All of them were already Layer 4 dependencies. No gap was added and `plan.json` is unchanged.
- No gate failures were listed for this round.

## Ownership

The formal trace congruence and the spherical-to-Klingen ordinary comparison of BCGP21 §4.6 sit inside this roadmap's declared scope (Layers 4–6, BCGP21 §§4–6). `roadmaps grep` for these objects (Lemma 4.6.16/4.6.17, Proposition 4.6.9/4.6.19, "trace congruence"), across the open heads, main and the board packages, finds no other owner. The PerfectoidShimuraVarieties hits cite propositions of different papers (BP21/BP25), and the "trace congruence" hits concern Galois traces. Ownership was checked against the open pull requests the roadmap service indexes.

## Adversarial pass on added and changed statements

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| π_J degree | p = 3; `|Jᶜ|` = 0, 1, 2; place in J | μ₃×μ₃ has 4 lines, so degrees 1, 4, 16; at J the multiplicative part has order p, so the factor is 1 | Pass |
| Tr ∘ ι (unit law) | p = 3, `|Jᶜ|` = 1 | `Tr ∘ ι = 4`; 4 ≡ 1 mod 3 is a unit | Pass; added as a property |
| Congruence, n ≥ 1 vs n = 0 | p = 3, `|Jᶜ|` = 1, r = 2 | n = 0: 4f − 3f = f ∉ 3A for f ∉ 3A, so it fails; n ≥ 1: factor 3 | Pass for n ≥ 1; Check added |
| Leading factor | lines in μ_p² | L_w meets H_w trivially for p of the p + 1 lines; p = 3: 3 of 4, `p^{|Jᶜ|}` = 3, 9 | Pass; Check |
| Flat vs special fibre | ℤ₃ vs 𝔽₃ | 0 ≡ 3 mod 9 is false in ℤ₃; in 𝔽₃ both sides are 0 | Pass; congruence stated on A_κ; Check |
| Threshold | `|Jᶜ|` = 1; r = 1, 2 | r = 1: p·T̃f ∈ pA always, no information; r = 2: T̃f ∈ pA. Source `> p^{|Jᶜ|}` = 3 implies r > 1 | Pass; stated in the route; Check |
| Empty `Jᶜ` | J = I = S_p | degree (p+1)⁰ = 1; Tr ∘ ι = id; min ∅ never formed | Pass; separate case; Check |
| Normalization | l = 2, n = 1, p = 3 | `p^{−(l+3)}` = 3⁻⁵ on both sides; a wrong `p^{−3}` gives a gap of 24T̃f, of valuation 1 < 2 | Pass; Check |
| L_w order | n = 1, 2 | Z/p ⊕ Z/p² by μ_p has order p⁴; at n = 2, p⁸ = p^{4n} ≠ p^{3n} = p⁶ | Source misprint recorded |
| Lift `(G_w[p]+L_w)/L_w` | ordinary G_w, n = 1 | `|L_w[p]|` = p·p² = p³; `|G_w[p]|/p³` = p; multiplicative part μ_p²/μ_p, étale part 0 | Pass |
| Dévissage twist | l_w = 2, p = 3; C vs k′ | l′ = 2 + 2 = 4 = p + 1; k′ ≥ C + p + 1 ≥ 2p + 3 iff C ≥ p + 2 | Pass; Check |
| One-exponent sequence | J = {w₀, w₁}, n = (2, 2) | kernel O/(Ha₀, Ha₁²) has length 2, middle 4, cokernel 2: 2 + 2 = 4 | Pass; simultaneous: 1 + 1 ≠ 4 |
| Stratum comparison hypotheses | §4.6.8 vs Prop 4.6.9 | Prop 4.6.9 omits `l_v ≥ p+1` on J, so §4.6.8 is kept as a standing hypothesis | Pass |
| Full comparison | Prop 4.6.19 | the hypotheses impose no `l ≥ p+1` at J, since the twists meet it | Pass |
| §7.1b variance | V[1]; first-factor inclusion E → E² | HCS gives a single reversal, so H¹ = F(V); a second reversal would give degree −1. Dual of x ↦ (x, 0) is (a, b) ↦ a; dual of the diagonal is (a, b) ↦ a + b | Pass; wording fixed |

## Places repaired by pattern

I searched the README for other congruences `mod p^{…}` on special fibres, other `min`/`inf` over index sets that could be empty, "n large", and other claims that `VB⁰` or `VB_red` is contravariant. The hits were §4.2 (`k_v ≡ l_v mod p−1`), §5.3 (Cartier trace exponents), §6.6 (classical weight region), §8.3 (parity) and §9.7 (`r ≢ 1 mod p`). None is of the defective form, so the only occurrences were §4.6 and §7.1b line 1030. §7.1a (HCS contravariant) and the Source-issues entry for BCGP25 Definition 4.6.35 were already correct.

## For the maintainer

- No section numbers, gap slugs or Lean names changed, so citations into this roadmap are unaffected. The §4.6 heading is unchanged.
- §4.6's Needs line drops §4.5, which is not used, and adds §4.1, §4.3, AutomorphicBundles §12.1, AutomorphicBundlesPartII §5.1–§5.2, HodgeTateAndCanonicalSubgroups §0.14 and §0.16, and ShimuraCompactifications §4.3 and §7.16. All of these were already in the Layer 4 Dependencies line.
- No suspicious instructions were found in the review text.
