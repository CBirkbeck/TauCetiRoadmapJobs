# FIX-PKG-MordellLawrenceVenkateshPartII~13

This round settles the one finding of `REV-PKG-MordellLawrenceVenkateshPartII~12`. With a single review,
the id below is unqualified. `README.md` means `packages/MordellLawrenceVenkateshPartII/README.md`.
`Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

The supplier-contract consumer lists now match the `*Needs:*` lines.

- **MordellLawrenceVenkatesh §1.2.** "consumed in §§2.9, 7.3 and 7.6" → "consumed in §§2.9 and 7.3, and
  through §2.9 in §§4.5, 6.1 and 7.6".
- **SheafConvolutionOnAbelianVarieties §6.7.** "§10.5" → "§§4.3 and 10.5".
- **SheafConvolutionOnAbelianVarieties §§8.2–8.3.** "§§1.7 and 4.3" → "§§1.7, 4.3 and 10.5".
- **PadicHodgeTheory §§8.1–8.2.** "§§0.5, 0.7, 1.2 and 7.5" → "§§0.1, 0.5, 0.7, 1.2 and 7.5".

**Evidence.** A script collected all 79 `*Needs:*` lines with their subsections. The supplier sections
are named by these subsections:

| Supplier section | Named by |
|---|---|
| MordellLawrenceVenkatesh §1.2 | §§2.9, 7.3 |
| SheafConvolutionOnAbelianVarieties §6.7 | §§4.3, 10.5 |
| SheafConvolutionOnAbelianVarieties §8.3 | §§1.7, 4.3, 10.5 |
| PadicHodgeTheory §8.1 | §§0.1, 0.5, 0.7, 7.5 |
| PadicHodgeTheory §8.2 | §§0.1, 0.5, 1.2 |

The text confirms the uses:

- §4.3 (README line 1854) assumes "classical convolution monodromy as in SheafConvolutionOnAbelianVarieties §6.7".
- §10.5 (README line 3132) uses that roadmap's §8.3 character.
- §0.1's definition requires the étale–crystalline associated-sheaf comparison, which is
  built on PadicHodgeTheory §8.1.
- Round 11 rerouted §7.6 through §2.9 with `E = E₀ = ℚ_ℓ` (README lines 2529–2533). It no longer cites
  Faltings's lemma directly.

**Departure from the suggested text.** The review proposed "and through §2.9 in §7.6". §§4.5 and 6.1
also apply §2.9 over `K = ℚ`, so they reach Faltings's lemma the same way. The list therefore names all
three subsections whose `*Needs:*` line names §2.9.

**The same pattern elsewhere.** I checked every consumer list in the supplier contracts and the
in-text consumer sentences against the same scan. Five more were repaired:

- **§2.9's own sentence.** "The case `K = ℚ` is the one consumed in §§4.5 and 6.1" became "§§4.5, 6.1
  and 7.6". Round 11's §7.6 route applies §2.9 over `K = ℚ` but did not update this sentence.
- **MotivesAndAlgebraicCycles.**
  - The §6.8 list named §0.3, but §0.3 uses only the reconstruction of §§6.1–6.2: its route ends at
    "the reconstruction of MotivesAndAlgebraicCycles §6.2". It names no torsor.
  - §6.8 now reads "Consumed in §§0.6, 2.4, 2.6, 3.1 and 7.1".
  - The §§6.1–6.3 bullet had no list. It gains "Consumed in §§0.3, 0.6, 2.4 and 7.1": §0.3 names
    §§6.1–6.2, §0.6 names §§6.2–6.3, §2.4 names §6.2 and §7.1 names §6.3.
- **LanglandsParameterStacks "through §2.3".** The old list was "§§2.5, 2.9–2.10, 5.2, 5.5, 5.7–5.8, 7.2
  and 7.5". It left out §§4.5, 5.4 and 6.1, whose `*Needs:*` lines name §2.3. It also included §5.2,
  whose statement opens "Let `G` be as in §2.3, `P` a Richardson parabolic…" but whose `*Needs:*` line
  did not name §2.3.
  - The list now reads "§§2.5, 2.9–2.10, 4.5, 5.2, 5.4–5.5, 5.7–5.8, 6.1, 7.2 and 7.5".
  - §5.2's `*Needs:*` line is now "§§2.3, 2.5, 5.1", because its statement uses §2.3's setting.
- **MordellLawrenceVenkatesh §§1.10, 1.12–1.13.** No `*Needs:*` line names §1.12. MordellLawrenceVenkatesh
  §1.13 needs its §1.12 and states its conclusion in that weight. The bullet now says "consumed in §5.4,
  §1.12 through §1.13, whose conclusion is stated in that weight".

**Lists checked and left unchanged.** Every other list matches the scan, including:

- MordellLawrenceVenkatesh §§0.3–0.4, 0.24, 2.5–2.6, 2.8 and 2.11
- SheafConvolutionOnAbelianVarieties §§0.2, 2.4, 3.1, 3.3, 4.8 and 5.2–5.3
- PadicHodgeTheory §§3.3–3.6, 4.4, 5.5, 6.1 and 7.3
- ShimuraData, CrystallineCohomology §CR.7.3, EtaleCohomologyFoundations §F.3 and
  ClassicalAdicEtaleCohomology §8.2
- DeligneWeightsAndPurity, WeilConjectures, InverseGaloisAndArithmeticFundamentalGroups,
  EtaleDualityAndPerverseSheaves and LefschetzPencilsAndVanishingCycles
- SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry, AbelianSchemesAndArithmeticModuli,
  HeightsRationalPointsAndObstructions and FaltingsFinitenessAndIsogenyTheorems
- §3.4's "consumed in §§4.5, 6.1 and 7.5"

ClassicalArithmeticCompletion §2.56 is consumed in Layer 8 through gap:eulerian-log-concavity-and-variance,
whose `section` in `design/plan.json` is §2.56. The eleven layer *Dependencies* paragraphs agree with
their `*Needs:*` lines. No statement and no Lean declaration changed.

## Checks run

- **Elaboration.** From the content checkout, `lake env lean packages/MordellLawrenceVenkateshPartII/Suggested.lean` prints only
  `declaration uses sorry` at 69:8 and 109:8. The imports are only `import Mathlib`.
- **Signatures.** I put `#check @name` for all six declarations in one scratch copy and elaborated it
  once. Each type is unchanged and agrees with its README statement (§§8.4, 9.1, 9.3):
  - `eulerian : ℕ → ℕ → ℕ`
  - `eulerian_central_mass_le_half : ∀ n, 2 ≤ n → 2 * ∑ q ∈ range n, eulerian n q ^ 2 ≤ n.factorial ^ 2`
  - `HypersurfaceMonomial : ℕ → ℕ → Type`
  - `IsSmoothHypersurface : {k} → [Field k] → {n} → MvPolynomial (Fin (n + 1)) k → Prop`
  - `HasGoodReductionOutside : {n} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`
  - `integralHypersurfaces_not_zariskiDense`, as in the file

  No binder is lost, and the file was not edited.
- **Dependency check** (the prescribed command), after the last edit:

  ```text
  depcheck: 259 roadmaps, 2485 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line, and no notion was moved.
- **`roadmaps resolve`** on the README finds no cross-roadmap citation and no Lean name that resolves
  nowhere. The one earlier lead in `citations.md`, `VanishingCycles.lisseDirectImageTransport`, is a
  target name of EtaleCohomologyFoundations on main (its README line 1135).
- **Cited headings.** The headings this round's edits cite resolve at their current heads:
  - SheafConvolutionOnAbelianVarieties: §6.7 "Classical convolution monodromy", the paragraph "8.2
    Character generic in every conjugate" and §8.3 "Uniform big monodromy on a character orbit"
  - PadicHodgeTheory §§8.1, 8.2
  - MotivesAndAlgebraicCycles §§6.1, 6.2, 6.3, 6.8
  - LanglandsParameterStacks §§2.3, 2.4
  - MordellLawrenceVenkatesh §§1.2, 1.10, 1.12, 1.13
- **`*Needs:*` graph** after the edits:
  - 79 lines, none missing and no cycle.
  - The only same-layer forward references are §2.3 → §2.11, §2.9 → §2.11 and §8.1 → §8.4. These are
    the three the "How to read the build" paragraph states.
  - The new edge §5.2 → §2.3 points backwards, and §2.3 needs nothing in Layer 5.
- **Sources.** No new source was cited, and `needs-references.toml` was not written.

## Adversarial pass (changed text)

The changes are bookkeeping only. Each row below records the scan values that the new list must equal.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| MordellLawrenceVenkatesh §1.2 list | all `*Needs:*` lines; consumers of §2.9 | direct {2.9, 7.3}; §2.9 named by {4.5, 6.1, 7.6} | equal to the new text |
| SheafConvolutionOnAbelianVarieties §6.7 list | §§4.3, 10.5 bodies | {4.3, 10.5}; §4.3 line 1854 and §10.5 line 3132 use it | equal |
| SheafConvolutionOnAbelianVarieties §§8.2–8.3 list | §8.2, §8.3 separately | §8.2: none named directly; §8.3: {1.7, 4.3, 10.5} | equal (range) |
| PadicHodgeTheory §§8.1–8.2 list | §8.1, §8.2 separately | §8.1: {0.1, 0.5, 0.7, 7.5}; §8.2: {0.1, 0.5, 1.2}; union {0.1, 0.5, 0.7, 1.2, 7.5} | equal |
| MotivesAndAlgebraicCycles §§6.1–6.3 / §6.8 | §§6.1, 6.2, 6.3, 6.8 separately | 6.1: {0.3}; 6.2: {0.3, 0.6, 2.4}; 6.3: {0.6, 7.1}; 6.8: {0.6, 2.4, 2.6, 3.1, 7.1}; §0.3 route names only §6.2 | equal; §0.3 removed from §6.8 |
| LanglandsParameterStacks "through §2.3" | consumers of §2.3 after §5.2 edit | {2.5, 2.9, 2.10, 4.5, 5.2, 5.4, 5.5, 5.7, 5.8, 6.1, 7.2, 7.5} | equal |
| §5.2 `*Needs:*` | statement "Let `G` be as in §2.3" | §2.3 precedes §5.2; §2.3's needs: LanglandsParameterStacks, ArithmeticGaloisRepresentations, §2.11, Tau Ceti, ReductiveGroups; no Layer 5 | no cycle, no forward edge |
| §2.9 consumer sentence | §7.6 route "§2.9 over `K = ℚ`" | named by {4.5, 6.1, 7.6}, all over `ℚ` | equal |
| MordellLawrenceVenkatesh §1.12 phrase | MordellLawrenceVenkatesh §1.13 statement and needs | §1.13 needs 1.11, 1.12; conclusion "weight of the Hodge filtration … equals `w/2`" is the §1.12 mean weight; §5.4 names §§1.10, 1.13 | accurate |
| Layer Dependencies paragraphs | all eleven | Layer 5 lists Layers 2 and 4 (covers the new §2.3 edge); Layer 0 lists MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; Layer 4 lists SheafConvolutionOnAbelianVarieties §§2.4, 6.7, 8.3 | unchanged, agree |

## For the maintainer

- **Changed names.** No section, target or Lean name was renamed or renumbered. Nothing that other
  roadmaps cite changed.
- **Ownership.** No new object was stated, so no ownership check was needed. As in the review,
  ownership against LawrenceVenkateshMethod (a package on another branch whose files are not in this
  checkout) was not checked.
- **Human-reviewer items.** The two licence questions in the review's "For the human reviewers"
  section (Serre uncertified; the LV copy's host) were not acted on.
- **Untrusted text.** The review contains no instruction addressed to the worker, and nothing suspicious
  was found.
