# Review of ComplexKahlerGeometry (pull request #1398 at 4f5ca96)

**Verdict:** needs changes

This is a full review at the head the previous review also read (4f5ca96). `scratch/changes.md` shows no changed line in the folder and no change outside it, so none of the previous findings can have been repaired, and none was. Reviewing the whole roadmap again found three new problems:

- Two headlines that the module docstring calls unstatable can be stated today, in the same germ style the Weierstrass statements already use.
- Several README targets are already proved in the Tau Ceti that the README's own contract describes (main's pin, 2fd255d9).
- One style and attribution slip.

There are eight findings: one P1, four P2 and three P3. Paths below are relative to `TauCetiRoadmap/ComplexKahlerGeometry/` unless they are Mathlib or Tau Ceti library paths. "Branch pin" means the pins of this branch's `lake-manifest.json`: Tau Ceti 358314d and Mathlib f6090c7. "Main's pin" means Tau Ceti 2fd255d9 and Mathlib 1b1ccf4.

## Previous findings (review ~46, same head)

- **R01 (P1, pin): not repaired.** `README.md:20` still reads "the pinned Tau Ceti's `TauCeti.deRhamComplex` and `TauCeti.deRhamCohomology`", and the manifest still pins 358314d. It is written again as R01, with a broader witness.
- **R02 (P2): not repaired.** `Suggested.lean:17–18` still reads "statable on carriers that the README's Tau Ceti contract names and that the Tau Ceti revision this file is built against does not have". It is written again as R02.
- **R03 (P2, #886 drops §5.5): not repaired.** The description is unchanged. It is written again as R05.
- **R04 (P3, conflicting pull requests, no order): not repaired.** It is written again as R06.
- **R05 (P3, #903 not named): not repaired.** `README.md:2431, 2434, 2507, 2707` are unchanged. It is written again as R07.

## R01 (P1) — The Tau Ceti contract names 54 declarations that do not exist at the branch pin, and the head does not merge into main

**Location.** `lake-manifest.json` (Tau Ceti `358314d4`). In the README:

- `README.md:20` "the pinned Tau Ceti's `TauCeti.deRhamComplex` and `TauCeti.deRhamCohomology`"
- `:187–240` (From Tau Ceti), `:305–321`, `:338–349`, `:366–367`, `:635–638`, `:1026–1053`, `:1433`, `:1465–1466`, `:1517`, `:1632–1636`, `:1828`

**Claim.** The README's supplier contract is written against main's pin. Of the 65 Tau Ceti declarations the README backticks, 54 are absent at 358314d:

- Absent: every `TauCeti.SmoothForm.*` name, every `Orientation.*` Hodge-star name, `TauCeti.SmoothSimplex.integral`, the de Rham complex, the homotopy operator, the Poincaré lemma, the realification lemmas, Osgood's lemma, the type calculus and the Nijenhuis tensor.
- The `SmoothForm` and `SmoothSimplex` namespaces do not exist at this pin at all. So the "generic form carrier `SmoothForm I M F k`" that K1, K2, K5a and K6 build on has no owner in this build. The previous report listed nine of these names.
- `git merge-tree` of this head with `origin/main` reports a content conflict in `Suggested.lean`. Main's pin bump changed that file's imports after the merge base a0ad405. So the pull request must take main in any case.

**Witness.** At 358314d there are 0 files containing `namespace SmoothForm`, `formHodgeStar`, `complexHodgeStar`, `contMDiff_iff_mdifferentiable`, `restrictScalars_of_ne_zero`, `exists_contDiffOn_forall_extDeriv_eq` or `analyticOnNhd_of_differentiableAt_update`. Each is present at 2fd255d9, for example `TauCeti/Geometry/Manifold/Complex/Analytic.lean:115`.

**Repair.** Merge `origin/main`. Resolve the `Suggested.lean` conflict by keeping this head's file; main's change touched only import lines this file no longer has. The manifest then pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4. Re-run `lake env lean` on `Suggested.lean` and the gate, then apply R02 and R04.

**Tested.**

- All 54 names resolve at 2fd255d9.
- The mathematical clauses checked against their declarations are unchanged:
  - `TauCeti.SmoothForm.codifferential` is `(−1)^(m(k+2)+1) ⋆d⋆` on `(k+1)`-forms, which is README:1633's `(−1)^(m(k+1)+1)` on k-forms (`Riemannian/Codifferential.lean:88–91`).
  - `IsManifold.restrictScalars_of_ne_zero (hm : m ≠ 0)` matches README:191–194.

## R02 (P2) — On the pin the README describes, three headlines are statable and absent, and the docstring describes the other pin

**Location.** `Suggested.lean:16–28`; `README.md:58–62` "The other headline theorems and their missing geometric carriers are listed in the module docstring of Suggested.lean."

**Claim.** This is unchanged from the previous report. The docstring says that Newlander–Nirenberg (local form), the local Dolbeault–Grothendieck lemma and the de Rham Hodge decomposition are statable on carriers that the pin "does not have". After R01's merge those carriers are present, so all three are statable headlines that are absent. Until then, the file and the README describe two different pins.

**Witness.** At 2fd255d9:

- `SmoothAlmostComplexStructure.nijenhuis` (`Geometry/Symplectic/Manifold/Nijenhuis.lean:158`)
- `ofComplexManifold` (`Geometry/Manifold/Complex/AlmostComplexStructure.lean:76`) and `nijenhuis_ofComplexManifold` (`:221`)
- `delBar` (`DifferentialForm/Dolbeault/Basic.lean:95`)
- `codifferential` (`Riemannian/Codifferential.lean:88`)
- `deRhamCohomology` (`DeRham/Basic.lean:127`)

**Repair.** After R01, state these three theorems:

- **Newlander–Nirenberg, local form.** For `J : TauCeti.SmoothAlmostComplexStructure 𝓘(ℝ, E) M` with `J.nijenhuis x = 0` for every x, each point has a chart in the maximal smooth atlas whose derivative intertwines J and multiplication by `I`.
- **Local Dolbeault–Grothendieck lemma.** On a polydisc, a smooth complex form of type `(p,q)` with `q > 0` and `delBar ω = 0` is `delBar` of a form of type `(p,q−1)`.
- **de Rham Hodge decomposition.** On a compact oriented Riemannian manifold, each class of `TauCeti.deRhamCohomology` has exactly one representative that both `mextDeriv` and `codifferential` kill.

Then delete the "built against" sentence at `Suggested.lean:17–18` and its three bullets.

## R03 (P2) — Rückert's Nullstellensatz and Oka/Cartan coherence are statable at both pins; the docstring's reasons are wrong

**Location.** `Suggested.lean:34–40`: "the analytic Nullstellensatz … need reduced analytic subsets, their dimension and their zero-locus carrier … a relation module over them is only a long ad hoc encoding, so coherence is not stated". In the README: `README.md:763`, `:771–775`, `:777–790`.

**Claim.** None of the three needs a carrier the pins lack:

- **Nullstellensatz.** README:763 states `I(V(𝔞))=√𝔞` for every ideal of the convergent local ring. That needs no analytic-subset or dimension carrier. Every such ideal is finitely generated, so the theorem is stated on functions analytic at 0 with eventual equalities, exactly as `weierstrass_division` is stated.
- **Oka coherence (README:771–775) and Cartan coherence of the reduced ideal (README:777–790).** Each states the same way in about twelve lines, which is no longer than `weierstrass_division`.

Only Hartogs extension across `dim A ≤ n−2` needs a dimension carrier.

**Witness.** The three statements below elaborate at the branch pins with `lake env lean`, with only ``declaration uses `sorry` `` warnings. Demailly II states them as (4.22) p. 97, (3.19) p. 89 and (4.29) p. 99 (`demailly-agbook` lines 4742, 4286, 4842).

**Repair.** Add to `Suggested.lean` under Layer 3, each docstring citing its Demailly locator:

```lean
/-- Rückert's Nullstellensatz for germs at the origin of `ℂⁿ` (Demailly II, (4.22), p. 97). -/
theorem ruckert_nullstellensatz {n k : ℕ} {f : Fin k → (Fin n → ℂ) → ℂ} {h : (Fin n → ℂ) → ℂ}
    (hf : ∀ i, AnalyticAt ℂ (f i) 0) (hh : AnalyticAt ℂ h 0)
    (hvan : ∀ᶠ z in 𝓝 (0 : Fin n → ℂ), (∀ i, f i z = 0) → h z = 0) :
    ∃ (m : ℕ) (g : Fin k → (Fin n → ℂ) → ℂ), (∀ i, AnalyticAt ℂ (g i) 0) ∧
      (fun z ↦ h z ^ m) =ᶠ[𝓝 0] fun z ↦ ∑ i, g i z * f i z := by
  sorry

/-- Oka's coherence theorem (Demailly II, (3.19), p. 89). -/
theorem oka_coherence {n k : ℕ} {U : Set (Fin n → ℂ)} (hU : IsOpen U)
    {f : Fin k → (Fin n → ℂ) → ℂ} (hf : ∀ i, DifferentiableOn ℂ (f i) U) {x : Fin n → ℂ}
    (hx : x ∈ U) :
    ∃ V : Set (Fin n → ℂ), IsOpen V ∧ x ∈ V ∧ V ⊆ U ∧
      ∃ (N : ℕ) (s : Fin N → Fin k → (Fin n → ℂ) → ℂ),
        (∀ j i, DifferentiableOn ℂ (s j i) V) ∧ (∀ j, ∀ z ∈ V, ∑ i, s j i z * f i z = 0) ∧
        ∀ y ∈ V, ∀ g : Fin k → (Fin n → ℂ) → ℂ, (∀ i, AnalyticAt ℂ (g i) y) →
          (fun z ↦ ∑ i, g i z * f i z) =ᶠ[𝓝 y] 0 →
          ∃ c : Fin N → (Fin n → ℂ) → ℂ, (∀ j, AnalyticAt ℂ (c j) y) ∧
            ∀ i, g i =ᶠ[𝓝 y] fun z ↦ ∑ j, c j z * s j i z := by
  sorry

/-- Cartan's coherence of the reduced ideal sheaf (Demailly II, (4.29), p. 99). -/
theorem cartan_reducedIdeal_coherence {n k : ℕ} {U : Set (Fin n → ℂ)} (hU : IsOpen U)
    {f : Fin k → (Fin n → ℂ) → ℂ} (hf : ∀ i, DifferentiableOn ℂ (f i) U) {x : Fin n → ℂ}
    (hx : x ∈ U) :
    ∃ V : Set (Fin n → ℂ), IsOpen V ∧ x ∈ V ∧ V ⊆ U ∧
      ∃ (N : ℕ) (h : Fin N → (Fin n → ℂ) → ℂ),
        (∀ j, DifferentiableOn ℂ (h j) V) ∧ (∀ j, ∀ z ∈ V, (∀ i, f i z = 0) → h j z = 0) ∧
        ∀ y ∈ V, ∀ g : (Fin n → ℂ) → ℂ, AnalyticAt ℂ g y →
          (∀ᶠ z in 𝓝 y, (∀ i, f i z = 0) → g z = 0) →
          ∃ c : Fin N → (Fin n → ℂ) → ℂ, (∀ j, AnalyticAt ℂ (c j) y) ∧
            g =ᶠ[𝓝 y] fun z ↦ ∑ j, c j z * h j z := by
  sorry
```

Then rewrite the docstring's Layer 3 bullet so that it names only Hartogs extension as not statable (it lacks the dimension of an analytic subset).

**Tested on degenerate instances.**

- **Nullstellensatz, k = 0.** h vanishes near 0, so m = 1 gives `h¹ = 0`, the empty sum.
- **Nullstellensatz, n = 0, f₁(0) = c ≠ 0.** `hvan` is vacuous, and m = 0 gives `1 = c⁻¹·c`.
- **Cartan, k = 0.** A = V, so g = 0 and N = 0.
- **Cartan, f₁ = 1.** A = ∅, so h₁ = 1 generates.
- **Oka, k = 0.** The relation module is 0, so N = 0.

## R04 (P2) — On the pin the README describes, Tau Ceti already proves several targets this roadmap claims to own

**Location.**

- §2.1: `README.md:413–418` (Cauchy–Green T), `:456–460` (filled exhaustion), `:515–528` (parameter Cauchy–Green)
- K1: `:269–286` (complex orientation), `:288–301` (flat `(1,0)` criterion), `:323–332` (joint holomorphic implicit map)
- §3.2: `:702–736` (meromorphic germ field)
- K5a: `:1444–1448` (complex scalar extension)
- `Suggested.lean:79–81`, `:113–115`, `:187`

**Claim.** At 2fd255d9, the Tau Ceti that R01's merge brings in, these targets are library declarations, yet the README plans them as constructions it owns. Three parts of `Suggested.lean` also re-encode library objects:

- `hRunge` is the body of `TauCeti.IsFilledIn K Ω`.
- The solver's `(fderiv … 1 + Complex.I * fderiv … Complex.I) / 2` is `TauCeti.conjWirtingerDeriv (fun w => u ((p, q), w)) z 1`.
- The `IsDomain` conjunct of `holomorphicStalk_factorial` is the instance `TauCeti.holomorphicStructureSheaf.smoothStalkIsDomain`, so after the merge it closes by `infer_instance`.

**Witness.** At 2fd255d9:

- `Topology/FilledIn.lean:61`
- `Analysis/Normed/Module/Exhaustion.lean:86`
- `Analysis/Complex/Pompeiu/Parameter.lean:75–182`
- `Analysis/Complex/ImplicitFunction.lean:57`
- `Geometry/Manifold/Complex/Orientation.lean:216, 359`
- `Complex/StructureSheaf/MeromorphicGerm.lean:73–199`
- `StructureSheaf/Domain.lean:93`

**Repair.** After R01, move each item into the From Tau Ceti contract by its exact name, delete it as a target, and keep only what the library lacks (the finite-rank operator estimate, the shell construction and the manifold transports):

- **§2.1.** Cite `TauCeti.Analysis.Complex.Pompeiu.Basic`, `TauCeti.Analysis.Complex.Pompeiu.Parameter` (for example `contDiffOn_integral_sub_inv_smul_with_param` and `conjWirtingerDeriv_integral_sub_inv_smul_with_param`) and `IsOpen.exists_isFilledIn_compact_exhaustion`.
- **K1.** Cite `TauCeti.exists_jointImplicitFunction_of_eventually_mdifferentiableAt`, `TauCeti.complexManifoldOrientation` together with `IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation`, and `TauCeti.SmoothForm.mpullback_complexDz`.
- **§3.2.** Cite `TauCeti.holomorphicStructureSheaf.isFractionRing_meromorphicGerms`, `exists_eq_toMeromorphicGerms_div` and `evalInvSub_principalPart_add_toMeromorphicGerms_regularPart`.
- **K5a.** Cite `TauCeti.SmoothForm.complexificationEquiv` at the level of forms.
- **`Suggested.lean`.** State `hRunge` as `TauCeti.IsFilledIn K Ω` and the solver's equation through `TauCeti.conjWirtingerDeriv`, and drop the `IsDomain` conjunct.

**Tested.**

- The definition at `FilledIn.lean:61–64` is `Suggested.lean:79–81` symbol for symbol.
- `conjWirtingerDeriv g x v = (Dg v + I • Dg (I • v))/2` (`Wirtinger/Basic.lean:16`). At `v = 1` this is the solver's expression.

## R05 (P2) — Open revision #886 of DifferentialGeometry drops §5.5, which this roadmap cites as a supplier, and no order is stated

**Location.**

- `README.md:1066` "DifferentialGeometry §5.5's `RoughDensity` carrier"
- `:1110` "*Needs:* DifferentialGeometry §§0.1–0.4 and 5.5"
- `:1438`
- `:80–81` "DG0.4's `legacySmoothTwoFormEquiv` and `legacySmoothTwoFormEquiv_isClosed_iff`"

**Claim.** At #886's head 4d6e96e, item 5.5 is split into 5.5a (densities) and 5.5b (corner Stokes). Item 0.4 still exists but no longer uses the two backticked names. Every other DifferentialGeometry id this README cites resolves there: 0.1–0.4, 1.1–1.4, 2.1, 2.2, 5.2–5.4, 8.3–8.5, 12.1 and 12.4. The description states no order between the two pull requests.

**Witness.** On main: `DifferentialGeometry/README.md:528` "5.5 Densities, and Stokes with corners", and `:303–304` (`legacySmoothTwoFormEquiv`). At 4d6e96e: `:1218` "5.5a Densities, for every finite-dimensional real model", `:1248` "5.5b", and `:586` (the equivalence, unnamed).

**Repair.** In the description, state that this pull request merges before #886, and that #886 then owes the map 5.5 → 5.5a and the two names → its 0.4 equivalence. Alternatively, write "§5.5 (5.5a at the head of its open revision)" at the three lines above. The mathematics does not change.

## R06 (P3) — Four open pull requests conflict with this head in this folder, no order is stated, and the description describes an earlier head

**Location.** The pull-request description (`scratch/pull-request.md`).

**Claim.**

- `scratch/overlaps.md` lists four open pull requests that conflict with this head. #1234, #1807 and #1808 conflict in `README.md` and `Suggested.lean`; #1854 conflicts in `Suggested.lean`.
- The description names none of them and gives no rebase order.
- The description still describes head b8db421. It says "The new companion file … `PlanarHodgeTargets.lean`" and "three theorem targets are explicitly admitted". This head has no such file and rewrites both roadmap files.

**Witness.** `git diff --stat a0ad405 HEAD` on the folder gives `README.md | 1811` and `Suggested.lean | 660`, and there is no `PlanarHodgeTargets.lean`. `scratch/overlaps.md`, "Other open pull requests that change this roadmap", has the four entries.

**Repair.** In the description only:

- Rewrite the summary so that it describes this head.
- State the rebase order, for example "#1234 rebases onto this; this merges before #1807, #1808 and #1854".
- Add the dependency names that R05 and R07 ask for.

## R07 (P3) — GeometricTopology Layers 1.7 and 1.7.1 exist only at the head of open revision #903, which the description does not name

**Location.** `README.md:2431` "[GeometricTopology Layer 1.7](../GeometricTopology/README.md)'s smooth classification of compact surfaces", `:2434` "Layer 1.7.1 … polygon/CW model", `:2507`, `:2707`.

**Claim.** This is unchanged. The cited content exists, and supports every claim made here, but only at #903's head. #903 revises an existing roadmap, so its numbering is a dependency, and that dependency must be named.

**Witness.**

- On main, `GeometricTopology/README.md` has no "1.7" anywhere (Layer 11 is at `:831`).
- At #903's head 9f470e6, `:794` "### 1.7 Compact smooth surfaces" (genus `(2 − χ − b)/2`, `rank H₁ = 2g`).
- At the same head, `:841` "### 1.7.1 Polyhedral surfaces…" (word `[a₁,b₁]⋯[a_p,b_p]`, with the sphere treated separately).

**Repair.** In the description only: name #903 in the dependency block. Nothing in the folder changes.

## R08 (P3) — LaTeX macros in code spans, and one misattributed declaration

**Location.**

- `README.md:291–292`: "`dφ=φ_z dz+φ_{\bar z}d\bar z`" and "`φ_{\bar z}=0`"
- `:532`: "`int K_{j+1}\setminus K_{j-1}^+`"
- `:326–328`: "Consume Mathlib's `ImplicitFunctionData.contDiffAt_implicitFunction` and `ImplicitFunctionData.analyticAt_implicitFunction` from `TauCeti.Analysis.Analytic.Inverse`"

**Claim.**

- House style is Unicode mathematics, and the rest of the README writes `z̄` and `∖`.
- In the sentence at `:326–328`, the second declaration is Tau Ceti's, not Mathlib's. The first is Mathlib's and is not in that Tau Ceti module.

**Witness.** `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:41` is `contDiffAt_implicitFunction` in `namespace ImplicitFunctionData`. `TauCeti/Analysis/Analytic/Inverse.lean:129` is `analyticAt_implicitFunction` in `namespace ImplicitFunctionData` (`:123`).

**Repair.**

- Write `dφ=φ_z dz+φ_z̄ dz̄`, `φ_z̄=0` and `int K_(j+1)∖K_(j−1)^+`.
- Write "Mathlib's `ImplicitFunctionData.contDiffAt_implicitFunction` and Tau Ceti's `ImplicitFunctionData.analyticAt_implicitFunction` (`TauCeti.Analysis.Analytic.Inverse`)".
- After R04, the paragraph at `:323–332` becomes the citation of the joint implicit-function theorem anyway.

## Verified sound

### Gate, build, signatures, padding

- **Worktree.** At `4f5ca9647c75b046959a87e28658740d5f137403`, clean. The merge base with `origin/main` is a0ad405. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate, rerun from the worktree.**

```text
gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

  The worker's run also reports `build=0`.

- **Dependency check (movable), on this head.**

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

- **Dependency probe.** On a scratch copy of the README with `GlobalHolomorphicFunctions §2.5; DeRhamCohomologyAndDuality §3.1` added to line 513's `*Needs:*`, the check prints `UPWARD: ComplexKahlerGeometry (on main) -> DeRhamCohomologyAndDuality (#393)` and `-> GlobalHolomorphicFunctions (#95)`. So this roadmap, being on main, must own the objects that README:49–56 lists; see Ownership below.
- **Elaboration.** `lake env lean` on `Suggested.lean` at the branch pins exits 0 with exactly 7 warnings, all ``declaration uses `sorry` ``, at lines 76, 96, 125, 139, 157, 174 and 183.
- **Signatures.** I put `#check @name` for all 7 declarations in one scratch file that imports the built module, and elaborated it once. Each type is identical to `scratch/signatures.md` apart from the namespace prefix. Every binder the README statement needs is present, for example `[I.Boundaryless]`, `[IsManifold I ∞ P]`, `[T2Space P]`, `[SecondCountableTopology P]` and `[FiniteDimensional ℂ E]` in `mixed_parameter_solver`. The file declares no `def` or `instance`.
- **Padding probe.** On a scratch copy, I replaced every `sorry` with `first | rfl | simp | infer_instance | (constructor <;> infer_instance)`. All 7 fail, with errors at lines 89, 116, 131, 149, 168, 179 and 190 of the copy. At main's pin the `IsDomain` conjunct alone would close; that is R04.
- **Header.** The file is `module`, `public import Mathlib`, `@[expose] public section`. It has no `set_option`, no `lemma`, no sorry'd data and no `example`. Twelve `Suggested.lean` files on main use the same header.

### Adversarial pass

Each row recomputes a statement on concrete instances. Rows 1–11 are the headline theorems in `Suggested.lean`; the sampled targets follow; the last rows are the targets the findings touch.

| # | Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|---|
| 1 | `finite_rank_runge_approximation` | K = ∅; K = {0}, Ω = ℂ, U = D(0,1) | K = ∅: L = ∅, K ⊆ int ∅, N = 0, and ∀ z ∈ K is vacuous. K = {0}: L = D̄(0,½), ζ₀ = 0, g₀ = 1, error ‖f(0) − f(0)‖ = 0 ≤ εB. A = 0 gives error 1 on f = 1 | Holds; the zero operator is excluded for ε < 1 |
| 2 | same; the necessity of `hRunge` | Ω = ℂ, K = {2 ≤ \|z\| ≤ 3}, f = 1/z | The component {\|z\| < 2} has compact closure ⊆ ℂ, so `hRunge` fails. ∮_{\|z\|=5/2} f = 2πi but 0 for entire g, so sup_K\|f − g\| ≥ 2/5. On Ω = {1 < \|z\| < 4} the closures meet \|z\| = 1 and \|z\| = 4 ∉ Ω, so the hypothesis holds and g = 1/z has error 0 | Hypothesis needed and correctly stated |
| 3 | `mixed_parameter_solver` | P = ℝ, Q = ℂ∖{0}, Ω = ℂ, f = pq | u = pq z̄: u_x = pq, u_y = −ipq, (u_x + iu_y)/2 = pq; ∂u/∂q̄ = 0 | Holds |
| 4 | same, degenerate cases | P = Q = point, f = 1; Ω = ∅ | u = z̄ gives (1 + i(−i))/2 = 1; u = z gives (1 + i·i)/2 = 0. With Ω = ∅ there is no evaluation point, so u = 0 | Holds; u = z is excluded |
| 5 | `weierstrass_preparation` | n = 0, f = w² + w³ | Derivatives at 0 are 0, 0, 2 ≠ 0, so d = 2; u = 1 + w, a = (0,0); f = (1+w)·w² | Holds |
| 6 | same | n = 1: f = w² − z; f = 1 + z + w; f = z | d = 2, u = 1, a₀ = −z, a₁ = 0, a₀(0) = 0. d = 0, u = f, P = 1. For f = z, `iteratedDeriv d (w ↦ 0) 0 = 0` for every d, so `hd` cannot hold | Holds; z is correctly excluded |
| 7 | `weierstrass_preparation_unique` | n = 0, f = w², candidate u′ = 1 + w | (1+w)(w² + a′₁w + a′₀) with constant a′ᵢ = 0 gives (1+w)w² ≠ w² | Unique. `aᵢ 0 = 0` is implied by f = uP (P(0,w) = wᵈ); unused-hypothesis note only, no change |
| 8 | `weierstrass_division` | n = 0, g = w², f = 1 + w + w² | q = 1, r = (1, 1). The alternative q′ = 0 would need remainder 1 + w + w², of degree 2 ∉ span{1, w} | Unique |
| 9 | same, d = 0 | g = 1 + z + w | r is empty and q = f/g with q(0) = f(0) | Holds |
| 10 | `holomorphicStalk_noetherian` | E = 0; E = ℂ | E = 0: the stalk is ℂ, a field. E = ℂ: every ideal is (zˢ) with s the least order. The real smooth stalk has the non-finitely-generated ideal of flat germs | Holds; 𝓘(ℂ, E) excludes the real model |
| 11 | `holomorphicStalk_factorial` | E = ℂ²: zw; real smooth germs exp(−1/x) and its reflection | z and w are nonassociate primes. In the real model the two germs are nonzero with product 0 | Holds over ℂ; the real model is not a domain |
| 12 | `d^c = i(∂̄ − ∂)`, `dd^c = 2i∂∂̄` (README:74, 117) | f = \|z\|² | d^c f = 2x dy − 2y dx; dd^c f = 4 dx∧dy; dz∧dz̄ = −2i dx∧dy, so 2i∂∂̄f = 4 dx∧dy | Equal |
| 13 | `h_T`, `h_src` (README:82–96, 118) | u = 1, v = i | h_T = g(1,i) + iω(1,i) = i; h_src,tensor = 2h_T(i,1) = −2i; native 2i; Im(2h_T) = 2 dx∧dy | Matches the Check |
| 14 | `A = h⁻¹∂h`; O(1) curvature `−2πiω_FS` (README:99–102) | O(−1) frame (1, z), h = 1 + \|z\|² | Θ(O(−1)) = −∂∂̄ log h = 2πiω_FS, so Θ(O(1)) = −2πiω_FS. Demailly V (15.8): Θ(O(1)) = d′d″ log(1 + \|z\|²) = −2πiω_FS | Equal |
| 15 | Hodge–Riemann sign (README:2126) | n = 1, α = dz and α = dz̄ | i·∫dz∧dz̄ = i(−2i)·area = 2·area; i⁻¹∫dz̄∧dz = (−i)(2i)·area = 2·area | Both positive |
| 16 | Cauchy–Green T (§2.1, README:417, 427, 430) | radial φ with φ(0) = 1 | ∫(1/(πζ))∂̄φ dA = ∫₀^∞ φ′(r)dr = −1 = −φ(0). Demailly I (3.4): f(0) = ⟨1/πz, −∂f/∂z̄⟩. The kernel 1/(ζ − z) flips ∂̄Tφ(0) to −1 | Equal |
| 17 | Runge Checks (§2.1, README:478–486) | two unit discs at 0 and 3, K = {0, 3}; Ω = ℂ∖{0}; K = {1 ≤ \|z\| ≤ 2} | The closure D̄(0,1) ⊄ Ω, so the hypothesis holds, and A f = f(0)1_{D₀} + f(3)1_{D₃} has error 0. The inner closure contains 0 ∉ Ω, so filling leaves Kⱼ unchanged. Filling {1 ≤ \|z\| ≤ 2} in ℂ adds 0 | Holds |
| 18 | Realification Checks (§3.0, README:653–655) | z ↦ iz; z ↦ z̄ | The real matrix of z ↦ iz is ((0,−1),(1,0)), det 1. For z̄: D(i) = −i, while iD(1) = i | Holds |
| 19 | Stalk units (§3.1, README:690–695) | 1 + z; z; ℂ⁰ | 1 + z has value 1 and inverse 1/(1+z). z has value 0, so it is a nonunit of order 1. At ℂ⁰ the stalk is ℂ | Holds |
| 20 | Planar star (§5.1, README:1102) | dx, dy with m = 2; reversed orientation | *dx = dy, *dy = −dx, *²dx = −dx = (−1)^{1·1}dx; reversed: *dx = −dy | Holds |
| 21 | Density line and transpose (§5.1, README:1103, 1108) | chart derivative −2; P = x∂ₓ | The density factor is \|−2\| = 2 and the orientation sign −1. Pᵗψ = −xψ′ − ψ; ⟨P1, ψ⟩ = −∫(xψ)′ = 0; with −x∂ₓ the value is ∫ψ = 1 | Holds |
| 22 | Planar exactness (README:1106, 1493–1495, 1503) | β = dx∧dy, u = z̄/(2i) | ∂̄u = 1/(2i); dz̄∧dz = 2i dx∧dy, so d(u dz) = dx∧dy; −u gives −dx∧dy | Holds |
| 23 | Finite-order primitive (§5.2, README:1203–1204) | w = δ₀, m = 2; u = δ′₀ | H₂ = max(x, 0) and D²H₂ = δ₀. ⟨xδ′, ψ⟩ = −(xψ)′(0) = −1 = (−1)¹1!·u₁ | Holds |
| 24 | Delta series (§5.2, README:1183–1184, 1205) | φ = 1/(1+2x) near 0, n = 0..3 | φ⁽ⁿ⁾(0)/n! = (−2)ⁿ and ⟨δ⁽ⁿ⁾, φ⟩ = (−1)ⁿφ⁽ⁿ⁾(0), giving 1, 2, 4, 8; partial sums 1, 3, 7, 15; support (−¼, ¼) ⊂ \|x\| < ½ | Diverges, as claimed |
| 25 | Non-extension of exp(1/‖x‖²) (§5.2, README:1171–1177) | φ_ε on B(εe₁, cε), c < ¼ | ‖x‖ ≤ (1+c)ε, so the integrand is ≥ exp((1+c)^{−2}ε^{−2}) on mass ∝ εⁿ, while finite order N gives ≤ Cε^{−N} | Contradiction for every N |
| 26 | Montel Checks (§5.3, README:1231–1233) | sin(jx) on ℝ; base ℕ | (sin jx)′(0) = j is unbounded. ℂ^ℕ with closed unit discs is compact by Tychonoff | Holds |
| 27 | Atlas norm and form representation (§5.4, README:1649–1652) | χ₁ = χ₂ = 1/√2; a(u,v) = 2ūv; D = 2·id | ‖1‖² = ½ + ½ = 1 and Σχᵢ² = 1. A = 2, (A+1)⁻¹ = ⅓. For ℓ = cv, 3w̄ = c gives w = c̄/3. ⟨Du, Dv⟩ = 4ūv | Holds |
| 28 | Peetre bound (§5.4, README:1543) | s = 1, ζ = 0; s = −1, ζ = −η | ⟨η⟩ ≤ √2⟨η⟩; 1 ≤ √2⟨η⟩⁻¹⟨η⟩ = √2 | Holds |
| 29 | Codifferential sign (§5.4, README:1633) | Demailly VI (3.9) with p = k − 1; main-pin `codifferential` | (−1)^{m(k−1)+1} = (−1)^{m(k+1)+1}. Main pin: (−1)^{m(K+2)+1} on (K+1)-forms with K + 1 = k | Equal |
| 30 | Planar δ and Δ_H (§5.5, README:1666–1704) | α = x dx + y dy; α = x dy; h = x² + y²; u = \|x\|³ | δα = −(Pₓ + Q_y) = −2; for x dy, dα = dx∧dy and δα = 0. δ(h dx∧dy) = 2y dx − 2x dy. Δ_H h = −4 while div grad gives +4. u_xx = 6\|x\|, so Δ_H u = −6\|x\|. *dz = −i dz and *dz̄ = i dz̄ | Holds |
| 31 | Component splitting (§5.6, README:1800–1801) | ranks (0,1,2), section (0, 1, (1, i)) | Squared L² norm 0 + 1 + 2 = 3; eigenvalue 2 has multiplicity 0 + 1 + 2 = 3 | Holds |
| 32 | Hermitian identities (§5.7, README:1863–1872) | ℂ: dz, f = z and z̄; standard ℂ² | dz∧barStar dz = dz∧i dz̄ = 2 dx∧dy = ⟨dz,dz⟩ vol, while dz∧*dz = 0. ⟨dz, dz̄⟩ = 1 + (−i)(−i) = 0. −*∂*(f dz̄) = −2f_z, so −2 for z and 0 for z̄. On ℂ², ω² = 2 vol | Holds; matches Demailly VI (3.6), (4.2) |
| 33 | Serre pairing (§5.8, README:1931–1932) | point with E = ℂ²; ranks (0,1,2) | (e₁, e₁*) = 1 and (e₁, e₂*) = 0; h⁰ = 0 + 1 + 2 = 3 | Holds |
| 34 | Lefschetz (§6.0, README:1984, 1997–2009) | ℂ: 1, ω; ℂ²: 1, ω₁ − ω₂ | ΛL1 = ⟨ω, ω⟩ = 1; [Λ,L]ω = −ω = (1 − 2)ω; on ℂ², ΛL1 = 2 and Λ(ω₁ − ω₂) = 0 | Holds; Demailly VI 5.9 gives [L,Λ] = p + q − n |
| 35 | Kähler identities (§6.0, README:2016–2028) | α = x dy; f = x; f = x² + y² | [Λ,d]α = Λ(dx∧dy) = 1 and (d^c)*α = P_y − Q_x = −1. [Λ,∂]α = Λ(½dx∧dy) = ½ and ∂̄*α = −2(i/4) = −i/2, so i(−i/2) = ½. [L,d*]x = −δ(x dx∧dy) = dy = d^c x. Δ_d = −4 and Δ_∂ = −2 | Holds; Demailly VI 6.4 signs |
| 36 | Kähler predicate and Nakano bound (§6.0, README:1972–1974, 2044–2063) | ω = e^{x₁}(ω₁ + ω₂) on ℂ²; iΘ = aω⊗Id | dω = e^{x₁}dx₁∧dx₂∧dy₂ ≠ 0. On (n,k)-forms [iΘ,Λ] = a(n + k − n) = ka, giving 1, 2 for a = 1 and −k for a = −1 | Holds |
| 37 | O(k), canonical bundle, ω_FS (§7.2, README:2340–2344, 2380–2399) | ℂP¹, ℂP²; z = 1/w | h⁰(O(1)) = C(2,1) = 2 on ℂP¹ and C(3,2) = 3 on ℂP²; O(2) has curvature −4πiω_FS; dz = −w⁻²dw gives K ≅ O(−2), so H¹(O(−1))* ≅ H⁰(O(−1)) = 0. ∫ dx∧dy/(π(1+r²)²) = 1 | Holds |
| 38 | Hopf surface (README:2479–2483) | dilation z ↦ 2z | z^α dz_j has weight 2^{\|α\|+1}; z₁^{−m}z₂^{−n}dz_j has weight 2^{1−m−n} ≤ ½. Σ_{p+q=k} h^{p,q} = 1, 1, 0, 1, 1 = b_k(S¹×S³) | Holds |
| 39 | Chevalley–Eilenberg normalization (§8.1, README:2546–2549, 2569) | Heisenberg algebra, [X,Y] = Z | Standard: dZ*(X,Y) = −1. Source p. 116, degree one: 2δg(x₁,x₂) = P_{x₁}g(x₂) − P_{x₂}g(x₁) + g([x₁,x₂]); with the source bracket [X,Y] = −Z this gives δZ* = −½, and multiplying by 2 gives −1 | Comparison correct |
| 40 | Iwasawa (§8.1–8.2, README:2522, 2572, 2648–2649) | φ₃ = dz₃ − z₁dz₂; real Heisenberg | dφ₃ = −φ₁∧φ₂ (`angella-iwasawa` line 510); h^{1,0} = 3, h^{0,1} = 2, b₁ = 4 (lines 701, 719–724), and 3 + 2 ≠ 4. The last nonzero term of the lower central series is ℝZ, the quotient is ℝ², and the fibre is ℝ/ℤ | Holds |
| 41 | R01: the contract names | 65 backticked Tau Ceti names | 54 absent at 358314d; 0 absent at 2fd255d9 | Finding R01 |
| 42 | R03: the three germ statements | see the R03 test list | Every degenerate instance is true | Statable; finding R03 |
| 43 | R04: `hRunge` and the solver's ∂̄ | the main-pin definitions | `IsFilledIn` is identical to `Suggested.lean:79–81`; `conjWirtingerDeriv` at v = 1 is identical to `:113–115` | Finding R04 |

### Sources checked (the seeded sample, plus the locators the findings touch)

- **§2.1.**
  - `demailly-agbook` line 879: I (3.1), p. 20, the Wirtinger operators.
  - Line 918: I (3.4), p. 21. E = 1/(πz) is a fundamental solution of ∂/∂z̄, which supports ∂̄Tφ = φ and T∂̄φ = φ.
  - `rainer-advanced-complex-analysis` line 1338: Theorem 11.1 on printed p. 25, for a *domain* U. README:450–452 states the extension to arbitrary open Ω component by component as a step to prove.
  - Line 1437: Lemma 11.3 (3)–(4), pp. 27–28.
  - Line 1550: Theorem 11.7, p. 29.
- **§3.0.** No source locator. Its Tau Ceti items are covered by R01; `contDiffGroupoid` is `Geometry/Manifold/IsManifold/Basic.lean:673`.
- **§3.1.**
  - `demailly-agbook` lines 3794 and 3804: (2.1) and (2.3), p. 80.
  - Line 3817: the division uniqueness clause.
  - Line 3872: (2.7), p. 81.
  - Line 3931: (2.10), p. 82.
  - The orders "exactly d" and `aᵢ(0) = 0` match line 3799.
- **§§5.1–5.3.** These carry no source locator; the library names they cite are listed below. §5.2's Hörmander 2.3.5 is under Not verifiable.
- **§5.4.** `demailly-agbook` line 14386: VI (3.9), p. 292, `d* = (−1)^{mp+1}⋆d⋆` as the adjoint of d on p-forms.
- **§5.5.** Lines 14323–14352: VI (3.1)–(3.5), p. 291, including `⋆⋆ = (−1)^{p(m−1)}`. Also (3.9) on p. 292, and I (3.1) on p. 20.
- **§5.7.**
  - Line 14675: (4.2) `dV = ωⁿ/n!`, p. 296.
  - Line 14360: (3.6), p. 292, where `#` is defined by `s∧#t = ⟨s,t⟩dV` with a product linear in its first slot.
  - Line 14375: (3.8), p. 292.
  - Line 15370: §7, p. 309, `D*_E = −⋆D_E⋆` and its (0,−1) component.
- **§5.8.** Lines 15377, 15385 and 15390: (7.1) and (7.2) on p. 309, (7.3) on p. 310.
- **§6.0.**
  - Line 14652: Definition 4.1, p. 296.
  - Lines 14688 and 14700: Examples 4.4 and 4.6, p. 297.
  - Line 14736: Theorem 4.8, p. 298. The source uses `ω = iΣω_lm dz∧dz̄`; README:1959 says the comparison goes through the Conventions normalization.
  - Lines 14871–14873: (5.4)–(5.5), p. 300.
  - Line 14948: Corollary 5.9, p. 301.
  - Lines 14967 and 14987: Definition 5.11 and (5.15), p. 302.
  - Line 15156: Theorem 6.4, p. 305.
  - Lines 15190 and 15210: Corollary 6.5 and Theorem 6.7, p. 306.
  - Lines 16248 and 16281: VII Theorem 1.1, p. 329, and Corollary 1.3, p. 330.
  - Lines 16637–16652: VII (6.1)–(6.3), p. 338.
  - Lines 16819 and 16828: VII (7.1)–(7.2), p. 341; §7 opens on p. 340.
- **§7.2.**
  - Lines 13691 and 13699: V (15.1)–(15.2), p. 277.
  - Line 13780: V (15.8), p. 279.
  - Line 14688: VI Example 4.4, p. 297.
  - Line 13684: the projective charts of §7.1, p. 277, for n ≥ 1. README:2311–2312 marks n = 0 as an added target.
- **§8.1.**
  - `angella-iwasawa` lines 480–533: §3.1, pp. 9–10, giving the Gaussian lattice and left quotient.
  - `chevalley-eilenberg` lines 1167–1232: §23, (23.1)–(23.2), pp. 115–116.
  - `sakane-parallelisable` lines 85–105: §2 and Theorem 1, pp. 188–189.
- **§8.2.** `sakane-parallelisable` lines 106–115, p. 189: A = Cᵐ(G), and the lattice steps cite Raghunathan p. 31 Corollary 1 and p. 23 Theorem 1.13.
- **Also checked.**
  - `lojasiewicz-triangulation` line 512: §3, Theorem 2, p. 464, for a countable real-analytic manifold with properties (b) and (c).
  - `demailly-agbook` lines 4286, 4742, 4842 and 4929: II (3.19) p. 89, (4.22) p. 97, (4.29) p. 99 and (4.31) p. 100, for R03 and §3.2.
- **Total.** 47 locators were opened. Each says what the README says at the generality stated.

### Library declarations opened

- **Mathlib at f6090c7.**
  - `smoothSheafCommRing` (`Geometry/Manifold/Sheaf/Smooth.lean:297`); its sections are `C^∞⟮IM, U; I, N⟯` (`:107`).
  - `smoothSheafCommRing.isUnit_stalk_iff` (`Sheaf/LocallyRingedSpace.lean:59`) and `instLocalRing_stalk` (`:126`).
  - `ImplicitFunctionData.contDiffAt_implicitFunction` (`Analysis/Calculus/ImplicitContDiff.lean:41`) and `ContDiffAt.implicitFunction` (`:55`).
  - `ContDiffAt.to_localInverse` (`InverseFunctionTheorem/ContDiff.lean:66`).
  - `exteriorPower.hodgeStar` (`LinearAlgebra/ExteriorPower/HodgeStar.lean:48`), whose module is finite and free (`:41`).
  - `CovariantDerivative.leviCivitaConnection` (`…/CovariantDerivative/LeviCivita.lean:359`).
  - `ContinuousLinearMap.complexOfReal` (`Analysis/Complex/Conformal.lean:217`), `real_linearMap_map_smul_complex` (`:188`) and `differentiableAt_complex_iff_differentiableAt_real` (`:285`).
  - `MDifferentiable.isLocallyConstant` and `exists_eq_const_of_compactSpace` (`Geometry/Manifold/Complex.lean:154, 169`).
  - `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`Analysis/Analytic/Uniqueness.lean:223`).
  - `MvPolynomial.mul_esymm_eq_sum` (`…/NewtonIdentities.lean:221`).
  - `PowerSeries.IsWeierstrassFactorization` (`RingTheory/PowerSeries/WeierstrassPreparation.lean:658`).
  - `meromorphicOrderAt_eq_int_iff` (`Analysis/Meromorphic/Order.lean:97`).
  - `OnePoint.equivProjectivization` (`…/OnePoint/ProjectiveLine.lean:83`).
  - `Opens.overPullbackSheafEquivOver` (`Topology/Sheaves/Over.lean:88`).
  - `IsCoercive.continuousLinearEquivOfBilin` (`…/LaxMilgram.lean:105`).
  - `MemSobolev` and `memSobolev_zero_iff` (`Analysis/Distribution/Sobolev.lean:153, 157`).
  - `BesselPotentialSpace` (`…/BesselPotentialSpace.lean:47`).
  - `fourierMultiplierCLM` (`…/FourierMultiplier.lean:50`).
  - `TestFunction.continuous_iff_continuous_comp` (`…/TestFunction.lean:333`).
  - `verticalClosedStrip` and `norm_le_interp_of_mem_verticalClosedStrip'` (`Analysis/Complex/Hadamard.lean:75, 612`).
  - `SchwartzMap.fourier_convolution` (`Analysis/Fourier/Convolution.lean:164`).
  - `MontelSpace` (`Analysis/LocallyConvex/Montel.lean:45`).
  - `BoundedContinuousFunction.arzela_ascoli` (`…/Bounded/ArzelaAscoli.lean:109`).
  - `Complex.starConvex_one_slitPlane` (`Analysis/Complex/Convex.lean:45`).
  - `LinearMap.det_restrictScalars` (`RingTheory/Norm/Transitivity.lean:178`) and `Algebra.norm_complex_eq` (`RingTheory/Complex.lean:42`).
  - `AnalyticAt.restrictScalars` (`Analysis/Analytic/Constructions.lean:830`).
  - That is 34 declarations, all present.
- **Tau Ceti at 358314d, present.** `ImplicitFunctionData.analyticAt_implicitFunction` (`Analysis/Analytic/Inverse.lean:129`), `IsCoercive.formSolutionMap` (`Analysis/InnerProductSpace/Variational/Spectrum.lean:93`), the modules `CauchyIntegralPolydisc`, `Analytic.Inverse` and `Riemannian.VolumeDensity.Volume`, and `riemannianVolume` with its locally-finite instance. These are 11 of the 65 names. The other 54 are absent (R01).
- **Tau Ceti at 2fd255d9.** The files and lines in R01, R02 and R04, including:
  - `HodgeStar/*`, `Codifferential.lean:88–91`, `DeRham/Basic.lean:127, 141`
  - `MapCoeff.lean:273`
  - `Complex/Analytic.lean:115, 123`
  - `Nijenhuis.lean:158`, `AlmostComplexStructure.lean:76, 221`
  - `SmoothSingular/Integral.lean:86`
  - `Pompeiu/Parameter.lean`, `FilledIn.lean:61`, `Exhaustion.lean:86`, `Wirtinger/Basic.lean`
  - `Complex/ImplicitFunction.lean:57`, `Complex/Orientation.lean:216, 359`
  - `StructureSheaf/{Domain:93, MeromorphicGerm:73–199, SmoothComparison, LocalRing}.lean`

### Cross-roadmap citations resolved

- **On main (12ed9bd).**
  - ComplexManifolds Milestones 1–7 (`:172–319`) and ComplexTori Milestone 1 (`:130`).
  - DifferentialGeometry 0.1–0.4, 1.1–1.4, 2.1, 2.2, 5.2–5.5, 8.3–8.5, 12.1 and 12.4 (`:272–923`), with `legacySmoothTwoFormEquiv` at `:303`.
  - SmoothBundlesConnections B2.1–B2.2, B3–B5 and B6.0–B6.3 (`:559–1716`).
  - PDE 1.3 (A3) (`:769`) and 2.2 (B9) (`:1148`).
  - PseudodifferentialOperators P1.0 (`:164`) and P1.1 (`:507`).
  - LieGroupoidsPoisson G1.3 (`:636`) and G1.6 (`:738`).
  - RealAnalyticGeometry R0–R5 (`:39–1007`), including R3.2 (`:728`).
  - AlgebraicTopology Stages 3, 4, 6 and 7, with 4.6 at `:789`. That item owns the generic `Projectivization 𝕜 V` quotient topology and names K7.
  - AlgebraicTopology `cwSubcomplexNeighborhoods` (`:755`) and `simplicialRealizationCW` (`:817`).
  - GeometricTopology Layer 11 (`:831`).
  - `Completed/RealAlgebraicGeometry` Layer 7 (`:479`), `Completed/ContourIntegration`, and DGFloer's filtered-complex spectral sequence (`:226`).
- **At open heads.**
  - UnboundedOperators §4.7 (UO-D06) at b46d79f (`:545, 567`).
  - VariationalMethods §§2.2–2.4, 3.1, 4.3 and 5.1–5.3 at 7ea28a3 (`:452–924`), with the three names `scratch/citations.md` lists at `:845, 849, 884`.
  - DifferentialGeometry at 4d6e96e (R05) and GeometricTopology at 9f470e6 (R07).
- **Anchor map.** This pull request drops the anchors `#k2-…`, `#k5-…` and `#k7-…`. README:244–256 maps each to its new section, one line per anchor, which covers every citing roadmap in `scratch/overlaps.md`.

### Ownership

- **GlobalHolomorphicFunctions (#992 at db419f3, `:50–51`, `:2038–2045`) and DeRhamCohomologyAndDuality (#1768 at 1b57dbe, `:70–76`, `:695–700`).** Both state Layer 2's Cauchy–Green, Runge and planar-exactness targets and §6.1's relative integration, and both name ComplexKahlerGeometry as the consumer. This roadmap is on main, and the dependency probe above shows that citing either of them would be UPWARD. So this roadmap is the earlier owner, README:49–56 records that nothing is imported from them, and the reconciliation belongs on their side. This is not a finding here.
- **PseudodifferentialOperators and this roadmap cite each other on main.** The items are disjoint, and the item-level order is density line (§5.1) → P1.0 → distributional action (§5.1), with no item cycle; the dependency check agrees. Earlier rounds settled this as non-blocking, and it is not raised again.
- **CalibratedGeometry (#946 at d70bed5, `:25–28`, `:377–385`).** It owns the Wirtinger inequality and consumes K5b.0's `dvol = ωⁿ/n!`. README:2146 uses only the equality on complex submanifolds, which follows from §5.7. There is one owner.
- **SobolevDifferentialForms (#1609, read with `roadmaps show`).** It works on Lᵖ covector-valued functions on Euclidean domains, and its scope excludes Riemannian manifolds. §5.5 uses DifferentialGeometry's rough-form carrier with C¹/C² coefficients, a different carrier.
- **No collisions.** No `Suggested.lean` name collides with a declaration in a roadmap readable here.

## Not verifiable

- `webster-nn` (§1.1), `hormander-alpdo1` (§5.2, Theorem 2.3.5), `wells-dacm`, `griffiths-harris` (§3.2) and `raghunathan-discrete-subgroups` (§8.2) are settled as uncertified and cited by locator. I did not request them.
- The statements of R02 and R04 at main's pins (Tau Ceti 2fd255d9, Mathlib 1b1ccf4) were not elaborated, because `lake env lean` is permitted only on this worktree's packages. I read the 2fd255d9 declarations in the content checkout's package.
- Ownership against ComplexComparisonPartII (#848) was not checked by object: the brief gives no checkout for it, and README:877–879 only states that it consumes K4.

## Source issues

- **Misprint** in demailly-agbook at VII §1, proofs of Theorems 1.1–1.2, pp. 329–330: the source cites "Prop. V-12.??", "Th. VI-10.1" and "the Jacobi identity VI-10.2", but VI §10 is about complex curves in this version; it should cite VI Theorem 6.8 and (VI-5.7); affects nothing.
- **Misprint** in demailly-agbook at VII §7, p. 341: the source says the Λ formula is computed "as in the proof of Prop. VI-8.3", but VI (8.3) is a Bott–Chern map; it should be Proposition VI-5.8; affects nothing.
