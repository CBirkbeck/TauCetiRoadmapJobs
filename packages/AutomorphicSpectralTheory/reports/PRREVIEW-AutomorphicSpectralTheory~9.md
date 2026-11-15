# Review of AutomorphicSpectralTheory (pull request #925 at 759fa5b)

**Verdict:** accepted

No findings. Incremental re-review of the 24 README lines changed since `2920b0d`, and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: the description now lists "Five suppliers are still open and merge first" with sections for all five, ALS.0.2 and ALS.F.1 included, and AdelicAlgebraicGroups under "The other suppliers are on main".
- R02 — repaired: line 614 reads "*Needs:* §0.26; §0.29; §§0.31–0.34; …"; line 642 reads "*Needs:* §0.26; §§0.32–0.33; …". §0.34 no longer invokes the differential equation, so omitting §0.31 there is right.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.34 (reworded): `t^s` coefficients of the series of §0.32 and §0.33 | §0.32 at `m=n=0`; §0.33 at `r=0` with `Γ(2s)=2^{2s−1}Γ(s)Γ(s+½)/√π` | §0.32: `2πe(μ/4)Γ(2s)Γ(s)/(Γ(2s)Γ⁺Γ⁻)`. §0.33: `π^{3/2}2^{2−2s}·2^{2s−1}Γ(s)/√π=2πΓ(s)` over `Γ⁺Γ⁻`. Equal. | true | none |
| §0.34: `t^{s+1}` coefficient of §0.32 | `(m,n)=(1,0),(0,1)`; `μ=s` | `(1,0)`: `−Γ(s)/(Γ(2s)Γ((s+μ)/2+1)Γ((s−μ)/2))`. `(0,1)`: the same with `+`, by `Γ(s+1)/Γ(2s+1)=Γ(s)/(2Γ(2s))`. Sum `0`; at `μ=s` each is `0`. | true | none |
| §0.30 route after the sentence moved out of §0.34 | Frobenius for `f″+(1−s(s−1)/t²)f=0` at exponent `s` | `aₙ·n(2s+n−1)=−aₙ₋₂`; `n(2s+n−1)≠0` for `Re s>0`, `n≥1`; so `a₁=0` and `c₀` fixes the solution. §0.30's introduction states this step. | route stated once, in §0.30 | none |
| *Needs:* of §§0.30, 0.34 (changed) | cycle search | §0.30 → 0.29, 0.31–0.34; §0.34 → 0.32–0.33; §§0.29, 0.31–0.33 → §§0.26–0.27, Mathlib, AnalyticNumberTheoryPartI §3.23b only. | acyclic | none |
| §6.29 introduction (changed consumer sentence) | *Needs:* of §§3.16, 3.17 | Line 2179 (§3.16): "§6.29; §6.33; §3.15; §1.10a". Line 2186 (§3.17): "§6.29; §3.14; §3.15; §1.10a". | agrees | none |
| §6.29 `family_product_formula` (sample) | Yu22 Prop. 4.2.3; `GL₂`, `d≡1` | Yu22 line 1139 (p.23), proof line 1148 (p.24): same hypothesis, `(cd)_M=Σ_L c_M^L d_L`. With `d≡1`: `d_L=0` for `L≠G`, `d_G=1`, giving `c_M=c_M^G`. | locator and statement exact | none |
| §2.23 heading (source label removed) | body locator | Line 1824 keeps "([DIT16], (8.3), p.973, citing Fay [`20`, Thm 3.1, p.173])". | locator kept | none |
| §2.24 `Modular.green_kernel_continuation` (heading changed) | `N=1`, `N=2` | `N=1`: `−4π/(π/3)=−12`, index 1. `N=2`: index 3, `−12/3=−4`; product form `−12·½·(3/2)⁻¹=−4`. | true | none |
| Headings of §§0.35–0.37, 1.23, 1.24, 1.26 (labels removed) | citations of these sections from other roadmaps | GrossZagierAndArithmeticHeights lines 129, 3836, 4328, 4370 cite §§0.35, 0.37–0.38, 2.23–2.25 by number only. | none broken | none |

The rows for statements this diff leaves untouched stand as in the previous review, of `2920b0d`.

- **Gate** on `759fa5b` (the worker's run adds `build=0`; `git diff --stat origin/main...HEAD` outside the folder is empty):
  ```
  gate AutomorphicSpectralTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
- **Dependency check:** `depcheck: 247 roadmaps, 2250 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` exits 0; the only warnings are `declaration uses 'sorry'` at lines 42 and 84. `Suggested.lean` is unchanged since `2920b0d`, so the signature comparison, headline list and one-tactic probe stand.
- **Title and description against the head:** the title equals the README's first heading. The folder holds README, `Suggested.lean` and `metadata.toml`, with five Lean declarations, none removed. The five suppliers named as open (ArithmeticGaloisRepresentations, ArithmeticGaloisDuality, ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactors) are open new-roadmap pull requests and absent from main (`8ad4192`). Every roadmap named as on main has its folder there. Every section id the description lists occurs in the README (AL.R.2 and AL.3.9.2 included), and the README names no supplier roadmap that the description omits.
- **Description claims opened at the pin:** Tau Ceti `TauCeti/Analysis/Complex/Pick/Nevanlinna` and `LinearPMap.resolvent` (README lines 87, 1790); tempered packets as standing hypotheses (line 1618); full `K_∞` (lines 29, 2823); normal tower (line 3724).
- **3 source locators checked against the text:** Yu22 Proposition 4.2.3 (line 1139), Lemme A.2 (line 4565), Lemme A.3 (line 4586).
- **Remark on untouched text** (no change asked): the bodies of §§0.36–0.37 still quote source display numbers (2.7)–(2.9) inline; the description's "(UO-A01–UO-A02)" does not mention UO-A07, which README line 9 also names.

Overlap check: read AutomorphicSpectralTheoryPartII, AutomorphicLFunctionsAndLocalFactors, AnalyticNumberTheoryPartII; nothing shared in the changed passages (the Whittaker cycle route and the `(G,M)`-family identities are owned here only).

Source independence: changed passages only; 2 passages compared with 1 source (Yu22), none shared; largest share Yu22, 65 of 313 locators; the diff adds, removes and reorders no layer, so the contents were not compared again. DIT16 could not be read.

## Not verifiable

- [DIT16], Appendix A, pp.983–985 and (8.3), p.973 (§§0.30–0.34, 2.23; sample targets): the sources service refuses the Annals URL (host in no licence class) and found no other legal copy. The coefficients were recomputed instead (rows above).
- [GZ86] (§0.35; heading label only changed): recorded as uncertified; cited by locator.

## Source issues

- none

## For the human reviewers

- DIT16 carries 24 locators and has no entry in the package `sources.toml`; the README links the publisher's PDF on the Annals site, a host the sources service places in no licence class. Its text was not read in this or the previous round.
