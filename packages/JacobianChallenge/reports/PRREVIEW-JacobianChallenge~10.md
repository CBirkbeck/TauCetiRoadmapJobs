# Review of JacobianChallenge (pull request #1892 at 617bbe1)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 617bbe1. The folder is unchanged; this round read the pull request's title and description, as they stand now, against the head and against the folder's change from main. No finding.

## Previous findings

- R01 — repaired: the description now says "The Jacobian is defined over any field as the representing object of the degree-zero Picard fppf sheaf (D.8 …) so that no rational point and no field extension enters the definition"; README D.8 lines 1068–1076 agree.
- R02 — repaired: "Riemann–Roch is stated for line bundles on the standing curve without a rational point (B.4)"; the Cohen–Macaulay and Gorenstein cases "stay with SchemeAndStackFoundations §2.20 and §3.3", as README lines 54–58 and 638.
- R03 — repaired: "proved here on smooth curves from Tate's residues, so that the duality on Cohen–Macaulay and Gorenstein curves planned in SchemeAndStackFoundations §2.20 and §3.3 restricts to it and consumes Layer B"; README line 58 agrees.
- R04 — repaired: "rewrites … README.md in the house shape … keeps the six layers A–F and their subjects. The former end-goal, standing-hypotheses, inventory, prerequisite-tower, acceptance-criteria and caveats sections are absorbed"; the six removed headings and the title change are all named.
- R05 — repaired: "It drops four declarations of main's file", naming `cartierPicardEquiv`, `cartier_sheaf_iso_iff_principal`, `properIntegralGroup_commutative` and `pointedCurvePicard_representable` with the pinned declarations that replace them; all four are on main and absent at the head.

No repair introduced a new problem: the folder did not change, and every sentence the repairs added was checked against the head (below).

## Verified sound

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| `serreDuality_exists_trace` (B.2; the description says it "quantifies the trace" and that a residue-field trace vanishes at inseparable points) | `ℙ¹_k`, `F = 𝒪`; `F = Ω`; `t = 0`; `ℙ¹_K`, `[K:k] = 2` separable; `∅` | `Hom(𝒪,Ω) = 0 = H¹(𝒪)*`; `c ↦ c·t`, `k → k`, bijective iff `t ≠ 0`; `t = 0` fails; `K → Hom_k(K,k)`, bijective for `Tr_{K/k}∘res`; `0 → 0` | holds; the zero trace is excluded | none |
| E.1 theorem of the cube for `U × V × W` (the description: two proper geometrically integral factors, a connected third) | `(ℙ¹)³`, `L = 𝒪(a,b,c)`; `E³` with the Poincaré-type bundle of the first two factors; `W = {w₀} ⊔ {w₁}` | faces give `b=c=0`, `a=c=0`: `L` trivial; trivial on two faces, not on `E×E×{w₀}`, `L` nontrivial; trivial on three faces, nontrivial over `w₁` | holds; third face and connectedness are both needed | none |
| `dim_jacobianVariety`, `JacobianVariety` without a rational point (D.8, cited by the description) | pointless real conic; genus-one curve with a point | `Pic⁰` sheaf zero, `Jac = Spec ℝ`, `0 = g`; `Jac E ≅ E`, `1 = g` | holds | none |

The rows for all other statements stand as in the previous review, of 617bbe1: the diff changes no statement.

- Folder change since the previous review: 0 lines; `git diff --stat origin/main...HEAD` outside the folder is empty.
- Gate at 617bbe1, my run: every counter 0, `OK` (`depcheck=0`, `stray-files=0`, `outside-folder=0`, `dirty=0`); the worker's run also reports `build=0`.
- `lake env lean` on `TauCetiRoadmap/JacobianChallenge/Suggested.lean`: exit 0, 14 warnings, all "declaration uses `sorry`".
- Dependency check with `--movable`: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Title and description read in full against the head; no sentence contradicted, no change left unstated. Counts confirmed: fourteen `sorry` theorems (11 new, named; `multiplication_isogeny`, `multiplication_etale_iff` kept verbatim; `isAlbanese_abelJacobi` restated); four declarations dropped; `JacobianVariety` and `abelJacobi` are `sorry`'d on main (its lines 67, 75) and have bodies at the head; main's hypotheses `Smooth`, `IsProper`, `GeometricallyIntegral`, `topologicalKrullDim X.left = 1` as quoted; supplier sections §§0.9, 0.11, 1.1, 2.2, 2.11, 4.9, 4.12, 4.14 are exactly README lines 340–345; `hasPicardScheme_of_curve` is in D.4 (line 951), `isRepresentable_picZeroSets` in D.5 (line 986); the cube on main is "an abelian variety's triple product" (main line 333); the module docstring names the trace as not statable.
- Library declarations opened at the pins for the description's claims: 4 (Tau Ceti `CartierDivisor/ClassGroup.lean:123` `classGroupAddEquivLineBundleClass`, with `nonempty_iso_sheaf_iff` in the same file; `PicardFunctor/Abel/Fppf.lean:91` `abelJacobiMapToPicZeroFppf`; Mathlib `AlgebraicGeometry/Group/Abelian.lean:131`). The README cites the three replacements at lines 159, 184, 392–393 (A.2) and 1188 (E.2), as the description says.
- Seeded sample: no sampled target falls in a changed passage (there is none); all four were verified in the earlier reviews.
- Overlap check: read JacobianChallengePartII (open head), SchemeAndStackFoundations and StableReduction (main); `picardScheme`, `Pic⁰` and the Jacobian are owned here and consumed there (SchemeAndStackFoundations §3.6 lines 5736, 6110; StableReduction J-D, J-E); nothing has two owners; `HasPicardScheme`, `picardScheme`, `jacobianScheme` and `JacobianVariety` are declared in no other `Suggested.lean` on main or in JacobianChallengePartII; `overlaps.md` lists no dropped id.
- Source independence: changed passages only; 0 passages compared, the diff adding or changing none; the arrangement was not compared again, no layer being added, removed or reordered.

## Not verifiable

- Mumford, *Abelian Varieties*, §5 (C.2, untouched): no legal copy found, as in the earlier reviews; Stacks 0B91, 0BDN and 0B9T cover the same statements.
- Hartshorne, Serre, Bosch–Lütkebohmert–Raynaud, Stichtenoth and Milne's *Jacobian Varieties*: settled as uncertified, cited by locator only.
- The description's sentence that other roadmaps consume the Jacobian "by name" is about their texts, not this head; DeligneWeightsAndPurity and AbelianVarietiesOverFiniteFields cite JacobianChallenge, CurvesOverFiniteFields at its open head does not.

## Source issues

- none

## For the human reviewers

- none
