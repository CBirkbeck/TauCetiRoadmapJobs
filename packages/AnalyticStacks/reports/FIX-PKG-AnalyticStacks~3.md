# FIX-PKG-AnalyticStacks~3

Findings of the package review `REV-PKG-AnalyticStacks~2` (five findings: one P2, four P3). Every finding was checked against the sources, the sibling designs and the supplier on main before any edit. `Suggested.lean` is unchanged: no finding touches its five declarations.

## F01 (P2) — applied

3.1, first API bullet. Old: "I ∩ P consists of the equivalences composed with idempotent maps with induced structure". New: f ∈ I ∩ P iff B has the induced structure and A ≅ B × B′ (complementary idempotents of 2.5), equivalently f* is both an open and a closed immersion; truncatedness for 0.5 now comes from "every morphism of I is a monomorphism" (RCSolid Lemma 6.3.3(3), RCSolid line 4037). A new negative Check: ℤ_■ → ℤ_(p,■) is in P with ℤ_p idempotent, but it is not in I.

Verification. For f ∈ I ∩ P the triple f_♮ ⊣ f* ⊣ f_* has f_♮ fully faithful, so f_* is fully faithful too. f_* is the forgetful functor of Mod_B(D(A)), so it preserves colimits and satisfies the projection formula. That makes f a closed immersion as well as an open one, so its sublocale is clopen. In a locale a clopen sublocale is complemented, so 1 ≅ B × B′. Conversely, the projection A = B × B′ → B has f_♮ the extension by zero, which is fully faithful and satisfies the projection formula, so the map is in I, and it is in P. The counterexample holds: RHom_(ℤ_■)(ℤ_p, ℤ) = coker(⊕_ℕ ℤ → ⊕_ℕ ℤ, shift − p)[−1] = ℤ[1/p][−1], so Hom(ℤ_p, ℤ) = 0 and ℤ_p is no retract of ℤ. The bullet's only consumer is 0.5's truncatedness hypothesis, which the monomorphism clause still supplies, so 3.2 and 3.3 are unaffected. Pattern search: "I ∩ P" occurs elsewhere only in 0.5's hypothesis and in its fourth Check (f_♮ ≅ f_* for f ∈ I ∩ P), and both stay correct. 3.1's second Check (ℤ_p idempotent, so the map is a closed immersion) stays true.

## F02 (P3) — applied

Downstream consumers. Old: RationalAnalyticPrismatization "hypercover-inversion → 0.13(6) with 3.3". New: "perfect-complexes-fredholm-stacks → 4.5 (through 0.13(6) and 3.3)". The HigherHidaAndColemanTheory bullet is deleted.

Verification. RationalAnalyticPrismatization's `design/plan.json` at its newest design head (b0e8a50, newer than the b00918d the review read) declares `perfect-complexes-fredholm-stacks` against AnalyticStacks §4.5 and no `hypercover-inversion`. The other seventeen slugs agree with the bullet. `packages/HigherHidaAndColemanTheory/design/README.md` (lines 231, 233, 316–320) declares `solid-localization-kernel` and `discrete-adic-solid-comparison` against SolidAnalyticRings, and its §2.1 `*Needs:*` names only SolidAnalyticRings. It names AnalyticStacks nowhere. Of the reviewer's two options I took the deletion, as round 1 did for LocallyAnalyticRepresentationsOfLocalGroups: a consumer list should not describe a roadmap by citations it does not make, and where that roadmap's gaps should point is its own design's decision. `design/plan.json` still lists HigherHidaAndColemanTheory as a consumer (its line 2977). Only the plan's `gaps` list may be edited here, so that entry stays.

## F03 (P3) — applied

6.6, the coherent-duality Check. Old: "for f: X → Spec A proper and smooth … restricts to the adjunction … of SchemeAndStackFoundations §§2.19–2.20 … compatibly with base change in A". New: the restriction to §§2.19–2.20 is stated only for A Noetherian on bounded-below discrete objects. For a general A, the restriction is RCSolid Remark 7.7.24, and only the dualizing object is compared, through §2.20's `RelativeDualizingComplex` and `.baseChange`. ℤ[x₁, x₂, …] is the boundary case.

Verification. On main (content 9494a907), `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §2.19 says it covers only bounded-below complexes with quasi-coherent cohomology on Noetherian schemes and separated finite-type maps, and asserts nothing for non-Noetherian bases (lines 4133–4135). §2.20's `.upperShriek` uses §2.19 in that regime (line 4336), and `RelativeDualizingComplex` covers every flat locally finitely presented f (line 4281). Pattern: the Scope bullet (line 14) and the supplier contract (line 70) quoted §§2.19–2.20 without the regime. Both now carry it: "Noetherian schemes" in Scope, and the D⁺_QCoh / separated finite-type / Noetherian clause in the contract. Layer 6 Dependencies cites only section numbers and is unchanged.

## F04 (P3) — applied

1.5 route. Old: "!-ability and universal !-descent are !-local on the target (HM Theorem 3.4.11(iii), HM line 2258)". New: "(!-ability: HM Theorem 3.4.11(iii), HM line 2265; universal !-descent: HM Corollary A.4.9(ii) with Lemma A.4.8, HM line 6457, HM line 6435)". The HM manifest locator gains Lemma A.4.8 and Corollary A.4.9, and the References entry gains the same.

Verification. HM line 2265 (Theorem 3.4.11(iii)) is about membership in E′ only. HM line 6461–6462 (Corollary A.4.9(ii)) proves descent along a sieve from descent along a larger sieve plus universal descent along the pulled-back sieves. Lemma A.4.8 (line 6435) is the underlying lemma, and the proof at HM line 2159–2161 uses the same Corollary. Pattern search: the other use of Theorem 3.4.11 (0.6, line 213) is about the properties of E′ themselves, which the theorem does state, so it is unchanged.

## F05 (P3) — applied

1.7, second Check. The new wording follows the reviewer's: a static N in weight 1 is in the heart only as M₁ = N[−1]; N itself in weight 1 is not, and the opposite shear would put N[1] there. A V = D(ℚ) witness is added.

Recomputing the other Checks on the same object turned up an inconsistency in 1.7's own statement. The target said the differentials are d_n: M_n → M_(n−1)[1], following ALRS line 1902, alongside the connectivity condition on ⊕ M_n[n] and heart = chain complexes. These cannot all hold. With M_n = N_n[−n] (heart), a map M_n → M_(n−1)[1] is an element of Ext²(N_n, N_(n−1)), not a chain differential. They do hold with d_n: M_n → M_(n+1)[1]. That is what 1.6 forces: Fil^n sits in weight n and t has weight −1 (line 445), so the boundary maps gr^n → gr^(n+1)[1] raise the weight. It also matches DerivedDeRhamCohomology §1.18 (gr^i ∈ D^(≤i) cohomologically, at its open head). The target now reads d_n: M_n → M_(n+1)[1] and says in one clause why it differs from ALRS line 1902. A second new Check pins the direction: the complex ℚ → ℚ is M₀ = ℚ, M₁ = ℚ[−1] with d₀ the identity, while the opposite direction gives Ext²_ℚ(ℚ, ℚ) = 0. Consequence: RationalAnalyticPrismatization's `formal-line-shearing` contract (§1.7 with §3.8) receives the weight-raising convention.

## Checks

- **Elaboration.** `lake env lean packages/AnalyticStacks/Suggested.lean`, run from the content checkout at the pins, exit 0 in 3.5 s. The only message is `102:8: warning: declaration uses sorry`. There is no `TauCeti.*` import, so no module needed building.
- **`#check` audit.** A scratch copy with `#check @` for all five declarations (`bisimplex`, `compactificationBisimplex`, `restrictedDiagonal`, `restrictedDiagonalMap`, `restrictedDiagonalMap_isEquivalence_hoFunctor`) elaborated once. The types are identical to `signatures.md` and match README 0.3(1). The file has no `variable` block, so no binder can be lost. Nothing changed.
- **Dependency gate.** `tauceti-roadmap … gate --depcheck packages/AnalyticStacks/README.md --name AnalyticStacks --order merge-order/ORDER.txt --movable` printed `depcheck: 56 roadmaps, 647 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or `moved:` line.
- **Gate failures listed in the brief.** None.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 I ∩ P bullet | id_A; ℤ_■ × ℤ_■ → ℤ_■; ℤ_■ → ℤ_(p,■); A = 0 | id: B′ = 0, in I ∩ P. Projection: ℤ ⊕ ℤ = ℤ × ℤ, f_♮ is extension by zero, fully faithful, so in I ∩ P. ℤ_p: Hom(ℤ_p, ℤ) = 0, not a retract, so not in I. A = 0: B = B′ = 0. | characterisation holds on all four | bullet replaced, Check added |
| 3.1 new Check, RHom(ℤ_p, ℤ) | dual of T − p on ⊕_ℕ ℤ | (a_n) ↦ (a_(n+1) − p a_n): kernel 0 (finite support forces a = 0), cokernel ℤ[1/p] | RHom = ℤ[1/p][−1], Hom = 0 | none |
| 6.6 coherent-duality Check | A = ℤ, X = ℙ¹; A = ℤ[x₁, x₂, …], X = ℙ¹_A; n = 0 | ℤ Noetherian: H⁰(O) = ℤ ↔ H¹(O(−2)) = ℤ. Non-Noetherian: §2.19 defines no f^!, only the dualizing object O(−2)[1] of §2.20 is compared. n = 0: f^! = id on both sides. | scoped Check agrees with the supplier's regime | Check scoped; Scope and contract lines carry the regime |
| 1.5 locality citation | G = 𝔾_a over 𝔽_p; G trivial | 𝔾_a: U′ the sieve of e after trivialising the torsor, then A.4.9(ii) applies. Trivial G: e = id, nothing to descend. | citation now states what the route uses | citation changed |
| 1.7 heart, weight one | V = D(ℚ), M₁ = ℚ[−1] and ℚ | M₁[1] = ℚ static (in heart); ℚ[1] not static (not in heart) | as worded | Check reworded |
| 1.7 differential direction | the complex ℚ → ℚ; step filtration of 1.6 | M₀ = ℚ, M₁ = ℚ[−1], d₀: ℚ → M₁[1] = ℚ the identity. Opposite direction: Hom(ℚ[−1], ℚ[1]) = Ext² = 0. Filtration boundary gr^n → gr^(n+1)[1] raises the weight. | M_n → M_(n−1)[1] contradicts heart = Ch; M_n → M_(n+1)[1] agrees with 1.6 and DerivedDeRhamCohomology §1.18 | target corrected, Check added |
| Downstream consumers | RationalAnalyticPrismatization plan at b0e8a50; HigherHidaAndColemanTheory design | 18 AnalyticStacks gaps: `perfect-complexes-fredholm-stacks` → §4.5 present, `hypercover-inversion` absent. HigherHida: AnalyticStacks named 0 times. | bullets now match the consumers | slug fixed, bullet deleted |

## For the maintainer

- No Lean name changed and no declaration was added or removed.
- The 1.7 differential direction is now d_n: M_n → M_(n+1)[1]. RationalAnalyticPrismatization (`formal-line-shearing`) consumes 1.7 and should use this convention.
- Source issue: ALRS Remark 2.9.2 (ALRS line 1902) writes d_n: M_n → M_(n−1)[1] together with the connectivity condition on ⊕ M_n[n] (line 1904) and heart = chain complexes (line 1906). These three are inconsistent (see F05). One of the direction and the shear sign is a slip.
- `design/plan.json` line 2977 still names HigherHidaAndColemanTheory as a consumer. Only the plan's `gaps` list may be edited in this round.
- Ownership: the repairs add no new cross-roadmap object. Coherent duality was already imported from SchemeAndStackFoundations §§2.19–2.20, and only its regime was added. Ownership against the open pull requests was not re-swept for untouched text. The brief's sibling checkouts were not opened, because no repair introduced a construction another roadmap could own.
- No source text was missing, and `needs-references.toml` was not written.
- No suspicious instructions were found in the review text.
