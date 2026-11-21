# Review of DeligneWeightsAndPurityPartII (pull request #1760 at 678712f)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 47 lines changed since cdacab3, and no finding remains. The one finding of the previous review is repaired: the Galois-equivariance of the proper algebraic–adic comparison is now cited from GaloisActionOnEtaleCohomology §§0.2 and 4.2, the fourth supplier gap is withdrawn, and cup products and coefficient reductions are obtained inside §4.2 from §3.5 and the naturality of Huber's map. The four small corrections and two format notes of the previous review are also repaired; there is one new format note, not blocking. Two points remain for the human reviewers.

## N01 — The module docstring could name Mathlib's `Perfectoid.Tilt`

`TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean:25` says the pins lack "the tilt of a perfectoid field as a normed field". That is true, but a reader who finds Mathlib's `Perfectoid.Tilt` (`Mathlib/RingTheory/Perfection.lean:815`, a `Field` instance at `:821`, with a valuation only on `PreTilt`, `:779`) may doubt it; a clause saying that this is a bare field with no norm or valuation would settle it.

## Previous findings

- R01 — repaired: §4.2 now reads "use ClassicalAdicEtaleCohomology §8.2 for the algebraic–adic comparison and GaloisActionOnEtaleCohomology §4.2 for its equivariance"; the gap `analytic-comparison-automorphisms` is gone from the README, and a supplier contract for GaloisActionOnEtaleCohomology is added.
- C01 — repaired: the docstring now names what §2.4 lacks (the completed tower, the tilt as a normed field, the Fontaine–Wintenberger comparison, the marked data) and says §§2.1–2.3 are preliminaries of §2.4.
- C02 — repaired: "The theorem fails without the condition t(H′∩I) ≠ 0 of §0.3."
- C03 — repaired: all five references in the route of §4.1 now read "SchemeAndStackFoundations §0.7", "§4.13", "§0.9".
- C04 — repaired: "§5.4 the oriented étale product of small étale topoi, through which it defines general-base nearby cycles", with no identifier.
- N01 — repaired: the duplicate unramified bullet of §0.2 and the duplicate `Spec k` and `ℙ^n_k` entries of §0.8 are removed; one of each remains.
- N02 — repaired: the *Needs* line of §1.1 and the Layer 1 Dependencies now list "DeligneWeightsAndPurity §§0.6, 0.19, 5.11, 7.15".

## Verified sound

| Statement | Instances and values computed on each side | Result / change |
|---|---|---|
| §4.2, equivariance of the proper comparison (changed) | Supplier §4.2: K complete rank one, any characteristic, Y proper, Λ torsion, M ∈ D⁺; README uses M = ℤ/ℓ^m, K and L♭ (characteristic p): inside the supplier's hypotheses | cited statement covers the use; no change |
| §4.2, group identification (changed) | Supplier §0.2: σ ↦ σ̂ bijection G_K → Aut_cont(C/K); G_L ⊆ G_K open, same C; K = C: trivial group, identity action | restriction to G_L, G_{L♭} legitimate |
| §4.2, K^sep against K̄ (changed) | Supplier §1.4: pullback H^i(V_{K^sep}) → H^i(V_{K̄}) equivariant isomorphism (universal homeomorphism); 𝔽_p(u), u^{1/p}: both sides ℤ in degree 0 | contract states it; no change |
| §4.2, cup products and unit (changed) | Over C the comparison is a site pullback (supplier §4.2 factorization through H^i(V_C)); §3.5: pullback multiplicative; degree 0: 1 ↦ 1 | supplied by §3.5 here; no gap needed |
| §4.2, coefficient reductions (changed) | Base-change map is a natural transformation on torsion D⁺ (ClassicalAdicEtaleCohomology §8.2); apply to ℤ/ℓ^(m+1) → ℤ/ℓ^m as ℤ/ℓ^(m+1)-modules: square commutes | true; no change |
| §0.5 Check (changed) | H′ = G_{k(ϖ^{1/ℓ^∞})}: t_ℓ(H′∩I) = 0, Frobenius eigenvalues 1, q on the whole space, weights 0, 2 ≠ 1 | condition named is the one of §0.3 |
| §1.1 *Needs* (changed) | DeligneWeightsAndPurity §0.6 on main is "Algebraicity and Weil purity from ι-purity at every ι"; §§0.19, 5.11, 7.15 exist | citation resolves |
| §4.1 route (changed) | SchemeAndStackFoundations §0.7 holds `geometric_irreducible_components`, §0.9 spreading out, §4.13 `regularLocus_eq_smoothLocus` | citations resolve |
| Suggested.lean docstring (changed) | Pins: `IsPerfectoidField` (`Field.lean:68`), `uniformTilt` (`UniformTilt/Basic.lean:114`, `map` `:1044`), Mathlib `Perfectoid.Tilt` a bare field (`Perfection.lean:815`); no normed tilt, no Fontaine–Wintenberger | claims true at the pins; N01 |

The rows for the untouched statements stand as in the previous review, of cdacab3.

- Source locators read against the text in this round: SCH12 2 (Theorem 9.7, p. 309, line 2604; the topos diagram, p. 310, line 2612), both as cited by the changed paragraph of §4.2.
- Library declarations opened at the pins: 2 of Tau Ceti, 3 of Mathlib (above); all exist where stated.
- Cross-roadmap citations resolved on main: GaloisActionOnEtaleCohomology §§0.2, 1.2, 1.4, 4.2 (its consumer list names this roadmap for exactly this compatibility); ClassicalAdicEtaleCohomology §§5.4, 8.2; DeligneWeightsAndPurity §0.6; SchemeAndStackFoundations §§0.7, 0.9, 4.13. GaloisActionOnEtaleCohomology is on main and earlier in the merge order; it cites this roadmap only as a consumer.
- Dependency check: `depcheck: 171 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The three declared gaps carry the same slugs in the plan and the README; none was changed.
- Automatic checks: all pass. Elaboration of `Suggested.lean` exits 0 with no output; the file declares nothing, so the `#check` comparison and the one-tactic probe have empty inventories. Nothing changed outside the folder.
- Title and description read against this head: no sentence is contradicted; the prose names no supplier individually, so the added supplier leaves it accurate.
- The seeded sample falls in the changed passages at §§0.2, 0.5 and 4.2; their locators are unchanged and hold as before.

Overlap check: read ClassicalAdicEtaleCohomologyPartII (open), AnalyticToricGeometryPartII, ClassicalAdicEtaleCohomology and EtaleDualityAndPerverseSheavesPartII (main), and, by object, GaloisActionOnEtaleCohomology; the equivariant proper algebraic–adic comparison is owned by GaloisActionOnEtaleCohomology and now cited from it; nothing else shared.

Source independence: changed passages only; 3 passages compared with 1 source (SCH12 lines 2598–2616), none shared; largest share ITO20, 89 of 167 source mentions, as before; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: The end theorem is Scholze's weight–monodromy theorem for toric complete intersections (Scholze, 2012), proved by tilting to Deligne's equal-characteristic theorem (Deligne, 1980); Layer 3 is Ito's uniform neighbourhood theorem (Ito, 2020), written for a mod-ℓ analogue of Scholze's argument. Rests on the README summary, SCH12 §9 and ITO20 Remark 1.3.

## Not verifiable

- LUT93, HUB96, HUB98: settled as uncertified; not reopened. The naturality of Huber's base-change map in the coefficient complex was read from ClassicalAdicEtaleCohomology §8.2 as restated by GaloisActionOnEtaleCohomology, not from HUB96.
- The description's account of earlier review rounds and of who ported the package: not checkable from the head.

## Source issues

- none

## For the human reviewers

- ITO20, the source with the largest share of locators (89 of 167), is cited as arXiv:2008.07794v1 in the References of `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md`; the README gives no journal reference for it.
- The Provenance section of `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md` links AxiomMath/Weil at commit 27cdb20, stated there as Apache 2.0; `Suggested.lean` declares nothing, so no Lean here is adapted from it.
