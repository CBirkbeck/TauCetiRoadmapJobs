# FIX-RT-DeligneWeightsAndPurityPartII~1

Two red-team reviews were merged. Both number their findings F01–F05. The first five sections below answer pass a (codex), and the next five answer pass b (claude). Each section begins with the pass it answers. Pass a F02 and pass b F02 make the same claim; it is settled once, under pass a F02. Cross-roadmap citations were checked as follows: ClassicalAdicEtaleCohomology and FiniteFlatGroupsAndIntegralPadicHodgeTheory at the heads of their open pull requests, as served by the roadmap index of 2026-10-26; EtaleCohomologyFoundations and SchemeAndStackFoundations on main.

## F01 (P2) — applied

Pass a. The witness holds. ITO20 line 1674 requires a < b ≤ 1. At a = b = 1 the region {|T| = 1} is connected, so H⁰(ℤ/3) = ℤ/3, while D(1)° ∩ {|T| = 1} = ∅ has H⁰ = 0. Change: the annular sheaf comparison now opens with "Let a, b ∈ |Kˣ| satisfy a < b ≤ 1". The annulus definition in the annular-cover target changes from "a ≤ b ≤ 1" to "B(a,b) = {a ≤ |T| ≤ b}, a < b ≤ 1". The equal-radius non-example is a new Check. The same pattern appears in three other statements, the decomposition, tame-trivialization and uniform direct-image statements, and all three already required a < b.

## F02 (P3) — applied

Pass a. This section also settles pass b F02. The witness holds. In V′[t]/((t−s)(t+s)) the difference (t−s) − (t+s) = −2s lies in the maximal ideal, so the special fibre is κ[t]/(t²), which has one point. Change: "the scheme splits into two copies of the base" → "only the generic fibre splits into two points; the branches meet over the closed point; the special fibre is κ[t]/(t²), not κ × κ; the generic stalk is (ℤ/n)² with trivial action".

## F03 (P1) — applied differently

Pass a. Declared as the supplier gap adapted-plurinodal-alteration. The witness holds. ClassicalAdicEtaleCohomology §5.4 `PlurinodalAlteration.exists` (head README line 2721) gives a plurinodal factorization with group control. It has no prescribed dense open and no étale marked boundary. ITO20 Theorem 3.3 (ITO20 lines 412–422) needs both. Change: a new contract line "What ClassicalAdicEtaleCohomology must provide (gap:adapted-plurinodal-alteration)", the same slug in the plan's `gaps` (§5.4), and "adapted" defined at the use site (ITO20 line 381). The gap is cited in the Needs and the Dependencies.

## F04 (P3) — applied

Pass a. The witness holds. FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3 states the p = 2 uniformiser (−π_n)_n and N(√2) = −2. §R07.4.1 gives the mod-p Kummer frame. Change: "§R07.4.1 fixes its p = 2 norm-compatible sign" → "§R07.4.3 supplies the field of norms, its Galois equivalence and the p = 2 sign; §R07.4.1 supplies the mod-p Kummer frame", plus the ℚ₂ two-term witness. The other citation, the §2.3 Needs line (§§R07.4.1, R07.4.3), stays correct.

## F05 (P3) — applied

Pass a. The nine bullets test nothing. Removed: §0.1 ×2 (they restated §§0.2, 0.3 and 2.4), §0.4 ×2 (restatements), §3.5 (the unit law, already tested by the n = 3 Check), and §§3.2, 4.6 (scope prose, moved into the target paragraphs). Replaced: §0.4 by the contragredient Check (−Nᵗ, eigenvalues 1/2 and 1, central weight −1), §0.7 by the S₃ × tame-datum Check, and §0.8 by the split Tate factor (1−q⁻ˢ)⁻¹ against its semisimplification.

## F01 (P2) — applied differently

Pass b. Declared as the supplier gap huber-smooth-relative-duality. The witness holds. ClassicalAdicEtaleCohomology §9.6 gives curve duality and local effacement in general dimension. §9.7 (head README line 4691) gives Berkovich-strict duality and says it is not asserted for arbitrary adic inputs. ITO20 uses Huber's Corollary 7.5.5 for a smooth nonproper g, and for its base change over D(b) ∩ B(a,b) (ITO20 line 2009, line 2038). Change: the contract sentence now says what §§9.6–9.7 supply. There is a new gap (README, plan) cited in the smooth principal comparison and in the Dependencies. "9.6" is dropped from the uniform direct-image Needs, because that target uses no duality.

## F02 (P3) — applied

Pass b. This is the same claim as pass a F02 and is settled there with the reviewer's corrected wording. The Check's conclusion, a stalk (ℤ/n)² with trivial action after base change, is unchanged.

## F03 (P3) — applied

Pass b. The witness holds. ITO20 lines 1956–1958 obtain the proper model from Nagata's compactification theorem. SchemeAndStackFoundations §0.9 supplies only finite-presentation models. Change: the smooth principal comparison's Needs line gains "EtaleCohomologyFoundations §G.2 `nagataCompactification` for the proper model over `Spec O[T^(1/p^N)]`". The declaration was checked on main in EtaleCohomologyFoundations §G.2. It has a qcqs base and separated finite-type source, which covers this use.

## F04 (P3) — applied

Pass b. The witness holds. Change: the ITO20 References entry now lists every ITO20 locator the README uses: §§1.2–3.17, 4.1–4.11, 5.3, 5.5, 6.1–6.11, 7.1–7.7 and Appendix A, with pages, and every line locator. These include lines 381, 2009 and 2038, which the new gaps introduce. The entry now agrees with the `sources.toml` locator, pp. 1–54.

## F05 (P3) — applied

Pass b. The witness holds. `duality_splitting` quantifies over arbitrary fields, groups, modules, pairings and representations, and its conclusion is linear algebra on its hypotheses. That makes it a free-carrier lemma, not a headline. The geometric form (cohomology of Y and Z′ under f*) is not statable at the pins. Change: `duality_splitting` is deleted. The module docstring says that nothing is statable and that §4.4 stays a README target. README §4.4 and "How to read the build" no longer name it.

## Checks

- Elaboration: `lake env lean packages/DeligneWeightsAndPurityPartII/Suggested.lean`, run from the content checkout, exited with code 0 and printed nothing. The file contains its module docstring and an empty `namespace TauCetiRoadmap.DeligneWeightsAndPurityPartII`.
- `#check @name` comparison: the file declares nothing, so there is nothing to compare. The only earlier declaration, `duality_splitting`, was removed.
- Dependency check: `depcheck: 56 roadmaps, 654 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Citation resolver: no cross-roadmap citation or roadmap Lean name is found nowhere. The resolver did not check library names, because the host has no pinned Lake packages. The Mathlib names in the supplier contracts were not changed in this round.
- Gate failures: none were listed for this round.
- Check counts: removing the non-test bullets leaves fewer than three Checks in the theorem sections §3.2 (1), §3.5 (2) and §4.6 (4). No definition's Check list was reduced.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Annular comparison, a < b ≤ 1 | constant ℤ/n with a = |ϖ|, b = 1; a = b = 1, n = 3; n = 1 | H⁰ = ℤ/n → ℤ/n and H¹ = ℤ/n(−1) → ℤ/n(−1); equal radii: ℤ/3 → 0; n = 1: 0 → 0 | the strict inequality is needed; added |
| Annulus definition with a < b | identity cover; Kummer m = 2 | preimage radii (a^(1/2), b^(1/2)) with a^(1/2) < b^(1/2) | consistent with the decomposition target |
| t² = π base change | V′ = V[s]/(s² − π), p ≠ 2 | special fibre κ[t]/(t²) has 1 point, κ × κ has 2; generic fibre K′ × K′; stalk (ℤ/n)² with σ = id | Check corrected |
| gap adapted-plurinodal-alteration | relative dimension 0 (f an alteration); ℙ¹_S → S with X° = ℙ¹ ∖ {0,∞} | d = 0: S′ = X and f′ = id (ITO20 line 424); ℙ¹: D = {0,∞} is étale over S and its complement is X° | hypotheses match ITO20 Theorem 3.3 |
| gap huber-smooth-relative-duality | g = id of an annulus, N = 0; the rank-3 cover T ↦ T³, n = 3; the relative closed disc over the annulus, N = 1 | ℤ/n ≅ Hom(ℤ/n, ℤ/n); (ℤ/3)³ ≅ Hom((ℤ/3)³, ℤ/3); R⁰g_*(ℤ/n(1)) = ℤ/n(1) ≅ Hom(R²g_!ℤ/n, ℤ/n) = Hom(ℤ/n(−1), ℤ/n) | true on every instance; the lcc hypothesis is kept, as in ITO20 line 2008 |
| §0.4 contragredient Check | q = 2 string | dual Φ eigenvalues 1 and 1/2; ker(−Nᵗ) = E e₁*, eigenvalue 1/2, weight −2 = −1 − 1; e₀* in grade +1, eigenvalue 1, weight 0 = −1 + 1; exp(t(σ)N) dualises to exp(−t(σ)Nᵗ), not exp(t(σ)Nᵗ), for t(σ) ≠ 0 | sign pinned |
| §0.7 S₃ Check | E = ℚ₃, ℓ = 3, Q = 2 | t(s,x) = x is a homomorphism with quotient ℤ̂; dimensions 1 + 2 = 3; Frobenius (1, Φ) acts trivially, spectra (1) and (1,1), weight 0; the intersection is zero because 3a = 0 forces a = 0 | datum valid; both summands pure of weight 0 |
| §0.8 local-factor Check | split Tate curve | invariants Ee₀ with eigenvalue 1 give (1−q⁻ˢ)⁻¹, pole at Re s = 0 ≤ 1/2; the semisimplification adds (1−q^(1−s))⁻¹, pole at Re s = 1 > 1/2 | discriminates N |
| §R07.4.3 sign witness | k = ℚ₂ | N(√2) = −2; N(−π_(n+1)) = −π_n; (−π_n) ≡ (π_n) mod 2 | matches the supplier's Checks |
| §4.4 annihilator prose (Lean name removed) | S₃ diagonal over ℚ, c = 3 | v ↦ (y ↦ q(v, b y)) has kernel x₁+x₂+x₃ = 0, of dimension 2; 1 + 2 = 3 | same content as the deleted signature |

## Notes for the maintainer

- Two new supplier gaps, both owed by ClassicalAdicEtaleCohomology: adapted-plurinodal-alteration (§5.4) and huber-smooth-relative-duality (§§9.6–9.7). That roadmap owns de Jong's plurinodal interface and adic duality, so it is the natural owner. No target here stands in for either gap.
- `TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting` is removed. The citation resolver finds no roadmap that cites it.
- Ownership of the two gap objects was checked with `roadmaps grep` over main and the indexed open heads. Searches: "adapted to a dense open", "nodal curve adapted", "Corollary 7.5.5". Every Corollary 7.5.5 hit is in ClassicalAdicEtaleCohomology (§9.6 curve duality and §10.4 annulus cohomology). Neither is the relative statement over an annulus.
- No source was fetched or missing, and `needs-references.toml` was not written. The reviews contain no suspicious instructions.
