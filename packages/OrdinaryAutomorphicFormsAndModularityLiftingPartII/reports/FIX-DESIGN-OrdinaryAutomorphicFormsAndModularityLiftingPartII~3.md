# Repair report: OrdinaryAutomorphicFormsAndModularityLiftingPartII, design round 3

Files edited: `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md`, `design/plan.json`, `sources.toml`. There is no `Suggested.lean` at the design stage, so there was no `#check` elaboration to run; nothing Lean-side changed.

## F01 (P2) — applied

3.2 is split. Old: one target, "every component has dimension ≥ dim Λ", with a route that proves only dim Λ − 1. New: **3.2(a)** proves the obstruction-count bound dim ≥ dim Λ − 1 = nd. Its route is complete: CHT08 Lemma 2.2.11 and Corollary 2.2.12 (CHT08 lines 1018–1062), and h¹ − h² = −1 − χ, where the −1 is h³ = 1, the −h⁰(ad r̄(1)) term of CHT08 Corollary 2.3.5 (line 1444). **3.2(b)** is BCGP25 Lemma 5.7.7 itself. Its route names the missing step ⟨o, ψ⟩ = 0, with ψ the class of 1.4. That step is reduced to rank one through det : 𝒢_n → 𝒢_1, and the rank-one computation (class field theory) is part of the target. 4.8 now needs 3.2(b), and says this step is not in the sources.

Evidence I recomputed:
- At n = 2, d = 2, #T = 3, (a) gives 18 for R^T and 4 for R.
- In rank one the count gives d, while class field theory gives dim O⟦Γ⟧ = 1 + d. So the saving does happen in rank one, at the level of dimensions.

Corrected along the way: the reviewer's sketch says det ∘ r has multiplier χ^n. It does not: ν(det((g, a)j)) = −a^n = (−1)^{n+1}ν^n, so the multiplier is χ^n δ^{n+1}_{F/F⁺}. This is now a Check.

Not settled: I could not certify the rank-one pairing ⟨o_1, ψ′⟩ = 0 from any legal source. 3.2(b) therefore remains a target whose key step is new mathematics, and a human should decide whether that is acceptable for a headline input. The fallback would be to keep only 3.2(a) and mark 4.8's density step as having no route.

Same pattern elsewhere: Layer 3 Examples, 4.8 route, Check and *Needs*, the source correction on Lemma 5.7.7, and plan source issue E13 and the coverage entry. 4.2 and 4.3 use h³ = 1 through q = h¹ − 1; they are consistent and unchanged.

## F02 (P2) — applied

Verified: in the board design of PotentialAutomorphyInfrastructurePartII, *Galois representations attached to constituents…* takes "the data l … as in PL.2/unitary-algebraic-modular-forms", whose hypothesis 1 is "l odd". Ger19 Proposition 2.7.2 (Ger19 line 1065) holds for an arbitrary prime l (Ger19 line 144).

The repair is option (a), owned here, and folded into 2.3 rather than a new 2.4. 2.3 now also states r_2(π) for every constituent, with clauses (i)–(iv) of Ger19 Proposition 2.7.2. The route uses:
- PL.2 *Base change and descent* (1) and the first assertion of (2), which carry no condition on l;
- AutomorphicGaloisRepresentationsPartII AG2.3 *Arbitrary regular conjugate-self-dual existence* (stated for every ℓ) together with AG2.2 *Twisting…*;
- AG2.5 (every ℓ).

Other places changed:
- Line 66 now says what PL.2 actually covers.
- 3.3's route and *Needs* point to 2.3 instead of PL.2.
- The scope, the AG2 contract, the 2.3 *Needs* and the Layer 2 and Layer 3 dependencies are updated.
- 2.3 has a new Check for n = 1 and for the constant constituent.

## F03 (P3) — applied

2.2(1): "finite faithful Λ-algebra" → "finite Λ-algebra and finite faithful O⟦T(l^{b₀})⟧-algebra (Ger19 Corollary 2.5.4)". This is stronger than the reviewer's witness. The scalar −1_n always lies in T(l). If U_v ∋ −1_n at every v ∤ 2, then [−1_n] acts by the sign ε₀ = ∏_{v∈R}∏_j χ_{v,j}(−1); the twist contributes (−1)^{dn(n−1)/2} = 1 because nd ≡ 0 mod 4. So Λ → T is never injective under that hypothesis. This is added as a Check. Consumers 4.5 and 4.6 use only finiteness.

## F04 (P3) — applied

Verified: AutomorphicBundles (open head) Layer B5 names four settings and does not mention Hilbert–Siegel varieties. No roadmap owns ordinary Hida theory on them; `roadmaps grep` finds only ShimuraCompactifications C5.25–C5.26 (boundary and Koecher).

Changes:
- The B5 contract line now states what B5.10–B5.12 provide.
- The gap is split into `hilbert-siegel-hida-module-free`, `hilbert-siegel-taylor-wiles-coinvariants` and `hilbert-siegel-ordinary-classicality`, each with its own `needs`, in both the README and `plan.json`.
- 5.6 cites all three, 6.2 cites the coinvariants slug, and the Layer 5 and Layer 6 dependencies are updated.
- The pattern fix: 6.2 consumes M^χ, which no clause supplied before, so the free-module and coinvariants clauses now include M^χ.

The supplier stays AutomorphicBundles. AutomorphicBundlesPartII is not in this brief's merge order, so it cannot be cited.

## F05 (P3) — applied

The 4.2 Check now uses n = 2 with F⁺ = ℚ(√105) and F = ℚ(√−7, √−15). I checked that this field pair satisfies the hypotheses:
- F/F⁺ is unramified at every finite place: 3, 5 and 7 already ramify in F⁺, and 2 is unramified.
- 2 splits completely, since −7 ≡ −15 ≡ 105 ≡ 1 mod 8.
- nd = 4.

Then Λ = O[{±1}⁴]⟦w₁..w₄⟧ is free of rank 16 over Λ⁰ and is not a domain. The Check also says that one ℚ₂-place forces F⁺ = ℚ, which is excluded.

## F06 (P3) — applied differently

The two suggested sentences do not by themselves control the cut by V(I_X), so I took a different repair. 4.5(a) is now stated for each minimal prime Q, with R^loc_X the quotient by the product component. The route proves Spec R_X = C_X ∩ V(a_∞), using three facts: V(I_X) = C_X (by 4.4(2) and the irreducibility of R^△_v/Q); Supp(H/a_∞) = Supp H ∩ V(a_∞); and C_X ⊂ Supp H_{1,∞}. Krull's height theorem in the complete local domain C_X then gives every component dimension ≥ 24 − 19 = 5 = dim Λ, and each component maps onto Spec Λ/Q.

## Checks run

- Dependency check (verbatim):
  ```
  candidate: OrdinaryAutomorphicFormsAndModularityLiftingPartII is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
  depcheck: 56 roadmaps, 638 edges, 0 problem(s)
  ```
  There is no UPWARD and no CYCLE line.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- `plan.json` parses. The node fields of 2.2, 2.3, 3.2, 3.3, 4.2, 4.5, 4.8, 5.6 and 6.2 were regenerated from the README text, and a field-by-field diff confirmed that no other node changed.
- `sources.toml`: CHT08 locator now includes Lemma 2.2.11; Ger19 `cited_for` now includes 2.3. No new source was fetched and nothing is missing.
- Elaboration: not applicable, because there is no `Suggested.lean`.

## Adversarial pass (changed statements)

| Statement | Instances | Values | Result |
|---|---|---|---|
| 3.2(a) | n=2,d=2,#T=3; #T=1 | 19 + (−1) = 18, 18 − 14 = 4; general (n²+1)#T − 1 + nd − framing = nd | holds |
| 3.2(b) | same; printed bound | 5 = dim Λ; printed 9 > dim Λ contradicts 4.7 | target; key step unsourced |
| rank-one count | n=1 | (1+#T+d) + (#T−2) − (2#T−1) = d vs CFT 1+d | the saving holds in rank one |
| det homomorphism | (g,a)j | j(g,a)j⁻¹ ↦ (a^n det g⁻¹, a^n) both ways; ν∘det = (−1)^{n+1}ν^n; value −1 at c_v | multiplier χ^nδ^{n+1} |
| 2.2 non-faithful | −1_n, nd≡0 mod 4 (n=2,d=2; n=4,d=1) | twist (−1)^{dn(n−1)/2} = 1, so ε₀ = ∏χ_{v,j}(−1); −1_n ∉ T(l^{b₀}) when smallness comes from a place above 2 | consistent with 2.2(1) |
| 2.3 r_2(π) | n=1; λ=0 constants | r^c = r^{−1}; Speh(1,n), sum of n characters, Eisenstein | holds |
| 4.2 Check | ℚ(√105), ℚ(√−7,√−15) | rank 16, 16 components, nd = 4 | valid instance |
| 4.5(a) | n=2,d=2,#T=3,q=5 | dim C_X = 24, generators of a_∞ = 19, ≥ 5 | holds |

## For the maintainer

- **3.2(b)** carries a step that no source proves. This is a human decision; the reasoning is under F01.
- **PotentialAutomorphyInfrastructurePartII** is cited as a supplier but is absent from this brief's merge order. It is a board design at position 86 of the board order. The reviewer accepted this and I did not change it; it may need confirming at intake.
- **New consumers.** This roadmap now consumes AutomorphicGaloisRepresentationsPartII AG2.2 and AG2.3, which it did not before.
- **Changed gap slugs.** The gap `hilbert-siegel-ordinary-hida-module` no longer exists; its three replacements are under F04. No other roadmap cites the old slug.
- **Ownership.** Ownership of the l = 2 constituent representations was checked by object through `roadmaps grep` on main and the open heads. The board-package designs I read were PotentialAutomorphyInfrastructurePartII and AutomorphicBundlesPartII; neither states them at l = 2.
- **Suspicious text.** None found in the review.
