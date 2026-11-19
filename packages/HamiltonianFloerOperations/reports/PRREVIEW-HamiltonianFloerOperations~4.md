# Review of HamiltonianFloerOperations (pull request #2590 at 9e42ea5)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 90 lines changed since `662b427`, and the one finding of the previous review is repaired. The dense-period example of §6.1 and §8.6 is now `S² × S² × S²` with areas `1`, `√2`, `√3`, on which the areas are dense at a fixed Chern number, and I recomputed it; the new locators (FOOO Proposition 11.6 (4) for §2.4, Theorem 11.11 for §8.1) and the Fubini–Study and tame-independence additions of §8.4 hold at their sources. No finding and no small correction; one format note, not blocking. For the humans: the Piunikhin–Salamon–Schwarz chapter still has no legal open copy.

## N01 — The homotopies of §6.3 and the unit of §6.4 still carry no source locator; the description says why (none of the cited texts proves them for the pair-of-pants product on a closed target), but the README does not, so a reader of the README alone cannot tell an omission from a statement that these targets are the roadmap's own. One clause in §6.3 saying so would do.

## Previous findings

- R01 — repaired: the Check of §6.1 (lines 670–678) and §8.6 (lines 975–977) use `S² × S² × S²` with areas `1`, `√2`, `√3`, and say that `S² × S²` "does not test §3.4".
- C01 — partly repaired: §2.4 now cites "FOOO, Proposition 11.6 (4) (p. 62), in that source's conventions", and §8.1 cites Theorem 11.11; §6.3 and §6.4 have no locator (N01).
- C02 — repaired: "`ℂPⁿ` with its Fubini–Study form" in the Summary, §8.4 and the Lean docstring; GromovWittenTheory §2.3 is in the *Needs:* line, the Layer 8 Dependencies, the scope and the contract.
- N01 — repaired: "only in its Checks and in the Examples of its Layer 7" (§8.4).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §6.1 Check, three-factor product | `Γ = ℤ³`; level `a + b + c = k` | `ω = k + b(√2−1) + c(√3−1)`; ratio `0.7321/0.4142 = 1.7674 = √6+√3−√2−1`, irrational as `1, √2, √3, √6` are independent | holds |
| §6.1 Check, values in `[0, 1)` | `k = 0`; `(b, c) = (1,0), (0,1), (2,−1), (−1,1)` | `0.414, 0.732, 0.096, 0.318`; `(b, c) ↦ ω` injective, image dense, so infinitely many | holds |
| §6.1 Check, `S² × S²` clause | level `a + b = k` | `ω = k + b(√2−1)`, spacing `0.414`: discrete; on all of `ℤ²` dense | holds |
| §6.1 Check, rigid count fixes `c₁` | §1.3 index `= 0` | `2c₁(A) = μ₀ − μ₁ − μ₂ + n`, one level `a + b + c = k` | holds |
| §8.6 (sample) | as §6.1; `Γ` | `ω` injective on `ℤ³`, joint kernel `0`, so `Γ = ℤ³`; dense on each Chern level | holds |
| §2.4 index locator | FOOO (11.14), `ℓ = 0`; ends | source: `μ₃ − μ₁ − μ₂ − n`, inputs at `τ → −∞`, output at `+∞`; here `μ₁ + μ₂ − μ₀ − n`, inputs positive: both `μ(+) − μ(−) − n` | holds |
| §2.4, consistency with cylinders | FOOO (6.4), `ℓ = 0` | `μ(γ′) − μ(γ) − 1`, positive end minus negative end: same Conley–Zehnder direction as (11.14) | holds |
| §8.1 locator | FOOO Theorem 11.11, `b = 0`; aspherical `X` | Piunikhin map carries `∪_b` to the pants product over `Λ↓` with coefficients in `ℂ`; no nonconstant spheres when `ω` vanishes on `π₂`, so only the `A = 0` term | holds |
| §8.4 (sample), form and structure | Fubini–Study; standard `J` | `J` compatible, hence tame; GromovWittenTheory §2.3: `I^(J₀) = I^(J₁)` along a tame path, any two tame structures joined | holds |
| §8.4 Check | `ℂPⁿ` | `deg x^(n+1) = 2n + 2 = 2c₁(L)` | holds (untouched) |
| Headline 3 (docstring) | README Summary against Lean docstring | both: "`ℂPⁿ` with its Fubini–Study form", `(n+1)`-st power `= e^(−L) · 1` | agree |

The rows for the untouched statements stand as in the previous review, of `662b427`.

- Source locators checked against the text: 3 of 3 changed or added. FOOO2017 lines 2896–2908 and 2953–2956 (Proposition 11.6 (4), p. 62), lines 1911–1913 (Proposition 6.2 (4)), lines 3080–3081 (Theorem 11.11, p. 66), lines 640–676 (the Novikov field, coefficients in `ℂ`).
- Cross-roadmap citations resolved on main: GromovWittenTheory §2.3 (its README lines 314–318), its Layer 7 Examples (lines 671–674), §3.1, §4.3, §7.2.
- Library declarations: the diff adds or changes none.
- Dependency check: `depcheck: 200 roadmaps, 2199 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all pass at this head; none set aside.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HamiltonianFloerOperations/Suggested.lean` exits 0 with no output; the file declares nothing (docstring and empty namespace), one `import Mathlib`, no `set_option`, no sorry'd data; nothing to probe for padding.
- Headline theorems: unchanged (product algebra; multiplicative PSS over `ℚ`; aspherical and `ℂPⁿ` computations); none statable at the pins, each named in the module docstring with what it lacks.
- Pull-request text against the head: 23 Checks in 19 sections (counted); the description names the three-factor example, the §2.4 and §8.1 locators, the Fubini–Study form and GromovWittenTheory §2.3; no sentence contradicted. No change outside the folder.

Overlap check: read DGFloer, GromovWittenTheory, FukayaTheory, SymplecticFieldTheory, AnalyticStableMaps; the change adds no object: independence of the tame structure stays GromovWittenTheory's (§2.3, cited), the `ℂPⁿ` line count stays owned here; no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 3 passages compared with 1 source (§2.4 against FOOO2017 lines 2953–2956, §8.1 against FOOO2017 lines 3063–3081, the Check of §6.1, which has no source), none shared; largest share FOOO2017, 8 of 16 locators; the diff adds, removes or reorders no layer, so the contents comparison stands as in the previous review: independent. PSS1996 could not be read.

Research link: Layers 6–7 are the pair-of-pants product and ring isomorphism of Piunikhin–Salamon–Schwarz (1996), which Fukaya–Oh–Ohta–Ono (2011/2017, Theorem 11.11) use for spectral invariants with bulk; Lu (2004) and Pardon (2016) give the setting on every closed target. Rests on the README's sources and the texts read.

## Not verifiable

- PSS1996, Theorem 5.1 (§7.4): no legal open copy; cited by its locator as Lu identifies it (unchanged since the previous review).

## Source issues

- **Misprint** in FOOO2017 at Proposition 11.6 (3), display (11.13), p. 62: the second input of the first factor carries the cap of the first input; it should carry its own cap, w₂; affects nothing.

## For the human reviewers

- Licence: the Piunikhin–Salamon–Schwarz chapter (README References), cited for Theorem 5.1 in §7.4, has no legal open copy that I could find; it is cited by locator alone.
