# Review of WeightsInEtaleCohomology (pull request #1001 at b2f26e2)

**Verdict:** needs changes

Incremental re-review of 31 changed lines since `2103290`, with the pull request's title and description read against this head. One finding, in the new provenance section.

## R01 (P3) — Provenance paragraph cites DeligneWeightsAndPurity sections that do not state integrality, `ℓ`-independence or the `H^{2d}` root

**Location:** `TauCetiRoadmap/WeightsInEtaleCohomology/README.md` line 848: “purity, integrality and `ℓ`-independence of `det(1 − tF ∣ Hⁱ)` for smooth proper schemes, … and the roots `1` on `H⁰` and `q^d` on `H^{2d}` (DeligneWeightsAndPurity §§0.6, 0.12, 1.7, 1.10, 4.3)”.

**Claim:** The five sections cited do not contain three of the statements attributed to them: integer coefficients, independence of `ℓ`, and the smooth proper (rather than projective) case; and the root `q^d` on `H^{2d}` is stated there only for curves.

**Witness:** DeligneWeightsAndPurity at its open head: §4.3 is purity for smooth projective `X₀` only and defers integral factors to §4.4; integer coefficients independent of `ℓ` for proper smooth `X₀` are §7.15(ii); §1.7 treats `H⁰`, `H¹`, `H²` of a curve (`d = 1`).

**Repair:** Replace the parenthesis by “(DeligneWeightsAndPurity §§0.6, 0.12, 1.7, 1.10, 4.3, 4.4 and 7.15; for `d > 1` the root `q^d` on `H^{2d}` is the trace isomorphism of EtaleCohomologyFoundations §§F.5–F.6)”. Checked on the instance: §7.15(ii) states integrality and `ℓ`-independence for proper smooth schemes, §4.4 the degree-factor extraction it uses.

## Previous findings

- The previous report, of `2103290`, was an acceptance with no finding; there is none to account for.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Line 108, “Sections 2.9, 3.1, 3.10 and 4.3 supply …” | the four headings at the DeligneWeightsAndPurity head; every other DWP.2–4 use in the README | §2.9 symplectic estimate, §3.1 radical-quotient descent, §3.10 rational factors, §4.3 smooth projective purity; README uses of layers 2–4: lines 425, 560–574, 610, 658 — only these four | Contract equals use. |
| Line 538, “none of them is a step in DWP's proof of purity” | *Needs* of DWP §§4.3, 7.15, 2.9, 3.10 | §4.3 ← §7.15(i); §7.15 ← 7.12, 7.1, 4.4, 7.10; §2.9 ← §5.9; §3.10 ← §§7.15, 9.12. None of 2.9, 3.1, 3.10 occurs upstream of §7.15 | Holds; no cycle. |
| §4.3 (line 570), instantiation of DWP §2.9 with rationality from §3.10 | `n = 1` cubic pencil; degree-`e` point over `𝔽_{q^d}`; `V = 0`; even `n` | factor `1 − a_x t + q_x t²`, roots of norm `q_x^{1/2}`, weight `1 = β`; multiplier `(q^{de})^n = q^{den}` on both sides; zero quotient: factor `1`, conclusion vacuous; even `n`: symmetric, hypothesis (i) fails | Consistent with DWP §§2.9, 3.1, 3.10. |
| Line 852, reciprocal form `det(1 − tφ) = det(1 − t^f φ^f ∣ V₀)` against §1.4's `det(X^f − A_{f−1}⋯A_0)` | `f = 1`; `f = 2`, rank one, return map `1`; rank `0` | `f = 1`: both sides the original polynomial; `f = 2`: `1 − t²` and `X² − 1`, reverses of each other; rank `0`: `1` and `1` | The two forms agree; the external declaration exists with `[Infinite K]`. |
| Line 853, trivial representation `(X − 1)^r` and local factor `1 − T^{deg x}` | `r = 0, 1`; a closed point of degree `2` | `r = 0`: `1`; `r = 1`: root `1`, norm one, weight `0` (§1.7's constant Check); degree `2`: `1 − T²`, the factor of `Spec 𝔽_{q²}` in DWP §1.10's Check | Agrees with §1.7 and the supplier. |
| `newform_ramanujan` (unchanged; the provenance text says the Lean file has no counterpart) | external repository's README at `27cdb20` | no modular forms, abelian varieties or Jacobians named there; the theorem's signature is as in the worker's elaborated listing, no binder lost | Stands. |

The rows for the untouched statements stand as in the previous review, of `2103290`.

- Gate, run on this head: every counter 0, result `OK`; the worker's run adds `build=0`.
- Dependency check with the merge order, `--movable`, the content repository and `--pr 1001`: `depcheck: 261 roadmaps, 2614 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/WeightsInEtaleCohomology/Suggested.lean` with `lake env lean`: one warning, `declaration uses sorry` at line 55, exit 0; the file is unchanged since `2103290`.
- Cross-roadmap citations of the changed passages resolved, 14: DeligneWeightsAndPurity §§0.6, 0.12, 1.7, 1.10, 2.9, 3.1, 3.10, 4.3, 7.15, 9.12 at its open head; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 at its open head; EtaleCohomologyFoundations §§F.2.1, F.2.2 and AbelianSchemesAndArithmeticModuli §A6.10 on main. All exist; R01 is the one that does not say what it is cited for.
- External repository read at commit `27cdb20`: the directory listing has the seven files named (lines 852–855); its README states Apache-2.0, Freitag–Kiehl, the Stacks project in Lean and Lean `v4.34.0-rc2` (this repository pins `v4.36.0-rc2`); four files opened and their statements match the README's descriptions.
- Description checked against the head: title, summary block and prose stand; the change adds no supplier, removes no section or declaration. The new section is non-normative and nothing in the description describes it.
- Seeded sample: only “4.2 The arithmetic vanishing quotient and its parity” borders the diff (its text is unchanged); the changed lines carry no new source locator, and no source was opened this round. Diff outside the folder against `origin/main`: empty. Overlap facts: none.
- The citation resolver's leads: `Weil.reverse_charpoly_eq_comp_of_cyclic` (line 852) is the external repository's declaration and exists there; `VanishingCycles.etaleTraceFormula` (line 101) is untouched text and is the name InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 gives its target. Remarks only.

Overlap check: read DeligneWeightsAndPurity, LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations; nothing shared — the changed passages narrow the citation of DeligneWeightsAndPurity to §§2.9, 3.1, 3.10, 4.3 and leave the estimate, the descent and the rational factors with it.

Source independence: changed passages only — 7 passages compared with 1 external text (the external repository's README and four of its files) and with the supplier sections they cite, none shared; largest share WII, 13 of 68 locators; arrangement not compared again (no layer added, removed or reordered).

Research link: Layer 6 states the Ramanujan bound for newforms (Deligne 1968/69, 1974, 1980) and Saito's local compatibility at `p` for Hilbert eigenforms (Saito 2006); Layers 1–2 are the good-reduction weight input of Lawrence–Venkatesh (2020) and of Faltings's finiteness theorems. Rests on the README's summary and references.

## Not verifiable

- Line 854, “Its `ι`-purity already asserts algebraicity of each root”: the file opened derives algebraicity from the purity hypothesis, which agrees with the sentence, but the definition of the external predicate was not opened.
- Mokrane, *La suite spectrale des poids en cohomologie de Hyodo–Kato* (README line 431): no legal text found at an earlier review; not reopened, the passage is unchanged.
- Gillet–Messing, *Cycle classes and Riemann–Roch for crystalline cohomology* (README line 458): the same.

## Source issues

- none

## For the human reviewers

- Licence: README lines 842–857 map targets to the public repository AxiomMath/Weil (its README states Apache-2.0; the files opened carry no licence header) and say no code is transferred; `Suggested.lean` is unchanged and its two declarations have no counterpart there.
