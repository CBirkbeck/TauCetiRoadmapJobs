# Review of UnboundedOperators (pull request #1027 at c4c2442)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`
**Verdict:** needs changes

Thirteen findings: two P1, two P2 and nine P3. The gate fails at this head on two rules, `statement-hygiene` (4 hits) and `dropped` (10 hits). The new surface-topology layer §2.3a is the source of both P1s, one P2 and two P3s. One of its headline theorems is false as written. §2.4 still consumes a roadmap that may not be cited. Radó's theorem is already planned by MordellLawrenceVenkatesh, which comes earlier in the merge order. Deleting §2.3a and pointing §2.4 at MordellLawrenceVenkatesh §§5.1, 5.3, 5.4 and 5.6 repairs R01–R03, R05 and R06 together. None of the previous review's three findings is repaired (R07, R08, R12).

## R01 (P1) — `IsCombinatorialManifold.boundary_realization` is false: its right-hand side is a set of `ι →₀ ℝ`

**Location.** `Suggested.lean:122–130`: `(𝓡∂ (n + 1)).boundary (Realization K) = {x | ∃ τ ∈ K.toPreAbstractSimplicialComplex, τ.card = n + 1 ∧ … ∧ (x : ι →₀ ℝ).support ⊆ τ}`.

**Claim.** The ascription `(x : ι →₀ ℝ)` gives the set-builder binder the type `ι →₀ ℝ`, so Lean coerces the left side. The elaborated statement is `Subtype.val '' ModelWithCorners.boundary K.Realization = {x : ι →₀ ℝ | …}`. Its right-hand side contains every finitely supported function whose support lies in a boundary face, including `0`. No such function with coordinate sum other than 1 is a point of the realization. So the theorem is false for every combinatorial manifold with nonempty boundary, including the README's own cone on a pentagon and Möbius band Checks. The README sentence at `README.md:294` is correct; only the Lean statement is wrong.

**Witness.** Take the 1-simplex on `{0,1}` with `n = 0` and `τ = {0}`, which lies in exactly one edge. Then `0 : ι →₀ ℝ` has support `∅ ⊆ τ` and coordinate sum 0. Tau Ceti's `Realization.sum_eq_one` (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean:386`) forces sum 1. The following compiles, without `sorry`, against the pins:

```lean
theorem boundary_realization_statement_false {ι : Type*} [DecidableEq ι]
    {K : AbstractSimplicialComplex ι} {n : ℕ}
    (h : IsCombinatorialManifold K.toPreAbstractSimplicialComplex (n + 1))
    {τ₀ : Finset ι} (hτ : τ₀ ∈ K.toPreAbstractSimplicialComplex) (hc : τ₀.card = n + 1)
    (h1 : {σ : Finset ι | σ ∈ K.toPreAbstractSimplicialComplex ∧ τ₀ ⊆ σ ∧ σ.card = n + 2}.ncard = 1) :
    ¬ (letI := h.realizationChartedSpace
      (𝓡∂ (n + 1)).boundary (Realization K) = {x | ∃ τ ∈ K.toPreAbstractSimplicialComplex,
        τ.card = n + 1 ∧ {σ : Finset ι | σ ∈ K.toPreAbstractSimplicialComplex ∧ τ ⊆ σ ∧
        σ.card = n + 2}.ncard = 1 ∧ (x : ι →₀ ℝ).support ⊆ τ}) := by
  intro heq
  have h0 : (0 : ι →₀ ℝ) ∈ {x : ι →₀ ℝ | ∃ τ ∈ K.toPreAbstractSimplicialComplex, τ.card = n + 1 ∧
      {σ : Finset ι | σ ∈ K.toPreAbstractSimplicialComplex ∧ τ ⊆ σ ∧ σ.card = n + 2}.ncard = 1 ∧
      x.support ⊆ τ} := ⟨τ₀, hτ, hc, h1, by simp⟩
  rw [← heq] at h0
  obtain ⟨y, -, hy⟩ := h0
  have hs := Realization.sum_eq_one K y
  rw [hy] at hs
  simp at hs
```

**Repair.** R03 deletes this declaration. If it is kept anywhere, type the binder as a realization point: `{x : Realization K | ∃ τ ∈ …, … ∧ (x : ι →₀ ℝ).support ⊆ τ}`. Tested: this elaborates as an equation in `Set (Realization K)`. On the 1-simplex its right-hand side is `{e₀, e₁}`, which is the boundary of `[0,1]`.

## R02 (P1) — §2.4's genus conclusion consumes SurfaceTopology, which may not be cited

**Location.** `README.md:81` ("SurfaceTopology Layers 3, 6 and 8 supply only the classification of compact surfaces used in §2.4"); `:314` ("Consume [SurfaceTopology Layers 3, 6 and 8] … Apply classification … to conclude genus four"); `:318` (*Needs:*); `:350` (Layer 2 Dependencies); `Suggested.lean:61`, `:219` (`section SurfaceTopology`).

**Claim.** SurfaceTopology is on this project's list of roadmaps that may never be cited as suppliers, and on the gate's dropped-names list. So §2.4's genus-four identification has no supplier this roadmap may use: the classification it needs is unowned. The head commit moved PlanarTopology's material into §2.3a but kept the SurfaceTopology dependency. The bridge sentence at `:314` also asserts, with no target, that §2.3a's invariants "agree with" SurfaceTopology's generalized-map invariants. An allowed owner exists. MordellLawrenceVenkatesh is a new roadmap in an open pull request at merge-order line 160; this roadmap is at line 397.

**Witness.** The gate at c4c2442 reports `dropped=10`: `:13`, `:81`, `:314` four times, `:318`, `:350`, and `Suggested.lean:61`, `:219`. At MordellLawrenceVenkatesh's head, §5.4 (`README.md:1748–1752`) classifies closed connected orientable surfaces by a unique genus. §5.6 gives `χ = 2 − 2g − b − n`, computed from singular homology.

**Repair.** Rewrite §2.4's classification paragraph as follows:
- The completed surface, with its translation-chart orientation, is a closed connected oriented surface in the sense of MordellLawrenceVenkatesh §5.1.
- `χ = −6` follows from the 8/16/2 CW structure and Tau Ceti's `finsum_finrank_singularHomology_of_finite_cwComplex`.
- The genus is `(2 − χ)/2 = 4` by MordellLawrenceVenkatesh §5.4 and §5.6.

Make the same change in the supplier contract (`:81`), the *Needs:* line (`:318`) and Layer 2's Dependencies (`:350`). Name the dependency in the pull-request description. Tested on the Nelson instance: `χ = 2 − 16 + 8 = −6` and `g = (2 + 6)/2 = 4`.

## R03 (P2) — §2.3a makes an unbounded-operator roadmap a second owner of Radó's theorem

**Location.** `README.md:13` ("The surface topology … is owned here, in §2.3a: chart-independence and homeomorphism invariance of the manifold boundary … Radó's triangulation theorem, and coherent orientations"); `:286–304`; `:47–49`; the Thomassen reference at `:1324–1327`; `Suggested.lean:6–10` (five surface imports), `:20–23`, `:59–219` (fifteen declarations).

**Claim.** §2.3a plans general surface topology:
- topological invariance of the half-space boundary;
- Radó's theorem with and without boundary;
- triangulated orientability and its topological invariance.

The only consumer anywhere in this roadmap is §2.4's example surface: `§2.3a` occurs only at `:13`, `:308`, `:310` and `:314`. Radó's theorem already has an earlier owner, MordellLawrenceVenkatesh §5.3. GeometricTopology's open revision also claims it (Layer 11.2.1). So an object two open roadmaps own is planned a third time, at merge-order position 397, where none of the topology roadmaps could consume it. Once R02 is repaired, §2.4 needs none of §2.3a:
- MordellLawrenceVenkatesh §5.1 takes the orientation as data, so coherent orientations are not needed.
- §5.4 consumes its own triangulation, so Radó is not needed here.
- The surface is closed through §2.4's own Euclidean atlas, so the boundary count is not needed.

The Thomassen entry also has no theorem locator.

**Witness.** MordellLawrenceVenkatesh at its head, `README.md:1742–1746` (§5.3) states that every compact connected surface is triangulable, without boundary and with boundary. GeometricTopology at the head of its open revision, `README.md:136–141`, owns "smoothing, Radó's theorem, the two-dimensional Hauptvermutung" (Layer 11.2.1).

**Repair.**
- Delete §2.3a, the sentence at `:13`, the From Tau Ceti sentence at `:47–49` and the Thomassen reference.
- Delete from `Suggested.lean` the fifteen declarations from `isInteriorPoint_iff_of_mem_atlas` to `IsOrientableSurface.congr`, the five `TauCeti.*` surface imports and the surface clause of the module docstring.
- In §2.4, give the boundaryless atlas directly and repoint the classification as in R02.

The docstring already names the geometric Nelson headline as not statable, so nothing replaces the deleted declarations.

## R04 (P2) — The Hilbert-dimension classification restates BanachSpaceTheory B5

**Location.** `README.md:444` ("Prove the Hilbert-cardinal comparison `nonempty_linearIsometryEquiv_iff_lift_mk_eq` … use countable coefficient supports in both directions"), with its API and Checks at `:448–458`; `Suggested.lean:223–232`; the module docstring at `:17`.

**Claim.** BanachSpaceTheory, a roadmap on main, owns Hilbert dimension and the unitary classification. Its Lean statement is the same theorem with the same name, over `[RCLike 𝕜]`, and it names this roadmap's §4.1 as its consumer. This roadmap never names BanachSpaceTheory, so §4.1 plans the theorem a second time. The pull-request description says §4.1 consumes B5; the README does not.

**Witness.** BanachSpaceTheory `README.md:42–45`: "B5 owns Hilbert dimension … the unbounded-operator roadmap (OperatorTheory/UnboundedOperators §4.1) … consume it". Its `Suggested.lean:165–168` states `nonempty_linearIsometryEquiv_iff_lift_mk_eq` for `HilbertBasis ι 𝕜 H`, `HilbertBasis κ 𝕜 K`. `grep -c BanachSpaceTheory` on this README returns 0.

**Repair.**
- Delete the theorem from `Suggested.lean` and from the docstring list.
- In §4.1, replace the proof sentences and the B5-owned API bullets and Checks with a citation of BanachSpaceTheory B5's basis-cardinality invariance and unitary classification.
- Add a `From TauCetiRoadmap.BanachSpaceTheory` contract naming both.
- Keep the deficiency-cardinal application and the (1,1)/(1,0) momentum Check.

Tested: at `𝕜 = ℂ`, B5's statement gives ℂ ≄ ℂ² (1 ≠ 2) and ℓ²(ℕ) ≃ ℓ²(ℤ) (ℵ₀ = ℵ₀), which are exactly the uses in §4.1.

## R05 (P3) — Gate `statement-hygiene`: four `letI` in theorem signatures

**Location.** `Suggested.lean:107` (`exists_halfSpace_chartedSpace_boundary_eq_empty`), `:125`, `:137`, `:195`.

**Claim.** Rule failure: a `letI` in a signature. The gate's repair is an instance binder or a named instance in the signature.

**Witness.** The gate at c4c2442 reports `statement-hygiene=4`, at these four lines.

**Repair.** R03 deletes all four. Any statement kept must take the charted space as a named argument used explicitly, never a `letI`.

## R06 (P3) — Four surface declarations are padding

**Location.** `Suggested.lean:95` `boundaryComponentCount_eq_zero`, `:151` `isTriangulable_of_compactSurface`, `:158` `finiteCWType_of_compactSurface`, `:215` `IsOrientableSurface.congr`.

**Claim.** The first treats a boundary case. The middle two are one-line corollaries of `exists_combinatorialManifold_homeomorph`. The last restates the definition of `IsOrientableSurface`.

**Witness.** In a scratch copy elaborated at the pins, each of these closes in one line:
- `rw [boundaryComponentCount, h, Nat.card_eq_zero]; exact Or.inl ⟨fun x => x.inductionOn fun a => a.2.elim⟩`
- `obtain ⟨ι, _, K, -, -, e⟩ := exists_combinatorialManifold_homeomorph M; exact ⟨ι, K, e⟩`
- `exact (isTriangulable_of_compactSurface M).finiteCWType`
- `exact ⟨fun ⟨ι, d, K, hK, ho, ⟨f⟩⟩ => ⟨ι, d, K, hK, ho, ⟨f.trans e⟩⟩, fun ⟨ι, d, K, hK, ho, ⟨f⟩⟩ => ⟨ι, d, K, hK, ho, ⟨f.trans e.symm⟩⟩⟩`

**Repair.** Delete them from `Suggested.lean`. This is subsumed by R03.

## R07 (P3) — `IsResolventPoint` is Tau Ceti's `LinearPMap.resolventSet`: the previous review's R01, not repaired

**Location.** `Suggested.lean:234–240` (`def IsResolventPoint … ∃ R : H →L[ℂ] H, (∀ y, (R y, z • R y - y) ∈ S.graph) ∧ ∀ x : S.domain, R (z • x - S x) = x`); `:36–38` ("not through a library resolvent set"); `README.md:462`.

**Claim.** At this Tau Ceti pin the predicate is exactly `z ∈ LinearPMap.resolventSet S`. The names are in the root `LinearPMap` namespace, not `TauCeti.LinearPMap` as the previous repair text said. So the file defines a second carrier for a pinned object, and the docstring's justification is false.

**Witness.** This compiles, without `sorry`, against `import TauCeti.Topology.Algebra.Module.LinearPMap.Resolvent.Basic` (`IsResolventAt` at `:65`, `resolventSet` at `:129`):

```lean
theorem isResolventPoint_iff_mem_resolventSet (S : H →ₗ.[ℂ] H) (z : ℂ) :
    IsResolventPoint S z ↔ z ∈ LinearPMap.resolventSet S
```

The proof unfolds `LinearPMap.mem_graph_iff` and uses `IsResolventAt.smul_sub_apply` and `apply_smul_sub`.

**Repair.**
- Add that import.
- Restate `resolventPoint_alternatives_of_isClosed_symmetric` with `z ∈ LinearPMap.resolventSet S` and `z ∉ …`.
- Delete `IsResolventPoint` and the docstring sentence.
- At `README.md:462`, name `LinearPMap.resolventSet` instead.

## R08 (P3) — Teschl Theorem 2.18 is cited for four alternatives it does not state: the previous review's R03, not repaired

**Location.** `README.md:462` ("either all of `ℂ`, the closed upper half-plane, the closed lower half-plane, or a subset of `ℝ` … (Teschl (2009), Theorem 2.18 and Lemma 2.20, p.77)"); `Suggested.lean:245` ("(Teschl, Theorem 2.18)"); References `:1358` ("Lemmas 6.18–6.19").

**Claim.** Theorem 2.18 gives only the self-adjointness criterion `σ(A) ⊆ ℝ`, with a semibounded variant, and Lemma 2.20 gives real eigenvalues. Neither states the half-plane alternative. Also, 6.19 is a Theorem.

**Witness.** `teschl line 3170–3172` (Theorem 2.18, printed p.77); `teschl line 3187` (Lemma 2.20). A search for "half plane" finds only `teschl line 4431`, which is about Herglotz functions. `teschl line 6321` reads "Theorem 6.19 (Weyl)".

**Repair.** Keep 2.18 and 2.20 for the criterion and the eigenvalue clause. Attribute the alternative to its proof here: half-plane constancy from §4.1, with Problem 2.28 (p.84) and Lemma 2.3 (p.63). Alternatively cite a source that states it, recorded uncertified if paywalled. Correct the Lean docstring the same way, and write "Lemma 6.18 and Theorem 6.19".

## R09 (P3) — §3.2's Fredholm characterization has no supporting locator

**Location.** `README.md:376` ("Define essential spectrum both as spectrum after deleting isolated eigenvalues … and as failure of Fredholmness of `A−λ` … (Teschl (2009), Lemma 6.17, p.145, Lemma 6.18 and Theorem 6.19, p.146)").

**Claim.** The cited Teschl results are the Weyl criterion, invariance under compact perturbations and Weyl's theorem. The definitions are (6.27)–(6.28) on p.145. Teschl nowhere discusses Fredholm operators, so the stated equivalence of the two definitions has no locator. The mathematics is correct: for self-adjoint `A`, `λ ∉ σ_ess(A)` iff `A − λ` is Fredholm. For example, 0 on ℓ² has an infinite-dimensional kernel and `σ_ess = {0}`.

**Witness.** A case-insensitive search for "Fredholm" in `teschl` returns nothing. The definitions are at `teschl line 6256–6263` (printed p.145); `line 6277`, `6313` and `6321` hold Lemma 6.17, Lemma 6.18 and Theorem 6.19.

**Repair.** Cite (6.27)–(6.28), p.145, for the two spectral definitions. Either cite a source that states the Fredholm equivalence, uncertified if paywalled, or state that it is proved here from (6.28) and the closed-range criterion.

## R10 (P3) — §5.5 states its perturbation theorems without any locator

**Location.** `README.md:788–810` (UO-E04a).

**Claim.** The section states, with no source:
- the holomorphic family of type (A);
- the Riesz-projection rank constancy;
- analytic simple eigenvalues with `λ′(0) = ⟨u₀, Bu₀⟩`;
- Rellich's finite-dimensional real-analytic eigenbranch theorem.

Its only page reference is Grundling p.91, the source question.

**Witness.** The section contains no author–theorem locator. Its Checks are correct: for `A = 2I`, `B = 3I`, `R_A(w)(1 − 3zR_A(w))⁻¹ = (w−2)⁻¹(w−2)/(w−2−3z)`. For `A = diag(0,1)`, `B = [[1,1],[1,0]]`, `u₀ = e₁`, `λ′(0) = 1 = ⟨e₁, Be₁⟩`.

**Repair.** Add locators: for example Kato, *Perturbation Theory for Linear Operators*, Chapter VII §§1–3 for holomorphic families of type (A) and Chapter II §6 for Rellich's theorem. These would be recorded uncertified, and the theorem numbers are to be checked against the edition cited.

## R11 (P3) — Supplier drift: a moved Tau Ceti file, a broken anchor, a renamed PDE label

**Location.** `README.md:39–41` (`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent.lean`); `:792` (`../../BanachAlgebras/README.md#a2-holomorphic-functional-calculus`); `:71` ("PDE Lane A.1 and A.3").

**Claim.** At the pin the resolvent file is `…/LinearPMap/Resolvent/Basic.lean`, and `Resolvent.lean` does not exist. BanachAlgebras on main now titles that section `## Layer 2: Holomorphic functional calculus`, and "A2" is a label for that layer (`README.md:181`), so the anchor is dead. PDE on main labels its targets A1–A7 (`README.md:196`) and never uses "Lane".

**Witness.** The directory `TauCeti/Topology/Algebra/Module/LinearPMap/` at the pin holds `GraphCore.lean`, `Intertwining.lean`, `Resolvent/` and `Restrict.lean`. BanachAlgebras `README.md:440`. PDE `README.md:677` (A1) and `:769` (A3).

**Repair.** Cite `TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean`, link `#layer-2-holomorphic-functional-calculus`, and write "PDE A1 and A3 (§§1.1, 1.3)".

## R12 (P3) — The family index still omits UnboundedOperators: the previous review's R02, not repaired

**Location.** `TauCetiRoadmap/OperatorTheory/README.md:32–64` (nine entries) and `:76–84` (nine rows), against `TauCetiRoadmap/OperatorTheory/Suggested.lean:19`, which lists `UnboundedOperators` as a child.

**Claim.** The index has no entry and no table row for this child.

**Witness.** `grep -c UnboundedOperators TauCetiRoadmap/OperatorTheory/README.md` returns 0 at c4c2442.

**Repair.** Add one list entry: the unbounded Borel calculus on SAST's `P_A`, normal and joint spectral theory, spectral types, deficiency and closed forms, analytic vectors, perturbations and tensor operators. Add the row `UnboundedOperators | SelfAdjointSpectralTheory, PolarDecomposition`.

## R13 (P3) — `L2` has no docstring

**Location.** `Suggested.lean:299` (`abbrev L2 : Type := Lp ℂ 2 (volume : Measure ℝ)`).

**Claim.** Every declaration needs a docstring stating its mathematics.

**Witness.** Line 298 is blank and line 297 closes a `/-! … -/` section comment, so no `/-- … -/` precedes the abbreviation.

**Repair.** Add `/-- Complex `L²(ℝ)` for Lebesgue measure. -/`.

## Verified sound

**Repair status of the previous review (r3 at e626430).**

| r3 finding | Status at c4c2442 | Evidence |
|---|---|---|
| R01 `IsResolventPoint` duplicates Tau Ceti | not repaired | R07; the `Suggested.lean:234–240` definition and the `:36–38` sentence are unchanged |
| R02 family index lacks the child | not repaired | R12; the index diff against main is still only the dependency-table header and footnote |
| R03 Teschl 2.18 locator; "Lemmas 6.18–6.19" | not repaired | R08; `README.md:462`, `Suggested.lean:245` and `:1358` are unchanged |

**Gate.** Rerun at c4c2442 gives `statement-hygiene=4` (R05), `dropped=10` (R02, R03), `outside-folder=2` (the family index files, which the brief names as the pull request's own: not a finding) and `depcheck=1 NOT IN ORDER: UnboundedOperators` against the configured order. That last is not a finding: the candidate order lists this roadmap at line 397. Every other rule is 0.

The dependency check with the candidate order and `--movable` prints `depcheck: 231 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every supplier is on main: SelfAdjointSpectralTheory, HilbertModules, VonNeumannAlgebras, PolarDecomposition, BanachAlgebras, PDE, GeneralizedCohomology, LieGroups, OperatorAlgebraDynamics and BanachSpaceTheory. The proposed MordellLawrenceVenkatesh supplier is at merge-order line 160.

**Elaboration.** A scratch copy of `Suggested.lean` with `#check @name` for all 34 declarations elaborates at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9) with exactly 24 `sorry` warnings, one per theorem, and no other diagnostic. I compared each elaborated type with its README statement:
- The multiplier theorem covers every measurable space and measure.
- Friedrichs and the closed-form theorem are over `[RCLike 𝕜]`, as §4.7 says.
- The alternatives, Friedrichs and both Nelson theorems carry `[CompleteSpace H]`, `Dense` and `IsFormalAdjoint`; the alternatives also carry `IsClosed`.
- The `def`s and `structure`s need no completeness.
- No binder is lost.
- The one type that differs from its README sentence is `boundary_realization` (R01).

The one-tactic probe tried `rfl`, `trivial`, `infer_instance`, `decide`, `simp`, `simp_all` and `aesop`, each guarded by `done`. It closed none of the 24 theorems. The targeted one-liners of R06 closed four.

**Adversarial table.** Spectra use the disjoint point/continuous/residual convention, and inner products are conjugate-linear in the first slot.

| Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|
| UO-A01 domain and norm (§1.1; `teschl line 3726–3745`, Thm 3.2 `3752`) | atoms 0,1, x=(1,2), f=(2,i); counting ℕ₊, f(n)=n, xₙ=1/n; H=0 | f[P]x=(2,2i), ‖·‖²=8=4·1+1·4; Σxₙ²=π²/6 but Σn²xₙ²=∞; 0=0 | consistent; locator exact (domain (3.25), cutoffs (3.26), limit (3.27), density p.91; normality and adjoint p.92) |
| UO-A04 pushforward and recovery (§1.4; (3.67) and Lemmas 3.11–3.12 `teschl line 4194–4207`, Thm 3.18 `4376`) | A=diag(−1,1), f=t², f=t³ | P_{f(A)}({1})=P_A({±1})=I; for f=t², g∘f is constant, so P_A({g∘f≠id})≠0 for every g; f=t³, g=∛ gives ∅ | both directions discriminate; locator supports |
| UO-A05 spectral family (§1.5; `teschl line 3633–3644`) | A=aI, a<b; diag(0,1); H=0 | E(a)=E(b)=I: P((a,b])=0, P([a,b])=I; E(1)−E(0)=diag(0,1); all 0 | matches (3.14)(i)–(iv) and the unique-PVM sentence |
| `existsUnique_maximal_multiplier` (§1.7; Lemmas 3.3–3.4 `teschl line 3788–3836`) | μ=0; one point, f=i; counting ℕ₊, f(n)=n; counting measure on ℝ, f(t)=t | L²={0}, T unique; domain ℂ, Tx=ix, adjoint −i≠i so realness is needed; (1/n) excluded (Σ1=∞), (1/n²) included (π²/6); 1_{|f|≤n}(fy−z)⊥L² gives fy=z a.e. with no σ-finiteness | true at every instance; locators fit the cyclic comparison |
| UO-B01 normal API (§2.1; normality `teschl line 3746–3749`, Problem 3.11 `4090`) | N=diag(1,i); [[0,1],[0,0]]; N=iM_n | N*N=NN*=I, Re N=diag(1,0); N*N=diag(0,1)≠diag(1,0)=NN*; algebraic Re is 0 on D(M_n), spectral Re is 0 on H, xₙ=1/n separates | keep |
| UO-B03 strong commutation (§2.3; Lemma 4.5 `4926`, Lemma 4.9 `4967`, (4.24)–(4.26), Problem 4.2 `4985`) | Pauli X,Z; t=s=π/2 | XZ=−ZX; e^{iπX/2}e^{iπZ/2}=−XZ≠−ZX=e^{iπZ/2}e^{iπX/2} | equivalences as cited |
| Nelson surface (§2.3–§2.4) | 8 unit squares, 16 integer points | 24 unit edges, 16 on the boundary paired to 8, so E=16; V=2, F=8; χ=−6, g=4; angle 16π−4·π/2=14π; 16−4=12 removed points | arithmetic consistent (R02 changes only the supplier) |
| UO-B05 sign (§2.6; Thm 5.2 `teschl line 5232–5233`) | A=aI | README U(t)=e^{ita}; Teschl's U=exp(−itA′) gives A′=−a | "opposite sign convention" correct |
| UO-C02 essential spectrum (§3.2; `teschl line 6256–6324`) | diag(0,1); 0 on ℓ²; diag(1/n) | ∅; {0} with infinite rank; {0}, not an eigenvalue | Checks true; Fredholm half has no locator (R09) |
| UO-C03 spectral types (§3.3; Lemmas 3.14–3.15 `4302`, `4326`, Thm 3.17 `4370`, Lemma 3.19 `4391`) | diag(0,1), vector (1,1); rational diagonal | union of axes omits (1,1), span has it; H_pp=H, σ_c=ℝ∖ℚ | Lemma 3.19 gives the reducing split; keep |
| UO-C04 staircase (§3.4; Lemma 6.34 `6637`, Thm 6.31 `6602`) | ‖Bₙ‖≤1/(n+1); source grid ε=1/10, t=1 | (6.50) holds with aₙ=1/(n+1), bₙ=0, D(Aₙ)=D(A); s(1)=0, error 1>ε | hypotheses met; keep |
| `resolventPoint_alternatives_of_isClosed_symmetric` (§4.2) | S=2I on ℂ; −i∂ on H₀¹(0,∞); −i∂ on H₀¹(0,1); H=0 | z=i: (i−2)R y=y, 4th alternative, self-adjoint; ker(S*−z̄)=span e^{iz̄x}, |·|=e^{(Im z)x}∈L² iff Im z<0, so ρ is the open upper half-plane, 3rd alternative, not self-adjoint; defects (1,1), ρ=∅, 1st; R=0, 4th | true; locator R08; predicate R07 |
| `IsResolventPoint` versus `resolventSet` | S=2I, z=i and z=2 | R=(i−2)⁻¹ satisfies both; neither holds at z=2; iff proved in Lean | R07 |
| `nonempty_linearIsometryEquiv_iff_lift_mk_eq` (§4.1) | ℂ vs ℂ²; ℓ²(ℕ) vs ℓ²(ℤ); zero spaces | 1≠2, none; ℵ₀=ℵ₀; 0=0 | true; owned by B5 (R04) |
| UO-D02 extensions (§4.3; Thms 2.25–2.26 `teschl line 3334–3372`) | defects (2,1), rank-one U; (1,0) | new defects (1,0); 2=1+1, 1=1+0; no nonzero pairing | the Cayley bijection supports the partial-isometry form; keep |
| `friedrichs_exists_selfAdjoint_extension` (`teschl line 2914`) | −d² on C_c^∞(0,1), γ=π²; S=2I, γ=2 | Dirichlet: ‖u′‖²≥π²‖u‖²; Neumann: u=1 gives 0<π², fails the bound; T=S | "same lower bound" discriminates; true |
| `existsUnique_selfAdjoint_of_closed_form` | V=H=ℂ, j=id, q=2ūv; j=2·id, q=ūv; V=H=0 | h̄=2ū gives A=2I; ūv=2h̄v gives h=x/4; graph {(0,0)} | convention matches the graph clause |
| UO-E04a (§5.5) | A=2I, B=3I; diag(t,−t); A=diag(0,1), B=[[1,1],[1,0]] | 1/(w−2−3z), ∂_z=3/(w−2−3z)²=RBR; branches ±t, ordered −|t|,|t| not analytic; λ′(0)=1=⟨e₁,Be₁⟩ | Checks true; no locator (R10) |
| `integralOperator_counterexample` (`jones line 2883–2887`, `2902–2903`) | fₙ=n⁻¹1_[0,n], n=1,4; y≠0 | ‖f₁‖=1, ‖f₄‖=1/2, both integrals 1; (0,1)∈closure, so closure is ⊤; ȳ∫f unbounded on fₙ, so the adjoint domain is ⊥ | true; locators exact |
| `nelson_essential_selfAdjoint` | k=1, S=2I, x=1; −i∂ on C_c^∞(0,1); S=iI | 2ⁿ≤1·2ⁿ·n!; defects (1,1) but compact support kills analyticity, so the hypothesis fails; iI excluded by `hsym` | true |
| `nelson_resolvent_commute` | Pauli X,Z; 2I, 3I, z=w=i | `hcomm` fails; (i−2)⁻¹ and (i−3)⁻¹ commute and satisfy the graph clause | true |
| UO-F01 (§6.1; Thm 4.14 `teschl line 5134–5158`) | 2I, 3I; zero factor; I⊗M_n | 6I, 5I; space 0; Σn²n⁻²=∞ but Σn²n⁻⁴=π²/6 | keep |
| UO-F03 (§6.3; (4.42)–(4.44)) | spectra ℕ₊ and {−n+1/n}; ℕ₊ and {0}∪{1/n} | raw sum contains 1/n but not 0; raw product is ℚ_≥0, closure [0,∞) | closure needed; keep |
| `boundary_realization` (§2.3a) | 1-simplex {0,1}, n=0 | boundary {e₀,e₁}; RHS contains 0 (sum 0≠1); repaired binder gives {e₀,e₁} | false (R01) |
| Radó `exists_combinatorialManifold_homeomorph` | S²; closed disc; ∅ | tetrahedron 4−6+4=2; triangle 3−3+1=1; void complex | true; duplicate (R03) |
| `boundaryComponentCount` | disc; annulus; ℕ×EuclideanHalfSpace 2 | 1; 2; ℵ₀ components give `Nat.card`=0, the same as a closed surface | junk value undocumented; moot under R03 |
| closed-link hypothesis `∀ v, IsCombinatorialSphere (link K {v}) n` | tetrahedron boundary on ι=Fin 5 | link K {4}=⊥, refused by `IsCombinatorialSphere.ne_bot` | silently requires ι to be the vertex set; moot under R03 |
| §2.3a Checks | Möbius {i,i+1,i+2} mod 5; RP²₆; cone on pentagon; tetrahedron, octahedron | 5−10+5=0, one-triangle edges {i,i+2} give the cycle 0,2,4,1,3; 6−15+10=1; 6−10+5=1; 2, 2 | true; moot under R03 |

**Library declarations opened at the pins.**

Mathlib:
- `LinearPMap.mem_graph_iff` (`Mathlib/LinearAlgebra/LinearPMap.lean:798`)
- `ChartedSpace.secondCountable_of_sigmaCompact` (elaborated)

Tau Ceti:
- `LinearPMap.IsResolventAt`, `resolventSet`, `resolvent` (`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:65,129,169`)
- `analyticAt_resolvent` (`TauCeti/Analysis/Normed/Operator/Resolvent/Analytic.lean:58`)
- `riemannianVolume`, `eq_riemannianVolume_iff` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82,93`)
- `finsum_finrank_singularHomology_of_finite_cwComplex` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:159`)
- `IsCombinatorialManifold`, `IsCombinatorialSphere`, `IsCombinatorialSphere.ne_bot` (`TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/Basic.lean:214,87`); the manifold condition quantifies over vertices `{v} ∈ K`
- `link` (`TauCeti/AlgebraicTopology/SimplicialComplex/LinkStar.lean:84`)
- `realizationChartedSpace` (`…/CombinatorialManifold/ChartedSpace.lean:83`)
- `sphereLinkChartedSpace` (`…/CombinatorialManifold/Chart.lean:122`; its hypothesis is `∀ v`)
- `Realization`, `Realization.sum_eq_one` (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean:71,386`)
- `HomologicalOrientation` (`TauCeti/AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean:75`; integral local homology, so RP² is correctly non-orientable)
- `IsTriangulable` (`TauCeti/Topology/Triangulable/Basic.lean:38`)
- `IsTriangulable.finiteCWType` (`TauCeti/Topology/Triangulable/FiniteCWType.lean:41`, needs `CompactSpace`)
- `eulerChar`, `Homeomorph.eulerChar_eq` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123,163`)
- `eulerChar_eq_finsum_of_homeomorph` (`…/Realization/CWComplex/EulerCharacteristic.lean:156`)
- `coe_apply_mem_interior_iff` (`TauCeti/AlgebraicTopology/Singular/InvarianceOfDomain.lean:248`)
- `boundary_closedBall` (`TauCeti/Geometry/Manifold/Instances/ClosedBall/Basic.lean:314`)
- `isInteriorPoint_euclideanHalfSpace_iff_of_mem_maximalAtlas` (`TauCeti/Geometry/Manifold/Boundary/Charts.lean:88`)

Neither library has a projection-valued-measure carrier or an unbounded spectral integral. SelfAdjointSpectralTheory's own `ProjValMeasure` is a roadmap definition that `Suggested.lean` may not import, so the docstring's list of unstatable headlines stands.

**Cross-roadmap citations resolved.**
- On main, SelfAdjointSpectralTheory has every SA id the README cites: A21, B39, B49, B85, C39, C55, D17, D18, D20, E01, E05, E08, E26, E29, E43.
- On main, PolarDecomposition has PD-B23, B29, B32 and B34.
- HilbertModules H6 (now on main, `README.md:705`; deficiency decomposition and unitary existence criterion at `:752–759`).
- VonNeumannAlgebras V2.RectangularL2 (`:634`), V10.ClosedOperators (`:2249`) and V10.Affiliation (`:2305–2325`).
- BanachAlgebras Layer 2, labelled A2 (`:181`, `:440`; anchor R11).
- GeneralizedCohomology G5.5-RealHilbert (`:1939`), OperatorAlgebraDynamics D8 (`:693`) and PDE A1/A3 (`:677`, `:769`).
- BanachSpaceTheory B5 (`:42–45`, `:855–878`; `Suggested.lean:159–174`).
- MordellLawrenceVenkatesh at its head (§5.1 `:1711`, §5.3 `:1742`, §5.4 `:1748`, §5.6) and GeometricTopology at the head of its open revision (`:136–141`).
- The five `roadmaps resolve` leads: `applyWord` is declared at `Suggested.lean:343`; the two `IsCombinatorialManifold.*` names are this file's own (R01, R03); the two SurfaceTopology names are a dropped supplier's (R02).
- The overlap listing reports no dropped or revision-only ids, and I confirmed this. QuantumFoundations, NoncompactQuantumSymmetry, VariationalMethods and RelativisticQuantumFieldTheory only consume UO targets; none owns one. VariationalMethods names a UO declaration `closedFormOperator` that this folder does not declare, which is a drift on that roadmap's side.

**Sources read at their locators.**
- `teschl`: the author's online edition of 12 February 2009, through the sources service; printed page = PDF page − 12. All Teschl locators of the seeded sample were found at the stated printed pages, as listed in the table. Two seeded rows fail: §3.2 (R09) and §4.2 (R08).
- `jones`: the 2015 Vanderbilt institutional copy. Exercise 12.1.11(ii) is on p.86 and Exercise 12.1.15 on p.87.

Seeded targets: 15 sampled. 12 are supported as written (§§1.1, 1.4, 1.5, 1.7, 2.1, 2.3, 2.6, 3.3, 3.4, 4.3, 6.1, 6.3). Two have locator findings (§3.2 R09, §4.2 R08), and §5.5 has no locator (R10).

## Not verifiable

- **Grundling lecture packet** (225 pp., SHA-256 in the README). It is not in the sources cache, not an operator-held file, and has no legal public copy. Every "Grundling p. …" comparison was tested mathematically, not against the text.
- **Nelson, *Analytic Vectors*, Annals 70 (1959)**, §10 and Lemmas 5.1 and 10.1. The DOI resolves only to JSTOR, which is paywalled. The surface arithmetic was checked independently.
- **Weidmann, LNM 1258 (1987)**: Springer, paywalled, cited by locator.
- **Thomassen, Amer. Math. Monthly 99 (1992)**: not read. It carries no theorem locator and goes with R03.
- **Kato and Reed–Simon** (suggested in R08 and R10): paywalled and not read. The suggested chapter locators are for the author to check.
- **Ownership against open pull requests** was checked through the `roadmaps grep` index of 463 heads and the sibling checkouts the brief provides.

## Source issues

- **Misprint** in jones at Definition 12.1.13, printed p.87 (`jones line 2896–2900`): the source names η as the vector in the adjoint domain and σ as its representing vector, then defines the adjoint at ξ with value η; it should send η to σ; affects nothing (Proposition 12.1.16 uses the correct graph).
