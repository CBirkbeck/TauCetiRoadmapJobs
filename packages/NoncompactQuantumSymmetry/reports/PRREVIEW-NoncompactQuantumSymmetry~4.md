# Review of NoncompactQuantumSymmetry (pull request #1015 at 46b0fee)

**Verdict:** needs changes

Full re-review of the repaired head. The gate passes every check (`build=0` with the module header), `lake env lean` on `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean` reports exactly five `declaration uses sorry` warnings and nothing else, the dependency check prints `depcheck: 239 roadmaps, 2360 edges, 0 problem(s)`, and the previous review's blocking finding is repaired: the Polish unitary group, Pettis's theorem, the Mackey–Weil topology on `E_ω`, the strong-Borel correspondence, `λ^ω`, the fibres `J_k(E_ω)` and the abelian Fourier isomorphism are now consumed from OperatorAlgebraDynamics D1.BorelPrefix, D1.TwistedBorel and D4.Harmonic, which at the head of that roadmap's open revision claims exactly these objects and leaves `UA(H)`/`PU(H)`/`PUA(H)`, the Borel-versus-locally-continuous multiplier comparison and the all-weight decomposition to this roadmap. Eight of the nine previous findings are repaired (list below). The fifteen sampled targets recompute (table). No P1 or P2 finding. Five P3 findings: two of the newly added Checks are wrong as written (one proves its point with a non-example that is not a Lie module, one computes the wrong normalizer action), one supplier citation has drifted (AutomorphicFormsOnReductiveGroups §2.1 no longer owns the compact-finite predicate it is cited for), the three OperatorAlgebraDynamics ids exist only at that roadmap's open revision and the pull request does not name it, and the size finding is unrepaired.

## Previous findings (review at 1a39856)

- **R01 (P2, two owners of the Borel and Fourier objects): repaired.** `README.md:19` now reads "OperatorAlgebraDynamics D1.BorelPrefix for the Polish strong-operator unitary group `U(H)_s` … D1.TwistedBorel for the single-weight fibres … D4.Harmonic for the Fourier isomorphism … These are consumed at P.2, M1, M2 and Layer 0 and are not restated"; `:29` is the matching supplier-table row; Layer 0 (`:138–146`) consumes D4.Harmonic and keeps only the comparison with V11; P.2 (`:252–261`) consumes `U(H)_s`, the criterion for maps, Pettis and lcsc-implies-Polish and owns only the graded and projective groups; M1 (`:1366–1373`, `:1393–1401`, `:1430–1438`) consumes the Mackey–Weil topology, `λ^ω` and the strong-Borel correspondence; M2 (`:1670`, `:1676`) consumes the extension and the fibres and keeps the all-weight decomposition; the Downstream paragraph that had OperatorAlgebraDynamics consuming from here is deleted. OperatorAlgebraDynamics at its open head (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:36–47`, `:57–66`) states the same split from its side. The residual on the pull-request side is R01 below.
- **R02 (P3, `polishSpace_of_locallyCompactSpace`): repaired.** The declaration and `continuous_of_measurable_hom` are gone; the docstring (`Suggested.lean:13–15`) says both are supplied by D1.BorelPrefix.
- **R03 (P3, module header): repaired.** `Suggested.lean:1–3` is `module` / `public import Mathlib`, `:56` is `@[expose] public section`; the worker's gate reports `build=0`.
- **R04 (P3, M-layer Checks and Needs): repaired in form.** `**Checks.**` lists now exist at `README.md:688` (`IsKFinite`, admissibility), `:712` (the `(𝔤_ℂ,K)`-module), `:1092` (systems of imprimitivity), `:1654` (the regular orbit space and little-group data), `:2180` (Pauli–Lubanski), `:3650` (`DNC(G,H)`), `:6126` (the kinematical bracket); each M0 bridge (`:784`, `:956`, `:1014`, `:1053`) and each M4 block (`:2209`, `:2268`, `:2281`, `:2297`, `:2311`, `:2368`, `:2384`, `:2390`, `:2502`, `:2520`, `:2628`, `:2865`, `:3068`, `:3309`, `:3545`) has a `*Needs:*` line. Two of the new Checks are wrong (R02, R03 below).
- **R05 (P3, docstring and the kinematic normal form): repaired.** `Suggested.lean:45–49` names the eleven-case normal-form theorem as omitted and says why.
- **R06 (P3, `inducedHilbertSpace`): repaired.** The alias is gone; `Suggested.lean:190` and `:193` use `MeasureTheory.Lp K 2 d.measure`; `README.md:1198` names the native carrier.
- **R07 (P3, transcription narrative): repaired.** A grep for faint, provisional, illegible, scan, glyph, transcription, handwriting, indeterminate and overwritten finds nothing; `:3559`, `:3570–3574`, `:9114`, `:9120`, `:9123` and `:9155` now state the mathematics only.
- **R08 (P3, Primet pages): repaired.** `:5897` reads "§2.7 (printed p.12), §4 (printed p.14) and the contraction theorem following §4 (printed pp.15–16)". Checked: `Primet1983 line 352` (§2.7, PDF page 13 = printed p.12), `line 403` (§IV, PDF page 15 = printed p.14), `line 430–446` (§V and the Théorème, PDF pages 15–16 = printed pp.14–16).
- **R09 (P3, size): not repaired.** The README is now 9,168 lines (667 kB), 130 more than at the previous review (R05 below).

## R01 (P3) — The three OperatorAlgebraDynamics ids exist only at that roadmap's open revision, which the pull request does not name

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:19`, `:95`, `:138`, `:178`, `:252`, `:1081`, `:1366`, `:1392`, `:1429`, `:1670`, `:1676`, `:1694`, `:1981`, `:4071` (every citation of D1.BorelPrefix, D1.TwistedBorel or D4.Harmonic), and the pull request's description.

**Claim:** the citations resolve on main.

**Witness:** OperatorAlgebraDynamics on main has sections D1–D9 only (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:75`, `:143`, `:205`, `:254`, …); none of the three ids occurs there. They are defined only at the head of its open revision (`README.md:698` D1.BorelPrefix, `:804` D1.TwistedBorel, `:1624` D4.Harmonic), as the worker's overlap report also says. Citing a revision's numbering makes it a dependency; the pull request's "Revisions of roadmaps on main whose numbering this roadmap cites" line names only the SmoothBanachRepresentations revision, and its merge-order paragraph does not name the OperatorAlgebraDynamics revision either.

**Repair:** nothing changes in the folder. The pull request names the OperatorAlgebraDynamics revision in its revision-dependencies line (next to the SmoothBanachRepresentations one), so that it merges first. That is the step the previous review's R01 repair described and the only part of it not carried out.

## R02 (P3) — The DNC normalizer Check computes the wrong action on the normal bundle

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:3660–3663` ("the elements A and B=−A of the Examples normalize H and act on the normal bundle `𝔤/𝔥=span{J_(a,3):a≠3}` by −1, since each `J_(a,3)` has exactly one reflected index; they send the null representative `(0,0,r,r)` to `(0,0,−r,−r)`") and `:6180` ("A=diag(−1,1,1,1) and B=−A send (0,0,r,r) to (0,0,−r,−r)").

**Claim:** the normalizing element acts on `𝔤/𝔥` by the scalar −1, each `J_(a,3)` having exactly one reflected index, and both A and B send the null representative to its negative.

**Witness:** the normalizing element is one element w, the lift of the rotation by π in `span(e₀,e₃)` (`:4821–4823`): on ambient `ℝ⁵` it is `diag(−1,1,1,−1,1)`. For a diagonal sign matrix `Ad(w)J_(a,b)=w_a w_b J_(a,b)`, so `Ad(w)J_(a,3)=−w_a J_(a,3)`: `J_(0,3)` has both indices reflected and is fixed, while `J_(1,3)`, `J_(2,3)`, `J_(4,3)` are negated. On the normal bundle w therefore acts by `B=diag(+1,−1,−1,−1)=−A`, exactly as the constraint block says (`:4822–4823`, `:4837–4838`), not by −1; and A, the action on the retained Lorentz coordinates, fixes `(0,0,r,r)`: only B sends it to `(0,0,−r,−r)`. An element acting by −1 on all of `𝔤/𝔥` would have `w_a=−w_3` for a=0,1,2,4, that is `±diag(1,1,1,−1,1)`, which is not in `SO₀(4,1)` (determinant −1, or time reversal). The conclusion of the Check (labels `(ε_E,ℓ)` and `(−ε_E,−ℓ)` exchanged, physical helicity preserved) is right, because `B` negates the two nonzero components and `Ad(A)` negates `J₀₁`; the reasoning offered for it is false.

**Repair:** replace the third Check by: "Normalizer transport: the lift w of the rotation by π in `span(e₀,e₃)` is `diag(−1,1,1,−1,1)` on `ℝ⁵`; it normalizes H, acts on the retained Lorentz coordinates by `A=diag(−1,1,1,1)` and, since `Ad(w)J_(a,3)=−w_aJ_(a,3)`, on the normal bundle `span{J_(a,3):a≠3}` by `B=−A=diag(1,−1,−1,−1)`, fixing `J_(0,3)` and negating the other three. B sends the null representative `(0,0,r,r)` to `(0,0,−r,−r)` and `Ad(A)` negates `J₀₁`, so the labels `(ε_E,ℓ)` and `(−ε_E,−ℓ)` are exchanged and the physical helicity `ε_Eℏℓ/2` is preserved; a scalar action −1 on `𝔤/𝔥` is not realized by any element of `SO₀(4,1)` normalizing H." In the Examples (`:6180`) write "B=−A sends (0,0,r,r) to (0,0,−r,−r), while A fixes it".

## R03 (P3) — The negated-action "wrong model" of the `(𝔤_ℂ,K)`-module Check is not a Lie module

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:717–719` ("Replacing the `𝔤_ℂ` action of that module by its negative keeps the Ad(K)-compatibility … but breaks the equality of the differentiated K-action with the 𝔨-action (`Xv≠−Xv` for X≠0), so that equality is a genuine condition").

**Claim:** the negated action is a `(𝔤_ℂ,K)`-module satisfying every axiom except the equality of the differentiated K-action with the 𝔨-action.

**Witness:** for `𝔤_ℂ=sl(2,ℂ)` on ℂ² with the standard `e,f,h`, the negated map `ρ′(X)=−X` has `ρ′([e,f])=−h` while `[ρ′(e),ρ′(f)]=[e,f]=h`; so ρ′ is not a Lie-module action (it is an anti-representation) and the Check does not exhibit a Lie module violating only the stated equality. A valid separating instance exists: on `V=ℂ²⊗ℂ²` let `sl(2,ℂ)` act by `ρ⊗1` and `K=SU(2)` by `π(k)=ρ(k)⊗ρ(k)`. Then `π(k)(X⊗1)π(k)⁻¹=Ad(k)X⊗1`, the Ad(K)-compatibility holds and V is a Lie module, but the differentiated K-action is `ρ(Y)⊗1+1⊗ρ(Y)`, which differs from the 𝔨-action `ρ(Y)⊗1` for every `Y≠0`. (For a module on which the `𝔤_ℂ` action is irreducible and 𝔨 is semisimple the equality is automatic: differentiating the compatibility gives that `dπ(Y)−ρ(Y)` commutes with `ρ(𝔤_ℂ)` and is a Lie homomorphism from 𝔨 into the scalars, hence zero; so the ℂ² example itself cannot separate the two conditions.)

**Repair:** replace the second Check by the `ℂ²⊗ℂ²` instance above (or by `K=U(1)` acting on ℂ by `e^{inθ}`, n≠0, with `𝔤=𝔨=so(2)` acting by zero: compatibility holds since the algebra is abelian, the differentiated K-action is `in≠0`).

## R04 (P3) — AutomorphicFormsOnReductiveGroups §2.1 is cited for objects it now delegates to CompactGroups Layer 5

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:9` ("AutomorphicFormsOnReductiveGroups §2.1 for the topology-free finite-orbit-span predicate, submodule and elementary equivariant-map API, and its strongly continuous compact-group Banach density theorem"), `:674` ("Consume the topology-free algebraic prefix of AutomorphicFormsOnReductiveGroups §2.1: its `IsGFinite`, `gFiniteSubmodule`, addition, scalar, invariance and equivariant-map APIs are the common owner. Here `IsKFinite π K v` abbreviates …"), `:965–968`, `:1015`, `:1075`.

**Claim:** §2.1 of that roadmap owns the predicate, the submodule API and the Banach density theorem.

**Witness:** at the head of its open pull request, §2.1 (`TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:302`) says "The topology-free prefix is supplied by CompactGroups Layer 5 (`gap:banach-gfinite-density`): … `IsGFinite(ρ,v)` … `gFinite_add`, `gFinite_smul`, … `gFiniteSubmodule` … `gFinite_map`. … nothing of it is restated here", its ownership table assigns "Field-general orbit-span predicate, submodule and elementary equivariant-map API" and "Arbitrary-compact strongly continuous complex Banach density (`gFiniteSubmodule_dense`)" to CompactGroups Layer 5 under that declared gap, and keeps for itself only the orbit-span comparison with native continuous representations and the locally convex extension; the same section defines `IsKFinite` and `kFiniteSubmodule` as its abbreviations on the restriction to K (`:302`), which `README.md:674` presents as this roadmap's own abbreviation. The citation therefore points at a section that does not make the statement; the earliest owner is CompactGroups Layer 5 (on main), where the objects are a gap declared by that roadmap.

**Repair:** at `:9`, `:674`, `:965–968`, `:1015` and `:1075` cite CompactGroups Layer 5 (the gap `banach-gfinite-density` declared by AutomorphicFormsOnReductiveGroups §2.1) for `IsGFinite`, `gFiniteSubmodule`, the addition/scalar/invariance/equivariant-map API and `gFiniteSubmodule_dense`, and AutomorphicFormsOnReductiveGroups §2.1 only for the comparison of the orbit span with `(π.restrict K.subtype).toRepresentation` and for the abbreviation `IsKFinite`, which is that roadmap's name, not one introduced here. The supplier table (`:92–105`) gains the CompactGroups row.

## R05 (P3) — Size

**Location:** the folder: 9,168 README lines (667 kB), of which M5 is 2,630 lines and M6 2,955.

**Witness:** unchanged in substance since the previous two reviews; the repair added 130 lines and split nothing.

**Repair:** as before: move the all-sequence contraction tables (M5.DeSitterNullZero, M5.DeSitterRemainingTransitions, M5.StructuralModelComposition) and the M6 pair, exchange and tree tables into "NoncompactQuantumSymmetry, Part II", whose introduction says that the base roadmap stops at M5.DeSitterFiber and the M6.MeasuredPair interface.

## Verified sound

**Gate and build.** The worker's gate at 46b0fee prints every check at 0 and `OK`, including `build=0`, `outside-folder=0`, `depcheck=0`, `readme-ids-missing=0`, `statement-hygiene=0`. `git diff --stat origin/main...HEAD` outside the folder is empty and the worktree is clean. `lake env lean TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean` (8.8 s) reports `declaration uses sorry` at lines 75, 88, 100, 116, 189 and nothing else. The file has one module docstring, `theorem` only, no `set_option`, no sorried data; its imports are `public import Mathlib` alone. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.

**Dependency check.** `tauceti-roadmap gate --depcheck … --movable --content …` on this README prints `depcheck: 239 roadmaps, 2360 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. OperatorAlgebraDynamics is on main and lists this roadmap only as a consumer (`README.md:58–66`, `:1140`, `:2880–2888` at its open head); its `*Needs:*` lines cite nothing here. QuantumFoundations (merge order line 203 against this roadmap's 145) and RelativisticQuantumFieldTheory (open, `README.md:242`, `:1569`) consume this roadmap and are cited here only as consumers (`:23`, `:9148`). QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups consumes M0 item 1 (`README.md:244`, `:585`) and builds no object of this roadmap.

**Signatures and the one-tactic probe.** On a scratch copy I replaced each of the five `sorry`s by `first | rfl | simp | infer_instance | (exact?)` and appended `#check @name` for all ten declarations. None closed (`exact?` fails on `wigner_reconstruction`, `whitehead_one`, `whitehead_two`, `exists_polishTopology_continuousSMul`; `InducedModelData.exists_inducedRepresentation` is left with its goal). Every elaborated type matches its README statement and is unchanged from the previous review for the eight surviving declarations; the worker's five "looks dropped" leads are all the coercion `↑H` of `[IsClosed (H : Set G)]`, which is present in each type.

**Headline audit.** Headlines named by the README: Wigner (P.1, stated), the two Whitehead lemmas (P.4, stated), the Polish realization (M1, stated), the induced representation on `Lp` (M1, stated); imprimitivity, the Mackey classification, the particle classifications, the de Sitter dual and contractions, the tensor tables, the GCR/type-I bridge, admissibility, CCR, the permutation sectors and the kinematic normal form are named in the docstring with the missing carrier (`Suggested.lean:17–55`); Pettis and lcsc-implies-Polish are correctly named as supplied. No projection-valued-measure or completed-Hilbert-tensor carrier exists at the pins (checked at the previous reviews; the pins are unchanged). No padding: the five statements are the roadmap's end theorems or its acceptance test of M1.

**Source locators read this round.** `Primet1983 line 352` (§2.7, two-sheeted hyperboloid `H_p`, PDF p.13 = printed p.12), `line 375–382` (the isometry `f↦f(px)` and the realization of `U_{u,λ}` on `L²(H_p,V_u)`, printed p.13), `line 403–429` (§IV, the realization of `ℝ^{n+1}⋊SO₀(1,n)` on `H_p^±` by Mackey's method with the sections `a(ξ/p)` and `wa(·)w`, printed p.14), `line 430–446` (§V and the Théorème: `lim_{r→0} U_{u,−p/r}∘π_r(v,h)f = ρ⁺_{p,u}f⁺+ρ⁻_{p,u₁}f⁻`, `u₁(m)=u(wmw)`, pointwise a.e. and uniform on compacts, printed pp.14–15): the README's `λ_r=−m/r`, `u₁(k)=u(wkw)` and "pointwise almost everywhere … uniform on compact group-variable sets" (`:5899–5903`) are the source's statement. `GelfandNaimark1947`, `Dixmier1961`, Freed, Neeb, Wagemann–Wockel, Brennich, Echterhoff, Möllers–Oshima, Groenevelt and the DLMF entries were read at the previous full review; the passages they certify are untouched by the change. Banerjee 2018 is cached (arXiv 1801.10171v3): its §IV "(3+1) Dimensions" (`line 55–59`, printed p.21–27) is the null-momentum little-group construction and Lorentz action the README compares with at `:2473–2476`.

**Cross-roadmap citations resolved this round** (every one re-resolved against main or the open head the brief lists):

| Citation | Where it resolves |
| --- | --- |
| OperatorAlgebraDynamics D1.BorelPrefix / D1.TwistedBorel / D4.Harmonic | open revision only: `README.md:698`, `:804`, `:1624`; scope `:36–47`, `:57–66` leaves `UA/PU/PUA`, the multiplier comparison and the all-weight decomposition here (R01) |
| OperatorAlgebraDynamics D1, D3, D5, D8 | main `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:75`, `:205`, `:277`, `:554` |
| SmoothBanachRepresentations Layers 0–4 | #1145 `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md:76`, `:120`, `:185`, `:227`, `:286` (its line 11 still says this roadmap builds the Gårding space directly, which is stale on its side) |
| AutomorphicFormsOnReductiveGroups §2.1 | open head `README.md:300–336`: delegates the predicate and density to CompactGroups Layer 5 (R04); names this roadmap only as a consumer (`:1313`) |
| CompactGroups Layer 5 | main `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:318` (Peter–Weyl; the gap's owner) |
| LieGroups Layers 0–5, 7, 9 | main `RepresentationTheory/LieGroups/README.md:233`, `:261`, `:275`, `:300`, `:326`, `:358`, `:407`, `:448` |
| PseudodifferentialOperators P5/P6 | main `PseudodifferentialOperators/README.md:927`, `:1484` |
| RiemannianGeometry R1/R2/R4, HopfRinow | main `RiemannianGeometry/README.md:179`, `:300`, `:607`; `Completed/HopfRinow` |
| SelfAdjointSpectralTheory SA-B85 | main `OperatorTheory/SelfAdjointSpectralTheory/README.md:132` |
| VonNeumannAlgebras Layers 2, 3, 4, 11 | main `VonNeumannAlgebras/README.md:523`, `:905`, `:970`, `:2785` |
| LieGroupoidsPoisson G0 | main `LieGroupoidsPoisson/README.md:259`, `:261` |
| AffineLieAlgebras A1 | main `AffineLieAlgebras/README.md:150` |
| InductionRestriction 2.1, `Gassmann.almostConjugate_iff_permutation_equiv` | main `RepresentationTheory/InductionRestriction/README.md:198`, `:378` (the worker's "Lean name found nowhere" lead is that roadmap's planned name, cited as such) |
| CStarAlgebras C1/C2 | #860 `TauCetiRoadmap/CStarAlgebras/README.md:234–497`, `:544`, `:568` |
| HilbertModules H3/H5 | #861 `TauCetiRoadmap/HilbertModules/README.md:262`, `:356` |
| UnboundedOperators UO-B04/B05/E03 | #1027 `OperatorTheory/UnboundedOperators/README.md:295`, `:313`, `:716` |
| MetaplecticAutomorphicForms Layer 0, 0.1, 0.5–0.8, 0.13 | #1063 `README.md:76`, `:78`, `:120` (read through `roadmaps show`) |
| LaguerreJacobi Parts A/B | #117 `README.md:220`, `:278` |
| QuantumFoundations, RelativisticQuantumFieldTheory (consumers) | #1771 `README.md:22`, `:65–66`; #1772 `README.md:242`, `:1569` |

The worker's other three "Lean names found nowhere" (`InducedModelData.rnDerivative`, `.sectionAction`, `.exists_inducedRepresentation`) are declared in `Suggested.lean:175`, `:180`, `:189`.

**Pinned declarations opened.** Tau Ceti `Algebra/Lie/HighestWeight/CompleteReducibility.lean:259` (`exists_isCompl_of_isKilling`), `GroupTheory/GroupExtension/Of/FactorSet.lean:96` (`FactorSet`), `RepresentationTheory/ProjectiveRepresentation/Extension.lean` (`isProjectiveRepEquivExtensionHom`), `LinearAlgebra/CliffordAlgebra/RealForm/ThreeOne.lean:35` and `Spin/Real/ThreeOne.lean:23` (the Hermitian model and the `Spin(3,1)≃SL(2,ℂ)` equivalence), `RepresentationTheory/Symmetric/TensorAction/Basic.lean:59` (`reindexRepresentation`): all present at the pin. Mathlib `Algebra/Lie/Cochain.lean` (`d₁₂`, `twoCocycle`), `LinearAlgebra/Projectivization/Basic.lean` (`map`), `MeasureTheory/Constructions/Polish/Basic.lean` (`QuotientGroup.borelSpace`, `Measurable.measurableEmbedding`, `MeasurableSet.isClopenable`), `Topology/MetricSpace/Polish.lean` (`PolishSpace.iInf`): as at the previous reviews.

**Ownership by object.** Searched the open heads the brief lists and main for the objects of the repaired and sampled passages: Wigner's theorem, the graded/projective unitary groups and their local sections, Borel multipliers versus locally continuous ones, the all-weight decomposition of `C*(E_ω)`, the imprimitivity theorem and the Becker–Kechris realization, the regular Mackey machine, the Galilei/Bargmann, Poincaré and de Sitter duals, the `SL(2,ℝ)` Plancherel formula, the deformation groupoid and the Poincaré tensor tables. The only other owner found for any of them is OperatorAlgebraDynamics, now cited (R01); QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups requests the real Plancherel formula from AutomorphicSpectralTheory as a gap and builds none of these. No readable `Suggested.lean` declares a `TauCetiRoadmap.NoncompactQuantumSymmetry.*` name. Ownership against open pull requests whose files the brief did not give me (AutomorphicFormsOnReductiveGroups, MetaplecticAutomorphicForms, LaguerreJacobi were read through `roadmaps show` only) was not checked beyond that.

**Overlaps.** No other open pull request changes this roadmap; no id this README cites is dropped by an open pull request; no id this pull request drops is cited elsewhere; the three ids defined only by the OperatorAlgebraDynamics revision are R01.

**Seeded sample.** All fifteen blocks read; each recomputes (table rows 99–118).

| Target | Outcome |
| --- | --- |
| M2.RectangularField (`:1838`) | row 108; the diagonal-in-the-bicommutant argument via `I_U` approximate units and the `1⊗X` compression adapter are complete as stated |
| Galilei multiplication, multipliers and the Bargmann extension (`:2008`) | rows 99–100; the cocycle identity and trivial centre recomputed |
| Full genuine irreducible classification (`:2059`) | rows 101–103 |
| M4.P (`:2270`) | row 104; Lang Ch. VIII paywalled (not source-certified) |
| M4.Lorentz (`:2283`) | rows 105–107; `GelfandNaimark1947` Eqs. 187, 194 and the footnote as at the previous review |
| Specified model limits (`:3665`) | row 118 |
| Little-group spectra and countability (`:3838`) | row 109 |
| Explicit little-dual Borel charts and the generic M2 base (`:4053`) | row 110 |
| M5.UniformZeroModel (`:4606`) | row 111 |
| DNC normalizer constraint (`:4813`) | row 112 (the constraint block is right; the new Check contradicts it, R02) |
| M5.UniformLorentzUpper (`:4859`) | row 113 |
| M5.StructuralModelComposition (`:5728`) | row 114 |
| Past/past (`:6565`) | row 115 |
| A massive input and an opposite null input (`:6765`) | row 116 |
| Continuous spin; every spacelike little representation (`:7219`) | row 117 |

**Computed adversarial table.** Rows 1–86 of the review at 777a2fe and rows 87–98 of the review at 1a39856 carry forward for every statement the change leaves untouched (rows 87–88 concern a statement now supplied by OperatorAlgebraDynamics). New rows:

| # | Statement | Instance | Values on the two sides | Result |
| --- | --- | --- | --- | --- |
| 99 | Galilei cocycle `τ(g₁,g₂)=v₁·R₁a₂+(t₂/2)|v₁|²` | general g₁,g₂,g₃ | `τ(g₁,g₂)+τ(g₁g₂,g₃)` and `τ(g₂,g₃)+τ(g₁,g₂g₃)` both equal `v₁·R₁a₂+(t₂/2)|v₁|²+v₁·R₁R₂a₃+v₂·R₂a₃+t₃v₁·R₁v₂+(t₃/2)(|v₁|²+|v₂|²)`, using `R₁v₂·R₁R₂a₃=v₂·R₂a₃` | Pass |
| 100 | proper Galilei centre trivial; cover centre {±1} | `(1,0,0,t)` against `(1,v′,0,0)` | products `(1,v′,0,t)` and `(1,v′,tv′,t)`: equal iff t=0; rotations force v=a=0, R=1 | Pass |
| 101 | `α_(R,v)(z,a,t)` | conjugation in the extension | `(0;R,v,0,0)(z;1,0,a,t)=(z+v·Ra+t|v|²/2;R,v,Ra+tv,t)`, times `(R⁻¹,−R⁻¹v,0,0)` with cocycle 0 gives `(z+v·Ra+t|v|²/2;1,0,Ra+vt,t)` | Pass |
| 102 | dual action and invariant | `χ_(m,p,E)∘α_(h⁻¹)` | exponent `mz−(mv+Rp)·a+(E+Rp·v+m|v|²/2)t`; `E′−|p′|²/2m=E−|p|²/2m` | Pass |
| 103 | orbit table stabilizers | (m,0,U); (0,re₂,0); (0,0,E) | `Rp+mv=0` with p=0 ⇒ v=0, SO(3); `Rp=p`, `p·v=0` ⇒ `ℝ²⋊SO(2)`, energy `E+r e₂·v` unbounded; all of H | Pass |
| 104 | M4.P compact-line induction | n=0; D₁ | discrete sum over `2≤l≤0` empty; `q_B(D₁)=1(2−1)/4=1/4=(1+0²)/4=q_B(I_(1,0))`, consistent with `I_(1,0)=D₁⁺⊕D₁⁻` | Pass |
| 105 | M4.Lorentz character dictionary | `ζ=e^(−t/2−iθ)` | `diag(ζ⁻¹,ζ)=m_θa_t`; `r^(iρ)e^(−inφ)=e^(−iρt/2)e^(inθ)` ⇒ m=n, λ=−iρ/2; `r^(2s)=e^(−st)` ⇒ λ=−s; `δ_P(a_t)=|det Ad(a_t)|_ℂ|=e^(2t)` | Pass |
| 106 | Eq. 188 operator comparison | `α(g)=(g⁻¹)ᵀ=[[d,−c],[−b,a]]` | `π_λ(α(g))φ(z)=|d+bz|^(−2−2λ)φ((az+c)/(bz+d))`, the displayed formula; Jacobian `|a−cz|^(−4)` makes `|·|^(−2−2iρ)` unitary | Pass |
| 107 | complementary kernel positive | `|z|^(−α)` on ℝ², α=2−2s | Fourier transform `π^(1−2s)Γ(s)/Γ(1−s)|ξ|^(−2s)`, positive for 0<s<1; equals `c_s/C` of M4.Riesz | Pass |
| 108 | M2.RectangularField | A=ℂ⊕ℂ, μ counting, multiplicities M₁,M₂ | `π(A)″=B(ℂ)⊗1⊕B(ℂ)⊗1=ℂ²` contains the diagonal L∞; `π(A)′=1⊗B(M₁)⊕1⊗B(M₂)`; central projections `1_U` for U={1},{2} | Pass |
| 109 | little-group spectra | H=SL(2,ℝ) | CCR ⇒ GCR ⇒ class↦kernel injective, Fell=hull-kernel; `C*(H)` separable ⇒ Prim second countable ⇒ Ĥ second countable | Pass |
| 110 | little-dual Borel charts | d=1, D dense | `Rep₁(H)=Hom_cont(H,𝕋)` closed in `C(H,𝕋)` with compact-open topology; evaluation structure = Borel structure of that Polish topology by suprema over `D∩K_j` | Pass |
| 111 | UniformZeroModel window | `η_k=δ_k^(1/2)`, `R_k=δ_k^(−1/4)` | `E∈[δ_k^(3/4),δ_k^(1/4)]`; `δ_k/(η_k/R_k)=δ_k^(1/4)→0`; `η_kR_k=δ_k^(1/4)→0` | Pass |
| 112 | DNC normalizer action | `w=diag(−1,1,1,−1,1)` | `Ad(w)J_(a,3)=−w_aJ_(a,3)`: +1 for a=0, −1 for a=1,2,4 ⇒ `B=diag(1,−1,−1,−1)=−A`; `B(0,0,r,r)=(0,0,−r,−r)`, `A(0,0,r,r)=(0,0,r,r)`; `Ad(A)J₀₁=−J₀₁` | constraint block Pass; Check `:3660–3663` Fail (R02) |
| 113 | UniformLorentzUpper kernel argument | F closed, `I_F=∩_(Λ∈F)kerΛ` | `π̄(ι_L(x))=Res_Lπ(x)=0` for x∈I_F ⇒ `π(aι_L(x)b)=0` ⇒ `π(J_F)=0`; hull(J_F) closed ⇒ `ρ(J_F)=0` ⇒ `Res_Lρ(I_F)=0` ⇒ `Supp Res_Lρ⊆hull(I_F)=F` | Pass |
| 114 | StructuralModelComposition diagonal | `N_J` with `B_(n,j)<2^(−J)` for n≥N_J, j≤J | `J(n)=max{J:N_J≤n}` nondecreasing, unbounded; error on first J(n) vectors `<2^(−J(n))→0`; at most four `(ε,h)` pairs | Pass |
| 115 | Past/past | `ι(a,A)=(−a,A)` | `ι((a,A)(b,B))=(−a−A·b,AB)=(−a,A)(−b,B)`; `e^(ip·a)∘ι=e^(−ip·a)`; stabilizer of −p = stabilizer of p; `F_(h₁)⊗F_(h₂)`: `J_z=h₁−h₂` in the centre-of-mass frame, so `J≥|h₁−h₂|` once each | Pass |
| 116 | massive ⊗ opposite null | `p₁=(0,0,0,m)`, `p₂=(0,0,E,−E)`; j=h=½, ε_E=+ | `q=(m−E)²−E²=m²−2mE`: timelike 0<M<m for E<m/2, spacelike every r>0 for E>m/2; weights `2(a−h)∈{0,−2}`: `B_(2,−)=1`, `B_(l,+)=0`, principal `2j+1=2`, matching `Ind_Kχ₀⊕Ind_Kχ_(−2)=∫I_(0,iν)dν⊕∫I_(0,iν)dν⊕D₂⁻` of M4.P; j=h=0 gives no discrete term | Pass |
| 117 | spacelike ⊗ continuous spin | `p_s=(0,0,r₀,0)`, `p_n=(0,0,−s/r₀,ε_E|s|/r₀)` | `q(p_n)=0`, `p_s·p_n=s`, `q(p_s+p_n)=−r₀²+2s`; `v=p_n+(s/r₀²)p_s` has `v·p_s=0`, `q(v)=s²/r₀²`; `0<r<r₀⇔0<s<r₀²/2`, `r>r₀⇔s<0`; Res to Spin(2): τ=1 gives weight 0 once ⇒ `d_τ=1` and multiplicity `2J+1`; infinite-dimensional τ has infinitely many K-types ⇒ ∞ | Pass |
| 118 | specified model limits, trivial family | `π_(R_n)(f)=∫_(G_(1/R_n))f` | Haar-system continuity gives `→∫_(G_0)f=1_(G_0)(f)`; `Supp(1)⊆Lim⊆Clust`; exactness needs the separate `limsup‖π_R(f)‖≤‖ρ(f)‖` bound, as the block says | Pass |
| 119 | M0 Checks (`IsKFinite`, admissibility) | `L²(SU(2))` left regular; K={1} on `L²(ℝ)` | Peter–Weyl: `H_τ`=matrix coefficients, dim `(dim τ)²`, multiplicity dim τ, each finite; K={1}: one type, multiplicity dim H=∞ ⇒ not admissible | Pass |
| 120 | `(𝔤_ℂ,K)` Check 2 | `ρ′=−ρ` on `sl(2,ℂ)`; `ρ⊗1` with `π=ρ⊗ρ` on ℂ²⊗ℂ² | `ρ′([e,f])=−h≠h=[ρ′e,ρ′f]`: not a Lie module; `π(k)(X⊗1)π(k)⁻¹=Ad(k)X⊗1` holds, `dπ(Y)=ρ(Y)⊗1+1⊗ρ(Y)≠ρ(Y)⊗1` | Fail as written (R03); replacement Pass |
| 121 | `(𝔤_ℂ,K)` Check 3 | K=O(2), 𝔨=so(2) on ℂ² | `R_θJ=JR_θ` for the so(2) generator J; `R_θS=SR_(−θ)≠SR_θ` for θ∉πℤ | Pass |
| 122 | M1 Checks (systems of imprimitivity) | `(U_tf)(x)=f(x−t)`, `E(B)=1_B`, B=[0,1], t=1 | `U_1E(B)U_1⁻¹f(x)=1_B(x−1)f(x)=1_([1,2])f(x)=E(1·B)f` | Pass |
| 123 | M2 Checks | shear; χ̃ negative control | orbits `ℝ×{b}` (b≠0) and points `(a,0)`; `χ̃((0,h)(n′,1))=χ(−n′)=e^(−in′)≠e^(in′)` for H=ℤ/2 by negation | Pass |
| 124 | Pauli–Lubanski Checks | `P=(0,0,0,m)`; `(0,0,ε_Er,ε_Er)`; `(0,0,r,0)` | `W=(mĴ₀,mĴ₁,mĴ₂,0)`, `W_μW^μ=−m²Ĵ²`; `W=ε_Er(Ĵ₀+K₁,Ĵ₁−K₀,Ĵ₂,Ĵ₂)` so `W^2=W^3=ε_ErĴ₂`; `W=(rK₁,−rK₀,0,rĴ₂)`, `W_μW^μ=r²(Ĵ₂²−K₀²−K₁²)`; `ε^(0123)→−ε` flips every `W^μ` | Pass |
| 125 | DNC Checks | inverse; chart product; Haar | `(a,h)(−h⁻¹·a,h⁻¹)=(a−a,1)`; `exp(rv)h exp(rw)k=exp(rv)exp(rAd(h)w)hk→(v+Ad(h)w,hk)`; `dim 𝔤/𝔥=10−6=4` ⇒ Jacobian `r⁴`, system `r^(−4)dg` | Pass |
| 126 | kinematic Checks | Jacobi on `(K₁,K₂,P₁)`, `(P₁,P₂,K₁)`, `(K₁,P₂,H)` | `AP₂+acP₂=0`; `BK₂−bcK₂=0`; `(−bA−aB)J₃=(abc−abc)J₃=0` with A=−ac, B=bc; rescaling `a′c′=k²ac`, `b′c′=p²bc`, `a′b′=h²ab`; Poincaré row `[K_i,K_j]=−ε_ijkJ_k` | Pass |
| 127 | M0 item 2 curvature and Casimir | X,Y∈𝔭 | `⟨R(X,Y)Y,X⟩=−B([[X,Y],Y],X)=B([X,Y],[X,Y])≤0` (B negative on 𝔨); `1−C+2Δ_K=1+ΣX_i²−ΣY_j²−2ΣX_i²=1−ΣX_i²−ΣY_j²=N` | Pass |
| 128 | M0 item 4 compactness bound | K-types with `λ_τ>R` | `(1−P_R)=(1−P_R)(1+Δ_K)⁻¹(1+Δ_K)`, `‖(1+Δ_K)⁻¹(1−P_R)‖≤(1+R)⁻¹`, `(1+Δ_K)π(f)=π((1+Δ_K)f)` | Pass |
| 129 | Primet dictionary | `Primet1983 line 438–446` | source: `U_{u,−p/r}∘π_r(v,h)f→ρ⁺_{p,u}f⁺+ρ⁻_{p,u₁}f⁻`, `u₁(m)=u(wmw)`; README `λ_r=−m/r`, `u₁(k)=u(wkw)`, both sheets retained | Pass |
| 130 | M5.AffineG5 | matrix product, inverse, radical | `M(Λ₂,a₂,b₂,σ₂)M(Λ₁,a₁,b₁,σ₁)=M(Λ₂Λ₁,a₂+Λ₂a₁+b₂σ₁,b₂+Λ₂b₁,σ₂+σ₁)`; `M·M(Λ⁻¹,−Λ⁻¹a+Λ⁻¹bσ,−Λ⁻¹b,−σ)=1`; extended radical: derived ideals `span{P,Z}⊃ℝZ⊃0` from `[Q,S]=P`, `[P,Q]=ηZ`; unextended `span{P}⊃0` | Pass |
| 131 | Layer 0 Example | N=ℤ, f=δ₁ | `f̂(χ_z)=Σf(n)zⁿ=z`; conjugate convention z̄ | Pass |
| 132 | P.2 Check (phase-invariant products) | U=Id, V=−Id on ℂ² | bare coefficients `δ_ij` vs `−δ_ij`; products `δ_ijδ_kl` both; same class in PU(2) | Pass |
| 133 | P.2 Check (connectedness) | ℤ/2 by C on ℂ²; ℝ | `ε(C)=1∉PU`; `ε∘f:ℝ→ℤ/2` continuous ⇒ constant 0 | Pass |

## Not verifiable

- Fell 1961, *The structure of algebras of operator fields*, §V Theorem 5.1 (cited at `:2434` for the closed principal subset of the `SL(2,ℂ)` dual and its parametrization): the sources service resolves the DOI only to a paywalled page; not certified. Kechris 1995 Theorem 9.10, Weibel 1994 Corollaries 7.8.10 and 7.8.12, Wallach 1988 §§3.4.1–3.4.10 and Knapp Chapter VI: books not held (the cache's Kechris and Weibel hits are other works by those authors); cited from the standard numbering.
- Bargmann 1947, Lang *SL₂(ℝ)* Ch. VIII, Mackey 1952 and 1958, Parthasarathy 1969, Kostant–Rallis 1971, Iverson–Mack 1970: paywalled, as at the previous reviews; the sampled M4.P and the tensor rows that cite Lang rest on recomputation.
- Dooley and Grundling course notes: no legal source; the acceptance tables (`:9110–9124`) and the p.29/p.30 comparisons cannot be read against the text.
- `GelfandNaimark1947 line 1454` (Eq. 188): exponent illegible in the OCR, as before.
- Aghassi–Roman–Santilli (Phys. Rev. D 1 and J. Math. Phys.) for the historical `G₅`: paywalled; the README treats them as source claims only.
- The full de Sitter and Poincaré Fell topologies, the all-sequence contraction tables, the complementary Clebsch–Gordan continuation and the measurable recoupling coherence are theorem targets whose truth the finite checks above do not establish.

## Source issues

- none
