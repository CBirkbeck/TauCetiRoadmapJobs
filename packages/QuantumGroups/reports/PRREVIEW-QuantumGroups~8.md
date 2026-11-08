# Review of QuantumGroups (pull request #1649 at cc02cfc)

**Verdict:** needs changes

:robot: Independent AI review of the whole folder at `cc02cfc6760f06c11da9a6b5045fb840691bfbc7` (a full review: 303 lines changed since `968db79`, the head the previous review read). No file of the pull request was changed. Two findings block (the failing dependency check and a Layer 0 that restates two roadmaps now on main); five are P3, four of them carried from the previous review unrepaired. `Suggested.lean` is unchanged since `968db79` apart from its module docstring; it elaborates with exactly the 11 `sorry` warnings.

**Status of the previous review's findings (968db79 → cc02cfc).**

| Previous | Status at cc02cfc |
| --- | --- |
| R01 (P3) Malacarne "Lemmas 3.1–3.2" | Not repaired: `README.md:1174` and `:1724` still read "Lemmas 1.2,2.1,3.1–3.2"; the text has no Lemma 3.2 (`malacarne` lines 235, 285). Carried as R04. |
| R02 (P3) Hiai §§1.2–1.3 cited for the finite-dimensional decomposition and the continuity facts | Not repaired: `README.md:181` ("Hiai §1.2, pp.3–4") and `:194` ("Hiai §§1.2–1.3, pp.3–5") are unchanged. Moot if R02 below is taken (the passages are deleted); otherwise still open. |
| R03 (P3) §0.5 states the weight-level correspondence although only the state case is used | Not repaired: `README.md:388`–`:400` is unchanged. Moot under R02 below (the section is VonNeumannAlgebras Layer 11 on main). |
| R04 (P3) §1.1 has no literature locator | Not repaired: `README.md:486` names only CStarAlgebras and Mathlib. Carried as R05. |
| R05 (P3) "requires author coordination" | Not repaired: `README.md:1759`. Carried as R06. |
| R06 (P3, note) unused `hq` in `quantumSL2Comul_exists` | Unchanged (`Suggested.lean:182`); a note, not a finding. |

The change since `968db79` is the reverse of the previous head's Layer 0 move: §0.3 and §0.4 now cite CategoricalOperatorAlgebras CA1a/CA2a and TemperleyLiebOperatorAlgebras 1.3/2.1/Layer 3 instead of restating them (`README.md:80`, `:83`, `:127`–`:157`, `:279`–`:371`), and the module docstring names those roadmaps. Both citations resolve at the open heads (CategoricalOperatorAlgebras at `7a2845fd`: CA1a `README.md:184`, CA2a `:350`, automatic isometry of faithful dagger functors `:200`–`:201`, signed self-dualities `:381`; TemperleyLiebOperatorAlgebras at `7cf3fee`: 1.3 `:480`, 1.4 `:532`, 2.1 `:1155` with `markovTrace_neg_one_pow_nonneg_iff` `:1178`, Layer 3 `:1272`–`:1431`, and its Downstream consumers paragraph `:1777`–`:1787` describing exactly the consumption §0.4 and §7.2 make). The two roadmaps' Scope sections name QuantumGroups as the consumer (`CategoricalOperatorAlgebras/README.md:39`–`:43`, `:1956`; `TemperleyLiebOperatorAlgebras/README.md:137`). The problem is the merge order, R01.

## R01 (P2) — The dependency check fails: upward edges to CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:80`, `:81`, `:83`, `:312`, `:371`, `:424`, `:598`, `:657`, `:1334`, `:1342` (supplier rows, `*Needs:*` lines and layer Dependencies naming CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras).

**Claim:** every supplier the README names comes before this roadmap in the merge order (the gate's rule).

**Witness:** the required command, unmodified output:

```text
UPWARD: QuantumGroups (on main) -> CategoricalOperatorAlgebras (#226) at README lines [80, 312, 371, 424, 598, 657]
UPWARD: QuantumGroups (on main) -> TemperleyLiebOperatorAlgebras (#242) at README lines [81, 83, 371, 424, 1334, 1342]
depcheck: 237 roadmaps, 2343 edges, 2 problem(s)
```

QuantumGroups is on main and absent from the merge order, so the check places it at position 0; `--movable` prints no `moved:` line for a roadmap on main. The worker's gate therefore reads `depcheck=2 … FAIL`, and the brief admits no acceptance while it fails.

Two facts a human should weigh before choosing the repair. First, the same two edges exist on main today: the same command on main's `TauCetiRoadmap/QuantumGroups/README.md` prints the same two UPWARD lines at its lines 42–43 (the supplier rows for CA1a/CA2a and A1–A6), so this revision does not create the problem, it keeps it. Second, the TemperleyLiebOperatorAlgebras review settled the ownership of the positive Temperley–Lieb completion on the strength of that main row (QuantumGroups consumes, TemperleyLiebOperatorAlgebras supplies), and the previous review of this folder recorded the opposite repair (notions moved down into Layer 0 at `968db79`). The two states cannot both be right, and the choice is the board's, not the author's.

**Repair:** either of the following; the first is the one every other party already assumes.

1. Board side: insert `QuantumGroups` into the merge order right after `TemperleyLiebOperatorAlgebras` (its last supplier; CStarAlgebras, HilbertModules and VonNeumannAlgebras are on main). The check then reports 0 problems for this head without any edit, and the citations stay as written.
2. Author side, if the board keeps QuantumGroups at position 0: restore the `968db79` form of §0.3 and §0.4 (the conjugate-solution and Temperley–Lieb comparison facts stated here on this roadmap's own objects, with CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras named only in Scope as the later owners, on lines that contain no "supplies/supplier" wording), delete the two supplier rows (`:80`, `:83`) and the two contract paragraphs (`:127`–`:157`), and remove the names from the `*Needs:*` lines and Dependencies sentences listed above. Re-run the command; it must print 0 problems.

## R02 (P2) — Layer 0 restates VonNeumannAlgebras and HilbertModules, both on main and both cited by main's QuantumGroups

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:21`–`:24` ("Layer 0 owns the Hilbert-module operator and tensor interfaces, the operator-closure and full-left-Hilbert-algebra interfaces"), `:104`–`:106` ("§0.1 proves the operator closure comparison on this carrier"), §0.1 `:172`–`:218`, §0.2 `:220`–`:277`, §0.5 `:373`–`:414`; `TauCetiRoadmap/QuantumGroups/Suggested.lean:58` (`weakClosure_eq_bicommutant`).

**Claim:** what another roadmap plans is imported by name and section, never planned again; an object has one owner.

**Witness:** VonNeumannAlgebras and HilbertModules are on main (content checkout `b3d628f`, merge order lines 5 and 8). Main's own `TauCetiRoadmap/QuantumGroups/README.md:40`–`:41` cites "VonNeumannAlgebras V0–V4 … V10–V11" and "HilbertModules H1–H3" for exactly this material; this head deletes those rows and restates the content:

- §0.1 (bicommutant, Kaplansky, finite-dimensional decomposition, trace-class predual, normal functionals, state-space compactness, GNS): VonNeumannAlgebras Layer 0 `README.md:275`–`:319` (state space, `PositiveLinearMap.GNS`), Layer 1 `:392`–`:500` (operator topologies, bicommutant, Kaplansky, joint SOT continuity on bounded sets), Layer 3 `:905`–`:915` (type I and finite-dimensional algebras, multiplicity), Layer 4 `:970`–`:1022` (trace-class predual as the quotient by the annihilator, normality).
- §0.2 (completions, direct sums, `H⊗A`, adjointable and compact module operators, `K_A(H⊗A)≅K(H)⊗min A`, `L_A(H⊗A)≅M(K(H)⊗min A)`, interior tensor products with associators and unitors): HilbertModules H1 `README.md:126`–`:178` (completion, standard module, `H⊗A`, the `a_n=p_n/√(n+1)` example that §0.2's third Check repeats), H2 `:179`–`:215` (the same isomorphisms for arbitrary nonseparable H, strict topology on bounded sets, `H=0` included), H3 `:262`–`:285` (interior tensor product, positivity by the Gram lemma, associators, both unitors with the nondegeneracy caveat §0.2 also states).
- §0.5 (left Hilbert algebras, full closure, `L(D″)=L(D)`, Tomita polar decomposition, canonical weight, KMS uniqueness): VonNeumannAlgebras Layer 10 `:2247` (V10.ModularTheory `:2364`, V10.KMS `:2459`) and Layer 11 `:2785`–`:2801` ("the associated full left Hilbert algebra … commutant Hilbert algebra and the dense Tomita algebra … full closure 𝔄″ … `R_l(𝔄″)=R_l(𝔄)` … Tomita's theorem").
- `weakClosure_eq_bicommutant` is the bicommutant theorem on the same carriers (`StarSubalgebra ℂ (H →L[ℂ] H)`, `ContinuousLinearMapWOT.ofCLM`) as VonNeumannAlgebras' `double_commutant_iff_isClosed_image_ofCLM` (`VonNeumannAlgebras/Suggested.lean:82`) and Kaplansky `closure_unitBall_eq_unitBall_double_centralizer` (`:91`): two `Suggested.lean` files stating one theorem.

The other open revision of this folder, #1705, already cites these suppliers at its head `c5e5bfa` (its `README.md:87`–`:88`, `:167`–`:176`).

**Repair:** delete §§0.1, 0.2 and 0.5, the Scope sentence at `:21`–`:24` (keep "the fiber-functor facts of §0.3 and the Temperley–Lieb comparison of §0.4"), the sentence at `:105`–`:106`, and `weakClosure_eq_bicommutant` with its "Layer 0" section comment and docstring line in `Suggested.lean`. Add two supplier rows, as main has them: VonNeumannAlgebras Layer 0 (state space, GNS), Layer 1 (bicommutant, Kaplansky, operator topologies), Layer 3 (finite-dimensional algebras), V4.Core/V4.PositivePredual/V4.Normality (predual, normal functionals, vector states), V10.ModularTheory and V10.KMS (modular group and KMS uniqueness for a faithful normal state), Layer 11 (full left Hilbert algebras and the canonical weight); HilbertModules H1–H3. Repoint every `*Needs:*` line that names §0.1, §0.2 or §0.5 (`:277`, `:414`, `:547`, `:598`, `:626`, `:649`, `:842`, `:947`, `:1174`, `:1218`) to the supplier section, and in §3.4 (`:819`–`:827`) replace "§0.5's Tomita theorem … KMS uniqueness" by Layer 11 and V10.KMS. Renumber §0.3 and §0.4 or keep their numbers; if kept, record "0.1, 0.2, 0.5 → VonNeumannAlgebras/HilbertModules" in Scope so citing roadmaps can follow. Then the previous review's R02 and R03 need no separate repair.

## R03 (P3) — §1.1 cites CStarAlgebras C5 for `A⊗min A≅C₀(G×G)`, which C5 states only for compact spaces

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:435`–`:437` ("Use CStarAlgebras C5's isometric tensor identification `A⊗min A≅C₀(G×G)`"), `:472`, `:486`.

**Claim:** CStarAlgebras C5 supplies `C₀(G)⊗min C₀(G)≅C₀(G×G)` for a locally compact group G.

**Witness:** CStarAlgebras on main, C5.2 `README.md:1150`–`:1152`: `C₀(X)⊗min A≅C₀(X,A)` for locally compact Hausdorff X, and `C(X)⊗min C(Y)≅C(X×Y)` for compact X, Y by Stone–Weierstrass. The identification `C₀(G,C₀(G))≅C₀(G×G)` for noncompact G is not among its statements. The sibling revision #1705 proves that step in its own §1.1 for this reason.

**Repair:** cite C5.2 for `C₀(G)⊗min C₀(G)≅C₀(G,C₀(G))` and state in §1.1 the identification `C₀(G,C₀(G))≅C₀(G×G)`, `F↦(g↦F(g,·))`, as a target of this section (the map is an isometric star isomorphism: a function vanishing at infinity on G×G gives a `C₀(G)`-valued function vanishing at infinity in sup norm, and conversely; the compact case is C5.2's).

## R04 (P3) — Locators: Malacarne has no Lemma 3.2; Longo–Roberts §3 begins on p.10

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:1174` and `:1724` ("Lemmas 1.2,2.1,3.1–3.2"); `:1700` ("§3, pp.9–18").

**Claim:** the cited statements exist at the cited places.

**Witness:** `malacarne` has Lemma 1.2 (line 127), Lemma 2.1 (183), Lemma 3.1 (235), then Theorem 4.1 (285); no 3.2. `longoroberts` line 363 is the page-10 marker and line 365 the heading "3. Dimension and Trace".

**Repair:** write "Lemmas 1.2, 2.1 and 3.1 and the proof of Theorem 4.1, preprint pp.2–6" in both places (the filtered-union step is the three-case paragraph at `malacarne` lines 292–312), and "§3, pp.10–18" at `:1700`. Re-raised from the previous review's R01, with the reason unchanged.

## R05 (P3) — §1.1 has no literature locator

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:486` (`*Needs:* CStarAlgebras C1.CommutativeMultiplierMorphisms, C5; Mathlib continuous group operations.`).

**Claim:** every theorem carries a locator.

**Witness:** §1.1 proves coassociativity, both counit identities, properness of inversion and the two inverse diagrams for an arbitrary locally compact group with no source, while every comparable target of the README cites one. The computed rows for §1.1 below confirm the mathematics; the finding is the missing locator. Re-raised from the previous review's R04.

**Repair:** one textbook locator for the `C₀(G)` example (Timmermann Chapter 4, by locator, recorded `uncertified` since the text is paywalled, or any standard text the author prefers), plus the sentence that the multiplier diagrams are the evaluation computations the section displays.

## R06 (P3) — Process narrative in the references

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:1759`–`:1760` ("Integration of that external code requires author coordination; the definitions and theorem specifications here do not assume such integration.").

**Claim:** the README is timeless.

**Witness:** the sentence describes a future process; the preceding sentences already say what Q8 proves and what the external construction proves. Re-raised from the previous review's R05.

**Repair:** delete the sentence.

## R07 (P3) — Two open revisions of this folder with no stated order

**Location:** the pull request description (`scratch/pull-request.md`, data) and `TauCetiRoadmap/QuantumGroups/README.md` as a whole.

**Claim:** when two open pull requests change one roadmap and their heads conflict, one is rebased on the other before either merges, and the description says which.

**Witness:** the overlap listing: "#1705 QuantumGroups: construct the ribbon category RepUqg: #1649 and #1705 conflict in `TauCetiRoadmap/QuantumGroups/README.md`, `TauCetiRoadmap/QuantumGroups/Suggested.lean`". The two heads differ in Layer 0 (this head restates VonNeumannAlgebras and HilbertModules; `c5e5bfa` cites them), in §1.1, and in the supplier table; the description mentions neither #1705 nor an order.

**Repair:** state in the description which of the two is rebased on the other (or close one), and rebase so that the surviving head carries one Layer 0 and one supplier table.

## Verified sound

**Gate, build and scope.** Head `cc02cfc6760f06c11da9a6b5045fb840691bfbc7`; the worker's gate passes every text scanner and the targeted build (`set_option=0`, `sorry-data=0`, `prnum=0`, `blob=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`, `build=0`) and fails only `depcheck=2` (R01). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The branch's `lake-manifest.json` pins the same Mathlib (`1b1ccf4b`) and Tau Ceti (`2fd255d9`) as main's, and the checkouts match.

**Lean elaboration and signatures.** `lake env lean` on `Suggested.lean` exits 0 with exactly 11 `declaration uses sorry` warnings and nothing else (31 s). A scratch copy with `#check @name` for all 23 declarations inside the namespace elaborated (11 warnings, exit 0); each type agrees with `scratch/signatures.md` and with its README statement: complex scalars throughout, `Nontrivial A` in `compactType_iff` (README §4.1 "nonzero"), `IsSimpleOrder (TauCeti.Subcomodule ℂ A H)` in `schur_orthogonality` (README "finite irreducible"), `IsScalarTower ℂ (QuantumSL2 q) V` and `FiniteDimensional ℂ V` exactly where §8.3/§8.2 say finite-dimensional, no finiteness in `quantumSL2_locallyFinite_iff` and `quantumSL2_locallyFinite_semisimple` (§8.4 "arbitrary"). The one binder the worker flagged, `[StarModule ℂ A]` on `AlgebraicHaar`, is not needed by its fields (a linear functional, normalization, two slice equations, positivity); `schur_orthogonality` and `compactType_iff` carry it explicitly. **Padding probe:** on a scratch copy every `sorry` was replaced by `first | rfl | simp | infer_instance | exact trivial`; all 11 fail (ten "type mismatch" after all alternatives, one unsolved goal in `quantumSL2_simple_classification` at line 241), so nothing closes in one tactic. Every `def` is used by a headline; `quantumSL2KUnit` carries real proofs by `RingQuot.mkAlgHom_rel`.

**Headline coverage.** Statable and stated: weighted Schur orthogonality (3.1), compact-type characterization (4.1), coproduct existence, PBW, domain, center, finite complete reducibility, signed simple classification, local-finiteness criterion and local-finiteness semisimplicity (Layer 8). `weakClosure_eq_bicommutant` is stated but is VonNeumannAlgebras' headline (R02). Not statable and named in the docstring with the missing carrier: Haar existence (`A⊗min A`, absent from pinned Mathlib; VonNeumannAlgebras V13b.SpatialNorm owns the spatial norm), analytic corepresentations, Hopf core/Plancherel/Tomita, universal and reduced completions, SUq(2) and O_F⁺, Tannaka–Krein, fusion and coamenability, Layer 8 tensor and compact comparisons. No statable headline of this roadmap's own is absent. Mathlib at the pin still records the double commutant theorem as to do (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:23`).

**Supplier citations resolved (every row of the table, every contract paragraph, every `*Needs:*` line).**

| Citation | Resolved at |
| --- | --- |
| CStarAlgebras C1.CommutativeMultiplierMorphisms; C1.7 strict topology; C2.1 state extension; C3; C4.1 multiplicative domain; C5.1–C5.2; C8.4 Toeplitz | main `CStarAlgebras/README.md:497`, `:468`, `:544`, `:886`, `:986`, `:1112`/`:1143`, `:1676` (C5.2's `C₀` scope: R03) |
| CategoricalOperatorAlgebras CA1a, CA2a | open head `7a2845fd`, `README.md:184`, `:350`; "Nothing from CA1b, CA2b or CA3–CA10" matches its own Scope `:39`–`:43` |
| TemperleyLiebOperatorAlgebras 1.3, 1.4, 2.1, 3.1–3.4, `markovTrace_neg_one_pow_nonneg_iff`, simple objects `X_r` | open head `7cf3fee`, `README.md:480`, `:532`, `:1155`, `:1274`–`:1375`, `:1178`, `:1384` |
| TemperleyLieb Layers 0–7, `TLCat.lift`, `TLCat.lift_unique` | main `TemperleyLieb/README.md:249`–`:474` |
| Subfactors 3.1–3.3, `markovTrace_nonneg_iff`, `jonesLoopParameters` | main `Subfactors/README.md:676`, `:697`, `:774`, `:729`–`:731` |
| OperatorIdeals OI-B23, OI-B29–OI-B30 | main `OperatorTheory/OperatorIdeals/README.md:349`–`:352` |
| SelfAdjointSpectralTheory Parts B, C, E | main `README.md:252`, `:781`, `:1186` |
| CompactGroups, `su2Irrep` | main `README.md:400`–`:413` |
| LieHighestWeight sl₂ worked example, `IsSl2Triple`, `sl (Fin 2) K` | main `README.md:181`–`:188`, `:1536` |
| OperatorAlgebraDynamics D1–D2, Reiter | main `README.md:148`, `:221`, `:258` |
| FreeProbability F1, F3, F6 | main `README.md:127`, `:255`, `:532` |
| AmenableGroups Layers 1, 5, 7 | main `README.md:98`, `:289`, `:415` |
| PivotalSpherical Layers 0–2, 7, `leftTrace`/`rightTrace`, `FDRep k G` | main `README.md:257`–`:318`, `:477`, `:329`–`:330` |
| Downstream: QuantumEnvelopingAlgebras QEA1, HopfologicalAlgebra §2.1 | main `QuantumEnvelopingAlgebras/README.md:181`, `HopfologicalAlgebra/README.md:319` (its `:165` still cites the Lean name `FiniteHopfModuleCat k H`, which no head of this roadmap declares; that roadmap's defect, noted for its author) |

**Dependency check (unmodified output of the required command):** the two UPWARD lines and `depcheck: 237 roadmaps, 2343 edges, 2 problem(s)` quoted in R01. Main's own README gives the same two lines at its lines 42–43 and `2342 edges, 2 problem(s)`.

**Ownership against open work.** The vocabulary neighbours (#888, #867, #1041, #1137, #1015) were read at their heads or on main: CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras name QuantumGroups as consumer of exactly what §§0.3–0.4 and §7.2 consume, and neither claims the reconstruction, the signed quantum-group cups or the §0.3 minimality theorem (`d(X)=min‖R‖‖R̄‖`, which CA2a does not state: no "minimum", "3.11" or "Longo" in its text). VonNeumannAlgebras and HilbertModules on main own §§0.1, 0.2, 0.5 (R02). NoncompactQuantumSymmetry and OperatorAlgebraDynamics do not build compact quantum groups. Ownership against open pull requests whose files the brief does not list was not checked beyond #1705, read with the roadmaps tool.

**Computed adversarial table.** q=1/2 unless stated; the fundamental SUq(2) matrix is u=[[a,−qc*],[c,a*]] with indices 0,1; F=[[0,1],[−2,0]] for O_F⁺; "pass" means both sides agree on the instance. Rows cover the seeded sample (0.3, 0.5, 2.1, 2.2, 2.3, 3.2, 3.3, 4.2, 4.3, 6.1, 7.1, 7.2, 8.1, 8.2, 8.7), the headlines, and every passage a finding touches (0.1, 0.2, 0.4, 1.1, 6.2).

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `weakClosure_eq_bicommutant` | M₂(ℂ): diagonal algebra; scalars; H=0 | diag: B′=diag (dim 2), B″=B; scalars: B′=M₂ (dim 4), B″=ℂ; H=0: both sides {0} | pass (owned by VonNeumannAlgebras) | R02 |
| 0.1 star closure needed | upper triangular 2×2 | B′=ℂ, B″=M₂≠B; `StarSubalgebra` excludes it | pass | none |
| 0.1 normal functional | Tr(diag(2,1)·) | I↦3, e₁₁↦2, norm 3; zero algebra: 1=0 so no state | pass | none |
| 0.2 rank-one and free-module formula | ℂ², θ_(e₁,e₂); θ_(ξ⊗a,η⊗b)(ζ⊗c) | e₁₂, adjoint e₂₁, product e₁₁; =ξ⊗a⟨η,ζ⟩b*c=(θ_(ξ,η)⊗ab*)(ζ⊗c) | pass (owned by HilbertModules H2) | R02 |
| 0.2 module versus scalar summability | A=K(ℓ²), a_n=p_n/√(n+1) | tail ‖Σ_{n≥N}a_n*a_n‖=1/(N+1)→0; Σ‖a_n‖² harmonic | pass (HilbertModules H1 states this example) | R02 |
| 0.3 norm product minimal | ℂ², (2R,R/2) with R=Σe_i⊗e_i | zigzags identity; norms² 8 and 1/2, product 2=d; not standard | pass | none |
| 0.3 non-minimal pair | R=2e₀⊗e₀+e₁⊗e₁, R̄=½e₀⊗e₀+e₁⊗e₁ | r_js_j=1 both j; ‖R‖²=5, ‖R̄‖²=5/4, product 5/2>2; rescaling (λR,λ̄⁻¹R̄) keeps 5/2 | pass | none |
| 0.3 dimension bound | SUq(2) fundamental | d=q+q⁻¹=5/2 > Hilbert 2; LR Thm 3.11 (`longoroberts` 681): R*R·R̄*R̄≥d² with equality iff a multiple of R is standard | pass | none |
| 0.3 sign under fiber functor | SU(2) cup e₀⊗e₁−e₁⊗e₀ | (R*⊗1)(1⊗R)e₀=−e₀, e₁↦−e₁: ε=−1; symmetric cup ε=+1, not invariant | pass | none |
| 0.4 lift data | cup R, ev εR* | zigzag ε·ε=1; loop εR*R=εd; Φ_R(e)=εRR*, e²=εd·e; p=RR*/d | pass | none |
| 0.4 Checks | X=ℂ,R=1; SU(2) R, δ=−2; d=3/2; Rep(SU(2)) traces | f₂↦0, Q₂=ℂ, not full; ε=−1, d=2, e=−RR*, e²=−2e; [2],[3],[4],[5]=3/2,5/4,3/8,−11/16; T_r(f_r)=1,−2,3 versus dims 1,2,3 | pass | none |
| 0.5 KMS sign | h=Tr(ρ·), ρ=diag(2/3,1/3) | σ_(-i)(e₁₂)=ρe₁₂ρ⁻¹=2e₁₂; h(e₁₂e₂₁)=2/3=h(e₂₁·2e₁₂)=2·(1/3); inverse sign 1/6 | pass; `hiai` 743–749 has the same convention | R02 (owner) |
| 0.5 canonical weight | HS(ℓ²), finite rank | rank-n projection n, identity ∞; `hiai` 3081–3084 | pass | R02 (owner) |
| 1.1 trivial group; G=ℤ, f=1[0] | f=2+i; (m,n)=(N,−N) | Δf=εf=Sf=2+i; Δf(m,n)=1[m+n=0]=1 at every (N,−N), not C₀(ℤ²), norm 1; r₊Δf=r₋Δf≡1 | pass | R05 (locator), R03 (tensor step) |
| 1.1 order control | S₃, g=(12), h=(23), f=1[(123)], right-to-left | gh=(123): Δf(g,h)=1; hg=(132): Δf(h,g)=0 | pass | none |
| 1.1 elementary tensors | a=1[1], b=1[−1] on ℤ | d(a⊗b)=ab=0; r₊=aS(b)=1[1]; r₋=S(a)b=1[−1]; S²=id | pass | none |
| 1.2 Haar versus evaluation; cancellation failure | C(C₂); monoid {1,0} | h(1[e])=1/2 vs 1; Δf(0,1)=Δf(0,0): span dim 3<4 | pass | none |
| 2.1 trivial, zero, sign, S₃ | ℂ; U=0; C₂; g=(12),h=(23) | U=1 isometric incl. H=0; 0≠1; (−1)²=1 vs −2; u₁₃(gh)=1 (gh(3)=1), u₁₃(hg)=0 (hg(3)=3) | pass | none |
| 2.2 unitarization | U(s)=[[1,2],[0,−1]] | U*U=[[1,2],[2,5]]; T=[[1,1],[1,3]], det 2; TU=[[1,1],[1,−1]], U*TU=[[1,1],[1,3]]=T | pass | none |
| 2.2 noninvertible | U=0 on ℂ | T=(id⊗h)(0)=0, no inverse: excluded | pass | none |
| 2.3 regular multiplicities | C₂; S₃; trivial group | 1+1=2; 1²+1²+2²=6; Λ(2)=2, δΛ(2)=2⊗1 | pass | none |
| 3.1 `schur_orthogonality` | SUq(2), F̃=diag(2,1/2), Tr 5/2 | h(a*a)=(F̃⁻¹)₀₀/Tr F̃⁻¹=1/5, h(c*c)=4/5 (=1/(1+q²)); h(aa*)=F̃₀₀/Tr F̃=4/5=1−q²·4/5 | pass | none |
| 3.1 normalization; degenerate | one-dim character; H=0 | F̃=1, rescaled 2 violates Tr F̃=Tr F̃⁻¹; H=0: subcomodule lattice a point, `IsSimpleOrder` false | pass | none |
| 3.2 Plancherel, characters, Vandermonde | a+c; f_z(a)=2^z; λ=1,2 | 1/5+4/5=1, h(a*c)=0; f₀=1, f₁*f₁(a)=4=f₂(a); [[1,1],[1,4]] det 3 | pass | none |
| 3.2 modular identity | θ(a)=FaF=4a | h(aa*)=4/5=4·h(a*a)=h(a*θ(a)) | pass | none |
| 3.3 pivotal traces; Kac | F=I₂; F=diag(2,1/2) | 2=2; 5/2=5/2>2; tr(F diag(1,0))=2, tr(F⁻¹diag(1,0))=1/2; Tr F=Tr F⁻¹≥n with equality iff F=I (AM–GM) | pass | none |
| 3.3 S² and F | S(c)=−qc, S(c*)=−q⁻¹c* | S²(c)=q²c=c/4=(FuF⁻¹)₁₀ | pass | none |
| 3.4 modular group | σ_t(a)=4^(it)a | σ_(-i)(a)=4a, h(a*σ_(-i)(a))=4/5=h(aa*); τ_(-i)(c)=c/4=S²(c) | pass | none |
| 4.1 `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x] primitive x | both sides; h((α+βu)*(α+βu))=&#124;α&#124;²+&#124;β&#124;²>0; `Nontrivial` excludes 0; invariance forces x=0, unitarity (1+x̄Nᵀ)(1+xN)=1 forces N=0, coefficient set {1} | pass both directions | none |
| 4.2 regular unitary; norms | Γ=ℤ; C₂, 1+u; ℂ, 2+i | (1,2,3)↦(1,3,6) on both pentagon words; both C*-norms 2, Haar norm² 2; both norms √5 | pass; BMT Thm 3.6 (`bmt` 858) | none |
| 4.3 criteria | ℤ; F₂; reduced F₂ | Følner ratio 2/(2N+1)→0; 2√3<4=ε(adjacency); h_r faithful, ε_r unbounded; BMT Thm 2.2 (`bmt` 257: h faithful and ε bounded), 2.8 (461), Cor 2.9 (478), 3.6 (858) | pass | none |
| 5.1 relations; antipode | (a,c)=(1,0); (0,1) at q=1 and 1/2 | u=I₂; q=1: [[0,−1],[1,0]] unitary; q=1/2: aa*+q²c*c=1/4≠1; S²(c)=c/4 | pass | none |
| 5.2 O_F⁺ data | F=[[0,1],[−2,0]] | FF̄=−2I; cup −2e₀⊗e₁+e₁⊗e₀ (`banica` 56–57), norm² 5, zigzag −2I, normalized −I; bound 5/2≥2; J(e₀)=−√2e₁, norm² 2 | pass | none |
| 6.1 reconstruction Checks | Hilb_f; Rep(C₂); Rep(S₃) | ℂ; dim 2 vs 1; 1+1+4=6 vs 4; Malacarne Thm 4.1 (`malacarne` 285–291) hypotheses: essentially small, conjugates, finite sums and subobjects, unitary fiber functor | pass | none |
| 6.2 truncations; locators | H=0; H=ℂ | quotient ℂ; A_(≤1) dim 2; "Lemma 3.2" absent | pass / fail (locator) | R04 |
| 6.3 cancellative semigroup | C₂; {1,0} | bijective translations; 0·1=0·0 with 1≠0 | pass | none |
| 7.1 Haar of c*c | q=1/2; q=±1 | (1−q²)/(1−q⁴)=4/5, (1−q²)/(1−q⁶)=16/21; endpoints ∫t=1/2, ∫t²=1/3 | pass | none |
| 7.1 q=−1 model; interior character | σ₃σ₁=−σ₁σ₃; a₀=S*D | ac=−ca, a*a+c*c=1, c*c=cc*=t; t=0,z=1 entry a↦1, c↦0; D−1 compact, symbol z̄, value 1 at z=1; BMT Thm 2.12 (`bmt` 614–644) uses T_k=U_k*D_k with D_k=1+compact | pass | none |
| 7.1 fusion dimensions | r₁⊗r₁ | 2·2=1+3; (5/2)²=1+21/4 | pass | none |
| 7.2 sign, loop, β | F above | c=−2, q=1/2, d=5/2, δ=−5/2=sign(c)d; β=c⁻²‖E‖⁴=25/4=d² (`banica` 72) | pass | none |
| 7.2 recurrences; n=1,3 | n=2, d=5/2; n=3; n=1 | Hilbert 1,2,3,4; intrinsic 1,5/2,21/4,85/8; ε(χ)=3∉[−2,2]; n=1: C*(ℤ/2), m₂=m₄=1 vs 1,2 | pass; Banica Thm 1 says "n∈ℕ", abstract n≥2 | none (source issue) |
| 8.1 relations, PBW sign, quantum integers | q=1/2 | KF=4FK, q^(−2ab)=4 at a=b=1; [−2],[−1],[0],[1],[2]=−5/2,−1,0,1,5/2; Virelizier §2.3 (`virelizier` 352–357) same relations, coproduct and antipode; Prop 2.4 (358) S²=K⁻¹xK and spanning by F^mK^nE^p | pass | none |
| 8.1 `quantumSL2Comul_exists` | symbolic | ΔKΔE=q²ΔEΔK; ΔKΔF=q⁻²ΔFΔK; ΔEΔF−ΔFΔE=(K⊗K−K⁻¹⊗K⁻¹)/(q−q⁻¹) using EK⁻¹=q²K⁻¹E; holds for every q with Lean's totalized inverse | pass | none (note) |
| 8.1 Casimir | symbolic | FE+(qK+q⁻¹K⁻¹)/(q−q⁻¹)²=EF+(q⁻¹K+qK⁻¹)/(q−q⁻¹)² | pass | none |
| 8.2 `quantumSL2_simple_classification` | L₂⁺; L₁⁻; m=0 | weights 1/4,1,4; F coefficients 1,5/2,0; E 0,5/2,1; EF−FE=diag(5/2,0,−5/2)=[2−2j], (K−K⁻¹)/(q−q⁻¹) on v₀=(1/4−4)/(−3/2)=5/2; L₁⁻: K=diag(−1/2,−2), EF−FE=diag(−1,1); m=0: b:Fin 1, F=E=0, K=ε | pass | none |
| 8.2 source normalization | Virelizier Ex 3.3 (`virelizier` 552–554) | E coefficient (q^(n−2i+2)−q^(−n))(q^(2i)−1)/((q−q⁻¹)(q²−1))=[i][n−i+1] with F v_i=v_(i+1); rescaling v_j↦v_j/[j]! gives the README ladder | pass | none |
| 8.3 `quantumSL2_center`, `quantumSL2_finite_semisimple` | m=0,1,2; L₁⁺; V=0; L₀⁻⊕L₁⁺ | Casimir scalars 10/9,17/9,65/18 (×(−1) on ε=−1), six distinct; FE=diag(0,1), toral diag(17/9,8/9), sum (17/9)I; z=0 ↔ p=0 unique (domain); zero module semisimple; blocks −10/9,17/9 | pass | none |
| 8.4 `quantumSL2_locallyFinite_iff` | L₀⁻; Verma λ=1; V=0 | K=−1 signed, E=F=0, cyclic dim 1; weights 4^j, F not locally nilpotent, cyclic span infinite; both sides true on 0 | pass both directions | none |
| 8.5 Clebsch–Gordan; Δ(E²); pivot | m=n=j=1; r=2; g=K⁻¹ | α₁=−q[1]/[1]=−1/2, ΔE(v₀⊗v₁−½v₁⊗v₀)=(q−½)v₀⊗v₀=0; middle coefficient (1+q²)=5/4=q[2] (q⁻¹[2]=5); tr g=tr g⁻¹=5/2 on L₁⁺, −1 on L₀⁻ | pass | none |
| 8.6 compact form | m=1 | h₁=q=1/2; E*=G⁻¹EᵀG=[[0,0],[2,0]]=KF; orthonormal entries √2, 1/√2; commutator diag(1,−1) | pass | none |
| 8.7 classical specialization | v=1, m=1,2 | [E,F]=diag(1,−1), [H,E]=2E; m=2: diag(2,0,−2); [2]_v=v+v⁻¹→2 while the totalized quotient gives 0 | pass | none |
| Lean generality | all 23 `#check` types | binders match README hypotheses; `hq` unused in `quantumSL2Comul_exists`; `hgeneric` unused by PBW's truth (at q=±1 the totalized relation is EF=FE and F^aK^bE^c still spans a basis) but harmless | pass | none (notes) |

**Sources read (legal copies, cached by the service; locators as `<id> line N`).**

- `longoroberts` (arXiv:funct-an/9604008v1): §3 heading p.10 (line 365, under the page-10 marker at 363), Lemma 3.3 p.10 (389: two solutions define the same left inverse iff they differ by a unitary), Theorem 3.8 p.15 (621: product left and right inverses), Theorem 3.11 p.17 (681–699: `R*R·R̄*R̄≥d(ρ)²`, equality iff a multiple of R is standard). §0.3's minimality statement is Theorem 3.11; LR assume ι irreducible, which the README's "simple unit" supplies.
- `hiai` (arXiv:2004.02383v1): Theorem 2.2 p.11 (436–438, `JMJ=M′`, `Δ^(it)MΔ^(−it)=M`), Theorem 2.14 p.18 (737–749, KMS at β=−1 with `f(t)=ω(σ_t(x*)y)`, `f(t+i)=ω(yσ_t(x*))`, uniqueness), §7.1 (A)–(E) pp.64–65 (3076–3111: canonical weight formula, Tomita's theorem for weights, KMS and uniqueness, right Hilbert algebra, Tomita algebra). §§1.2–1.3 pp.3–5 (93–146) contain neither the finite-dimensional decomposition nor the continuity facts §0.1 cites them for (previous R02, now moot under R02).
- `bmt` (arXiv:math/0010248v1): Theorem 2.2 p.6 (257), Theorem 2.8 p.10 (461), Corollary 2.9 p.11 (478), Theorem 2.12 p.13 (614) and Corollary 2.13 p.14 (645) for `0<|q|<1`, Theorem 3.6 pp.18–19 (858–865).
- `malacarne` (arXiv:1602.04807v1): Theorem 1.1 p.2 (52), Lemma 2.1 pp.3–4 (183), Theorem 4.1 pp.5–6 (285–312, with the three-case generation argument); no Lemma 3.2.
- `banica` (arXiv:math/9806063v5): Theorem 1 p.2 (42), Proposition 1 (54), Lemma 1 (65), relations (1)–(3) with β (70–72), Proposition 2 (75).
- `virelizier` (author page): §2.3 p.8 (348–357), Proposition 2.4 (358), Example 3.3 p.11 (552), Proposition 3.7 and Corollary 3.8 p.12 (585, 594), Theorem 3.13 and Corollary 3.14 p.13 (625, 635), Proposition 4.1 pp.13–14 (644).
- `penneys`, `landsman`, `egno`: not re-opened this round; their locators are unchanged since the previous review, which verified them, and the Landsman passages are deleted under R02.

## Not verifiable

- **Timmermann, *An Invitation to Quantum Groups and Duality*** (Definitions 5.1.1, 5.1.4, Theorem 5.1.6, Theorem 5.3.3, Propositions 5.3.7–5.3.8, Theorems 5.4.1, 5.4.3, 5.4.5, Propositions 2.2.4, 3.2.9, 3.2.17, Theorems 3.2.12, 3.2.19, Remark 2.2.2(iv)(c), Chapter 6 §2): the publisher page for DOI 10.4171/043 states that a subscription is required and offers purchase only; the sources service reports the host in no licence class and wrote a `[[missing]]` entry to `scratch/needs-references.toml`. The work is not in the roadmap's manifest. These locators carry the seeded targets 2.1, 2.2, 2.3, 3.2, 3.3 and parts of 4.1, 7.1 and 8.6; their mathematics was checked in the table against BMT, Virelizier and the standard SUq(2) values.
- **Takesaki, *Theory of Operator Algebras II*** (VI.1, VII.1–VII.2, Theorems VII.2.5–VII.2.6): settled uncertified in the manifest; Hiai §7.1 (A)–(C) states the same results without proof.
- **Generality beyond the computed instances**: the table does not prove the nonseparable Peter–Weyl theorem, Tannaka reconstruction, the generalized-weight complete-reducibility argument or the Biedenharn–Elliott pentagon; those were assessed through their stated hypotheses, routes, owned inputs and the source readings above.

## Source issues

- **Error** in banica at Theorem 1, printed p.2: the source says the SU(2)-type classification holds for every n; it should be restricted to n≥2 as in its abstract, since n=1 gives C*(ℤ/2) with two irreducibles; affects a stated result.
- **Misprint** in virelizier at §2.3, printed p.8: the source says the displayed quantum numbers (t)_q for all integers t lie in the unit group; it should exclude t=0, where the number is zero; affects nothing.
