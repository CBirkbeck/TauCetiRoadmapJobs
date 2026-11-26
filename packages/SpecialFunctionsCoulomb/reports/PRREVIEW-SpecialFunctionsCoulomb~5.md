# Review of SpecialFunctionsCoulomb (pull request #3074 at ee37fe5)

**Verdict:** accepted

**Summary.** Accepted: no finding, and no small correction or format note. This is an incremental re-review of the 74 lines changed since `7773289`: the previous review had no findings, and its five small corrections and one format note are all repaired, with no new problem introduced. The value of `h` at the poles of `Γ(ℓ + 1 + κ)` for `r < 0` and the corrected digit of `c` in 6.3 were recomputed from the definition and hold; the new citations of the logarithmic series of `U` resolve on main and in DLMF 13.2.9. The four points for the human reviewers stand as before.

## Previous findings

The previous report (of `7773289`) had no finding (no R-numbered remark). Its small corrections and its format note:

- C01 — repaired: "For `ε < 0`, `r < 0` the term with `M_{κ,ℓ+½}` is absent (`S = 0`), also where `Γ(ℓ + 1 + κ)` has a pole (`κ = −n`, `n > ℓ`); there `h` is the first term alone" (Conventions). Recomputed, see the table.
- C02 — repaired: "Two targets need a later layer, so the layers are not in build order there: the cross-product of 1.4 is proved after 2.1, and the large-`|η|` forms of 5.2 after 6.1, 6.3 and 6.4" (How to read the build). The `*Needs:*` lines agree; no other target names a later layer.
- C03 — repaired: "the logarithmic series of `U` with integer `b = 2ℓ + 2` (DLMF 13.2.9, QuantumFoundations §9.4, consumed for `kummerU` through SpecialFunctionsConfluent 1.4 and 2.1)" (3.2; likewise 6.4, both `*Needs:*` lines, Scope and the supplier contracts).
- C04 — repaired: "`c = −0.0544224046489816`" (third Check of 6.3). The value is `−0.05442240464898155037…` at 60 and at 90 digits, so `…816` is the right rounding; the digits `…815445` quoted in the previous report were themselves off from the eighteenth place.
- C05 — repaired: the description now lists SpecialFunctionsConfluent under "On main", with §9.4 of QuantumFoundations named for 3.2 and 6.4; no "Open PRs" heading remains.
- N01 — repaired: "which holds numerically but whose convergence this roadmap does not prove".

## Verified sound

Values were computed in 60-digit decimal arithmetic (repeated at 90 digits) from the definition of `h` as `Suggested.lean` writes it, with `U(a, n + 1, z)` from the series DLMF 13.2.9 and `Γ`, `ψ` from Stirling's series after a shift; the code reproduces `Γ(½)² = π` to `10⁻⁵⁶`, `ψ(1) = −γ` and `U(1, 2, 2) = ½`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: `h` for `ε < 0`, `r < 0` at `κ = −n`, `n > ℓ` (changed) | `(−1/4, 0, −1.4)`, `(−1/9, 1, −1.4)` | first term alone: `0.02476095095908489`, `−0.07515401071032613`; equal to the 6.2 and 6.4 values of the previous table; `a = ℓ + 1 + n = 3, 5` | holds | none |
| 6.2 `wronskian_coulombEnergyH_coulombEnergyF`, hypothesis cited by the changed text | same two points | `hεn` restricts only `0 < r`; both points admitted; `A = 1`, `8/9 ≠ 0`, so `hasSum_coulombEnergyH` admits them too | holds | none |
| 6.3 Check, `c` at `(−0.13, 1, 3)` (changed) | `h/(2A)^{1/2}`, `A = 0.87` | `h = −0.07178808217477905490`, `c = −0.05442240464898155037`; printed `−0.0544224046489816` | holds | none |
| 6.2 Checks, as control of the computation | `h(−0.13, 1; 1.4)`, `h(−0.13, 2; 3)` | `0.728096697899092404`, `1.10228126921320329`; README `0.728096697899092`, `1.1022812692132` | holds | none |
| 3.2 `hasSum_coulombH_log`, route through DLMF 13.2.9 (changed) | `a = ℓ + 1 ± iη`, `n = 2ℓ + 1`, `η ≠ 0` | `a ∉ {0, −1, …}` as 13.2.9 requires; `a − n = −ℓ ± iη`, so the prefactor is `1/Γ(−ℓ ± iη)` as stated | holds | none |
| 6.4 `hasSum_coulombEnergyH`, route through DLMF 13.2.9 (changed) | `a = ℓ + 1 − κ`: `ε > 0`; `ε < 0`, `r < 0`; `ε < 0`, `r > 0` | non-real; `ℓ + 1 + ν > 0`; nonpositive integer only at `ν = n > ℓ`, which `hεn` excludes | holds | none |
| How to read the build: 1.4 after 2.1, 5.2 after 6.1, 6.3, 6.4 (changed) | all 20 `*Needs:*` lines | 2.1 needs 1.1, 1.2; 6.1 none; 6.3 needs 1.1–1.3, 6.1, 6.2; 6.4 needs 2.1, 6.1–6.3: none names 1.4 or Layer 5 | holds | none |

The rows for the untouched statements stand as in the previous review, of `7773289`; the diff changes no Lean statement (`Suggested.lean` is unchanged).

- Source locators checked against the text: DLMF 13.2.9 (DLMF13-2 lines 454–458: `b = n + 1`, `a ≠ 0, −1, −2, …`), the one locator the diff adds; it falls in the sampled 3.2 and 6.4.
- Cross-roadmap citations resolved on main: QuantumFoundations §9.4 (the integer-`b` limits with logarithmic terms, DLMF 13.2.9–13.2.11); SpecialFunctionsConfluent 1.4, 1.5 (which names the series as an input from §9.4 through its 2.1) and 2.1 (agreement of `kummerU` with §9.4's `U`); the linked file `../SpecialFunctionsConfluent/README.md` exists. SpecialFunctionsEiLiErfIncompleteGamma and SpecialFunctionsParabolicCylinder are on main, as the description says.
- Dependency check: `depcheck: 101 roadmaps, 1131 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is not yet in the merge order and is placed after its last supplier.
- Automatic checks: all pass on this head; none set aside. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates at the pins with 35 `sorry` warnings and the output of its `#check` lines, nothing else.
- The pull request's title and description were read against this head: suppliers, layer list, counts (35 statements) and the list of DLMF corrections agree with the files; nothing is contradicted or left out.

Overlap check: read SpecialFunctionsConfluent, SpecialFunctionsBessel, SpecialFunctionsParabolicCylinder (main) and QuantumFoundations §9.4–§9.5; Tricomi's `U` and its logarithmic series at integer `b`: QuantumFoundations §9.4, cited; `kummerU` and the Whittaker functions: SpecialFunctionsConfluent, cited; nothing else shared by the changed passages, and the ownership recorded in the previous review is unchanged.

Source independence: changed passages only; 5 passages compared with 1 source (DLMF 13.2), none shared; largest share DLMF Chapter 33, 77 of 91 locators as counted in the previous review (the diff adds only citations of DLMF 13.2.9); the diff adds, removes and reorders no layer, so the arrangement was not compared again (previous result: the layers regroup the sections of DLMF Chapter 33, not one to one); the five books (Buchholz, Temme, Olver, Chadan–Sabatier, Hall) could not be read.

Research link: The Coulomb functions are the continuum and bound radial states of the hydrogen Hamiltonian whose spectral theory QuantumFoundations §9.5 plans, and the free and Coulomb solutions of scattering theory (Chadan–Sabatier 1989, README); the continued fraction of 2.2 is that of Barnett et al. 1974 (DLMF33-8 lines 213–214). Rests on the README and DLMF Chapter 33.

## Not verifiable

- Buchholz 1969, Temme 1996, Olver 1997, Chadan–Sabatier 1989 and Hall 2013: no legal copy readable, as in the previous review; the diff changes none of their locators.

## Source issues

- none

## For the human reviewers

- **Scope.** Seven stated targets (4.3, 5.1, 6.3, 6.4, 7.1) differ from DLMF Chapter 33 as printed and online, and no published source is cited for the corrected forms; each was recomputed in the previous review and holds.
- **Licence.** The pull request's description says an unpublished Lean development (`lean-DLMF`, `DLMF/Coulomb/`) was consulted for the list of formulas and that nothing is copied from it; it was not available to compare with `Suggested.lean`.
- **Not tested.** DLMF Chapter 33 carries 77 of 91 locators and was read; the five books cited for the synthesis (14 locators) could not be read, so wording and arrangement were not compared with them.
- **Licence.** The Summary's sentence on the singularities of the equation (README lines 10–11) runs parallel to DLMF33-2 lines 100–102, with a longest shared run of 7 words; the previous review took it as forced by the mathematics.
