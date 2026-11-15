# Review of PerfectoidShimuraVarieties (pull request #1085 at e6686d6)

**Verdict:** needs changes

Incremental re-review of the 13 lines changed since `917a589` (README only), and of the pull request's title and description against this head. Two P3 findings; nothing blocking.

## R01 (P3) — `Suggested.lean` docstring still describes target signatures the file does not contain

**Location:** `TauCetiRoadmap/PerfectoidShimuraVarieties/Suggested.lean` lines 7–8: "Target signatures here suggest Lean forms for selected milestones; discharging them finishes neither a layer nor the roadmap."

**Claim:** the file carries target signatures for selected milestones.

**Witness:** lines 36–38 are an empty `namespace … end`; line 10 of the same docstring says "No headline theorem is statable". This is the third item of the previous review's R02, not changed since `917a589` (the diff touches `README.md` only).

**Repair:** delete that sentence, so the first paragraph reads: "**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`."

## R02 (P3) — The description's validation paragraph is written for an earlier head

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti"; "the targeted Lake build succeeds with `sorry` as the only warning"; "with author-side red-team passes to follow".

**Claim:** `Suggested.lean` states definitions and theorems, its build warns about `sorry`, and no red-team pass has been made yet.

**Witness:** at `e6686d6` the file declares nothing (0 Lean declarations added against the base); `lake env lean` on it exits 0 with no output, so there is no `sorry` warning; the branch already contains the red-team repairs and two rounds of review repairs.

**Repair:** replace the three passages by: "This pull request adds the roadmap folder `TauCetiRoadmap/PerfectoidShimuraVarieties` (README, `Suggested.lean`, `metadata.toml`). `Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its docstring names the missing carriers; every target is in the README." — "Validation: the targeted Lake build succeeds with no warning (the file has no declaration); …" — "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, followed by red-team and review repairs."

## Previous findings

- R01 — repaired: §5.7 (README line 1787) now reads "assumes an injection `Δ_n(N) → Δ(N)`, which fails already for `p = 7`", the computation is a Check (line 1802), and the Layer 5 Examples (line 1882) point at "the `F = ℚ(√5), N = 4, p = 7` Check of §5.7".
- R02 — partly repaired: line 1372 reads "([BP25], §4.4.25, pp. 74–75.)"; lines 2096 and 2116 read "The cosets `Sh` (the quotient `S\H`)"; the `Suggested.lean` docstring sentence is unchanged (R01 above).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §5.7 new Check: `Δ₁(4) → Δ(4)` not injective (`F = ℚ(√5)`, `p = 7`) | `ε = (1+√5)/2`; `ε² = ε+1`, `ε³ = 2ε+1`, `ε⁶ = 8ε+5` | order of `ε` mod 4 is 6; `5` is a non-square mod 7, `ε⁸ ≡ N(ε) = −1`, order 16; `ε²⁴ ≡ (1 mod 4, −1 mod 7)` | ok | none |
| same, the two groups | `A₁ = ⟨ε¹⁶⟩`, `B₁ = U₂₈ = ⟨ε⁴⁸⟩` (`−1` is no power of `ε` mod 4); `U⁺ = ⟨ε²⟩`, `U₄ = ⟨ε⁶⟩` | `Δ₁(4) = ⟨ε¹⁶⟩/⟨ε⁹⁶⟩`, order 6; `Δ(4) = ⟨ε²⟩/⟨ε¹²⟩`, order 6; kernel `⟨ε⁴⁸⟩` of order 2 | ok | none |
| §5.7 against its other Check `|Δ(4pⁿ)| = k_n` | `p = 7`, `n = 0, 1` | `|⟨ε²⟩/⟨ε¹²⟩| = 6 =` order mod 4; `|⟨ε²⟩/⟨ε⁹⁶⟩| = 48 = lcm(6,16)` | ok | none |
| §5.7 "for odd `p` … injective transition maps" | `ν = 1 + pⁿx ∈ U_{pⁿN}`, `ν² ≡ 1 mod p^{n+1}`; the example at `p = 7` | `2pⁿx ≡ 0` gives `p ∣ x`; `Δ_{n+1}(4) → Δ_n(4)` sends the generator to its 7th power, a bijection of `ℤ/6` | ok | none |
| §5.7 "for `p = 2` only the kernel description" | supplier's `F = ℚ(√2)`, `N = 5` (HilbertModularVarietiesAndShimuraCurves §H4.19) | `Δ_n(5) ≅ ℤ/6`, transitions multiply by 2, limit `ℤ/3 ≠ Δ_n` | ok | none |
| §6.7 Check: cosets `Sh` in `S₃` | `S = Stab(0)`, `s = (1 2)`, `h = (0 1)` | `h⁻¹(0) = 1 = (sh)⁻¹(0)`; `(hs)⁻¹(0) = s(1) = 2`; `h(0) = 1`, `(hs)(0) = 1` | ok | none |
| §3.8 locator `[BP25]` §4.4.25 | bp25 line 3517 and the page-75 marker at line 3530 | the paragraph opens on p. 74 and its toroidal part (lines 3532–3536) is on p. 75 | ok | none |
| §1.22 reworded sentence (line 805) | scholze-torsion-annals lines 2221–2224 (p. 1002) | same content; longest run of consecutive shared words is 4 | ok | none |

The rows for the untouched statements stand as in the previous review, of `917a589`.

- Gate at `e6686d6`: every check passes (`build=0 depcheck=0 stray-files=0 outside-folder=0 … OK`); my rerun prints the same line.
- Dependency check: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD or CYCLE line (PerfectoidShimuraVarieties is line 186 of the merge order, after AutomorphicBundles 184 and HodgeTateAndCanonicalSubgroups 185).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; no declaration, so no `#check` comparison and no padding probe apply.
- Source locators checked against the text this round: 3 (bp25 §4.4.25; bhw Lemma 8.20, lines 1803–1806, p. 37, which asserts the injection; scholze-torsion-annals lines 2221–2224). None of the 15 seeded targets lies in a changed passage.
- Cross-roadmap citations in the changed passages: HilbertModularVarietiesAndShimuraCurves §§H4.10, H4.18, H4.19 read at its open head; they own `Δ_n(N)`, its finite limit and a counterexample to the same injection (`F = ℚ(√2)`, `p = 3`, `N = 4`), and agree with §5.7.
- Pull request text: the title equals the README's heading; the summary block's claims (rank-removing quotient §6.1a, Lovering's datum §6.4, Scholze Theorem 4.2.1 and the Igusa and overconvergent consumers under Downstream consumers) match the head; no change outside the folder.
- Remark: §5.7's new Check and §H4.19 of the supplier give two different counterexamples to the same printed step; they are consistent.
- Overlap check: read HodgeTateAndCanonicalSubgroups, AutomorphicBundles, OverconvergentAutomorphicForms, ShimuraCompactifications, IgusaVarietiesAndTorsionConcentration, PerfectoidTowers, DiamondsAndVStacks, PerfectoidSpaces; nothing shared (each names this roadmap as owner of representability, the Hilbert comparison and the Bruhat reductions, or as a consumer of its own sections).

Source independence: changed passages only; 3 passages compared with 3 sources, none shared (longest common run 4 words); largest share scholze-torsion-annals, 64 of 203 bracketed locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- Faltings–Chai, *Degeneration of Abelian Varieties*, V Theorem 2.5(4)–(6), pp. 152–153 (README lines 117, 2359 and 2417): no open copy; not read. The README treats it as a conditional proof input of §1.22.

## Source issues

- **Error** in bhw at proof of Lemma 8.20, printed p. 37: the proof asserts that the natural map from `Δ_n(N)` to `Δ(N)` is injective; it should use the injective transition maps and bounded orders for odd `p`, and the kernel description for `p = 2` (counterexample `F = ℚ(√5)`, `N = 4`, `p = 7`, `n = 1`); affects the proof.

The other source issues of the review of `917a589` stand unchanged and are not repeated here.

## For the human reviewers

- **Licence.** [BP25] is the authors' revised manuscript of *Higher Coleman theory* on an author's homepage (PDF dated 3 March 2025), not a published version; 17 locators cite it (README References, line 2411).
- **Licence.** [HJ] is cited in its arXiv v2 of 29 August 2025, a revision later than the published article, from which the pre-abelian period map was removed (README References, line 2397); 25 locators.
