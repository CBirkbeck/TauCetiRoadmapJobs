# Review of QuaternionicModularForms (pull request #934 at cd50077)

**Verdict:** needs changes

Incremental re-review of the 11 lines changed since 1261875. The change is confined to §2.6 of `TauCetiRoadmap/QuaternionicModularForms/README.md`: the component count of Williams's descent is corrected from the class group to the ray class group modulo `𝔫`, with a computed instance (`F=ℚ(i)`, `𝔫=3𝒪_F`). Both additions are correct and recomputed below. The gate passes on every check, the acceptance file elaborates with no output, the dependency check reports no problem, and nothing outside the folder changed. The one finding of the previous review is on `Suggested.lean`, which this head does not touch, so it stands unchanged.

## R01 (P3) — The acceptance file still names a Tau Ceti substitution and a file that do not exist at the pin

**Location:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:14`–`16`: “and substitutes polynomials without constant term and with unit-ball coefficients into the latter (`MvPowerSeries.restrictedSubst`, `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Subst.lean`; …)”.

**Claim:** the pinned Tau Ceti substitutes such polynomials into `MvPowerSeries.IsRestricted.subring (fun _ ↦ 1)` through a declaration `MvPowerSeries.restrictedSubst` in that file.

**Witness:** at the pinned Tau Ceti (`a91d3aa`, the revision of `lake-manifest.json` and the checkout's `HEAD`, re-checked at this head) the string `restrictedSubst` occurs in no `.lean` file of Tau Ceti or Mathlib (`6b7abb3c`), and `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/` contains only `Basic.lean` and `Iterate.lean`. The file is byte-for-byte the one the previous review read (`git diff 1261875 HEAD` touches only `README.md`).

**Repair:** as in the previous review: keep the sentence naming the two carriers `PowerSeries.IsRestricted.subring 1` and `MvPowerSeries.IsRestricted.subring (fun _ ↦ 1)` (which exist, `Mathlib/RingTheory/PowerSeries/Restricted.lean:87`, `Mathlib/RingTheory/MvPowerSeries/Restricted.lean:107`, with Tau Ceti's normed-ring and completeness instances in `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean` and `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean`) and delete the clause from “and substitutes polynomials” through the file path; say that the only substitution at the pins is Mathlib's formal `PowerSeries.subst` / `MvPowerSeries.subst` under `PowerSeries.HasSubst` (nilpotent constant coefficient), so neither a Möbius transformation with constant term `b/d` nor any analytic substitution into the Tate algebra is available. The docstring's conclusion (no analytic weight action at the pins, nothing statable) is unchanged by the repair. This is the fourth head on which the name is cited.

## Previous findings

- R01 — not repaired: `Suggested.lean:14`–`16` still reads “substitutes polynomials without constant term and with unit-ball coefficients into the latter (`MvPowerSeries.restrictedSubst`, `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Subst.lean`; …)”; the file is unchanged since 1261875 and the name is absent at the pin (R01 above).

## Verified sound

**Gate and build.** The worker's gate at this head passes every check (`set_option=0 … depcheck=0 … stray-files=0 … build=0 OK`). I elaborated `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean` with `lake env lean` from the worktree: exit code 0, no output (the file declares nothing; `import Mathlib` only; no `set_option`, no `lemma`, no stand-in). `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. The ten added lines carry no process word, no LaTeX delimiter, no pull-request number, no machine path and no instruction-like text.

**Dependency check**, run with `--movable` against the merge order and main:

```text
depcheck: 237 roadmaps, 2105 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The diff adds no supplier citation; the new sentence's `*Needs:*` line (§2.4; Convention 10) names a target of this roadmap and its own Conventions. No supplier gap is declared and none is needed.

**Citations resolved at this head.**

| Citation | Where it resolves |
| --- | --- |
| Williams, Definition 1.1, p. 4 (`Ω₁(𝔫)`: `c∈𝔫Ô_K`, `a,d∈1+𝔫Ô_K`) | `williams` lines 191–198 (page-4 marker at 204 closes the page) |
| Williams, Definition 1.2, pp. 4–5 | `williams` lines 199–217 |
| Williams, Theorem 1.3, p. 5 (`h` = the class number; decomposition with `GL₂(ℂ)×Ω₁(𝔫)`) | `williams` lines 223–225, 237–242; page-5 marker at line 205 |
| §2.4 restriction to components, `Cl(U)=Fˣ\𝔸_{F,f}ˣ/det(U)` for `M₂(F)` | README lines 633–640; §2.6 line 745–746 indexes the components the same way |
| Convention 10 (absolute values on `ℂ`) | README line 130 |
| AdelicAlgebraicGroups §4.5, class sets of groups with simply connected derived group (`G(F)\G(𝔸_{F,f})/U ≃ ν(G(F))\D(𝔸_{F,f})/ν(U)`) | AdelicAlgebraicGroups at its open head, §4.5 (the “Class sets of groups with simply connected derived group” bullet), with `ν=det`, `D=GL₁` for `G=GL₂` |
| `MvPowerSeries.restrictedSubst`, `TateAlgebra/Subst.lean` | nowhere at the pin (R01) |
| README line 180, `LocallySymmetric.AutomorphicForm` (the resolver's one lead, unchanged line) | a planned name of ArithmeticLocallySymmetricSpaces at its open head (as in the previous review); not a defect |

**Headline coverage.** Unchanged: no headline is statable at the pins and the docstring names each with its missing carrier; the file declares nothing, so there is nothing to probe for padding and no signatures to compare.

**Computed adversarial pass.** New rows for the two changed statements; the rest carry forward from the review at 1261875 and, through it, 67bcbf6 and 84012cc.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §2.6: `det Ω₁(𝔫)=Ô_Fˣ∩(1+𝔫Ô_F)` | `γ=(a b; c d)` with `a,d∈1+𝔫Ô_F`, `c∈𝔫Ô_F`; `x∈Ô_Fˣ∩(1+𝔫Ô_F)` | `ad−bc≡1 mod 𝔫`, so `det Ω₁(𝔫)⊆Ô_Fˣ∩(1+𝔫Ô_F)`; `diag(x,1)∈Ω₁(𝔫)` gives equality; at `v∤𝔫` the `v`-component of `1+𝔫Ô_F` is `𝒪_v⊋𝒪_vˣ`, so the intersection with `Ô_Fˣ` is needed and gives `∏_{v∤𝔫}𝒪_vˣ×∏_{v∣𝔫}(1+𝔫𝒪_v)` | Pass |
| §2.6: component set `Fˣ\𝔸_{F,f}ˣ/det Ω₁(𝔫)` is the ray class group modulo `𝔫` | `F` imaginary quadratic (no real places); `U_𝔫=Ô_Fˣ∩(1+𝔫Ô_F)` | `𝔸_Fˣ/(FˣU_𝔫F_∞ˣ)=𝔸_{F,f}ˣ/(FˣU_𝔫)` since `F_∞ˣ=ℂˣ` has no sign condition; `𝔸_{F,f}ˣ/U_𝔫≅` fractional ideals prime to `𝔫` `×(𝒪_F/𝔫)ˣ` modulo `Fˣ`, the classical `I^𝔫/P_{𝔫,1}` | Pass |
| §2.6: kernel of `Cl_𝔫→Cl` is the cokernel of `𝒪_Fˣ→(𝒪_F/𝔫)ˣ`; count agrees with `h` exactly when onto | `1→𝒪_Fˣ→(𝒪_F/𝔫)ˣ→Cl_𝔫→Cl→1`; `𝔫=𝒪_F` | `#Cl_𝔫=h·#(𝒪_F/𝔫)ˣ/#im(𝒪_Fˣ)`, equal to `h` iff the image is everything; at `𝔫=𝒪_F`, `(𝒪_F/𝒪_F)ˣ` is the unit group of the zero ring, trivial, onto, count `h`; `F=ℚ(√−5)`, `𝔫=3𝒪_F` (`3` splits as `−5≡1 mod 3`): `(𝒪_F/3)ˣ≅𝔽₃ˣ×𝔽₃ˣ` of order `4`, image of `±1` of order `2`, `#Cl_𝔫=2·2=4≠h=2` | Pass |
| §2.6 Check: `F=ℚ(i)`, `𝔫=3𝒪_F` | `3≡3 mod 4` inert; units `±1,±i`; `h=1` | `𝒪_F/3=𝔽₉`, `(𝒪_F/3)ˣ` cyclic of order `8`; `1,−1,i,−i` reduce to `1,2,i,2i`, four distinct classes; `Fˣ\FˣÔ_Fˣ/U_𝔫=(Fˣ∩Ô_Fˣ)\Ô_Fˣ/U_𝔫=𝒪_Fˣ\(𝒪_F/3)ˣ` of order `8/4=2`; Williams's count `h=1`; at `𝔫=𝒪_F` both give `1` | Pass |
| §2.6: Williams's count is right for §0.2's `U₁(𝔫)` (consistency with the `diag(u,1)` Check) | `U₁(𝔫)`: `c≡0`, `d≡1`, `a` free | `det U₁(𝔫)=Ô_Fˣ`, component set `Cl(F)`, count `h`; `Ω₁(𝔫)⊂U₁(𝔫)` of index `#(𝒪_F/𝔫)ˣ` and the component sets differ by the cokernel above | Pass |
| Carried: §2.6 Check existence of `u≢1 mod 𝔫`; surjectivity `Ô_Fˣ→(𝒪_F/𝔫)ˣ`; negative control `ℚ(√−7)`, `𝔫=2` | as in 1261875 | `#(𝒪_F/𝔫)ˣ=∏N_i^{e_i−1}(N_i−1)`; `𝒪_F/2≅𝔽₂×𝔽₂`, unit group `{1}` | Pass (1261875) |
| Carried: §2.6 `Ω₁(𝔫)` as a kernel; Williams growth, p. 6 locator; docstring Tate-algebra carriers | as in 1261875 | as in 1261875 | Pass (1261875) |
| Carried: docstring substitution into the Tate algebra | Möbius `z↦(az+b)/(cz+d)` | no declaration at the pin; `HasSubst` needs nilpotent constant coefficient, `b/d` is not | R01 |
| Carried: §2.4 Checks, §2.6 purity, `λ` Checks, Williams twist (`1/2` vs `1/4`), Hecke factor `q_v^{k/4}`, cuspidal degrees `(1,1)`, §3.1 Hecke relation | as in 67bcbf6 | as in 67bcbf6 | Pass (67bcbf6) |
| Carried: §0.1–0.4, §1.1–1.3, §2.1–2.3, §2.5, §3.2–3.3, §4.1–4.4, §5.1–5.3 | as in 84012cc | as in 84012cc | Pass (84012cc) |

## Not verifiable

- **Gross, *Algebraic modular forms* (1999)** and **Harder (1987), §3**: paywalled, uncertified, untouched by the diff.
- **Published numbering of Williams (2017):** the arXiv text in the cache was read; pp. 4–5 are the arXiv pages.
- **Ownership against open pull requests** beyond those whose files this brief gives: not re-checked for this change, which adds no construction.

## Source issues

- **Gap** in williams at Definition 1.2, printed p. 4: the source defines cusp forms by covariance, invariance, one Casimir equation and the cuspidal integral, with no growth condition; it should include moderate growth, which the Fourier expansion of §1.2.1 presupposes; affects a stated result.
- **Error** in williams at Theorem 1.3, printed p. 5: the source says the level `Ω₁(𝔫)` decomposition has one component per ideal class; it should have one per class of `Kˣ\𝔸_{K,f}ˣ/(Ô_Kˣ∩(1+𝔫Ô_K))`, the ray class group modulo `𝔫`, since `det Ω₁(𝔫)=Ô_Kˣ∩(1+𝔫Ô_K)` by Definition 1.1 (for `K=ℚ(i)`, `𝔫=3`: two components, class number one); affects a stated result.
