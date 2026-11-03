# Review of OperatorAlgebraDynamics (pull request #1137 at 1a78485)

**Verdict:** needs changes

Scope of this review: the whole folder `TauCetiRoadmap/OperatorAlgebraDynamics/` (README.md, Suggested.lean, BoundedSequenceTargets.lean, HilbertResidueTargets.lean, OrbitRepresentationTargets.lean). The roadmap already exists on main; the diff against main adds 846 README lines and the three companion Lean files and rewrites Suggested.lean. All of D1.CentralTwists, D1.BorelPrefix, D1.TwistedBorel, D2.OrbitRepresentations, D2.CentralTwists, D2.FreeGroups, D2.BoundedSequenceTranslation, D2.SequenceToeplitz, D2.SaddleFlow, D3.LCAWeyl and the concrete Cuntz paragraph of D6 are new, and the mathematics of each was checked below. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` lists the five folder files only).

The mathematics of the new sections is sound: every formula I recomputed (twisted convolution, star, modular factor, cocycle laws, cochain transport direction, Borel extension group, weight-one projection, orbit representations, rotation relation, matrix units, band decomposition, character obstruction, saddle-flow neighbourhoods, LCA Weyl commutator and Fourier sign, residue-class Cuntz family, Powers partition, KMS sign against the Gibbs state) came out as the README states. The blocking findings are the failed gate and the shape of the Lean files; the rest are locator, policy and form notes.

## R01 (P2) — The gate fails: two UPWARD supplier edges

Location: `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` lines 45 and 48 ("[HilbertModules H1–H4] supplies adjointable operators …", "[VonNeumannAlgebras V0–V4] supplies states, GNS …").

Claim: the roadmap consumes HilbertModules and VonNeumannAlgebras.

Witness: the dependency check output, run on this head:

```
UPWARD: OperatorAlgebraDynamics (on main) -> HilbertModules (#10) at README lines [45]
UPWARD: OperatorAlgebraDynamics (on main) -> VonNeumannAlgebras (#4) at README lines [48]
depcheck: 204 roadmaps, 1651 edges, 2 problem(s)
```

Both citations are inherited: the README on main already cites HilbertModules at its lines 26 and 43 and VonNeumannAlgebras at its lines 46 and 316. The check treats a roadmap that is on main as preceding every merge-order entry, while the two suppliers are still in open pull requests (merge order positions 5 and 11). I believe these two lines are placement false positives rather than a design defect: the dependency is genuine and runs in the right mathematical direction (HilbertModules and VonNeumannAlgebras supply, this roadmap consumes), and this review's own list of consumable suppliers contains both. The gate rule still forbids acceptance while they stand.

Repair: not a README edit. The board should list OperatorAlgebraDynamics in the merge order after its last supplier (HilbertModules, position 11), after which the two lines disappear. If the board instead requires main roadmaps to cite only main roadmaps, the two supplier paragraphs have to become declared gaps (`gap:` slugs with supplier and section), which is the author's choice to make, not mine.

## R02 (P2) — `Suggested.lean` is an API prototype, not the acceptance test

Location: `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` lines 10–16 (module docstring: "These are suggested forms. The README is the definitive specification."), line 22 (`namespace OperatorAlgebraDynamics`), lines 52–57 (`def integratedOperator … := (exists_integratedOperator …).choose`), lines 179–190 (`centralConvolution`, `centralInvolution`, `cochainTransport`).

Claim: the file states the roadmap's headline theorems against the pins, and names those that are not statable.

Witness: the file elaborates (six `sorry` warnings, nothing else), but no end theorem of the roadmap appears in it and its docstring names none as unstatable. The headlines a reader of the README expects are: the universal property of `A⋊_αG` (D1), the regular/normal comparison (D2), Powers simplicity and unique trace of `C*_r(FreeGroup ι)` (D2.FreeGroups), Green and symmetric imprimitivity (D3), the LCA Weyl classification (D3.LCAWeyl), Takai duality (D4), disintegration (D5), Renault equivalence and the universal `O_n` identification (D6), the KMS–modular characterization and the Choquet simplex (D7), uniqueness of the quasi-free KMS state (D8), and the high-temperature uniqueness theorem (D9). None is stated and none is declared unstatable; the only D2.FreeGroups statement is the finite-partition lemma `exists_powers_partition`, a technical input standing in for the headline. The file also breaks the form rules: the namespace is `OperatorAlgebraDynamics` rather than `TauCetiRoadmap.OperatorAlgebraDynamics`; the module docstring is not of the "title: target signatures" form; `integratedOperator` is a `def` whose value is `Classical.choose` of a sorried existence theorem, so it is sorry-dependent data in disguise and `integratedOperator_apply` is `choose_spec`; `scalarIntegrated` merely renames `ContRepresentation.integratedOperatorL1`; `centralConvolution`, `centralInvolution` and `cochainTransport` are definitions that no theorem in the file uses, so no headline needs them.

Repair, tested on the instance that refutes the original: keep `IsKMS`, `kms_invariant`, `kms_entire_identity`, `exists_powers_partition`, `CentralCocycle`, `CentralCovariantPair`, `exists_centralIntegratedOperator`, `exists_integratedOperator` and `IsCovariant` (each is a real statement on native carriers and elaborated under the pins as I checked); move the file into `namespace TauCetiRoadmap.OperatorAlgebraDynamics` with the docstring "Operator-algebra dynamics: target signatures" that says the roadmap is README.md and lists, by name, which headlines are not statable and what each lacks (crossed products, groupoid C*-algebras, `O_n`, CAR and Weyl algebras, the quasi-local algebra, Hilbert tensor products); delete the five definitions and the two `apply` lemmas named above (R03 gives the full list); and state the D2.FreeGroups headline directly if the left-regular unitaries on `lp (fun _ : FreeGroup ι => ℂ) 2` can be defined with a real body at the pin (I found no reindexing lemma for `lp` in `Mathlib/Analysis/Normed/Lp/lpSpace.lean`, so if that body is more than a few lines, name the headline in the docstring as not statable instead of keeping the partition lemma as its stand-in).

## R03 (P3) — Padding in the Lean files

Location: `Suggested.lean` lines 29 (`continuous_action`), 52–65 (`integratedOperator`, `integratedOperator_apply`), 74–87 (`scalarIntegrated`, `scalarIntegrated_apply := rfl`), 189 (`cochainTransport`), 206–213 (`scalarCoboundary_of := TauCeti.TwistedMonoidAlgebra.equivOfCoboundary_of …`); `HilbertResidueTargets.lean` lines 23 (`exists_nat_hilbertBasis`), 42–48 (`family_isometry`, proved by `isometry_iff_adjoint_comp_self` and `simpa`); `OrbitRepresentationTargets.lean` lines 42–51 (`shift`, `modulation`, `rotation_relation`); `BoundedSequenceTargets.lean` line 40 (`no_character`).

Claim: each is a headline statement.

Witness (one-tactic probe, by elaboration where the proof is already in the file and by reading otherwise): `scalarIntegrated_apply` closes by `rfl`; `scalarCoboundary_of` closes by `exact` of the pinned lemma `TauCeti.TwistedMonoidAlgebra.equivOfCoboundary_of` (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean` line 510); `integratedOperator_apply` is `choose_spec`; `family_isometry` is two tactics on the pinned `ContinuousLinearMap.isometry_iff_adjoint_comp_self` (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean` line 858); `rotation_relation` is the computation `exp(2πi(x−(n−1)θ)) ξ(n−1) = exp(2πiθ)·exp(2πi(x−nθ)) ξ(n−1)`, which mirrors the README's `uv = exp(2πiθ)vu` check at line 567; `exists_nat_hilbertBasis` is the library fact that a separable infinite-dimensional Hilbert space has an ℕ-indexed Hilbert basis (`exists_hilbertBasis` at `Mathlib/Analysis/InnerProductSpace/l2Space.lean` line 593 plus countability); `no_character` quantifies over an arbitrary ring `A` and mentions no object of the roadmap; `continuous_action` is the D1 API lemma "point-norm continuity gives joint continuity by isometry".

Repair: delete each of them from the Lean files; the README keeps every one as a target or Check (lines 91, 115–119, 304–308, 563–569, 768–770, 1180–1194).

## R04 (P3) — The three companion Lean files break the import, namespace and docstring rules, and the gate does not build them

Location: `BoundedSequenceTargets.lean` lines 1–3 and 13; `HilbertResidueTargets.lean` lines 1–2 and 17; `OrbitRepresentationTargets.lean` lines 1–4 and 13.

Claim: they are roadmap Lean files in the house form.

Witness: each opens with `import Mathlib.<submodule>` lines (nine in total) instead of the single `import Mathlib`, which the gate refuses when it scans a file; the namespaces are `OperatorAlgebraDynamics.BoundedSequence`, `TauCetiRoadmap.OperatorAlgebraDynamics.HilbertResidues` and `OperatorAlgebraDynamics.OrbitRepresentation`, three different roots; `entry`, `H`, `B`, `HilbertSum`, `shift` and `modulation` carry no docstring; and the targeted build is of `Suggested.lean` only, so these files are outside the acceptance test (I elaborated all three myself: `sorry` warnings only).

Repair: move `exists_residue_family`, `diagonal_commutant`, `transitive_commutant_scalar`, `matrix_units` and `finite_band_decomposition` into `Suggested.lean` under `/-! ## D2 … -/` and `/-! ## D6 … -/` section comments (they elaborate under `import Mathlib`, which these files' imports are subsets of), with docstrings on `entry` and `HilbertSum`, and delete the three companion files together with the three README sentences that point at them (lines 575–577, 781–782, 1199–1201).

## R05 (P3) — No Lean name of this roadmap appears in the README

Location: `README.md` lines 575–577, 781–782, 1199–1201, 1561 (the only mentions of the Lean files: "records the point-separating diagonal-commutant adapter …", "records the matrix-unit, finite-band and character-obstruction signatures", "states the basis and residue-family targets", "prototypes the action, covariance, vector-integral and KMS interfaces").

Claim: README and Lean agree (every Lean name appears in the README).

Witness: a grep of the README for each of the 25 declaration names of the four Lean files (`IsCovariant`, `IsKMS`, `kms_invariant`, `exists_powers_partition`, `CentralCocycle`, `exists_residue_family`, `diagonal_commutant`, `matrix_units`, …) finds none; the one hit for `integratedOperator` is the library name `integratedOperatorL1` at line 117.

Repair: at each target that a kept declaration realizes, name it once in backticks (for example at line 1191 "`S_i* S_j = δ_ij Id` and `∑_j S_j S_j* = Id` (`exists_residue_family`)"), and name nothing that R03 deletes.

## R06 (P3) — Five new targets rest on a source that the References do not identify

Location: `README.md` line 573 ("Rieffel main pp47–48's concrete example"), line 776 ("Rieffel main physical138"), line 833 ("Rieffel main pp140–142 / archive 0210_026 pp13–15"), line 853 ("Rieffel main p137 / archive 0210_026 p10"), line 922 ("Rieffel main p66 / archive 0209_001 p17").

Claim: these are locators into a legal source.

Witness: the `## Sources and API alignment` section (lines 1492–1562) has no Rieffel entry; no author, title, collection or location is given anywhere for "Rieffel main" or "archive 0210_026 / 0209_001"; a web search for those identifiers finds nothing; the pull-request text (data) says the pages were read from "source images" by an AI subagent. The sections also assert that this source contains errors (lines 777–781, 834–838, 853–856, 921–924), which no reader can check.

Repair: either add a References entry naming the work (author, title, the archive or collection and its item numbers, page scheme, and a legal place to read it; if none exists, the manifest records it `uncertified` and the README stops asserting what the source gets wrong), or replace the locators by standard ones: Williams, Theorem 4.24 (Stone–von Neumann), printed p. 133 of `williams-cpcsa-draft31`, for the D3.LCAWeyl uniqueness statement (its hypotheses are a locally compact group G and `C₀(G)⋊G ≅ K(L²G)`, exactly the route the README takes), and Cuntz, *Simple C*-algebras generated by isometries*, Comm. Math. Phys. 57 (1977), §1, for the residue-class family of D6 (open at Project Euclid). The D2.BoundedSequenceTranslation, D2.SequenceToeplitz and D2.SaddleFlow mathematics stands on its own (verified below) and needs no source claim about a handwritten text.

## R07 (P3) — Process narrative, links and abbreviations in the README

Location: `README.md` line 777 ("its conflicting input readings remain unresolved"), 779–781 ("are retained as source claims, rather than imposed on R"), 835 ("the withdrawn sum-of-projections argument, as source errors"), 836–838 ("this model does not resolve that original-input ambiguity"), 776 ("physical138"); 28 markdown links of the form `](../X/README.md)` or `](https://…)` (lines 28, 38, 41, 42, 45, 48, 50, 52, 55, 61–62, 71, 475, 521, 706, 716, 1005, 1007, 1020, 1295, 1494, 1514, 1519, 1522, 1528, 1544, 1560, 1561); line 446 ("NQS M2's targets") and line 12 ("RQFT consumes D8's Weyl representation").

Claim: the README is timeless prose with citations by roadmap name and section.

Witness: the quoted phrases narrate a review history a reader a year from now cannot reconstruct; the commit "review repairs (… section citations not links)" is in the history, yet the relative links remain; "NQS" is never expanded (NoncompactQuantumSymmetry appears nowhere in the file) and "RQFT" is the abbreviation of the open roadmap RelativisticQuantumFieldTheory, not a roadmap name.

Repair: delete the narrative sentences (the mathematics of R and Q is stated and the source claim is handled by R06); replace each link by the roadmap name and section (for example "HilbertModules H1–H4", "VonNeumannAlgebras V8.LCHRegularNormalBridge", "Williams, Theorem 4.22, p. 132") and drop the Zulip and GitHub links; write "NoncompactQuantumSymmetry M2" and "RelativisticQuantumFieldTheory".

## R08 (P3) — README shape: no Checks, no Needs lines, no supplier-contract or scope section

Location: `README.md` whole file; for the new material, D2.BoundedSequenceTranslation (721–782), D2.SequenceToeplitz (784–838), D2.SaddleFlow (840–857), D2.OrbitRepresentations (523–577), D1.CentralTwists (155–317), D1.BorelPrefix (319–402).

Claim: every definition has its API and at least three discriminating Checks, every target a `*Needs:*` line, and the headings follow the house shape.

Witness: the file has no `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## Layer k`, `**Checks.**`, `### Examples`, `### Dependencies` or `## Downstream consumers`, and no `*Needs:*` line; the shape is the one the roadmap had on main (784 lines), and the 846 new lines follow it. The new objects `C₊`, `R=ℓ∞(ℤ)⋊ℤ`, `Q`, `H_p`, `E_ω`, the central cocycle, the Powers property and the residue-class family are defined without a Checks list; the tests that do appear (the ℤ/2 cocycle at lines 383–386, the even-integer projection at 768–770, `uv = exp(2πiθ)vu` at 567) are the right kind but are embedded in prose.

Repair: since this is a revision of an existing roadmap, at least give the new sections the house shape: a `**Checks.**` list under each new definition (the three computed checks above plus negative controls, for example the fixed-point nonamenable test of line 558 for D2.OrbitRepresentations, `n = 1` and the change-of-basis unitary for the residue family, `F = ∅` and `f = b^j` for the Powers partition), a `*Needs:*` line per target naming its inputs by supplier and section, and a `## Scope and ownership` section that records the deferrals now scattered through lines 10–85 and the ownership statements of R09.

## R09 (P3) — Ownership and supplier drift notes

Location: `README.md` lines 908–933 (D3.LCAWeyl), 48–60 and 475 (VonNeumannAlgebras V8, V10, V11, V4.0.Decomposition).

Claim: the LCA Weyl classification has no other owner; the cited VonNeumannAlgebras sections exist at the supplier's open head.

Witness: (a) MetaplecticAutomorphicForms §1.2 owns "the unitary Stone–von Neumann theorem for the real Heisenberg group and its Hilbert multiplicity form" (so cited by QuantumFoundations at its head ccf4051, supplier-table row for §6.6); D3.LCAWeyl restates the same theorem for every locally compact abelian G, which contains the case G = ℝⁿ, without citing the existing owner. (b) VonNeumannAlgebras has two open heads: at dee8088 the file has `**V8.LCHRegularNormalBridge.**` (its line 2018), `**V4.0.Decomposition**` (line 1279), V10 (lines 2249–2364) and V11, exactly as cited; at d9e53b3 (the later head, "operator foundations and measurable fields") the file stops at V4 and V4.0.Fields and says a Part II roadmap owns the rest (its lines 53 and 1173). Every V8/V10/V11/V4.0.Decomposition citation here therefore resolves at one head and not at the other.

Repair: (a) in the scope section, cite MetaplecticAutomorphicForms §1.2 for the real Heisenberg case and state in one clause that D3.LCAWeyl is the locally-compact-abelian generalization through `C₀(G)⋊G ≅ K(L²G)`, with the real case imported and compared, not re-proved. (b) Name the VonNeumannAlgebras head whose sections are consumed; if the split version is the one that merges, repoint V8.LCHRegularNormalBridge, V4.0.Decomposition, V10 and V11 to the Part II roadmap that owns them.

## R10 (P3) — Unused hypotheses in the kept Lean statements

Location: `Suggested.lean` line 131 (`(hN : 0 < N)` in `exists_powers_partition`), lines 39 and 45 (`[LocallyCompactSpace G] [T2Space G]` and `[μ.InnerRegularCompactLTTop]` in `exists_integratedOperator` and `exists_centralIntegratedOperator`).

Claim: each hypothesis is needed.

Witness: for `N = 0` the type `Fin 0` is empty and the pairwise-disjointness clause is vacuous, so the statement holds with `C = ∅`, `D = univ`; the integrated-operator existence and the bound `‖T‖ ≤ ∫‖f‖` use only `Integrable f μ`, unitarity of `U` and strong continuity (the integrand `g ↦ π (f g) (U g ξ)` is a.e.-strongly measurable as a limit of simple-function compositions with a continuous map, with norm `≤ ‖f g‖‖ξ‖`), not inner regularity or local compactness.

Repair: drop `hN` and the three instance hypotheses, or keep them and say in the docstring which later consumer (the multiplicativity of the integrated form) needs them.

## R11 (P3) — Two locators of the new sections are to secondary places

Location: `README.md` line 1180 (the concrete Cuntz paragraph has no locator at all); lines 715–719 (de la Harpe, Definition 9 and Theorem 14, cited for "the partition and averaging argument").

Claim: each target has a locator to the statement it uses.

Witness: de la Harpe's Theorem 14 (`delaharpe2007` line 423) states only "Powers groups are C*-simple"; the unique-trace conclusion, the explicit free-group partition and the `2‖x‖/√N` estimate stated at lines 653–699 are not in Theorem 14 (the README says so itself at 717–719, which is correct but leaves those three targets without a locator). The Cuntz family paragraph cites nothing.

Repair: cite Powers, *Simplicity of the C*-algebra associated with the free group on two generators*, Duke Math. J. 42 (1975) (uncertified if only the paywalled page resolves) for the free-group partition and the averaging estimate, and Cuntz 1977 §1 (Project Euclid, open) for the residue-class family.

## Verified sound

**Gate and build.** `lake env lean` on `Suggested.lean`: six `declaration uses sorry` warnings (lines 29, 42, 108, 115, 129, 193), no error. The three companion files elaborate with three, two and three `sorry` warnings and no error. The worker's gate: every text scanner 0, build 0, `depcheck=2` (R01). Dependency check output is quoted in R01: no CYCLE line. Other changes outside the folder: none.

**Elaborated signatures.** I compared the 18 elaborated types in the worker's signature transcript with the README. The transcript's three "unknown identifier `TauCeti.ContRepresentation.IsUnitary`" errors do not reproduce: the name is `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` line 52, imported at `Suggested.lean` line 6, and my elaboration has no error. Binders the transcript flags as dropped: `IsKMS` loses `[StarOrderedRing A]` (its type needs only `PartialOrder A` for `A →P[ℂ] ℂ`; the two KMS theorems carry it); `CentralCocycle` and the three central definitions lose the topological-group, Borel, locally-compact and Hausdorff instances (their types mention only `TopologicalSpace G`, and `centralInvolution` keeps `[IsTopologicalGroup G] [LocallyCompactSpace G]` because `Measure.modularCharacter` needs them); `scalarIntegrated` loses `[CompleteSpace H]` (the pinned `integratedOperatorL1` does not need it). None of these changes the mathematical generality the README states; the README states none of these declarations by name (R05).

**Library declarations opened at the pins.** `TauCeti.ContRepresentation.IsUnitary` (Unitary/Basic.lean 52: `∀ g v w, ⟪π g v, π g w⟫ = ⟪v, w⟫`); `ContRepresentation.integratedOperatorL1` (Integrated/Basic.lean, used at Fourier/Pontryagin/StronglyContinuous.lean 93); `TauCeti.IsFactorSet` (Twisted/Basic.lean 97), `equivOfCoboundary` (501) and `equivOfCoboundary_of` (510); `MeasureTheory.Measure.modularCharacter` (Mathlib `MeasureTheory/Group/ModularCharacter.lean` 130, defined through `haarScalarFactor (map (· * g) haar) haar`, so `∫ f(xg) dμ = c(g)∫ f dμ`, which is the README's convention at line 31, hence `Δ = c⁻¹` as stated); `Nat.divModEquiv` (`Logic/Equiv/Fin/Basic.lean` 358, `ℕ ≃ ℕ × Fin n` with `[NeZero n]`); `ContinuousLinearMap.isometry_iff_adjoint_comp_self` (Adjoint.lean 858); `div_mem_nhds_one_of_haar_pos` (Haar/Basic.lean 638, needs `[LocallyCompactSpace G]`); `AddMonoidHom.continuous_of_measurable` (Haar/NormedSpace.lean 79, additive, normed source and target, as the README says at 357–359); `MonoidHom.isOpenMap_of_sigmaCompact` (OpenMapping.lean 114: σ-compact source, Baire Hausdorff target, surjective continuous, matching the README's use at 378); `toPointwiseConvergenceCLM` (used at Distribution/TemperedDistribution.lean 80); `exists_hilbertBasis` (l2Space.lean 593).

**Cross-roadmap citations resolved.** HilbertModules H1–H5 (head c3a41ca, headings at its lines 123–353); CStarAlgebras C1, C2, C5, C6, C7, C8 (head 1d4e2ed; C8 at line 792 contains the Toeplitz extension `0→K(ℓ²)→T→C(𝕋)→0` on `lp (fun _ : ℕ => ℂ) 2` with the forward shift and symbol z, as D2.SequenceToeplitz consumes); OperatorKTheory K7 (head d1b2465, lines 691 and 962–966: `α(f)(z)=f(exp(2πiθ)z)`, `uv=exp(2πiθ)vu`, matching README lines 563–567); CStarClassification CL5 (head db5a0c5, Layer 5 at line 816, §5.8 "translation crossed product"), which also records "D6 owns the universal models of `O_n`" (its line 57), as does CategoricalOperatorAlgebras (head at its line 63); NoncompactQuantumSymmetry M2 (head 777a2fe, M2.MeasuredRefinement at line 1761); LieGroupoidsPoisson G0 (head 2a55031, layers G0–G7 at line 17, composable-pair topology at 274); SelfAdjointSpectralTheory SA-A21, SA-B14, SA-B44, SA-B50, SA-B59, SA-B67, SA-B79, SA-B85 (main, lines 225, 320, 420, 441, 477, 538, 592, 676); BanachAlgebras A7 (main, line 875); FreeProbability F3 (main, line 255); AmenableGroups (main); RepresentationTheory/CompactGroups and SpinRepresentations (main); OneParameterSemigroups (Completed); QuantumFoundations QF4 (head ccf4051: Layer 6 owns `dΓ`, `Γ` and the Segal-field normalization adapter on D8's carriers and consumes D8's Weyl convention, consistent with README line 12); RelativisticQuantumFieldTheory (its line 21: "D8, not QF, owns the CCR/CAR/Weyl algebra"); VonNeumannAlgebras V4.0.Fields, V4.0.Decomposition, V8.LCHRegularNormalBridge, V10, V11 at head dee8088 (lines 1181, 1279, 2018, 2249–2364), see R09 for the other head. Ownership of the roadmap's new objects was searched by object across main and the open heads: the uniform Roe algebra, the Powers property and KMS states have no other owner; `O_n` is assigned to D6 by every roadmap that mentions it; the Stone–von Neumann theorem is R09.

**Sources.** `delaharpe2007` (arXiv math/0509450, fetched through the service): Definition 9 at line 323 is exactly the README's Powers property (finite `F ⊆ Γ∖{1}`, `N ≥ 1`, `Γ = C ⊔ D`, `fC ∩ C = ∅`, `γ_jD ∩ γ_kD = ∅`); Theorem 14 at line 423 is "Powers groups are C*-simple". `williams-cpcsa-draft31` (author page, fetched through the service; the file's page index is the printed page plus 12): Theorem D.3 and Lemma D.4 at printed p. 370 (lines 21913–21918: locally compact G, σ-compact H, measurable homomorphisms continuous; Steinhaus `A⁻¹A`), Theorem D.11 p. 372 (line 21995: separable metric groups, G Polish, Borel homomorphisms continuous), Lemma D.20 p. 375 (22158), Theorem D.23 p. 376 (22193: analytic Borel group with nonzero left-invariant σ-finite measure, unique second countable locally compact topology, μ Haar), Proposition D.28 p. 383 (22546: ω on second countable G, ω-representations on separable spaces ↔ representations of G_ω), Lemma D.37 p. 391 (23101), Lemma D.42 p. 395 (23289: weak = strong on U(H), topological group, Polish when H separable), Lemma D.43 p. 395 (23304); every hypothesis matches the README's use at lines 326–402. Theorem 4.22 (Green) p. 132 (line 8422), Lemma 1.61 p. 18, Proposition 3.19 p. 93, Theorem 7.1 (Takai), Lemma 7.8, Theorem 7.13 p. 199 and Corollary 7.18 exist where cited. Theorem 4.24 (Stone–von Neumann) p. 133 is the locator offered in R06. The service created `sources.toml` for this package with these two entries; nothing else was recorded.

**Adversarial table.** One row per statement checked; values on both sides.

| Statement (README line / Lean) | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Modular convention `∫f(xg)dμ = c(g)∫f`, `Δ = c⁻¹` (31–33) | Mathlib `modularCharacter` | `map (·*g) haar = c(g)•haar`, so `∫f(xg) = c(g)∫f`; standard `∫f(xg) = Δ(g)⁻¹∫f` | agree | none |
| Twisted convolution and star (190–191) vs covariant pair (213–215) | `T_f = ∫π(f(s))U_s`; `U_s* = U_{s⁻¹}π̃(ω(s,s⁻¹))*` | `T_fT_g = ∫π(∫f(r)α_r(g(r⁻¹s))ω(r,r⁻¹s)dr)U_s`; `T_f* = ∫π(c(s)ω(s,s⁻¹)*α_s(f(s⁻¹)*))U_s` using `ω(s,s⁻¹) = α̃_s(ω(s⁻¹,s))` (179) | both sides equal | none |
| Inverse identity `ω(s,s⁻¹) = α̃_s(ω(s⁻¹,s))` (179) | cocycle at `(s, s⁻¹, s)` | `α̃_s(ω(s⁻¹,s))ω(s,e) = ω(s,s⁻¹)ω(e,s)`, both normalizations 1 | holds | none |
| `CentralCocycle.cocycle` (Lean 154–156) vs (171) | LHS `α_r(ω(s,t)·α_r⁻¹(ω(r,st)a))` | `= α̃_r(ω(s,t))ω(r,st)a`; RHS `ω(r,s)ω(rs,t)a` | same law | none |
| `.fst`/`.snd` orientation (Lean 176, 181, 187, 190) | Mathlib `DoubleCentralizer.central : snd x * y = x * fst y` | `fst a = m·a`, `snd a = a·m`; README puts ω right in convolution and transport, left (starred) in the involution | matches | none |
| Cochain transport direction (269–275) | `T_b f = f·b` on `(f *_{ω^b} g)` | `ω^b(r,r⁻¹s)b(s) = b(r)α̃_r(b(r⁻¹s))ω(r,r⁻¹s)` | `T_b : ω^b → ω` algebra, as bolded | none |
| `i_G(t)* = ĩ_A(ω(t⁻¹,t)*)i_G(t⁻¹)` (260) and `u_s* = ĩ_A(ω(s⁻¹,s)*)u_{s⁻¹}` (609) | `U_tU_{t⁻¹} = π̃(ω(t,t⁻¹))`, covariance | `U_t* = U_{t⁻¹}π̃(ω(t,t⁻¹))* = π̃(α̃_{t⁻¹}(ω(t,t⁻¹))*)U_{t⁻¹} = π̃(ω(t⁻¹,t)*)U_{t⁻¹}` | agree | none |
| `(fi_G(t))(s) = c(t)f(st⁻¹)ω(st⁻¹,t)` (255) | `g = δ_t`, substitution `r = su⁻¹`, `dr = c(u)du` | `(f*δ_t)(s) = c(t)f(st⁻¹)ω(st⁻¹,t)` | agree | none |
| Regular projective unitary `V_s^ωV_t^ω = Π̃(ω(s,t))V_{st}^ω` (235, 239) | `α̃_{r⁻¹}` of cocycle at `(s,t,t⁻¹s⁻¹r)` | `α̃_{r⁻¹}(ω(s,s⁻¹r))α̃_{r⁻¹s}(ω(t,t⁻¹s⁻¹r)) = α̃_{r⁻¹}(ω(s,t))α̃_{r⁻¹}(ω(st,t⁻¹s⁻¹r))` | agree | none |
| Regular intertwiner `W_bV_s^{ω^b}W_b* = Π̃(b(s))V_s^ω` (602–603) | expand `ω^b(s,s⁻¹r)` | bracket `b(r)ω^b(s,s⁻¹r)α̃_s(b(s⁻¹r))* = b(s)ω(s,s⁻¹r)` | agree | none |
| Bicharacter case `ω((m,χ),(n,ψ)) = ψ(m)` (309–316) | `Π_{(m,χ)}Π_{(n,ψ)}` on `L²(M)` | `χ(x)ψ(x+m)ξ(x+m+n) = ψ(m)·(χψ)(x)ξ(x+m+n)`; `ω(x,x) = χ(m)`, `ω(−x,x) = ω(x,−x) = χ(m)⁻¹` | agree; star `f*(x) = conj(f(−x))ω(x,x)` | none |
| Borel extension check (383–386) | `G = ℤ/2`, `ω(a,a) = −1`, `b(a) = i` | `ω^b(a,a) = i·i·(−1) = 1`; `(1,a)² = (−1,e)` in `E_ω` (order 4); `ψ_b(1,a) = (i,a)`, `(i,a)² = (i·i·(−1),e) = (1,e)`; `ψ_b` is a homomorphism `E_{ω^b} → E_ω` since `ω^b(s,t)b(st) = b(s)b(t)ω(s,t)` | agree | none |
| Twisted regular family `λ^ω_sλ^ω_t = ω(s,t)λ^ω_{st}` (396–398) | cocycle at `(s,t,t⁻¹s⁻¹x)` | `ω(s,s⁻¹x)ω(t,t⁻¹s⁻¹x) = ω(s,t)ω(st,t⁻¹s⁻¹x)` | agree | none |
| Weight-one fiber `F_f(z,s) = conj(z)f(s)` multiplicative (431–432) | `(F_f*F_g)(z,s)` with inverse `(w,r)⁻¹ = (conj(w)conj(ω(r,r⁻¹)),r⁻¹)` | `= conj(z)∫f(r)g(r⁻¹s)ω(r,r⁻¹)conj(ω(r⁻¹,s))dr`; cocycle gives `ω(r,r⁻¹)conj(ω(r⁻¹,s)) = ω(r,r⁻¹s)` | equals `conj(z)(f*_ωg)(s)` | none |
| Orbit representation covariance and kernel (529–535) | `U_gπ(f)U_g*ξ(x)` | `= f(g⁻¹x)ξ(x) = π(α_gf)ξ(x)`; `‖π_p(f)‖ = sup_O|f|`, `ker = {f|closure O = 0}` | agree | none |
| `diagonal_commutant`, `transitive_commutant_scalar` (Lean Orbit 18–40) | `i ≠ j`, `f` with `value f i ≠ value f j`; `I` empty excluded by `[Nonempty I]` | `(value f j − value f i)T_ij = 0 ⇒ T_ij = 0`; `|d i| ≤ ‖T‖`; `U_gTU_g*` diagonal with `d(g⁻¹·i)`, transitivity ⇒ constant | true as stated | none |
| Inequivalence across orbits (546–548) | intertwiner `T : H_p → H_q`, `x ∈ O_p`, `y ∈ O_q` | `(f(x) − f(y))T_yx = 0`, `x ≠ y` ⇒ `T = 0` | agree | none |
| Free orbit = regular representation of `ev_p` (551–556) | `g ↦ g·p`, `ρ = ev_p` | `ρ̃(a)ξ(r) = a(r·p)ξ(r)`, `λ_sξ(r) = ξ(s⁻¹r)`; `⟨δ_g,Π_p(a)δ_g⟩ = a_e(g·p) = E(a)(g·p)` | agree; density ⇔ faithful | none |
| Rotation generators (563–568), `rotation_relation` | `n·x = x − nθ`, `u = U_1`, `v = π(e^{2πit})` | `(uξ)(n) = ξ(n−1)`, `(vξ)(n) = e^{2πi(x−nθ)}ξ(n)`; `uv/vu = e^{2πi(x−(n−1)θ)}/e^{2πi(x−nθ)} = e^{2πiθ}`; K7: `uv = e^{2πiθ}vu` | agree | none |
| Powers partition (653–663), `exists_powers_partition` | `w = ab^L`, `L > max|f|`; `f = b^j`; `F = ∅`; `N = 0` | `wfw⁻¹` reduced starts with `a`, ends with `a⁻¹`; `C` = words starting `b^{±1}`: `gC ∩ C = ∅`; `b^jD` disjoint by leading power; `γ_j = b^jw`; `N = 0` vacuous | true; `hN` unused | R10 |
| Averaging bound (671) | de la Harpe/Powers decomposition `P_jT_j + (1−P_j)T_jP_j` | `‖(1/N)Σλ(γ_j)xλ(γ_j)*‖ ≤ 2‖x‖/√N` | standard, agrees | none |
| Full algebra not simple (701–705) | generator `u`, trivial character | `u − 1 ∈ ker ε`, `(u−1)δ_1 = δ_u − δ_1 ≠ 0` | agree | none |
| `R = ℓ∞(ℤ)⋊ℤ` faithful on `ℓ²(ℤ)` (724–730) | gauge `V_zδ_n = z^nδ_n` | `V_zM_fV_z* = M_f`, `V_zUV_z* = zU`; averaging = `E`, faithful | agree | none |
| Band decomposition (732–737), `finite_band_decomposition` | `f_k(i) = ⟨δ_i,Tδ_{i−k}⟩`, `|i−j| ≤ N` | `Σ_kM_{f_k}U^kδ_j = Σ_k⟨δ_{j+k},Tδ_j⟩δ_{j+k} = Tδ_j`; Lean `Tξ i = Σ_k f k i·ξ(i−k)`; `‖f_k‖∞ ≤ ‖T‖` | agree | none |
| Matrix units `E_ij = M_{1_i}U^{i−j}` (742), `matrix_units` | `E_ijδ_n` | `= δ_i` if `n = j`, else 0; `E_ijE_kl = δ_jkE_il`; `‖E_ij‖ = 1` | agree | none |
| `K(H)` essential, ideals of `R`, `Prim(R)` (746–766) | `T ≠ 0`, `Tδ_j ≠ 0`; `J ≠ 0` closed ideal | `E_iiTE_jj = ⟨δ_i,Tδ_j⟩E_ij ≠ 0` for some `i`; `J ∩ K ≠ 0`, `K` simple ⇒ `K ⊆ J`; hulls: `hull(0) = all`, `hull(J) ⊆ Prim(Q)`; opens `∅`, `{η} ∪ O` | agree; `η` open and dense | none |
| Character obstruction (768–771), `no_character` | `p = M_{1_{2ℤ}}`, zero ring | `UpU* = M_{1_{2ℤ+1}} = 1 − p`; `χ(p) ∈ {0,1}` and `χ(p) = 1 − χ(p)` impossible; zero ring: no ring hom to ℂ | true | none |
| `Z(R) = ℂ1`, not CCR (749–751) | commutant of `ℓ∞` on `ℓ²` | diagonal; `U` forces constant; `1_H ∈` image, `dim H = ∞` | agree | none |
| `C₊`, exact sequence, `B = C₊⋊ℤ` (785–800) | `f = 1_{[0,∞)}`; `ker ℓ₊` | `lim_{−∞} = 0`, `lim_{+∞} = 1`, so `e ∈ B`; `ker ℓ₊ = c₀(ℤ)`; `0→K→B→C(𝕋)→0` by amenability of ℤ | agree | none |
| Irreducibles and `Prim(B) = {η} ∪ 𝕋` (802–811) | restriction to `K` nonzero / zero | standard rep (commutant: `c₀ ⊂ C₊` separates points) / `ev_z∘q`; opens `∅`, `{η} ∪ O` | agree | none |
| Corner `eBe` = Toeplitz (819–825) | `e = M_{1_{[0,∞)}}`, `eUe`, `eM_fe` | `eUeδ_n = δ_{n+1}` (`n ≥ 0`) = `S`; `f|_ℕ` convergent, `= lim·1 + c₀ ∈ T`; `S^n(1−SS*)S*^n = e_n`; `q(e) = ℓ₊(1_{[0,∞)}) = 1`; `BeB ⊇ K` and maps onto `C(𝕋)` ⇒ full | agree | none |
| Saddle flow orbits and quotient (841–852) | `(x,y)` with `xy ≠ 0`; half-axes; ball at `(1,0)`; ball at `0` | orbit = quadrant branch `|xy| = r`, closed; closure of `+x` axis `= axis ∪ {0}`; saturation of `B((1,0),δ)` = `{x > 0, |xy| < δ'}`; saturation of `B(0,δ)` = `{|xy| < δ²}` ∪ axes; `+x` and `+y` neighbourhoods meet in quadrant I | T₀, not T₁, not Hausdorff, as stated | none |
| LCA Weyl commutator (911–914) | `V_χ = π̃(χ)`, `α_s(f)(t) = f(s⁻¹t)` | `U_sV_χU_s* = π̃(t ↦ χ(s⁻¹t)) = conj(χ(s))V_χ`; replacing `χ ↦ χ⁻¹` gives `χ(s)` | agree with 914 and 921 | none |
| Fourier dictionary sign (915–919) | `f̂(t) = ∫f(χ)χ(t)dχ`, multiplier `δ_{χ₀}*f` | `∫f(χ₀⁻¹χ)χ(t)dχ = χ₀(t)f̂(t)`, so the multiplier at `χ₀` goes to `t ↦ χ₀(t)` | agree (positive-character convention) | none |
| Schrödinger pair and uniqueness (926–933) | `U_sξ(t) = ξ(s⁻¹t)`, `V_χξ(t) = χ(t)ξ(t)`; multiplicity 0 | `U_sV_χU_s*ξ(t) = χ(s⁻¹t)ξ(t)`; nondegenerate reps of `K(L²G)` are amplifications of the identity, including the zero space | agree | none |
| Residue-class Cuntz family (1186–1195), `exists_residue_family` | `n = 1`; `n = 0`; `S_j^*b_k` | `n = 1`: `S_0b_k = b_k`, identity; `n = 0` excluded by `0 < n` (sum over `Fin 0` is 0 ≠ 1); `⟨S_jb_m,b_k⟩ = δ_{nm+j,k}` ⇒ `S_j^*b_k = b_{k/n}` iff `k mod n = j`; `S_i^*S_j = δ_ij`; `Σ_jS_jS_j^*b_k = b_k` | agree | none |
| KMS sign (1215–1218), `IsKMS`, `kms_invariant`, `kms_entire_identity` | `A = M_n(ℂ)`, `τ_t = Ad e^{itK}`, `ω = Tr(e^{−βK}·)/Z` | `F(t+iβ) = Tr(e^{−βK}a e^{itK}e^{−βK}be^{βK}e^{−itK})/Z = ω(τ_t(b)a)`; `ω(aτ_{iβ}(b)) = Tr(ae^{−βK}b)/Z = ω(ba)`; wrong model (strip reversed) would give the `−β` state; `A = 0`: `‖φ‖ = 0 ≠ 1`, no KMS state | Gibbs state is β-KMS with the file's sign | none |
| Weyl commutator sign (1322, 1332) | `V = ℝ²`, `σ(e₁,e₂) = 1`, Schrödinger | `W(sf)W(tg)W(sf)* = e^{−istσ(f,g)}W(tg)`; first order gives `[Φ(f),Φ(g)] = iσ(f,g)`; `[x,−id/dx] = i` | agree | none |
| Thermal covariance (1368) | `coth(x/2)` | `(e^x+1)/(e^x−1) = 1 + 2/(e^x−1)` | agree | none |
| `exists_integratedOperator`, `exists_centralIntegratedOperator` (Lean 42–48, 193–199) | non-unitary `U` (drop `hU`); non-integrable `f` | without unitarity the bound `‖T‖ ≤ ∫‖f‖` fails (`U_g = 2·1`); integrability is a hypothesis, so the Bochner junk value 0 does not enter; inner regularity unused | true as stated | R10 |
| `continuous_action` (Lean 29) | `‖α_ga − α_hb‖` | `≤ ‖α_ga − α_ha‖ + ‖a − b‖` (isometry of `StarAlgEquiv`) | true; API lemma | R03 |
| `IsCovariant` (Lean 35–37) | `U_g ∘ π(a) = π(α_ga) ∘ U_g` | same as README 110 | agree | none |

**Ownership against open pull requests** was checked for every open roadmap whose files this brief gives (the sibling checkouts) and the roadmaps on main, by object (Cuntz algebras, uniform Roe algebra, Powers property, KMS states, CAR and Weyl algebras, Stone–von Neumann, Takai duality, Green imprimitivity); the results are in R09 and the citations paragraph.

## Not verifiable

- "Rieffel main pp47–48", "p66 / archive 0209_001 p17", "p137 / archive 0210_026 p10", "physical138", "pp140–142 / archive 0210_026 pp13–15" (README lines 573, 776, 833, 853, 922): no bibliographic entry in the README, no hit for the identifiers on the web, no legal place to read them; the sections' claims that this source contains errors (singleton-projection argument, circle spectrum and CCR, two-point spectrum, single additional irreducible, sum-of-projections argument, reversed neighbourhood containments, opposite exponential signs) are therefore unchecked. See R06.
- Bratteli–Robinson vol. 2 (Theorems 5.3.10, 5.3.30, 5.4.4, 6.2.4, 6.2.18, 6.2.40, 6.2.42, Proposition 6.2.45) and vol. 1 (Lemma 4.1.19 to Theorem 4.1.25): paywalled, cited by locator only; the D7–D9 statements that rest on them are inherited from main and were checked for internal consistency (KMS sign, thermal covariance, Weyl commutator) but not against the text.
- Renault, LNM 793, and Renault Chapter III Proposition 2.7: paywalled, cited by locator only.
- Takeishi Theorem 5.4, Muhly–Williams Theorems 5.5 and 7.8, Sims–Williams Theorems 13 and 17, Sims' notes §§4–5: inherited from main and outside the seeded sample; not opened in this round.

## Source issues

- none
