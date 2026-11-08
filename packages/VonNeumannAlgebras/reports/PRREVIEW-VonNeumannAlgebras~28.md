# Review of VonNeumannAlgebras (pull request #1041 at 2f112b6)

**Verdict:** needs changes

This is a full review of the head already read in the previous round; nothing in the folder has changed since then. The previous review's only finding, the missing rebase, is not repaired (R01 below). This round's full review adds two blocking findings, both from the headline audit. `Suggested.lean`'s docstring declares the Layer 13 end theorems (injective ⟺ hyperfinite, and uniqueness of the injective II₁ and II∞ factors) and the Layer 12 theorems (Dye, Mackey–Gleason–Bunce–Wright) not statable at the pins. All five are statable with short predicates on native carriers, and a probe file elaborates them at the branch pin. Three P3 findings concern missing locators, a broken supplier link and misplaced Checks.

## Previous findings

- R01 (branch not rebased on main): **not repaired**. At 2f112b6, `git merge-tree --write-tree origin/main HEAD` still reports `CONFLICT (add/add)` on `TauCetiRoadmap/VonNeumannAlgebras/README.md` and `Suggested.lean`. The merge base is still `350e970c`, and the Lake pins are still Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`. Carried as R01 below.

## R01 (P3) — The branch is still not rebased on main, and at main's pin the Layer 0 headlines restate Tau Ceti's nondegeneracy predicate

**Location:** the branch as a whole. `README.md:194–209` (the From Tau Ceti contract: `PositiveLinearMap.toGNS`, `…gnsVector`, `VonNeumannAlgebra.adjoin`, the density theorem). `Suggested.lean:79` and `:91`: "`Dense (Submodule.span ℂ {ξ : K | ∃ a η, π a η = ξ} : Set K)`".

**Claim:** The pull request's description still presents the main roadmap's pull request as under review, but that roadmap has merged (`f8dfe0ad`). Git sees this branch as adding both files main already has, so the pull request cannot merge. The README's Tau Ceti contract is written against main's pin, `2fd255d9`. The branch's own pin `a91d3aaf` has neither `TauCeti/Analysis/CStarAlgebra/GNS.lean` nor `TauCeti/Analysis/VonNeumannAlgebra/`. Its `Analysis/CStarAlgebra/` contains only `CharacterSpaceMeasure.lean` and `UnitaryCharacter.lean`. Once rebased onto main's pin, Tau Ceti also has the predicate that both Layer 0 headlines spell out by hand.

**Witness:** `git merge-tree --write-tree origin/main HEAD` gives add/add conflicts on both files. At main's pin, `TauCeti/Analysis/CStarAlgebra/Representation/Nondegenerate.lean:62` has `def IsNondegenerate (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) : Prop := Dense (Submodule.span ℂ (⋃ a, Set.range (π a)) : Set H)`, with `isNondegenerate_iff_dense` (`:68`) and `isNondegenerate_of_map_one` (`:82`).

**Repair:**
1. Rebase onto main, resolving both files to this head's content, so that the branch carries main's `lake-manifest.json`.
2. Then state the two Layer 0 headlines with `π.IsNondegenerate`, adding `import TauCeti.Analysis.CStarAlgebra.Representation.Nondegenerate`.
3. Name `NonUnitalStarAlgHom.IsNondegenerate` in the From Tau Ceti contract and in the Layer 0 *Needs:* lines.
4. Update the description to say what this revision changes relative to main.

Control: `git merge-tree --write-tree origin/main <new head>` prints only a tree id, and the gate's targeted build passes at main's pins.

## R02 (P2) — Connes's theorem (injective ⟺ hyperfinite) and uniqueness of the injective II₁ and II∞ factors are statable at the pins but declared not statable

**Location:** `Suggested.lean:51–54`: "Layer 13: injectivity versus semidiscreteness, hyperfiniteness, and the classification of injective factors … (no conditional expectation onto a von Neumann subalgebra, no completely positive approximation …, and no Connes invariants)". The Summary at `README.md:14–15` names these as end theorems. The definitions are at `README.md:3814–3815` (injectivity, with its contractive-projection form) and `:3901–3902` (hyperfiniteness); the theorems are at `:4108–4111` and `:4157`.

**Claim:** Two of these theorems need neither a conditional-expectation carrier nor semidiscreteness: injective ⟺ hyperfinite on separable-predual algebras, and uniqueness of the injective II₁ and II∞ factors. Injectivity is a contractive projection `B(H)→M`, stated by range and fixing conditions exactly as the same file's `tomiyama` does (`Suggested.lean:239–240`). Hyperfiniteness is an increasing sequence of finite-dimensional unital star subalgebras whose union has double commutant `M` (Anantharaman–Popa, Theorem 11.2.2(3), p. 186, anantharaman-popa line 8298). Only semidiscreteness (point-ultraweak convergence) and the type III cases (Connes invariants) lack carriers.

**Witness:** I appended the following to a scratch copy of `Suggested.lean`; `lake env lean` exits 0 with only `sorry` warnings (19 = 14 + 5):

```lean
def IsInjective (M : VonNeumannAlgebra H) : Prop :=
  ∃ P : (H →L[ℂ] H) →L[ℂ] (H →L[ℂ] H),
    (∀ x, P x ∈ M) ∧ (∀ x ∈ M, P x = x) ∧ ‖P‖ ≤ 1

def IsHyperfinite (M : VonNeumannAlgebra H) : Prop :=
  ∃ A : ℕ → StarSubalgebra ℂ (H →L[ℂ] H), Monotone A ∧
    (∀ n, FiniteDimensional ℂ (A n)) ∧ (∀ n, (A n : Set (H →L[ℂ] H)) ⊆ M) ∧
    Set.centralizer (Set.centralizer (⋃ n, (A n : Set (H →L[ℂ] H)))) = M

theorem isInjective_iff_isHyperfinite [TopologicalSpace.SeparableSpace H]
    (M : VonNeumannAlgebra H) : IsInjective M ↔ IsHyperfinite M := by
  sorry

theorem nonempty_starAlgEquiv_of_isInjective_of_isTypeIIOne
    [TopologicalSpace.SeparableSpace H]
    {K : Type u} [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    [TopologicalSpace.SeparableSpace K]
    {M : VonNeumannAlgebra H} {N : VonNeumannAlgebra K}
    (hM : IsTypeIIOne M) (hN : IsTypeIIOne N) (hMi : IsInjective M) (hNi : IsInjective N) :
    Nonempty (M.toStarSubalgebra ≃⋆ₐ[ℂ] N.toStarSubalgebra) := by
  sorry
```

The II∞ form also elaborates, with `IsTypeIIInfinity M := IsFactor M ∧ ¬ IsFinite M ∧ (∃ p ∈ M, IsStarProjection p ∧ p ≠ 0 ∧ ∀ v ∈ M, star v * v = p → v * star v ≤ p → v * star v = p) ∧` (the no-minimal-projection clause of `IsTypeIIOne`). This matches `README.md:1646`.

**Repair:**
1. Add `IsInjective`, `IsHyperfinite`, `IsTypeIIInfinity`, `isInjective_iff_isHyperfinite`, `nonempty_starAlgEquiv_of_isInjective_of_isTypeIIOne` and the II∞ analogue to `Suggested.lean` under the Layer 13 section, as above.
2. Name them in the README at `:3814` (injectivity), `:3901` (hyperfiniteness), `:4108–4111` (injective iff hyperfinite) and the II₁/II∞ uniqueness claims.
3. Reduce the docstring's Layer 13 bullet to semidiscreteness and the type III classification.
4. Say in the docstring that "separable predual" is stated through a separable acting Hilbert space. Every such algebra has a faithful normal representation on one, and both predicates are representation-independent (Anantharaman–Popa, Proposition 10.2.2, p. 161).

Instances that pass: `H=0` (`P=0`, `‖P‖=0≤1`, consistent with "of norm one when M≠0"); `B(ℓ²)` (`P=id`; `A_n≅M_n⊕ℂ`); `R` (`M_(2^n)`). `L(F₂)` fails both predicates (the fourth Check at `:4012`).

## R03 (P2) — Dye's theorem and the Mackey–Gleason–Bunce–Wright theorem are statable at the pins but declared not statable

**Location:** `Suggested.lean:46–50`: "the Mackey–Gleason–Bunce–Wright theorem and Dye's theorem (… no normal Jordan map or finitely additive projection measure on a von Neumann algebra)". The README states them at `README.md:3651–3654` (V12.J.Scalar) and `:3677–3682` (V12.J.Dye). Dye's theorem is an end theorem in the Summary (`:13–14`).

**Claim:** A finitely additive bounded projection measure is a function on projections with an additivity hypothesis. A Jordan *-isomorphism is a `LinearEquiv` that preserves `star` and squares. "No type I₂ central summand" is a one-line predicate in the style of `IsTypeIIOne`, using the file's own `ProjectionEquivalent`. Normality of the Dye isomorphism needs no carrier: a Jordan *-isomorphism is an order isomorphism, so it preserves suprema of bounded increasing nets. The Lean form can omit it with a docstring note, as the trace theorems at `:208–214` already do.

**Witness:** These elaborate in the same scratch file (exit 0):

```lean
def HasTypeITwoSummand (M : VonNeumannAlgebra H) : Prop :=
  ∃ e f : H →L[ℂ] H, ProjectionEquivalent M e f ∧ e * f = 0 ∧ e + f ≠ 0 ∧
    e + f ∈ M.commutant ∧
    ∀ x ∈ M, ∀ y ∈ M, (e * x * e) * (e * y * e) = (e * y * e) * (e * x * e)

theorem exists_unique_extension_of_finitelyAdditive {M : VonNeumannAlgebra H}
    (hM : ¬ HasTypeITwoSummand M) (μ : (H →L[ℂ] H) → ℂ)
    (hμ : ∀ p ∈ M, ∀ q ∈ M, IsStarProjection p → IsStarProjection q → p * q = 0 →
      μ (p + q) = μ p + μ q)
    (C : ℝ) (hC : ∀ p ∈ M, IsStarProjection p → ‖μ p‖ ≤ C) :
    ∃! φ : M.toStarSubalgebra →L[ℂ] ℂ,
      ∀ p (hp : p ∈ M), IsStarProjection p → φ ⟨p, hp⟩ = μ p := by
  sorry

theorem dye {K : Type u} [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    {M : VonNeumannAlgebra H} {N : VonNeumannAlgebra K} (hM : ¬ HasTypeITwoSummand M)
    (α : {p : H →L[ℂ] H // p ∈ M ∧ IsStarProjection p} ≃
      {q : K →L[ℂ] K // q ∈ N ∧ IsStarProjection q})
    (hα : ∀ p q : {p : H →L[ℂ] H // p ∈ M ∧ IsStarProjection p},
      (p : H →L[ℂ] H) * q = 0 ↔ (α p : K →L[ℂ] K) * α q = 0) :
    ∃! Φ : M.toStarSubalgebra ≃ₗ[ℂ] N.toStarSubalgebra,
      (∀ x, Φ (star x) = star (Φ x)) ∧ (∀ x, Φ (x * x) = Φ x * Φ x) ∧
      ∀ p, (Φ ⟨p.1, p.2.1⟩ : K →L[ℂ] K) = α p := by
  sorry
```

The predicate is discriminating on these instances:
- `M₂(ℂ)` satisfies it (`e=e₁₁`, `f=e₂₂`, `v=e₂₁`, `e₁₁M₂e₁₁=ℂe₁₁`). It is therefore excluded, as V12.J.Bloch requires: the map `(x,y,z)↦(x,y,2z)/√(x²+y²+4z²)` sends the orthogonal pair `(1/√2,0,±1/√2)` to vectors with inner product `−3/5`.
- `M₃(ℂ)` does not satisfy it: `e+f` central forces `e+f=1` and `3=2·rank e`.
- `ℂ` does not: `1≁0`.
- `R` does not: `eRe` is never commutative for `e≠0`.

**Repair:**
1. Add `HasTypeITwoSummand`, `exists_unique_extension_of_finitelyAdditive` and `dye` (as above) under a `/-! ## Layer 12 … -/` section.
2. Name them at `README.md:3651` and `:3677`.
3. Add the docstring note that normality of `Φ` is automatic and omitted.
4. Reduce the Layer 12 bullet to the two-projection theorem, tracial ultraproducts, central sequences and property Γ.

## R04 (P3) — The injective-classification and injectivity-equivalence claims carry no locator

**Location:** `README.md:4157–4165`: "Prove uniqueness of the injective II∞ factor and, for each 0<λ<1, the injective III_λ factor … Prove injective III₀ factors classified by conjugacy of their flows of weights". Its *Needs:* line reads "every preceding item of this layer and V11's discrete and continuous decompositions". At `:3814–3816`, "Define injectivity by CP extension and prove its equivalence to a contractive projection B(H)→M" also has no locator.

**Claim:** These are end theorems of the Summary, with no source at the claim. Takesaki III XVIII.1.1, the III_λ classification, appears only in the References (`:4423–4424`). XVIII.2.1–2.7 is cited at `:4219` and `:4226`, but for Krieger's orbit-equivalence step inside the III₀ bullet, not for the classification claim. No reference names a source for the II∞ case.

**Witness:** anantharaman-popa line 8376 (Corollary 11.2.4, p. 188) proves uniqueness of the separable AFD II∞ factor. haagerup-1989 line 1177 (Theorem 6.1) proves an injective III_λ factor with separable predual and a periodic state isomorphic to `R_λ`. anantharaman-popa line 7198 (Proposition 10.2.2, p. 161) gives injective ⟺ CP extension ⟺ conditional expectation from every `B(H)`.

**Repair:**
- At `:4157` cite Anantharaman–Popa, Corollary 11.2.4, p. 188, for II∞.
- For III_λ cite Haagerup 1989, Theorem 6.1, together with Takesaki III, XVIII.1.1 and 2.1–2.9, moved from the References to the claim. Cite the latter for III₀ as well.
- At `:3815` cite Anantharaman–Popa, Proposition 10.2.2, p. 161.

## R05 (P3) — The GlobalNumberFields link points to a folder main no longer has

**Location:** `README.md:59`: "`[GlobalNumberFields](../GlobalNumberFields/README.md) Layer 4 owns the finite-adele carrier`".

**Claim:** GlobalNumberFields is now a completed roadmap. The relative link resolves to `TauCetiRoadmap/GlobalNumberFields/README.md`, which does not exist on main `3b3f7ef`. Its Layer 4 is unchanged in content, but it lives at a different path. The same file links the other two completed suppliers correctly (`:45` OneParameterSemigroups, `:2764` ArithmeticDirichletSeries).

**Witness:** On main, `Completed/GlobalNumberFields/README.md:418` has "### Layer 4: finite adeles", and `TauCetiRoadmap/GlobalNumberFields` is absent. Main's own copy of this README has the same stale link.

**Repair:** Change the target to `../../Completed/GlobalNumberFields/README.md`. Control: every relative link in the README then resolves on main; I resolved all 15 targets, and this is the only failing one.

## R06 (P3) — Layer 4's definitions of normality and measurable fields have no Checks, and the cyclic/separating Checks sit under another target

**Location:**
- `README.md:1149–1162` defines normality, countable decomposability and faithfulness of positive functionals; no Checks follow.
- `:1287–1318` (V4.0.Fields) defines measurable Hilbert fields, direct integrals and decomposable operators; no Checks follow.
- `:1419–1427`: the three Checks about `IsCyclic`/`IsSeparating`, which V4.Normality defines at `:1243–1245`, sit under V4.0.Decomposition.

**Claim:** Every definition needs at least three discriminating Checks under its own target. These definitions have none, and V4.0.Decomposition's only Checks test another target's predicates.

**Witness:** Layer 4's only Checks blocks are at `:1139` (trace class), `:1367` (V4.0.Multiplication) and `:1419` (cyclic/separating).

**Repair:**
1. Move `:1419–1427` to follow V4.Normality (after `:1253`).
2. After `:1162`, add Checks such as these:
   - A Banach-limit state on `ℓ∞(ℕ)` is not normal: `1_{[0,n]}↑1` but its values are `0→1`.
   - `ω_ξ` is normal.
   - `B(ℓ²)` is not countably decomposable for nonseparable `ℓ²(I)`, while `ℓ∞(ℕ)` is.
   - `x↦x₁₁` on `M₂` is not faithful (`e₂₂↦0`).
3. After `:1318`, add Checks such as these:
   - The constant field `ℂ` over counting measure on `n` points has direct integral `ℂⁿ`; over Lebesgue `[0,1]` it is `L²[0,1]`.
   - `f↦√(dμ/dν)f` for `μ=2ν` is multiplication by `√2`, a unitary `L²(μ)→L²(ν)`; without the square root, the map is not isometric.
   - A field whose fibre dimension jumps (ℂ on `[0,½)`, ℂ² on `[½,1]`) has decomposable operators `L∞[0,½)⊕L∞([½,1],M₂)`.

## Verified sound

**Gate.** My run at 2f112b6: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.OA"`).

**Dependency check** (verbatim, exit 0):

```text
depcheck: 244 roadmaps, 2466 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The README's removed lines relative to main are prose rewrites only, so this pull request drops no V-id.

**Overlaps:** No other open pull request changes this roadmap. No cited id is dropped by an open pull request, and none is defined only by an open revision. No gaps are declared.

**Lean.**
- `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` exits 0 with exactly fourteen `declaration uses sorry` warnings (`:76`, `:87`, `:98`, `:107`, `:118`, `:130`, `:139`, `:154`, `:174`, `:203`, `:211`, `:218`, `:227`, `:241`).
- **`#check @name` comparison:** a scratch copy with `#check @name` for all 22 declarations elaborated. Every `H`-declaration carries `[NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`. `exists_faithful_nondegenerate_representation` and `exists_vonNeumannAlgebra_starAlgEquiv` produce `K : Type u` in the universe of the input. `tomiyama` keeps `[PartialOrder A] [StarOrderedRing A]`. No binder is lost, and each type matches its README statement.
- **The worker's signature scanner:** its 23rd entry (`are`, line 32) is a word of the docstring, not a declaration.
- **One-tactic probe:** with each `sorry` replaced by `first | rfl | infer_instance | simp | aesop`, all 14 sites error (`:80`, `:91`, `:101`, `:113`, `:121`, `:132`, `:142`, `:155`, `:177`, `:206`, `:213`, `:220`, `:233`, `:247`), so none is padding.

**Library objects opened** at the branch pin (Mathlib `6b7abb3c`):
- `WStarAlgebra.exists_predual` (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:45–50`, conjugate-linear `StrongDual ℂ X ≃ₗᵢ⋆[ℂ] M`, `X : Type u`) is the form `exists_predual` restates for a concrete `N`.
- `VonNeumannAlgebra` (`:67–70`) and `centralizer_centralizer` (`:118`).
- `ErgodicSMul` (`Mathlib/Dynamics/Ergodic/Action/Basic.lean:43–46`: `SMulInvariantMeasure` plus `EventuallyEmptyOrUniv`), with the regular-action instance in `Regular.lean`.
- `ErgodicSMul.trans_isMinimal` and `aeconst_of_dense_setOfPred_preimage_smul_ae` in `OfMinimal.lean` assume `IsFiniteMeasure μ`. They therefore give only the compact case of `ergodicSMul_dense_subgroup`, as `README.md:2197` says.
- `IsCyclic`/`IsSeparating` in `Mathlib/Analysis/InnerProductSpace/StandardSubspace.lean:181–184` are fields of a real standard subspace, a different object from the vector predicates here.
- Mathlib has no ultraweak topology or trace class at the pin.

At main's Tau Ceti pin `2fd255d9`:
- `TauCeti/Analysis/VonNeumannAlgebra/Density.lean:58`, `:128`, `:155`. This is the SOT-density half only, so `double_commutant_iff_isClosed_image_ofCLM` is not a one-step consequence.
- `Adjoin.lean:38`, `:49`, `:54`, `:59`, `:65`, `:74`.
- `TauCeti/Analysis/CStarAlgebra/GNS.lean:54`, `:62`, `:72`, `:86`, `:94`, `:99`, `:110`.
- `Representation/Nondegenerate.lean:62` (see R01).
- `Dynamics/Ergodic/Action/Map.lean`, which has no dense-subgroup theorem.

**Cross-roadmap citations resolved on main 3b3f7ef:**
- BanachSpaceTheory B1 `:54`, B2 `:135`, B4 `:239`.
- PolarDecomposition PD-A36, PD-A45, PD-B23, PD-B24, PD-B36.
- OperatorIdeals OI-B23, OI-B29–B32, OI-B41.
- AmenableGroups Layers 5–7 (`:289`, `:391`, `:415`); both anchors match their headings.
- OptimalTransport Layer 2 `:444` (analytic-set/completion bridge `:459`) and Layer 8 item 2 `:1004` (Jankov–von Neumann).
- RepresentationTheory/{CompactGroups, SemisimpleAlgebras, LieHighestWeight}.
- `Completed/ArithmeticDirichletSeries` Wiener–Ikehara at Layer 9 (`:105`).
- `Completed/GlobalNumberFields` Layer 4 (`:418`); the link is broken, see R05.

**Ownership:** Tomiyama, Arveson, the projection definition of injectivity, the spatial norm and injectivity ⟺ semidiscreteness are owned only here. CStarAlgebras (open, `README.md:40–52`, `:195–203`, `:1097`, `:1114`) consumes V13a/V13b by name. CStarClassification (`:907`) and OperatorAlgebraDynamics (`:567–570`) route tensor norms through CStarAlgebras. On main, Subfactors (`:270`) and FactorRigidity (`:87`) cite this roadmap as a supplier. The ownership index is that of 2026-11-08T08:49:53Z.

**Sources: the seeded sample 13.1 and 13.2**, read at the page markers of the cache (anantharaman-popa printed page = pdf page − 6):
- **Hiai, Theorem 6.5** (hiai-lectures line 2666, pp. 55–56): for a C*-algebra A and C*-subalgebra B, a norm-one projection satisfies (ii) bimodularity and (v) complete positivity of Theorem 6.4 (lines 2596, 2602). There is no unitality hypothesis, as the README says.
- **Peterson, Theorem 6.2.1** (peterson-notes line 3948, page marker 98): unital A and B, `E|B=id`, `‖E‖≤1` gives a conditional expectation. This is the "unital inclusion case", as stated.
- **Peterson, Theorem 6.3.8** (line 4146, p. 103): a hypertrace exists iff a possibly non-normal conditional expectation exists.
- **Anantharaman–Popa, Chapter 10:** Definition 10.2.1 and Proposition 10.2.2 (lines 7191, 7198, p. 161); Proposition 10.2.5 (7269, p. 163); Theorems 10.2.8–10.2.9 (7325, 7333, p. 164); Theorem 10.3.1 (7413, p. 166); Theorem 10.3.4 (7532, p. 168). All match `:3970–3977`.
- **Anantharaman–Popa, Chapters 11–12:**
  - §11.1 (7684) is the amenable-finite ⇒ AFD route of `:4045`.
  - §11.2 runs from p. 185 to p. 190 (8257–8413). Its Theorem 11.2.2 (8294, p. 186) gives amenable ⟺ AFD ⟺ increasing finite-dimensional `(∪Q_n)''=M` ⟺ `M≅R` for separable II₁ factors.
  - §12.5 runs pp. 208–212 (9190–9374).
- **Connes–Feldman–Weiss:**
  - Definitions 5–6 (lines 265, 281) and Proposition 7 (336): a norm-one projection restricted to `L∞(R,m)` is an invariant mean.
  - The converse is sketched at 347–375 for trivial cocycle, matching the README's "untwisted".
  - Lemma 8 (382), Lemma 9 (480) and Theorem 10 (520): hyperfinite iff amenable, with no ergodicity hypothesis.
- **Haagerup 2016:**
  - Theorems 1.1 and 1.2 (49, 52).
  - 2.4 is Connes–Størmer, used for `:4237–4240` (222).
  - 2.8 is Haagerup 1989, Theorem 2.3 (284).
  - 3.1, with the ucp map `T:M_m→N` and `‖σ^φ_t∘T−T∘σ^ψ_t‖≤δ|t|` as at `:4264–4266` (313).
  - 4.2, the Q-stable state (635), and 5.1 (868).
  - Lemmas 5.4–5.6 (1109, 1347, 1540).
- **Haagerup 1989:** §2 (line 152), Theorem 2.3 (183), and the ultraproduct contradiction argument (416), as at `:4285–4296`.
- **Connes 1975** (open on Numdam; fetched this round into a scratch manifest only), line 134: up to conjugacy, a unique automorphism of `R_(0,1)` has modulus λ≠1. This supports `:4191–4193`.

**Adversarial pass.** All rows were computed this round.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_faithful_nondegenerate_representation` | `A=0`; `A=ℂ²`; control `π(z)=diag(z,0)` on ℂ² | `A=0`: `K=0`, `π=0`, span `{0}=K`. `ℂ²`: `diag(a,b)` on ℂ², span ℂ². Control: injective, span `ℂ×0` not dense, excluded by the `Dense` clause | holds |
| `exists_injective_nondegenerate_representation_lp` | `A=ℂ`; `A=0` | `ℂ`: `π(z)=z·1` on `ℓ²`, span `ℓ²`. `A=0`: the only map is 0, span `{0}≠ℓ²`, so `[Nontrivial A]` is needed | holds |
| `double_commutant_iff_isClosed_image_ofCLM` | `A=ℂI`; `A`=finite rank + scalars on `ℓ²` | `ℂI''=ℂI`, WOT closed. Second: `A''=B(ℓ²)≠A`; `A` is WOT dense, so not closed; both sides false | holds |
| `closure_unitBall_eq_unitBall_double_centralizer` | `ℂI`; finite rank + scalars; `q` = even-coordinate projection | `{|c|≤1}·I` both sides. `P_nxP_n→x` SOT gives the unit ball of `B(ℓ²)`. `‖q−(c+F)‖≥max(|1−c|,|c|)≥1/2`, so the positive clause is SOT, not norm, density | holds |
| `closure_isStarProjection_eq_positive_contractions` | `H=ℂ`; `ℓ²` with `C=½` | `ℂ`: projections `{0,1}`, so `½` is excluded and the hypothesis is needed. `ℓ²`: block `[[½,½],[½,½]]` has eigenvalues 1, 0 and compression `½` | holds |
| `exists_predual` | `N=ℂ` on ℂ; `N=M_n`; `H=0` | `X=ℂ` with `z↦z̄`; `X=conj(S₁(ℂⁿ))`; `X=0` | holds |
| `exists_vonNeumannAlgebra_starAlgEquiv` | `M=ℂ²`; `M=0` | normal states `pr₁`, `pr₂` give `diag` on ℂ²; `K=0` | holds |
| `isCyclic_iff_isSeparating_commutant` | diagonal on ℂ²; `M₂`; `H=0` | `(1,1)` cyclic and separating, `(1,0)` neither (`diag(0,1)(1,0)=0`). `e₁` cyclic for `M₂`, separating for `ℂI`. `H=0`: 0 both | holds |
| `equivalent_of_subequivalent` | `B(ℓ²)`, `p=1`, `q=1−e₀e₀*` | `S*S=1`, `SS*=q`; `q≼1` via `v=q`; `p∼q` with `p≠q` | holds |
| `tracialState_unique` | `M₂`; `ℂ⊕ℂ`; `B(ℓ²)` | `x₁₁`: `e₁₂e₂₁↦1`, `e₂₁e₁₂↦0`, not tracial; `tr/2` unique. `ℂ⊕ℂ`: `t·pr₁+(1−t)pr₂`, all tracial, so the factor hypothesis is needed. `B(ℓ²)`: `τ(1)=2τ(1)`, none | holds |
| `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | `R`; `B(ℓ²)`; `ℂ⊕ℂ` | `R`: `⊗tr₂` is faithful, and `q_i=v_i*pv_i` since `pv_i=v_i`. `B(ℓ²)`: compacts form a proper ideal, excluded by `IsFinite`. `ℂ⊕ℂ`: ideal `ℂ⊕0`, excluded by `IsFactor` | holds |
| `IsFactor`, `IsFinite`, `IsTypeIIOne`, `ProjectionEquivalent` | `M₂`, diagonal, `0`, `B(ℓ²)`, `M_n`, `R`; `e₂₁` | `diag(1,0)` is central, so diagonal is not a factor; `0` fails `1≠0`; `SS*≠1`; rank-one projections are minimal in `M_n`. `e₂₁*e₂₁=e₁₁`, `e₂₁e₂₁*=e₂₂` | holds |
| `ergodicSMul_dense_subgroup` | `ℚ⊂ℝ`; `ℤ⊂ℝ`; `G=⋃γK` | ℚ ergodic. ℤ: `⋃[n,n+½)` is invariant, not null or conull, so density is needed. For `g∈G`, `g·int(K)⁻¹∋γ` gives `g∈γK`, so σ-compact and σ-finite | holds |
| `tomiyama` and the 13.1 Checks | diagonal `E` on `M₂`; `e₁₁·e₁₁`; transpose; `ρ=[[½,c],[c̄,½]]` | `axb=[[10,28],[45,84]]`, `E=diag(10,84)=aE(x)b`. `P(1)=e₁₁≠1` with `‖P‖=1`. Transpose sends `Σe_ij⊗e_ij` to the flip (eigenvalue −1) and `e₁₂↦e₂₁` (fixing fails). `det ρ=¼−|c|²≥0` iff `|c|≤½` | holds |
| V13b.SpatialNorm Checks | `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁`; `1⊗1`; slice `(0,ℂ,id)`; `C(X)` | `u*u` is rank 2 with `‖u‖=1` against sum `2`. `‖1⊗1‖=1` against HS `√2·√2=2`. `‖R_ψ‖=0` against `‖ψ‖=1`. `‖f⊗1−1⊗f‖=1` | holds |
| Hyperfinite Checks `:3917–3924` | `B(ℓ²)`, `L(ℤ)`, `ℓ∞` truncations | `A_n≅M_n⊕ℂ` WOT dense; `Σ4^(−n)=1/3`; `‖1−1_[1,N]‖=1` for every N | holds |
| Følner criterion and its Checks `:3964–4017` | `ℂ²`, `τ=(1/3,2/3)`, `u=(1,−1)`, `ε=1/10`; `L(F₂)` | `‖uP−Pu‖²=8p(1−p)≤1/100` gives `p≤0.0012516` or `≥0.9987484`. `P=1` gives `½`; every value is more than `1/10` from `1/3`. `T=diag(3^(−½),(⅔)^½)`: `Tr T²=1`, `Tr(xT²)=a/3+2b/3`. `e₁₁` gives `1≠1/3`. `F₂=W(a)⊔aW(a⁻¹)` gives total mass `2>1` | holds |
| "every infinite-dimensional factor subalgebra of R is R" `:4116` | `R⊗1⊂R⊗M₂≅R`; `M₂⊂R` | trace-preserving expectation gives injectivity, then Theorem 11.2.2. `M₂` is excluded by infinite dimension | holds |
| R02 probe (`IsInjective`, `IsHyperfinite`, uniqueness) | `H=0`, `B(ℓ²)`, `R`, `L(F₂)` | `P=0` with `‖P‖=0≤1`; `P=id`; `M_(2^n)`; `L(F₂)` has no hypertrace (Check `:4012`). 19 `sorry` warnings, exit 0 | statable |
| R03 probe (`HasTypeITwoSummand`, MGBW, Dye) | `M₂`, `M₃`, `ℂ`, `R`; Bloch map | `M₂` true; `M₃` false (`3=2·rank e`); `ℂ` false; `R` false. Images of `(1/√2,0,±1/√2)` have inner product `−3/5`, so not Jordan. Bloch `f=½+¼sgn n₃` is additive and nonlinear (`0.75` against `0.677` at `(1/√2,0,1/√2)`) | statable |
| Layers 7–12 Checks (R06 context and the rest) | as printed | `‖λ(f)‖=√5<3`. `h_ε` error `ε/3`, and `5/12` at ε=1. Affine group `c(α,β)=α`. `d′₂·covol′=(1/(8π))(2π/3)=1/12`. `h⁻¹=[[9/4,−3/4],[−3/4,9/4]]`, `β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]`. `F(t+i)=(1/3)2^(it)`. `R⊕ℂ` bounds `≥1/4`, `≥1/2`. `1≤14√2` | holds |
| Layer 4 cyclic/separating Checks `:1421–1427` | `M₂`; diagonal; `H=0` | `e₁₂e₁=0`; `(1,1)` and `(1,0)` as above; `0` cyclic and separating only on `H=0` | true, misplaced (R06) |
| GlobalNumberFields citation `:59` | relative path on main | `TauCetiRoadmap/GlobalNumberFields` absent; `Completed/GlobalNumberFields/README.md:418` "Layer 4: finite adeles" | broken link (R05) |

## Not verifiable

- **Arveson 1969, Theorem 1.2.3; Haagerup 1985 (§§2–5); Haagerup 1987 (§§1–2):** settled as uncertified, with no legal full text.
- **Connes–Størmer 1978:** settled as uncertified; its statement was checked through Haagerup 2016, Theorem 2.4.
- **Tomiyama 1957, Theorem 1:** the cached text recorded for `tomiyama-1957` is a Project Euclid bot-block page ("Request unsuccessful"), not the paper. The manifest's hash therefore certifies an error page, and the worker should re-fetch it.
- **Takesaki I IV.4.9 and Takesaki III XV.3, XVI.1.9, XVII.3.12, XIII.3.26/3.29/3.34, XVIII.2.1–2.7; Runde 6.4.14, 6.4.24–6.4.25; Connes–Woods 1985 §7:** paywalled books and journal, not in the manifest.
- **Connes, *Periodic automorphisms*, Theorems 5.1 and 6.2:** the author-page PDF, fetched into a scratch manifest, is an image-only scan, and OCR is not installed on this worker.
- **Ownership:** pull requests outside the index of 2026-11-08T08:49:53Z were not searched.

## Source issues

- **Gap** in hiai-lectures at Theorem 6.5, pp. 55–56: the source states Tomiyama's theorem for an arbitrary C*-algebra and C*-subalgebra but proves only a unital von Neumann subalgebra of a von Neumann algebra; it should add the bidual reduction for the general case; affects the proof.
- **Gap** in connes-feldman-weiss at the remark after Proposition 7, p. 14: the source only sketches the converse, that amenability makes the regular algebra injective, for trivial cocycle, leaving details to the reader; it should be a stated proposition with proof; affects the proof.
- **Misprint** in anantharaman-popa at Definition 10.2.1, p. 161: the source writes "a von Neumann M" without "algebra"; it should read "a von Neumann algebra M"; affects nothing.
