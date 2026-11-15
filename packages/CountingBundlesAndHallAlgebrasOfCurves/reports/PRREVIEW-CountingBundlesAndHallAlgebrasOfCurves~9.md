# Review of CountingBundlesAndHallAlgebrasOfCurves (pull request #1547 at e22a59e)

**Verdict:** accepted

Incremental re-review of the 49 lines changed since fbebf39. No finding remains; the gate passes.

## Previous findings

- R01 — repaired: README:71 “Layer 0, §0.1 (local endomorphism rings and indecomposables, with Fitting's lemma), §0.3 (uniqueness of decompositions) and §0.4 (recognition …) … Its §0.6, the radical as a morphism ideal”; README:327 “RepresentationTheory/ArtinAlgebras §0.6”.
- R02 — repaired: README:61 “`InvertibleSheaf.eulerDegree` in `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean` is the rank-one degree χ₂(L)−χ₂(O_X) … `InvertibleSheaf.fixedRankOneEquiv` … identifies invertible sheaves with fixed-rank-one sheaves”; interface bullet at README:216.
- R03 — repaired: `Suggested.lean:38–41` “Mellit's Laurent integrality lacks the plethystic logarithm, with Adams operations raising q, z, the α_i and T to powers … Macdonald functions enter its proof, not its statement.”

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §0.2 rank-one bullet (new, README:216) | every scheme over k, r=1; O(1) on P¹ | scratch `example`: `bundleDegree k X E = ((fixedRankOneEquiv X).inverse.obj E).eulerDegree k` closes by `simp [bundleDegree, InvertibleSheaf.eulerDegree]`; P¹: 2−1=1 on both sides | agrees; none |
| §0.2 genus-two Check (changed, README:221) | O² on genus 2 | χ₂(O²)=−2, χ₂(O)=−1: weighted −2−2(−1)=0; χ₂ alone −2; unweighted rank-one formula −2−(−1)=−1 | agrees; none |
| §1.2 with ArtinAlgebras §§0.1, 0.3–0.4 | End(N)=𝔽₂[t]/t²; O²; ℤ over ℤ | a+bt is a unit for a=1, nilpotent for a=0, residue field 𝔽₂; diag(1,0) on O² is neither (decomposable); ℤ excluded since Coh(X) is Hom-finite over k | agrees; none |
| §1.3 with ArtinAlgebras §0.6 | M=N² and M=N⊕k, N=𝔽₂[t]/t² | N²: radical entries lie in tN, rad=M₂(tN) of dimension 4, quotient M₂(𝔽₂), 16 elements; N⊕k: dim End=5, rad=1+1+1+0=3, quotient 𝔽₂×𝔽₂ | agrees; none |
| Docstring, Mellit bullet against §§10.1, 10.3 | g=1, λ=(1), q=2, α=−1 | T¹ coefficient of −(1−q)(1−z)Log Ω₁ is (z−α)(1−q/α)=3(z+1); only the cell product and Log are used | agrees; none |
| Docstring, purity and Poincaré bullet against §§9.1, 9.3 | carriers in each statement | §9.1: H_c^n(H,ℚ_ℓ) with Frobenius; §9.3: H_c^n(H(ℂ),ℚ) and A_{g,r,d}; the Artin comparison occurs only in the §9.3 route | agrees; none |
| `absIndecCount_eq_of_degree` (cited by README:216, 262) | r=0; P¹, r=1 | r=0: every object is zero, `Indecomposable` excludes it, 0=0; P¹: one line bundle in each degree, 1=1 | agrees; none |

The rows for untouched statements stand as in the previous review, of fbebf39.

- Source locators checked in the text: 1 (seeded §1.2: S16 Lemma 2.3 and Corollary 2.5, printed p.309, S16 lines 619–627 and 639–645; §1.3's Lemma 2.4 at S16 lines 628–638). The rest of the seeded sample lies outside the changed passages; §9.3 was read against the changed docstring only.
- Library declarations opened at the pin: `InvertibleSheaf.eulerDegree` (`TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70`, body χ₂(L.obj)−χ₂((trivial X).obj), no curve hypothesis), `InvertibleSheaf.fixedRankOneEquiv` (`VectorBundle/FixedRank.lean:185`), `fixedRankOneEquiv_inverse_obj_obj` (same file, by `rfl`), `FiniteLocallyFreeSheaf.FixedRank.pullback` (line 104).
- Cross-roadmap citations resolved on main: RepresentationTheory/ArtinAlgebras §0.1 (Fitting's lemma), §0.3, §0.4 (recognition, idempotent-complete, Hom-finite over a commutative Artinian ring), §0.6 (matrix description of the radical); SchemeAndStackFoundations §3.3 (rank-one comparison with `InvertibleSheaf.eulerDegree`).
- Gate (my run): every scanner 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0; the only warnings are `sorry` at lines 89 and 99. `#check @` on all five declarations in a scratch copy: types equal the README statements, no binder lost, nothing changed.
- One-tactic probes: `simp` makes no progress on `nilpotent_matrix_count`; `simp [absIndecCount]` leaves both `Nat.card (Skeleton …)` sides of `absIndecCount_eq_of_degree`. No padding.
- Pull request text: the title and description state nothing the 49 lines change (no section, declaration or roadmap supplier added or removed); no sentence is contradicted by the head. Outside-folder diff: empty.
- Remark: the pinned Tau Ceti (a91d3aa) has no `vectorBundleDegree`; the Tau Ceti that main now pins defines `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` with the body of `bundleDegree` (see the last section).

Overlap check: read TopologicalMirrorSymmetryForHitchinSystems, GlobalShtukasAndFunctionFieldLanglands, EndoscopicTransferAndUnitaryTraceComparison, FunctionFieldArithmeticPartII; nothing shared (the first is a consumer, the next two are suppliers, the last owns no Hall, Higgs or indecomposable-count object); `overlaps.md` lists no dropped id and no other pull request changing this roadmap.

Source independence: changed passages only; 4 passages compared with 1 source (S16: §1.2, §1.3, the §0.2 bullet, the docstring bullets), none shared; largest share S16, 84 of 102 locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- M20 (Theorems 1.1 and 5.2, cited by the changed Mellit docstring bullet): settled uncertified, cited by locator only.
- FH58, HES81: settled uncertified; no changed passage depends on them.

## Source issues

- none

## For the human reviewers

- Pins: `bundleDegree` (`TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/Suggested.lean:62`) has the same body as `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` in the Tau Ceti that main pins (2fd255d, `VectorBundle/Degree.lean:82`); this branch's pin (a91d3aa) lacks it. The definition becomes a duplicate when the branch takes main's pin.
