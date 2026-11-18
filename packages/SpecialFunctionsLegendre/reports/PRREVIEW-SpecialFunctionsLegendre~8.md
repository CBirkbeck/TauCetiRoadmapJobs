# Review of SpecialFunctionsLegendre (pull request #2121 at 687157d)

**Verdict:** accepted

**Summary.** Accepted: the four blocking findings of the previous review (the range of `θ₀` in the Funk–Hecke formula, the range of `θ` in the addition theorem and in Herglotz's generating function, the restriction of 14.17.9 to `m ≤ n`, and the second owner of Sturm's comparison theorem) are repaired at this head, and the repairs were recomputed and introduce no new defect. There is one small correction and one format note, neither blocking. Two licence questions are left for the human reviewers, as before.

## C01 — The Dependencies line of Layer 6 does not name the new supplier

6.1 now takes Sturm's comparison theorem and the simplicity of zeros from SpecialFunctionsBessel, and its *Needs:* line says so (line 1058), but the layer's closing Dependencies still reads "Layers 1, 2, 4, 5." (line 1110). A reader who plans the build from the layer-level lines, as for Layers 3 and 7 where the outside suppliers are listed, does not see that Layer 6 waits for another roadmap. Write "Layers 1, 2, 4, 5; SpecialFunctionsBessel 10.1 (auxiliary: Sturm comparison)."

## N01 — The supplier's statement is in its Scope, not in its 10.1

The contract "From SpecialFunctionsBessel" cites "10.1" for the comparison theorem; at that roadmap's head the statement with its hypotheses is the auxiliary bullet of its Scope and ownership (README lines 134–138), and its 10.1 and 10.3 only apply it. The citation would be easier to follow as "SpecialFunctionsBessel, Scope and ownership (auxiliary Sturm comparison, used in its 10.1 and 10.3)".

## Previous findings

- R01 — repaired: 3.4 now reads "real `φ₀` and `0 < θ₀ < π`"; the Lean statement has `{θ₀ : ℝ} (hθ₀ : 0 < θ₀) (hθ₀' : θ₀ < π)`; 3.1 and 3.4 carry the negative controls.
- R02 — repaired: 2.5 "the identity for `0 ≤ θ₁, θ₂ ≤ π` and real `φ`"; 3.2 "for all real `t`, `r`, `φ`, `0 ≤ θ ≤ π` (DLMF's range for 14.30.1)", with the failure at `θ = −π/2` recorded.
- R03 — repaired: 2.4 "14.17.9 for `l > 0` and `m ≤ n` (for `m > n` it fails: at `(l, m, n) = (2, 2, 1)` the integral is `0`, not `½`…)", with a Check at `(1, 1, 2)`; the description lists the correction.
- R04 — repaired: 6.1 "are SpecialFunctionsBessel's auxiliary Sturm comparison (its 10.1), applied with this `p` and `Q`"; Scope, the supplier contracts, the *Needs:* line and the description name the supplier. The layer's Dependencies line was not updated (C01).
- R05 — repaired: 1.3 "Whittaker–Watson §15·5, p. 324, and §15·13, p. 304, at `μ = 0`".
- R06 — repaired: the Summary now reads "After the definitions and the equation, the integer degree comes first: the polynomials, their contour and Laplace integrals…", with no source named for the order.
- R07 — repaired: the module docstring has "Not statable here: Schläfli's loop integrals for `P_ν` and `Q_ν` of general degree (8.1), whose integrand is continued along a closed contour…".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.4 `integral_funkHecke_sphericalHarmonic` (sample) | `f = t`, `(l, m) = (1, 1)`, `θ₀ = π/2`, `φ₀ = 0.3`; `f = exp`, `(2, −1)`, `θ₀ = 2.5`, `φ₀ = 0.3` | both `−1.3825654 − 0.4276776i`; both `−0.3182248 + 0.0984385i` | holds on `(0, π)` | — |
| 3.4, further instances | `f = exp`, `(3, 2)`, `θ₀ = 0.4`, `φ₀ = 1.1`; `(1, 0)`, `θ₀ = 3.0` | both `−0.0106253 + 0.0145973i`; both `−2.23616` | holds | — |
| 3.4 negative control | `f = t`, `(1, 1)`, `θ₀ = −π/2`, `φ₀ = 0.3` | left `+1.3825654 + 0.4276776i`, right `−1.3825654 − 0.4276776i` | fails off the range, as the Check says | — |
| 3.1 Checks on `Y_{1,1}` | `sin θ < 0` | definition: `−(3/(8π))^{1/2} |sin θ| e^{iφ}`; harmonic `−(3/(8π))^{1/2}(x + iy)` gives `−(3/(8π))^{1/2} sin θ e^{iφ}` | Check true | — |
| 2.4, 14.17.9 with `m ≤ n` | `(l, m, n) = (1, 1, 2)`, `(2, 2, 3)`, `(3, 3, 3)`, `(1, 3, 3)`, `(2, 1, 3)` | `−1`, `0.5`, `−0.333333` against `(−1)^l/l`; `0`, `0` for `l ≠ m` | holds | — |
| 2.4, 14.17.9 outside `m ≤ n` | `(2, 2, 1)`; `(1, 2, 1)` | `𝖯²₁ = 0`, integral `0` against `½`; integrand `−(2 + x)(1 − x)^{1/2}/(6(1 + x)^{3/2})`, divergent at `−1` | negative control true | — |
| 2.5 Extensions | `n = 1`, `(θ₁, θ₂) = (0, π)`; `(−π/2, π/2)`, `φ = 0` | `−1 = P₁(1)P₁(−1) + 0`; outside the range `−1` against `+1` | holds on `[0, π]` | — |
| 3.2 Herglotz | coefficient of `tλ` at `θ = π/2`, `−π/2` | `a·x = r(cos θ − ½λ sin θ e^{iφ} + (2λ)⁻¹ sin θ e^{−iφ})`; `π/2`: both `−½ r e^{iφ}`; `−π/2`: `+½` against `−½` | holds on `[0, π]`; control true | — |
| 6.1 comparison through the supplier | `p = 1 − x²` on `(−1, 1)`, `p = x² − 1` on `(1, ∞)`; `𝖯₂`, `𝖯₃` | `((x² − 1)y′)′ − q y = 0`, so `Q = −q`; `q = 6 ≤ 12`, zeros `±3^{−1/2}` enclose `0` | supplier's hypotheses met (`p > 0`, `C¹`, `q` continuous) | C01, N01 |

The rows for the statements this change does not touch stand as in the previous review, of `acc2223`.

- Source locators checked against the text (4): DLMF 14.30.1 (range `0 ≤ θ ≤ π`, DLMF 14.30 line 88), 14.30.8_5 with its vector `a` (lines 498, 532–534), 14.17.9 with its printed condition `l > 0` only (DLMF 14.17 lines 386–391); Whittaker–Watson §15·5 (1920 edition: the section opens on p. 323 and its differential equation is on p. 324, lines 22330–22352).
- Cross-roadmap citations resolved (1): SpecialFunctionsBessel at its open head, the auxiliary Sturm comparison (README lines 134–138, used in its 10.1, line 1454, and 10.3); the statement quoted in this roadmap's contract agrees with it, hypotheses included. That roadmap names no Legendre section as a supplier, so there is no cycle.
- Automatic checks rerun at `687157d`: all pass, including the targeted build. Dependency check: `depcheck: 220 roadmaps, 2376 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing outside the folder changes.
- Elaboration (`lake env lean`): 45 warnings, all "declaration uses `sorry`", no error; 51 `#check` lines elaborate. The elaborated type of `integral_funkHecke_sphericalHarmonic` was read with `#check @`: it carries `0 < θ₀` and `θ₀ < π` and agrees with 3.4. One-tactic probe on it (`rfl`, `simp`, `simp` with the definitions unfolded): does not close.
- The pull request's title and description read against this head: they name the new supplier and the correction of 14.17.9; nothing contradicted.

Overlap check: read SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsStruve, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsGamma (open), SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsParabolicCylinder (main) as in the previous review; Sturm's comparison theorem and the simplicity of zeros: owner SpecialFunctionsBessel, cited here; Sturm's separation theorem and the continuity of the zero count: owner this roadmap; nothing else shared.

Source independence: changed passages only; 3 passages compared with 2 sources (DLMF §14.17(iii), §14.30(ii); Whittaker–Watson §15·5), none shared; largest share DLMF Chapter 14, about 443 of 571 locator mentions; contents not compared again (the change adds, removes or reorders no layer; previous result: independent). Olver, Lebedev, Temme, Andrews–Askey–Roy, Atkinson–Han, Kristensson, Magnus–Oberhettinger–Soni and Beals–Wong could not be read.

Research link: the roadmap states the Legendre functions of complex degree and order as in Olver (1974/1997) and DLMF Chapter 14; the spherical harmonics and Funk–Hecke formula of Atkinson–Han (2012); `Q_{s−1}` on `t > 1` is the kernel AutomorphicSpectralTheory §0.35 uses. Rests on the README's Summary, Scope and Downstream consumers.

## Not verifiable

- Andrews–Askey–Roy Thm 9.7.1, (9.7.4), p. 459 and Atkinson–Han Thm 2.22, (2.62), p. 36 (the locators of 3.4, in the sample): no legal copy readable; the statement itself was checked by computation.
- Beals–Wong Thm 3.3.3, p. 65 and Temme Thm 4.4, p. 97 (6.1): no legal copy found.
- Whittaker–Watson, fourth edition (1927), which the README cites: not readable; §15·5 was checked in the 1920 third edition only.
- The other items of the previous review's list stand unchanged (Olver, Lebedev, Kristensson, Magnus–Oberhettinger–Soni, the DLMF erratum versions, the description's account of its local reviews).

## Source issues

- **Error** in DLMF 1.2.8 at equation 14.17.9, §14.17(iii): the source says the integral of `𝖯^l_n 𝖯^{−m}_n/(1 − x²)` over `(−1, 1)` is `(−1)^l δ_{l,m}/l` for all nonnegative integers with `l > 0`; it should be restricted to `m ≤ n`, since at `l = m > n` the integral is `0` and at `l ≤ n < m` it diverges; affects a stated result.

## For the human reviewers

- Licence: README "Prior formalization" (lines 1635–1665) names `lean-DLMF` (Apache-2.0) as source material for every layer and maps each layer to its files; `Suggested.lean` shares declaration names with it (for example `ferrersP_zero_count`), with different statements.
- Licence: DLMF pages were read from `dlmf.nist.gov`, a host the sources service has in no licence class; they were fetched as an institutional copy.
