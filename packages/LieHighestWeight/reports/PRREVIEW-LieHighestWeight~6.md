# Review of LieHighestWeight (pull request #1220 at b469a66)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** needs changes

Nine findings, three blocking (P2). This head is byte-for-byte the head the previous review read; the folder has no change since then, so every finding of that review is unrepaired. The full review was repeated independently: the whole README, all five Lean files, the gate, the dependency check, the elaborated signatures, the seeded sources and the ownership searches. One of the previous blocking findings is restated with a different severity and a new witness: the compact Frobenius–Schur gap asks CompactGroups for a theorem CompactGroups already states and the pinned Tau Ceti already proves. Paths below are relative to the folder above; library paths are relative to the pinned package roots.

## R01 (P2) — `gap:compact-frobenius-schur` asks for what is already provided

**Location:** README.md:410–420, “What CompactGroups must provide (gap:compact-frobenius-schur): for a compact group G with normalized Haar measure and an irreducible continuous finite-dimensional complex representation V”; cited at :860, :893, :1083.

**Claim:** the compact Frobenius–Schur criterion (indicator in {1, 0, −1}; 1 iff an invariant symmetric form, −1 iff an invariant alternating form, 0 iff not self-dual; uniqueness up to scalar) is an unsupplied contract that CompactGroups must still build.

**Witness:** Tau Ceti at the pin: `TauCeti/RepresentationTheory/Compact/FrobeniusSchur/Basic.lean:137` defines `ContRepresentation.frobeniusSchurIndicator π hπ` as the Haar-probability integral of the character over squares; `Trichotomy.lean:109` proves `frobeniusSchurIndicator_trichotomy` (values 1, 0, −1) for a continuous unitary irreducible representation of a compact topological group on a finite-dimensional complex inner-product space; `InvariantForm.lean:135`, `:148`, `:167` prove `frobeniusSchurIndicator_eq_one_iff` (invariant symmetric form), `_eq_neg_one_iff` (invariant alternating form) and `_eq_zero_iff` (no nonzero invariant bilinear form); `Continuous/Square/Invariants.lean` bounds the invariant squares by one line, which is the uniqueness up to scalar. CompactGroups on main states the same criterion as its own target: `RepresentationTheory/CompactGroups/Suggested.lean:373` (`frobeniusSchurIndicator_trichotomy`) and `:379` (`frobeniusSchurIndicator_eq_one_iff`). The README's sentence “CompactGroups Layer 6 supplies character orthogonality, not this criterion” (README.md:419–420) is therefore wrong on both counts.

**Repair:** delete the gap paragraph and the three `gap:compact-frobenius-schur` citations. In the Tau Ceti supplier contract cite the four native declarations with their hypotheses (compact topological group with Borel σ-algebra, finite-dimensional complex inner-product space, continuous, `IsUnitary`, irreducible); in the other-roadmaps contract cite CompactGroups for the unitarisation that supplies `IsUnitary` on a compact connected semisimple group. Keep §5.1's three compact Checks: on the standard SU(2) representation the native indicator is −1 (invariant alternating form `[[0,1],[−1,0]]`, `_eq_neg_one_iff`), on the circle character z ↦ z it is 0 (z² has Haar integral 0, `_eq_zero_iff`), on the trivial representation 1. What the pin does not include: the real/quaternionic structure-map reformulation over ℝ (`Trichotomy.lean` says so); §5.1 uses only the sign, so nothing is lost.

## R02 (P2) — Tensor acceptance targets depend on admitted data

**Location:** Sl2TensorOrthogonalityTargets.lean:49, “noncomputable def polynomialSymmetric : ∀ d : ℕ, P d ≃ₗ[ℂ] S d := by sorry”; also :31–32 (`e`), :72–75 (`E`), :77–80 (`F`).

**Claim:** these are usable acceptance-test definitions and the twenty-eight admitted theorems after them (`strings_orthogonal`, `strings_independent`, `strings_span`, the norm identities) are headline statements.

**Witness:** elaborating the file as it is gives 28 `sorry` warnings, four of them on `def`s (lines 31, 49, 72, 77: the elaboration output records `31:18`, `49:18`, `72:18`, `77:18`). `polynomialSymmetric` is a wholly admitted linear equivalence; `e`, `E`, `F` carry admitted membership and linearity proofs inside data. Every theorem from `polynomialSymmetric_e` (:51) to `source_three_cross_products` (:210) mentions one of them, so each depends on admitted data. The brief forbids a `def` whose body is `sorry` and anything that mentions one.

**Repair:** delete the admitted definitions and the declarations that mention them. The statable headline is existence on native carriers with real definitions, as `exists_polynomialSymmetric` already does in Suggested.lean:63; the membership proofs for `e`, `E`, `F` are routine (`MvPolynomial.isHomogeneous_X_pow`-style facts and `pderiv` degree lemmas exist at the pin) and must be written, not admitted. The degree-two control that the restated headline must keep: the monomial xy has squared norm 1/2 under the form `⟨e_i,e_j⟩ = δ_ij/binom(d,i)` and its averaged symmetrization (x⊗y+y⊗x)/2 has squared norm 1/4+1/4 = 1/2 in the product form, whereas the unaveraged x⊗y+y⊗x has squared norm 2; a rescaled dictionary fails this.

## R03 (P2) — Three supplier gaps are declared only in the README and bundle several contracts

**Location:** README.md:384–395 (`gap:unitary-regular-complexification`), :397–408 (`gap:torus-period-lattice`), :422–433 (`gap:skew-lr-tableaux`); consumed at :905, :1083, :2271, :2292, :2454, :2463, :2664.

**Claim:** these are declared supplier gaps.

**Witness:** the brief's intake record for this folder reads “none declared (no readable design/plan.json)”; the board package `packages/LieHighestWeight/` holds only the review reports, so no `gaps` list carries the slugs and no supplier job is told. Each `needs` is compound: the complexification gap asks for existence, uniqueness, full faithfulness, compatibility with sums, tensor products and duals, and preservation of irreducibility (:385–391); the period-lattice gap asks for four identifications (:398–403); the tableau gap asks for definitions, finiteness, a cardinality and the product rule in every finite alphabet (:423–431). The previous five reviews raised the registration as P1; the folder is unchanged. The mathematics of each contract was retested and holds: the U(1) character z ↦ z⁻¹ extends to t ↦ t⁻¹ with value 1/2 at 2; SU(2) has kernel 2πℤ·diag(i,−i), root differential 2i and root/cocharacter pairing 2; `s_(1)² = s_(2) + s_(1,1)` with both coefficients 1. LieGroups Layer 7 on main (`LieGroups/README.md:407–427`) states holomorphic extension only, Layer 6 (:383–406) maximal tori and Weyl integration without a period lattice, and neither regularity nor the exponential kernel occurs anywhere in the pinned Tau Ceti (searched for cocharacter, period lattice, exponential kernel, rational extension of unitary representations), so the three contracts are genuinely missing.

**Repair:** split each slug into one-sentence needs (one slug per theorem: regular extension of a continuous U(n)-representation; Zariski-density uniqueness; the exponential-kernel lattice; the cocharacter and character identifications with the 2π normalisation; the LR tableau count; the LR product rule) and register them where the intake reads them (the board package's `gaps` list for this roadmap, or the supplier's open job), keeping the README paragraphs in the supplier's own subsection as the brief prescribes. The severity is P2 rather than the previous P1 because every supplier is named and exists on main, so no prerequisite is unowned; the defect is the missing registration and the compound form.

## R04 (P3) — Companion files do not follow the acceptance-file form

**Location:** AffinePBWFirstOrderTargets.lean:1–2, “import Mathlib.Algebra.MvPolynomial.PDeriv”; ReductiveCenterTargets.lean:1–6 (three `Mathlib.*` submodule imports, no `import Mathlib`); Sl2TensorOrthogonalityTargets.lean:1–3 (`import Mathlib` followed by two submodule imports); TypeAHaarTargets.lean:7–15.

**Claim:** these are target-signature files under the same rules as Suggested.lean.

**Witness:** two files lack `import Mathlib`, three carry `Mathlib.<submodule>` lines, none has the module docstring “<title>: target signatures” naming what is not statable, and ReductiveCenterTargets.lean uses the namespace `TauCetiRoadmap.LieHighestWeight.ReductiveCenter` rather than the family namespace. The gate checks only `Suggested.lean`, which is why it passes.

**Repair:** fold the few genuine headlines into Suggested.lean (the companion `productEnveloping` at ReductiveCenterTargets.lean:63 already duplicates Suggested.lean:262), or give each retained companion the prescribed form: one `import Mathlib` plus the `TauCeti.*` modules used, the module docstring, layer comments and a docstring per declaration, under `TauCetiRoadmap.RepresentationTheory.LieHighestWeight`.

## R05 (P3) — Padding in the companion files

**Location:** ReductiveCenterTargets.lean:113–118, “theorem splitEnveloping_mem_center_iff”; also :80 (`productEnveloping_generator`, `simp`), :128 (`matrixTracePairing_apply`, `rfl`), :131 (`matrixTracePairing_nondegenerate`, a native theorem), :148 (`centralTensorRepresentation_apply`, `rfl`); AffinePBWFirstOrderTargets.lean:23 (`generator_coefficients`, `simp`); Sl2TensorOrthogonalityTargets.lean:198–214 (`source_F2`, `source_F1`, `source_three_cross_products`).

**Claim:** these are headline acceptance statements.

**Witness:** replacing the admission at :118 by `MulEquivClass.apply_mem_center_iff (splitEnveloping K Z S e)` elaborates (scratch copy of the file: the `sorry` count drops from 4 to 3, no error). The five others are already proved by one tactic or one native theorem. The three `source_*` theorems restate §0.1 item 5's Checks: for n = 2, 3, 4 the recomputed coefficients are (2, 8, 2), (2, 12, 6), (2, 16, 12) for F²w₁, (1, 0, −1), (1, 1, −2), (1, 2, −3) for Fw₂, (1, −2, 1) for w₃, and all three cross products are 0.

**Repair:** delete them from the companion acceptance files (and the definitions used only by them); the README keeps the statements as API bullets and Checks. Do not prove the admission in place.

## R06 (P3) — Seven backticked names of this roadmap's own have no declaration

**Location:** README.md:1975 “construct `compactAlbertAlgebra`”; :2020–2021 “`divisionOctonionComplexificationIso`”, “`compactAlbertComplexificationIso`”; :2026 “`compactAlbertDerivationBaseChange`”; :2033 “`compactAlbertDerivation_complexification`”; :2036 “`compactAlbertDerivation_skewAdjoint`”; :2040 “`compactAlbertDerivation_killing_negDef`”.

**Claim:** a backticked name of this roadmap's own is a claim that Suggested.lean declares it.

**Witness:** none of the seven occurs in any of the five Lean files or in the pinned Mathlib or Tau Ceti (checked by a script over every backticked identifier of the README; the other 1,200-odd backticked names resolve). The gate's readme-ids check and the citation resolver find them on main's `LieHighestWeight/Suggested.lean`, which this pull request deletes, so the tooling does not see the mismatch.

**Repair:** write the seven as prose targets without backticks (the surrounding text already states each), or declare them. TangentialBordism (rev/942, `README.md:150`) consumes four of them by these names from “LieHighestWeight Layer 8”; the prose names must stay stable.

## R07 (P3) — Stale internal layer references after the renumbering

**Location:** README.md:810, “chosen Cartan/base of Layers1–5”; :1315, “Layers 0–5”; :1321 and :1326, “the Casimir of Layer 5”; :1333, “the Layer 5 eigenvalue”; :2686, “is split by Layer 5”; :2699, “Layer 5's Killing-dual normalization”; :2705, “matching Layer 0”.

**Claim:** these refer to layers of this README.

**Witness:** this README has Layers 0, 3, 5, 6, 7, 8, 9, 10 only; Layer 5 is “opposition, invariant forms and compact characters” and Layer 0 is the rank-one tensor comparison. The cited meanings (sl₂ engine, Cartan and weights, classification, complete reducibility and the Casimir) are main's Layers 0–5, which this head replaces by supplier contracts. Related shape slips: subsections run 7.1 at the end of Layer 7, 9.2–9.3 with no 9.1, 10.2 with no 10.1; and §5.2 defines the distinct orbit sum, the score, the dominance order, `C_λ`, `N_λ`, `P_λ` and `F_λ` without a `**Checks.**` list (its only Checks, :925–932, are for the complexification gap).

**Repair:** repoint each reference to the supplier contract or to the actual layer (the Casimir normalisation and complete reducibility are “From Tau Ceti”, :299–305), renumber the subsections consecutively, and give §5.2's definitions their three discriminating Checks (the n = 3 tie, the x²+y² virtual character and the λ = (2,1,0) branching already in its prose are candidates).

## R08 (P3) — Removed headings break consumers' anchors

**Location:** README.md:598, 805, 1085 (the retained headings) versus main's `### Layer 1`, `### Layer 2`, `### Layer 4`, `### Layer 5: complete reducibility` and `### Layer 6F`, which this head deletes.

**Claim:** the deletion is a pure restructuring.

**Witness:** RootSystems (rev/1196, `README.md:27`) links `LieHighestWeight/README.md#layer-2-weights-of-a-module-and-their-integrality`; ClassicalGroupsPartII (rev/1492, `README.md:50`) links `#layer-4-the-classification-of-finite-dimensional-irreducibles`; the LieHighestWeightPartII design (board package, N0) cites `#layer-1-cartan-subalgebras-and-the-root-space-decomposition`. None of these fragments exists at this head; the Layer 7 anchor cited by SpinRepresentations (rev/1207, `:1208`) and CharacteristicClasses on main (`:118`) survives.

**Repair:** nothing in this folder can restore anchors for content that is now native; say in Scope and ownership, next to each deferral, which native declaration replaced the old layer, so that the three consumers can be repointed (the weights-and-integrality layer is `TauCeti.integralWeightLattice` and `TauCeti.exists_int_apply_coroot`; the classification is `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`).

## R09 (P3) — The type-A tensor-product formula is stated under a stricter hypothesis than it needs

**Location:** README.md:1047–1058, “λᵢ−λ_(i+1)>μ₁−μₙ for every adjacent pair … Keep the precise total spread μ₁−μₙ and the strict inequality”.

**Claim:** the strict inequality is needed.

**Witness:** the conclusion `V_λ ⊗ V_μ ≅ ⊕_γ V_(λ+γ)^(mult_γ V_μ)` holds whenever λ+γ is dominant for every weight γ of V_μ (Brauer–Klimyk; Humphreys 1972, §24 Exercise 9), and for GLₙ that is the weak inequality `λᵢ−λ_(i+1) ≥ μ₁−μₙ`. The README's own proof works with `≥`: an inverted gap of `w(λ+ρ)` is at most `−(μ₁−μₙ+1)` and γ changes it by at most `μ₁−μₙ`, leaving a negative gap of `ν+ρ`. Instance: GL₂, λ = μ = (1,0): the gap 1 equals μ₁−μ₂ = 1, the strict form excludes it, yet V_(1,0) ⊗ V_(1,0) = V_(2,0) ⊕ V_(1,1) with weights γ = (1,0), (0,1) giving exactly λ+γ.

**Repair:** state the hypothesis as `λᵢ−λ_(i+1) ≥ μ₁−μₙ`, keep the strict case as the Check that only the identity permutation contributes, and add λ = μ = (1,0) as the boundary Check.

## Previous findings: repair audit

The previous review read this same head; no repair report exists, and none marks a finding “not actionable in this package”.

| Previous finding | Passage at this head | Result |
| --- | --- | --- |
| R01 (P1): four unregistered supplier gaps | README.md:382–433, the four `What … must provide (gap:…)` paragraphs; no plan with a `gaps` list | **Not repaired.** Restated as R01 (the Frobenius–Schur gap is already provided) and R03 (the other three, unregistered and compound). |
| R02 (P2): admitted tensor data | Sl2TensorOrthogonalityTargets.lean:49, “:= by sorry” | **Not repaired.** Current R02. |
| R03 (P3): companion form | AffinePBWFirstOrderTargets.lean:1, “import Mathlib.Algebra.MvPolynomial.PDeriv” | **Not repaired.** Current R04. |
| R04 (P3): padding | ReductiveCenterTargets.lean:113, `splitEnveloping_mem_center_iff` | **Not repaired.** Current R05; the one-lemma closure was reproduced. |

## Verified sound

**Scope and principles.** All 2,852 README lines and all five Lean files (281 + 37 + 131 + 216 + 156 lines) were read. No `set_option`, no `lemma`, no computational algorithm, no copied passage, no pull-request number and no process narrative was found in the folder; the family index files are unchanged by the pull request; the outside-folder diff prescribed by the brief is empty. The pull request rewrites an existing roadmap on main, but it does not re-plan it: main's 306 `Suggested.lean` declarations become supplier contracts where Tau Ceti now has them (the native names were checked, see the table below) and README prose targets elsewhere; the fifteen retained statements are headlines of the same programme. LieHighestWeightPartII (merge order position 226, board design only, read through the board API) plans nilpotent orbits, Jacobson–Morozov and weight patterns and consumes this roadmap; it owns nothing stated here.

**Gate and dependency check.** The gate was rerun on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (the worker's run adds `build=0`). The required dependency check returned exactly

```text
depcheck: 203 roadmaps, 1652 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. Every `*Needs:*` line was read: the suppliers named are Mathlib, Tau Ceti, RootSystems Layers 1–6 and 4, ClassicalGroups Layers 2–4, SchurWeyl Layer 7, CompactGroups Layers 0–6, LieGroups Layers 2–4 and 6–7, ReductiveGroups Layers 2 and 5P, ReflectionInvariantTheory §2, all on main with those headings (`RootSystems/README.md:218–356`, `ClassicalGroups/README.md:175–310`, `SchurWeyl/README.md:323`, `CompactGroups/README.md:205–369`, `LieGroups/README.md:233–427`, `ReductiveGroups/README.md:227, 460`, `ReflectionInvariantTheory/README.md:19`). The owners named in Scope only (CharacteristicClasses C5 at `README.md:1060`, GroebnerGeometry G4 at `:252`, ReductiveGroups 10C at `:1823`, PseudodifferentialOperators §3.1 at `:692` with its periodic Fourier expansions at `:715`, TangentialBordism B3 at rev/942, LieGroupoidsPoisson G4.6A at rev/1050 `:1325`, TensorProductCombinatorics §§1.5–1.6 and 2.6 at rev/1107 `:599, :694, :1191`) all exist and are not supplier edges. LieGroupoidsPoisson G4.6A constructs the positive Lie–Poisson bracket `{ℓ_ξ,ℓ_η} = ℓ_[ξ,η]` and its affine Check `{x,y} = y`, agreeing with §3.1; its minus convention is for algebroid duals only. TensorProductCombinatorics (rev/1107 `:289`) declares `gap:skew-lr-tableaux` against SchurWeyl with the same slug, as the README says. AutomorphicFormsOnReductiveGroups (open, `README.md:53`) declares `gap:reductive-enveloping-centers` against this roadmap's Layer 9; §9.2 states each item it asks for (the composed product equivalence with generator formula and filtration compatibility, the centre restriction, the reductive raw/dot and translated/ordinary Harish-Chandra isomorphisms with ρ extended by zero, both filtration directions and the central-character evaluations).

**Build and signatures.** `lake env lean` on `Suggested.lean` from the pull-request worktree (Tau Ceti pin `a91d3aa`, Mathlib `6b7abb3c`; main pins Tau Ceti `358314d4`, which this branch's manifest does not carry) finished in 8 s with exactly 15 `declaration uses sorry` warnings and nothing else. A scratch file with the file plus one `#check @name` for each of the 20 declarations elaborated; each printed type was compared with its README statement. The headlines keep `[IsAlgClosed K]` (Pieri, Tits sign, Chevalley, Harish-Chandra, dot orbits, gl Pieri), the Serre theorem keeps `[CharZero K]`, `[IsSimple K L]` and `[IsTriangularizable K H L]` without algebraic closure, the product-centre theorem keeps only `[Field K]` and `[IsLieAbelian Z]`, the monic-relations adapter only `[Field K]`, and the four definitions carry only the variables their types mention (`lieCartanRestriction` without `CharZero`, as its README paragraph states). No lost binder was found. Each of the four companion files elaborates as it is (1, 4, 28 and 11 `sorry` warnings, no error). The one-tactic probe (`simp`, `rfl`, `infer_instance`, each required to close) on a scratch copy of `Suggested.lean` left all 15 admissions; no headline is padding.

**Headline coverage.** The fifteen statements are the normalised polynomial/symmetric-power dictionary, finiteness over a central subalgebra from monic relations, PBW symmetrisation with its three laws, the minuscule Pieri rule, the Tits sign of the invariant form, Chevalley restriction with the actual Killing-orthogonal map, filtered Harish-Chandra onto dot invariants, equality of central characters iff dot-conjugate, injectivity of the normalised Serre lift over split fields, the split G₂ and F₄ identifications, the E₈ and E₆/E₇ dimensions, the gl_n dual-standard Pieri rule and the product-centre equivalence. The docstring names what is not statable (compact real forms, Vinberg/Freudenthal models, closed alcoves and the compact centre, LR tableaux, the Rees fibre and first-order Poisson comparison, category O) and assigns the type-A Schur-character identity to ClassicalGroups Layer 4, whose `Suggested.lean:215` states `character_irreducible_eq_detTwist`. The remaining statable headline, the concrete orthogonal string decomposition of §0.1, is absent from `Suggested.lean` only because its companion carrier is admitted data (R02).

**Seeded sources.** Every sampled locator was opened in a cached legal text; printed page numbers were read off the page markers.

| Sample | Text and locator | What it supports |
| --- | --- | --- |
| §0.1 | `etingof755` (MIT 18.755 full notes) lines 2425–2549: §11.4, Thm 11.16 pp. 65–67, Thm 11.18 p. 68 | `e = x∂_y`, `f = y∂_x`, `h = x∂_x − y∂_y` with `e v_pq = q v_(p+1,q−1)`, `f v_pq = p v_(p−1,q+1)`: the README's `E e_i = i e_(i−1)`, `F e_i = (d−i) e_(i+1)`. The Hermitian norms and orthogonality are derived here, as the README says. |
| §3.1, §3.2 | `gutt` lines 899–922, Lecture 1 slide 14/28 | positive linear bracket `P_ξ(X,Y) = ⟨ξ,[X,Y]⟩` and the `1/k!` symmetrisation σ; the arbitrary-ring Rees statements are the README's own. |
| §5.1 | `etingof755` lines 6640–6658: Example 32.13 and Prop. 32.14 pp. 176–177; `etingof` (arXiv:2401.01446v2) §17.2 | principal-sl₂ proof of the `(2ρ∨,λ)` parity criterion over ℂ; the README's split extension is argued. |
| §5.2 | `woit` lines 94–136 (§2, Thm 1, p. 3) and 192–246 (§3, Thm 2, p. 5) | Weyl integration with `(1/|W|)∫_T f|δ|²` and the integral norm-one argument `Σ n_β² = 1`. |
| §6.1 | `etingof755` lines 5898–5985: Prop. 30.4 p. 159, Cor. 30.5 and 30.7 p. 160 | orbit characterisation, orbit-sum character of a minuscule module, the Pieri proof by wall cancellation `(λ+γ+ρ, α_i∨) = 0`. |
| §6.2 | `etingof755` lines 5127–5147: Prop. 26.3 and Thm 26.4 pp. 139–140 | anti-invariance of the denominator and the character formula; the fixed-point rational form is the README's adapter. |
| §7.1, §9.2 | `etingof` lines 2153–2244 (Thm 10.1, Remark 10.2, Example 10.3, pp. 51–53), 2987–3000 (Thm 13.5 p. 69), 3041–3082 (Thm 14.1 pp. 70–71, Remark 14.2 p. 71) | restriction, trace-power surjectivity, Kostant's graded statement, the filtered HC map with `gr(HC) = Res` and the reductive extension. |
| §9.3 | Dixmier §1.6 | not readable; native maps checked instead (table below). |
| §10.2 and Layer 10 | `garnier` (author manuscript dated 23 October 2020) lines 231–278 (Thms 1.3.2 and 1.3.5, p. 5), 389 (Prop.-Def. 2.2.1, pp. 7–8), 642–646 (Cor. 2.2.7, p. 10), 1161–1199 (Prop. 2.3.1, pp. 16–17); `etingof755` lines 8808–8849 (Thm 43.4, Cors 43.5–43.6, pp. 231–232) | `W_a ≃ Q∨ ⋊ W`, closed alcove fundamental domain, `Ω` representatives, `Aut(D̂) ≃ Ω ⋊ Aut(D)`, the intermediate-lattice correspondence with `|Ω_Λ| = [Λ : Q∨]`; compact centre `P∨/Q∨` and the reductive covering. |
| Layer 7 Stacks citation | `stacks-02ML` lines 13996–14007, Lemma 122.11 (tag 02ML) | the localised finiteness input, as stated. |
| Layer 8 Baez | `baez` lines 314–420 (§2.2 pp. 8–10), 1418–1481 (§3.4 p. 32) | Cayley–Dickson formulas (2)–(3) and the Albert determinant and its trace-power form. |

**Pinned declarations opened.** Every library name in the supplier contracts and in `Suggested.lean` was located at the pin; the ones material to the review:

| Pin, file and line | Declaration | What it supplies and what it does not |
| --- | --- | --- |
| Tau Ceti `Algebra/Lie/HighestWeight/Minuscule.lean:197` | `IsMinuscule` | dominant integral with every weight of `L(μ)` Weyl-conjugate to μ; `isMinuscule_zero` keeps μ = 0. |
| Tau Ceti `Algebra/Lie/HighestWeight/Tensor.lean:90` | `tensorMultiplicity` | the isotypic multiplicity of `L(ν)` in `L(λ) ⊗ L(μ)`, not a free scalar. |
| Tau Ceti `Algebra/Lie/Weights/WeightLattice.lean:100` | `coweightPairing` | the integer `λ(α∨)`; so the Tits exponent is `Σ_(α>0) λ(α∨) = λ(2ρ∨)`. |
| Tau Ceti `Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean:281`, `DotOrbit.lean:203` | `hcProjection`, `dotInvariants` | algebra map `Z(U(L)) → S(H)` and the dot-invariant subalgebra by evaluation; neither asserts surjectivity or the orbit iff. |
| Tau Ceti `Algebra/Lie/Presentation/Serre.lean:246` | `IsSerreSystem` | `⁅H i, E j⁆ = CM i j • E j`, the same convention as Mathlib `CartanMatrix.Relations.HE` (`Algebra/Lie/SerreConstruction.lean:102`); with Mathlib `RootPairing.Base.cartanMatrix` as `pairing i j = αᵢ(hⱼ)` (`LinearAlgebra/RootSystem/CartanMatrix.lean:52`, `Defs.lean:195`) the transpose in `serreLift_injective_of_base` is the right one. |
| Tau Ceti `Algebra/Lie/GeneralLinear/HighestWeight.lean:162`, `Carrier.lean` | `IsGlDominantIntegral`, `glIrreducible` | differences in ℕ with entries free in K; the normalised carrier with its module instances. |
| Tau Ceti `Algebra/Lie/UniversalEnveloping/Prod.lean`, `Abelian.lean` | `prodEquivTensor`, `symmetricAlgebraEquiv` | the two maps composed by `productEnveloping`; Mathlib `Algebra/Algebra/Subalgebra/Centralizer.lean` has `centralizer_range_includeRight_eq_center_tensorProduct`. |
| Tau Ceti `Algebra/Lie/UniversalEnveloping/Casimir.lean:128` | `casimirElement` | `Σ xᵢ yᵢ` over a basis and its Killing-dual basis, so `Ω = h²+2h+4fe = 8·casimirElement` for sl₂ (`κ(h,h) = 8`, `κ(e,f) = 4`). |
| Tau Ceti `Algebra/AlbertAlgebra/Basic.lean:107, 229` | off-diagonal layout, product | `offDiag i` sits at `(i+1, i+2)`; the README's cubic `a₀a₁a₂ − Σ aᵢN(xᵢ) + tr((x₀x₁)x₂)` is the Hermitian determinant in that layout. |
| Tau Ceti `RepresentationTheory/Compact/FrobeniusSchur/{Basic,Trichotomy,InvariantForm}.lean` | compact Frobenius–Schur | see R01. |
| Mathlib `Algebra/Lie/SerreConstruction.lean:145–163` | `Matrix.ToLieAlgebra`, `e₆ … g₂` | the Serre quotients, no structure theorems. |
| Mathlib `Analysis/Fourier/AddCircleMulti.lean` | `mFourierCoeff`, `orthonormal_mFourier`, `mFourierBasis`, `hasSum_mFourier_series_of_summable` | negative-frequency coefficient and orthonormality, as §6.2 says. |

Also present at the pin: `TauCeti.E7Minuscule` (`Algebra/Lie/E7/Minuscule/*`), `TauCeti.DominantWeight` (`RepresentationTheory/ClassicalGroups/DominantWeight.lean:87`), `TauCeti.SU2` and `SU2.toGL` (`RepresentationTheory/SU2/Basic.lean:75`, `SymmetricPower.lean:70`), `TauCeti.symPowerRep`, `TauCeti.derivationLieAlgebra`, `Octonion.finrank_derivationLieAlgebra`, `AlbertAlgebra.finrank_eq_twentySeven`, `exists_isCompl_of_isKilling`, the three Weyl/Kostant formulas, `freudenthal_multiplicity_formula`, `exists_isSerreSystem_of_base`, `expAd`, `weylAut`, `killingExtend`, `lieSubmoduleOrderIsoAsModule`, `pbwFiltration` and the PBW basis API. The resolver's one lead (`DotOrbit`) is the module `TauCeti.Algebra.Lie.HighestWeight.CentralCharacter.DotOrbit`, which exists.

**Ownership.** Object searches over main and the open heads (Chevalley restriction, Harish-Chandra isomorphism, alcoves, Frobenius–Schur, Rees algebras, PBW symmetrisation, division octonions and Cayley–Dickson, Albert algebras, Pieri rules, the Vinberg model, Serre presentations, Clebsch–Gordan): FormalConnectionsOpers (#1056) and CharacteristicClasses name this roadmap's Layer 7 as the owner of Lie Chevalley restriction; ExceptionalThetaCorrespondencesForG2 and TangentialBordism consume the octonion and Albert constructions; KacMoody's Pieri is the Chevalley–Pieri divisor formula on Schubert varieties; TensorProductCombinatorics owns the LR combinatorics beyond SchurWeyl's gap; LanglandsParameterStacks' “integral Chevalley restriction for Levi groups” is a different object. No second owner of a headline was found, and no two `Suggested.lean` files declare the same fully qualified name. Ownership against open pull requests without supplied files was not checked beyond the roadmap search service.

**Adversarial computations.** Exact rational arithmetic in scratch (Python, fractions): all string vectors `F_tot^k v_r` for `0 ≤ m, n ≤ 4` were built from the README's operators and checked against every identity of §0.1 (280 vectors, 1,892 cross-string pairings, 0 non-orthogonal; Gram determinants nonzero in every case; `E† = F` on all monomial pairs for `d ≤ 4`). Rows give the values; bounds and binders were read in the elaborated signatures.

| Statement or object | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| `exists_polynomialSymmetric` | d = 2, i = 1; rescaled map 2e | symmetric tensor of one x and one y, averaged norm² 1/2 | monomial xy, coefficient 1; 2e gives norm² 2 | keep; the rescaling is excluded |
| `module_finite_of_central_monic_relations` | L = K·x abelian, R = K[x²], relation x² − a | U(L) = R·1 + R·x | bound 2 | keep; empty κ gives U = K |
| `exists_pbwSymmetrization` | l = [e, f] in sl₂; l = [] | (ef + fe)/2 = fe + h/2; 1 | average of 2 words; empty product 1 | keep |
| `minuscule_pieri` | sl₂, λ = μ = 1, ν = 2, 0, −1 | multiplicities 1, 1, (−1 not dominant) | weight condition 1, 1 | keep; λ = 0, μ = 1 gives only L(1) |
| `invariantForm_isSymm_iff_tits_sign` | sl₂ V(1), V(2); standard SU(2) | alternating; symmetric; indicator −1 | (−1)¹, (−1)² | keep; matches the native indicator sign |
| `exists_lieChevalleyRestrictionIso` | sl₂, q = h² + 4ef | e·q = −4he + 4eh = 0, f·q = 4hf − 4hf = 0; restriction h² | W-invariant h², h not invariant | keep |
| `exists_harishChandraIso` | Ω = h² + 2h + 4fe | raw image t² + 2t: values 3, 3 at t = 1, −3 | dot reflection t ↦ −t−2 | keep; τ₋ρ gives t² − 1, τ_ρ gives t² + 4t + 3 |
| `centralCharacter_eq_iff_dotOrbit` | λ = 2, μ = −4; μ = 1 | χ(Ω) = 8, 8; 3 | dot orbit {2, −4}; 1 outside | both directions |
| `serreLift_injective_of_base` | B₃ with α₂ = ε₂−ε₃, α₃ = ε₃ | A₂₃ = −2, A₃₂ = −1; ⁅h₂,e₃⁆ = −e₃, ⁅h₃,e₂⁆ = −2e₂ | `CM = Aᵀ` gives ad(e₂)²e₃ = 0, ad(e₃)³e₂ = 0 | transpose required |
| `derivationOctonion_equiv_g2`, `derivationAlbert_equiv_f4` | dimensions | 14 = 12 + 2; 52 = 48 + 4 | native 14; 27 − 1 = 26 for the module | consistency only |
| `finrank_e8`, `finrank_e6_e7` | root counts | 240 + 8; 72 + 6; 126 + 7 | 248; 78; 133; Vinberg 80 + 84 + 84 = 248 | keep |
| `gl_dual_standard_pieri` | μ = (3/2, 1/2); (0,0); (2,1,0); (5/3, 2/3, 2/3) | n·dim = 4; 2; 24; 9 | summand dims 1 + 3; 2; 3 + 6 + 15; 1 + 8 | keep; non-integral central weights allowed |
| `exists_productCenterEquiv` | Z = K, S = sl₂; Z = S = 0 | K[t] ⊗ K[Ω]; K | centre of U(K × sl₂); K ⊗ K | keep |
| §0.1 item 5 | n = 2, 3, 4 | F²w₁ = (2, 4n, n(n−1)), Fw₂ = (1, n−2, −(n−1)), w₃ = (1, −2, 1); Gram diag (1, 1/(2n), 2/(n(n−1))) | cross products 0, 0, 0 | keep (R05: Check, not headline) |
| §0.1 norms | (m,n,r) = (2,3,1); (2,3,2) | Σ binom² ratio 5/6; 2 | factorial formula 240/288 = 5/6; 2 | keep |
| §3.2 ordered product | p,q = x,y; y,x; x²,y | B_ord = y; 0; 2xy | commutation `XY = YX + ħY`, `x²⋆y = yx² + 2ħyx + ħ²y` | keep |
| §3.2 symmetric splitting | (x,y), (xy, x²y), (x³, y²) | B_sym = y/2; −x²y²/2; 3x²y² | {p,q}/2 = y/2; −x²y²/2; 3x²y² | keep; `D(xy) = y/2` |
| §3.1 derivative identity | [x,y] = y at (2,3) | {x,y} = 3, {y,x} = −3, {x²,y} = 12 | ξ([·,·]) values 3, −3, 12 | agrees with LieGroupoidsPoisson G4.6A |
| §5.2 score identity | 500 random (n ≤ 5, integer x and λ) | x·λ | (S/n)Σx + Σ_j [Σ_(i≤j)xᵢ − (j/n)Σx] dⱼ | identical; x = (3,2,1) bracket coefficients 1, 1 |
| §5.2 ties | x = (3,2,1); (1,1,−2), (2,−1,−1) | 3 | 3 | properness without injectivity |
| §5.2 Haar norm | λ = (1,0): P = t₁ + t₂, D = 1 − t₂/t₁ | PD = t₁ − t₂²/t₁, coefficient squares 1 + 1 | n! = 2, so (1/2!)·2 = 1 | keep |
| §5.2 alternant | n = 1, 2, 3, 4 | distinct monomials of A_(λ+ρ) | 1, 2, 6, 24 = n! | keep |
| §5.2 tensor formula | GL₂, λ = μ = (1,0) | gap 1 = μ₁ − μ₂ | formula still exact: V_(2,0) ⊕ V_(1,1) | R09 |
| §6.1 orbit sum and root order | A₁: λ = 0, 1, 2; μ = 0, 1, 4 below 2 | orbits {0}, {±1}, {±2}; differences 2, 1, −2 | sizes 1, 2, 2; membership true, false, false | keep |
| §6.2 fixed-point sum | GL₂ λ = (1,0) at (2,3) | 2/(1 − 3/2) + 3/(1 − 2/3) = −4 + 9 | t₁ + t₂ = 5 | keep |
| §6.2 Fourier sign | χ₁ = z + z⁻¹; monomial z | coefficients at ±1: 1, 1; 1, 0 | `mFourierCoeff` negative frequency | keep |
| Layer 7 Int(L) | exp(ad e) on h, f | h − 2e, f + h − e; [h−2e, f+h−e] = −2(f+h−e) | matrix bracket [[−2,2],[−2,2]] both sides | keep |
| Layer 7 Killing transport | φ = κ(h,·), g = exp(ad e) | κ(h−2e, f) = −8 | κ(h, f−h−e) = −8; κ(h,h) = 8, κ(e,f) = 4 | keep |
| Layer 7 trace powers | standard sl₂ at th; adjoint | 2t² ↦ h²/32; 8t² ↦ h²/8 | Killing-dual coordinate λ(h) = 8t | keep |
| Layer 8 Albert cubic | diag(1,2,3); (3,1,1) with x₁ = 1; E₀₀; unit | 6, trace powers 6, 14, 36 → 6; 3 − 1 = 2; (1−3+2)/6 = 0; (27−27+6)/6 = 1 | formula | keep; x₀ = 1 instead gives 0 |
| Layer 8 Baez cross term | x = z = i, y = 1, zero diagonal | 3×3 determinant 2 | 2Re(xyz) = −2, 2Re(xyz*) = 2 | source error, not inherited |
| Layer 9 gl₂ Casimir | μ = (3/2, 1/2) | 15/4 − 1/4 | 7/2 | keep |
| Layer 9 staircase | N = 2, 3, 4 | lowered Casimirs (1/2, 9/2), (27/4, 43/4, 59/4), (22, 26, 30, 34) | differences 4 | keep |
| CAR example | N = 1, 2, 3 | (N + N(N−1))/2 = 1/2, 2, 9/2 | N²/2; dim L(ν) = 2^(N(N−1)/2) = 2, 8, 64; multiplicity 2^(N(N+1)/2) | keep |
| Weyl dimension | A₂ (a,b) list; G₂ ω₁, ω₂ | 3, 3, 8, 6, 10, 27; 7, 14 | formula | keep |
| Opposition | D₄; A₂ | −Id = four sign changes ∈ W; −Id ∉ S₃ | self-dual vs dual-standard | keep |
| Compact Frobenius–Schur | Q₈ standard; S₃ standard; circle z; trivial | (4 − 12)/8 = −1; (2 + 6 − 2)/6 = 1; 0; 1 | native trichotomy values | R01: provided |
| Affine A₁ | x = 2/3 | W_aff orbit ∩ [0,1] = {2/3}; stabilisers 2 at 0, 1 at 1/3 | extended x ↦ 1 − x sends 2/3 to 1/3 | keep |
| Compact centre | SU(2); SO(3) | P∨/Y of order 2; 1 | Y/Q∨ of order 1; 2 | distinct quotients kept |
| Period calibration | SU(2) | exp(t·diag(i,−i)) period 2π; root z ↦ z² differential 2i | coroot ↦ 2π·diag(i,−i) | keep (R03: unregistered) |

## Not verifiable

- **Dixmier, Enveloping Algebras, §1.6** (`§9.3`, reductive specialisation): no legal readable text (AMS GSM 11 landing page only); the native maps and the small instances were checked instead.
- **Humphreys 1972, §20.3** (§3.2 Verma presentation) and the chapter locators in References: Springer; uncertified.
- **Fulton–Harris, Serre 1987, Humphreys 2008 (category O), Bourbaki, Jantzen (both), Goodman–Wallach, Jacobson, Schafer, Molev**: no legal text through the service (the cached copy of Fulton–Harris is a course-site scan of the Springer book and was not used). These are background references; no sampled target rests on them alone.
- The six works lacking any legal copy are listed in the job's `needs-references.toml`; earlier rounds listed the same works.

## Source issues

- **Misprint** in etingof755 at §11.4, proof of Theorem 11.16 (iii), printed p. 67 (`etingof755` line 2500): the source says the m-th lowered vector corresponds to the monomial with exponents m on x and n−m on y; it should be n−m on x and m on y, since the highest vector is xⁿ; affects the proof.
- **Misprint** in woit at §3, proof of Theorem 2, printed p. 5 (`woit` line 241): the source says the alternant indexed by λ+δ occurs with coefficient 1; it should be λ+ρ, δ being the denominator function; affects the proof.
- **Gap** in garnier at proof of Proposition 2.3.1, printed p. 17 (`garnier` line 1191): the source says the lattice is countable, hence discrete; discreteness follows from containment in the coweight lattice, not from countability; affects the proof.
- **Error** in garnier at §2.2, before Proposition-Definition 2.2.1, printed p. 7 (`garnier` lines 381–384): the source says a weight is minuscule when its simple root has coefficient 1 in the highest root; that characterises minuscule coweights, while weights use the highest coroot (in B₂ the vector weight has coefficient 1 but pairs to 2 with the highest coroot); affects a stated result.
- **Error** in baez at §3.4, determinant display, printed p. 32 (`baez` lines 1475–1481): the source says the cubic cross term is 2Re(xyz) for the displayed layout; it should be 2Re(xyz*), as the zero-diagonal instance x = z = i, y = 1 gives determinant 2 against −2; affects a stated result.
