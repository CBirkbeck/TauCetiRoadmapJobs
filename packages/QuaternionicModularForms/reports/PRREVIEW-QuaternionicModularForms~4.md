# Review of QuaternionicModularForms (pull request #934 at 1261875)

**Verdict:** needs changes

Incremental re-review of the 19 lines changed since 67bcbf6. The gate passes on every check (build included), the acceptance file elaborates with no output, the dependency check reports no problem, nothing outside the folder changed, and two of the three previous findings are repaired and recomputed. The one that remains is the acceptance file's docstring, which still cites a Tau Ceti declaration and a file that do not exist at the pin: this head rewrote the sentence around them, named the two Tate-algebra carriers correctly, and kept the nonexistent substitution.

## R01 (P3) — The acceptance file still names a Tau Ceti substitution and a file that do not exist at the pin

**Location:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:13`–`18`: “substitutes polynomials without constant term and with unit-ball coefficients into the latter (`MvPowerSeries.restrictedSubst`, `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Subst.lean`; …)”.

**Claim:** the pinned Tau Ceti substitutes such polynomials into the multivariate Tate algebra `MvPowerSeries.IsRestricted.subring (fun _ ↦ 1)` through a declaration `MvPowerSeries.restrictedSubst` in that file.

**Witness:** at the pinned Tau Ceti (`a91d3aa`, the revision `lake-manifest.json` records and the checkout's `HEAD`) the string `restrictedSubst` occurs in no file, `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/` contains only `Basic.lean` and `Iterate.lean`, and no file mentioning `IsRestricted` mentions a substitution, an evaluation or a composition (grep over every `.lean` of the pin). The only substitution Tau Ceti has is formal, into `MvPowerSeries` itself: `MvPowerSeries.hasSubst_pair` and `coordSpecialize` in `TauCeti/RingTheory/MvPowerSeries/Substitution.lean` (module docstring lines 47–53), built on Mathlib's `MvPowerSeries.subst`. The two carriers the new sentence names do exist: `PowerSeries.IsRestricted.subring` (`Mathlib/RingTheory/PowerSeries/Restricted.lean:87`) and `MvPowerSeries.IsRestricted.subring` (`Mathlib/RingTheory/MvPowerSeries/Restricted.lean:107`), with Tau Ceti's normed-ring and `CompleteSpace` instances at `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:65` and `:151` and `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:69` and `:138`.

**Repair:** keep the new carrier sentence and delete the clause from “and substitutes polynomials” through the file path; say instead that the only substitution at the pins is Mathlib's `PowerSeries.subst` and `MvPowerSeries.subst` (formal, with side condition `PowerSeries.HasSubst`, a nilpotent constant coefficient), so neither a Möbius transformation with constant term `b/d` nor any analytic substitution into the Tate algebra is available. The conclusion of the docstring (no analytic weight action at the pins, nothing statable) is unchanged by the repair. This is the third head on which the name is cited (previous reviews R06 and R01); the pin is `a91d3aa`, not a later Tau Ceti.

## Previous findings

- R01 — not repaired: `Suggested.lean:13`–`16` now reads “Tau Ceti has the Tate algebras `PowerSeries.IsRestricted.subring 1` and `MvPowerSeries.IsRestricted.subring (fun _ ↦ 1)` … and substitutes polynomials … (`MvPowerSeries.restrictedSubst`, `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Subst.lean`; …)”: the carriers are right, the substitution and file are still absent at the pin (R01 above).
- R02 — repaired: README lines 836–842 say such `u` exist “exactly when `(𝒪_F/𝔫)ˣ` is nontrivial, that is unless `𝔫` is a product of distinct primes of norm `2`”, and add the negative control `F=ℚ(√−7)`, `𝔫=2𝒪_F`, `𝒪_F/𝔫≅𝔽₂×𝔽₂` with trivial unit group and `Ω₁(𝔫)=U₁(𝔫)`. Recomputed below.
- R03 — repaired: README line 790 and lines 1212–1213 now read “§1.2.1, p. 6”; `williams` line 251 is the page-6 marker, line 254 the heading “1.2.1”, line 255–256 the expansion taken from Hida.

## Verified sound

**Gate and build.** The worker's gate at this head passes every check (`set_option=0 … depcheck=0 … build=0 OK`). I elaborated `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean` with `lake env lean` from the worktree: exit code 0, no output (the file declares nothing; `import Mathlib` only; no `set_option`, no `lemma`, no stand-in). `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. The changed lines carry no process word, no LaTeX delimiter, no pull-request number and no instruction-like text; the README as a whole has none of now, former, previous, removed, round, checkpoint, handoff, current.

**Dependency check**, run with `--movable` against the merge order and main:

```text
depcheck: 235 roadmaps, 2067 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The diff adds no supplier citation; the suppliers the changed passage names (ArithmeticLocallySymmetricSpaces ALS.F.6, §0.2 of this roadmap, Williams) are unchanged. No supplier gap is declared and none is needed by the change.

**Citations resolved at this head.**

| Citation | Where it resolves |
| --- | --- |
| Williams, Definition 1.1, p. 4; Definition 1.2, pp. 4–5; Theorem 1.3, p. 5 | `williams` lines 191–197, 199–217, 237–242 (unchanged since the previous review) |
| Williams, §1.2.1, p. 6 (the Fourier expansion) | `williams` line 251 (page-6 marker), 254 (heading), 255–256 (expansion from Hida): the new page is right |
| `PowerSeries.IsRestricted.subring`, `MvPowerSeries.IsRestricted.subring` | `Mathlib/RingTheory/PowerSeries/Restricted.lean:87`, `Mathlib/RingTheory/MvPowerSeries/Restricted.lean:107` (require `[IsUltrametricDist R]`); Tau Ceti's `NormedRing` and `CompleteSpace` instances at `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:65`, `:151` and `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:69`, `:138` |
| `MvPowerSeries.restrictedSubst`, `TateAlgebra/Subst.lean` | nowhere at the pin (R01) |
| Mathlib `PowerSeries.subst`, `PowerSeries.HasSubst` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:157`, `:39` (as in the previous review; unchanged) |
| README line 180, `LocallySymmetric.AutomorphicForm` (the resolver's one lead, unchanged line) | ArithmeticLocallySymmetricSpaces at its open head, README lines 996 (“Define `LocallySymmetric.AutomorphicForm`”) and 1033–1039 (its API): a planned name of the supplier, not a library declaration, so the lead is not a defect |

**Headline coverage.** Unchanged: no headline is statable at the pins and the docstring names each with its missing carrier; the only change to the file is the sentence of R01. The empty acceptance file remains the correct form; nothing to probe for padding.

**Computed adversarial pass.** New rows for the statements the diff changes; the rest carry forward from the review at 67bcbf6 and, through it, 84012cc.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §2.6 Check: existence of `u` with `u≢1 mod 𝔫` | `𝔫=𝔭₁^{e₁}⋯𝔭_r^{e_r}`, `N𝔭_i=N_i` | `#(𝒪_F/𝔫)ˣ=∏N_i^{e_i−1}(N_i−1)`; factors `(N,e)↦` `(2,1)↦1`, `(2,2)↦2`, `(3,1)↦2`, `(3,2)↦6`, `(4,1)↦3`; the product is `1` exactly when every `e_i=1` and every `N_i=2`; the empty product `𝔫=𝒪_F` gives the zero ring, unit group trivial, and the Check's last clause “both are `GL₂(Ô_F)`” agrees | Pass |
| §2.6 Check: surjectivity `Ô_Fˣ→(𝒪_F/𝔫)ˣ` | `𝔫=𝔭²`, `𝒪/𝔭²` local | `Ô_F/𝔫Ô_F=𝒪_F/𝔫`, a finite product of local rings; a unit of the quotient lifts to a unit of each local factor `𝒪_{F,𝔭}`, which is a unit of `Ô_F` | Pass |
| §2.6 negative control `F=ℚ(√−7)`, `𝔫=2𝒪_F` | `𝒪_F=ℤ[w]`, `w²=w−2`; `−7≡1 mod 8` | `2` splits; `𝒪_F/2=𝔽₂[w]/(w²−w)≅𝔽₂×𝔽₂`, `4` elements; products `(a+bw)(c+dw)=(ac−2bd)+(ad+bc+bd)w` mod `2` equal `1` only for `a+bw=1`: unit group `{1}`; so `det≡1` on all of `U₁(𝔫)` and `Ω₁(𝔫)=U₁(𝔫)` | Pass |
| §2.6 `Ω₁(𝔫)` as a kernel (carried) | `γ∈U₁(𝔫)` | `det γ≡a`; index `#(𝒪_F/𝔫)ˣ`; both `GL₂(Ô_F)` at `𝔫=𝒪_F` | Pass (67bcbf6) |
| §2.6 Williams's space with moderate growth, locator p. 6 | five conditions plus growth | `williams` lines 199–217 (no growth condition), 254–256 (Fourier expansion from Hida on page 6) | Pass |
| Docstring: Tate algebra carriers | `c=1`, `σ=Unit` | `PowerSeries.IsRestricted.subring 1 = MvPowerSeries.IsRestricted.subring (fun _ ↦ 1)` by definition (`Mathlib/RingTheory/PowerSeries/Restricted.lean:87`); Tau Ceti's instances transport along it (`TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:71`, `:140`) | Pass |
| Docstring: substitution into the Tate algebra | Möbius `z↦(az+b)/(cz+d)` | no declaration at the pin; Mathlib's `HasSubst` needs nilpotent constant coefficient, `b/d` is not | R01 |
| Carried: §2.4 Checks (`𝒜_ℂ(U,1)` on `Cl(UẐˣ)`, `U₁(13)` control, Eichler control `h=2`, mass `5/12`) | as in 67bcbf6 | as in 67bcbf6 | Pass (67bcbf6) |
| Carried: §2.6 purity (infinitesimal character, pairings, route), `λ` Checks, Williams twist, Hecke factor, cuspidal degrees | as in 67bcbf6 | `a+a′−b−b′=−2` impossible; `a−b=a′−b′`; `1/2` vs `1/4`; `q_v^{k/4}`; `(1,1)` | Pass (67bcbf6) |
| Carried: §3.1 Hecke relation and normalisation | `q∈{2,3,5}` | `(q+1)²=(q²+q)+(q+1)` | Pass (67bcbf6) |
| Carried: §0.1–0.4, §1.1–1.3, §2.1–2.3, §2.5, §3.2–3.3, §4.1–4.4, §5.1–5.3 | as in 84012cc | as in 84012cc | Pass (84012cc) |

## Not verifiable

- **Gross, *Algebraic modular forms* (1999)** and **Harder (1987), §3**: paywalled, uncertified, untouched by the diff.
- **Published numbering of Williams (2017):** arXiv v2 was read; p. 6 is the arXiv page.
- **Ownership against open pull requests** beyond those whose files this brief gives: not re-checked for this change, which adds no construction.

## Source issues

- **Gap** in williams at Definition 1.2, printed p. 4: the source defines cusp forms by covariance, invariance, one Casimir equation and the cuspidal integral, with no growth condition; it should include moderate growth, which the Fourier expansion of §1.2.1 presupposes; affects a stated result.
- **Error** in williams at Theorem 1.3, printed p. 5: the source says the level `Ω₁(𝔫)` decomposition has one component per ideal class; it should have one per class of `Kˣ\𝔸_{K,f}ˣ/(1+𝔫Ô_K)ˣ`, since `det Ω₁(𝔫)=1+𝔫Ô_K` by Definition 1.1; affects a stated result.
