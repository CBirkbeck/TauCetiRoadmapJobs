# Review of K2SymbolsBrauerPartII (pull request #1432 at e96bc52)

**Verdict:** needs changes

## R01 (P3) — The description's validation sentence is false after the merge of main

**Location** Pull request description, the "Validation:" paragraph: "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim** The merge of main moved the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d, toolchain v4.36.0-rc2). At this head the targeted build prints one more warning besides the five `sorry` warnings.

**Witness** `lake build TauCetiRoadmap.K2SymbolsBrauerPartII.Suggested` at e96bc52 prints: "Suggested.lean: imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`…". The `sorry` warnings follow at lines 54, 65, 83, 117 and 124.

**Repair** Replace "the targeted Lake build succeeds with `sorry` as the only warning" with "the targeted Lake build succeeds; its warnings are the five `sorry`s and Lake's notice that `import Mathlib` is designed for the module system". Do not add `module` to `Suggested.lean`.

## R02 (P3) — The AI-assistance sentence leaves out the models behind the repair commits

**Location** Pull request description: "AI assistance: codex (gpt-6.1-sol) ported the package after 0 independent review rounds and 2 red-team rounds on the job board (Fable and Astra); this draft awaits human review."

**Claim** CONTRIBUTING.md lines 54–56 ask the description to name the models used. This head's commit names Claude Opus 5.5 as a co-author, and the description does not name that model. Three earlier repair commits name Claude Fable 5.1, but the description gives Fable only a red-team role.

**Witness** Co-Authored-By trailers from `git log origin/main..HEAD -- TauCetiRoadmap/K2SymbolsBrauerPartII`: e96bc520 names Claude Opus 5.5; d3eace43, a495ae1e and 158e932e name Claude Fable 5.1.

**Repair** Replace the sentence with: "AI assistance: codex (gpt-6.1-sol) ported the package after 2 red-team rounds on the job board (Fable and Astra); the later review-repair commits name Claude Fable 5.1 (three commits) and Claude Opus 5.5 (one commit) as co-authors; this draft awaits human review."

## Previous findings

- R01 — repaired: `Suggested.lean` lines 68–74 conclude `∃ f : (L ⊗[F] SymbolAlgebra F m ζ a b) →ₐ[L] Matrix (Fin m) (Fin m) L`. The generators map to `diagonal (α * (algebraMap F L ζ)⁻¹ ^ i)` and the forward shift with wrap `b`, with `Function.Bijective f`. The gate gives `statement-hygiene=0`.
- R02 — repaired: the summary now reads "Over nonarchimedean local fields it proves the signed formula … ; over every field of characteristic other than two it identifies `conicSymbol` with `hilbertSymbol` on units, and proves a total real criterion."

## Verified sound

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| `symbolAlgebra_split`, generator images (repair of the previous R01) | ℝ, m=2, a=b=−1, L=ℂ, α=i | X↦diag(i,−i), Y↦rows (0,−1),(1,0); X²=Y²=−I; YX=rows (0,i),(i,0)=−XY; the 4 monomials span 4 dimensions | `SymbolRel` holds; f is bijective over ℂ |
| same, all orders | the corner test's d=1 runs, which are §2.2's matrices: m=2,3,4,6; ζ=e^(2πik/m) for k=1 and m−1; α=1.3−0.4i, b=−0.7+1.9i | \|X^m−a\|≤3.2e−14, \|Y^m−b\|=0, \|YX−ζXY\|≤4.0e−15; the X^iY^j span m² | the images satisfy the relations; the map is injective |
| `symbolAlgebra_matrix_corner`, new generator images | (m,d)=(4,2),(6,2),(6,3),(8,4),(9,3); k=1 and m−1; inner algebra realized by its d×d split matrices | \|X^m−a\|≤4.1e−13, \|Y^m−b\|=0, \|YX−ζXY\|≤9.3e−15; the monomials span 16, 36, 36, 64, 81 | f exists and is injective; bijective since s²d²=m² |
| same, wrong model: backward shift with wrap Y' | (4,2), (6,2), (6,3); k=1 | \|YX−ζXY\| = 5.51, 4.77, 4.77 | excluded by the stated image of Y |
| same, d=m (s=1) | Lean `Matrix.of` at s=1 | entry (0,0): `0 = 0+1` is false and `0 = 0 ∧ 0+1 = 1` is true, so the entry is Y'; X↦(X'); c=α^m=a | reduces to the presentation (§2.3, Check 3) |
| same, d=1 | inner algebra A_(ζ^m)(c,b) = A_1(c,b) | X'=c, Y'=b, Y'X'=X'Y'; X↦diag(ζ^(−j)c), Y↦shift with wrap b | equals §2.2 at α=c (Check 2) |
| §2.3 Check, m=4 | ζ²=−1, s=2, entry (0,1) | YX=Y'ζ⁻¹X'=ζ⁻¹ζ²X'Y'=ζX'Y'; ζXY=ζX'Y'; backward shift: ζ⁻¹X' against ζX', ratio ζ²=−1 | the Check is true and separates the two shifts |
| §2.3 API, matrix units | 0≤j,k<s, M the forward shift | M^j e₀=e_j; row 0 of M^(−k) is e_kᵀ; e↦E₀₀, since X^d↦diag(ζ^(−jd)c), which equals c only at j=0 | Y^j e Y^(−k) ↦ E_jk, as stated |
| README line 50 at the new pin | Tau Ceti 2fd255d | `KummerCoeff` = `Additive (rootsOfUnity n (SeparableClosure K))` (Coefficients.lean:134); `kummerMap (hn : IsUnit (n:K)) : Kˣ →* Multiplicative (H1 …)` (Kummer.lean:250) | as stated |
| Description validation sentence (R01) | targeted `lake build` at e96bc52 | five `sorry` warnings plus the module-system warning | the claim is false |

The rows for the untouched statements (`symbolAlgebra_isCentralSimple`, `conicSymbol`, `conicSymbol_real_eq_neg_one_iff` and `conicSymbol_eq_hilbertSymbol`) stand as in the previous review, of `d3eace4`.

- Gate, my run at e96bc52 with `--build`: every count is 0, including `statement-hygiene`, `outside-folder` and `build`: OK. The worktree is clean. The diff outside the folder against `origin/main` is empty, so the merge of main left the branch's `lake-manifest.json` equal to main's.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on a scratch copy with `#check @` for all 8 declarations exits 0. Its only warnings are the five `sorry`s. The elaborated types match `scratch/signatures.md`, and no binder is lost.
- Pins moved from a91d3aa/6b7abb3 to 2fd255d/1b1ccf4, and README line 50 names the new hashes. 19 library declarations cited at README lines 23 and 47–58 and in §1.3 elaborate at these pins in one scratch file. Opened at the pin: Kummer.lean:250/278/322/330, Cup/Product.lean:567/767, Brauer/Torsion.lean:67/114/128, Local/Symbol.lean:207, Comparison.lean:274/298, CupProduct.lean:320, HilbertSymbol/Basic.lean:57.
- Duplication at the new pins: neither Mathlib 1b1ccf4 nor Tau Ceti 2fd255d has a degree-m cyclic algebra, a matrix corner or a K₂ carrier. Tau Ceti has the quaternion `ℍ[R,a,b]` and the cohomological carry class in `Brauer/CharacterCarry.lean`, which is new since a91d3aa. The docstring's list of headlines that cannot be stated still holds.
- Sources: no seeded target falls in the changed passages. The changed §2.3 text rests on Weibel III.6.9 at weibel line 13858 (p.240, the relation yx=ζxy used here), Lemma 6.9.1 at line 13884 (p.241) and Remark 6.10.4 at line 14004 (p.243). The page footers at lines 13868, 13928, 13977 and 14047 confirm these pages.
- Pull-request text: I read the title, the 3 summary paragraphs and the 5 prose paragraphs against e96bc52; 2 sentences fail (R01, R02). README lines 112 and 495 and the module docstring now name all five stated headlines.
- Remark on untouched text, no change asked: §1.5 (README line 228) takes coefficient base change from its suppliers. Tau Ceti 2fd255d now has `TauCeti.kummerCoeffBaseChange` on `KummerCoeff` (Kummer.lean:711), which is absent at a91d3aa.

Overlap check: read K2SymbolsBrauer (open head), KTheoryFiniteLocalFields, ArithmeticKTheory, EllipticKTheory and K3BlochGroups (open), and QuadraticFormInvariants (main). A search across main and the open heads for "symbol algebra", "matrix corner", `SymbolAlgebra` and `conicSymbol` also turned up QuaternionArithmetic, which covers only Mathlib's degree-two `ℍ[F,a,b]`. K2SymbolsBrauer §10.32a keeps the prime-degree local function-field presentation and states no corner. The §2.3 corner has no other owner, and the changed passages share nothing else with these roadmaps.

Source independence: changed passages only. I compared 6 passages (README line 50, line 112, §2.3 API bullets 3 and 5, §2.3 Checks 1–2, and the two changed docstrings) with 1 source, weibel at lines 13858 and 14004; no wording is shared. The largest share is weibel's, 21 of 50 locators, carried from the review of d3eace4. No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- none. The earlier item, the printed page of Weibel III.6.10.1, is now settled: the footer at weibel line 13977 puts it on p.242.

## Source issues

- none

## For the human reviewers

- none
