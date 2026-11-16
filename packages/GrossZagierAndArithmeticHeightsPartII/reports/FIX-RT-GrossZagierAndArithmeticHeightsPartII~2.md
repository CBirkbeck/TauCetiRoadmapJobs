# Repair report: red-team round 2 (passes a and b)

Files changed: `packages/GrossZagierAndArithmeticHeightsPartII/README.md`, `packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean` (module docstring only), `packages/GrossZagierAndArithmeticHeightsPartII/design/plan.json` (top-level `gaps`: `"8.6"` added to `neededBy` of `ramified-hermitian-densities`). All six findings were checked against the cached sources and are correct. None overlap, so each is settled on its own.

## RT-GrossZagierAndArithmeticHeightsPartII~2a/F01 (P2) — applied

Changed: §5.1 "Λ^∨ = {x ∈ V : h(x, Λ) ⊂ u⁻¹O_F}" → "for Λ with nondegenerate span, Λ^∨ = {x ∈ Λ ⊗ F : h(x, Λ) ⊂ u⁻¹O_F}; for full rank, {x ∈ V : …}". The API bullet now matches. New Check: for the line O_F·e the ambient set contains F·f, while the dual in the span is u⁻¹O_F·e, with invariant 1.

Verified: LL2 lines 512–533 take a full-rank lattice of its own space; GeometryOfNumbersAndQuadraticArithmetic 2.7.1 requires `Submodule.IsLattice K L`.

Same fault elsewhere: the Conventions duals (all three settings) gained a sentence saying the dual is taken in the span, with integrality unchanged. This makes §6.3 (A^∨/A) and §§6.2–6.7 (L♭) correct.

## RT-GrossZagierAndArithmeticHeightsPartII~2a/F02 (P2) — applied

Changed: §13.9 "c₀·E_v^coh" → c₀·^vEis₀·log(q_v²), where ^vEis_t = (vol(K_(G,v))/vol(K_(Λ_(t,v)^♯)))·E(z, 0, φ^v ⊗ 1_((Λ_(t,v)^♯)^n)) on the nearby space ^vV, with LL1 Definition 3.8 measures. The ramified term is rewritten with the same ^vEis_(2j). New Check: ratio (q+1)/(q^(2r)−1), which is 1/2 at q = 3, n = 2.

Verified: K (1.7)–(1.10), lines 213–234; LL1 line 2044 (almost self-dual volume); LZ (3.3.0.1), line 657, with LL1 Definition 3.8 (self-dual volume 1). Then c₀·ratio = −1/(q^(2r)−1), which matches LL1 (9.2), line 2038, after the factor 2 of §4.6. *Needs* adds §4.6 and MetaplecticAutomorphicForms §6.7.

## RT-GrossZagierAndArithmeticHeightsPartII~2a/F03 (P3) — applied

Changed: §9.5 gains an opening reduction to d ∈ O_F and an integral characteristic polynomial of g′; otherwise both sides vanish (orbit outside GL_n(O_F); a fixed point would force integrality). The n ≤ 3 clause "forces 1 − ξd ∈ O_F^×" → "gives v(1 − ξd) ≤ 0, hence a unit since d ∈ O_F". ξ is moved in its residue class so that ξd ≠ 1. The witness becomes a Check.

Verified: Z line 1307 makes the same assumption. Matching is GL_(n−1)(F)-conjugacy (Z lines 477–479). I extended the repair to the characteristic polynomial because the "at most n residues" count in (a) and (b) needs it. *Needs* adds §9.1, PELModuliPartII §§1.3 and 1.6, and LubinTateFormalModulesAndQuasiCanonicalLifts §6.1. The Source-corrections bullet on Z Proposition 4.12(i) now names the reduction.

## RT-GrossZagierAndArithmeticHeightsPartII~2a/F04 (P3) — applied

Changed:
- Scope: GrossZagierAndArithmeticHeights §6.20 is named as owner of the Picard-valued Hecke series on products of Shimura curves, and the §12.6a ownership clause says its p = 2 case is that series, neither re-proved nor consumed.
- §12.6a(d): a quaternionic p = 2 paragraph (GSpin of (B, nrd), Hecke graphs, weight 2).
- New Check: signature (2,2)/(4,0), weight 2, the case goes through (c).

Verified: GrossZagierAndArithmeticHeights §6.20 at its open head says "defines a weight-two automorphic form"; YZZ09 line 172 has the remark on the product of two Shimura curves. That roadmap is earlier in the merge order, and no edge is added.

## RT-GrossZagierAndArithmeticHeightsPartII~2b/F01 (P2) — applied

Changed: §8.6 "Prove that for every integral lattice of rank n ≥ 3 … Int(L) = ∂Den(L)" → "Statement (H_n) …; prove (H₃); for n ≥ 4, (H_n) is the hypothesis, not a target". §8.7 is unconditional for n ≤ 3 and assumes (H_m), 4 ≤ m ≤ n, for n ≥ 4. The §13.10 statement carries the same hypothesis for ramified v.

Same fault elsewhere: Summary, Scope (new sentence), How to read, Layer 8 intro, the §8.6 rank-four Check, the §8.7 Check, §13.10 route and *Needs*, Downstream consumers, Acceptance file, Source corrections, and the `Suggested.lean` docstring. (H_n) covers only lattices of odd largest invariant without a unimodular summand, so it is strictly weaker than the conclusion it supports.

## RT-GrossZagierAndArithmeticHeightsPartII~2b/F02 (P3) — applied

Changed: §8.6 now defines D(L₁), Int(L)^(n₁) and ∂Den(L)^(n₁), states the route of (H₃), and adds an API list:
- the expansion;
- the reduction (Theorem 5.6(1));
- the rank-three decomposition (Theorem 1.4, translated: L♭ ⊂ Λ, Λ ⊂ Λ₀);
- the primitive identities (Propositions 11.1–11.3).

The wrong locator "primitive densities (Theorem 1.3)" is removed. Two Checks are added. *Needs* adds §7.1 and gap:ramified-hermitian-densities (`neededBy` gains "8.6").

Verified: HSY23a lines 162–231 and 569–617 (Definitions 2.15 and 2.18, Lemma 2.16), lines 1063–1100 (Definition 5.3, Corollary 5.5, Theorem 5.6), lines 2199–2403 (Propositions 11.1–11.3, proof of Theorem 1.2); K line 523 (opposite vertex convention). Check values: D(⟨x⟩) = ᴸZ(x) − ᴸZ(π⁻¹x); at H₁ ⊥ ⟨u₃⟩ both sides give 1 − q, as Proposition 11.2 does.

## Checks run

- **Elaboration:** `lake env lean packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean` from the content checkout exits 0 with no output. The file has `import Mathlib` only, no `TauCeti.*` import, no declarations and no `set_option`.
- **Signature check:** there is no `#check @name` file to compare, because the file declares nothing. Only the module docstring changed.
- **Dependency check:** `depcheck: 259 roadmaps, 2484 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line, both before and after the last edits.
- **Citation resolver:** `roadmaps resolve README.md` finds no cross-roadmap citations or Lean names that resolve nowhere.
- **Gaps:** the eight `gap:` slugs in the README equal the eight in `design/plan.json`.

## Adversarial pass (computed values)

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| §5.1 dual in span | n = 2, Λ = O_F·e, h(e,e) = 1 | ambient: F·f ⊂ dual, quotient not of finite length; span: u⁻¹O_F·e, O_F/u, invariant 1 = 2b + 1 at b = 0 (LL2 Lemma 2.12(3)) | holds, Check added |
| §5.1 full rank | plane h(e,f) = u⁻¹ | Λ^∨ = Λ in both readings | unchanged |
| Conventions integrality | any rank | Λ ⊂ Λ^∨ ⟺ h(Λ,Λ) ⊂ u⁻¹O_F (or O_F), independent of ambient | holds |
| §13.9 ratio | n = 2r, q = 3, r = 1 | (q+1)/(q²−1) = 4/8 = 1/2; c₀ = −1/4; c₀·ratio = −1/8 = −1/(q²−1) | holds |
| §13.9 against LL1 (9.2) | n = 2r | K: W′_LZ(φ₁) − log(q²)/(q^(2r)−1)·W(φ₀) = 2·[W′_LL1 − log q/(q^(2r)−1)·W], since W′_LZ = 2W′_LL1 (§4.6) | consistent |
| §13.9 self-dual volume | T = Gram(Λ₀) | LL1 Def. 3.8: W = γ·b(0)⁻¹·vol; LZ (3.3.0.1): W = ∏(1 − (−q)^(−i)) = b(0)⁻¹, γ = 1 | vol = 1 |
| §9.5 witness | V₃ = H ⊥ ⟨a⟩, g′ = diag(ϖ⁻¹, ϖ, 1), v(1−ξ) = 1 | d = (ϖ⁻¹+ϖ)/2, v = −1; det(1−ξg′): −1+0+1 = 0; v(1−ξd) = −1; v(det(1−g)) = 1 | old implication false; excluded by the reduction |
| §9.5 second witness (unipotent) | g′e = e, g′f = f + te, t + t̄ = 0, v(t) = −1, u₀ = e + f/2 | char poly (1−T)³ integral; d = 1 + t/4, v(d) = −1; v(1−ξd) = −1 for ξ̄ ≠ 1 | d ∈ O_F needed separately from char poly |
| §9.5 reduction, orbital side | d ∉ O_F | (n,n) entry invariant under diag(h,1), so h⁻¹γh ∉ M_n(O_F) and Orb ≡ 0 | both sides 0 |
| §9.5 reduction, geometric side | fixed point | ρ⁻¹g′ρ ∈ End(X × Ē), an order of M_n(F); Ē-component d ∈ O_F | Int = 0 otherwise |
| §9.5 count | q = n = 3, n ≤ 3 | ≤ 3 of 4 residues excluded; residue class infinite, one ξ with ξd = 1 avoided | ξ exists |
| §12.6a p = 2 | (B, nrd) | signature (2,2) at ι (det on M₂(ℝ)), (4,0) elsewhere; weight p/2 + 1 = 2 | matches §6.20 weight 2 |
| §8.6 (H_n) scope | H₁ ⊥ H₁ | invariants (1,1,1,1), a₄ = 1 odd, all positive: in (H₄) | hypothesis, not target |
| §8.6 (H₃) | ⟨e⟩ ⊥ H₃, h(e,e) = π₀ | Gram diag(H₃, (−1)(−π₀)), a = 3, c = 1, a > 2c: 1 − q³ | in second form |
| §8.6 D(⟨x⟩) | n₁ = 1 | one lattice π⁻¹⟨x⟩, coefficient (−1)·q⁰ = −1 | = HSY23a Remark 2.17 |
| §8.6 weight q^(i(i−1)/2) | L♭ = diag(u₁(−π₀), u₂(−π₀)), x unit | π⁻¹L♭ ⊥ x ≅ I₃, Int = 1; weight q against 1 changes Int^(2) by q − 1 | weight needed |
| §8.6 primitive identity | H₁ ⊥ ⟨u₃⟩ | overlattices of H₁ in π⁻¹H₁: q+1 unimodular (det valuation 2 − 2 = 0) and π⁻¹H₁ (nonintegral); Int(L) = (1−q) + (q+1) = 2; Int^(2) = 2 − (q+1) + q·0 = 1 − q; ∂Den(L) = (1−q) + (q+1)·1 = 2; ∂Den^(2) = 2 − (q+1)·1 + q·0 = 1 − q | = HSY23a Prop. 11.2, 1 − q^(2c+1) |
| §8.6 Theorem 1.4 convention | HSY Λ₂ = (our Λ)^♯ | L♭ ⊂ Λ₂^♯ ⟺ L♭ ⊂ Λ; Λ₀ ⊂ Λ₂ = Λ^♯ ⟺ Λ ⊂ Λ₀ (Λ₀ self-dual) | as stated |
| §8.7 induction | rank n | step n uses (H_n) and §8.7 in rank < n (via §7.7 and the W_(≤0) vanishing) | needs (H_m), 4 ≤ m ≤ n |
| §13.10 | n ≥ 4, F unramified everywhere | no ramified v, so no (H_m) is needed | unconditional, as stated |

## For the maintainer

- **Scope (headline change):** the Krämer Kudla–Rapoport identity (§8.7) and the modified arithmetic Siegel–Weil formula at ramified places (§13.10) are now conditional on (H_m) in rank n ≥ 4. This is a narrowing of the roadmap's headline claims, and the human reviewers may want to note it.
- **Names others cite:** none of this roadmap's ids were renamed or removed; §§8.6, 8.7, 13.9 and 13.10 keep their numbers.
- **Ownership:** GrossZagierAndArithmeticHeights §6.20 is now named as the owner of the quaternionic p = 2 case. No new edge was created, since this roadmap does not consume it, and that roadmap is earlier in the merge order. Ownership against open pull requests was checked through `roadmaps show` and `roadmaps grep` for GrossZagierAndArithmeticHeights, GeometryOfNumbersAndQuadraticArithmetic, PELModuliPartII and LubinTateFormalModulesAndQuasiCanonicalLifts at their heads.
- **Sources:** no new source was fetched and `sources.toml` is unchanged. Every new locator is in an already cached text (LL1, LL2, LZ, K, Z, HSY23a, YZZ09).
- **Suspicious text:** none found in the reviews.
