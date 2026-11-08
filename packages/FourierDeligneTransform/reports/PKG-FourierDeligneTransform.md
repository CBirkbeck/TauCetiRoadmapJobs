# PKG-FourierDeligneTransform: package report

Deliverables:
- `packages/FourierDeligneTransform/README.md`
- `packages/FourierDeligneTransform/Suggested.lean` (unchanged)
- `packages/FourierDeligneTransform/metadata.toml` (unchanged)
- `packages/FourierDeligneTransform/sources.toml`
- `packages/FourierDeligneTransform/design/plan.json` (new, holding only a top-level `gaps` list)
- this report

## Why this run changed the package

The earlier runs of this job were refused for one reason: this roadmap was missing from the merge order. Since then a maintainer commit on the board placed it at `merge-order/ORDER.txt` line 58, right after EtaleCohomologyFoundations and before DeligneWeightsAndPurity (line 84). The commit message says this placement follows the accepted target.

That placement left two of the README's suppliers later in the order than this roadmap:
- **EtaleDualityAndPerverseSheaves (line 102):** its §2.7 (smooth pullback and affine perverse exactness), §2.10 (simple perverse sheaves) and §5.2 (curve Euler–Poincaré formula);
- **AutomorphicLFunctionsAndLocalFactors (line 86):** a Scope sentence on §§AL.3.10.2 and AL.3.10.4.

The brief's list of allowed suppliers excludes both. Before the repair, the brief's dependency command printed:

    moved: FourierDeligneTransform moved in the merge order from #57 to #101, right after its last supplier EtaleDualityAndPerverseSheaves (AutomorphicLFunctionsAndLocalFactors also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 240 roadmaps, 2437 edges, 0 problem(s)

The brief says a `moved:` line is not in itself a defect. Here, though, the move would put this roadmap after DeligneWeightsAndPurity. That reverses the maintainer's placement. It would also block the route the target was built for: the Fourier-transform proof of the curve estimate, which DeligneWeightsAndPurity consumes. So this run removed both later suppliers rather than let the worker move the roadmap. The repair, item by item:

1. **Perverse exactness of smooth and affine morphisms** (BBD 4.1.1–4.1.2 and 4.2.4–4.2.5): §4.1's route needs them.
   - No allowed supplier states them. EtaleCohomologyFoundations §F.8 on main has the absolute affine vanishing of perverse sheaves only. Its open revision adds nothing here (read at its head).
   - LefschetzPencilsAndVanishingCycles §6.2 itself takes affine Artin vanishing from EtaleCohomologyFoundations.
   - The relative statement rests on the relative affine Lefschetz theorem (`dim Supp Rᵠf_*F ≤ dim Supp F − q`), of which EtaleCohomologyFoundations §F.3 states only the absolute case.
   - The accepted target's Risk 1 recommended exactly this move: the theorems go into EtaleCohomologyFoundations §F.8.
   - They are therefore a new supplier gap against that section, `gap:perverse-exactness-affine-smooth`. The README states it under the EtaleCohomologyFoundations contract, and §4.1 and Layer 4 cite it.
2. **Classification of simple perverse sheaves on a curve.** This is BBD 4.3.1 in dimension one, which §§5.1–5.2 use.
   - It moved down from EtaleDualityAndPerverseSheaves §2.10 into §5.2.
   - It is stated for field coefficients on any smooth connected curve over a field, with its uniqueness clauses.
   - Route: from the characterization of intermediate extension in EtaleCohomologyFoundations §F.8.
   - Three Checks were added.
   - §5.1 now proves first the description of perverse sheaves on a curve, from the support and cosupport conditions of §F.8. Its definitions (`rk`, `rk_x`, `a_x`) use that description.
3. **Euler–Poincaré formula on curves.** This was EtaleDualityAndPerverseSheaves §5.2. It is now InverseGaloisAndArithmeticFundamentalGroups §IG.5.8, *Euler characteristic of `ℓ`-torsion local systems on affine curves*: `𝔽_ℓ` coefficients, ordinary cohomology, Swan conductors on completions. That roadmap is an allowed supplier (line 48), and the accepted target named it for this input.
   - A new target in §2.7 carries the formula to this roadmap's coefficients: free modules over finite local rings of residue characteristic `ℓ ≠ p`, `E`, `ℚ̄_ℓ`.
   - It also proves `χ_c = χ` through the localization triangle and `χ(I_x, M) = 0`. This is the finite-level route the target prescribed ("never by importing the rational formula").
   - §2.7 is split: §2.7 *Ramification and Euler characteristics on curves* (the completion comparison and the new target) and §2.8 *Artin–Schreier sheaves on the line* (the former second half of §2.7).
   - Every reference to the completion comparison still reads §2.7. The references to the `ℒ_ψ(f)` results (§5.5's autoequivalence, the Layer 5 Dependencies) now read §§2.7–2.8.
   - §§2.8, 5.1 and 5.4 cite §2.7 in place of the later roadmap.
4. **Smooth exceptional pullback.** The existing `gap:smooth-exceptional-pullback` paragraph and §3.5 no longer give EtaleDualityAndPerverseSheaves §2.7 as an alternative. The gap paragraph now records that §F.6 states `f^!Λ ≅ Λ(d)[2d]` for constant coefficients only.
5. **AutomorphicLFunctionsAndLocalFactors.** The Scope sentence identifying their Jacobian local systems with the pullbacks of `ℒ_χ` moved, unchanged in content, to a Downstream consumers bullet. Scope keeps a clause saying §§2.1–2.2 cover generalized Jacobians.
6. **Downstream consumers** gained three bullets:
   - DeligneWeightsAndPurity: its §5.2 (Weil sheaves) and §6.5 with §§6.2–6.4 (the curve bound), read at its head, together with the inputs of the LAU87 §4.4 route;
   - AutomorphicLFunctionsAndLocalFactors (item 5);
   - EtaleDualityAndPerverseSheaves: its Layer 5, its §2.10 in every dimension, its §5.2 `curveEulerPoincareSwan`, and its §2.7 against the new gap.

   The CongruenceSpectralGap bullet now records that its curve Euler–Poincaré formula is, on affine curves, the formula of §2.7.
7. **Scope** now lists §2.7's Euler–Poincaré target and §5.2's classification as owned. Each names the later roadmaps that state the wider form; both are listed as consumers.
8. **Other text.**
   - The Summary no longer names EtaleDualityAndPerverseSheaves.
   - "How to read the build" mentions the two new targets.
   - The Layer 2 introduction now scopes its standing hypotheses to the subsections that use them.
   - The LefschetzPencilsAndVanishingCycles contract now states §1.1, which §5.6 already used. It was read at its head: Grothendieck's arithmetic monodromy theorem.
   - The EtaleCohomologyFoundations contract now names §F.4.0 (stable lattices), §§F.4.4–F.4.5, and the parts of §F.8 used (the cosupport condition, both integral perversities, the characterization of intermediate extension).

Nothing else changed. The other targets, Checks and worked examples are as the earlier run left them, and `Suggested.lean` is byte-for-byte unchanged.

## Input used

The board (HEAD `2c2b1121`, equal to `origin/main`) has no `packages/FourierDeligneTransform/design/` README or review.json. The design is the one the earlier runs of this job expanded: the head of the design branch, as examined by `reports/REV-DESIGN-FourierDeligneTransform~7.md`. Its two P3 findings (F01, F02) were applied by the earlier run and are kept. The accepted target (`target.md`, `reports/TARGET-FourierDeligneTransform.md`) fixed the merge-order placement and the Risk 1 and Risk 4 recommendations that this run implements.

## Headline theorems

| Headline theorem (README) | Status | What it lacks at the pins |
|---|---|---|
| `FT_! = FT_*` for every qcqs `𝔽_p`-scheme (§3.3, KL85 (2.4.1)) | not statable | `Rf_!`, forget-supports map, étale `D⁺(X, Λ)` of schemes, Artin–Schreier sheaf |
| Inversion `FT^{E^∨} ∘ FT^E ≅ [−1]^*(−r)`, equivalence (§3.4) | not statable | `Rf_!`, étale Tate twists, Fourier kernel |
| Duality `D ∘ FT_ψ ≅ FT_{ψ⁻¹} ∘ D (r)` (§3.5) | not statable | `f^!`, Verdier duality |
| Functoriality, external products, convolution, Plancherel (§3.6) | not statable | the transform, `Rf_!` |
| Trace identity `t_{FT K} = (−1)^r 𝔉_ψ(t_K)` and Frobenius exchange (§3.8) | not statable | Frobenius on stalks of étale complexes, their Lefschetz numbers |
| Perverse `t`-exactness, equivalence of hearts (§§4.1–4.2) | not statable | perverse `t`-structure |
| Exchange of the three types of simple perverse sheaves (§5.2) | not statable | perverse sheaves and simple objects |
| Fourier sheaves (§5.3, ESDE (7.3.8)); autoequivalence on wild lisse sheaves (§5.5) | not statable | compactly supported étale cohomology on the line, Swan conductors of local monodromy |
| Kummer transform and Gauss-sum line (§5.4) | not statable | compactly supported étale cohomology, Kummer sheaves |
| Laumon's local monodromy formulas (§5.5) | not statable | perverse sheaves, vanishing cycles, Swan conductors |
| Local Fourier transforms and tame values (§5.6) | not statable | vanishing cycles over henselian traits |

No headline theorem is stated. The two targets this run added are not headlines either:
- the Euler–Poincaré formula of §2.7 extends a supplier's formula;
- the curve classification of §5.2 is the one-dimensional case of a general theorem.

Both would need compactly supported étale cohomology and perverse sheaves anyway.

The pins were re-read at Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, which match `lake-manifest.json`. Mathlib's `AlgebraicGeometry/Sites` has the small étale site, its points, the pro-étale site and `ElladicCohomology.lean`, with constant coefficients only. Neither library contains a compact-support direct image, a perverse `t`-structure, nearby cycles or an Artin–Schreier or Lang-torsor sheaf: a grep of Mathlib's `AlgebraicGeometry` and `CategoryTheory` and of Tau Ceti's `AlgebraicGeometry` for these objects returns nothing.

The finite Fourier identities of Layer 0 are statable but are elementary algebra, not headlines. `Suggested.lean` is therefore the module docstring and an empty namespace, naming each headline and what it lacks.

## What the README could not support

Nothing. Every target, Check and worked example of the design is kept. The two exceptions recorded by the earlier run stand:
- the §1.4 definition and API cite their owner;
- the design's section on a later roadmap is the Part II bullet under Downstream consumers.

The only statements this run moved are the ones listed above, and none was dropped.

## Notions moved down from later roadmaps

- **Classification of simple perverse sheaves on a smooth curve over a field, field coefficients** (BBD 4.3.1 (ii) in dimension one): from EtaleDualityAndPerverseSheaves §2.10 (line 102) to §5.2 here.
  - It is proved from EtaleCohomologyFoundations §F.8 (the characterization of intermediate extension) and §§F.0.1–F.0.2.
  - Locator: LAU87 line 621, where Laumon takes it from BBD, and KW01 Ch. III, by locator.
  - The form in every dimension stays with EtaleDualityAndPerverseSheaves §2.10, which the README lists as a consumer.
- **Euler–Poincaré formula for lisse sheaves on curves, with the coefficient rings and fields of this roadmap and with compact supports:** EtaleDualityAndPerverseSheaves §5.2 (`curveEulerPoincareSwan`, `ℚ̄_ℓ`) and CongruenceSpectralGap §4.2b (`E_λ`) state the rational form. Both are later.
  - §2.7 here derives it at finite level from InverseGaloisAndArithmeticFundamentalGroups §IG.5.8, an earlier supplier, as the target's Risk 4 prescribed.
  - Both later roadmaps are listed as consumers that can import it.
- **Not moved down, but declared as a gap against an earlier supplier:** the perverse exactness of smooth and affine morphisms (item 1 above), which goes to EtaleCohomologyFoundations §F.8.

## Duplication removals

- **This run.** The supplier subsection "From TauCetiRoadmap.EtaleDualityAndPerverseSheaves" is deleted with all six citations of it, and the AutomorphicLFunctionsAndLocalFactors citation leaves Scope. Neither was a definition or theorem of this roadmap. The new §2.7 Euler target and the §5.2 classification overlap only with statements of later roadmaps, which is what moving down means. Each overlap is disclosed in Scope and in the consumer bullets.
- **From the earlier runs, kept:**
  - §1.4 cites InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3 for local terms and their laws;
  - total spaces cite Tau Ceti's `TauCeti.AlgebraicGeometry.totalSpaceScheme` family;
  - scheme Frobenius cites Tau Ceti's `AlgebraicGeometry.Scheme.qPowerFrobenius` family;
  - Mathlib's `ZMod.dft_dft` is cited as the `ℂ`-valued case of §0.2;
  - Tau Ceti's `MonoidHom.commutatorMap_prod_range` is cited for the telescoping identity of §2.1.
- **Sweep by object, repeated for the new statements** (`roadmaps grep` over main and the 466 open heads):
  - *Euler–Poincaré / Ogg–Shafarevich:* InverseGalois §IG.5.8 (cited), EtaleDualityAndPerverseSheaves §5.2 and CongruenceSpectralGap §4.2b (later, consumers). The NeronModels hits concern the Néron–Ogg–Shafarevich criterion and Ogg's formula for elliptic curves, which are different objects.
  - *Simple perverse sheaves and BBD 4.1.1, 4.2.5, 4.3.1:* only EtaleDualityAndPerverseSheaves §§2.7, 2.10. LefschetzPencilsAndVanishingCycles §6.2 uses affine vanishing as an input and does not state these theorems.
  - The pinned libraries have none of these objects.

## Corrections made to the design

Kept from the earlier runs:
1. REV~7 F01 (Layer 5 Dependencies, LefschetzPencilsAndVanishingCycles §1.1).
2. REV~7 F02 (`pullbackDualIso`).
3. The §0.1 local-nondegeneracy statement (residue characteristic `ℓ ≠ p`, with the `ℤ/9` negative control).
4. The coefficient-ring convention.
5. The Galois-action convention for `Frob_x` on `ℒ_χ`.
6. §1.3 Checks.
7. Rephrased indirect citations.
8. Scope citations by section.
9. Supplier citations moved to the pinned Tau Ceti.

New in this run:
10. The merge-order repair above.
11. The `gap:smooth-exceptional-pullback` paragraph had attributed the field case to a later roadmap; it now states what main's §F.6 has.

## Supplier gaps

`packages/FourierDeligneTransform/design/plan.json` is new and holds only a top-level `gaps` list. Why:
- The brief asks for package-stage gaps there. The board has never had a plan for this roadmap, because the design folder never reached it.
- The worker's own checks were run on the file from a scratch script, all returning no problem:
  - `plan_change_problems` against the board HEAD, where the file is absent, so only `gaps` differs;
  - `gap_reference_problems` (every README slug is declared);
  - `supplier_gap_problems` for each entry.
- Without the file the intake cannot announce any of the gaps to EtaleCohomologyFoundations. Since no plan for this roadmap was ever on the board, the design's three gaps were never announced.

The four gaps, all against EtaleCohomologyFoundations, each stated in the README as `What EtaleCohomologyFoundations must provide (gap:<slug>): …`:

| slug | section | still needed on main because |
|---|---|---|
| `torsor-character-sheaf` | §F.0.3 | §F.0.3 is Tate twists only (the open revision adds the construction; a revision is not a dependency) |
| `projection-formula-qcqs` | §0.8 and §F.5 | §F.2.7 has it only on Noetherian bases for `Dᵇ_ctf` |
| `smooth-exceptional-pullback` | §F.6 | §F.6 states `f^!Λ ≅ Λ(d)[2d]` for constant coefficients only |
| `perverse-exactness-affine-smooth` (new) | §F.8 | §F.8 states the absolute affine vanishing only; §F.3 the absolute affine Lefschetz bound only; the open revision's §F.8 adds neither |

If the design's full `plan.json` later reaches the board, its three gaps are the first three entries here with the same slugs, and the fourth entry has to be carried over.

## Ownership against open work, and overlaps

- Ownership was checked by object against main, the board's packages and the 466 open heads, as listed under Duplication removals.
- This roadmap owns:
  - every object it states;
  - the two moved-down statements, because it precedes their later owners;
  - the gapped theorems, which are left to EtaleCohomologyFoundations.

  `Suggested.lean` declares nothing, so no name can collide.
- `scratch/overlaps.md` (index of 2026-11-07T13:56:48Z):
  - no open pull request changes this roadmap;
  - no id this README cites is dropped by an open pull request;
  - this roadmap has no pull request, so it drops no id;
  - **only an open revision defines:** none.

  Of the closest roadmaps in vocabulary:
  - EtaleDualityAndPerverseSheaves is now a consumer;
  - EtaleCohomologyFoundations and LefschetzPencilsAndVanishingCycles are suppliers;
  - EtaleDualityAndPerverseSheavesPartII (quasi-excellent finiteness and duality) shares nothing;
  - DeligneWeightsAndPurity is now a named consumer.

  `roadmaps overlaps FourierDeligneTransform` cannot run until this roadmap is on main or in a pull request, so the worker's index file was used.
- Leads for other roadmaps, not acted on:
  - EtaleDualityAndPerverseSheaves §2.7 should import the gapped theorems from EtaleCohomologyFoundations §F.8 once they are there, and its §5.2 can import §2.7 here;
  - CongruenceSpectralGap's `gap:additive-character-sheaf-weight` asks DeligneWeightsAndPurity for weight-free material that §§2.2–2.5 construct, and its curve Euler–Poincaré target can import §2.7.

## Citations and library names, resolved now

- `roadmaps resolve` on the README (index of 2026-11-07T14:31:55Z): no cross-roadmap citation found nowhere and no Lean name found nowhere.
  - In this invocation the resolver did not check pinned-library names ("no pinned Lake packages on this host").
  - The 21 leads in `scratch/citations.md` are EtaleCohomologyFoundations and InverseGalois target names, not pinned declarations. Each was found in the README of the roadmap it is cited from:
    - `VanishingCycles.properBaseChange` and the other 17 `VanishingCycles.*` names other than the two trace-formula names, `ClassicalAlgebraic.properSupports` and `ClassicalAlgebraic.cycleClasses`, and `PerfectComplex.lefschetzNumber`, all in EtaleCohomologyFoundations on main;
    - `VanishingCycles.etaleTraceFormulaFinite` and `VanishingCycles.etaleTraceFormula`, at the InverseGalois head (its supplier table, lines 346–347).
  - None is presented as this roadmap's own, so the gate's identifier rule does not count them.
- **Sections, at main or at the open head:**
  - **EtaleCohomologyFoundations (main):** all 31 sections cited were found as headings, including §0.11, §F.0.2, §F.1, §F.4.0, §§F.4.4–F.4.5 and §F.8.
  - **InverseGaloisAndArithmeticFundamentalGroups (head):**
    - §IG.0.T2 (heading `### IG.0.T2`) and §IG.0.T3;
    - §IG.5.8 *Patching and Abhyankar's conjecture*, whose target *Euler characteristic of `ℓ`-torsion local systems on affine curves* states exactly what the README's contract says: `k` algebraically closed of characteristic `p > 0`, `ℓ ≠ p`, `U` smooth connected affine with `s ≥ 1` points at infinity, `𝔽_ℓ`-coefficients, `Hᵠ = 0` for `q ≥ 2`, `dim H⁰ − dim H¹ = n(2 − 2g − s) − Σ Sw_{x_i}(M)`, Swan conductors on the completions.
  - **ArithmeticGaloisRepresentations (head):** §3.1 *Finite wild image, breaks and the Swan conductor*, §3.7 *Computations and Artin–Schreier characters*.
  - **RamificationOfCompleteDiscretelyValuedFields (head):** §§3a.1, 4a.1, 4a.2, 4a.3.
  - **LefschetzPencilsAndVanishingCycles (head):** §§0.3–0.8 and §1.1 *The geometric local monodromy theorem*, which contains Grothendieck's arithmetic monodromy theorem as the contract states.
  - **AdicEtaleGeometry (main):** §A1.0.5 with *henselian-finite-etale-approximation*.
  - **ReductiveGroupsPartII (main):** §RG2.3.7 with `Lang.lang_surjective`.
  - **SchemeAndStackFoundations (main):** §§2.9, 2.11.
  - **EnhancedDerivedSheaves (main):** §§0.1–0.4.
  - **Consumers:**
    - DeligneWeightsAndPurity (head): §5.2 *Weil sheaves and étale descent*, §§6.2–6.5 (Layer DWP.6), §6.5 *Compact-support bounds for pure curve coefficients*;
    - AutomorphicLFunctionsAndLocalFactors (head): §§AL.3.10.2, AL.3.10.4;
    - EtaleDualityAndPerverseSheaves (head): §2.7 *Smooth and affine morphisms*, §2.10, Layer 5 and §5.2 with `curveEulerPoincareSwan`;
    - CharacterSumsOverFiniteFields §3.6, CongruenceSpectralGap §4.2b (with its *Curve Euler–Poincaré over a perfect base*), SheafConvolutionOnAbelianVarieties §§0.3, 0.8.
- **Pinned library names.** No library name was added in this run. The names of the Mathlib and Tau Ceti contracts are those located at the pins by the earlier runs, and the pins are unchanged.

## Sources

Nothing new was fetched or cited. The `cited_for` lists were updated:
- `LAU87` gains "Exact supplier contracts" (the gap's locator, LAU87 lines 571–573);
- `KATZ01` gains §2.8;
- `KW01` gains "Exact supplier contracts" and §5.2.

Locators re-read for this run:
- LAU87 lines 566–575 (Théorème (1.3.2.3) and its proof, citing BBD (4.2.5), (4.1.2), (4.1.1));
- LAU87 lines 609–623 (the three types, and line 621 for BBD (4.3.1)(ii));
- LAU87 lines 866–875 (Théorème (2.2.1.2), the Euler–Poincaré formula on projective curves, with `χ(X ⊗ k̄) = C(2 − 2g)`);
- KATZ01 lines 441–460 (`χ_c(𝔸¹, F) = rank − Swan_∞`, total wildness, `h¹_c = (deg f − 1) rank`, forget supports an isomorphism).

BBD itself is not in the manifest and is cited only through these LAU87 passages and through KW01 (settled as uncertified), so no `needs-references.toml` was written. `sources check` on the manifest reports 0 problems.

No fetched or read text contained instructions; nothing suspicious to quote.

## Elaboration

`lake env lean` on `packages/FourierDeligneTransform/Suggested.lean`, run from the content checkout, exited 0 in 6 s with empty output: 0 `sorry` warnings and no other message. The file has no declarations, so the `#check @name` comparison of elaborated types with README statements is vacuous: there was nothing to compare and nothing changed.

The package lane's text scan (`gates.scan_folder` with the configured options, run from a scratch script) found 0 hits in every category:
- `set_option`, `blob`, `latex`, `tex`, `prnum`;
- `sorry-data`, `sorry-examples`, `residue`, `private-paths`;
- `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`;
- `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`;
- `long-fences`, `layer-ids`, `target-ids`, `depcheck`.

The board's per-file submission check (`board.file_problems`) reports no problem for any of the six changed files, all of them deliverables.

## Dependency check

The brief's command, against the board's `merge-order/ORDER.txt` (391 lines, this roadmap at line 58), exited 0. Its output, verbatim:

    depcheck: 240 roadmaps, 2433 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line, so the roadmap stays where the maintainer placed it.

The supplier edges the tool's parser extracts from the README (`depgraph.supplier_edges`, run from a scratch script) are:
- on main: AdicEtaleGeometry, ReductiveGroupsPartII, EnhancedDerivedSheaves, SchemeAndStackFoundations;
- in the order: RamificationOfCompleteDiscretelyValuedFields (line 3), ArithmeticGaloisRepresentations (46), InverseGaloisAndArithmeticFundamentalGroups (48), LefschetzPencilsAndVanishingCycles (56), EtaleCohomologyFoundations (57).

All are on the brief's list of allowed suppliers or on main. The declared consumers are AutomorphicLFunctionsAndLocalFactors, CharacterSumsOverFiniteFields, CongruenceSpectralGap, DeligneWeightsAndPurity, EtaleDualityAndPerverseSheaves and SheafConvolutionOnAbelianVarieties, all later than line 58.

## Adversarial pass

Values are computed. "pt" is `Spec 𝔽_q` or `Spec k`.

**New and changed statements of this run:**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| gap: `f^*[d]` `t`-exact for smooth `f` of pure relative dimension `d` | `𝔸¹ → pt`, `Λ_pt`; closed immersion `{0} → 𝔸¹`; `𝔸¹ ⊔ pt → pt` | `f^*Λ[1] = Λ_{𝔸¹}[1]`, perverse; `i^*(Λ_{𝔸¹}[1]) = Λ[1]` on a point, in degree `−1`, not perverse (smoothness needed); no single `d` for the disjoint union (purity needed) | holds, hypotheses needed | new gap |
| gap: `Rf_*` right, `Rf_!` left `t`-exact for affine `f` | `𝔸¹ → pt`, `K = Λ[1]`; `ℙ¹ → pt`; `ℤ_ℓ`, `(ℤ/ℓ)_0[−1]` on `𝔸¹` for `p⁺` | `Rf_*Λ[1] = Λ[1]` (degree `−1`, in `ᵖD^{≤0}`), `Rf_!Λ[1] = Λ(−1)[−1]` (degree `1`, in `ᵖD^{≥0}`); `ℙ¹`: `H¹(Rf_*Λ[1]) = H²(ℙ¹) = Λ(−1)`, not in `ᵖD^{≤0}` (affineness needed); `Rf_*` gives `ℤ/ℓ[−1]` on a point, `H¹` torsion, in the `p⁺` aisle | holds | new gap |
| §4.1 route as rewritten | `r = 1`, `K = i_{0*}Λ`; `r = 0` | `pr^*K[1] ⊗ ℒ = Λ_{0×A'}[1]` (pairing `0` there), perverse; `Rpr'_!` gives `Λ_{A'}[1]`, in `ᵖD^{≥0}`, equal to `FT_*`; `r = 0`: identity | holds | route made explicit |
| §2.7 Euler–Poincaré, `χ_c = χ = n(2 − 2g − s) − Σ Sw` | `𝔸¹`, `Λ`; `𝔾_m`, `Λ`; `𝔾_m`, Kummer; `𝔸¹`, `ℒ_ψ(x)`; `E ∖ {O}` (genus 1), `Λ`; `n = 0` | `1 = χ(Λ) = χ_c(Λ(−1)[−2])`; `0 = 1 − 1` (`H⁰ = Λ`, `H¹ = Λ(−1)`) and `χ_c = −1 + 1`; `1 · (2 − 0 − 2) − 0 = 0 = χ_c` (§2.6); `1 − 1 = 0` (§2.4); `2 − 2 − 1 = −1 = 1 − 2` (`H¹` of rank `2g + s − 1 = 2`); `0 = 0` | holds | new target |
| §2.7 ranks versus lengths | `ℤ/49`, `p = 3`, `ψ(1) = 18`, `ℒ_ψ(x²)` on `𝔸¹_{𝔽̄_3}` | `18³ ≡ 1 mod 49`; Swan `2`; `χ_c = 1 − 2 = −1`; `H¹_c` free of rank `1`, length `2`; lengths would give `−2` | rank is meant | Check added |
| §2.7 hypothesis `ℓ ≠ p` | `F = 𝔽_p` on `𝔸¹_k` | `H¹ = k[x]/{g^p − g}` contains the independent classes `x^a`, `p ∤ a`: infinite; the formula predicts `1 − 0 = dim H⁰ − dim H¹`, so `H¹ = 0` | hypothesis needed | negative Check |
| §2.7 `χ(I_x, M) = 0` step | `M = Λ` at `∞` of `𝔸¹`; `M = ℒ_ψ(x)` at `∞` | `[Λ →0 Λ]`: `H⁰ = Λ`, `H¹ = Λ(−1)`, `χ = 0`; `M^{P} = 0`, `RΓ(I, M) = 0` | holds | new route |
| §2.7 lattice step for `E` | `V` with wild image `Q` (finite `p`-group), lattice `L` | `L` is projective over `O_E[Q]` (`|Q|` invertible), so `rank L^{Q_j} = dim V^{Q_j} = dim (L/λ)^{Q_j}` and `Sw(V) = Sw(L/λ)`; `χ(RΓ_c(L) ⊗ E) = χ(RΓ_c(L/λ))` for a perfect complex | holds | new route |
| §2.8 `ℒ_ψ(f)` (route rewritten) | `d = 1`; `d = 2`, `𝔽_3`; `f = x^p`; Layer 2 Example `𝔽_5`, `ℤ/11` | rank `0`; `χ_c = 1 − 2 = −1`, trace `−(1 + 2ψ(1))`; `p ∣ d` excluded, break `1`; `−169 ≡ 7`; `H²_c` dual to `H⁰` of `ℒ_ψ(−f)(1)`, which has no wild-inertia invariants at `∞`: `0` | holds | route via §2.7 and curve duality |
| §5.1 perverse sheaves on a curve | `Λ[1]`; `Λ`; `i_{x*}Λ`; `i_{x*}Λ[1]`; `j_!Λ[1]`, `Rj_*Λ[1]` for `j : 𝔾_m → 𝔸¹`; a complex with `H^{−2}` at a point | perverse; not (`H⁰` not punctual); perverse; not (`H^{−1}` has a punctual section, `H^{−1}(i_x^!K) ≠ 0`); both perverse (`H^{−1} = j_!Λ` resp. `Λ_{𝔸¹}`, `H⁰ = 0` resp. `i_*Λ(−1)`); not (`H^{−2}(i_x^!K) ≠ 0`) | characterization holds | new statement |
| §5.2 classification on curves | `j_!Λ[1]`; `i_{s*}Λ`, `k(s) = 𝔽_{q²}`; `F = Λ ⊕ Λ`; Kummer `j_!ℒ_χ[1]` | `0 → i_{0*}Λ → j_!Λ[1] → Λ[1] → 0`, not simple, `j_{!*}Λ[1] = Λ[1]`; simple over `𝔽_q`, two points over `𝔽̄_q`; `Λ[1] ⊕ Λ[1]` not simple; `j_! = Rj_* = j_{!*}`, simple, type (T3) | holds | moved down, 3 Checks |
| Consumer: Jacobian local systems (moved from Scope) | closed point `v` of degree `d`, `x` over `v` | `N([x] − a) = Σ_i F^i([x] − a) = [v] − d·a` (the Galois orbit of `x` sums to `v`, and `a` is rational) | normalizations agree | moved |
| Consumer: curve Euler–Poincaré of the later roadmaps | proper `U` (`s = 0`) | §2.7 assumes `s ≥ 1`; the later forms cover proper curves | qualified "on affine curves" | wording |

**Unchanged statements** (rows of the earlier run, recomputed where a citation changed):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv: nondegenerate `ψ` ⇒ `ψ(a) − 1` unit, `p` unit | `ℤ/7, ψ(1)=2`; `ℤ/9, ψ(1)=4` | `2³ = 8 ≡ 1`, `1` unit; `4 − 1 = 3` non-unit; `Π_{a=1}^{p−1}(1 − ψ(a)) = Φ_p(1) = p` | holds | none |
| §0.1 local nondegeneracy | `ℤ/49, 18`; `ℤ/9, 4` | `18³ = 11·49 + 1`, `17` unit; `4³ = 7·9 + 1`, `Σψ = 21 ≡ 3` | needs residue char `≠ p` | kept |
| §0.1 classification of characters | `ℤ/49`; `Λ_1 × Λ_2`; `Λ = 0` | `μ_3(ℤ/49) = {1, 18, 30}`; `c_1 ≠ c_2` missed; zero ring collapses | holds as stated | none |
| §0.2 inversion | `𝔽_3`, `ℤ/7`, `ψ(1)=2`, `δ_1` | `𝔉t = (1,2,4)`; `w=2`: `17 ≡ 3`; `w=1`: `21 ≡ 0` | holds, sign pinned | none |
| §0.2 vs `ZMod.dft_dft` | `p = 3`, `δ_1`, `ℂ` | `𝔉𝔉Φ(w) = 3δ_{w,−1}`, `dft(dft Φ)(j) = 3δ_{j,−1}` | holds | none |
| Layer 0 Example | `𝔽_5`, `ℤ/11`, `ψ(1)=3` | `1 + 6 + 162 = 169 ≡ 4`, `4² ≡ 5` | holds | none |
| §1.1 Tor hypothesis | `ℤ/4`, `𝒦 = ℤ/2` | `Tor_i^{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` for all `i` | needed | none |
| §1.3 constructibility | `RΓ_c(𝔸¹, ℤ/ℓ)`; `ℤ/ℓ` over `ℤ/ℓ²` | `Λ(−1)[−2]`; unbounded reduction | holds | none |
| §1.4 dictionary | graph kernel of `𝔸¹ → pt`; `a = 1`; `[ℤ/4 →2 ℤ/4]` | `q = t_{Λ(−1)[−2]}`; `−t_K`; `1 − 1 = 0` | holds | none |
| Conv: `Frob_x` on `ℒ_χ` | `𝔾_a/𝔽_3`, `ℤ/7`, `x = 1` | trace `ψ(1) = 2`; opposite conventions give `4` | pinned | none |
| §2.1 Lang torsor | `𝔾_a`, `q = 3`; `𝔾_m`; constant `ℤ/2`; `G = 0` | `t³ − t = 1`; kernel `𝔽_q^×`; `L = 0` not onto; trivial | holds | none |
| §2.2–§2.3 laws and traces | `𝔾_m/𝔽_5`, `ℤ/3`, quadratic; `𝔽_9` | traces `+1, −1`; `Tr(i) = 0`, `ψ(0) = 1` | holds | none |
| §2.4 vanishing | `(2,1)` into `ℤ/7 × ℤ/7`; `G = 0` | `(0, ℤ/7(−1)[−2])`; `RΓ_c = Λ` | hypothesis sharp | none |
| §2.5–§2.6 Artin–Schreier and Kummer laws | `x^p`; `x² − x` vs `x² − x³`; `ℂ`, `N = 2`, `ℤ/3` | Swan `1`; difference `ℒ(x³ − x) ≅ Λ`; `j_! = Rj_*` | holds | none |
| §2.7 completion comparison | `k{π}`; non-excellent `R`; `k[π]_{(π)}` | jump `m` agrees; still bijective; not onto without henselian | holds | none |
| §3.1–§3.3 kernel, transform, `FT_! = FT_*` | `E = O_S`; `r = 0`; trivial `ψ`; `p = 2` cover | `x x'`; `Λ_S`; `Λ(−1)[−2]` vs `Λ`; `Λ ⊕ (j×1)_!ℒ_ψ(xy)` | holds | none |
| §3.4 inversion | `δ_0`; `δ_a`, `p` odd; trivial `ψ` | trace `q`; support `−a`; `Λ_{𝔸¹}(−1)` | holds | none |
| §3.5 duality | `i_{a*}Λ`, `p = 3`; `Λ[1]`; `r = 0` | traces `ψ(−ax')` vs `ψ(ax')`; `σ'_*Λ(1)` both sides | holds | Needs no longer cites a later roadmap |
| §3.6 functoriality | linear-map shift; convolution; quadratic forms `p = 2` | `s = −1 = r_2 − r_1`; `ℒ⟨a+b,·⟩[r]`; both sides `0` and `π'^*Λ(−2)[−2]` | holds | none |
| §3.7–§3.8 coefficients, traces | `ℤ/49 → ℤ/7`; `Λ_{𝔸¹}` | `4³ ≡ 1 mod 7`; `−qδ_0` | holds | none |
| §4.1 `t`-exactness Checks | `δ_0 ↦ Λ[1]`; `Λ ∈ ᵖD^{≥1}`; `(ℤ/ℓ)_0[−1]` in `p⁺`; trivial `ψ` | as recorded; trivial gives `Λ(−1)` constant, not perverse | holds | Needs → gap |
| §4.2 hearts | `0 → δ_0 → j_!Λ[1] → Λ[1] → 0`; `ℤ/49` subobject | `0 → Λ[1] → FT(j_!Λ[1]) → σ'_*Λ(−1) → 0`; `(ℤ/7)_0 ↦ (ℤ/7)_{𝔸¹}[1]` | holds | none |
| §5.1 invariants, Euler–Poincaré | `i_{x*}Λ` on `ℙ¹`; `j_!ℒ_ψ(x)[1]`; `ℙ¹ ⊔ ℙ¹`; `ℙ¹_{𝔽_{q²}}` | `χ = 1 = 1 − 2·0`; `χ = 0 = 2 − 2`; `−2` vs `−4` or `0`; `−4 = 0 − 4` | holds | lisse case cites §2.7 |
| §5.1 twisting lemma, reduced representative | `𝔽̄_p` vs `𝔽_p`; `u = t⁻⁶ + t⁻⁴ + t⁻²`, `p = 3` | `a = −b`; `c + a ≠ 0`; break `4`, not `6` | holds | none |
| §5.2 types | `δ_0`; `π^*F'[1]`; `ℒ_ψ(x)[1]` | `Λ[1]`; `i'_{0'*}F'(−1)`; skyscraper at `−1` | holds | none |
| §5.3 Fourier sheaves | `Λ`; `ℒ_ψ(x)`; Kummer on `𝔸¹ ∖ {0,1}`; `ℒ_ψ(x²)` | `H²_c ≠ 0`; twist `Λ` at `t = −1`; elementary not Fourier; completing the square | holds | none |
| §5.4 Gauss line | `q = 5`, `𝔽_11`, `ψ(1) = 3`, quadratic | `g ≡ 4`, `g² ≡ 5 = χ(−1)·5`; `χ_c(𝔾_m, ℒ_χ ⊗ ℒ_ψ) = 0 − 1 = −1` from §2.7 (Swan `1` at `∞`, `0` at `0`) | holds | Needs → §2.7 |
| §5.5 local monodromy | `Λ[1]`; `δ_0`; `ℒ_ψ(x²)[1]`; Kummer | `rk_{0'} = −1`; `rk' = 1`; `2 − 1 = 1`; `rk' = 1`, `rk_{0'} = 0` | holds | Needs §§2.7–2.8 |
| §5.6 tame values | `Λ` at `(∞,0')`; Kummer | `Λ(−1)`; `V'_χ ⊗ G(χ,ψ)` | holds | none |
| Layer 5 Example | `𝔽_5`, `𝔽_11`, quadratic | `rk' = 1 = a_0`, Frobenius `−4 ≡ 7` | holds | none |
| Gaps against main | §F.0.3, §0.8/§F.2.7, §F.6, §F.8/§F.3 | Tate twists only; Noetherian `Dᵇ_ctf` only; constant coefficients only; absolute affine vanishing only | each needed | fourth gap added |
