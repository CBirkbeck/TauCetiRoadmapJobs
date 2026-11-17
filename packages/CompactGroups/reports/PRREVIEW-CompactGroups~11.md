# Review of CompactGroups (pull request #2480 at 2f447db)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroups/`
**Verdict:** needs changes

The one line this pull request changes (`README.md:307`) is correct (first table row). Every finding below concerns text that is byte-identical on main; the gate fails on that text, so the folder cannot be accepted until it is repaired.

## R01 (P1) — Statements over `ContRepresentation` lack continuity in `g`, and four are false

**Location:** `Suggested.lean:105–108` (`theorem isUnitarizable (π : ContRepresentation ℂ G V) : ∃ S …`), `:140–141` (`isCompletelyReducible`), `:149–150` (`matrixCoeff_apply`), `:289–292` (exhaustion clause of `IsIrrepSkeleton`), `:312–317` (`peterWeylBasis`).

**Claim:** No signature assumes that `g ↦ π g` is continuous, although `README.md:154–156` says this "is an explicit added hypothesis where they are formed". Without it there are non-unitarizable and non-semisimple representations, and `matrixCoeff` cannot be continuous. `IsIrrepSkeleton` must also index every discontinuous unitary character, so `peterWeylBasis` would need an uncountable Hilbert basis of the separable `L²(Circle)`.

**Witness:** Mathlib `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:54`) is only `G →* V →L[R] V`. On `Circle`, with additive `φ : Circle → ℝ`, `φ ≠ 0`: `e^{φ}` is not unitarizable, `[[1,φ],[0,1]]` is not semisimple, and the `e^{itφ}` (`t ∈ ℝ`) are pairwise inequivalent.

**Repair:** Add `(hπ : Continuous π)` (and `(hρ : Continuous ρ)`) to every statement and definition over a `ContRepresentation` in Layers 1–6, in the Frobenius–Schur block and in `su2Irrep_exhaust`. Add the field `continuous_rep : Continuous rep` to `IrrepModel`, and write the exhaustion clause of `IsIrrepSkeleton` as `∀ … (π : ContRepresentation ℂ G W), Continuous π → IsUnitary π → … → ∃ i f, …`. This is the form Tau Ceti uses in `ContRepresentation.isUnitarizable` (`RepresentationTheory/Compact/Unitarizable.lean:100,241`), `TauCeti.IrrepModel` and `IsIrrepSkeleton.exists_congr_eq` (`RepresentationTheory/Compact/PeterWeyl.lean:137,214`), and R02's repair supplies it directly. Test: once `π` is continuous, `φ` is a continuous homomorphism from a compact group into ℝ, hence `0`, and all three counterexamples disappear.

## R02 (P2) — `Suggested.lean` restates as `sorry` what Tau Ceti proves at the pin

**Location:** `README.md:182` ("None of this is upstream."); `README.md:103–143` (the consume list names Mathlib only); `Suggested.lean:46–491` (every declaration).

**Claim:** At the pinned Tau Ceti, every target of Layers 0–6, of the Frobenius–Schur block and of the `SU(2)` engine is proved, with the continuity hypotheses that R01 asks for, and main's `RepresentationTheory/STATUS.md:43` lists CompactGroups as complete. The README cites none of these results. `Suggested.lean` restates them with weaker and partly false hypotheses (R01) and with sorry'd data (R03).

**Witness:** Tau Ceti `2fd255d`, under `TauCeti/RepresentationTheory/`: `ContRepresentation.schur_orthogonality_self` (`Compact/SchurOrthogonality.lean:104`), `TauCeti.stdPeterWeylBasis` (`Compact/PeterWeyl.lean:713`), `TauCeti.stdCharacterBasis` (`Compact/Character/Basis.lean:366`), `TauCeti.SU2.weyl_integration_formula` (`SU2/Weyl/Integration.lean:146`).

**Repair:** Add a `From Tau Ceti` supplier list. All paths below are under `TauCeti/RepresentationTheory/` unless stated otherwise. It names:
- from `Compact/Haar.lean:39–135`: `haarProb`, `haar_univ_ne_zero`, `haar_univ_lt_top`, `haarProb_apply_univ` and the invariance instances;
- `ContRepresentation.isUnitarizable` (`Compact/Unitarizable.lean:241`);
- `Representation.isSemisimpleRepresentation_of_continuous` (`Compact/Semisimple.lean:54`);
- `ContRepresentation.IsUnitary.orthogonal_mem_invtSubmodule` (`Continuous/InvariantComplement.lean:105`) and `ContRepresentation.IsUnitary.exists_orthogonal_irreducible_decomposition` (`Continuous/OrthogonalDecomposition.lean:192`);
- `ContRepresentation.matrixCoeff` (`Continuous/MatrixCoefficient.lean:70`) and `ContRepresentation.matrixCoeffLp` (`Compact/MatrixCoefficient.lean:72`);
- `TauCeti.representativeSubmodule` and `TauCeti.representativeStarSubalgebra` (`Continuous/Representative.lean:121,235`);
- `schur_orthogonality_self`, `schur_orthogonality_basis` and `schur_orthogonality` (`Compact/SchurOrthogonality.lean:104,122,151`);
- `TauCeti.convolutionOperator`, `isSelfAdjoint_convolutionOperator`, `isCompactOperator_convolutionCLM` and `finiteDimensional_eigenspace_convolutionOperator` (`Compact/Convolution.lean:320,483,656,685`);
- `TauCeti.representativeStarSubalgebra_dense` and `TauCeti.representativeStarSubalgebra_separatesPoints` (`Compact/RepresentativeDensity.lean:139,181`);
- `TauCeti.IrrepModel`, `TauCeti.IsIrrepSkeleton`, `TauCeti.peterWeylBasis` and `TauCeti.stdPeterWeylBasis` (`Compact/PeterWeyl.lean:137,214,514,713`);
- `ContRepresentation.character` and `ContRepresentation.character_conj` (`Continuous/Character.lean:84,190`);
- `characterLp`, `character_orthonormal_self` and `character_orthonormal_distinct` (`Compact/Character/Basic.lean:90,165,190`);
- `TauCeti.classFunctionLp` (`TauCeti/MeasureTheory/Group/Conjugation.lean:137`);
- `TauCeti.characterBasis` and `TauCeti.stdCharacterBasis` (`Compact/Character/Basis.lean:347,366`);
- the Frobenius–Schur indicator and its four theorems (`Compact/FrobeniusSchur/Basic.lean:135`, `Trichotomy.lean:107`, `InvariantForm.lean:132,145`, `StructureMap.lean:132`);
- `TauCeti.SU2.symPowerModel`, `TauCeti.SU2.isIrreducible_symPowerModel` and `TauCeti.SU2.existsUnique_nonempty_equiv_symPower` (`SU2/Exhaustion.lean:97,194,298`);
- `TauCeti.SU2.torusExp` (`SU2/Basic.lean:386`), `TauCeti.SU2.exists_isConj_torusExp` (`SU2/TorusConjugacy.lean:160`) and `TauCeti.SU2.character_symPower_torusExp` (`SU2/SymmetricPower.lean:139`);
- `TauCeti.SU2.weyl_integration_formula` and `TauCeti.SU2.integral_character_symPower_mul_conj` (`SU2/Weyl/Integration.lean:146,171`).

Replace `README.md:182` with "Tau Ceti proves all of this; the declarations are listed under From Tau Ceti." In `Suggested.lean`, delete every restated declaration, import those Tau Ceti modules after `import Mathlib`, and keep one `#check @…` pin per README headline (`ContRepresentation.isUnitarizable`, `Representation.isSemisimpleRepresentation_of_continuous`, `ContRepresentation.schur_orthogonality_self`, `ContRepresentation.schur_orthogonality`, `TauCeti.representativeStarSubalgebra_dense`, `TauCeti.stdPeterWeylBasis`, `TauCeti.coe_stdPeterWeylBasis`, `TauCeti.stdCharacterBasis`, `ContRepresentation.character_orthonormal_self`, `TauCeti.SU2.existsUnique_nonempty_equiv_symPower`, `TauCeti.SU2.weyl_integration_formula`, `TauCeti.SU2.integral_character_symPower_mul_conj`). I tested exactly these pins with those imports in a scratch file at the pins (Verified sound).

## R03 (P2) — Ten `def`s have `sorry` bodies, so the statements about them fix nothing

**Location:** `Suggested.lean:146, 154–155, 159–160, 167–168, 217–218, 323, 330, 336–338, 428–429, 440`: `matrixCoeff`, `matrixCoeffLp`, `representativeSubmodule`, `representativeStarSubalgebra`, `convolutionOperator`, `character`, `characterLp`, `centralLp`, `su2Irrep`, `su2Torus`. The definition at `:369–370` uses `character`.

**Claim:** Every theorem that mentions these definitions is about unspecified data. For example, `su2Irrep_character_torus` and `su2Character_orthonormal` constrain no particular representation, and `representativeStarSubalgebra_dense` constrains no particular subalgebra.

**Witness:** Gate check `sorry-data=10`. Nothing ties `su2Torus θ` to `diag(e^{iθ}, e^{−iθ})` or `su2Irrep n` to `Symⁿ(ℂ²)`, so the identity at `:452–455` pins no convention.

**Repair:** Use the Tau Ceti definitions named in R02 in place of the ten `def`s, importing their modules: `ContRepresentation.matrixCoeff π hπ`, `ContRepresentation.matrixCoeffLp π hπ`, `TauCeti.representativeSubmodule ℂ G`, `TauCeti.representativeStarSubalgebra ℂ G`, `TauCeti.convolutionOperator`, `ContRepresentation.character π hπ`, `ContRepresentation.characterLp π hπ`, `TauCeti.classFunctionLp ℂ ℂ 2 (haarProb G)`, `TauCeti.SU2.symPowerModel n` and `TauCeti.SU2.torusExp`. Then delete the ten `def`s.

## R04 (P2) — `set_option` in `Suggested.lean`, with a false justification

**Location:** `Suggested.lean:41–44` ("Needed for instance resolution in the signatures below (checked: the file does not elaborate without it). … `set_option backward.isDefEq.respectTransparency false`").

**Claim:** `set_option` is forbidden, and this option is not needed at the pins.

**Witness:** A scratch copy with line 44 deleted, elaborated with `lake env lean` at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, exits 0 with no errors and the same 48 `sorry` warnings and 45 linter warnings as the file.

**Repair:** Delete lines 41–44.

## R05 (P2) — Two headlines that can be stated at the pins are absent, and the docstring names nothing as unstatable

**Location:** `README.md:384–388` ("The characters of the irreducibles form an orthonormal Hilbert basis of `centralLp G`"); `README.md:363–367` (block projections "averaging against `dim V_π · conj χ_π`", the isotypic projectors); `Suggested.lean:7–34`.

**Claim:** Class-function completeness and the isotypic projectors are headline results of Layers 5–6, and both can be stated at the pins. `Suggested.lean` states only `characterLp_mem_centralLp`, and the module docstring names no headline as unstatable.

**Witness:** Tau Ceti has `TauCeti.characterBasis : HilbertBasis ι 𝕜 (classFunctionLp 𝕜 𝕜 2 (haarProb G))` with `coe_characterBasis` (`RepresentationTheory/Compact/Character/Basis.lean:347,357`), and `ContRepresentation.isotypicProjector` with `isotypicProjector_apply` (`RepresentationTheory/Compact/Character/IsotypicProjection.lean:150,167`).

**Repair:** Pin `TauCeti.stdCharacterBasis`, `TauCeti.coe_stdCharacterBasis` and `ContRepresentation.isotypicProjector_apply` (with R02's imports). Add a docstring sentence that names each README headline left unstated, together with the carrier it lacks.

## R06 (P2) — `L²(G)` is called separable for every compact group

**Location:** `README.md:70–72` ("the `L²`-side (Layer 5) on the separable complex Hilbert space `Lp ℂ 2 μ_G`").

**Claim:** The standing convention admits every compact Hausdorff group, but `L²(G)` is separable only when the unitary dual is countable, that is, when `G` is metrizable.

**Witness:** Take `G = (ℤ/2)^ℝ`. The coordinate characters `χ_t`, `t ∈ ℝ`, are orthonormal and pairwise at distance `√2`, so `L²(G)` is not separable.

**Repair:** "… the `L²`-side (Layer 5) on the complex Hilbert space `Lp ℂ 2 μ_G`, which is separable exactly when `G` is metrizable; no result here assumes it."

## R07 (P3) — Orthogonality of matrix coefficients is identified with `char_orthonormal`

**Location:** `README.md:45–46` ("Schur orthogonality of matrix coefficients becomes `char_orthonormal`"); `README.md:438` ("`schur_orthogonality_self` **specializes to** `char_orthonormal`").

**Claim:** For finite `G`, `schur_orthogonality_self` specializes to the finite-group orthogonality of matrix coefficients. `char_orthonormal` is the specialization of Layer 6's character relations, not of Layer 4.

**Witness:** For `S₃` with its standard representation and `v = w = e₁`, Schur orthogonality gives `⟪π₁₁, π₁₁⟫ = 1/2`, while `char_orthonormal` (Mathlib `RepresentationTheory/Character.lean:144,248`) gives `⟪χ, χ⟫ = 1`.

**Repair:** At `:45–46` write "Schur orthogonality of matrix coefficients becomes the finite-group orthogonality of matrix coefficients, character orthonormality becomes `char_orthonormal`, complete reducibility …". At `:438` write "`schur_orthogonality_self` **specializes to** the finite-group orthogonality of matrix coefficients, and `character_orthonormal_self` and `character_orthonormal_distinct` to `char_orthonormal`, and `peterWeylBasis` …".

## R08 (P3) — A cited Mathlib name does not exist at the pin

**Location:** `README.md:332–334` ("(Mathlib's `IsCompactOperator.finite_dimensional_eigenspace`, pinned as `convolutionOperator_eigenspace_finiteDimensional`)").

**Claim:** The declaration does not exist at Mathlib `1b1ccf4`.

**Witness:** The theorem is `ContinuousLinearMap.finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean:456`), with hypotheses `IsCompactOperator T` and `μ ≠ 0`.

**Repair:** Replace the name with `ContinuousLinearMap.finite_dimensional_eigenspace`.

## R09 (P3) — The torus character bullet has TeX outside a code span, a 0/0, and no measure

**Location:** `README.md:416–419` ("`χ_n(θ) = e^{inθ} + e^{i(n-2)θ} +` / `⋯ + e^{-inθ} = sin((n+1)θ)/sin θ`; the `{χ_n}` are an orthonormal basis of the even/`W`-invariant functions on `T`").

**Claim:** The code span breaks across lines 416–417 (gate check `tex` ×3). The quotient is `0/0` at `θ ∈ πℤ`. Orthonormality holds for the Weyl measure, not for Haar measure on `T`.

**Witness:** At `θ = 0` the quotient is `0/0`, while the character equals `n+1`. In `L²(T, dθ/2π)`, `⟪χ₀, χ₂⟫ = ∫ (e^{2iθ} + 1 + e^{−2iθ}) dθ/2π = 1`, not `0`.

**Repair:** Replace lines 416–419 with: "- **The character on the torus.** From the weight decomposition, `χ_n(θ) = Σ_{k=0}^{n} e^{i(n−2k)θ}`, which is `sin((n+1)θ)/sin θ` for `θ ∉ πℤ`, `n+1` at `θ = 0` and `(−1)^n (n+1)` at `θ = π`. The `{χ_n}` are an orthonormal basis of the even (`W`-invariant) functions on `T` for the Weyl measure `(1/(2π))·4 sin²θ dθ` on `[0, π]`, that is, of the class functions of `SU(2)`. This recovers Layer 6's completeness concretely, once the classification above has shown that these are *all* the characters." At `:427` and `:451`, add "for `θ ∉ πℤ`" after the quotient.

## R10 (P3) — The README names `character_orthonormal`, which `Suggested.lean` does not declare

**Location:** `README.md:376` ("**Orthonormality of characters.** `character_orthonormal`:"); `README.md:448` ("`character_orthonormal` is `orthonormal_fourier`").

**Claim:** A backticked name of this roadmap's own has no declaration (gate check `readme-ids-missing`).

**Witness:** `Suggested.lean` declares `character_orthonormal_self` (`:346`) and `character_orthonormal_distinct` (`:352`), and no `character_orthonormal`.

**Repair:** At `:376` write "`character_orthonormal_self` and `character_orthonormal_distinct`:". At `:448` write "and `character_orthonormal_self`, `character_orthonormal_distinct` are `orthonormal_fourier`."

## R11 (P3) — The SU(2) section assumes instances as hypotheses (45 linter warnings)

**Location:** `Suggested.lean:421–422` (`variable [IsTopologicalGroup SU2] [CompactSpace SU2] [T2Space SU2] [MeasurableSpace SU2] [BorelSpace SU2] [LocallyCompactSpace SU2]`).

**Claim:** Every theorem in the section carries six instance hypotheses that mention no variable, including `weyl_integration_formula_normalized`, which never mentions `SU2`. `T2Space SU2` and `MeasurableSpace SU2` already have global instances, so the section adds a second, local `MeasurableSpace`.

**Witness:** Elaborating at the pins gives five `linter.concreteInstances` warnings at each of lines 432, 436, 445, 452, 459, 467, 475, 483 and 488 (gate check `build`). Tau Ceti provides the instances (`TauCeti/Topology/Algebra/UnitaryGroup.lean:79,120`; `TauCeti/RepresentationTheory/SU2/Borel.lean:31,33`).

**Repair:** Delete lines 421–422 and import `TauCeti.Topology.Algebra.UnitaryGroup` and `TauCeti.RepresentationTheory.SU2.Borel`, or use `TauCeti.SU2` and the pins of R02.

## R12 (P3) — Padding in `Suggested.lean`

**Location:** `Suggested.lean:61` (`haar_univ_lt_top`), `:66` (`haar_univ_ne_zero`), `:75` (`isMulLeftInvariant_haarProb`), `:149` (`matrixCoeff_apply`), `:436` (`su2Irrep_character_one`), `:483` (`weyl_integration_formula_normalized`).

**Claim:** These are one-step library consequences, a restated definition, a boundary value, and the `f = 1` computation behind a README Check.

**Witness:** On a scratch copy, `exact measure_lt_top _ _` closes `:61`, `exact (Measure.measure_pos_of_nonempty_interior (μ := Measure.haar) (by simp)).ne'` closes `:66`, and `unfold haarProb; infer_instance` closes `:75`. Line `:483` is `∫₀^π 4 sin²θ dθ = 2π`.

**Repair:** Delete these six declarations from `Suggested.lean`. Their statements stay in the README (Layer 0 and `:425`).

## R13 (P3) — Sources: chapter ranges only, and two of the ranges are wrong

**Location:** `README.md:491–505`: Bump "(Chs. 2-4, 15-18)" and Bröcker–tom Dieck "(Chs. II-III, VI)". No claim in Layers 0–6 or in the engine carries a locator.

**Claim:** No target has a theorem-and-page locator. Bump's Haar measure lies outside the cited range, and the maximal-torus theory of Bröcker–tom Dieck is in its Chapter IV.

**Witness:** Bump, 2nd ed., contents on the publisher's page: Ch. 1 "Haar Measure". Bröcker–tom Dieck, contents: Ch. IV "The Maximal Torus of a Compact Lie Group". Knapp's Peter–Weyl theorem is Thm 4.20, printed p. 245 (`knapp line 10319`).

**Repair:** Change the ranges to Bump "(Chs. 1-4, 15-18)" and Bröcker–tom Dieck "(Chs. II-IV, VI)". Add a locator at each target, for example: Layer 1 "(Knapp, Prop. 4.6, p. 240)"; Layer 4 first orthogonality "(Knapp, Cor. 4.10(b), p. 241)" and second "(Cor. 4.10(a), p. 241)"; Layer 5 `L²` density "(Knapp, Thm 4.20, p. 245)"; Layer 6 orthonormality "(Knapp, Cor. 4.16, p. 243)".

## R14 (P3) — The README is not in TauCetiRoadmap form

**Location:** README headings at `:50, :103, :162, :196–429, :433, :461, :489`; there is no `**Checks.**` anywhere.

**Claim:** The README lacks the `**Summary.**` paragraph, `## Scope and ownership`, `## Exact supplier contracts`, `### k.n` subsections, per-definition API bullets with at least three Checks, per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers`. Its cross-roadmap citations name no section.

**Witness:** The README contains no Checks. `Completed/OrthogonalL2Bases` (`:39–40, :95, :361, :470`) is cited without its section §B2, "Orthogonality relation → `HilbertBasis`" (its `README.md:275`).

**Repair:** Restructure the README under the house headings. Give API bullets and three Checks for each of `haarProb`, `IsUnitary`, `matrixCoeff`, `representativeStarSubalgebra`, `convolutionOperator`, `IrrepModel`, `IsIrrepSkeleton`, `character`, `centralLp`, `su2Irrep` and `su2Torus`. For `matrixCoeff`, for instance: the scalar test `v₁ = i` of the first table row; the `S₃` standard representation at a 3-cycle gives `−1/2`; the zero vector gives `0`. Cite "Completed/OrthogonalL2Bases §B2". Name the main roadmaps that consume this folder, for example LieGroups Layer 6 (`LieGroups/README.md:137–140`).

## R15 (P3) — Process narrative and remarks about people

**Location:** `README.md:57` ("in Kevin Buzzard's Zulip-standard unbundled style"); `:33–35` ("Suggested home"); `:428` ("a later general-compact-Lie-group roadmap … would abstract"); `Suggested.lean:13–14`, `:84` ("previously missing from the pinned signatures"), `:176–177` ("the previously stated … is … false"), `:223–227` ("Mathlib currently lacks").

**Claim:** The house style requires timeless prose with no process narrative, and these passages are process narrative.

**Witness:** The house rule reads "Timeless: no process narrative ('so far', 'current', 'removed' …)". The "later roadmap" at `:428` already exists: LieGroups Layer 6 (`LieGroups/README.md:673`) plans the general Weyl integration formula.

**Repair:**
- At `:57`, write "spell out the hypotheses each result uses, unbundled".
- Delete "Suggested home: …" at `:33–35`.
- At `:428`, write "the compact-group specializations that LieGroups Layer 6 states for compact connected groups".
- Delete the last sentence of the `Suggested.lean:81–85` docstring.
- End the `Suggested.lean:172–181` docstring after "fixes this placement."
- Delete `Suggested.lean:13–14` and `:223–227`.

## R16 (P3) — "Separable deliverables" contradicts the build order

**Location:** `README.md:477–487` ("treat them as separately shippable units, kept cross-linked but not blocking one another"; "genuinely research-sized").

**Claim:** Units 2–4 each consume the units before them, as the Ordering paragraph and Layer 6 themselves state. "Research-sized" is an estimate of effort, not mathematics.

**Witness:** `README.md:465–467` says Layer 3 needs Layer 1 and Layer 4 needs Layers 1–3. `README.md:385–386` builds Layer 6's basis by projecting `peterWeylBasis` (Layer 5).

**Repair:** Replace `:477–479` with "**Separable deliverables.** The units form one chain: each of units 2–4 consumes the units before it, unit 5 consumes Layers 0–2 and Layer 6's characters, and no unit of 1–4 consumes unit 5:". Replace `:486–487` with "The `SU(2)` classification (unit 5) does not condition units 1–4; in particular, its exhaustion statement is not an acceptance criterion for the general layers."

## Previous findings

- r10 R01 (a pull request overwriting the completed base roadmap in this folder): does not apply to this head. This head is main's README with one line changed (`README.md:307`), and its `Suggested.lean` is byte-identical to main's. The replacement programme is now `CompactGroupsPartII` in a separate open pull request (#1047), which the overlap service reports as not touching this folder. Its citations of base Layers 0–6 resolve here unchanged.
- r10's table rows and its r8 R02/R03 rows concern that other text (CompactGroupsPartII §§1.3, 6.4) and do not apply here.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `README.md:307`, `Suggested.lean:182` `schur_orthogonality_self` (this pull request) | 1-dim `χ`, `v₁ = i`, other vectors `1`; then `w₁ = i` | LHS `∫ iχ·conj χ = i`; new RHS `conj(−i)·1 = i`; old `−i`. With `w₁ = i`: LHS `−i`, new `−i`, old `i` | new form correct; none |
| same against Knapp Cor. 4.10(b), p. 241 | Knapp's product is linear in its first slot: `(a,b)_K = ⟪b,a⟫` | `(u₁,u₂)·conj(v₁,v₂)/d` becomes `⟪v₂,v₁⟫⟪w₁,w₂⟫/d = conj⟪v₁,v₂⟫⟪w₁,w₂⟫/d` | agrees; none |
| `schur_orthogonality_basis` `:191` | `S₃` standard rep, `d = 2`, `i=j=k=l` | `½ = 2⁻¹·1·1`; `Σ_{i,k}⟪π_ii,π_kk⟫ = 2·½ = 1 = (4+1+1)/6 = ‖χ‖²` | consistent; none |
| `schur_orthogonality_distinct` `:200` | `ℤ/2`, trivial vs sign | `⟪1, sgn⟫ = (1−1)/2 = 0`; no nonzero intertwiner, so the hypothesis holds | consistent; continuity: R01 |
| `isUnitarizable` `:105` | `Circle`, `π z = e^{φ(z)}` on ℂ, additive `φ ≠ 0` | `adj(πz)·s·πz = e^{2φ(z)}s`, which equals `s > 0` only where `φ(z) = 0` | false; R01 |
| same, with continuity | continuous `φ : Circle → ℝ` | image is a compact subgroup of ℝ, so `{0}`; `S = 1` works | true; R01 repair |
| `isCompletelyReducible` `:140` | `[[1,φ(z)],[0,1]]` on ℂ² | `ℂe₁` invariant; `(a,1) ↦ (a+φ(z),1)`, so a complement exists only if `φ = 0` | false; R01 |
| `matrixCoeff_apply` `:149` | discontinuous unitary `χ = e^{iφ}` | `⟪χ(z)·1,1⟫ = conj χ(z)` is discontinuous; every element of `C(Circle,ℂ)` is continuous | false; R01 |
| `peterWeylBasis` `:312` | `Circle` | skeleton index contains `{e^{itφ} : t ∈ ℝ}`, uncountable; `fourierBasis` indexed by `ℤ`, Hilbert dimension `ℵ₀` | false; R01 |
| `exists_orthogonal_irreducible_decomposition` `:128` | `V = 0`; trivial ℂ² | `k = 0`, empty family internal in `0`; `k = 2`, lines `ℂe₁, ℂe₂` | true without continuity; none |
| `orthogonal_invariant` `:119` | swap on ℂ², `U = ℂ(e₁+e₂)` | `Uᗮ = ℂ(e₁−e₂)`; swap sends it to `−(e₁−e₂) ∈ Uᗮ` | consistent; none |
| `representativeStarSubalgebra_dense` / `_separatesPoints` `:249,:256` | indiscrete `ℤ/2` (compact, not T₂) | `C(G,ℂ)` = constants: closure `⊤` holds, separation fails; `:256` carries `[T2Space G]` | consistent; none |
| `convolutionOperator_isSelfAdjoint` `:232` | `ℤ/3`: `k = δ_g`; `k = δ_g + δ_{g⁻¹}` | first fails `k(g⁻¹) = conj k(g)` (a translation, not self-adjoint); second satisfies it, `T + T*` | consistent; none |
| `character_orthonormal_self` `:346` | `S₃` standard; trivial ℂ² | `(4+1+1)/6 = 1`; `⟪2,2⟫ = 4`, excluded by irreducibility | consistent; continuity: R01 |
| Frobenius–Schur `:373, :398` | trivial ℂ; `Circle`, `z`; `SU(2)` `Sym¹` | `ν = 1`, `J = conj`; `ν = ∫z² = 0`; `ν = ∫(χ₂ − χ₀) = −1`, `J² = −1` | consistent; none |
| `weyl_integration_formula` `:475` | `f = 1`; `χ₁ = 2cos θ`; `|χ₁|² = 4cos²θ` | RHS `1`, `(4/π)[sin³θ/3]₀^π = 0`, `(8/π)(π/8) = 1`; Haar sides `1, 0, 1` | consistent; none |
| `su2Irrep_character_torus` `:452` | `n = 0, 1`; `n = 2` at `θ = π/2` | `1`; `2cos θ`; `−1+1−1 = −1`, the eigenvalue sum of `Sym²` at `diag(i,−i)` | consistent; sorry'd data: R03 |
| `su2Character_orthonormal` `:488`, README `:452–453` | `(m,n) = (0,0), (0,1)` | `(2/π)∫₀^π sin²θ = 1`; `(2/π)∫₀^π sinθ sin2θ = 0` | consistent; none |
| README `:416–419` torus character | `θ = 0, π`; `⟪χ₀,χ₂⟫` in `L²(T, dθ/2π)` | quotient `0/0` against `n+1` and `(−1)^n(n+1)`; inner product `1`, not `0` | R09 |
| README `:71` separability | `(ℤ/2)^ℝ` | coordinate characters orthonormal, uncountably many, pairwise distance `√2` | false in general; R06 |
| README `:45–46`, `:438` | `S₃` standard, `v = w = e₁` | Schur: `⟪π₁₁,π₁₁⟫ = ½`; `char_orthonormal`: `⟪χ,χ⟫ = 1` | different statements; R07 |
| `haarProb` `:52` | discrete `ℤ/2`; `Circle` | `haarProb {0} = ½`; arc length divided by `2π` | consistent; none |
| Sample "Haar measure" (README `:3–9`, `:105–115`) | Mathlib pin; Bump contents | `Measure.haar` at `Haar/Basic.lean:582`; `isHaarMeasure_eq_of_isProbabilityMeasure` at `Haar/Unique.lean:700`; `CompactSpace.isFiniteMeasure` at `Typeclasses/Finite.lean:397`; Bump Ch. 1 | names exist; range wrong: R13 |
| Sample "Two neighbouring roadmaps" (README `:37–48`) | links; `char_orthonormal` | `Completed/OrthogonalL2Bases` exists, assembly at §B2 (`:275`); `CharacterTheory` exists; the identification fails | R07, R14 |
| Sample "Separable deliverables" (README `:477–487`) | units against Ordering `:463–475` | Layer 4 needs Layers 1–3; Layer 6's basis needs `peterWeylBasis`; "not blocking" contradicted; no locator | R16 |

- **Gate (worker, this head):** `set_option=1`, `tex=3`, `sorry-data=10`, `readme-ids-missing=1` and `build=41` (non-`sorry` warnings) fail, giving R04, R09, R03, R10 and R11. Every other scanner reports 0.
- **Dependency check:** `depcheck: 237 roadmaps, 2526 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Elaboration:** `lake env lean` on `Suggested.lean` at Mathlib `1b1ccf4` and Tau Ceti `2fd255d` exits 0, with 48 `sorry` warnings, 45 linter warnings and no errors. Without line 44 the result is identical.
- **Signature check:** `#check @` on 26 declarations in one scratch file. `isUnitarizable`, `isCompletelyReducible`, `matrixCoeff_apply` and `peterWeylBasis` carry no continuity (R01). The SU(2) theorems carry six closed instance binders (R11). No other binder is lost.
- **Padding probe:** of seven one-tactic attempts, three close (R12). `haarProb_apply_univ`, `isProbabilityMeasure_haarProb`, `orthogonal_invariant` and `weyl_integration_formula_normalized` do not close with `simp`.
- **Library:** 24 Mathlib declarations opened at the pin, one missing (R08). 45 Tau Ceti declarations opened in 22 files, all carrying `Continuous π`. Tau Ceti `Compact/SchurOrthogonality.lean:104` states the corrected formula. R02's pins: a scratch file importing the eleven Tau Ceti modules and `#check`ing R02's twelve pins plus `coe_stdCharacterBasis` exits 0 with no errors (missing object files were built first with `lake build`).
- **Sources:** Knapp (author page, cache `5ba1b91d`, printed page = PDF page − 18): Prop. 4.6 p. 240 (`knapp line 10093`), Cor. 4.10 p. 241 (`:10128`), Cor. 4.16 p. 243 (`:10215`), Thm 4.20 p. 245 (`:10319`), Ch. IV contents (`:108–117`). The contents of Bump and Bröcker–tom Dieck were read on the publisher's pages.
- **Cross-roadmap citations:** `Completed/OrthogonalL2Bases` (§B2 at `:275`) and `RepresentationTheory/CharacterTheory` resolve on main. Main's LieGroups (`:137–140, :648, :755`) and the open CompactGroupsPartII, SatoTateGroups and QuantumFoundations cite Layers 0–6, whose numbering this head keeps.

Overlap check: read CompactGroupsPartII, SatoTateGroups and SmoothRepresentationsOfLocalGroupsPartII (open), and LieGroups, Completed/OrthogonalL2Bases and the RepresentationTheory index (main). Shared objects and their owners:
- `SU(2)` Weyl integration: this roadmap (proved in Tau Ceti). LieGroups Layer 6 owns the general compact connected formula and cites the SU(2) case as its example. SatoTateGroups owns `USp(2g)` and products, and cites `TauCeti.haarProb`.
- Banach `G`-finite density: CompactGroupsPartII §2.1. This folder states no such target.
- Hilbert-basis assembly: OrthogonalL2Bases §B2.
- Nothing else is shared.

Source independence: 7 passages compared with 1 source (`README.md:18–30`, Layer 1, both Layer 4 bullets, Layer 5 `L²` density, Layer 6 orthonormality, `Suggested.lean:172–181`, against `knapp` Ch. IV abstract, Prop. 4.6, Cor. 4.10, the remark after it, Thm 4.20 and Cor. 4.16). The longest shared run is three words ("irreducible unitary representations"). The five references carry one chapter range each, with no in-text locator, so no source has a majority. Contents compared with Bump Chs. 1–4 and Knapp IV.1–IV.3: independent. Bump's Ch. 3 (compact operators) is folded into Layer 5, and Layers 1–3 have no matching chapter; the order of Layers 0–6 is forced by `README.md:463–471`.

Research link: Peter–Weyl and compact character theory (Knapp 2002, Ch. IV) are the inputs that the open SatoTateGroups roadmap uses for moments as Haar integrals and for Weyl integration of the Fité–Kedlaya–Rotger–Sutherland groups (its README `:11, :22–23, :325`). This rests on that roadmap's text and Knapp.

## Not verifiable

- Bump, *Lie Groups* (DOI 10.1007/978-1-4614-8024-2), and Bröcker–tom Dieck (DOI 10.1007/978-3-662-12918-0): paywalled. Only the contents on the publisher's pages were read, so the wording was not compared with them.
- Folland, *A Course in Abstract Harmonic Analysis*, 2nd ed. (DOI 10.1201/b19172): the Taylor & Francis landing page is in no licence class, so the "(Ch. 5)" range was not checked. Hewitt–Ross: the README gives no edition or locator.
- Ownership against open pull requests was checked only through the roadmap service's grep of the indexed heads (index of 2026-11-17T22:54:58Z).

## Source issues

- none

## For the human reviewers

- This pull request changes one line (`README.md:307`), recomputed correct above. All sixteen findings concern text byte-identical to main (`git diff origin/main...HEAD`: 1 insertion, 1 deletion).
- Main's `RepresentationTheory/STATUS.md:43` lists CompactGroups as complete, and Tau Ceti `2fd255d` proves every target (R02). `Completed/OrthogonalL2Bases` was archived after its targets were discharged; whether this folder moves to `Completed/` is open.
- Not tested: no reference has a majority share of the locators (five chapter ranges). The texts of Bump, Bröcker–tom Dieck, Folland and Hewitt–Ross could not be read, so the wording and arrangement checks used Knapp alone.
