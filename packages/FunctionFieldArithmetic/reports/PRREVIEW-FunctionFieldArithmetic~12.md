# Review of FunctionFieldArithmetic (pull request #1474 at 4cac1f8)

**Verdict:** needs changes

The folder is unchanged since the review of `4cac1f8` and nothing in it is asked to change. The three findings are all in the pull request's description, which this round reads against the head for the first time.

## R01 (P3) — the description names a consumer roadmap that exists nowhere

**Location** Pull request description, summary block, *Why Tau Ceti wants it*: "the zeta functions serve CountingBundlesAndHallAlgebrasOfCurves, FiniteFieldsAndCharacterSums and GlobalGaloisDeformationsPartII."

**Claim** No roadmap is called FiniteFieldsAndCharacterSums, and GlobalGaloisDeformationsPartII consumes the Chebotarev theorem of §5.8, not the zeta functions.

**Witness** `roadmaps grep --fixed FiniteFieldsAndCharacterSums`: "no match on main or in any open roadmap pull request". `TauCetiRoadmap/FunctionFieldArithmetic/README.md` lines 3613–3620 list the Layer 5 consumers; line 3620: "GlobalGaloisDeformationsPartII: degree-sensitive Chebotarev (§5.8)".

**Repair** Replace the clause by: "the zeta functions serve CountingBundlesAndHallAlgebrasOfCurves, CurvesOverFiniteFields, AbelianVarietiesOverFiniteFields and HyperellipticCurves, and degree-sensitive Chebotarev (§5.8) serves GlobalGaloisDeformationsPartII."

## R02 (P3) — the description gives Layer 7 a consumer that no roadmap states

**Location** Pull request description, summary block, *Why Tau Ceti wants it*: "Layers 6–7 feed the excursion construction and higher Siegel–Weil formula of GlobalShtukasAndFunctionFieldLanglands".

**Claim** GlobalShtukasAndFunctionFieldLanglands consumes Layer 6 only, and states no higher Siegel–Weil formula; no roadmap, on main or open, cites any section of Layer 7.

**Witness** GlobalShtukasAndFunctionFieldLanglands README (open head) line 114 ff. consumes §0.3, §2.2, §§5.1, 5.3, §5.8, §§6.1–6.4; the word "Siegel" does not occur in it. `roadmaps grep 'FunctionFieldArithmetic §§?7'`: no match. This README's *Downstream consumers* (lines 3594–3620) names no consumer of §7.

**Repair** Replace the clause by: "Layer 6 feeds the excursion construction of GlobalShtukasAndFunctionFieldLanglands and its Part II; Layer 7 states the Feng–Yun–Zhang coefficient formula for unitary Siegel–Eisenstein series, which no roadmap consumes yet".

## R03 (P3) — the description misstates what ClassFieldTheory lacks and what reaches every local field

**Location** Pull request description, summary block: "ClassFieldTheory stops at prime-to-p existence and omits Lubin–Tate and Artin–Schreier–Witt theory; Layers 3–4 fill that gap and extend local Kronecker–Weber and injectivity of the Artin map to every nonarchimedean local field."

**Claim** ClassFieldTheory has full existence in characteristic zero; the head states existence and injectivity for every nonarchimedean local field, and local Kronecker–Weber for `char K = p` only.

**Witness** README lines 1265 and 1294 (Layer 4 and §4.1 statements are for `char K = p`), 1379–1395: only `localAbelianExistence_all` and `injective_artinMap_all` are "for every nonarchimedean local field". ClassFieldTheory README (main) lines 99–102: existence "in full in characteristic zero".

**Repair** Replace the sentence by: "In equal characteristic ClassFieldTheory stops at prime-to-p existence and omits Lubin–Tate and Artin–Schreier–Witt theory; Layers 3–4 fill that gap with p-primary existence and local Kronecker–Weber in characteristic p, and so state local abelian existence and injectivity of the Artin map for every nonarchimedean local field."

## Previous findings

The previous review, of this same head, was an acceptance with no finding of its own. It recorded one point about the description as outside the folder:

- R04 of the review before it (the description names FiniteFieldsAndCharacterSums) — not repaired: the description still reads "the zeta functions serve CountingBundlesAndHallAlgebrasOfCurves, FiniteFieldsAndCharacterSums and GlobalGaloisDeformationsPartII". This round reads the description, so it is R01 above.

## Verified sound

| Statement | Instances | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| `zeta_rationality` (§5.3; the description's "rationality, functional equation, `L(1) = h`") | `y² = x³ − x` over `𝔽₃`, `g = 1` | `N₁ = 4` (three affine points with `y = 0`, one at infinity); `a₁ = 4 − 4 = 0`, `L = 1 + 3T²`; `L(1) = 4 = h = N₁`; `a₂ = 3·a₀`; `3T²·L(1/(3T)) = 3T² + 1`; `N₂ = 10 + 6 = 16`, the known count over `𝔽₉` | Pass | None |
| §4.2 existence and Kronecker–Weber, against the description (R03) | `K = ℚ₂`, a subgroup of index 2; `K = 𝔽_p((T))`, index `p` | `ℚ₂`: the pinned `localAbelianExistence` of ClassFieldTheory Layer 8 already gives the class field, so "stops at prime-to-p" fails; `𝔽_p((T))`: only `localAbelianExistence_all` gives it. `localKroneckerWeber` stands under the Layer 4 hypothesis `char K = p` | README sound; description wrong | R03 |
| §5.8 and Layer 7 consumers, against the description (R01, R02) | citations of §5.8 and §7 at the open heads | GlobalGaloisDeformationsPartII names this roadmap on 13 lines, 12 times as §5.8 and once in the contract heading, and cites no other section; citations of §7.x in any roadmap: 0 | README sound; description wrong | R01, R02 |

The rows of the previous review for the untouched statements stand as in that review, of `4cac1f8`.

- The folder changed by 0 lines since the previous review; the diff outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Gate, rerun on this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, every counter 0; the worker's run adds `build=0`.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 244 roadmaps, 2239 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration, `lake env lean` on `Suggested.lean`: 16 `declaration uses sorry` warnings and nothing else.
- Description sentences checked against the head and found right: the end theorems (README lines 21–24), Hess without separability over any constant field (lines 757–766, 857–860), Artin–Schreier–Witt at every length with `p = 2` (line 1057), Hermitian densities in characteristic two (lines 167, 3334), Kronecker–Weber from Hasse–Arf (line 1439), ramified inducing characters (lines 2995–2998), `FormalGroup` in Mathlib (`Mathlib/RingTheory/FormalGroup/Basic.lean:57`), the three files of the folder, and "adds a roadmap" (not on main).
- Cross-roadmap citations resolved this round: 6 consumer roadmaps at their open heads (GlobalShtukasAndFunctionFieldLanglands and its Part II, CountingBundlesAndHallAlgebrasOfCurves, GlobalGaloisDeformationsPartII, CurvesOverFiniteFields, CharacterSumsOverFiniteFields) and ClassFieldTheory on main. No source locator was reopened: no passage changed.
- Overlap check: read AlgebraicCurves, ClassFieldTheory, GlobalShtukasAndFunctionFieldLanglands; nothing shared (`p`-primary equal-characteristic existence is handed to this roadmap by ClassFieldTheory, main README lines 101–102 and 1536; the overlap report lists no changed, dropped or revision-only id).
- Remark, no change asked: the README's *Downstream consumers* names no consumer for Layer 7, which agrees with R02.

Source independence: changed passages only; 0 passages changed in the folder, so none compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "0 independent review rounds and 2 red-team rounds": a statement about the job board, not about the head; not checked.
- **roquette** (waived), **hess**, **goss**, **rosen**, **stichtenoth**, **sga4half** (uncertified): settled, cited by locator only; not reopened.

## Source issues

- none

## For the human reviewers

- none
