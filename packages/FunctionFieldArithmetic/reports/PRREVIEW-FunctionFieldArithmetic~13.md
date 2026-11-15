# Review of FunctionFieldArithmetic (pull request #1474 at 4cac1f8)

**Verdict:** accepted

No finding. The folder is unchanged since the review of `4cac1f8`; the description changed, and every sentence of its present text was read against the head.

## Previous findings

- R01 — repaired: the description now reads "The zeta functions serve CountingBundlesAndHallAlgebrasOfCurves, CurvesOverFiniteFields, AbelianVarietiesOverFiniteFields and HyperellipticCurves; degree-sensitive Chebotarev (§5.8) serves GlobalGaloisDeformationsPartII."
- R02 — repaired: "Layer 6 feeds the excursion construction of GlobalShtukasAndFunctionFieldLanglands and the Ramanujan weights of its Part II. … No other roadmap consumes Layer 7."
- R03 — repaired: "In equal characteristic ClassFieldTheory stops at prime-to-p existence …; Layers 3–4 add p-primary existence and local Kronecker–Weber in characteristic p, so local existence and injectivity of the Artin map hold for every nonarchimedean local field."

No repair introduced a new problem.

## Verified sound

| Statement | Instances | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| `zeta_rationality` (§5.3; the description's "rationality and the functional equation, with L(1) = h and recovery of the L-polynomial from g point counts") | `y² = x³ + x + 1` over `𝔽₅`, `g = 1` | `x = 0, 2, 3, 4` give two points each, `x = 1` none, one at infinity: `N₁ = 9`. `P.coeff 1 = 9 − 6 = 3`, `P = 1 + 3T + 5T²`; `P.eval 1 = 9 = h = N₁`; leading coefficient `5 = q^g`; `5T²·P(1/(5T)) = P`; `N₂ = 26 − (3² − 10) = 27 = 9·3` | Pass | None |
| `localAbelianExistence_all` (§4.2; the description's "local existence … for every nonarchimedean local field") | `K = 𝔽₂((T))`, open subgroups of index 2 containing `U^(2)` | `Kˣ/U^(2) ≅ ℤ × 𝔽₂`, so 3 such subgroups; 3 quadratic extensions of conductor ≤ 2: the unramified one and `y² + y = 1/T`, `y² + y = 1/T + 1` (break 1, conductor 2). Index 2 = `p`, outside ClassFieldTheory's prime-to-`p` case | Pass | None |
| Consumers named in the description | citations of this roadmap at the open heads | CountingBundlesAndHallAlgebrasOfCurves cites §§5.1, 5.3, 5.4; AbelianVarietiesOverFiniteFields §§5.3–5.4; HyperellipticCurves §§5.1, 5.3, 5.6; CurvesOverFiniteFields §5.1 ff.; GlobalShtukasAndFunctionFieldLanglandsPartII §§6.2–6.6; citations of §7 or Layer 7 anywhere: 0 | Description agrees | None |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `4cac1f8`.

- The folder changed by 0 lines since `4cac1f8`; the diff outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`, as the description says.
- Gate, rerun on this head: every counter 0, `OK` (the worker's run adds `build=0`).
- Dependency check: `depcheck: 241 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration, `lake env lean` on `Suggested.lean`: 16 `declaration uses sorry` warnings and nothing else.
- Description sentences checked against the head, all supported: the five end theorems (README lines 21–24); `ℤ[1/p]`-coefficients (lines 74, 2771, 2790); Yoshida's route, the norm groups and Kronecker–Weber from Hasse–Arf (lines 1434–1441); Hess without separability (lines 761, 857–860); Artin–Schreier–Witt with `p = 2` (line 1057); Hermitian densities in characteristic two (lines 167, 3334); ideles, adelic analysis and Picard objects taken from ArithmeticGaloisDuality, AutomorphicLFunctionsAndLocalFactors and the Picard suppliers (lines 84–110, 631); every effective modulus and enlarged constant fields (lines 106, 116); ramified inducing characters (lines 2994–2998); "adds a roadmap" (the folder is not on main).
- Cross-roadmap citations resolved this round: 7 consumer roadmaps at their open heads (the five of the table, GlobalShtukasAndFunctionFieldLanglands and GlobalGaloisDeformationsPartII) and ClassFieldTheory on main. No source locator was reopened: no passage changed.
- Overlap check: read AlgebraicCurves, ClassFieldTheory, AdelicAlgebraicGroups, AutomorphicLFunctionsAndLocalFactors, GlobalShtukasAndFunctionFieldLanglands; nothing shared (`p`-primary equal-characteristic existence is handed to this roadmap by ClassFieldTheory; the overlap report lists no changed, dropped or revision-only id and no roadmap close in results or headings).

Source independence: changed passages only; 0 passages changed in the folder, so none compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "0 independent review rounds and 2 red-team rounds": a statement about the job board, not about the head; not checked.
- **roquette** (waived), **hess**, **goss**, **rosen**, **stichtenoth**, **sga4half** (uncertified): settled, cited by locator only; not reopened.

## Source issues

- none

## For the human reviewers

- none
