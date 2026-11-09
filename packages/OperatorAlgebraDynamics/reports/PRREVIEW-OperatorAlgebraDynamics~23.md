# Review of OperatorAlgebraDynamics (pull request #1137 at 8daff1a)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (3722 lines) and `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` (416 lines) at 8daff1a, the head that repairs the r22 review of b15a0d4. The pins are Mathlib 1b1ccf4b0 and Tau Ceti 2fd255d99, the same as on main. Nothing in the roadmap folder needs changing. Both findings are on the pull-request description, and both were asked for before.

## R01 (P3) — The description states no merge order with #1187, which rewrites this `Suggested.lean`

Carried forward unrepaired from r22 R06, r21 R01, r20 R03 and r17 R08. The job directory holds no repair report that marks it not actionable.

**Location.** The pull-request description, last line: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863".

**Witness.** `scratch/overlaps.md` at this head: "#1187 (@kim-em) chore: bump TauCeti to ab00ba392: #1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`, `lake-manifest.json`, `lean-toolchain`". This branch replaces that file wholesale (416 lines against main's 128).

**Repair.** State the order in the description. Either #1187 merges first and this branch is rebased onto it, with the `_root_.ContRepresentation.IsUnitary` binders at `Suggested.lean` lines 364 and 367 re-elaborated at Tau Ceti ab00ba392; or this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk.

## R02 (P3) — `V11.FourierInversion` exists only at the open VonNeumannAlgebras revision, and the description does not name that revision

This is the unrepaired half of r22 R01, whose repair read "Name the VonNeumannAlgebras revision in the description's merge-order line, as merging first".

**Location.** README lines 181, 185, 482–483, 499 and 2114–2115, for example line 482: "VonNeumannAlgebras V11 supplies, cited by section (V11.FourierInversion: inversion, Plancherel and duality)".

**Witness.**

- VonNeumannAlgebras on main (content checkout 13665dde) has no `V11.FourierInversion`: its V11 is "V11.DoubleDualEmbedding, then V11.UnitizationCharacters and V11.FourierUniqueness, then inversion, Plancherel and duality" (main line 250–251), the last three being an unnamed paragraph after `V11.FourierUniqueness` (line 3203).
- The id is defined at the head 772fc38d of #1041, line 3531: "**V11.FourierInversion — inversion, Plancherel and duality.**".
- The description's merge-order line names #1097, #1771, #1015 and #863 only. `scratch/overlaps.md` lists no "only an open revision defines" item because it does not index bold-paragraph ids; the citation is nevertheless a dependency on #1041's numbering.

**Repair.** Add #1041 to the description's line "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first". No README change is needed: I checked the content at 772fc38d lines 3510–3546, and V11.UnitizationCharacters (injective continuous character map, Gelfand transform of `λ(f)` is `f̂∘γ`, `‖a‖=sup|â|`) and V11.FourierInversion (`‖λ(f)‖=sup|f̂|`, surjectivity of the character map, inversion with `conj(γ(x))`, Plancherel, bidual isomorphism, rescaling) say exactly what lines 182–186 and 496–500 consume.

## Previous findings (r22, at b15a0d4)

- **R01 (P2), `V11.FourierUniqueness` retired by the open VonNeumannAlgebras revision: partly repaired.** The four citations now read "V11.FourierInversion (inversion, Plancherel and duality)" (lines 181, 482, 499, 2115) and the content matches #1041 at 772fc38d. The description still does not name #1041: carried forward as R02.
- **R02 (P2), strong subadditivity and automatic continuity statable but absent: repaired.** `continuous_of_measurable_monoidHom` (Lean line 221, README line 1133) and `vonNeumannEntropy_strong_subadditivity` (Lean line 407, README line 3407) are stated, with `import TauCeti.Analysis.Matrix.Entropy` (line 15). The author dropped the trace-one hypothesis I had proposed and argues the scaling law instead; I verified it (table row 3). Line 3411 now has the locator "Nielsen–Petz, inequality (1), p. 1".
- **R03 (P3), D9 restates Tau Ceti's matrix entropy: repaired.** The "From Tau Ceti" contract (lines 423–440) and D9 (lines 3389–3405, *Needs:* 3494–3500) cite `Matrix.vonNeumannEntropy`, `Matrix.relativeEntropy`, Klein's inequality, positivity, subadditivity, both partial traces and `Matrix.cfc_one_kronecker`; D9 keeps only the calculus for an arbitrary reference, monotonicity and strong subadditivity. All eight names exist at the pin (below).
- **R04 (P3), `ℓ∞(ℤ)` C*-structure re-planned: repaired.** Lines 1743–1747 and 1828–1829 cite the `CommCStarAlgebra (lp A ∞)` instance of `Mathlib/Analysis/CStarAlgebra/lpSpace.lean`, which is in the "From Mathlib" contract (lines 256–260).
- **R05 (P3), D2.SequenceToeplitz needs D4.Harmonic's `C*(ℤ)≅C(𝕋)`: repaired.** Lines 1840–1847 give the route through full exactness, the matrix units and D4.Harmonic's isomorphism at G=ℤ; the *Needs:* line (1911–1912) and the layer's Dependencies (1963–1964) list D4.Harmonic; "How to read the build" (lines 643–646) states the order and that D4.Harmonic uses only D2's amenable comparison.
- **R06 (P3), no merge order with #1187: not repaired.** Carried forward as R01.
- **R07 (P3), "C2.6" is not a CStarAlgebras id: repaired.** Line 591–592 reads "(§2.6, C2.AnnHull)"; main's CStarAlgebras line 695 is "### 2.6 Primitive ideals, hull–kernel topology, annihilators and open supports (C2.AnnHull)".
- **R08 (P3), `‖λ(h)‖=2√3` attributed to de la Harpe p. 16: repaired.** Lines 1348–1354 now argue through the spectrum: 4 is in the spectrum of h in `C*(F₂)` and not in that of `λ(h)`, since `σ(λ(h)/4)⊆[−1,1−ε]` (de la Harpe lines 715–720), and an injective *-homomorphism preserves spectra.
- **R09 (P3), title and references heading: repaired.** Line 1 is "# Roadmap: operator-algebra dynamics, crossed products, and equilibrium" and line 3602 is "## References"; the general-API paragraph that used to close the references now sits in the supplier contracts (lines 612–622) and the Delfín–Farsi–Packer paragraph is a reference entry (lines 3710–3716).

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** The worker's gate at this head reports every check at 0 and `OK`, including `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty (changes.md: "Files changed outside the folder: none").
- **Dependency check.** My run: `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The roadmap is on main and not in the merge order; VonNeumannAlgebras, which it cites directly in *Needs:* lines, is at ORDER line 5 and on main.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 15 `declaration uses sorry` warnings, at lines 102, 115, 130, 202, 221, 236, 252, 273, 294, 305, 322, 338, 360, 384 and 407, and nothing else (6.0 s).
- **One-tactic probe.** A scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide` fails at every one of the 15 theorems (one error each, at lines 109, 123, 140, 211, 226, 243, 264, 280, 298, 314, 331, 348, 375, 396, 413). No declaration is padding: the two definitions (`CentralCocycle`, `CentralCovariantPair`, `generatedCStarAlgebra`) are needed by the headlines that mention them.
- **Signature pass.** I appended `#check @name` for all 18 declarations to a scratch copy and elaborated it once. The 18 types agree with `scratch/signatures.md`, no section binder is lost, and the two new ones have the README's generality: `continuous_of_measurable_monoidHom` carries `[PolishSpace G]`, `[BorelSpace G]`, `[IsTopologicalGroup K]`, `[SeparableSpace K]`, `[MetrizableSpace K]`, `[BorelSpace K]` (Williams, Theorem D.11: "separable metric groups with G polish", cache line 21995); `vonNeumannEntropy_strong_subadditivity` carries `ρ.PosSemidef` and the three `Fintype`/`DecidableEq` pairs, with no trace hypothesis, as README line 3412 says.
- **Imports.** `import Mathlib` plus eight `TauCeti.*` modules, all existing at the pin (the new one, `TauCeti.Analysis.Matrix.Entropy`, is `TauCeti/Analysis/Matrix/Entropy.lean`). No `set_option`, no `lemma`, no sorry'd data.

### Seeded sample

- **D2.BoundedSequenceTranslation (lines 1743–1829).** Computed: covariance `UM_fU*δ_n=f(n−1)δ_n=(α_1f)(n)δ_n`; matrix units `E_ijδ_n=[n=j]δ_i`; the band identity on `δ_j`; `UpU*=1−p` with `χ(p)=½` impossible; `{η}` open as the complement of `hull(K(H))=Prim(Q)` and dense as `hull(0)`; `1_H` in the image, so not CCR (table rows 5–6). Mathlib's instance at the pin: `Mathlib/Analysis/CStarAlgebra/lpSpace.lean` line 35, `instance [∀ i, Nontrivial (A i)] [∀ i, CommCStarAlgebra (A i)] : CommCStarAlgebra (lp A ∞)`. Brown–Ozawa 5.1.3 is uncertified (Not verifiable).
- **D2.SequenceToeplitz (lines 1831–1916).** `arici-mesland2019` p. 3: §2.1 and Definition 2.1 at line 114, relations (3) at 117, the extension (4) at 122, symbol `T↦z` at 126–127. Computed: `1∉C₊`, `ℓ₊(1_[0,∞))=1`, `eUe=S`, `1−SS*` onto `δ_0`, `ev_z∘q(E_nn)=0`, and `q(Σ M_(f_k)U^k)(z)=Σℓ₊(f_k)z^k` is the composite of the quotient `C₊⋊ℤ→ℂ⋊ℤ` with `δ_1↦z` (row 7). `TauCeti.circleEquivPontryaginDualInt` is `TauCeti/Topology/Algebra/PontryaginDual.lean` line 47, `Circle ≃ₜ* PontryaginDual (Multiplicative ℤ)`.
- **Worked example: the saddle flow (lines 1927–1959).** Computed: `xy` invariant, branches closed, `{x>0,|xy|<ε}` saturated open and origin-free, every neighbourhood of the origin contains all four half-axis points, the +x and +y neighbourhoods meet in `0<r<ε` of the first quadrant; `(x,y)↦xy` open on the open quadrant. T₀, not T₁, not Hausdorff (row 8). No locator is needed: the example uses only Mathlib's `Real.exp`, quotient topologies and `IsOpenMap`.
- **D5.Fields (lines 2441–2520).** Williams, Theorem E.17 at cache line 23776 (page 417 = printed 405, separable H, second-countable LCH X, finite Borel μ, as the target assumes), Definition E.16 on the same printed page, Definition F.1 at 23897 (printed 409). Computed the six Checks: point, constant field, the jump at ½ with `E_10e_0=e_1∉span{e_0}` and `E_01e_0=0`, the non-measurable `1_Se_0`, `1` versus `E_00` on `span{e_0}`, empty X (row 9).
- **Concrete Cuntz families (lines 2842–2881).** Computed `S_i*S_jb_k=[(nk+j) mod n=i]b_k=δ_ij b_k`, `ΣS_jS_j*b_k=b_(n(k/n)+(k mod n))=b_k`, and the Checks at n=1, n=2 with `b_3`, and the shift family (row 10). `HilbertBasis`, `HilbertBasis.repr`, `exists_hilbertBasis`, `Nat.divModEquiv` and `ContinuousLinearMap.adjoint` exist at the pin. Cuntz §1 is uncertified.

### Locators verified this round

- **Nielsen–Petz** (`nielsen-petz2005`, arXiv quant-ph/0408130v3, 7 pages): inequality (1) at line 28 (p. 1); the relative-entropy reformulation (6) at line 86 (p. 2); Lemma 1 (−ln operator convex) and Lemma 2 (compression by an isometry) at lines 123–124 (p. 3); the relative modular operator `L_σR_ρ⁻¹` and the isometry `U(X)=(Xρ_A^(−1/2)⊗I_B)ρ_AB^(1/2)` at lines 140–188 (pp. 3–5). The README's `V(xρ_A^(1/2))=(x⊗1)ρ_AB^(1/2)` (line 3420) is the same map.
- **Williams** (printed page = cache page − 12): Theorem D.11 at line 21995 (p. 372): "separable metric groups with G polish"; Definition D.19 at 22147 (p. 375): Borel isomorphic to an analytic subset of a Polish space with the relative structure; Theorem D.23 at 22193 (p. 376): analytic Borel group with a nonzero σ-finite left-invariant measure, unique second-countable locally compact compatible topology, μ a Haar measure. Also re-located, with the cited printed pages: Lemma 1.61 (18), 1.76/1.78/1.79 (24–26), 2.23 (49), 2.40 (59), 2.61 (72), 2.73 (76), 3.1 (82), 3.19 (93), 4.17 (129), 4.22 (132), 4.24 (133), 4.28 (136), 4.29 (137), 5.9 (157), 5.10 (158), 7.2 (192), 7.8 and Example 7.11 (198), 7.13 (199), 7.18 (203), D.3/D.4 (370), D.20 (375), D.28 (383), D.37 (391), D.42/D.43 (395), E.17 (405), F.20 (417), F.21 (418), F.26 (419), F.33 (423), I.1 (479), I.21 (494).
- **de la Harpe** p. 16, lines 715–720: for a symmetric generating set of size d, `(1/d)Σλ(s)` has spectrum in `[−1,1−ε]`. This supports exactly what lines 1349–1351 now claim.

### Library declarations opened at the pins

**Tau Ceti** (`TauCeti/Analysis/Matrix/Entropy.lean` unless stated): `Matrix.vonNeumannEntropy` (line 88, `RCLike.re (cfc Real.negMulLog ρ).trace`); `Matrix.relativeEntropy` (134, `⊤` unless `ker σ.mulVecLin ≤ ker ρ.mulVecLin`); `Matrix.PosSemidef.re_trace_sub_trace_le_relativeEntropy` (198, hypotheses `ρ.PosSemidef`, `σ.PosSemidef`); `Matrix.PosSemidef.relativeEntropy_nonneg` (239, plus `ρ.trace = σ.trace`, as line 432 says); `Matrix.PosSemidef.vonNeumannEntropy_le_partialTraceRight_add_partialTraceLeft` (303, plus `ρ.trace = 1`, as line 434 says); `Matrix.IsHermitian.vonNeumannEntropy_eq_neg_re_trace_mul_cfc_log` (112); `Matrix.partialTraceRight` and `Matrix.partialTraceLeft` (`LinearAlgebra/Matrix/Trace/Partial.lean` 51 and 153) with `trace_partialTraceRight`/`Left` (79, 181); `Matrix.cfc_one_kronecker` (`Analysis/Matrix/Kronecker.lean` 60, for every `f : ℝ → ℝ` and every B); `TauCeti.circleEquivPontryaginDualInt`; `TauCeti.Amenable.of_commGroup`; `IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero`.

**Mathlib:** `AddMonoidHom.continuous_of_measurable` (`MeasureTheory/Measure/Haar/NormedSpace.lean` 79): source a locally compact seminormed additive group, target a seminormed group with `NormedSpace ℝ`, as README lines 1144–1145 and the Lean docstring say; `StandardBorelSpace` and `MeasureTheory.AnalyticSet` (`MeasureTheory/Constructions/Polish/Basic.lean` 83 and 186); the `lp A ∞` instances (above); `CStarModule.star_inner` (a structure field, `Analysis/CStarAlgebra/Module/Defs.lean` 81).

A scripted pass over the 172 backticked identifiers of the README resolved every one by declaration name at the pins except this roadmap's own `CentralCocycle` and `CentralCovariantPair` (declared in `Suggested.lean`) and the non-names `E_00`, `E_01`, `E_10`, `E_11`, `E_12`, `E_nn`, `XJ_H`.

### Cross-roadmap citations resolved

**On main (13665dde):** CStarAlgebras C1.3 (line 305), C1.4 (380), C1.6 (435), C1.7 (468), C2.1–C2.4 (544–643), C2.AnnHull (695), C5.1 (1112), C5.2 (1143), C5.4 (1203), C6.1 (1272), C6.2 (1297), C6.5 (1414), C7.1 (1455), C8.4 (1676); BanachAlgebras §3.1 (756), Layer 7 (1494), A7.CharactersAndUniqueness (1739); AmenableGroups Layer 5 (289) and Layer 7; SelfAdjointSpectralTheory SA-A21 (225), SA-B14 (320), SA-B44 (420), SA-B50 (441), SA-B59 (477), SA-B67, SA-B79, SA-B85 (132, 255); LieGroupoidsPoisson G0 (259, naming D5 at 270); FreeProbability F3 (255, naming D6 as owner of `O_n` at 80); HilbertModules H2 (179), H3 (262); VonNeumannAlgebras V4.0.Fields (1181), V4.0.Decomposition (1279, naming D5 at 1305), V11.UnitizationCharacters (3185); `Completed/OneParameterSemigroups`, `RepresentationTheory/CompactGroups`, `RepresentationTheory/SpinRepresentations` exist.

**At the open heads:** VonNeumannAlgebras #1041 (772fc38d): V4.0.Fields (1306), V4.0.Decomposition (1421), V10.ModularTheory (2687), V10.KMS (2797), V11.UnitizationCharacters (3510), V11.FourierInversion (3531), and line 4716 recording that OperatorAlgebraDynamics consumes V0–V4, V8 and V11. NoncompactQuantumSymmetry #1015 (4e793e8c): Layer 0 (218) consuming D4.Harmonic's `C*(N)≅C₀(N̂)` (243–245), P.2 (354) consuming D1.BorelPrefix (406), M1's Borel multipliers (1595, 1619), the supplier row (195). OperatorKTheory #866 (1377338a): K7 (1496), K7.5 consuming D1–D2.CentralTwists (173–181, 236–241), D3–D4 (249), D6 (251). CStarClassification #863 (db5a0c5f): CL2 (349), CL3 consuming D8 (502, 633), CL4 §4.6 using D6's `O_n` (784–792), CL5 (816), line 35 naming D2 and D6. QuantumFoundations #1771 (824bab8b): §6.3 (724), §6.4, D8 contract (24, 55). CompactQuantumMetricSpaces #1155 (7db4c193): §6.0 (1440) through HeisenbergImprimitivity §3.1 and K7.5 (103, 109, 309). RelativisticQuantumFieldTheory #1772 (ed010091): D8 consumed (14, 543). HeisenbergImprimitivity #1149: §1.1 (203) with `β((m,χ),(n,ψ))=ψ(m)` (89), §3.1 (441) with `(λ_c(x)h)(y)=c(x,y−x)h(y−x)` (453). MetaplecticAutomorphicForms #1063: §1.2 "Unitary Stone–von Neumann theorem" (357). CategoricalOperatorAlgebras #888: D6 as owner of `O_n` (54).

None of these is a supplier; every supplier citation is to main or to a declared gap.

### Ownership by object

`roadmaps grep` over main and the 467 open heads for "uniform Roe", "quasi-local algebra" and "strong subadditivity" finds only this roadmap as a planner (the #1187 hit is this folder's file on that branch); "Powers property|Powers averaging" only here; "Pettis|automatic continuity" in NoncompactQuantumSymmetry only as a consumer of D1.BorelPrefix (its lines 19, 363–367, 1635), in VariationalMethods as Milman–Pettis, elsewhere unrelated; "Mackey topology|analytic Borel group" only here (LocallyConvexDuality's Mackey topology is the dual-pair topology). The five closest roadmaps of `scratch/overlaps.md` (#866, #1015, #1041, #1149, #888) each record this roadmap as the owner of the objects they share with it, as listed above; VonNeumannAlgebras at #1041 line 2338 assigns the weak-closure identification of the regular crossed product to D1, which is consistent with D2's scope.

### Build order

D2.SequenceToeplitz now needs D4.Harmonic. At the target level there is no cycle: D4.Harmonic's *Needs:* (lines 2212–2222) use D2 only for `injective_integratedFull_regular_of_amenable`, which is stated in D2 proper (line 1376) and does not depend on the sequence models. "How to read the build" (643–646) says so. The layer-level Dependencies of D2 (1963) and D4 (2366) now mention each other, which is the coarse order the previous review's repair option asked for; the fine order is stated and acyclic.

### Adversarial table

Rows 1–4 cover what changed since r22, rows 5–10 the seeded sample, rows 11–22 the other headline theorems and the conventions recomputed across layers.

| # | Statement (README line / Lean) | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `continuous_of_measurable_monoidHom` (Lean 221; README 1133–1137) | G trivial; `G=K=ℝ`, `f=id`; a Hamel ℚ-linear `ℝ→ℝ` | trivially continuous; continuous; discontinuous, hence not Borel by the theorem (README 1203–1205); Williams D.11 needs G Polish and K separable metric, both carried | holds at the source's generality | none |
| 2 | `vonNeumannEntropy_strong_subadditivity` indices (Lean 407) | ρ on `a×(b×c)`; `reindex (prodAssoc).symm` | `reindex e e ρ ((a,b),c) ((a',b'),c') = ρ (a,(b,c)) (a',(b',c'))`, so its `partialTraceRight` is `ρ_AB`; `partialTraceLeft ρ` is `ρ_BC`, its `partialTraceRight` is `ρ_B` | the four terms are `S(ABC)`, `S(B)`, `S(AB)`, `S(BC)` | none |
| 3 | No trace hypothesis (Lean 404–406; README 3412–3415) | `cρ`, c>0; `ρ=0`; non-Hermitian ρ | `negMulLog(cλ)=c·negMulLog(λ)−cλ log c` and `log 0=0` in Mathlib give `S(cσ)=cS(σ)−c·Tr σ·log c`; `trace_partialTrace*` give all four traces equal to `Tr ρ`, so both sides shift by `−2c·Tr ρ·log c`; ρ=0 gives `0≤0`; for non-Hermitian ρ `cfc` returns 0 and the inequality could fail, so `PosSemidef` is needed and present | holds | none |
| 4 | GHZ, `2ρ`, Bell and calculus Checks (3469–3485) | GHZ; `2·GHZ`; `|0⟩⟨0|⊗Φ⁺`; `ρ_AB=¼·1`, `σ_B=½·1` | `0+log 2≤2log 2`; `−2log 2+0≤0+0`; `0+log 2≤log 2+0` (equality), and `ρ_A` in place of `ρ_AB` gives `log 2≤0`, false; `D=log¼−log½=−log 2=−2log 2+log 2` | all hold | none |
| 5 | D2.BoundedSequenceTranslation (1749–1776, 1809–1815) | `Uδ_n=δ_(n+1)`; `p=M_(1_(2ℤ))` | `UM_fU*δ_n=f(n−1)δ_n`; `E_ijδ_n=[n=j]δ_i`, opposite shift gives `δ_(2i−j)↦δ_i`; `Σ_kM_(f_k)U^kδ_j=Σ_k⟨δ_(j+k),Tδ_j⟩δ_(j+k)=Tδ_j`; `UpU*=1−p`, `χ(p)=½` | holds | none |
| 6 | `Prim(R)` (1794–1796) | closed ideals 0 and `q⁻¹(J')` | `hull(0)=Prim(R)`, `hull(K(H))=Prim(Q)`; opens ∅ and `{η}∪O`; `{η}` open and dense | holds | none |
| 7 | D2.SequenceToeplitz (1832–1889) | `1`, `1_[0,∞)`, `eUe`, `E_nn` | `lim_(−∞)1=1`, so `1∉C₊`; `ℓ₊(1_[0,∞))=1`; `eUeδ_n=δ_(n+1)` on `ℓ²(ℕ)`; `(1−SS*)` onto `δ_0`; `ev_z∘q(E_nn)=0`; `q(U)=z` is `δ_1↦z` | holds (Arici–Mesland p. 3; D4.Harmonic at ℤ) | none |
| 8 | Saddle flow (1927–1959) | `xy=r`; `{x>0,|xy|<ε}`; +x versus +y | branch `{(u,r/u)}` closed; the set is saturated, open, origin-free, misses `r≥ε`; every origin neighbourhood holds all half-axes; +x and +y meet in Q1 | T₀, not T₁, not T₂ | none |
| 9 | D5.Fields (2446–2513) | point; `N=ℕ`; jump at ½; non-Borel S; `1` vs `E_00` | `H(x_0)`; `L²(X;ℓ²)`; `E_10e_0=e_1∉span{e_0}`, `E_01e_0=0`; `1_Se_0` not measurable; equal on `span{e_0}` | holds (Williams pp. 405, 409) | none |
| 10 | `exists_residue_family` (Lean 384; 2842–2871) | n=1; n=2, `b_3`; shift family | `S_0=Id`; `S_0*b_3=0`, `S_1*b_3=b_1`, sum `b_3`; `S_i*S_jb_k=δ_ij b_k`; `S_1*S_0=S_1*≠0` | holds | none |
| 11 | Kesten Check (1347–1354) | F₂, `|S|=4` | trivial character gives `4∈σ_(C*(F₂))(h)`; de la Harpe p. 16 gives `σ(λ(h)/4)⊆[−1,1−ε]`, so `4∉σ(λ(h))`; unital injective *-homomorphisms preserve spectra | holds | none |
| 12 | `exists_integratedOperator` (Lean 102; 767–772) | ℤ, `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−|n|)a` | `T=π(a)+π(b)U`; `Σ‖f(n)‖=3‖a‖` | holds | none |
| 13 | `fullCrossedProductMap_exact` (Lean 130; 778–782) | G trivial; `A=ℂ²`, `I=ℂ⊕0`; I=A | `0→I→A→A/I→0`; `0→C*(G)→C*(G)²→C*(G)→0`; quotient 0, first map an isomorphism | holds | none |
| 14 | `CentralCocycle.cocycle` and inverse law (Lean 161; 920, 928, 1075–1077) | ℤ/2, `ω(a,a)=−1`; `(s,s⁻¹,s)` | `(−1)(1)=(−1)(1)`; `α̃_s(ω(s⁻¹,s))=ω(s,s⁻¹)` | holds | none |
| 15 | `injective_integratedFull_regular_of_amenable` (Lean 236; 1370–1377) | ℤ; `ρ=id⊕0` | `‖λ(f)‖=sup|f̂|`; the zero summand leaves the kernel unchanged | holds | none |
| 16 | `exists_powers_partition` and the estimate (Lean 273; 1640–1655, 1715–1732) | `F={b}`, L=2, `w=ab²`; ℤ, N=3; N=1 | `wbw⁻¹=aba⁻¹`; `b^jD` has exactly j leading b's; `|C∩I|≤|I|/2` against three disjoint translates of D; `‖ΣP_jT_j‖≤√N‖x‖` twice gives `2‖x‖/√N`, `2‖x‖` at N=1 | holds | none |
| 17 | `reducedFreeGroup_trace_unique`, `_isSimpleRing` (Lean 294, 305; 1726–1727) | rank 1 | `C*_r(ℤ)=C(𝕋)` has the ideal `{f(1)=0}` and the traces `ev_z`, so `a≠b` is needed | holds | none |
| 18 | D2.CentralTwists Checks (1589–1612) | ℤ/2, `ω(a,a)=−1`; `(ℤ/2)²`, `ω=(−1)^(ba′)` | `u_a*=−u_a`, `u_au_a*=1`; `uv=u_(1,1)`, `vu=−u_(1,1)`, `u²=v²=1`, so `M_2(ℂ)`, `τ=Tr/2` | holds | none |
| 19 | D4.Harmonic Checks (2163–2210) | ℤ/2; ℤ; ℤ/3 inversion; finite dual measure | `δ_a↦(1,−1)`, `‖δ_e+δ_a‖=2`; `δ_1↦z`; `(1/3)Σχ(1−x)=[x=1]`; `f=δ_e` forces dual mass `1/n` | holds | none |
| 20 | `lcaWeyl_classification` (Lean 360; 2271–2289) | ℤ/3, `V=diag(1,ω,ω²)`, U the shift | `UVU*=ω⁻¹V=conj(χ(1))V`, `VUV*=ωU` | holds, phase not symmetric | none |
| 21 | D7 KMS and perturbation signs (3066–3106) | `K=diag(0,1)`, `a=E_12`, `b=E_21`; `P=−K` | `τ_(iβ)(b)=e^(−β)b`, `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)`; `Q=−βP` turns weights `(1,e^(−β))` into `(1,1)`; `u_t=diag(1,e^(iβt))` | holds | none |
| 22 | D5 one-unit and pair groupoid (2416–2431, 2597–2609) | group G; `X×X` | `(Δ^(1/2)f)*(Δ^(1/2)g)=Δ^(1/2)(f*g)`, stars agree; `dν⁻¹/dν=Δ⁻¹`, `D=Δ`; `D=1`, `(−1)(−1)≠−1` | holds | none |
| 23 | D9 Ising and on-site Checks (3457–3468) | `hσ_3`, `Jσ_3⊗σ_3`; on-site | `M_λ=|h|+2|J|e^λ`, `M_(λ,2)=|h|+8|J|e^λ`, bound `1/(2+16e)`; `p=log 2cosh βh`, `e_Φ=−h tanh βh`, `s=p−βh tanh βh`, `s−βe_Φ=p` | holds | none |

### Remarks that need no change

- Monotonicity of relative entropy under partial trace (line 3421) is statable at the pin with `Matrix.relativeEntropy` and the partial traces. The README presents it as a step of one proof route for strong subadditivity, not as a headline, and a route is not mandatory; `Suggested.lean` states the headline.
- The six `gap:` slugs name sections on main that plan the content (CStarAlgebras C1–C8, HilbertModules H3) and act as supplier citations; the board package has no `design/plan.json`, as in every earlier round.

## Not verifiable

- **Brown–Ozawa, Proposition 5.1.3** (D2.BoundedSequenceTranslation), **Cuntz 1977, §1** (D6), **Bratteli–Robinson, vols. 1–2** (D7–D9) and **Renault, LNM 793** (D5–D6): settled as uncertified in the manifest, cited by locator. The sampled claims that rest on them were checked by computation (rows 5–7, 10, 21, 23).
- **Rudin, Theorems 1.5.1, 1.6.1, 1.7.2:** cited by locator for statements consumed from VonNeumannAlgebras V11; not in the cache.
- **Araki 1973, Takeishi, Sims–Williams, Muhly–Williams, Sims (2017), Delfín–Farsi–Packer:** cached but outside this round's sample and not re-read; Araki's finite-dimensional consequences are row 21.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at the paragraph before Lemma 4.28 and in its proof, p. 136 (cache lines 8657–8724): the source defines `s·ϕ(γ)` as `γ(s)ϕ(γ)` and moves `R_s` past `S_γ` with the factor `γ(s)`; it should be `conj(γ(s))`, which (4.62) and Definition 4.26 require; affects the proof.
