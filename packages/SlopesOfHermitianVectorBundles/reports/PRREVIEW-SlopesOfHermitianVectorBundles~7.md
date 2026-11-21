# Review of SlopesOfHermitianVectorBundles (pull request #2880 at 13d7bb0)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding in the text added to 4.3: it asserts the single-vector bound `log λ^abs(Ē) ≤ −μ̂_max(Ē) + ½·log s_1` on an input that it says "is not given here" and for which it names no owner, while HeightsForLogSingularMetrics §4.3b, a later roadmap of the family that consumes 4.3, states that input and a sharper form of the same bound. The bound itself is true, and the five small corrections of the previous review are all repaired. There are no small corrections and no format notes; what the formal proof states is still left to the human reviewers.

## R01 (P2) — 4.3 now asserts a single-vector bound whose only input no layer, supplier or pinned declaration provides, and a later roadmap of the family states the same bound

In 4.3, the paragraph "The form of the formal proof" (line 546) asserts `log λ^abs(Ē) ≤ −μ̂_max(Ē) + ½·log s_1`, and the end of the route (lines 552–555) derives it from "the absolute Siegel lemma for one vector … is not given here". The Needs line of 4.3 is unchanged, the supplier contracts name no owner for that lemma (DiophantineApproximationAndTranscendence §2.5 has only the product form, as the contract now says), and the pinned libraries have none. So an implementer of 4.3 is given a stated inequality that nothing in this roadmap's supply proves, and is not told where it is proved.

It is proved elsewhere in the family: HeightsForLogSingularMetrics §4.3b (b) is the absolute Siegel lemma for one vector, with the constant `½·Σ_{k=2}^{n} 1/k`, and its §4.3b (c) is this very bound, `log λ^abs(Ē) ≤ −μ̂_max(Ē) + ½(H_{s₁} − 1)`, obtained by the same step (the lemma applied to the maximal destabilising sub-bundle). That roadmap takes `μ̂_max`, `λ^abs` and the product bound from 2.1 and 4.3 here, so it is later in the supply order and cannot be a supplier of 4.3; and with this change the bound has two statements, the weaker one here. The constants, for `s = 1, …, 5`: `½(H_s − 1) = 0, 0.25, 0.417, 0.542, 0.642`; `½·log s = 0, 0.347, 0.549, 0.693, 0.805`; `((s − 1)/2)·log 2 = 0, 0.347, 0.693, 1.040, 1.386`. So the statement here is true and is implied by §4.3b (c); for `s_1 ≤ 2` it is already the product bound of 4.3.

The smallest change keeps the observation and gives the bound its one owner: in the paragraph, replace the assertion and its parenthesis by a sentence that the single-vector bound with a logarithmic constant, `log λ^abs(Ē) ≤ −μ̂_max(Ē) + ½(H_{s_1} − 1) ≤ −μ̂_max(Ē) + ½·log s_1`, is HeightsForLogSingularMetrics §4.3b (c), proved there from its absolute Siegel lemma §4.3b (b), and is not a target of 4.3; drop the "Single vector:" sentences from the route (that step is the route of §4.3b (c)); and name §4.3b in "Not owned here" beside the absolute Siegel lemma of Roy and Thunder. The alternative, to own the lemma here, would need it as a target of 4.3 with a route from this roadmap's suppliers and a locator, and §4.3b (b)–(c) withdrawn there; its route there goes through heights of projective bundles, which come after this roadmap.

## Questions for the author

- The new paragraph is headed "The form of the formal proof", like the fifteen earlier ones. Could each carry the file and declaration name in that repository? What stopped me: the repository's host is in no licence class of the sources service, so I did not open it; here I checked only that the recorded bound follows from HeightsForLogSingularMetrics §4.3b (c).

## Previous findings

- C01 — repaired: the route of 6.1 cites "BanachSpaceTheory B7" and the contract ends "with the spherical measure and the Gaussian model as the Tau Ceti names below"; the absent name occurs nowhere.
- C02 — repaired: "addressed to ArakelovGeometryAndAbelianHeights §5.8."; "§§5.10c and 5.17e–5.17f work with section lattices and small sections directly"; "belong to the abelian-height roadmaps."
- C03 — repaired: step (4) reads "the `N_0` columns `l^α·l_D^{T−a}·m_p` of the levels `a < T − D` contribute …".
- C04 — repaired: the route and the Needs line of 3.4a name `TauCeti.GaloisDescent.span_invariants_eq_top`, and the Tau Ceti contract states it "with no hypothesis on the dimension".
- C05 — repaired: the description says Lean "reports no message, since the file declares nothing" and lists ArithmeticGaloisRepresentations §7.7, StandardDistributions §§4.1, 4.3 and AlgebraicModuliForArithmeticGeometry §9.10 among the suppliers on main.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.3 single-vector bound (added) | `ℤ ⊕ (ℤ, e^(−c)|·|)`; `ℤ²`; `A₂`; `s = 1…5` | `−c = −c + 0`; `0 ≤ 0.347`; `0 ≤ −0.0719 + 0.347`; `½(H_s−1) ≤ ½log s ≤ ((s−1)/2)log 2` | true; input unowned here | R01 |
| 4.3 route, absolute Siegel lemma for one vector | `m = 1`; `m = 2, 3`; HeightsForLogSingularMetrics §4.3b (b) | `h = −μ̂` exactly; `0.25 ≤ 0.347`, `0.417 ≤ 0.549`; stated there with `½Σ_{k=2}^n 1/k` | true; owned by a later roadmap | R01 |
| DiophantineApproximationAndTranscendence contract, first minimum (added clause) | `μ_1^n ≤ ∏μ_i ≤ 2^(n(n−1)/2)·|det A|` | `μ_1 ≤ 2^((n−1)/2)·|det A|^(1/n)`; `n = 2`: `√2`; agrees with AdelicHeightsAndSuccessiveMinima §2.5a | holds | none |
| 3.4a route (changed) | `ℚ(i)/ℚ`, `U = M(1,1)`, `U = M(1,i)`; infinite-dimensional `V` | invariants of `M(1,1)` are `ℚ(1,1)`, span `U`; `M(1,i)` not stable; pinned lemma has no finiteness on `V` | holds | none |
| 6.1 route (changed) | `ℓ^∞`, `ℓ¹` on `ℂ^N` | `N^(−½)|x|₂ ≤ |x|_∞ ≤ |x|₂`; `|x|₂ ≤ |x|₁ ≤ √N|x|₂`; B7 on main states `d(E, ℓ²_n) ≤ √n` | holds | none |
| 6.7 route, step (4) (changed) | `D = 2`, `T = 4` | `Σ_{a<2}(a/2)·binom(a+1,1) = 1 = binom(3,3)`; the label now names the `N_0` columns | holds | none |

The rows for the untouched statements stand as in the previous review, of `bad8bca`.

- Source locators checked against the text: 0 new (the changed passages add none; the added bound of 4.3 carries no locator, see R01).
- Library declarations opened at the pin: 1, `TauCeti.GaloisDescent.span_invariants_eq_top` (`RepresentationTheory/GaloisDescent/Span.lean`, line 41: finite group acting faithfully on a field, no finiteness hypothesis on the space).
- Cross-roadmap citations resolved: 5. BanachSpaceTheory B7 and ArithmeticGaloisRepresentations §7.7 on main; AdelicHeightsAndSuccessiveMinima §2.5a, HeightsForLogSingularMetrics §4.3b and its contract "From SlopesOfHermitianVectorBundles" at their open heads.
- Dependency check: `depcheck: 170 roadmaps, 1989 edges, 0 problem(s)`. Outside the folder the pull request changes only the family index. Automatic checks: all passed.
- Elaboration: `lake env lean` on `Suggested.lean` returns exit 0 with no message. The file is unchanged and declares nothing, so there was nothing for `#check @name` or the one-tactic probe.
- Overlap check: read AdelicHeightsAndSuccessiveMinima, HeightsForLogSingularMetrics (open), DiophantineApproximationAndTranscendence (main) for the changed passages; shared: the single-vector bound for the first absolute minimum and the absolute Siegel lemma for one vector (owner HeightsForLogSingularMetrics §4.3b; asserted here without an owner, R01). The other shared objects stand as in the previous review.
- Source independence: changed passages only: 4 passages (the 3.4a route, the paragraph and route added to 4.3, the two contract sentences) compared with 2 texts (the docstring of the pinned Tau Ceti lemma, HeightsForLogSingularMetrics §4.3b); none shared beyond forced formulas. Largest share Gaudron2008, 18 of 40 locators; the arrangement was not compared again (no layer added, removed or reordered). [FormalProof] not readable: not compared.
- Research link: Layers 2–4 are the slope theory of Bost (1996, 2001) and Gaudron (2008), used in Bost's proof of the period theorem of Masser–Wüstholz; 6.3–6.4 is Chen's (2010) convergence of maximal slopes. Rests on the README's References and on Bost2001 and Gaudron2008 as read.

## Not verifiable

- [FormalProof] (a GitHub repository) and [Announcement] (a PDF on alpo.ge): the sources service puts neither host in a licence class, so neither was opened. Every sentence on what [FormalProof] states, the new paragraph of 4.3 included, is unchecked against it.
- The absolute Siegel lemma for one vector with the constant `½·log m`: no source for it is cited in this README or held in the sources cache; I checked it only against HeightsForLogSingularMetrics §4.3b (b) and the instances in the table.
- Stuhler1976, Grayson1984, Borek2005, StruppeckVaaler1990, Philippon1991, DeBruijnErdos1952: uncertified, cited by name.

## Source issues

- none

## For the human reviewers

- Licence: [FormalProof] (github.com/leanprover-community/riemann-hypothesis) and [Announcement] (alpo.ge/remark.pdf), README lines 1235–1236, are on hosts in no licence class; neither was read.
- Scope: Layers 1–4 and 6.1–6.6 rest on refereed sources (Bost1996, Bost2001, Gaudron2008, Chen2010, BostKunnemann2010). 1.2a (iii), Layer 5 and 6.7b name only [FormalProof], an unrefereed formalisation announced 20 November 2026 (README line 1236).
- Not tested: wording and arrangement were not compared with [FormalProof], which the README names on 27 lines without a file or declaration locator.
