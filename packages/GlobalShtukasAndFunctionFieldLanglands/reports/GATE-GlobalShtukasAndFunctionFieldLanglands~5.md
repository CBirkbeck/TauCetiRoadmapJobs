# GATE-GlobalShtukasAndFunctionFieldLanglands~5: answers to human review

Head before: `2379b34`. Head after: `ede1562a` (one commit, README only; `Suggested.lean` unchanged).

## H01 (roed-math) — applied differently

The overlap is real, but §0.7 stays as the general statement, now marked as a variant. AutomorphicSpectralTheory is line 82 of the merge order and this roadmap is line 342, so the earlier roadmap owns the GL_n case and this roadmap cites it. A new remark in §0.7 says that for the constant model GL_n with N = ∅ (ker¹(F,GL_n) trivial by Hilbert 90, K = ∏_v GL_n(O_v)) the equivalence, stabilizers and orbit masses are AutomorphicSpectralTheory §6.22a, and that §0.7 adds smooth models with connected fibres, full levels with nilpotents, the pure-inner-form components and local triviality over every O_v. The ownership is recorded in a new Scope bullet, a new `From TauCetiRoadmap.AutomorphicSpectralTheory` supplier contract, §0.7's *Needs* ("for the comparison on GL_n at N = ∅ only") and the Layer 0 Dependencies.

## H02 (roed-math) — applied

§0.8 used to open "Define ShiftedHN.semistable and ShiftedHN.filtration … define T-semistability …", and its construction ended "Identify Arthur's indicator F^G(g,T)=1 with T-semistability". It now opens by citing AutomorphicSpectralTheory §6.22c (the case θ = 0, where every saturated subbundle is invariant) for both the definition and the F^G identification. It keeps only the canonical T-Harder–Narasimhan filtration (Chau line 806, Theorem 4.1.2; quoted at Yu line 996), which §6.22c does not construct: §6.22c constructs the θ-invariant filtration with ordinary slopes. The API bullets "complete family of rank-r inequalities" and "agree with the adelic truncation indicator" are removed. The Checks now test the filtration, and a non-dominant negative control is added.

## H03 (roed-math) — applied

§0.11 *Adelic orbit masses* is deleted. All three of its claims follow from §6.22a's stabilizer identification and its integration transport Σ_[E] f(E)/|Aut(E)(F_q)| with vol K = 1, taking f = 1 and f(E) = |Aut(E)(F_q)|: the orbit mass 1/|Aut E|, the diagonal-kernel value |Aut E|, and the unweighted count after integration. Its only consumer, §0.13, now cites §6.22a in its proof and in its *Needs*. The Layer 0 rank-one example now points to the Picard-stack section. §0.15 *The Picard stack and rank-one Lang fibres* moves unchanged into slot §0.11, and its links in §2.4 and §3.3 are updated. No roadmap on main or at any open head cites this roadmap's §0.11 or §0.15. §0.13, which CountingBundlesAndHallAlgebrasOfCurves cites, keeps its number.

## H04 (roed-math) — disputed

The suggested resolution was to list AutomorphicSpectralTheory §§6.22a and 6.22c under Downstream consumers, so that it would consume §§0.7, 0.8 and 0.11. That would be an upward dependency. The merge order lists AutomorphicSpectralTheory at line 82 and GlobalShtukasAndFunctionFieldLanglands at line 342, so the earlier roadmap must own the shared statements. This README therefore cites AutomorphicSpectralTheory as a supplier (H01–H03), and nothing is listed under Downstream consumers.

## H05 (roed-math) — answered

No: §§1.1–1.3 stay over the curve X/F_q and are not extended to arbitrary separably closed fields. At its head `94ca8ae`, SheafTheoreticSmithTheory owns that geometry itself in §3.0, *The loop Grassmannian over an arbitrary field*, has dropped `gap:grassmannian-arbitrary-geometric-field`, and over a field containing F_q identifies its Grassmannian with the base change of §1.1's one-leg fibre. This README's Scope line cited "§§ST.3 and ST.6", ids that roadmap does not use, and attached "for odd ℓ" to the Satake extension, which its §3.1 does not impose. That line now cites §3.0, §§3.1–3.2, and Layers 4 and 6, and the Downstream-consumers line names the sections it actually consumes (§§1.1–1.3, 1.5, 1.8–1.9, 1.14).

## Build and gate

- `lake build TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested`: `Build completed successfully (8976 jobs).` (`Suggested.lean` unchanged by this job.)
- Gate, after the commit: `gate GlobalShtukasAndFunctionFieldLanglands: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
  - The first gate run, before the commit, reported `tex=1` at the new §0.8 text `(T_{a+1},…,T_b)`, which was outside a code span. It was put in backticks.
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2360 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Citation resolver on the README: no cross-roadmap citations and no Lean names found nowhere.

## Ownership, overlaps and suppliers

- **New supplier.** The new supplier is AutomorphicSpectralTheory, an open new-roadmap pull request at line 82 of the merge order, earlier than this roadmap. It was read at its head `539ae72`: §6.22a (lines 3324–3339 of its README), §6.22c (lines 3372–3389) and convention Y (Conventions). It is not a revision of an existing roadmap, so nothing is "only an open revision defines".
- **Duplication search by object.** The other open heads and main were searched for T-semistability, adelic bundle double cosets and 1/|Aut(E)| orbit masses; AutomorphicSpectralTheory is the only other owner.
  - FunctionFieldArithmetic has no bundle–adelic dictionary.
  - AutomorphicSpectralTheory has no Siegel bundle mass formula and no SL_r volume, so §0.13 is not a duplicate. Its §6.24 counts Higgs Harder–Narasimhan strata.
  - Its §1.11 central degree lattices concern GL_n Levis and character tori; §0.10 here is the general-group bundle quotient, a different object.
- **Downstream description.** SheafTheoreticSmithTheory, later in the merge order, is described in Scope and Downstream consumers only. It was checked at its head `94ca8ae`, lines 14, 88–90, 640–705 and 1650.
- **Overlaps file and moves.** The overlaps file listed no dropped ids and no other pull request changing this roadmap. No notion was moved down from a later roadmap.
- **Ids.** This job drops §0.11 (Adelic orbit masses) and renumbers §0.15 to §0.11. Neither id is cited by any roadmap on main, at any open head, or in a board package.

## Suggested.lean

`Suggested.lean` declares nothing; its docstring says why no headline is statable at the pins, and `signatures.md` is "not available: no named declaration". There was therefore nothing to `#check`, no `variable` context to audit, and no Lean change. The T-HN filtration of §0.8 is not a headline, and it lacks vector bundles with degrees on curves at the pins.

## Sources

No new source was fetched and `needs-references.toml` was not written. The locators kept or used were re-read:

- Chau line 787–794: the definition (4.1.1), with T in the closure of the positive chamber.
- Chau line 806–813: Theorem 4.1.2 (existence and uniqueness of the T-filtration), p. 17.
- Chau line 817–821: F^P(g,T) as an alternating sum.
- Yu line 891–899: (3.3.5), and F^G as the indicator of T-semistability.
- Yu line 996–997: §3.3.2, p. 20, citing Chaudouard for existence and uniqueness of the T-filtration.

No text in the review asked for anything outside the job.

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope/contract: AST §6.22a groupoid equivalence and stabilizers for GL_n, K=∏GL_n(O_v) | n=1 on P¹/F₃; n=2, E=O⊕O on P¹/F₃ | GL₁: classes Z, stabilizer F₃^× of order 2, mass 1/2 (agrees with the §0.11 Picard Check); GL₂: Aut=GL₂(F₃) of order (9−1)(9−3)=48 (agrees with the §0.13 Check) | consistent | none |
| §0.7 remark: GL_n with N=∅ restricts to §6.22a | n=1, n=2; level N=∅ versus N=2v for G_m | ker¹(F,GL_n)=1 (Hilbert 90), so one component; at N=∅, K_N=∏GL_n(O_v); at N=2v the level 1+π_vO_v is not in §6.22a, so the variant is needed | true | remark added |
| Contract: F^G(g,T) = Σ_P (−1)^{dim a_P^G} Σ_δ τ̂_P(H_P(δg)−T) is the indicator of T-semistability | n=1; n=2 with E=O(1)⊕O(−1), T=(0,0) and T=(1,−1) | n=1: only P=G, so F^G=1, and every line bundle is T-semistable. n=2, T=0: the flag O(1) gives τ̂=1 (2>0), so F^G=1−1=0 (unstable). T=(1,−1): 2−2=0 is not >0, so F^G=1, and the bundle is T-semistable at equality | true; strict τ̂ matches the non-strict ≤ | formula in contract |
| §0.8: canonical T-HN filtration exists and is unique for dominant T | n=1; T=0; non-dominant T=(−1,1) on O⊕O over P¹ | n=1: trivial filtration, μ_T=deg−T₁. T=0: ordinary HN. T=(−1,1): S=(0,−1,0) not concave; each of the q+1 lines O⊂E has d_T=1>0, and supermodularity fails, 0+0 < 1+1 | dominance needed | negative-control Check added |
| §0.8 Check, constant T | O(2)⊕O(−1), c=5 | shifted slopes 2−5=−3 > −1−5=−6; filtration O(2)⊂E, the ordinary one | true | rewritten Check |
| §0.8 Check, O(1)⊕O(−1), T=(1,−1) | all line subbundles O(a), a≤1 | d_T(O(a))=a−1≤0, the segment value at rank 1 (d_T(E)=0); ordinary slope of O(1) is 1>0 | T-filtration trivial, ordinary not | Check kept, made explicit |
| §0.8 Check, O(3)⊕O(−3) | T=(1,−1); T=(3,−3) | d_T(O(3))=3−1=2>0, so the filtration is O(3)⊂E with μ_T 2 > −3−(−1)=−2. Semistable iff 3−T₁ ≤ −(T₁+T₂)/2, i.e. T₁−T₂≥6; at (3,−3) both sides are 0 | true | Check added |
| §0.8 Check, consecutive block | n=3, T=(3,2,0), ranks (1,3], degree 4 | (4−2−0)/2=1 versus the wrong block (4−3−2)/2=−1/2 | true | unchanged |
| §0.13 proof via §6.22a orbit masses | r=2, d=0 on P¹/F₃ | 1/48 + Σ_{m≥1} 1/(4·3^{2m+1}) = 1/48+1/96 = 1/32; the formula gives 3^{−3}·(1/2)·Z(1/9) with Z(1/9)=1/((8/9)(2/3))=27/16, also 1/32 | consistent | citation changed only |
| Layer 0 example, rank one | G_m over F_q | stack mass 1/(q−1); Picard-scheme mass 1 (at q=3: 1/2 versus 1) | true | rewritten |
| Layer 0 example, P¹ with T=(1,−1) | O(1)⊕O(−1) | ordinary HN O(1)⊂E nontrivial; T-HN trivial (row above) | true | rewritten |
| Scope: SheafTheoreticSmithTheory §§3.1–3.2 over every separably closed field of characteristic ≠ ℓ, coefficients F̄_ℓ and W(F̄_ℓ) | its Conventions and §3.1 at `94ca8ae` | §3.1 has no oddness hypothesis; oddness and goodness enter only the cyclic comparison, per its Conventions | the old "for odd ℓ" was wrong | removed |
| Moved §0.11 (Picard stack), formerly §0.15 | its *Needs* §0.1 and §0.10; consumers §§2.4 and 3.3 | all *Needs* are earlier; both consumers are later; anchors resolve (resolver: none missing) | consistent | renumbered only |
