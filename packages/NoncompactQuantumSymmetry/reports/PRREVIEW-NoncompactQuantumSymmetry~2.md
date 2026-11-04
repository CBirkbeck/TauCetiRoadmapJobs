# Review of NoncompactQuantumSymmetry (pull request #1015 at 777a2fe)

**Verdict:** accepted

No P1 or P2 finding. The gate passes, the dependency check reports no problem, the six headline statements in `Suggested.lean` elaborate at the pins and none is a one-tactic consequence, and the computed adversarial pass (86 rows below) found no false identity. The six P3 notes are the author's to take or leave.

## Previous findings (review at 72e22bd)

- **R01 (HilbertModules ownership): repaired.** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:12` now reads "HilbertModules H3 supplies interior tensor products, correspondence induction and the Rieffel correspondence; H5 supplies C₀(X)-algebras"; P.7 and P.8 are deleted; lines 65–83 give the H3/H5 contract and six contract checks, which recompute (M₂(ℂ)–ℂ module: dimension 1 → 2; right-module identity gives E₁₂ where the reversed convention gives 0).
- **R02 (Whitehead headline): repaired.** `Suggested.lean:91` and `:103` state `whitehead_one` and `whitehead_two` with the full binder list; README line 13 and lines 453–481 cite AffineLieAlgebras A1 for the complex case and the Tau Ceti complete-reducibility route.
- **R03 (API restatements): repaired.** The file has 12 declarations; `isAdmissible_iff`, `quotientProjection_section`, `dual_smul_apply`, `permutation_algebraic_tprod`, the Galilei coordinates and the Young matrix units are gone.
- **R04 (locators for sampled derived results): repaired for every block I sampled.** Each derived block now carries a `*Needs:*` line naming the external ingredient with a locator; the Echterhoff, Groenevelt, Brennich, Neeb and Möllers–Oshima locators were verified below.
- **R05 (shape): repaired in structure, partly in content.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–9 each ending with Examples and Dependencies are present. Checks lists exist for Layer P, the induced datum, the Hilbert-module contracts and M6.PairField; most definitions of M0–M5 still have none (R01 below).
- **R06 (docstring): repaired.** `Suggested.lean:8–45` names, layer by layer, the headlines that are not statable and the missing carrier. One residual case is R02 below.

## R01 (P3) — Definitions in Layers M0–M5 lack Checks lists and per-target Needs lines

**Location:** `README.md:654` (`IsKFinite`, admissibility), `:668` (`(𝔤_ℂ,K)`-module), `:1003` (system of imprimitivity), `:1543` (regular orbit space, little-group data), `:2050` (Pauli–Lubanski operators), `:3441` (`DNC(G,H)`), `:5932` (the ten-dimensional kinematical bracket).

**Claim:** every definition has its API and at least three discriminating Checks, and each target lists what it needs.

**Witness:** none of the definitions above is followed by a `**Checks.**` list; the worked values exist (for example the DNC normalizer example at line 5983 and the Casimir tables at 5110) but are not attached as Checks. Only about fifteen targets carry a `*Needs:*` line; Layers 0, M0, M2 and M4 rely on the layer-level Dependencies paragraph.

**Repair:** attach three Checks to each definition from values already in the text, for instance for the kinematical bracket: Jacobi forces A=−ac and B=bc; the rescaling K′=kK, P′=pP, H′=hH sends (a,b,c) to (kh a/p, ph b/k, kp c/h); the Poincaré row a=c=1, b=0 realises [K_i,P_j]=δ_ij H with [P_i,P_j]=0. For `DNC(G,H)`: the zero fibre law (a,h)(b,k)=(a+h·b,hk); the Haar density r^(−4)dg at r>0; the normalizer action B=−A on the normal bundle. Give each numbered M0 bridge and each M4 block its own `*Needs:*` line.

## R02 (P3) — The docstring does not account for the statable kinematic normal-form theorem

**Location:** `Suggested.lean:36–40` and `README.md:5945–5960`.

**Claim:** every headline not statable at the pins is named with its missing carrier.

**Witness:** the docstring says M5's "affine-kinematic comparisons need … integrated group/cover realizations", but the eleven-case classification at README lines 5945–5960 is stated there as a finite-dimensional Lie-algebra theorem under the algebraic premise ac≥0 (the README itself proves that the group-level noncompactness premise is equivalent to ac≥0). The bracket has a real body on `(Fin 3 → ℝ) × (Fin 3 → ℝ) × (Fin 3 → ℝ) × ℝ` and the equivalence is the diagonal rescaling family, so the normal-form statement is statable with two definitions. The same holds for P.2's statement that `unitary (H →L[ℂ] H)` with the pointwise topology is a Polish group.

**Repair:** either state the normal-form theorem (bracket family, rescaling equivalence, the eleven-row table as a function of sign(a), sign(c), sign(b)) or say in the docstring that these two are omitted and why. I classify this P3 because neither appears among the roadmap's end theorems in its Summary.

## R03 (P3) — `inducedHilbertSpace` is a bare alias of a native carrier

**Location:** `Suggested.lean:182–184`.

**Claim:** definitions appear only to make a headline statable.

**Witness:** the body is exactly `MeasureTheory.Lp K 2 μ`; the headline at line 197 can be written on `Lp K 2 d.measure` directly. The alias also drops the topology binders, which the signature tool then reports as "dropped" (a false lead, but one the alias invites).

**Repair:** delete the abbreviation and write `MeasureTheory.Lp K 2 d.measure` in `InducedModelData.exists_inducedRepresentation`; replace the backticked name at README line 1100 by the native one.

## R04 (P3) — Source-transcription narrative is not timeless

**Location:** `README.md:3391–3406` ("provisional φ_src", "faint-fraction uncertainty", "faint glyphs"), `:8917`, `:8926–8927` ("faint or overwritten glyphs", "indeterminate facing scan"), `:8955`.

**Claim:** a roadmap says what is wanted, not how it came to say it.

**Witness:** ten sentences describe the legibility of a scan of lecture notes that the sources service cannot locate legally (Dooley, Grundling). A reader a year from now cannot act on "preserve the uncertain p30 x² term".

**Repair:** keep the mathematics (the chart `F_+`, its inverse, the pullback metric, the `Q_−` signature comparison, the acceptance table's "Required comparison and owner" column) and delete the transcription remarks; cite the notes as context only where a statement is actually taken from them.

## R05 (P3) — Primet locator pages

**Location:** `README.md:5714`: "Primet (1983), §2, printed pp.13,15–16".

**Witness:** `Primet1983 line 438–446` is the theorem (printed p.15, continuing on p.16, with u₁(m)=u(wmw) at line 443); the realisation `U_{u,λ}` on the two-sheeted hyperboloid is §2.7 at lines 349–363, printed p.12, not p.13.

**Repair:** cite "§2.7, printed p.12, and §4, printed pp.15–16" (or "§§2.7, 4.1–4.2 and the Théorème of §5").

## R06 (P3) — Size

**Location:** the folder: 8,968 README lines (647 kB), of which M5 and M6 are 2,600 and 2,950 lines.

**Claim:** a roadmap that is unwieldy is split into Parts.

**Repair:** move the all-sequence contraction tables (M5.DeSitterNullZero, M5.DeSitterRemainingTransitions, M5.StructuralModelComposition) and the M6 pair, exchange and tree tables into "NoncompactQuantumSymmetry, Part II", whose introduction says that the base roadmap stops at the fixed-label de Sitter dual (M5.DeSitterFiber) and the M6.MeasuredPair interface. Nothing changes mathematically; the layer order is already acyclic in that direction.

## Verified sound

**Gate and build.** The worker's gate at 777a2fe reports every check passing. I elaborated `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean` with `lake env lean`: exactly six `declaration uses sorry` warnings (lines 68, 80, 91, 103, 119, 197), nothing else. `git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean. One `import Mathlib`, no `set_option`, no sorried data, no `lemma`.

**Dependency check.** `tauceti-roadmap gate --depcheck … --movable` on this README prints `depcheck: 207 roadmaps, 1463 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. CStarAlgebras (#860) and OperatorTheory/UnboundedOperators (#1027) are not in `ORDER.txt`; the check places them after their last suppliers, which precede this roadmap, and that is not a finding.

**Signatures and the one-tactic probe.** On a scratch copy I replaced each of the six `sorry`s by `first | rfl | simp | infer_instance | exact?` and appended `#check @name` for all 12 declarations. None of the six closed. Every elaborated type matches its README statement: Wigner on `Projectivization ℂ H` with `H ≃ₗᵢ[ℂ] H` or `H ≃ₗᵢ⋆[ℂ] H`; Pettis for Polish `G`, `H`; the two Whitehead lemmas with `[Field K] [CharZero K] [FiniteDimensional K L] [LieAlgebra.IsSemisimple K L] [FiniteDimensional K V]`; Becker–Kechris with `StandardBorelSpace X` and `MeasurableSMul₂ G X`; the induction datum with `[IsClosed ↑H]` present in every elaborated type (the worker's "looks dropped" lead is spurious: the coercion prints as `↑H`). Nothing changed.

**Headline audit.** Headlines from the README: Wigner (P.1), Pettis (P.2), the two Whitehead lemmas (P.4), Borel realisation (M1) and the induced representation on `Lp` (M1) are stated. Imprimitivity (M1), Mackey classification (M2), the particle classifications (M3–M4), the de Sitter dual and contractions (M5), the tensor tables (M6), the GCR/type-I bridge (M0a), admissibility (M0), CCR (P.5) and permutation sectors (P.6) are named in the docstring with their missing carriers; I confirmed there is no projection-valued-measure carrier in Mathlib or Tau Ceti at the pins (no `ProjectionValuedMeasure`/`SpectralMeasure` declaration), and no completed Hilbert tensor power. Residual: R02.

**Pinned declarations opened** (paths relative to the library roots). Mathlib `Algebra/Lie/Cochain.lean:116` (`d₁₂ f x y = ⁅x, f y⁆ - ⁅y, f x⁆ - f ⁅x, y⁆`, the README's convention) and `:156` (`twoCocycle = ker d₂₃`); `Algebra/Lie/CartanCriterion.lean:256` (`HasTrivialRadical.instIsKilling`, variables `[CommRing R] [CharZero R] [IsDomain R]`, `[IsNoetherian R L] [Module.Free R L]`); `Algebra/Lie/Killing.lean` (`IsSemisimple.instHasTrivialRadical`, `killingForm_of_equiv_apply`, `LieEquiv.isKilling`); `LinearAlgebra/Projectivization/Basic.lean:193` (`map` needs injectivity); `MeasureTheory/Constructions/Polish/Basic.lean:307`, `:648`, `:882` (`MeasurableSet.isClopenable`, `QuotientGroup.borelSpace`, `Measurable.measurableEmbedding`); `Topology/MetricSpace/Polish.lean:113` (`PolishSpace.iInf`); `Probability/Kernel/Disintegration/{Basic,StandardBorel}.lean` (`condKernel`, `disintegrate`); `Algebra/Lie/Classical.lean:92`, `:175`, `:180` (`sl`, `indefiniteDiagonal`, `so'`); `RepresentationTheory/Continuous/Basic.lean:438` (`restrict`); `MeasureTheory/Measure/Haar/NormedSpace.lean:85–99` (the continuity lemma lives in the real normed-space section, as the README says). Tau Ceti `Algebra/Lie/HighestWeight/CompleteReducibility.lean:259` (`exists_isCompl_of_isKilling [FiniteDimensional K M]`, field of characteristic zero); `GroupTheory/GroupExtension/Of/FactorSet.lean:55`, `:132–140` (`FactorSet`, `map_one_one/fst/snd`), `rescaleEquiv`, `canonicalSection_mul`, `nonempty_groupExtensionEquiv`; `RepresentationTheory/ProjectiveRepresentation/Extension.lean` (`isProjectiveRepEquivExtensionHom`); `LinearAlgebra/CliffordAlgebra/RealForm/ThreeOne.lean:133–136` (the Hermitian matrix `!![v3+v2, -v1-v0·I; -v1+v0·I, v3-v2]`, exactly the README's `[[p₃+p₂, −p₁−ip₀],[−p₁+ip₀, p₃−p₂]]`); `GroupTheory/SpecificGroups/Heisenberg.lean:92` (`z+z'+x*y'`); `RepresentationTheory/Symmetric/Specht/{Complex,Basis}.lean` (`instSimpleSpechtModuleℂ`, `spechtModuleℂ_iso_iff`); `RepresentationTheory/Continuous/Unitary/Basic.lean:104` (`IsUnitary.restrict`); `RepresentationTheory/Symmetric/TensorAction/Basic.lean` (`reindexRepresentation`). Not at the pins, as the README states: a projection-valued measure, completed Hilbert tensor products, Lie-group extensions.

**Cross-roadmap citations resolved** (every one re-resolved this round):

| Citation | Where it resolves |
| --- | --- |
| OperatorAlgebraDynamics D1/D3/D5/D8 | main `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:75`, `:205`, `:277`, `:554` |
| HilbertModules H3/H5 | #861 `TauCetiRoadmap/HilbertModules/README.md:259`, `:353` |
| VonNeumannAlgebras V2/V3/V4/V4.0.Fields/V4.0.Decomposition/V11 | #889 `README.md:42`, `:257–268`; #1041 `README.md:94`, `:191`, `:220`, `:362` (two open pull requests carry this folder; both have the cited sections) |
| CStarAlgebras C1/C2/C2.AnnHull/C5 | #860 `README.md:85`, `:263`, `:350`, `:546` |
| SelfAdjointSpectralTheory SA-B85 | main `OperatorTheory/SelfAdjointSpectralTheory/README.md:132` |
| UnboundedOperators UO-B04/B05/E03 | #1027 `OperatorTheory/UnboundedOperators/README.md` |
| AffineLieAlgebras A1 | main `TauCetiRoadmap/AffineLieAlgebras/README.md:81`, `:107` |
| InductionRestriction 2.1, `Gassmann.almostConjugate_iff_permutation_equiv` | main `RepresentationTheory/InductionRestriction/README.md:198`, `:378` |
| AutomorphicFormsOnReductiveGroups §2.1 | #1037 `README.md:289–291` (`IsGFinite`, topology-free prefix), `:493` (the prefix uses only CompactGroups and Mathlib) |
| LieGroupoidsPoisson G0 | #1050 `README.md:150` |
| MetaplecticAutomorphicForms 0.1, 0.5–0.8, 0.13 | #1063 `README.md:78`, `:120`, `:128`, `:136`, `:155`, `:240` |
| SmoothBundlesConnections B1.4 | #887 `README.md:31` |
| SchurWeyl Layers 3–5; SpinRepresentations Layer 7 | main `RepresentationTheory/SchurWeyl/README.md:245`, `:260`, `:285`; `SpinRepresentations/README.md:881` |
| LaguerreJacobi A/B | #117 (weiscadence) `README.md:220` (Part A) |

Note on direction: AutomorphicFormsOnReductiveGroups (#1037, earlier in the merge order) lists this roadmap as a prerequisite at its lines 38, 56, 302 and 371 (M0 and M4 targets), while this roadmap consumes only the topology-free prefix of its §2.1, which that roadmap states at its line 493 depends on nothing here. README line 9 records the split. The upward edge belongs to that roadmap, not to this one; no cycle among this roadmap's own edges.

**Ownership by object.** Searched the roadmap index for the objects, not the names: Wigner's theorem, Pettis's theorem, the Whitehead lemmas, the imprimitivity theorem, the Becker–Kechris realisation, the Mackey machine, the Galilei/Bargmann and de Sitter duals. Hits outside this roadmap are different objects (Bloch–Wigner, Dunford–Pettis, Whitehead products) or cited suppliers (OperatorAlgebraDynamics D3 Green imprimitivity, HilbertModules H3, AffineLieAlgebras A1). BorelEquivalenceRelations (main, `README.md:672`, `:704`) and CountableStructureSpaces (#1316, line 700) both place Becker–Kechris and general Polish-group actions out of scope, so M1.BorelRealization has no other owner. No `Suggested.lean` in a readable roadmap declares a `TauCetiRoadmap.NoncompactQuantumSymmetry.*` name. Ownership against open pull requests whose files the brief did not give me was not checked beyond the index grep.

**Seeded sample.** All fifteen blocks inspected; the source rows below name the lines read.

| Target | Outcome |
| --- | --- |
| Full genuine irreducible classification (M3, line 1934) | Conjugation, dual action, orbit table and both stabilizer rows recomputed (table rows 35–37). `Brennich1970 line 116–132` (multipliers, one m per class), `line 228–262` (Theorem (15) class list) support the cited pp.138–140, 144–146. |
| Discrete and limit little families (M4, line 3080) | D_n boundary coefficient, C_n implementing O, η_n and the four-row table recomputed (rows 43–44). Bargmann 1947 is paywalled: not source-certified. |
| Endpoint carrier crosswalk (M4, line 3329) | U_± isometries, intertwining, `U_± C_conj U_±⁻¹=J_(2,0)` recomputed (row 45). `GelfandNaimark1947 line 1512` (Eq. 194 at ρ=2) and `line 1687–1691` (footnote: ρ=2 carries the trivial and the principal n=2, ρ=0 representation). The exponent in Eq. 188 (`line 1454`) is unreadable in the OCR. |
| Little-group spectra and countability (M5, line 3655) | No external source; consumes M0 item 4, TypeIComparison and CStarAlgebras C2 (resolved above). |
| M5.InducedLorentzSupport (line 4059) | Rows 60–61. `BenoistKobayashi2017 line 386–396` (Prop. 2.6) and `line 513–523` (Lemma 3.2, Herz majoration) match the stated use. |
| Every moving zero-orbit row (line 5144) | A_m/B/η tests agree with the fixed-label table and LittleDual endpoints (rows 53, 62, 64); `ArendsBangJensenFrahm2024 line 1344–1358` (Cor. 4.2 branching to P), `line 392`, `line 420` ((1.4), (1.5)) support the F-picture inputs. |
| All-sequence contraction classification (line 5664) | Definition of L, C from the computed basis; consistent with the trivial-family row and the Casimir necessity rows (rows 52, 66). No external locator claimed. |
| Both momenta nonzero (M6, line 6233) | Row 71. |
| Required two- and three-dimensional Euclidean adapters (line 6254) | Row 70. |
| Opposite-energy massive inputs (line 6397) | Row 72. Lang Ch. VIII is paywalled: the M4.P input is not source-certified. |
| A zero-momentum Lorentz factor (line 6474) | Row 73. |
| Principal Lorentz input, all spacelike inputs (line 7328) | Row 78. `MollersOshima2012 line 199–203` (discrete spectrum iff |Re σ|>n−m, only k<(|Re σ|−1)/2), `line 1129–1141` (the measure dm_(σ,μ) before Cor. 3.5), `Repka1976 line 46–48` (§3 Proposition). |
| M6.H (line 7645) | Row 77. `Groenevelt2003 line 123–141` ((2.1)–(2.3)); `DLMF1825 line 350–352` (18.25.4 Wilson weight). |
| M6.PairField and M6.FiniteTree (line 8513) | Rows 83–84. `Echterhoff2010 line 975–978` (Remark 5.10(2), induction in steps, page 20). |
| Change of normalization (line 8723) | Row 85. |

Other locators read: `Echterhoff2010 line 991` ((5.4), p.20), `line 1001` (Prop. 5.11, p.21), `line 1105–1114` (Lemma 5.15, Prop. 5.16, p.23), `line 1938–1943` (Thm 7.10, p.38), `line 2502–2508` (Thm 7.41(i), p.51); `Dixmier1961 line 154` (Eq. (12), printed p.12), `line 679–682` ((53)–(55), printed p.27), `line 701–713` (Ω′ and its three values, printed p.28), matching the README's table at lines 3410–3413 and 4895–4899; `Freed2012Wigner line 97` (sequence (7)), `line 109–113` (Example 10); `Neeb2004 line 408–417` (Prop. II.6), `line 489–491` (Lemma II.7), `line 1521–1530` (Thm VII.2 exact sequence); `WagemannWockel2015 line 253–255` (Prop. I.7), `line 189–195` (Remark I.3), `line 208–210` (Remark I.4: crossed homomorphisms continuous iff so near 1), `line 1106–1115` (Remark V.14); `DLMF164 line 493–495` (16.4.9), `line 879–883` (16.4.17 with Re(c+d−a−b)>1); `DerkachovSpiridonov2017 line 307–311` ((17)), `line 469–473` ((22)), `line 612–616` ((28)), `line 646–649` ((30)), `line 1318` ((49)); `AngelopoulosLaoues1998 line 1105–1112` (Thm 2.5, (2.50)), `line 1136–1137` (Prop. 2.6), `line 1220–1225` (Prop. 3.1), `line 1277–1280` (Prop. 3.2), `line 1247–1250` ((3.7)); `Burgess1979 line 15–18`, `line 36`.

**Computed adversarial table.** Values are exact. "Pass" means the instance agrees with the statement; it does not prove an infinite family.

| # | Statement | Instance | Values on the two sides | Result |
| --- | --- | --- | --- | --- |
| 1 | `rayTransitionProbability` | ℂ², e₁ vs e₁+e₂; 2e₁ vs i(e₁+e₂) | 1/(1·2)=1/2; |2i|²/(4·2)=1/2 | Pass |
| 2 | same | e₁ vs e₂; p vs p | 0; 1 | Pass |
| 3 | `wigner_reconstruction` | H=ℂ (one ray) | Φ=id; U=Id satisfies the unitary branch | Pass |
| 4 | antiunitary branch needed | conjugation on ℂ² | Bloch map (x,y,z)↦(x,−y,z), det −1, not in SO(3) | Pass |
| 5 | `continuous_of_measurable_hom` | characters of ℝ | Borel ones are e^{ict}; a Hamel-basis additive f gives exp(if) not Borel | Pass (hypothesis needed) |
| 6 | `whitehead_one` | so(3), f(x)=x×a | d₁₂f=0 by Jacobi; f=δa | Pass |
| 7 | negative control | abelian ℝ on trivial ℝ, f=id | d₁₂f=0 but ⁅x,v⁆=0≠x; IsSemisimple fails | Pass |
| 8 | `whitehead_two` | so(3) trivial coefficients, c=⟨a,x×y⟩ | λ(w)=−⟨a,w⟩ gives d₁₂λ=c; on ℝ² every d₁₂λ=0 but c(e₁,e₂)=1 | Pass |
| 9 | d₁₂ convention | pin Cochain.lean:116 | ⁅x,f y⁆−⁅y,f x⁆−f⁅x,y⁆ both sides | Pass |
| 10 | `exists_polishTopology_continuousSMul` | X=∅; two points, trivial action | ∅ Polish; discrete topology Polish, Borel=powerset, action continuous | Pass |
| 11 | isotropy | H=G, s=1; H={1}, s=id | g; 1 | Pass |
| 12 | section change | S₃, s′=(12), g=(123) | (12)(123)(12)=(132) | Pass |
| 13 | rnDerivative direction | ℝ, dμ=eˣdx, translation t | d(g_*μ)/dμ=e^{−t}; pin: `rnDeriv μ' μ` = dμ'/dμ | Pass |
| 14 | C₂ atoms (1,4) | U_s(1,0) | =(0,1/2), norm² 1→1; inverse factor gives 16 | Pass |
| 15 | RN cocycle | s=log2,t=log3 | 1/6 = 1/2·1/3 | Pass |
| 16 | S₃/⟨(12)⟩ | counting measure, trivial fibre | dim L²=3, r=1; zero fibre dim 0 | Pass |
| 17 | P.2 section | U=diag(i,−1) | s_{e₁}=diag(1,i), s_{e₂}=diag(−i,1), ratio i; without conj ⟨e₁,s e₁⟩=−1 | Pass |
| 18 | no global section | PU(2) | π₁(U(2))=ℤ vs ℤ×ℤ/2 | Pass |
| 19 | P.3 odd/even ℤ/2 | ω(t,t) | odd: ±1, δb(t,t)=1, H²=ℤ/2; even: δb=b², H²=0 | Pass |
| 20 | P.3 ℝ² multiplier | x=(1,0),y=(0,1) | commutator e^{iθ} | Pass |
| 21 | P.3 H¹ | odd ℤ/2; even | Z¹=𝕋, f_z=z⁻² onto, H¹=0; Z¹=ℤ/2, B¹=1 | Pass |
| 22 | P.4 integration | SO(3); SL(2,ℝ) | Hom(ℤ/2,𝕋)=ℤ/2 injects (SU(2) perfect), H²(so3)=0; Hom(ℤ,𝕋)=𝕋 | Pass |
| 23 | P.4 Galilei Dτ | τ=v₁·R₁a₂+(t₂/2)|v₁|² | mixed derivative v·a′−v′·a; quadratic term 0 | Pass |
| 24 | P.5 CCR | Gaussian, ℏ=1 | (XP−PX)ψ=iψ | Pass |
| 25 | P.5 sign | T_a | F(T_aψ)=e^{−ip·a}Fψ | Pass |
| 26 | P.6 | n=0,1; d=2; (12),(23) | P₊=P₋=Id; 3 and 1; composition στ | Pass |
| 27 | H-module checks | M₂(ℂ)–ℂ, ℂ²; E₁₁,E₁₂,E₂₂ | dim 1→2; E₁₁*E₁₂E₂₂=E₁₂ vs E₁₁E₂₁=0 | Pass |
| 28 | M0 Nelson | C=−ΣX²+ΣY², Δ_K=−ΣX² | 1−C+2Δ_K=1−ΣX²−ΣY² | Pass |
| 29 | M0 Killing | sl(2,ℂ)_ℝ; so(3,1); so(4,1) | 8Re tr; 2tr; 3Tr with B(J_ab,J_ab)=−6ε_aε_b | Pass |
| 30 | M0 Hermitian map | H(x), Q_N | det=η(x,x); x=(p₃,p₂,−p₁,p₀), inverse (x³,−x²,x¹,x⁰); off-diagonal −p₁−ip₀ = pin | Pass |
| 31 | M2 dual action | N=ℝ, h=2 | h·χ_ξ=χ_{ξ/2} | Pass |
| 32 | M2 Heisenberg isomorphism | ((r,s),t)↦(r,t,s+rt) | both products give (r+r′,t+t′,s+s′+rt+r′t′+rt′) | Pass |
| 33 | M3 composition, centre | (R,v,a,t) | (R₁R₂,v₁+R₁v₂,a₁+R₁a₂+t₂v₁,t₁+t₂); centre forces R=1,v=0,a=0,t=0 | Pass |
| 34 | M3 cocycle | g=(v=e₁),h=(a=e₁),k=(a=3e₁) | 1+3=0+4 | Pass |
| 35 | M3 conjugation | α_(R,v)(z,a,t) | (z+v·Ra+|v|²t/2, Ra+vt, t) | Pass |
| 36 | M3 dual action, invariant | (R,v)·(m,p,E) | (m,Rp+mv,E+Rp·v+m|v|²/2); E−|p|²/2m invariant | Pass |
| 37 | M3 m=0 rows | p=r e₂; p=0 | stabilizer ℝ²_⊥⋊SO(2); all of H | Pass |
| 38 | M3 time reversal | Aψ(p)=J_jψ(−p) | AΠ_(m,U,j)A⁻¹=Π_(−m,−U,j); θ gives the same | Pass |
| 39 | M3 H²_lc(G̃_E,𝕋)=0 | Λ²(ℝ³⊕ℝ)=ℝ³⊕ℝ³ as SO(3)-modules | no invariants | Pass |
| 40 | M4 q | (0,0,0,m),(0,0,r,r),(0,0,r,0) | m²,0,−r² | Pass |
| 41 | M4 null stabilizer | δ(w,θ)δ(w′,θ′) | (w+e^{iθ}w′,θ+θ′); r_θ=exp(iθσ_z/2) | Pass |
| 42 | M4.SL2R | δ_P(a_r); D_l; (J²−A²−B²)/4 | r²; l(2−l)/4; equals q_B | Pass |
| 43 | spacelike ladder | A_m=½√((m+1)²−ν²) | Casimir (1−ν²)/4; [L₋,L₊]v_m=m v_m; J₀²=η; J₀R=ηRJ₀; C²=1 | Pass |
| 44 | discrete rows | D_n, ν=n−1 | A_{n−2}=0; C_n v=(−1)^j v anticommutes with L₊ and dτ(J); η_n=(−1)^n | Pass |
| 45 | endpoint crosswalk | U₊=iξ⁻¹, U₋=i ξ̄ | isometries; ∂_z̄-chain rule gives (a−cz)^{−2}; conjugated C_conj has symbol ξ̄/ξ=a_(2,0) | Pass |
| 46 | M4.Angular | γ_(0,−s); a_(1,−1/2); a_(2,0) | 1/r_s; i/z (from F(1/z)=−i/ξ); −pv(1/z²)/π; γ = inverse of the 2D Stein constant with α=−2λ | Pass |
| 47 | M4.Riesz | k=0, α=2s | c_s=Cπ^{1−2s}Γ(s)/Γ(1−s) | Pass |
| 48 | Lorentz spin class | SO₀(3,1) | π₁=ℤ/2, SL(2,ℂ) perfect, H²(so(3,1))=0 ⇒ ℤ/2 | Pass |
| 49 | graded classes | F=C₂×C₂ | 2+3·4=14 | Pass |
| 50 | future orbit preserved | ε(S),ε(T) | only (0,1); F_E=ker(ε+t_F) | Pass |
| 51 | null centre | h=1/2; 0 | −1; +1 | Pass |
| 52 | Dixmier values | all four families | README table = `Dixmier1961 line 679–682, 711–713` after s=1/4−λ² | Pass |
| 53 | de Sitter dictionary | σ=1/4−λ² | scalar 0<λ<3/2 ⇒ σ∈(−2,1/4); integer p: (0,1/4); half p: none | Pass |
| 54 | M5 chart | R=1, x=(2,0,0,0) | u=4,z=1, Ω₊=1/2, F₊=(1,0,0,0,0), Q₊=1; Ω₋ undefined | Pass |
| 55 | boosted representatives | e^u=2/m, 2/r | (0,0,1−m²/4,1+m²/4); (0,0,1+r²/4,1−r²/4) | Pass |
| 56 | S³ density | stereographic | 8(1+|x|²)^{−3}/(2π²)=(4/π²)(1+|x|²)^{−3}; f↦(2/π)F unitary | Pass |
| 57 | eigenform limits, Beta | j≥1; l≥1 | a_{2j}/(1−s)→1/(2j); a_l/(1−s)→1/(l(l+1)); ∫=πB(s,1)=π/s; c̄_s=π^{−2s}Γ(1+s)/Γ(1−s) | Pass |
| 58 | ordered sl₂ Casimirs | u=λ+m/2, v=λ−m/2 | [H,E]=2E,[E,F]=H; Ω₁·1=(u²−1)/4; sums m²/8−ω²/2−1/2, −mω/2; C_s (s²−1)/2; trivial 0 | Pass |
| 59 | kinematics rescaling | K′=kK,P′=pP,H′=hH | a′=kh a/p, b′=ph b/k, c′=kp c/h; Jacobi: A=−ac, B=bc | Pass |
| 60 | InducedLorentzSupport scalar row | cosh conjugation | d²−1+l(l+1)sech²; A_l*A_l=H_l+l², A_lA_l*=H_{l−1}+l²; ker A_l=sech^l; ∫sech^{2l}=√πΓ(l)/Γ(l+½); ‖A_j*f‖²=(j²−k²)‖f‖² | Pass |
| 61 | support table | D_n; I_(e,iν); D₁; trivial | K-spins ≥n/2 ⇒ |m|≥n and weights ±(n+2ℕ₀) ⇒ B_n; A_e; B₁=A₁; Q with C=k²−1 ↔ P_{2k}(0) | Pass |
| 62 | CompactInductionSupport | j=0,½,1 | {0}, {±1}, {0,±2} | Pass |
| 63 | DNC normalizer | A=diag(−1,1,1,1), B=−A | B(0,0,r,r)=(0,0,−r,−r); Ad(A)J₀₁=−J₀₁; ε_Eℓ preserved | Pass |
| 64 | exceptional atoms | P=l=1 | w₀=4/9, 5F4=9/8 (DLMF 16.4.9, excess l=1), Σw_k=1/2=Z_{1,1} | Pass |
| 65 | N_G | M=0 types | C_K=N(N+2); N_G=3−P(P+1)+2N(N+2)>0 for N≥P≥1 | Pass |
| 66 | Casimir table | ν,π_(P,0),π^± | 9/4−λ²−μ(μ+1)=2+s−μ(μ+1); (λ²−¼)μ(μ+1)=−sμ(μ+1) | Pass |
| 67 | Pöschl–Teller | u=2v, S=2λ | −d²/dv²−(λ²−¼)sech²v, l=λ−½; MO density 1/(8π)|dτ| ⇒ 1/(4π)dω; atom masses identical | Pass |
| 68 | Euclidean pair | r₁,r₂ | r²=r₁²+r₂²+2r₁r₂cosθ, Lebesgue on (|r₁−r₂|,r₁+r₂) | Pass |
| 69 | Bargmann masses | m₂=−m₁ | μ=m₁m₂/M undefined ⇒ separate row | Pass |
| 70 | Euclidean adapters | sphere, plane, line | κ/√(η²−κ²); κ/√(((a+b)²−κ²)(κ²−(a−b)²)); κ/√(κ²−λ²) with κ²=t²+λ²; arcsine 1/√(a²−λ²) | Pass |
| 71 | both momenta nonzero | B⊗B, B⊗C, C⊗C, C⊗E | J=ℝw×Z, K=F₂; λ=0 ⇒ T^2; fibres |λ|<min(ζ,κ), |λ|<min(ζ,κ₁+κ₂) non-atomic ⇒ ∞; κ′∈(0,η)∩(|κ−ζ|,κ+ζ) ≠∅ iff κ−η<ζ<κ+η | Pass |
| 72 | opposite-energy massive | m₁u−m₂v | q=m₁²+m₂²−2m₁m₂cosh t; q>0 ⇔ M<|Δ_m| on branch sign Δ_m; dq∼sinh t dt; n=2(a+b) via δ(0,2t); A_l symmetric | Pass |
| 73 | zero-momentum Lorentz factor | T_J, Δ-action | T_J=2j+1 for J≥b+j; Λ(δ(w,θ))f(z)=e^{−imθ/2}f(e^{−iθ}(z−w)); ζ=−2πξ, κ=2π|ξ|; centre (−1)^m | Pass |
| 74 | spacelike×massive | geometry and counts | q(v)=m²+s²/r₀²; q=m²−r₀²+2s; spatial (m²+r₀²−q)/2r₀; density D_m(q)dq/4r₀²; V_J=(2j+1)(J−l/2+1) for J≥j+l/2; E_L=(k+1)(k+2)/2 | Pass |
| 75 | spacelike×null | V_J(u), B_L(u) | min(2J+1,J−u+1); k+1 with k=−u−L/2; u_<+u_>=l>0 ⇒ tail on one side | Pass |
| 76 | M6.C | B_k, A_k, Wilson | 2k²+½−(t²+v²)/4; √(((k+½)²−t²/4)((k+½)²−v²/4)); √2A₀; p⁰ sums to 1; n=0 coefficient (a+b)(a+c)(a+d)/S = 2×bulk; diagonal (1−t²−v²)/16 ⇒ ¼+4·=B₀; Dougall condition c+d−a−b=L>1 | Pass |
| 77 | M6.H | t=v=0 | parameters (¼)⁴,(¾)⁴; H₀=π³, π³/128; a_{k+1}=−|2r_L−2k−1|a_k/|2k+1| | Pass |
| 78 | principal Lorentz × spacelike | Res_{H_s} | Indχ_m⊕Indχ_{−m}; E_L(m,l)=k+1, k=(|m|−l−L)/2; complementary: atom iff 2s>1 with parameter 2s−1 | Pass |
| 79 | two spacelike | D=s²−a²b² | q>0 needs s>(a²+b²)/2; r ranges (0,d),(d,A),(A,∞); counts J−l/2+1, (k+1)(k+2)/2, 1; H^sp from Res_{MA}τ=(Ind_Mχ)^{d_A} | Pass |
| 80 | two zero Lorentz | K(s,t), residue | Riesz composition gives K(s,t)|ζ|^{−2u}; c_sc_t=Kc_u; 2πi·Res_{ν=−iu}=−u²π^{2S−3}Γ(1−S)/Γ(S)=c_u; S=1,n=0: dμ₀/q₁₂=dν/π² | Pass |
| 81 | exchange counts | T_J(N) | N(N+1)/2 or JN−J(J−1)/2; sign (−1)^{J+N} gets min(J,S)+1 per S | Pass |
| 82 | three half-spins | e,f bases | F=[[−½,−√3/2],[√3/2,−½]]; Π₁₂=diag(−1,1); Π₂₃=[[½,√3/2],[√3/2,−½]] from inner products | Pass |
| 83 | pair normalization | atoms 3; (1,3); 1,1,1 | Z=½,w=⅓; (¼,¾) vs (⅔,⅓) with Z=¾, w=(⅔,1/9); (4/7,2/7,1/7) | Pass |
| 84 | common root measure | spins (½,½,1) | (1/6,2/3,1/6),(1/4,1/2,1/4) → (2/9,5/9,2/9); r=(¾,6/5,¾),(9/8,9/10,9/8); κ at root 1: (¾,¼) | Pass |
| 85 | change of normalization | (1,3) | t=(8/3,4/9); factors (√(3/8),3/2); norms ¼,¾; t⁻¹=(3/8,9/4) | Pass |
| 86 | Primet contraction | r→0 | theorem at `Primet1983 line 438–446`: ρ⁺_{p,u}f⁺+ρ⁻_{p,u₁}f⁻, u₁(m)=u(wmw), a.e. and uniform on compacts | Pass (locator R05) |

## Not verifiable

- Bargmann 1947 (JSTOR), Lang *SL₂(ℝ)* Ch. VIII (Springer), Mackey 1958 (Springer, DOI prefix paywalled), Parthasarathy 1969 (Springer): the sources service resolves each only to a paywalled page. The sampled "Discrete and limit little families" and "Opposite-energy massive inputs" blocks therefore rest on recomputation, not on the text.
- Dooley and Grundling course notes: no legal source found by title search; the acceptance tables at README lines 8907–8924 and the p.29/p.30 remarks cannot be checked against the text (see R04).
- Weibel, Kechris, Wallach: books not held; the Whitehead and Pettis locators in the docstrings are cited from memory of the standard numbering.
- Gel'fand–Naimark Eq. 188: the exponent is illegible in the OCR of `GelfandNaimark1947 line 1454`; the M4.Lorentz operator comparison (README line 2144) is consistent with the standard complementary-series action but was not read off the page.
- The full de Sitter and Poincaré Fell topologies, the all-sequence contraction table, the complementary complex Clebsch–Gordan continuation and the measurable recoupling coherence are theorem targets whose truth the finite checks above do not establish.

## Source issues

- **Misprint** in AngelopoulosLaoues1998 at equation (3.7), preprint p.29 (line 1247): the source writes the commutator with the same generator Y in both entries; it should be the commutator of the images of X and Y; affects the proof.
