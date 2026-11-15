# Review of EulerSystemsCyclotomicMainConjecture (pull request #1311 at 8eeb3ed)

**Verdict:** needs changes

## R01 (P2) — The §4.20 group introduction drops the cyclic 2-Sylow hypothesis at `p = 2`

**Location:** `TauCetiRoadmap/EulerSystemsCyclotomicMainConjecture/README.md:3180`: “These parts prove the lower bound `|A_p(F)_χ| ≥ Nχ(½B_{1,χ⁻¹})` for odd characters, at `p = 2` and, for characters faithful on a cyclic `p`-Sylow subgroup, at odd `p`.”

**Claim:** At `p = 2` the sentence claims the bound for every odd character, with no condition on `Δ₂`. §4.20 assumes that `Δ₂` is cyclic (line 3182). So does `relativeClassGroup_lowerBound`, whose `hcyclic` applies at every `p` (`Suggested.lean:153`).

**Witness:** GREITHER-1992 lines 1162–1165 (p. 482) assume `Δ_p` cyclic throughout §4, `p = 2` included. For `F=ℚ(√−3,√5)` at `p=2`, `Δ₂=C₂×C₂`; the odd `χ₋₃` has kernel `Gal(F/ℚ(√−3))`, so §4.20 step 1 fails.

**Repair:** “These parts prove the lower bound `|A_p(F)_χ| ≥ Nχ(½B_{1,χ⁻¹})` for imaginary abelian `F` unramified at `p` whose `p`-Sylow subgroup `Δ_p` is cyclic: at `p = 2` for every odd character, which is then faithful on `Δ_2`, and at odd `p` for odd characters faithful on `Δ_p`.”

## R02 (P3) — The §4.2 group introduction leaves out two of its consumers

**Location:** `TauCetiRoadmap/EulerSystemsCyclotomicMainConjecture/README.md:2504`: “Sections 4.6–4.8, 4.14 and 4.27 consume them.”

**Claim:** §4.10 and §4.12 also consume these parts: both take their norm limits from §4.3. Neither lists §4.3 in its *Needs* line (lines 2890 and 2959).

**Witness:** Line 2837 (§4.10): “with norm transitions and semilocal images as in §4.3”. Lines 2914–2916 (§4.12): “the norm limits … of the circular units of these CM fields (§4.3)”.

**Repair:** Replace the sentence with “Sections 4.6–4.8, 4.10, 4.12, 4.14 and 4.27 consume them.” Then add `[§4.3](#42-semilocal-and-circular-unit-limits-norm-descent-and-generators)` to the *Needs* lines at 2890 and 2959.

## R03 (P3) — The description's AI-assistance sentence still describes the first head

**Location:** The pull-request description, Validation paragraph: “AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow.”

**Claim:** The red-team passes are not “to follow”: the branch already contains them. The sentence also omits the later commits made with Claude.

**Witness:** `git log origin/main..8eeb3ed`: nine commits titled “red-team repairs (…)” (7e96b9a … 804fe8a); `Co-Authored-By: Claude` on 0ae2bbd, 4408ed4, c386732, b3dbc64, 7790892 and 8eeb3ed; `Codex` only on f5a88df.

**Repair:** “AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and for the headline statements of `Suggested.lean`. The author-side red-team passes are the commits titled `red-team repairs`, and the later review repairs were made with Claude (Opus 5.5, Fable 5.1 and Fable 5.2).”

## Previous findings

- None: the review of `c386732` raised no finding.

## Verified sound

| Statement | Instances | Values computed on the two sides / competing model | Result; change |
|---|---|---|---|
| §4.16 step 2: Lemma 4.4, reworded | `E=Λ/(T(T−2))` with `E⁺=(T−2)E≅Λ/(T)`; control `E=Λ/(T²)` with `E⁺=TE` | `(E/E⁺)_T=𝔽₂`; Tor term `(E/E⁺)^{(T)}=0`; `β=×(−2)`, so `\|ker β\|=1` and `\|coker β\|=2`. Control: `(E/E⁺)_T=ℤ₂`, `ker β=ℤ₂` | Correct, and the finiteness hypothesis is needed. Agrees with GREITHER-1992 lines 1311–1318. |
| §4.17 step 1, reworded | `G=ℤ₂⋊ℤ₂` with `γ` acting by 3 on `E=ℤ₂`; `E=ℤ/3` with `γ` acting by `−1` | `(γ−1)E=2ℤ₂`, so `E_{1−γ}=ℤ/2` and `G/G′≅ℤ/2×ℤ₂`. With `E=ℤ/3`, `G` is not pro-2 | The hypothesis “`E` abelian and pro-2” is what makes `G` pro-2. Agrees with GREITHER-1992 lines 1393–1398. |
| §4.20 group introduction | `p=2`: `F=ℚ(√−3,√5)` and `F=ℚ(ζ₅)` | First field: `Δ₂=C₂×C₂`, `j=τ`, `χ₋₃(τ)=−1` and `χ₋₃(σ)=1`, so `χ₋₃` is not faithful. Second: `Δ₂=C₄`, and the odd quartic `χ` is faithful | The introduction covers non-cyclic `Δ₂`, which §4.20 and the Lean exclude: R01. |
| `relativeClassGroup_lowerBound`, cited by that introduction | `p=2`, `F=ℚ(ζ₅)`, odd quartic `χ`, `B₁=(−3+i)/5` | `‖N(B₁/2)‖₂⁻¹=‖1/10‖₂⁻¹=1/2` and `h(ℚ(ζ₅))=1`, so `1/2≤1` | Holds. `hcyclic` is present at every `p`. |
| §4.2 group introduction | *Needs* lines and statements that cite §§4.2–4.3 | *Needs*: 4.6, 4.7 and 4.27 cite §4.3; 4.8 and 4.14 cite §4.2. Statements: 4.10 (line 2837) and 4.12 (line 2916) use §4.3 | Two consumers are missing: R02. |
| §4.4 group introduction | *Needs* lines citing §§4.4–4.6 | Cited only by 4.7 (4.4–4.6), 4.8 (4.5), 4.10 (4.5–4.6) and 4.27 (4.4–4.6). `αψ` is in §4.5; `V_χ(𝒱)` free on `z_χ=y_χ(1−X)` in §4.6 | Correct. |
| §4.7 group introduction | *Needs* lines citing §§4.7–4.8 | 4.10 and 4.14 cite 4.8; 4.27 cites 4.7–4.8. §4.8 is stated after `ℚ_p⊗` | Correct. |
| §4.9 group introduction | *Needs* lines citing §§4.9–4.11 | Only §4.12 cites them (line 2959). The §4.10 constant is `c₁=c₁(F)` | Correct. |
| §4.15 group introduction | *Needs* lines citing §§4.15–4.19, and the trivial zero at `χ(2)=1` | 4.20 cites 4.16 and 4.19; 4.21 cites 4.15–4.18. `G₂(0,χ̌)=−(1−χ⁻¹(2))B_{1,χ⁻¹}=0` | Correct. |
| §4.23 group introduction | §4.26, steps 2–3 | Step 2 uses Theorem 4.11 and the ordinary finite-ray sequence; step 3 uses the circular-logarithm image formula | Correct. |
| §4.12 (sampled; heading shortened) | `p=5`, `F=ℚ`, `ρ=ω²` | 5 is regular, so `X^CM=0` and `[E_n⁺:C_n⁺]=h_n⁺` is prime to 5. Both characteristic ideals are `(1)` | Divisibility and equality hold. The locator line (2957) still names Theorem 3.1, p. 468 (GREITHER-1992 lines 691–693). |
| §4.14 (sampled; heading shortened) | `p=3`, `F=ℚ(i)`, with `χ=χ₋₄` and with `χ=ω` | `χ̌=χ₁₂`. `L₃(0,χ₁₂)=−(1−χ₋₄(3))B_{1,χ₋₄}=1`, so `½G₃(0,χ̌)` is a unit. Since `h(ℚ(ζ₁₂))=1`, `X_χ=0`; also `X_ω=0` | Agrees. The locator line (3010) names Theorem 3.2, p. 452 (GREITHER-1992 lines 152–156). |

The rows for the untouched statements stand as in the previous review, of `c386732`.

- **Gate and elaboration.**
  - The gate, run on this head against `origin/main`, reports 0 for every check and `OK`. This run printed no `build=` field; the worker's run at the same head records `build=0`.
  - `lake env lean` gives only the five `sorry` warnings (lines 126, 151, 166, 182, 199). `Suggested.lean` is unchanged since `c386732`.
  - Nothing changes outside the folder.
- **Dependency check:** `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Regrouping.**
  - The README has 105 headings, and every in-README anchor resolves.
  - Each of the 194 `[§x.y](#…)` links targets the group heading that holds label `x.y`.
  - All 27 Layer 4 sections keep their `See` line. Every Greither number removed from a heading is still named in its section, for example `(Corollary 2.7)`, `(Corollary 2.12)`, `Lemma 4.8` and `(Lemma 4.9)`.
  - No roadmap on main or in an open pull request cites a section or anchor of this one.
- **Sources:** GREITHER-1992 was read from Numdam through the sources service, at pp. 452, 468, 482, 486 and 488 (5 locators).
- **Supplier citations in the changed lines.**
  - ColemanPowerSeries at `f9fecdf`: all 16 sections cited on line 225 exist. Its scope (line 24) keeps the principal sequence odd-prime, so §4.4 owns the all-prime sequence.
  - IntegralIwasawaTheory at `72d834e`: all 22 sections and 9 names cited exist.
- Overlap check: read IntegralIwasawaTheory, EulerSystemsAndKolyvaginSystems, CyclotomicClassGroupsAndStickelberger and ClassicalArithmeticCompletion. The diff changes no ownership: IntegralIwasawaTheory owns `greitherRayDictionary` (§3.5) and Baker–Brumer (§4.2), and this roadmap owns Coleman's unramified sequence at every prime (§4.4).
- **Remarks on untouched text (no change asked).**
  - The arrangement was not re-compared, because no layer was added, removed or reordered. The Layer 4 order is the *Needs* order.
  - In §4.16 step 2, finite generation of `E⁺` over `ℤ₂` uses μ = 0 (IntegralIwasawaTheory §5.6, via §4.14). `(E⁺)_{1−γ}` is finitely generated without it.
  - HeegnerPointEulerSystems and AutomorphicCongruences declare imaginary-quadratic gaps on this roadmap.

Source independence: changed passages only. 9 passages were compared (§4.16 step 2, §4.17 step 1 and the seven group introductions) with 1 source, GREITHER-1992 pp. 486 and 488. The longest shared run is 5 words (“is finitely generated over ℤ_2”), which the mathematics forces. The largest share is RUBIN-ES, with 81 of 213 bold source-id mentions (GREITHER-1992 has 70). The contents were not re-compared, because no layer was added, removed or reordered.

## Not verifiable

- **Sampled targets outside the changed passages** (0.5, 0.6, 0.10, 0.11, 0.22, 0.24, 0.25, 0.27, 0.28, 0.31, 3.1, 4.1, 5.1) were not re-read, because their text is unchanged since PRREVIEW~1–~4 checked them.
- **MORITA-1975** is still uncertified, carried from earlier rounds.
- **The five Lean theorems** are admitted by design: their types and the tested instances are checked, not proofs.

## Source issues

- none

## For the human reviewers

- none
