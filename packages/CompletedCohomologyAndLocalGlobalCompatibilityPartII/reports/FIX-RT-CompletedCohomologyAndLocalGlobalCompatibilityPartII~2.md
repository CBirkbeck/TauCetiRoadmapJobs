# Repair report: red-team round 2 of CompletedCohomologyAndLocalGlobalCompatibilityPartII

Files changed: `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`, `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/design/plan.json` (top-level `gaps` list only), `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/sources.toml`. `Suggested.lean` and `metadata.toml` are unchanged.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2a/F01 (P2) — applied

The finding holds. PadicHodgeTheory §3.2 (`HT(χ_p)=+1`, with the §3.6 criterion `ψ(Art_arith u)=∏τ(u)^{−h_τ}`) and LocalGaloisDeformationRings Conventions (`HT(ε)=+1`) both use the opposite sign. Change: the Conventions now give the dictionary k ↦ `(−k_{σ,d}>⋯>−k_{σ,1})`, with characters of weight `−n_σ` here and `n_σ` there. There is a new Check (k=(1,0) ↔ {0,−1}; misreading gives det), and both supplier contracts now point to the dictionary.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2a/F02 (P1) — applied differently

The finding holds: `roadmaps grep` (main and the 437 open heads) finds no owner of DPS Theorem 7.4 or Corollary 7.6. §3.4 now states (a), density of algebraic functions in LA(U,L), and (b), algebraic matrix coefficients, each with a route and four new Checks. The repair differs from the suggestion in three ways:
- It cites ReductiveGroups §10D (algebraic Peter–Weyl). The suggested §10B does not contain that decomposition.
- It drops DPS's Zariski-density hypothesis, which their density proof never uses.
- It drops injectivity, which would need an unowned Zariski-density input.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2a/F03 (P2) — applied

The finding holds: the clause is EP Lemma 2.7 (EP lines 320–324), and it follows in one line from the kernel clause (EP Lemma 2.2). The clause is deleted from gap:capture-formalism in the README and in `plan.json`; the gap's locator is now Lemmas 2.2–2.5, 2.8–2.9. §3.1 now states the endomorphism result as its own, cites EP Lemma 2.7, and adds a non-captured negative Check (`O⊕O/ϖ`).

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2a/F04 (P3) — applied

In `plan.json`, `(Spf R□_{ρ̄})^rig` → `(Spf R□_ρ̄)^rig`. A string comparison of all 17 gaps (supplier, section, needs, detail) between the README contract sentences and `plan.json` now shows 0 differences.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2a/F05 (P3) — applied

The finding holds: EP Theorem 6.3 is at EP lines 1257–1267, page marker 31, so p. 366; Theorem 6.12 (EP lines 1382–1384) is the rigid closure statement. In §4.1, the locator "EP Theorem 6.12 … imported through the parent" is now "EP Theorem 6.3, p. 366, EP lines 1257–1267, the parent §5.3(1)". The stray 6.12 sentence is removed and the EP References entry is updated. The suggested "both through §5.3(1)" was not used, because the parent's §5.3(1) cites 6.3 only.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2b/F01 (P2) — applied

The finding holds. The parent §5.1 at its open head defines `C_ξ(O)` with "compact central character ξ(c)=x_Z(c)". The transposition of CEGGPS §4.22 (lines 2759–2765) and BIP Lemma 6.6 (lines 2409–2410) give `x_Z⁻¹`. Changes:
- New gap:fixed-centre-specialisation at parent §5.1, in the README and in `plan.json`. It states the transposed Λ_Z action and its agreement with the action through `R□→R∞`, the action `x_Z⁻¹` on the specialisation and `x_Z` on its dual, and projectivity.
- §2.2 now consumes this gap; it is added to §2.2's *Needs* and to the Layer 2 Dependencies.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2b/F02 (P3) — applied

The finding holds: EP §2.1 works with any profinite K that has an open pro-p subgroup (EP line 261), and EP Lemma 2.8 uses the product decomposition at that generality. gap:projective-products (README and `plan.json`) now covers "a profinite group H with an open pro-p subgroup", and its locator adds EP §2.1 (line 261). Witness: for `H=∏_ℕℤ_p`, O[[H]] is local and the projectives are products of copies of it.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2b/F03 (P3) — applied differently

The finding holds (A=O[[x]]/(x²)). The Conventions now:
- define density in the closed-set form (IYE Definition 5.8) and record the function form (BIPD p. 1);
- prove function ⇒ closed set on quasi-Stein spaces (Theorem A, AdicSpacesPartIII §R3.4), with the converse only on reduced spaces;
- note that §5.2 uses neither implication.

There is a negative-control Check. The suggestion's claim that "(Spf R□)^rig is reduced since R□ is" was not made: it needs an excellence argument that no supplier owns.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2b/F04 (P3) — applied

The finding holds: the six-indicator statement holds for every profinite group and tests nothing about matrix coefficients. Change: the PGL₂(ℤ₂) Check is replaced by the suggested 𝔾_m Check (H=Z_H=ℤ_5^×, δ(z)=z, T=δ). On Π=Cδ the evaluation map is an isomorphism of lines; on Π=L (not a summand) Hom=0 and the image is 0, so the direct-summand hypothesis is needed. Recomputed: g·(h↦h⁻¹)=g·h⁻¹.

## Checks run

- **Elaboration.** `lake env lean packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/Suggested.lean`, run from the content checkout: exit 0, no messages, 19 s. No `TauCeti.*` import, so no build was needed.
- **`#check` comparison.** `Suggested.lean` declares nothing, so there is no elaborated type to compare. I elaborated one scratch file with `#check @` for the three Mathlib names this round adds and two existing ones. The pinned types match the README descriptions:
  - `Algebra.FormallySmooth.iff_split_injection`: needs `[Algebra.FormallySmooth R P]`, a surjective `algebraMap P A`, and gives the split-injection iff.
  - `HasStrictFDerivAt.toOpenPartialHomeomorph`: needs `[CompleteSpace E]` and a strict derivative that is a continuous linear equivalence.
  - `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`: needs `a ∈ f.source`, `HasFPowerSeriesAt f p a` and `p 1 = i`.
  - `Module.annihilator_eq_bot` and `PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure`: unchanged.
- **Dependency check output:**

```text
depcheck: 208 roadmaps, 1907 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. The new suppliers cited (PadicFunctionalAnalysis §§4.3–4.4, ReductiveGroups §10D, AdicSpacesPartIII §R3.4) are on main.
- **`roadmaps resolve`:** cross-roadmap citations found nowhere: none; Lean names found nowhere: none. I also checked each new section id by hand on main or at the open head:
  - PadicFunctionalAnalysis §4.3 "Stages, restriction and the algebraic union" and §4.4 "Amice's analytic basis".
  - ReductiveGroups 10D "Algebraic Peter–Weyl and polynomial monoid actions".
  - AdicSpacesPartIII §R3.4 "quasi-Stein spaces", with `quasiStein_global_generation`, Kiehl Satz 2.4.
  - PadicLocalLanglandsForGL2Qp §0.1, at its open head: LA(X,L) with gluing, finite products and the analytic tensor comparison.
  - PadicHodgeTheory §3.2 (HT sign line) and LocalGaloisDeformationRings Conventions line 38, both at their open heads.
  - Parent §§5.1 and 5.3, at its open head.
- **Gate failures:** the worker's check reported `tex=3`: TeX-style subscript and superscript braces outside code spans in Layer 1's density statement and its proof sketch. I put the three expressions in code spans, with no change to the mathematics: `Γ(X,O_X)⊗_{ℚ_p}L` (statements (a)–(b)), and `p^{−m}ℤ_p^n` and `p^{−h}` (the proof of (a)). A rescan of the README for `_{`, `^{` and the TeX macros outside code finds nothing. `Suggested.lean` is unchanged, so the elaboration result above stands.

## Adversarial pass on every new or changed statement

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: HT dictionary | d=2, F=ℚ_p, k=(1,0); ε; k=(2,0); (1,1) | (1,0)↦supplier {0,−1}; misread (0,−1)↦a=(−1,−1), det weight (1,1); ε(Art_geom u)=u, n=1: −1 here, ε(Art_arith u)=u⁻¹ gives h=1 there; (2,0)↦(0,−2), regular; (1,1)↦(−1,−1), non-regular | sound | added, with Check |
| Conventions: two density forms | A=O[[x]]/(x²); A=O[[x]] with S={p^n}; S=∅ | A[1/p]=L[x]/(x²), one point, x vanishes, x≠0; on the disc a function zero at all p^n is zero on |x|≤1/p (infinitely many zeros), hence zero; ∅ dense iff X=∅ in both forms when reduced | equivalence only on reduced spaces | restated, Check added |
| gap:fixed-centre-specialisation | d=1, ℚ_5, x_Z(5)=[2]; x_Z(5)=−1; d=2, ℚ_5, ψ=1, u=2 | compact [2]⁻¹=[3], dual [2]; with x_Z²=1 the two signs agree (sign invisible); δ(2)=2, compact 1/2, dual 2 | parent label gives [2] on the compact side: refuted at x_Z(5)=[2] | new gap |
| §3.1 endomorphism statement | H=1, M=O, {L}, φ=a; M=O⊕O/ϖ; R=ℤ/4, M=ℤ/2 | f∘φ=a·f=0 forces a=0; φ(a,b)=(0,ā)≠0 with f∘φ=0; 2 kills ℤ/2 | needs capture; follows from the kernel clause | stated here, Check added |
| gap:capture-formalism (clause removed) | as above | the kernel clause gives the removed clause in one line | redundant clause removed | locator 2.2–2.5, 2.8–2.9 |
| gap:projective-products (widened) | H=∏_ℕℤ_p; H=ℤ_p×ℤ/2 (p odd); H finite of order prime to p | O[[H]] local, projectives are products of O[[H]]; O[[ℤ_p]]×O[[ℤ_p]] via (1±s)/2, two indecomposables; O[H] split semisimple after enlarging, summands of the regular module | holds at EP §2.1 generality | widened |
| §3.4 (a) | 𝔸¹, U=ℤ_p, 1_{pℤ_p}; p=2; X=𝔸¹⊔Spec ℚ_p(√u); X(ℚ_p)=∅; U=∅; X a point | v_p(binom(p^n,k)p^k)≥n+1, so `x^{(p−1)p^n}−1` has Gauss norm ≤p^(−n−1) on unit balls and `x^{(p−1)p^n}` has p^(−(p−1)p^n) on pℤ_p; p=2: (1+2t)^{2^n}−1 has norm ≤2^(−n−1); image L[x], dense; 0=0; 0=0; L=L | sound without Zariski density | added, three Checks |
| §3.4 (b) | 𝔾_m, ℤ_p^×, z^n; GL₂(ℤ_p), det^n only; 𝐆=1 | Hom is the line h^(−n); h^n gives g^(−n)≠g^n (g=2, n=1: 1/2≠2 in ℚ_p, every p); functions of det are right-SL₂(ℤ_p)-invariant, h₁₁ is 0 at (0,1;−1,0) and 1 at the identity; image L | all irreducibles needed, inversion pinned | added, two Checks |
| §3.4 fixed-centre density | 𝔾_m/ℚ_5, Z_H=H, δ(z)=z, T=δ; Π=Cδ; Π=L; T=0 | Hom_H(δ,δ)=L, isomorphism; Hom_H(δ,1)=0 as δ(2)=2≠1; T=0 gives image 0 (excluded by T≠0) | summand and T≠0 hypotheses needed | Check replaced |
| §4.1 locator | EP page markers | Theorem 6.3 at marker 31 ⇒ p. 366; Theorem 6.12 at marker 34 ⇒ p. 369 | 6.3 is the statement used | locator fixed |
| §2.2 Check d=1 | x_Z(5)=[2] | [2][3]=[6]=[1] in ℤ_5 | consistent with the new gap | none |

Context: the README targets are prose only; `Suggested.lean` has no declarations, so no `variable` scoping applies.

## Ownership

- §3.4 (a) and (b) are owned here. Searches for "Amice", "polynomial density", "algebraic functions … dense", "Dospinescu" and "algebraic vectors … dense" over main and the 437 open heads found:
  - one-variable polynomial density per stage, PadicFunctionalAnalysis §4.3 (cited);
  - LA(X,L) without algebraic density, PadicLocalLanglandsForGL2Qp §0.1 (cited);
  - nothing in several variables or on smooth schemes.
- The fixed-centre specialisation belongs with the parent's M∞ (§5.1), so it is a supplier gap rather than a target here.
- No `Suggested.lean` declaration exists, so no fully qualified names can collide.

## For the maintainer

- **Parent §5.1 (CompletedCohomologyAndLocalGlobalCompatibility).** The new gap:fixed-centre-specialisation asks the parent to state the central sign as `x_Z⁻¹` on the compact specialisation. Its current §5.1(3) and "Central action" paragraph carry the CEGGPS labels (ξ=x_Z on the compact side), which the transposition contradicts at x_Z(5)=[2].
- **PadicMeasuresIwasawaAlgebras Layer 1, §1.7.** gap:projective-products now asks for every profinite H with an open pro-p subgroup, no longer only compact p-adic analytic H.
- **gap:capture-formalism** no longer asks the parent for EP Lemma 2.7; §3.1 proves it.
- **`plan.json` outside the `gaps` list** (the layer records) still carries the old §4.1 "where" string with EP Theorem 6.12 and the old §3.4 inputs. This job may edit only the `gaps` list.
- **Citing roadmaps.** No other roadmap cites this one (`roadmaps overlaps`: none), and no section id changed. §3.4 kept its number; the new statements sit inside it.
- **Needs references.** None; every text used is in the cache.
