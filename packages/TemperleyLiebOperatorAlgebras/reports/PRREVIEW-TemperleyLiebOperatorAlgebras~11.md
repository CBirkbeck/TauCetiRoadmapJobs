# Review of TemperleyLiebOperatorAlgebras (pull request #867 at b0e66ea)

**Verdict:** accepted

Incremental re-review of the 44 lines changed since `7a05bd0` (22 insertions, 22 deletions, all in `README.md`: the 1.7 anchor removed, the 1.7 inputs paragraph rewritten, the 1.7 formulas put in code spans, the tower identity restated on all of `Cl_m`, the kernel argument restated, one new `m = 2` Check, and the 1.8 Check now naming `s_N`). `Suggested.lean` is byte-for-byte unchanged since `556e24c` and was re-elaborated at the pins. Every changed statement was recomputed in an independent model of `Cl_m` (table below). The worker's gate passes every counter at this head. No P1 or P2 finding; one P3 note the author may take or leave.

## R01 (P3) — the inputs sentence of 1.7 omits the Tau Ceti basis that defines `s_m`

Location: `README.md:814–816` ("The model, its bilinear scalar pairing, its trace radical, its coordinate inclusions and its braid phases use only Mathlib's `CliffordAlgebra`, Tau Ceti's `TemperleyLieb` and Subfactors 3.2's Markov uniqueness").

Claim: the scalar pairing is `s_m(ab)`, and `s_m` is defined as the coefficient at `∅` of Tau Ceti's `CliffordAlgebra.basis` (`README.md:830–832`; `Suggested.lean:140–141`, `cliffordScalarCoefficient` is `(CliffordAlgebra.basis (cliffordForm m) (Pi.basisFun ℂ (Fin m))).repr a ∅`), which is neither Mathlib's `CliffordAlgebra` nor `TemperleyLieb`. The *Needs:* line (`:946–948`) lists it correctly; the summary sentence's "only" does not.

Witness: `Suggested.lean:8` imports `TauCeti.LinearAlgebra.CliffordAlgebra.Dimension` for exactly this declaration (`Dimension.lean:118` at the pin).

Repair: "use only Mathlib's `CliffordAlgebra`, Tau Ceti's `CliffordAlgebra.basis` and `TemperleyLieb`, and Subfactors 3.2's Markov uniqueness".

## Previous findings

- R01 — repaired: the anchor line is gone (`grep '<a id' README.md` finds nothing); the worker's gate reports `residue=0`.
- R02 — repaired: every symbol of the changed 1.7 sentences is in a code span; "GeometricTopology Layer 4's closure normalisation" names the section (`:818`); the asides on `p_m` and "the declared zero-based indices" are replaced by the direct statement "`p_(m−1) = (1 + i c_(m−1) c_m)/2` is the last projection of `Cl_(m+1)`" (`:852–853`); the kernel argument reads "commutes with every `c_j`, hence with all of `Cl_m`" (`:901`); the tower identity is now stated for `x ∈ Cl_m` (`:851`), as the review suggested. The new wording introduced one imprecision, R01 above (P3).
- R03 — repaired: `README.md:1070` now reads "`s_N` vanishes on both".

## Verified sound

**Scope and counts.** Diff since `7a05bd0`: 44 lines of `README.md` only; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TemperleyLiebOperatorAlgebras'` is empty; `git diff --stat 7a05bd0 HEAD -- Suggested.lean` is empty, so the 26 elaborated signatures recorded by the worker (`pottsPartition` … `markovTrace_neg_one_pow_nonneg_iff`) and the `#check @name` comparison of the earlier rounds stand unchanged. Pins: manifest Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`. 12 adversarial rows with values for the changed statements; 2 source passages reread; 3 supplier sections re-resolved; 1 citations lead resolved; 1 pinned declaration opened.

**Gate, build, dependency check.** Worker's gate at `b0e66ea`: every counter `0`, `build=0`, `OK`. `lake env lean` on `Suggested.lean` from the pull-request worktree: exactly five `sorry` warnings (lines 107, 151, 288, 314, 333: `pottsPartition_eq_fkPartition`, `exists_evenCliffordModel`, `exists_cubicFixedModel`, `finite_gaussianBraid_closure`, `markovTrace_neg_one_pow_nonneg_iff`), nothing else, exit 0. Dependency check rerun as prescribed:

```text
depcheck: 204 roadmaps, 1418 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Headline theorems.** Unchanged from the previous rounds: the five sorried theorems above are the headlines of 1.6, 1.7, 1.8 and 2.1; the docstring's list of what is not statable is unchanged. No padding was added (no declaration changed).

**Citations lead.** The worker's `roadmaps resolve` lists `IsMarkovTrace.apply_jonesWenzl` (`README.md:251`) as found nowhere. It is a target name of the supplier roadmap TemperleyLieb on main (`TauCetiRoadmap/TemperleyLieb/README.md:242` and `:708`, Layer 6), cited in this roadmap's supplier contract for that roadmap, not a claim about the pins; not a defect, and untouched by this change.

**Adversarial table, the changed statements** (independent model of `Cl_m` on ordered monomials with `c_j² = 1`, exact integers where shown, random complex `x` elsewhere; `†` conjugate-linear, fixing each `c_j` and reversing products; `x⁻¹ = x†` on the unitary group `⟨g_j⟩`). The rows of the r10 report for the statements this diff leaves untouched (1.5–1.8, 2.1–2.2, 3.1–3.4, 4.1–4.7 and the five headlines) are carried forward from that report and from r9.

| Statement | Instances tried | Values on both sides | Result | Change |
|---|---|---|---|---|
| new Check: `d_0 = g_0²` | `m = 2` | `g_0² = c_0 c_1 = d_0` exactly | holds | none |
| new Check: `d_0` central in `Cl_2⁰ = ℂ ⊕ ℂ d_0` | `m = 2` | `Z(Cl_2⁰)` monomials `{1, c_0 c_1}` | holds | none |
| new Check: conjugation by `d_0` negates `c_0`, `c_1` | `m = 2`, `d_0⁻¹ = −d_0` | `d_0 c_0 d_0⁻¹ = −c_0`, `d_0 c_1 d_0⁻¹ = −c_1` | holds | none |
| new Check: `Z(Cl_2) = ℂ·1`, kernel `{±1}` | `m = 2` | central monomials `{1}`; kernel of conjugation in `⟨g_0⟩` (order `8`): exactly `{1, −1}` | holds | none |
| kernel of conjugation on `span_ℝ{c_j}` within `⟨g_j⟩` is `{±1}` | `m = 2, 3, 4` | kernel `{1, −1}` in each case; `|⟨g_j⟩| = 8, 48, 384` | holds | none |
| "commutes with every `c_j`, hence with all of `Cl_m`, and `Z(Cl_m) ∩ Cl_m⁰ = ℂ·1`" | `m = 2, 3, 4` | `Z(Cl_m)` monomials `{1}`, `{1, c_0c_1c_2}`, `{1}`; even part `{1}` each | holds | none |
| "for even `m` the centre of `Cl_m⁰` also contains `c_0 ⋯ c_(m−1)`" | `m = 2, 4` (and `3`) | `Z(Cl_m⁰)` monomials `{1, c_0c_1}`, `{1, c_0c_1c_2c_3}`; `m = 3`: `{1}` | holds | none |
| coefficients real, unitary, `−1 = g_0⁴` | `m = 2, 3, 4` | all imaginary parts `< 1e−9`; `g_0⁴ = −1·1` | holds | none |
| image order `2^m m!`, conjugation image `2^(m−1) m!` | `m = 2, 3, 4` | `8, 48, 384` and `4, 24, 192` | holds | none |
| `s_(m+1)(J_m(x) p_(m−1)) = s_m(x)/2` for `x ∈ Cl_m` (now all of `Cl_m`) | `m = 1, 2, 3, 4`, random `x` with odd and even terms | e.g. `m = 2`: `0.456034+0.447827i` both; `m = 4`: `−0.263952−0.396834i` both | holds | none |
| "every monomial of `J_m(x) c_(m−1) c_m` contains `c_m` and has no scalar term" | `m = 1, …, 4`, same `x` | scalar coefficient of `x c_(m−1) c_m`: `0` each | holds | none |
| `s_m(c_S c_T) = 0` (`S ≠ T`), `s_m(c_S²) = (−1)^(|S|(|S|−1)/2)` (reformatted line) | `m = 4`, all 256 pairs | max off-diagonal `0`; diagonal matches the sign formula for `|S| = 0..4` | holds | none |
| 1.8 Check "`s_N` vanishes on both" | `N = 1` | `W(e_0) ± W(−e_0)` have coefficient `0` at `W(0)`, and `s_N` is that coefficient (`:973`) | holds | none |
| "is an input to no construction of this section or of 1.8" (closure formula) | 1.7 and 1.8 *Needs:* | GeometricTopology is cited in 1.7 only "for the closure normalisation only" (`:956`); 1.8 cites it nowhere | holds | none |

**Sources reread at their locators.** Jones 1985 (`bcae6367` lines 191–203, printed p. 107): at `t = i` the `A_n` are the complex Clifford algebras; at `exp(πi/3)` a "cubic Clifford algebra" with finite braid image; supports the opening sentences of 1.7 and 1.8, unchanged by the diff. Iohara–Lehrer–Zhang (`8ec89b73` lines 561–593): (5.18), Proposition 5.3, Theorem 5.4 (`ℓ = 4`, `q = −exp(πi/4)`, `φ_n(f_j) = (1 + 2iγ_jγ_(j+1))/√2`, onto `C_n⁰`, `n ≥ 3`), Proposition 5.5 (constant term, nondegenerate); supports the comparison map and the trace identity. The sign `s_m(c_S²)`, the tower step and the kernel argument are the roadmap's own elementary statements, computed above.

**Suppliers re-resolved.** Subfactors at the head of #874: `### 3.2 Markov uniqueness, Jones–Wenzl projections and Jones's positivity theorem` (`README.md:697`), `### 3.3 Positive path models, Jones quotients and their C*-tower` (`:774`). GeometricTopology on main: `### Layer 4: knot theory, done properly` (`README.md:409`). Tau Ceti `CliffordAlgebra.basis` at `TauCeti/LinearAlgebra/CliffordAlgebra/Dimension.lean:118` at the pin, as used by `cliffordScalarCoefficient` (`Suggested.lean:140`).

**Style of the changed lines.** No LaTeX, no process words, no pull-request numbers, no anchors, no absolute paths; every symbol in the changed sentences is in a code span; "centralizes" is gone (the file now uses "commutes with"); the word "adapter" no longer appears in 1.7.

## Not verifiable

- Graham–Lehrer 1998, Temperley–Lieb 1971, Baxter–Kelland–Wu 1976: uncertified or paywalled, settled in earlier rounds, cited by locator only; none is touched by this change.
- Ownership against open pull requests whose files the brief did not give: not checked beyond the earlier rounds' `roadmaps grep`; the change introduces no new object.

## Source issues

- none (the two misprints recorded in r9, Morin-Duchesne–Saint-Aubin (29) and Jones p. 104, are untouched by this change and already in the register).
