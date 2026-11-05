# FIX-PKG-AnalyticStacks~4

Findings of REV-PKG-AnalyticStacks~3 (F01–F03; the review's table calls them R01–R03). Every finding was checked against the cached HM and RCSolid extractions. Only `README.md` and `sources.toml` changed. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Verified. HM line 3558 is Lemma 4.5.6, the f_♮ criterion. Target locality is Lemma 4.5.7 (HM line 3569). Source locality is Lemma 4.5.8 (HM line 3572): (i) needs D compatible with small colimits, and (ii) needs limits indexed by the sieve, with f_! preserving them. HM Remark 4.4.11(ii) (HM line 3406) says that primness is usually not local on the source. HM Lemma 4.6.3(ii), (ii′) (HM lines 3745, 3752) carry the same hypotheses for étale and proper maps.

Change, 0.9 Locality bullet: the old unconditional source clause citing 4.5.6–4.5.8 → target locality by 4.5.7. On the source: suave by 4.5.8(i) under small colimits; prim by Corollary 4.7.5(ii) (D stable, g prim, g_*1 descendable). The general prim clause needs the 4.5.8(ii) limit hypothesis (Remark 4.4.11(ii)), and finite prim monomorphism families are the exception (4.4.11(iii)).

0.10 bullet: étale source locality now requires small colimits and truncated maps. Proper source locality now requires that f_! preserve the sieve-indexed limits. This holds for finitely many proper monomorphisms with D stable, because the limit is then finite (HM lines 3409–3415).

Pattern sweep: 1.3's route now says that primness of f descends from f∘g by 0.9's source clause (Corollary 4.7.5(ii)). That is the form RCSolid Proposition 6.4.7 uses (RCSolid lines 4570–4573). No other "local on the source" claim exists in the README. The HM entry in the manifest now also lists Corollary 4.7.5 and Remark 4.4.11.

## F02 (P3) — applied differently

Verified. With U′ = ⟨e⟩, condition (a) of HM Corollary A.4.9(ii) (HM line 6461) is the conclusion itself. The pullback-to-affines clause is HM Theorem 3.4.11(ii) (HM line 2263), not (iii).

Change, 1.5 route: "!-ability and universal !-descent are !-local on the target (3.4.11(iii); A.4.9(ii))" → the following argument:

- e is !-able by 3.4.11(ii), since every pullback to an affine is a torsor P → T.
- Apply A.4.9(ii) to the sieve of all affines over BG. D^! descends along it because D_!(BG) is a colimit over affines (0.13; RCSolid line 4494).
- For each affine T → BG, the torsor P → T is an effective epimorphism for the !-topology. So it gets sections over a !-cover {T_i → T}, and universal descent along ⟨P → T⟩ follows from A.4.9(i).

`*Needs:*` gains 0.13.

Why "differently": the review justifies universal descent along P → T by saying that P → T is ω₁-compact. It argues that "countable presentation descends along faithfully flat maps", which is neither sourced nor standard for algebras. The local-section argument needs only that e is an effective epimorphism. That holds because BG^sheaf → BG is ∞-connective under the cotopological localization of 0.13(1)–(2).

Checks recomputed:
- G trivial: P = T, which has a section.
- 𝔾_a over 𝔽_p: P ×_T P ≅ P × 𝔾_a, which is split.
- 𝔾_m: the summand route of RC26a Lemma 3.1.2 still applies.

All 1.5 Checks stand unchanged.

## F03 (P3) — applied

Verified. 1.2 (README line 375) already states the D versus D^cond comparison of !-equivalences with the same locator (RCSolid lines 4492–4500), and 3.7's `*Needs:*` lists 1.2.

Change in 3.7: "Prove that a map of prestacks … is a !-equivalence for D iff for D^cond (RCSolid Remark 6.4.2 …), and that the realization of the next target is compatible …" → "The comparison of !-equivalences for D and D^cond is 1.2; prove that the realization of 3.8 is compatible with base change along A." No Check of 3.7 used the clause, and no other section restates it.

## Checks run

- **Elaboration:** `lake env lean packages/AnalyticStacks/Suggested.lean`, run from the content checkout. Exit 0 (3.7 s). The only message is `Suggested.lean:102:8: warning: declaration uses sorry`. There is no `TauCeti.*` import, so nothing needed building.
- **`#check` audit:** a scratch copy with `#check @` on all five declarations elaborated once. Their types are identical to `signatures.md` and to README 0.3(1). The file has no `variable` block, and `[Q.Quasicategory]` is in the theorem's own signature. Nothing changed.
- **Dependency gate:** `tauceti-roadmap gate --depcheck packages/AnalyticStacks/README.md --name AnalyticStacks --order merge-order/ORDER.txt --movable` printed:

```
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

  Exit 0. There is no UPWARD, CYCLE or `moved:` line.
- **Gate failures:** none were listed in the brief.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.9 target locality (4.5.7) | f = id with any cover; ℙ¹_ℤ → Spec ℤ with the cover Spec ℤ | id is suave and prim with ω = δ = 1 on every piece; a trivial cover gives a tautology | holds | citation corrected |
| 0.9 suave source clause | finite-set formalism, cover {1} ⊔ {2} → {1, 2} | every map is suave and D is presentable; f∘g suave ⇒ f suave, consistent | holds | hypothesis added |
| 0.9 prim source clause via 4.7.5 | 1.3: ⊔ U_i → ℙ¹_ℤ with U₀, U₁ affine | g affine, so prim with δ = 1; g_*1 = O(U₀) × O(U₁) is descendable by Zariski descent; f∘g affine, so prim ⇒ f prim | holds; D stable, as required | rewritten |
| 0.9 general prim clause | HM Remark 4.4.11(ii)–(iii) | an infinite sieve needs f_! to preserve infinite limits (false in general); a finite sieve is cofinal with P_I, so the limit is finite and exact f_! preserves it | the exception holds only for finite families | added |
| 0.10 étale and proper source clauses | the injection {1} → {1, 2} in the finite-set formalism; the 3.1 example ℤ_■ × ℤ_■ → ℤ_■ | finite proper monomorphism covers give a finite limit; étale with D presentable | holds | hypotheses added |
| 1.5 local-section step | G trivial; 𝔾_a over 𝔽_p; 𝔾_m; T = Spec A | P = T; P ×_T P = P × 𝔾_a with a diagonal section; e*e_*1 = A[T^±1] ⊇ A; for T = Spec A, P = Spec R is split by the counit (index 1 ≤ 2) | holds | route rewritten |
| 1.5 sieve of all affines | X = Spec A (the identity is final); X = BG | for an affine X the sieve contains id, so descent is trivial; for BG, D^!(BG) = lim over affines of D^!(T), dual to the Pr^L colimit of 0.13 | holds | none |
| 3.7 after the edit | A = ℤ^cond; A = 0 | D_A = D^cond; D_0 = 0; the comparison is now only cited from 1.2 | Checks unchanged | clause deleted |

## For the maintainer

- No Lean names changed, so no other roadmap is affected.
- The RationalAnalyticPrismatization contract `suave-prim-calculus` (§§0.8–0.11) now reads the hypothesis-carrying locality clauses. It loses nothing it asked for, since its uses go through 1.3 and 6.4, and those satisfy the hypotheses.
- Ownership: no new object was introduced, so no new ownership search was needed.
- No suspicious text was found in the review.
- The review's two source issues (the ALRS Remark 2.9.2 direction, and HM Lemma 4.5.8(ii) printing "suave" where "prim" is meant) are consistent with the text as repaired. The new 0.9 bullet reads 4.5.8(ii) as being about prim covers.
