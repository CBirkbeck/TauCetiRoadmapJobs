# Review of ExcursionOperatorsAndSpectralActionPartII (pull request #1832 at e903735)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `cc4ec51`; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Adds the roadmap ExcursionOperatorsAndSpectralActionPartII, which builds Hansen's theory of the stable Bernstein centre … Its layers, in build order:" followed by seven bullets, Layer 0 to Layer 6.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Description, "highest weight 4mρ̂ … at rate C/m", against §2.4(a) and `weightPushforward_sum_abs_sub_uniform_le` | A₁, φ: ℤα→ℤ/2, m=1, 2; m=0 | Weights jα, \|j\|≤2m, dim 4m+1; masses (2m+1)/(4m+1), 2m/(4m+1); ℓ¹ error 1/(4m+1) = 1/5, 1/9 ≤ (1/4)/m; m=0: error 1, excluded by 1≤m | agree | none |
| Same, a second quotient | A₁, φ: ℤα→ℤ/3, m=1, 2, 3 | Counts (1,2,2)/5, (3,3,3)/9, (5,4,4)/13; ℓ¹ errors 4/15, 0, 4/39; all ≤ (1/3)/m | agree; C depends on φ, as stated | none |
| Lean docstring "dimension (4m+1)^N" | Weyl dimension formula at λ=4mρ | ∏_(α>0) ⟨4mρ+ρ,α∨⟩/⟨ρ,α∨⟩ = (4m+1)^N; A₁: 4m+1 | agree | none |
| Description's seven layer bullets against the README's layer headings and "How to read the build" | Layers 0–6, sections 0.0–6.2 | Each bullet names only content of its layer: 0 ↔ §§0.0–0.5; 1 ↔ §§1.1–1.6; 2 ↔ §§2.1–2.5; 3 ↔ §§3.1–3.3; 4 ↔ §§4.1–4.3; 5 ↔ §§5.1–5.3; 6 ↔ §§6.1–6.2 | agree | none |

The rows for the other statements stand as in the previous review, of `cc4ec51`; no statement changed.

- Folder diff since `cc4ec51`: 0 lines. Files changed outside the folder against the base (`git diff --stat origin/main...HEAD` outside the folder): none; the paths listed since `cc4ec51` come from the merge of main.
- Gate at `e903735` (worker's run): every check passed (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `set_option=0`, `sorry-data=0`, `statement-hygiene=0`, `readme-ids-missing=0`).
- Dependency check rerun with `--movable`: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean` rerun with `lake env lean`: one warning, `declaration uses 'sorry'` at line 51; nothing else. Elaborated signature compared with §2.4(a): all binders explicit in the declaration, none lost.
- Description sentences checked against the head, 19 (summary block 9, layer bullets 7, folder paragraph, dependencies paragraph, validation line); all agree: adds a roadmap (folder absent from `origin/main`, 796 insertions, 0 deletions, 54 headings, 1 declaration); Ψ_G imported from AutomorphicGaloisRepresentationsPartII AG2.6 (README Summary, §0.0); every G over every finite E/ℚ_p; τ_G surjective with Levi, transfer and matching compatibilities (§§5.2, 5.3, 6.1, 6.2); z-embedding reduction (§0.0(b)); the SmoothRepresentationsOfLocalGroupsPartII consumer sentence (Downstream consumers); IgusaVarietiesAndTorsionConcentration §§3.0i, 7.9a named as not consumed (Scope); reuse of `AddChar.complexBasis`, `Ideal.quotientKerEquivRange`, `TauCeti.ExactK0`, `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator` (supplier contracts); one theorem, no definition, nine not-statable headlines named in the module docstring with their missing carriers.
- Suppliers the generated task list does not carry (ReductiveGroups, ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups) are on main at this head, as the description's "Roadmaps on main are cited by name" says.
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped or defined only by an open revision, no second copy on main; none of the six closest roadmaps states the stable or very stable centre, the image-centre map τ_G or atomic stability (searched at their heads).
- Source independence: changed passages only; 0 passages changed, so 0 compared; largest share H26 and the contents comparison stand as in the review of `cc4ec51`; no layer added, removed or reordered.

Overlap check: read HeckeStacksAndLocalShtukas, IgusaVarietiesAndTorsionConcentration, GlobalShtukasAndFunctionFieldLanglandsPartII, EndoscopicTransferAndUnitaryTraceComparison, ModularityAndLanglandsExtensions (open) and SmoothRepresentationsOfLocalGroups (main); the third list is empty. Shared objects: excursion operators, geometric spectral action and semisimple parameter — owner AutomorphicGaloisRepresentationsPartII AG2.6, cited by this roadmap and by each of them; excursion comparison under parabolic induction — owner HeckeStacksAndLocalShtukas §HS4.6, extended through `gap:general-parabolic-excursion-comparison`; normalized Levi compatibility of the parameter — IgusaVarietiesAndTorsionConcentration §7.9a owns the case of GL_n, its inner forms and products, this roadmap's §0.0 the general connected reductive G, as Scope states; finite-wild excursion algebra — owner SmoothRepresentationsOfLocalGroups §SR.6.3, not restated; stable harmonic analysis — owner EndoscopicTransferAndUnitaryTraceComparison, through the declared gaps. Nothing else shared.

## Not verifiable

- H26's references Var24, Kot88, Art93/Art96 and BDK86 are cited through H26 only; the README cites none of them directly.
- The description's generated blocks (`depends-on`, `merge-order`) are outside this check.
- The description's count "4 independent review rounds and 2 red-team rounds" was not recounted this round; it stands as checked in the previous review.

## Source issues

- none (none new; those of the review of `cc4ec51` stand)

## For the human reviewers

- **Licence/scope.** FU25 (Fu, arXiv:2501.00652v1, README reference list) is cited as a preprint with no published version named; the single `Suggested.lean` theorem's Fourier bound is deduced from its Lemma 3.1.2 and Proposition 3.3.1. H26 and HKW22 are published in Forum of Mathematics, Pi.
