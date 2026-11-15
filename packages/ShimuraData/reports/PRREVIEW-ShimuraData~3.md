# Review of ShimuraData (pull request #1038 at b4aa112)

**Verdict:** needs changes

Incremental re-review of the 6 lines changed since `15b9daf` (three paragraphs of §4.6 in `TauCetiRoadmap/ShimuraData/README.md`) and of the pull request's title and description. The folder's change is sound; both findings are in the description, which was written for the first head of the branch.

## R01 (P3) — The description's account of `Suggested.lean` is that of an earlier head

**Location:** pull request description, second paragraph of prose: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README."

**Claim:** At this head `Suggested.lean` states no definition and one theorem; the description does not say that every other headline theorem is not statable at the pins.

**Witness:** `TauCetiRoadmap/ShimuraData/Suggested.lean` at `b4aa112`: 62 lines, 0 definitions, 1 theorem (`kostantInvolution`, line 50). At the branch's first commit `035c505` it had 17 definitions, 26 theorems and 33 examples.

**Repair:** Replace the sentence by: "This pull request adds the roadmap folder `TauCetiRoadmap/ShimuraData` (README, `Suggested.lean`, `metadata.toml`). `Suggested.lean` states one headline theorem, the Kostant opposition involution `kostantInvolution` (§3.13), on Tau Ceti's Coxeter parabolic subgroups; the other headline results (the connected-datum lift, the centre and Levi identities, the Iwahori neatness criterion) are not statable at the pins, and its module docstring names the carrier each one lacks. Every target is in the README."

## R02 (P3) — "red-team passes to follow" is contradicted by the branch

**Location:** pull request description, Validation paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** The passes are in the branch already, and they changed the roadmap; the sentence describes the head before them.

**Witness:** Commits `8e6b807c`, `98a9e807`, `bf2c1dd9`, `286dffad` of this branch are titled "ShimuraData: red-team repairs (…)"; `15b9daf6` is "review repairs", `b4aa1123` a rewording.

**Repair:** Replace the sentence by: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; four author-side red-team passes and the repairs of two AI reviews are included in this head."

## Previous findings

- none: the previous report (of `15b9daf`) was an acceptance with no finding; the five findings of the review before it (R01–R05) were recorded there as repaired, and the 6 changed lines touch none of the passages they concern.

## Verified sound

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| §4.6, weight adjustment (reworded) | `X_*(N)=ℤ²`, `ι` the swap (one induced factor); `μ=(a,b)` | `w=−μ−ιμ=−(a+b)(1,1)`; `μ₀=−(a+b)(1,0)`, `(ι+1)μ₀=w`; `μ+μ₀=(−b,b)`, weight `−(1+ι)(−b,b)=0`; `μ−μ₀=(2a+b,b)`, weight `2w` | holds; sign `+μ₀` as the text says |
| §4.6, "induced, so `Ĥ⁰=0`" (reworded) | control: `GL₂`, `X_*(T)=ℤ²`, `ι` swap, `X_*(Z)=ℤ(1,1)` with trivial `ι`, `μ=(1,0)` | `w=−(1,1)`; `(1+ι)X_*(Z)=2ℤ(1,1)`; `Ĥ⁰=ℤ/2`, `w` not a norm | the hypothesis is used: without an induced kernel the weight stays `−1` |
| §4.6, `w∈X_*(N)` and its invariance | `ι=−1` on `X_*(T̄)` | image of `w` in `X_*(T̄)` is `−μ̄+μ̄=0`; `ιw=−ιμ−μ=w` | holds |
| §4.6, anisotropic torus split by a CM field (reworded) | `H^ad=PGL₂`, `T̄=K^×/ℚ^×`, `K` imaginary quadratic | `T̄(ℝ)=ℂ^×/ℝ^×≅U(1)` compact; `X*(T̄)=ℤ`, `ι=−1`; `σισ⁻¹` acts by `σ(−1)σ⁻¹=−1`; split by `K` | holds |
| §4.6, lift of `μ_h̄` and maximal torus (reworded) | `N` a torus, `1→N→T→T̄→1` | `X_*(T)→X_*(T̄)` surjective (cokernel in `π₀(N)=0`); `dim T=dim N+rank H^ad=rank G` | holds |
| §4.6, kernel "a power of `Res_{L/ℚ}G_m`" | against `centralExtensionWithDerivedCover` (README line 923) with `D=H^ad`, `H′=H`, `k=ℚ` | `X*(N)` free over `ℤ[Gal(L/ℚ)]` of rank `r` gives `N=(Res_{L/ℚ}G_m)^r`; `r=0` for `H` trivial, matching the Check `G=1` | consistent with the auxiliary and the Checks |

The rows for the untouched statements stand as in the previous review, of `15b9daf`.

- Source locators checked against the text: 1 (Milne, *Shimura varieties and moduli*, Proposition 8.8 and its proof, pp.512–513, milne-svh lines 1867–1898; Corollary 8.9, lines 1899–1905). The three reworded paragraphs keep the content of the proof, hypotheses included; the printed `µ−µ₀` is the misprint already recorded.
- Seeded sample: none of the fifteen targets falls in the changed passages (§4.6); the README flags no locator as unverified.
- Cross-roadmap citations in the changed passage resolved: ShimuraVarieties §P.5 "Real approximation and maximal tori" (its open head, README line 223) and §P.1 (line 156); ReductiveGroupsPartII §RG2.1.5 on main (README line 2446). The worker's resolver lists no cross-roadmap citation found nowhere; its five Lean-name leads are supplier names of roadmaps, not of this one.
- Gate, run on this head: every check 0, `OK`. Dependency check: `depcheck: 247 roadmaps, 2243 edges, 0 problem(s)`; ShimuraData is line 118 of the merge order, after PELModuli (117); the consumers the description names are later (HilbertModularVarietiesAndShimuraCurves 164, ShimuraCompactifications 165, AutomorphicBundles 185, HigherHidaAndColemanTheory 259).
- Elaboration: `lake env lean` on `Suggested.lean`: one warning, `declaration uses sorry` at 50:8. The file is unchanged since `15b9daf`; the worker's elaborated signature of `kostantInvolution` equals the README's §3.13 statement and no binder is lost (the file has no `variable` block).
- Changes outside the folder: none.
- Description otherwise checked against the head: the title; the summary block's three paragraphs (the four consumer clauses against "Downstream consumers", the Hopf-ideal join of §1.2, the Coxeter parabolics of §3.10 without a finiteness hypothesis, `ℓ>5` and every place above `ℓ` in §5.21); the dependencies paragraph; the validation counts (gate: `readme-ids-missing=0`, `round-labels=0`, `empty-sections=0`, `set_option=0`). No other sentence is contradicted.
- Overlap check: read ShimuraVarieties, PerfectoidShimuraVarieties, ReductiveGroupsPartIII, PELModuli, AutomorphicBundles, AdelicAlgebraicGroups, HodgeStructures, ReductiveGroups; nothing shared (each names ShimuraData as owner of what it takes: ReductiveGroupsPartIII for §§1.2–1.4 and 4.2–4.3, AutomorphicBundles for §§3.7–3.9 and 4.9, PerfectoidShimuraVarieties for §4.9; no other roadmap states the connected-datum lift or the prescribed-cover central extension).
- Source independence: changed passages only; 3 passages compared with 1 source (milne-svh lines 1883–1898), none shared (longest common run 6 words, "the inverse image T of T̄", forced by the mathematics; the order of the argument is the roadmap's own); largest share milne-svi, 26 of 68 locators; contents not compared again, since the change adds, removes or reorders no layer.

## Not verifiable

- Nothing in the changed passages. The three items of the previous review stand (Jantzen, paywalled; Milne–Shih and Deligne 1979 read from OCR of scans).

## Source issues

- **Misprint** in milne-svh at Proposition 8.8, proof, printed p.513 (line 1897): the source says to replace `µ` by `µ−µ₀` where `(ι+1)µ₀=w=−µ−ιµ`; that gives weight `2w`, and it should be `µ+µ₀`; affects nothing.

## For the human reviewers

- none
