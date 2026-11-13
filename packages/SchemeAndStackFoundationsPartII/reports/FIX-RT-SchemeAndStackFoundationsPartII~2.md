# FIX-RT-SchemeAndStackFoundationsPartII~2

Repair of red-team round 2 (passes a and b) of the SchemeAndStackFoundationsPartII package. I checked all eleven findings against the cached sources (CS24, SP), the sibling roadmaps (PrismaticCohomologyPartIII and PerfectoidQuotients at their open heads, PurityForFlatCohomology at its open head, PerfectoidQuotientsPartII on the board, SchemeAndStackFoundations and EnhancedDerivedSheaves on main) and the pins. All eleven hold.

The decisive finding is 2b/F01. It moves the CS24 §§4.1.5–5.4.1 foundations (old Layers 0–3) out of this roadmap. Several smaller findings were about those layers; they are settled by that move and are marked "applied differently". The surviving layers keep their content and are renumbered: old Layer 4 → Layer 1, old 5 → 2, old 6 → 3, so §4.k → §1.k, §5.k → §2.k, §6.k → §3.k. No roadmap on main, open or on the board cites a section id of this roadmap (checked with `roadmaps grep 'SchemeAndStackFoundationsPartII'`), so the renumbering breaks no citation.

## RT-SchemeAndStackFoundationsPartII~2b/F01 (P2) — applied

The witness holds. CS24 proves the suppliers' imported theorems from targets this roadmap owned:
- Theorem 5.3.5 (`pContinuity`) uses Lemma 5.3.1 (line 2478), Lemma 5.3.4 (2498), Lemma 5.3.3 (2502), Theorem 5.1.13 (2506) and Corollary 5.2.7 (2449).
- Lemma 5.4.2 (`excision`) uses Lemma 5.3.3 (2640, 2775), Lemma 5.4.1 (2790, 2797) and (5.2.7.1) (2711).
- Theorem 5.2.8 (gap:cohomology-deformation) uses Theorem 5.1.13 (2360).
- Lemma 5.4.3 (PurityForFlatCohomology §3.5) uses Lemma 5.2.2 (2815).
- Theorem 4.1.8 (`perfectDieudonneComparison`) uses Lemma 4.1.6 (1564–1584).

PurityForFlatCohomology at its head (Layer 3 preamble) already credits CS24 §§5.2.1–5.2.3 to PrismaticCohomologyPartIII §6.0. That roadmap's route "constructs flat cohomology on animated rings by sheafification" but names no owner for these inputs. PrismaticCohomologyPartIII (ORDER line 85) is earlier than this roadmap (line 257). So keeping the targets here meant either a second owner or a hidden cycle.

What changed: old Layers 0–3 are deleted. Their consumed content became PrismaticCohomologyPartIII §6.0 contracts (README and plan): gap:flat-animated-modules, animated-henselization, tower-accuracy, split-etale-refinements, completed-pi0-defect. gap:animated-flat-cohomology gained the sites and the point functor. §1.3 cites gap:flat-group-cotangent-amplitude (trimmed). Layers 4–6 are renumbered 1–3, and Scope, Summary and How to read are rewritten.

Five gaps lost their only consumer and are removed: animation-composition, general-square-zero, animated-tensor-spectral-sequence, perfection-covers and torsor-limit-descent. Downstream and the PrismaticCohomologyPartIII contract sentence are rewritten to match.

One correction to the suggested repair. The reviewer would keep Lemma 5.3.1's fppf form. The only consumer, old §4.5 (now §1.5), lifts the refinement to animated rings through the étale equivalence (CS24 line 3152, Proposition 5.2.4), and an ind-fppf algebra has no such lift. The contract is therefore the ind-étale variant (CS24 Remark 5.3.2), closed under quotients (SP 04D1).

## RT-SchemeAndStackFoundationsPartII~2a/F01, RT-SchemeAndStackFoundationsPartII~2b/F02 (P2) — applied differently

Both witnesses hold. At CS24 lines 3379–3389 only A/^L(a)→A′/^L(a) is faithfully flat, and A→A′ need not be flat. 2b's instance confirms it: A=𝔽_p[t^(1/p^∞)], A′=A×𝔽_p.

What changed: gap:perfection-covers is deleted; its only consumer, §3.2 (old §6.2), owns the step. The §3.2 route now proves it. Frobenius copy n of A′ has structure a↦s(a^(p^n)); its reduction is faithfully flat by nilpotent detection (gap:flat-animated-modules), and faithful flatness passes to the filtered colimit of these algebras. 2b's instance is a new §3.2 Check.

Two corrections to the suggested repairs:
- 2b says "a filtered colimit of faithfully flat animated modules is faithfully flat". That is false for modules: the colimit of ℤ along zero maps is 0. The route says "algebras along algebra maps".
- 2a's indexing is backwards. Frobenius copy n reduces to A′/^L(a^(p^n)), not A′/^L(a^(1/p^n)).

2a's cover form for §0.1 is not added: §0.1 is gone (2b/F01), and Lemma 4.1.6 belongs to PrismaticCohomologyPartIII's `perfectDieudonneComparison`.

## RT-SchemeAndStackFoundationsPartII~2a/F02 (P2) — applied

The witness holds. CS24 lines 3058–3073 prove the exact sequence (5.6.4.3) from torsor effectivity; no Mittag–Leffler condition appears.

What changed: in gap:complete-torsor-effectivity (README and plan), "with the H⁰ Mittag–Leffler comparison of CS24 Lemma 5.6.4" became the exact sequence 0→lim¹_n G(C/a^n)→H¹(C,G)→lim_n H¹(C/a^n,G)→0 for commutative G. Its first map is described through trivial torsors with transition isomorphisms. The locator is "CS24 Lemma 5.6.4 and its proof, pp.72–73".

## RT-SchemeAndStackFoundationsPartII~2b/F03 (P2) — applied

The witness holds:
- The limit arguments at CS24 lines 2389–2390 and 2470–2471 concern cohomology of commutative G. PurityForFlatCohomology §0.3 (colim H^i_fppf) covers them.
- Line 2417 descends an fppf algebra, not a torsor.
- No noncommutative group is used with limits; §1.2's PGL_n step has none.

What changed: gap:torsor-limit-descent is deleted from the contracts, the §2.2, §2.3 and §3.2 *Needs*, the Dependencies and the plan. §2.2's route now says that cohomology with commutative coefficients commutes with the colimit (PurityForFlatCohomology §0.3, already listed). The suggested §3.1 route edit is moot: old §3.1 is a supplier contract.

## RT-SchemeAndStackFoundationsPartII~2a/F03 (P3) — applied differently

The witness holds for the old §3.1: R₁→R₁^h is not faithfully flat when I⊄Jac(R₁). That target is now gap:split-etale-refinements (2b/F01). Its only consumer here, §1.5, needs no henselian variant, so the contract asks for none, and the henselized step no longer occurs in this roadmap.

What changed: no §3.1 *Needs* line exists to amend.

## RT-SchemeAndStackFoundationsPartII~2a/F04 (P3) — applied

The witness holds. The Theorem 5.6.6 proof (CS24 lines 3149–3160) uses fpqc hyperdescent (Theorem 5.5.2), Lemma 5.6.2 and SP 09XI/04D1.

What changed: §1.5 *Needs* gains PurityForFlatCohomology §3.6, §1.1 and SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`. Its old §3.1/§3.3 items become gap:split-etale-refinements and gap:completed-pi0-defect, and the route explains the splitting.

Same pattern repaired in two more places:
- §1.3 *Needs* gains PurityForFlatCohomology §3.3 (CS24 lines 3007–3010, Corollaries 5.2.9 and 5.2.10).
- §1.4 *Needs* gains §1.1, gap:flat-animated-modules, gap:completed-pi0-defect, `henselian_pair_characterisations`, `henselian_pair_permanence` and PurityForFlatCohomology §3.2 (CS24 lines 3086–3135).

## RT-SchemeAndStackFoundationsPartII~2a/F05 (P3) — applied differently

The witness holds: CS24 lines 2591–2607 end before the p.63 marker at line 2609, so the page is p.62.

What changed: old §3.4 (Lemma 5.4.1) is deleted under 2b/F01. It is an input of PrismaticCohomologyPartIII's `excision` (CS24 lines 2790, 2797) and has no consumer here, so the locator no longer occurs. The References entry "§§5.1–5.7 pp.49–81" is unchanged.

## RT-SchemeAndStackFoundationsPartII~2b/F04 (P3) — applied differently

The witness holds. CS24 line 1542 defines pro-fppf as pro-ppf plus faithful flatness, with no covering condition.

What changed: the definition is deleted with old §0.1 (2b/F01). The README no longer defines pro-fppf. It names the topology only in Scope, as the CS24 §4.1.5 input of PrismaticCohomologyPartIII §6.0. The Worked-examples paragraph on the pro-fppf site is deleted.

## RT-SchemeAndStackFoundationsPartII~2b/F05 (P3) — applied differently

The witness holds: "not syntomic" does not imply "not ind-syntomic", and no argument was given.

What changed: the Check, the stage-class target and its sentence citing PerfectoidQuotientsPartII §Q7.3 are deleted with old §0.1 (2b/F01). Nothing in the README claims that the rank-3 algebra is not ind-syntomic.

## RT-SchemeAndStackFoundationsPartII~2b/F06 (P3) — applied

The witness holds. PerfectoidQuotients §0.6 (open head) has `perfectoid_sharp_ideal_completion`: for an integral perfectoid A and finitely many elements of A♭, completion along their untilts is perfectoid and equals the derived completion. This is CS24 Proposition 2.1.11(e), used at line 3376. For a perfect 𝔽_p-algebra take ϖ=0 and A♭=A, so the completion is again perfect. §0.5 has no consumer.

What changed:
- The supplier line reads "Layer 0 §§0.1, 0.4, 0.6", and §0.6 is described.
- §3.2 *Needs* and the Layer 3 Dependencies gain PerfectoidQuotients Layer 0 §0.6 `perfectoid_sharp_ideal_completion`.
- The route says that completion keeps a perfect 𝔽_p-algebra perfect.

## Checks

**Elaboration.** `lake env lean packages/SchemeAndStackFoundationsPartII/Suggested.lean`, run from the content checkout, gives only:

```text
Suggested.lean:97:8: warning: declaration uses `sorry`
Suggested.lean:125:8: warning: declaration uses `sorry`
```

No `TauCeti.*` module needed building.

**Signatures.** I put `#check @name` for all six declarations in one scratch copy and elaborated it once. The elaborated types match the README statements of §2.0, §2.2 and §2.3 (the renumbered §§5.0, 5.2, 5.3), with no binder lost:
- `flatCohomology` and both theorems carry `HasExt.{w}`.
- `flatCohomology_algebraization` carries `UniformSpace`, `IsUniformAddGroup` and `IsTopologicalRing`.

Only docstrings changed in the Lean file: README §5.2/§5.3 → §2.2/§2.3, §4.5/§6.2 → §1.5/§3.2, and the layer comment "Layer 5" → "Layer 2". No declaration, binder, import or `set_option` changed.

**Dependency check.** The brief's command prints:

```text
depcheck: 208 roadmaps, 1903 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the new README reports one lead, "426: PerfectoidQuotientsPartII §Q7.1: no roadmap PerfectoidQuotientsPartII on main or in an open pull request". This is a false positive: PerfectoidQuotientsPartII is a board package (merge order line 220), and its README line 814 is "### Q7.1 Ind-fppf ring maps", the definition used here. No Lean name is reported missing.

**Mechanical agreement.**
- The README contracts and the plan's `gaps` have the same 20 slugs, with identical supplier, section and needs.
- Every declared gap is cited by at least one *Needs* line or one other contract.
- Every Mathlib/Tau Ceti table row is still used. Removed rows, whose only consumers were old §§0.1, 1.1 and 1.4: `Algebra.FinitePresentation`, `Module.FaithfullyFlat`, `AlgebraicGeometry.Scheme.fppfTopology`, `AlgebraicGeometry.Scheme.fpqcTopology`, `CategoryTheory.MorphismProperty.ind`, `CommRingCat.isFinitelyPresentable_hom`, `ind_iff_exists` and `ind_of_preIndSpreads`.
- Every Dependencies paragraph was recomputed from its layer's *Needs* lines.
- Every local § reference was matched against its heading by script.
- The plan diff touches only the top-level `gaps` list.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| gap:flat-animated-modules | A=0; A=k, M=k[1]; A=k⊕k[1], M=k; ℤ/4→𝔽₂ with M=𝔽₂ and M=ℤ/4; ℤ_(p)→𝔽_p, M=ℚ | zero ring: all flat and faithfully flat; π₁A⊗π₀M=0≠k=π₁M, so not flat; π₁A⊗k=k≠0, so not flat; 𝔽₂⊗^L𝔽₂ has every π_i=𝔽₂ (not flat, matching Tor₁^(ℤ/4)≠0), 𝔽₂⊗ℤ/4=𝔽₂ flat; 𝔽_p⊗^Lℚ=0 although ℚ≠0, excluded since (p) is not nilpotent | holds; nilpotent hypothesis needed |
| gap:animated-henselization | I=0; I=(1); A=ℤ_(p), I=(p); A=𝔽_p⊕𝔽_p[1], I=0 | A^h=A; (π₀A)^h_(1)=0, so A^h=0 and B must be 0; ℤ_(p)^h with π_i=0; π₁=𝔽_p=π₁A⊗𝔽_p | holds |
| gap:tower-accuracy | A_n=τ≤nA; constant tower; A=0; A=k⊕k[1] with A_n=k (excluded) | Postnikov convergence; RΓ(A,G) on both sides; 0; Rlim would be k in degree 0 against H^(−1)(A,G_a)=k, and τ≤1A≠τ≤1k excludes it | holds; accuracy hypothesis needed |
| gap:split-etale-refinements | R=0; R=k algebraically closed; R=𝔽_p; quotient step | R̃=0; R̃=k, covers k^n split; R̃=𝔽̄_p; for J⊂R̃, lift a cover of R̃/J to étale E (SP 04D1), add finitely many R̃_f with f∈J covering the closed complement of the open image of Spec E, take a section and restrict to V(J) | holds |
| gap:completed-pi0-defect | ℤ, a=p; ℤ/p², a=p; a=1; a=0 | π₁=0, ℤ_p; π₁ tower 𝔽_p, ℤ/p², ℤ/p², … with transitions ·p, composites of two are 0, lim¹=0, π₀=ℤ/p²; all 0; A/^L0=A⊕A[1], transitions id⊕0, Rlim=A, kernel 0 | holds |
| gap:complete-torsor-effectivity | ℤ_p, a=p, μ_p (p odd); 𝔽_p[[t]], a=t, α_p; a=1; a=0 | μ_p(ℤ/p^n)=1+p^(n−1)ℤ/p^n with zero transitions, lim¹=0, H¹=ℤ/p=lim(ℤ/p^n)^×/p; α_p(C/t^n)=(t^⌈n/p⌉)/(t^n), images vanish for m≥p(n−1)+1, lim¹=0, H¹=C/C^p=lim, C^p closed; C=0; constant tower, lim¹=0 | holds |
| gap:flat-group-cotangent-amplitude | μ_p/𝔽_p; μ_p/ℤ; G_a; trivial G | [𝔽_p→0 𝔽_p] in degrees −1,0; [ℤ→p ℤ]; R in degree 0; 0 | holds |
| §1.3 route (lim¹ step) | ℤ_p, μ_p | A⟨p^n⟩=0, so the cotangent terms vanish and lim¹ H⁰(ℤ_p/^Lp^n,μ_p)=lim¹ μ_p(ℤ/p^n)=0 | holds |
| §1.5 route (splitting) | a=1; R̃=k for π₀A=k with a=0 | all terms 0; terms k, with no nonsplit étale covers in the term, its completion or its quotients | holds |
| §3.2 perfection step | 2b's A=𝔽_p[t^(1/p^∞)], A′=A×𝔽_p, tuple (t); empty tuple; tuple (1); tuple (0) | A→A′ not flat ((t−1)·1=0 in 𝔽_p over a domain); A/^Lt→A/^Lt×0 faithfully flat; A″=A′; A→A′_n faithfully flat via φ^n; 0→0; A⊕A[1]-flatness of A′⊕A′[1] iff A′ is A-flat | holds |
| §3.2 colimit claim | ℤ along zero maps (modules) against algebras | module colimit 0, not faithfully flat; for algebras, 1∈𝔪·colim would already hold at a finite stage | stated for algebras only |
| PerfectoidQuotients §0.6 for perfect 𝔽_p-algebras | A=𝔽_p[t^(1/p^∞)], J=(t) | ϖ=0 allowed (0^p∣p=0); t-adic completion perfect; no t-torsion, so derived = classical | holds |

## Ownership, sources and notes for the maintainer

- **Ownership of the new contracts.** I searched main and the open heads for each object of the five new PrismaticCohomologyPartIII contracts. Searches (`roadmaps grep --readme-only`): flat animated modules, the animated henselization, CS24 Lemma 5.3.4 and the square-zero completion defect, Lemma 5.3.1 and nonsplit covers, Corollary 5.2.7. No roadmap states them. EnhancedDerivedSheaves on main (E5:animation.4) owns animated modules but no flatness theory. LanglandsParameterStacks §1.7 (ORDER line 81, open head) uses faithful flatness of animated ring maps (flat with faithfully flat π₀) in its statement only; its definition agrees with gap:flat-animated-modules. PrismaticCohomologyPartIII §6.0 is the supplier because its route constructs flat cohomology of animated rings, and its `pContinuity` and `excision` are proved from these inputs.
- **For PrismaticCohomologyPartIII.** It is now asked for five more exports (above). Its route would also need what this package drops: the tensor spectral sequence, general square-zero extensions, animation of composites and the perfection of pro-fppf covers (Lemma 4.1.6). Its routes also use CS24 Proposition 5.2.4 and Theorem 5.2.6, which PurityForFlatCohomology §3.2 (ORDER line 221) claims. That is a supplier-side ordering question between those two roadmaps, which no edit of this package can settle.
- **Plan nodes.** The plan's node list still has nodes for the old Layers 0–3 (FC.0–FC.7). Only the top-level `gaps` may be edited here; the README is the deliverable.
- **Sources.** `sources.toml` cited_for and locators were updated to match:
  - CS24 drops §2.3.3 and adds Remark 5.3.2.
  - SP drops Tags 00QO, 07C3, 05N9 and 02JO, and adds Tag 04D1 (Lemma 10.143.10). 04D1 was read in the cached algebra chapter at its line 18048, which is already recorded as an additional text.
  - "Layer 5 §5.0" became "Layer 2 §2.0".
  - No new source was fetched, and `needs-references.toml` was not written.
- **Names other roadmaps cite.** No Lean name changed. No other roadmap cites a section id of this one, so the renumbering needs no mapping table.
- Nothing in the reviews or fetched texts asked for any action outside the job.
