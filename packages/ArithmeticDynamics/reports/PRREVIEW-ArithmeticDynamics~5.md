# Review of ArithmeticDynamics (pull request #1335 at ae79f44)

**Verdict:** accepted

:robot: Independent AI review. No findings. Incremental re-review of 0 changed lines since ae79f44: the folder is byte-identical to the head the previous review accepted, so this round reads the pull request's title and description against the head, re-runs the gate, the dependency check and the elaboration, and re-resolves the overlap and citation leads computed against today's open heads.

## Previous findings

- none: the previous report (PRREVIEW-ArithmeticDynamics~4, at ae79f44) listed no findings, and the folder has not changed since.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 finite Tate identity and limit (the description's "the Tate series is `tateLimit`"; README:1983) | S=ℕ, φ(n)=2n, h(n)=n+1, α=2; P=3, n=2; P=0 | h∘φ−αh ≡ −1, so C=1; eᵢ=−2^(−i−1); left 4−3/4=13/4, right h(12)/4=13/4; limit ĥ(P)=P, ĥ(φP)=2P; ĥ(0)=0 at the fixed point | Holds; ĥ−h ≡ −1, of absolute value 1=C/(α−1), so the supplier bound is attained | none |
| §1.5 preperiodic ⇒ Tate limit zero, with no hypothesis on h (README:2033) | Same φ, P=0 fixed, h(0)=1≠0; non-preperiodic P=1 | h(φⁿ0)/2ⁿ=2^(−n)→0; P=1 gives (2ⁿ+1)/2ⁿ→1≠0 | Holds; the converse needs Northcott (§1.8), as stated | none |

The rows for all other statements stand as in the previous review, of `ae79f44`.

**Title and description against the head (step 8).** Each prose sentence and each sentence of the `roadmap-summary` block was set beside the head:

| Sentence of the description | What the head shows |
|---|---|
| Title "ArithmeticDynamics: roadmap"; "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" | The pull request adds the folder (not on main): exactly these three files, 11611 insertions, 0 deletions, 0 headings and 0 declarations removed. Nothing renumbered or dropped is left unstated. |
| "equidistribution of small points on ℙ¹ at all places … rank hypotheses … arboreal image theorems, canonical-height specialization, uniform common torsion images in the Legendre family and étale dynamical Mordell–Lang" | README:3 (Summary) lists the same endpoints; README:98–102 keeps the rank assumptions; Layers 0–6 at README:955, 1977, 2354, 4158, 5908, 7315, 8514 match the second prose paragraph's order. |
| "the Tate series is `tateLimit`" | README:37–41, 220: HeightsRationalPointsAndObstructions §0.18, argument order `tateLimit φ α h`. |
| "arboreal specialization uses the `Polynomial.Gal` root action" | README:68–70; `Polynomial.Gal.galActionHom` at Mathlib/FieldTheory/PolynomialGaloisGroup.lean:204. |
| "periods, Weil heights, measure support and entropy keep their Mathlib meanings" | README:13–16, 520, 634: `Function.IsPeriodicPt` (Mathlib/Dynamics/PeriodicPts/Defs.lean:62), `Projectivization.logHeight` (Mathlib/NumberTheory/Height/Projectivization.lean:51), `MeasureTheory.Measure.support` (Mathlib/MeasureTheory/Measure/Support.lean:59), `Dynamics.coverEntropy` (Mathlib/Dynamics/TopologicalEntropy/CoverEntropy.lean:428). |
| "weakly topologized Berkovich line … not a compactification of the field"; "Pullbacks count inseparable multiplicity" | README:10948, 4148; README:128. |
| "power-orbit classification and generic rational-map arboreal surjectivity hold in every characteristic"; "uniform boundedness, dynamical Lehmer and unrestricted Mordell–Lang enter only as explicit hypotheses" | README:97–102, 110. |
| "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti"; "the Lean imports none of them" | Suggested.lean: the single line `import Mathlib`, four definitions with bodies, eleven admitted theorems. |
| "Validation: … 0 … 0 … 0 problem(s) … 0 path(s)" | The gate and dependency check below; the outside-folder diff against origin/main is empty. |

- Remark, no change asked: of the entropies the README uses, only topological entropy has a Mathlib meaning (`Dynamics.coverEntropy`); measure entropy is consumed from GeometryOfNumbersAndQuadraticArithmetic §4.2 (README:296–315), a supplier the description's dependency list names.
- Gate, rerun at this head: `gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on TauCetiRoadmap/ArithmeticDynamics/Suggested.lean exits 0 with eleven warnings, all `declaration uses sorry` (lines 68, 72, 76, 85, 100, 132, 143, 151, 159, 168, 177). The fifteen signatures are those compared in the earlier reviews; no declaration changed, so no new one-tactic probe was due.
- Overlap lead "AlgebraicCurves §layer, dropped by the open revision of AlgebraicCurves": resolved, no citation breaks. At that revision's head Layers 0–12 keep their numbers and titles (its README:309, 438, 490, 565, 946, 1068, 1204, 1522, 1851, 2038), promoted from `###` to `##`. Remark: Layer 8's heading loses its trailing warning sign there, so the anchor spelling `layer-8-…-inseparability-` (README:345, 409) loses its final hyphen; the layer number, which the README also cites, is unchanged.
- Citation leads: "Surfaces, §§1.9" (README:2366) and the four `BerkovichAnalyticSpace.*` names (README:202) sit in untouched text resolved in the earlier reviews (the latter as planned API of AlgebraicModuliForArithmeticGeometry §7.10.2). Consumers re-resolved at their open heads: ArakelovGeometryAndAbelianHeightsPartII cites §§4.1a, 4.3 (README:5928, 5946) and HeightsRationalPointsAndObstructionsPartII cites §§6.57–6.64, 6.93, 6.110–6.112 (README:9530, 9660, 10145, 10398, 10441); all exist.
- Overlap check: read EffectiveDiophantineMethods, TropicalAndBerkovichArithmetic, ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructions, HeightsRationalPointsAndObstructionsPartII, ClassicalArithmeticCompletion, DiophantineApproximationAndTranscendence, ProbabilisticAndMetricNumberTheory; genus-2 and genus-4 dynatomic point lists: EffectiveDiophantineMethods (consumed here); line kernels, model metrics and the hybrid carrier: TropicalAndBerkovichArithmetic (escape rates and family convergence here, stated the same on both sides); the characteristic-zero power-map height: ClassicalArithmeticCompletion §6.37 (the arbitrary-characteristic classification here); pointwise Birkhoff: ProbabilisticAndMetricNumberTheory §4.1. No object has two owners.
- Seeded sample: none of the fifteen targets lies in a changed passage (nothing changed), so no locator was reopened this round.
- Source independence: changed passages only: 0 passages compared with 0 sources, since no passage changed; largest share demarco-krieger-ye-2020, 99 of 911 locator links; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The unchanged source locators, supplier contracts and targets were not recertified; they rest on the earlier reports.
- The description's sentence on AI assistance and later red-team passes describes process outside the repository and cannot be checked against the head.
- The settled locator-only sources remain outside text certification: poonen-corrected-descent-certificates, forster-riemann-surfaces, Zieve1996, stoll-1992-quadratic-iterates, silverman-moduli-book-2012, tate-1983.

## Source issues

- none

## For the human reviewers

- The generated `depends-on` and `merge-order` blocks list #2112 (Equidistribution, another author's roadmap on circle rotations and three gaps). The README cites no such roadmap: the word occurs only in its own target titles, e.g. README:5960, 6882. Whether to wait on it is yours to decide.
