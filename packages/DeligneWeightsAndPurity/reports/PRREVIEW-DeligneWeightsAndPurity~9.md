# Review of DeligneWeightsAndPurity (pull request #929 at ddbc25a)

**Verdict:** needs changes

Incremental re-review of the 36 lines changed since 82ab353.

## R01 (P2) — §5.12, smooth-divisor clause: the equation of the divisor is dropped and the sheaf has no supplier

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1819`: "the local monodromy filtration around `D₀` relative to `W` exists on the nearby-cycle sheaf of `ℱ₀` along `D₀`, which is lisse on `D₀` and carries the tame monodromy action".

**Claim:** The sheaf on `D₀` is built from an equation `t` of `D₀` and depends on it; the source assumes one. Its owner is LefschetzPencilsAndVanishingCycles §1.8 (tame restriction, in fixed local equations), which the *Needs* line omits; §§0.2–0.8 are over a trait.

**Witness:** WII line 1558–1560 and 1452. `ℒ_χ(t)` on `(𝔸¹_t − 0) × 𝔾_m`, `χ` of order `n > 1`: equation `t` gives the constant sheaf on `D₀ = 𝔾_m`, equation `ut` gives `ℒ_χ(u)⁻¹`.

**Repair:** "Let `X₀` be smooth over `𝔽_q`, `D₀ ⊂ X₀` a smooth divisor with an equation `t = 0`, and `ℱ₀` lisse on `X₀ − D₀`, tamely ramified along `D₀`, with a filtration `W` as before. Let `ℱ₀[D₀]` be the tame restriction of `ℱ₀` to `D₀` formed with `t` (LefschetzPencilsAndVanishingCycles §1.8), a lisse sheaf on `D₀` with its tame monodromy action. Then the monodromy filtration of `ℱ₀[D₀]` relative to `W` exists, and its graded pieces are lisse and punctually `ι`-pure of weight `i`. Another equation changes `ℱ₀[D₀]` by a Kummer twist and leaves the weights unchanged; a general smooth divisor is treated Zariski locally." Add LefschetzPencilsAndVanishingCycles §1.8 to the *Needs* line of 5.12, to the supplier contracts, and to the section list of the description. On the witness both sheaves are pure of weight `0`, as the repaired statement says.

## Previous findings

- R01 — repaired: "`‖K ⊕ K′‖ ≤ max(‖K‖, ‖K′‖)` with equality when `‖K‖ ≠ ‖K′‖`", with the route and the Check `E ⊕ E[1]` on `𝔸¹`.
- R02 — repaired: 8.9 is restated on smooth `X₀` as (a) lisse criterion, (b) `RHom(K, ℚ̄_ℓ)`, (c) `ℱ₀[m](r)`, with its own route; 8.10 is one statement without the source's letters.
- R03 — repaired: "a lisse sheaf on `U₀` with a finite increasing filtration `W` by lisse subsheaves such that each `Gr^W_i ℱ₀` is punctually `ι`-pure of weight `i`"; the divisor clause written with it is R01 above.
- R04 — repaired: 8.24 cites PW §2.3, pp. 8–9, Pet Example 3.5, p. 7, and BFP for the application, "where display (3) omits the factor `det E(G)`"; each clause says what its source supports.
- R05 — repaired: "pp. 151–153"; "pp. 176–178"; "Exemples (6.2.5) c), d), p. 248"; also "(6.2.5)(a)–(b), p. 247" in the Layer 8 potential-purity target.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 2.15 (i) direct sums | `E ⊕ E[1]` on `𝔸¹`; `E ⊕ δ_0` on `𝔸¹` | `E_n = 0`, `−∞ ≤ max(0,0) = 0`, strict; `E_n = (qⁿ−1)·1 + 4 = qⁿ+3`, `‖·‖ = 0 = max(0, −1)`, equality | pass |
| 2.15 (i) route | `a = ‖K‖ > b = ‖K′‖` | `E_n(K⊕K′) ≤ 2E_n(K) + 2E_n(K′)`; on the subsequence `E_n^{1/2} ≥ q^{n(a+1−ε)/2} − q^{n(b+1+ε)/2}` | pass |
| 5.12 curve clause | Kummer extension of `ℚ_ℓ` by `ℚ_ℓ(1)` on `𝔾_m`; `E ⊕ L_b`, `w(b) = 1/2` | `W_{−2} = ℚ_ℓ(1)`, `W_0` all; `M = W`, `N M_0 ⊂ M_{−2}`; Frobenius weights `−2, 0`: equal. Second instance has no `W`: excluded. WII line 1547–1551, 1364 | pass |
| 5.12 divisor clause | `ℒ_χ(t)` on `(𝔸¹ − 0) × 𝔾_m`, equations `t`, `ut` | restriction to `D₀`: constant, resp. `ℒ_χ(u)⁻¹`; both weight `0`. WII line 1554–1565, 1452–1460 | R01 |
| 8.9 (b) | `ℚ̄_ℓ[1]`, `dim d`; skyscraper `i_*ℚ̄_ℓ` on a curve | `DK(−d)[−2d] = RHom(K, ℚ̄_ℓ)`; `ℚ̄_ℓ[−1]`: `0 ≤ −w+1`, so `≥ 1`; `i_*ℚ̄_ℓ(−1)[−2]`: `2 ≤ −w+2`, so `≥ 0` | pass |
| 8.9 (a), (c) | `ℱ₀[m](r)`; `K(N)[2N]` | `ℋ^{−m} = ℱ₀(r)`, weight `w−2r = (w+m−2r) + (−m)`; `(w+i+2N) − 2N = w+i`. WII line 4143–4150, p. 247 | pass |
| 8.10 | elliptic family, multiplicative fibre, `w = 1` | stalk of `j_*ℱ`: `0 ≤ 1`; of `j_*ℱ^∨`: `−2 ≤ −1`; `RHom(j_*ℱ, ℚ̄_ℓ) = j_*ℱ^∨` from `D(j_{!*}) = j_{!*}D`. WII line 4154–4159, p. 248 | pass |
| 8.24 sources | `ℙ¹ ⊃ {0,∞}` | `E₁^{1,0} = ℚ²`, `E₁^{0,0} = ℚ`, `E₁^{0,2} = ℚ(−1)`; `ε_m`, `E₂` degeneration and `det E(Γ)` at PW line 358–371; Pet line 294–296, 302–312 | pass |
| Description | suppliers, section lists | the 36 lines add or drop no supplier, section id, heading or declaration (diff read line by line); no sentence of the description is about a changed passage | pass |

The rows of the previous review, of 82ab353, stand for every untouched statement.

- Source locators checked against the text: 12 (WII 7: (1.1.10), (1.1.14), (1.7.5), (1.7.8)–(1.7.10), (1.8.5)–(1.8.12), (6.2.5) a)–b), (6.2.5) c)–d); PW 2; Pet 1; Sun 2; BFP 1), all right. Sun Proposition 7.3.2 is on preprint p. 47 (Sun line 2615), as the smooth proper Deligne–Mumford purity target cites it.
- Seeded sample: none of the 15 targets is a changed passage; 5.11, which 5.12 consumes, matches WII line 1528–1529 (`Gr^M_i` pure of weight `β + i`).
- Cross-roadmap citations resolved: EtaleCohomologyFoundations §F.6 on main (`f^!Λ ≅ Λ(d)[2d]`); LefschetzPencilsAndVanishingCycles §§0.2–0.8, 1.5, 1.8 at its open head.
- Library declarations: none opened; `TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean` is unchanged since 82ab353. `lake env lean` gives 5 `sorry` warnings (lines 83, 97, 112, 155, 180) and no error.
- Gate: every check zero, build passing. `depcheck: 261 roadmaps, 2605 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- Overlap check: read FourierDeligneTransform, LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves, WeightsInEtaleCohomology, WeilConjectures (the lists for main and for named results are empty); LefschetzPencilsAndVanishingCycles §1.8 owns the tame restriction and leaves the existence of relative filtrations under mixedness to this roadmap's §5.12; nothing shared.
- Source independence: changed passages only; 6 passages compared with 5 sources (WII, PW, Pet, Sun, BFP), none shared; largest share WII, 147 of 222 locators; contents not compared again (no layer added, removed or reordered).
- Research link: the targets are the theorems of Deligne (1974, 1980) with Laumon's (1987) Fourier-transform proof of the curve estimate; §8.24 is the weight spectral sequence used by Bergström–Faber–Payne (2023). Rests on the README's references and the texts read.

## Not verifiable

- [Int] (SGA 7 II, XXI §5): not in the sources cache; cited by locator only.
- Lau line 2649–2653 (the product formula in (4.4)): garbled in the extraction, so the reality step there was not compared with §2.14.
- The file-by-file mapping to the two outside Lean repositories in "Provenance: existing Lean work": the repositories and their licence were confirmed, the files were not opened.
- [Pet]: the journal reference (Geom. Topol. 21 (2017), 2527–2555) was not checked against the publisher; the locators are to the preprint, which was read.

## Source issues

- **Error** in BFP at proof of Proposition 4.2, display (3), p. 7: the source says the `E₁` term is the automorphism invariants of the tensor product of the vertex cohomologies; it should carry the orientation character `det E(G)` of the edge set; affects nothing.

## For the human reviewers

- **Licence.** `README.md` section "Provenance: existing Lean work" maps targets to formal-arithmetic-geometry/weil-conjectures (55abf46) and AxiomMath/Weil and Stacks (27cdb20, f8e70c5), all stating Apache-2.0, and says no code is transferred; no `Suggested.lean` name matches theirs.
- **Licence.** [KatzW] was read from a text the operator holds locally; the README cites the author's manuscript pagination, not the published article's.
