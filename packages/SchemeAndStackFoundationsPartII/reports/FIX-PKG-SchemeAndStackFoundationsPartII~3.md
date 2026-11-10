# FIX-PKG-SchemeAndStackFoundationsPartII~3

Repair round for the six findings of `REV-PKG-SchemeAndStackFoundationsPartII~2` on `packages/SchemeAndStackFoundationsPartII`. Files changed: `README.md`, `Suggested.lean` (docstrings and one section comment only), `sources.toml`, and `design/plan.json` (its top-level `gaps` list only). `metadata.toml` is unchanged.

## REV-PKG-SchemeAndStackFoundationsPartII~2/R01 (P2) — applied

Old → new: deleted §§1.1–1.2, 3.5, 3.7–3.8, 3.10–3.12, 4.1, 5.4–5.5, 6.2–6.4, 7.1–7.2 and `gap:flat-cohomology-continuity`. Added a `From TauCetiRoadmap.PurityForFlatCohomology` contract for §§0.2, 0.3, 3.2–3.6, plus a Scope deferral naming §§2.1, 7.10. Every consumer is repointed. Pruned gaps and suppliers used only by deleted routes. Surviving layers renumbered 0–6.

Verified at the PurityForFlatCohomology head (open roadmap, merge order line 221; this package line 257). Each statement matches ours at the same generality:
- §3.2 covers our 3.5, 3.7 and 3.8.
- §3.3 covers 3.10 and 3.11.
- §3.4 covers 5.4 and 5.5.
- §3.5 covers 6.2, 6.3 and 6.4.
- §3.6 covers 7.1 and 7.2.
- §2.1 covers 4.1.
- §7.10 covers 1.2, and its route is our §1.1.
- §0.3 covers the continuity gap: smooth affine and finite locally free groups are finitely presented, and V(I) with I finite has a quasi-compact complement.

Pattern repair: §3.12 (étale-neighbourhood excision for fppf supports) duplicated Purity §0.2's étale excision. For an étale map, an isomorphism of reduced closed subschemes is the same as a scheme isomorphism, since an étale universal homeomorphism is an isomorphism. The henselization case follows from §0.3. §3.12 had no consumer, so it is deleted too.

Purity's head names no gap or supplier edge back to this roadmap; it lists us only as a consumer. Pruned with Layer 1:
- the gaps `integral-skolem-point`, `ample-global-generation`, `brauer-class-injective` and `char-p-etale-dimension` (the last was used only by the deleted §5.4);
- the supplier subsections ClassicalSerreModularity, AlgebraicModuliForArithmeticGeometry, AlgebraicVectorBundles and PrismaticCohomology (its §2.0 was used only by the deleted §§5.5 and 7.1);
- the gerbe-weight convention and its Check, and the `IsAzumaya` row;
- the L08 source.

HeightsRationalPointsAndObstructions keeps only §2.6c `Brauer.affine_comparison`, because §4.2 still uses it.

Kept as genuinely ours, after checking that no open head or main roadmap states them:
- the pro-fppf site;
- animated points and cotangent theory (CS24 §5.1.11–5.1.13);
- flat animated modules and sites;
- the animated henselization;
- the tower corollary 5.2.7;
- Lemmas 5.3.1, 5.3.3, 5.3.4 and 5.4.1;
- all of CS24 §§5.6–5.7.

PrismaticCohomologyPartIII §6.0 uses pro-fppf covers but states neither the site nor any of these lemmas. Purity cites 5.6.9 only to motivate its §0.3.

The Summary, Scope, Conventions (support convention and Brauer sentence), build paragraph, Downstream consumers, Worked examples, the `Suggested.lean` module docstring and the layer Examples were updated. The end theorems are now §§4.5, 5.2, 5.3 and 6.2.

Old → new numbering:

| Old | New |
| --- | --- |
| Layer 0 (§0.1) | Layer 0 (§0.1) |
| §§2.1–2.4 | §§1.1–1.4 |
| §§3.1–3.4, 3.6, 3.9 | §§2.1–2.6 |
| §§5.1–5.3, 6.1 | §§3.1–3.4 |
| §§8.1–8.7 | §§4.1–4.7 |
| §§9.0–9.6 | §§5.0–5.6 |
| §§10.1–10.2 | §§6.1–6.2 |

No roadmap on main, at an open head, or among the board packages cites a section number of this roadmap. The search was `roadmaps grep SchemeAndStackFoundationsPartII` plus a grep of the board packages.

## REV-PKG-SchemeAndStackFoundationsPartII~2/R02 (P2) — applied

Old → new: three gap paragraphs are replaced by a rewritten `From TauCetiRoadmap.ArcTopologyAndDescent` contract:
- `gap:complete-etale-hyperdescent` → Arc §11.5;
- `gap:complete-valuation-product-basis` → Arc §11.2;
- `gap:integral-perfectoid-hyperdescent` → Arc §12.7.

They are removed from the plan. The §4.4 and §6.2 Needs cite Arc §11.5, and the §6.1 Needs cite Arc §§11.2 and 12.7.

Verified at the Arc head:
- §11.5 states hypercomplete I-complete arc descent of the completed, henselized and both punctured torsion functors.
- §12.7 states the A, A♭ and A_inf equivalences for perfectoid arc hypercovers.
- §11.2 states "no nonsplit étale covers" on quasi-compact opens. The gap asked for étale-acyclicity. This follows because Γ(U,−) is exact when every étale cover of U splits, so sections of a quotient sheaf lift. The contract states this deduction.

## REV-PKG-SchemeAndStackFoundationsPartII~2/R03 (P2) — applied differently

Old → new: `gap:noetherian-completion-flat` is deleted from the README and the plan. The Mathlib row "faithful flatness is not stated at the pin" → "Flatness of the adic completion of a Noetherian ring, used in §5.1."

The gap's only consumer, §6.4 (CS24 Corollary 5.4.5), is now imported from PurityForFlatCohomology §3.5 (R01). So `AdicCompletion.faithfullyFlat_of_isLocalRing` (TauCeti `RingTheory/AdicCompletion/Flat.lean:63`) and `AdicCompletion.quotientMapPowAlgEquiv` (`RingTheory/AdicCompletion/Algebra.lean:59`) have no consumer here. They were verified by `#check` but are not added to the table.

## REV-PKG-SchemeAndStackFoundationsPartII~2/R04 (P1) — applied

Old → new: `TauCeti.AlgHom.mapValue` → `AlgHom.mapValue` at both places in §5.0 (formerly §9.0: the prose and the Needs) and in the Layer 5 Dependencies. These are the three occurrences the review cites. No `TauCeti.AlgHom` remains.

`#check @AlgHom.mapValue` elaborates at the pin (`FunctorOfPoints.lean:143`, root `namespace AlgHom` at line 64).

## REV-PKG-SchemeAndStackFoundationsPartII~2/R05 (P1) — applied

Old → new: "SchemeAndStackFoundations §0.13 `henselization_noetherian`" in the supplier paragraph, `gap:henselized-formal-fibres`, the §5.2 Needs and the Layer 5 Dependencies → Tau Ceti `TauCeti.Henselization.isNoetherianRing` (Noetherian.lean:72), `TauCeti.Henselization.faithfullyFlat_adicCompletion` (:62) and `TauCeti.Henselization.completionEquiv` (Quotient.lean:155). These are three new Tau Ceti table rows. The gap keeps only regularity of the completion map, and its plan `needs` is updated.

Verified: SchemeAndStackFoundations §0.13 on main has no such name. Its Scope (line 175) lists these Tau Ceti names. All three `#check` at the pin; the first two carry `[IsNoetherianRing R]`.

## REV-PKG-SchemeAndStackFoundationsPartII~2/R06 (P3) — applied

Old → new: `HenselianRing` locator `Mathlib/RingTheory/Henselian.lean:94` → `:81`.

Verified at the pin: `class HenselianRing` is at line 81 (fields `jac`, `is_henselian`), and `HenselianLocalRing` is at line 95.

## Checks run

**Elaboration.**
- Command: `lake env lean` on `packages/SchemeAndStackFoundationsPartII/Suggested.lean`, run from the content checkout.
- Result: exit 0, about 5 s.
- Warnings: exactly two, both `declaration uses sorry`, at lines 97 and 125 (`flatCohomology_henselian_invariance`, `flatCohomology_algebraization`).
- No `TauCeti.*` build was needed: all imported object files were present.

**Binder check.**
- Method: a scratch copy of the file with `#check @` for all six declarations, plus `AlgHom.mapValue`, `AlgHom.convCommGroupOfSemiring`, `HenselianRing`, `AdicCompletion.flat_of_isNoetherian`, the three `TauCeti.Henselization` names, `AdicCompletion.faithfullyFlat_of_isLocalRing` and `AdicCompletion.quotientMapPowAlgEquiv`. The four extra Tau Ceti modules were imported; their `.olean` files were present.
- Result: elaborated once, exit 0.
- All six elaborated types are identical to those in the round's `signatures.md`; no binder was lost and no signature changed.
- The only Lean changes are docstrings: README §9.2/§9.3 → §5.2/§5.3, the not-statable list now names §4.5 and §6.2, and the Layer comment is now "Layer 5".

**Dependency check.**

```
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the final README:
- Cross-roadmap leads: one, `PerfectoidQuotientsPartII §Q7.1`. This is a board package at merge order line 220, before this one, and its Layer Q7 has §Q7.1; the resolver sees only main and open pull requests.
- Lean names found nowhere: none (8 before this round).

**Gap consistency (script).**
- The 19 README `What … must provide (gap:…)` paragraphs equal the 19 plan `gaps` entries in slug, supplier, section and `needs` text.
- Every `gap:` reference is declared, and every declared gap is referenced.
- The plan's other keys are unchanged.

**Policy greps.** None of these occur in the README: LaTeX delimiters, `#NNN`, machine paths, "removed", "current", "so far", "round", "PR", "optional", "deferred". Every backticked roadmap-own name occurs in `Suggested.lean`.

**Cross-references.** A script listed every own-section reference (§x.y with no supplier name in its clause) with its following words, and compared each against the new section titles. All match.

No gate failures were listed in the brief.

## Adversarial pass on changed and added statements

| Statement | Instances | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| Purity §3.2 as used in §§2.5, 2.6, 4.5 | A=k⊕k[1], G=G_a, Z=∅; étale lift of 𝔽_(p²) over 𝔽_p⊕𝔽_p[1] | RΓ_∅=fib(id)=0; τ≤nA=A for n≥1, so Rlim has H^(−1)=k and H⁰=k; the lift has π₀=π₁=𝔽_(p²) | Matches our deleted §§3.5, 3.7, 3.8 | Cited |
| Purity §3.3 as used in §§4.6, 5.5, 6.2 | μ_p, R=𝔽_p[ε]/ε²→𝔽_p | R^×/R^×p≅1+ε𝔽_p≅𝔽_p→0; Pic=Br=0 gives H²=0 on both sides | Surjective at i=1, bijective at i=2: the finite locally free ranges | Cited |
| Purity §3.4 as used in §4.4 | ℤ_p, μ_p with p odd; 𝔽_p(s) | ℤ_p: H¹=ℤ/p, H²=H³=0, residue perfect. 𝔽_p(s): H²=Br[p]≠0, only i≥3 vanishes | Both bounds discriminate | Cited |
| Purity §3.5 as used in §§5.5, 5.6, 6.2 and Worked example 2 | ℤ→ℤ_p with I=(p); ℤ/p²→𝔽_p; I=(1) | 𝔽_p⊗^Lℤ_p=𝔽_p, so the condition holds; Tor₁^(ℤ/p²)(𝔽_p,𝔽_p)=𝔽_p≠0, so it fails; supports at I=(1) are 0=0 | Example 2's reworded claim is correct | Cited, example reworded |
| Purity §3.6 as used in §§4.4, 6.2 | A→A×A; A=0 | Split Čech nerve totalizes to RΓ(A,G); 0=0 | — | Cited |
| Purity §0.3 as used in §§3.1, 5.2, 5.3, 6.2 | colim over finite separable k′/k to k^s, μ_n with n invertible; G_m=Spec R[x,x⁻¹] | colim k′^×/k′^×n=0=H¹(k^s,μ_n); G_m and finite locally free G are finitely presented | Hypotheses covered | Gap deleted |
| Purity §0.2 étale excision vs our deleted §3.12 | 𝔽_p[t]→𝔽_(p²)[t] with J=(t); ℤ→ℤ[1/(1+p)] with J=(p) | First: reduced fibres 𝔽_p≠𝔽_(p²), so excluded in both formulations. Second: residue 𝔽_p→𝔽_p, iso, so included | Same class of maps | §3.12 deleted |
| Arc §11.2 ⇒ étale-acyclic | Single rank-one aic V, U=D(t)=Spec Frac V; empty product | Frac V is algebraically closed, so covers split and H^(>0)=0; empty product gives the zero ring with nothing to check | Deduction holds | Contract states it |
| Arc §11.5 as used in §§4.4, 6.2 | I=0 | R̂_I=R^h_I=R, punctured spectra empty: ordinary torsion étale functor and the zero functor | Matches the deleted gap | Cited |
| Arc §12.7 as used in §6.1 | Identity hypercover of 𝔽_p | A=𝔽_p, A♭=𝔽_p, A_inf=W(𝔽_p)=ℤ_p on both sides | Matches the deleted gap | Cited |
| `TauCeti.Henselization.*` rows (R05) | C=ℤ_(p), I=(p); I=0; R=k[x₁,x₂,…], I=0 | ℤ_(p)^h is a DVR, completion ℤ_p, faithfully flat since p is not a unit in ℤ_p; I=0 gives algebra≅R, completion R; the non-Noetherian R gives a non-Noetherian henselization, so the hypothesis is needed | `completionEquiv` has no Noetherian hypothesis; the two instances do | Rows added |
| `HenselianRing` row (R06) | (ℤ,0); (ℤ,2ℤ) | (ℤ,0): 0⊂Jac and roots mod 0 are roots, so it is a henselian pair although ℤ is not local. (ℤ,2ℤ): Jac(ℤ)=0, so it is not | Line 81 is the pair class | Re-lined |
| §2.6, restated hypotheses and route | A_n=τ≤nA; constant tower; A=0; negative control A_n=π₀A=k for A=k⊕k[1] | First three: H^(−1)=k on both sides; RΓ(A,G)=RΓ(A,G); 0=0. Negative control: τ≤1A=A≠k=τ≤1k breaks the hypothesis, and the conclusion would fail (H^(−1): k vs 0) | Route checked against CS24 lines 2349–2352: a double limit plus τ≤mA_n≃τ≤mA for n≥m | Route rewritten, Needs pruned |
| Layer 2 Examples (new) | A=k⊕k[1] | π₁A⊗k=k≠0=π₁k, so k is not flat; A^h_(0)=A; tower formula gives H^(−1)=H⁰=k | Agrees with §§2.1, 2.5, 2.6 Checks | New text |
| Layer 3 Examples (new) | ℤ→ℤ_p at p; A=ℤ; algebraically closed field | ℤ_p∩ℤ[1/p]=ℤ and ℤ_p+ℤ[1/p]=ℚ_p; π₁(ℤ/^Lp^n)=0, completed π₀=ℤ_p, defect 0; Nullstellensatz section | Agrees with §§3.1–3.3 Checks | New text |
| Conventions: Brauer sentence | Spec ℝ (affine); P¹_k (ample) | Br_Az=ℤ/2=Br′; Br(P¹_k)=Br(k) | Owners are HeightsRationalPointsAndObstructions §2.6c and Purity §7.10 | Reworded |
| `gap:henselized-formal-fibres` | ℤ[x], I=(p) | `completionEquiv` identifies the completion of ℤ[x]^h with the p-adic completion of ℤ[x]; excellence of ℤ[x] gives regularity (SP 0AH2/0AH3) | Gap now asks only for regularity | Text and plan updated |
| `gap:animated-flat-cohomology` (trimmed) | G_a, A=k⊕k[1] | τ≤0RΓ(A,G_a)=A=G_a(A) | Evaluation on opens is now Purity §3.2 | Clause dropped, plan updated |
| §6.2 Needs | Route step "nilpotent approximation" | Uses CS24 Cor. 5.2.10, which is Purity §3.3 | Was missing before | Purity §3.3 added |

## Ownership

Searched by object with `roadmaps grep` over main and the 439 indexed open heads, and in the board packages:
- CS24 Corollaries 5.2.7, 5.6.9–5.6.13, Theorem 5.6.6, Lemmas 5.3.1, 5.3.3, 5.3.4, 5.4.1, 5.6.2–5.6.5, 5.7.1, Theorem 5.7.2, Theorem 5.1.13, and "pro-fppf site": no other roadmap states any of them. PurityForFlatCohomology cites 5.6.9 only as motivation for its §0.3.
- "henselian invariance / algebraization … flat cohomology": no match.

The heads of PurityForFlatCohomology, PrismaticCohomologyPartIII, ArcTopologyAndDescent and HeightsRationalPointsAndObstructions were read at the cited sections. This roadmap therefore owns its remaining layers.

## For the maintainer

- **New supplier.** PurityForFlatCohomology (an open roadmap, merge order line 221) is now cited by section: §§0.2, 0.3, 3.2–3.6 in the contract, and §§2.1, 7.10 in the Scope.
- **Dropped suppliers.** ClassicalSerreModularity (and its `gap:integral-skolem-point`), AlgebraicModuliForArithmeticGeometry, AlgebraicVectorBundles and PrismaticCohomology are no longer suppliers.
- **Gaps.**
  - ArcTopologyAndDescent no longer receives any gap.
  - SchemeAndStackFoundations loses five gaps: `flat-cohomology-continuity`, `char-p-etale-dimension`, `noetherian-completion-flat`, `brauer-class-injective` and `ample-global-generation`.
  - In all, 9 of 28 gaps are removed.
- **Purity's descriptive prose.** At its head, PurityForFlatCohomology's ownership list describes this roadmap's "Layer 1 Brauer comparison" and its "animated point and support interfaces, finite-ideal excision and fpqc hyperdescent" as statements this roadmap is to import. This roadmap now imports exactly those (Scope; Purity contract). Its "Layer 1" is now the animated-point layer. That sentence in Purity is descriptive, not a citation consumed by Purity, so nothing breaks.
- **Stale board copy.** The board copy `packages/PurityForFlatCohomology/README.md` is an older version than the PR head; for example, the Brauer comparison is §7.11 there and §7.10 at the head. All citations here use the head numbering.
- **Plan nodes.** `design/plan.json` nodes still describe the deleted targets: only its `gaps` list may be edited in this job. `sources.toml` `cited_for` entries for those nodes and gaps were removed, along with the now-uncited L08 entry.
- **Renumbering.** Sections were renumbered (table under R01). No external citation of the old numbers exists. `Suggested.lean` declaration names are unchanged.
- **Source issues.** Carried over from the review, unchanged: CS24 §5.2.1 (line 2212) and Example 5.6.7 (line 3166) misprints. Nothing here depends on them.
