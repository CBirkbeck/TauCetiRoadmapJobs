# Review of NoncompactQuantumSymmetry (pull request #1015 at a7afa46)

**Verdict:** needs changes

This is a full review of head a7afa46, the same head the previous review read: the folder has not changed since (0 changed lines), and neither has the description's revision line. The gate passes. The dependency check reports no problem. `Suggested.lean` elaborates with its five `sorry` warnings and nothing else. Of the previous review's two findings, neither is repaired (both are carried below as R05 and R06). This round adds five findings: two P2 and three P3. The two P2s come from the pinned Tau Ceti. It already proves both Whitehead lemmas that P.4 and `Suggested.lean` restate. It also already has the projection-valued-measure carrier whose absence the module docstring gives as the reason the central imprimitivity theorem is not stated.

## R01 (P2) — P.4 restates the Whitehead lemmas that the pinned Tau Ceti proves; `whitehead_one` and `whitehead_two` each close with one `exact`

**Location:** README `:510–518` ("Prove that every 1-cocycle is `δv` … stated as `whitehead_one` and `whitehead_two`"), the route `:519–538`, the ownership claims `:13` ("P.4 extends that result …") and `:17` ("from which Layer P.4 proves the degree-one and degree-two Whitehead lemmas"); `Suggested.lean:84–106`.

**Claim:** what the pinned libraries already prove is cited, not restated as a target, and `Suggested.lean` carries no theorem that one library lemma closes.

**Witness:** Tau Ceti `TauCeti/Algebra/Lie/Whitehead.lean:105` `LieModule.Cohomology.exists_eq_lie_of_d₁₂_eq_zero` and `:113` `LieModule.Cohomology.exists_d₁₂_eq` (`[Field K] [CharZero K] [IsKilling K L]`, finite-dimensional L and M). With `Suggested.lean`'s exact signatures, `exact LieModule.Cohomology.exists_eq_lie_of_d₁₂_eq_zero hf` and `exact LieModule.Cohomology.exists_d₁₂_eq c` elaborate with no error and no `sorry`.

**Repair:** Delete `whitehead_one` and `whitehead_two` from `Suggested.lean`, and remove "both characteristic-zero Whitehead lemmas" from the docstring (`:10–11`). In P.4, replace the Whitehead bullet's "Prove … stated as …" and its route with a consumption of the two Tau Ceti theorems and `LieModule.Cohomology.twoCocycle_eq_range_d₁₂` (`:140`). Note that Mathlib's `LieAlgebra.IsSemisimple.instHasTrivialRadical` and `LieAlgebra.HasTrivialRadical.instIsKilling` supply `IsKilling` from semisimplicity in characteristic zero; the probe uses exactly that instance chain. List the three names under "From Tau Ceti", and rewrite `:13` and `:17` as citations rather than ownership. The P.4 Checks `:547–569` can stay as convention witnesses for the consumed statements. RelativisticQuantumFieldTheory cites "NoncompactQuantumSymmetry P.4: the real Whitehead lemmas" at line 64 of its head; P.4 keeps its id, so that citation still lands. Tested: the probe file (both theorems, Mathlib plus `TauCeti.Algebra.Lie.Whitehead`) elaborates cleanly.

## R02 (P2) — The central imprimitivity theorem is statable at the pins; the docstring's reason for omitting it is false

**Location:** `Suggested.lean:27`: "M1's imprimitivity equivalence needs projection-valued measures and covariant systems"; also `:39` ("covariant position PVMs, beyond the native matrices"). README Summary `:3`: "The central theorem is the locally compact imprimitivity theorem with its correctly normalized induced Hilbert-space model".

**Claim:** every headline statable at the pins is stated, and the docstring names the carrier that is actually missing.

**Witness:** Tau Ceti has `TauCeti.ProjValMeasure X H` (`TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91`): normalized, multiplicative, strongly countably additive (`hasSum_proj_of_pairwise_disjoint`, `:524`), on any measurable space. It also has the pushforward `ProjValMeasure.map` (`…/Map.lean:40`). The statement below elaborates against the pins.

**Repair:** State the transitive imprimitivity theorem in `Suggested.lean`. Add `public import TauCeti.Analysis.InnerProductSpace.ProjValMeasure.Basic`, define one structure bundling native data, and reuse `InducedModelData`. Tested form, with the binders of `InducedModelData` for G, H, X:

```lean
structure SystemOfImprimitivity (G X E : Type*) [Group G] [TopologicalSpace G]
    [MeasurableSpace G] [MeasurableSpace X] [MulAction G X] [MeasurableSMul G X]
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E] where
  rep : ContRepresentation ℂ G E
  rep_isometry : ∀ g, Isometry (rep g)
  rep_continuous_orbit : ∀ v, Continuous fun g : G => rep g v
  pvm : TauCeti.ProjValMeasure X E
  covariant : ∀ (g : G) (B : Set X) (hB : MeasurableSet B),
    (rep g).comp (pvm.proj B hB) = (pvm.proj (g • B) (hB.const_smul g)).comp (rep g)

theorem SystemOfImprimitivity.exists_induced [MeasurableSMul G X]
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    [TopologicalSpace.SeparableSpace E]
    (e : (G ⧸ H) ≃ₜ X) (he : ∀ (g : G) (q : G ⧸ H), e (g • q) = g • e q)
    (S : SystemOfImprimitivity G X E) :
    ∃ (K : Type) (_ : NormedAddCommGroup K) (_ : InnerProductSpace ℂ K) (_ : CompleteSpace K)
      (_ : TopologicalSpace.SeparableSpace K) (d : InducedModelData G H X K)
      (W : E ≃ₗᵢ[ℂ] MeasureTheory.Lp K 2 d.measure),
      d.quotientEquiv = e ∧
      (∀ (g : G) (F : MeasureTheory.Lp K 2 d.measure), ∀ᵐ x ∂d.measure,
        (W (S.rep g (W.symm F)) : X → K) x = d.sectionAction g F x) ∧
      ∀ (B : Set X) (hB : MeasurableSet B) (F : MeasureTheory.Lp K 2 d.measure),
        (W (S.pvm.proj B hB (W.symm F)) : X → K) =ᵐ[d.measure] B.indicator F := by
  sorry
```

Name both declarations in M1 (`:1138`, `:1151`), with the converse stated in prose. List `TauCeti.ProjValMeasure`, `ProjValMeasure.map`, `map_proj` and `map_map` under "From Tau Ceti". In M1.BorelRealization (`:1212–1215`), take `E_Y(B)=E_X(f⁻¹B)`, its normalization and its countable additivity from `ProjValMeasure.map` instead of proving them; keep covariance and inverse transport. Rewrite the M1 and M4 docstring bullets to name only carriers that are actually missing.

## R03 (P3) — "LieGroupoidsPoisson G0 item0" is not a label of that roadmap

**Location:** README `:138` (supplier table), `:3746` ("Consume LieGroupoidsPoisson G0 item0's topological unit/arrow/operation interface"), `:6312` (M5 Dependencies).

**Claim:** cross-roadmap citations name the cited roadmap's own section or target.

**Witness:** LieGroupoidsPoisson on main, `:17`: "the targets §Gk.n; other roadmaps cite them by these labels". The topological-groupoid target is `### G0.0 Topological groupoids` (`:261`). No "item0" label exists.

**Repair:** Replace "G0 item0" by "§G0.0" at the three lines. Where `:3747` uses "its smooth layer", cite §G0.2 (Lie groupoids, `:420`). Tested: both headings resolve on main.

## R04 (P3) — Undefined abbreviations, an unexplained heading and process wording

**Location:** "SAST" `:822`, `:2164`, `:2625` ("a normalized SAST projection-valued measure"); "VNA" in 11 lines (`:711`, `:1127`, `:1132`, `:1700`, `:1942`, …); "UO" standalone at `:2164`, `:4412`; "NQS" at `:9`, `:23`, `:712`, `:1991`; the heading "Basic theory, global models and phase cuts" `:6290`; "prototype signature" `:1869`, "in prototypes" `:2204`.

**Claim:** every term is the literature's or a supplier's name, or is defined where it first appears; the README is timeless.

**Witness:** SAST, VNA and NQS occur in 3, 11 and 4 lines; standalone UO occurs at `:2164` and `:4412`. None is introduced anywhere. "Phase cut" occurs only in the `:6290` heading, whose paragraphs never mention one. `:1869` concerns a Lean file, not mathematics.

**Repair:** Write SelfAdjointSpectralTheory, VonNeumannAlgebras and UnboundedOperators in full, or introduce each abbreviation once in Scope and ownership. Write "this roadmap" for NQS. At `:2625` the PVM is `TauCeti.ProjValMeasure` (R02). Retitle `:6290` "Basic theory, rescalings and global models". Delete the sentence at `:1869`. At `:2204` replace "in prototypes" by "in Lean statements".

## R05 (P3) — Three OperatorAlgebraDynamics ids exist only at that roadmap's open revision, which the description does not name

Re-raised: R01 of the previous review at this same head (first raised two reviews earlier). No repair report marks it not actionable, and nothing has changed since.

**Location:** README `:19`, `:133`, `:216`, `:340`, `:1129`, `:1414`, `:1718`, `:1742`, `:2029`, `:4198` (D1.BorelPrefix); `:19`, `:133`, `:1724` (D1.TwistedBorel); `:19`, `:133` (D4.Harmonic). The description's revision line: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1145".

**Witness:** on main, OperatorAlgebraDynamics contains none of the three strings (0, 0, 0). At the head of #1137 (b15a0d4) they occur 14, 12 and 17 times (`:52`, `:58`, `:83–86`). Neither the description nor its merge-order paragraph names #1137.

**Repair:** nothing in the folder changes. Name #1137 (OperatorAlgebraDynamics) in the revision line next to #1145, and in the merge-order chain before this pull request.

## R06 (P3) — Size: split into a Part II

Re-raised: R02 of the previous review at this same head. No repair report reached this review. The earlier answer, that a repair job cannot create a Part II folder, is about the job and does not settle the finding.

**Location:** the folder. The README has 9,298 lines (677,550 bytes); M5 spans `:3676–6313` and M6 `:6314–9270`.

**Witness:** these are the same figures as in the previous review; no Part II folder exists. The named consumers use M2/M4, the helicity labels, Layer P and the M-layer models (`:9273–9279`), not the M5 all-sequence tables or the M6 pair/exchange/tree tables.

**Repair:** as before. Move M5.DeSitterNullZero, M5.DeSitterRemainingTransitions, M5.StructuralModelComposition and the M6 tables after M6.MeasuredPair into "NoncompactQuantumSymmetry, Part II". Its introduction says that the base roadmap stops at M5.DeSitterFiber and the M6.MeasuredPair interface.

## R07 (P3) — Three classical owned theorems carry no locator at the claim

**Location:** `:1151` "prove Mackey's imprimitivity equivalence: every such system is unitarily equivalent to induction of a representation of H, and conversely"; M2.TypeIDisintegration `:1795–1809` (existence and uniqueness of the irreducible disintegration for separable GCR algebras); M0a.TypeIComparison `:644–676` ("the hard Glimm implications").

**Claim:** every theorem carries a locator in parentheses at the claim.

**Witness:** none of these passages names a theorem, section or page. Mackey's 1952 paper appears only at `:1351`, for the subgroup and tensor-product theorems. Burgess at `:1835` covers only the selector. `:9287` lists Mackey 1949 for "classification problems" generally.

**Repair:** add, at each claim, the theorem number and page in a text that states it, and record the source. For example: Mackey 1952 (Ann. Math. 55), its imprimitivity theorem, for `:1151`; Dixmier, *Les C*-algèbres et leurs représentations*, Chapter 8, for the type-I disintegration; Glimm, "Type I C*-algebras" (Ann. Math. 73, 1961), for `:671`. The routes stay as written.

## Previous findings

- **R01 of the previous review (#1137 not named): not repaired.** The description still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1145", and the merge-order chain does not list #1137. Carried as R05.
- **R02 of the previous review (size): not repaired.** The README is unchanged at 9,298 lines. Carried as R06.

## Verified sound

**Gate** (run on this head):

`gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

The worker's gate file records the same with `build=0`. The diff outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

**Dependency check** (`--movable`): `depcheck: 244 roadmaps, 2464 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. NoncompactQuantumSymmetry is line 152 of the merge order. Its suppliers in the order precede it: PseudodifferentialOperators 14, AutomorphicFormsOnReductiveGroups 69, MetaplecticAutomorphicForms 147, LieGroupoidsPoisson 149. SmoothBanachRepresentations (#1145), UnboundedOperators (#1027) and LaguerreJacobi (#117) are new-folder pull requests named in the description's "Depends on" list. QuantumFoundations (210) and RelativisticQuantumFieldTheory (212) are consumers only.

**Build.** `lake env lean` on `Suggested.lean` takes 6.7 s and warns `declaration uses sorry` at `:75`, `:88`, `:100`, `:116`, `:189`, nothing else.

**Signatures.** I elaborated `#check @name` for all ten declarations in one scratch file. The worker's five "dropped `[IsClosed (H : Set G)]`" leads are false: each type carries `[inst_8 : IsClosed ↑H]`. `wigner_reconstruction` keeps `CompleteSpace` and `Nontrivial`; the Whitehead pair keeps `CharZero`, `IsSemisimple` and both `FiniteDimensional`; `exists_polishTopology_continuousSMul` keeps `PolishSpace G`, `StandardBorelSpace X` and `MeasurableSMul₂`. Each matches its README statement (P.1 `:220`, `:245`; P.4 `:510`; M1 `:1157–1169`; M1.MeasuredTensor `:1241–1249`).

**Padding probe.** I tried `(simp; done) | rfl | infer_instance | (aesop; done)` on each `sorry`. None of the five closes with Mathlib alone. With Tau Ceti's Whitehead lemmas, the two Whitehead theorems close (R01). `wigner_reconstruction`, `exists_polishTopology_continuousSMul` and `exists_inducedRepresentation` are genuine headlines.

**Headlines.** The README's headlines are:

- Wigner's theorem (P.1): stated.
- The Whitehead lemmas (P.4): stated, and duplicated per R01.
- The Becker–Kechris realization (M1): stated.
- The induced representation on the native `Lp` carrier (M1): stated.
- Mackey's imprimitivity theorem (M1): absent though statable (R02).
- The M2–M6 classifications and tables: named in the docstring as not statable. Their carriers (unitary duals, direct integrals, completed Hilbert tensors, group C*-algebras, Fell topologies) are not at the pins: there is no `DirectIntegral`, unitary dual or group C*-algebra in either library.

**Library declarations opened at the pins:**

- Mathlib `Algebra/Lie/Cochain.lean:43` `oneCochain`, `:101` `d₁₂` (`⁅x,f y⁆−⁅y,f x⁆−f⁅x,y⁆`), `:123` `d₂₃`, `:156` `twoCocycle := ker d₂₃`.
- Mathlib `RepresentationTheory/Continuous/Basic.lean:55` `ContRepresentation` (only `toMonoidHom : G →* V →L[R] V`).
- Mathlib `Algebra/Lie/Killing.lean:85–90` (`IsSemisimple → HasTrivialRadical → IsKilling`).
- Mathlib `MeasureTheory/Group/Pointwise.lean:29` `MeasurableSet.const_smul`.
- Tau Ceti `Algebra/Lie/Whitehead.lean:105`, `:113`, `:140`; `Algebra/Lie/Cohomology/LowDegree.lean:50` (`d₀₁ m x = ⁅x,m⁆`).
- Tau Ceti `Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91`, `:524`; `Map.lean:40`, `:56`, `:77`.

**Sources.** I fetched these open texts, without the manifest, and quote them by the service's keys:

| Key | Source |
| --- | --- |
| BK17 | arXiv:1706.10131v2 |
| Ech10 | arXiv:1006.4975v4 |
| AL98 | arXiv:hep-th/9806100v1 |
| BK93 | arXiv:math/9304208v1 |
| Ban18 | arXiv:1801.10171v3 |
| Fre11 | arXiv:1112.2133v3 |

**Seeded sample (15 targets).**

| Target | Locator | Checked |
| --- | --- | --- |
| M1.Core `:1127` | derived; Mackey 1952 at `:1351` | Checks `:1142–1149` recomputed (row 8); no locator for the imprimitivity theorem (R07) |
| M2.TypeIDisintegration `:1793` | derived; Burgess for the selector | spectral data on ℂ⊕ℂ, H=0 (row 9); no theorem locator (R07) |
| M4.TypeI `:2513` | Fell 1961 §V Thm 5.1 (paywalled); Banerjee §4 | Ban18 line 55 is §IV "(3+1) Dimensions", with the null little group and the new (Mellin) basis at lines 56–58; row 11 |
| M4.SpatialLocalization `:2625` | derived from M1 | helicity/localization criterion recomputed (row 12) |
| Intrinsic contraction space `:3730` | LieGroupoidsPoisson, OAD D5 | row 13; locator defect R03 |
| Explicit little-dual Borel charts `:4180` | derived | Kadison-transitivity test (row 14) |
| M5.LorentzTemperedSupport `:4241` | Benoist–Kobayashi Prop 2.6, Lemma 3.2 | BK17 line 386 (Prop 2.6, p.12: connected semisimple, finite centre; tempered ⇔ almost L² ⇔ Ξ bound); line 513 (Lemma 3.2, p.16, Herz); the README's K-invariant-indicator domination `:4481–4483` fills the proof gap listed under Source issues |
| M5.NullLittleDual `:4323` | Echterhoff2010 Thm 7.41(i) p.51, Prop 5.11 p.21 | Ech10 line 2502 (Thm 7.41(i), page 51 marker line 2500); line 1001 (Prop 5.11, page 21 marker line 999); row 16 |
| M5.PoincareDual `:4497` | derived | gauge rows against A_e, B_n, Q (row 17) |
| Fixed-label zero-translation rows `:5119` | derived | row 18 |
| Uniform lower models `:5595` | derived | row 19 |
| M5.MasslessDilation `:6040` | Angelopoulos–Laoues Thm 2.5, Props 2.6, 3.1–3.2, Eq. (2.50); Nelson Thm 5 | AL98 lines 1105–1124 (Thm 2.5, (2.50), (2.51)), 1136, 1220, 1277; (3.8)–(3.13) at 1257–1274; row 20; Nelson not verifiable |
| Basic theory, global models and phase cuts `:6290` | Bacry–Lévy-Leblond §II (paywalled) | row 21; heading R04 |
| Trivial spacelike little representation `:7160` | derived | row 22 |
| Identical zero-translation exchange sectors `:8516` | derived | row 23 |

**Adversarial table.** All signs use the README's conventions: pairing `−p₀a₀−p₁a₁−p₂a₂+p₃a₃`, time index 3, `δ(w,θ)` with `θ∈ℝ/4πℤ`, and `J_ab=ε_bE_ab−ε_aE_ba`.

| # | Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `rayTransitionProbability`, Checks `:241–243` | e₁,e₂; e₁,e₁+e₂; 2e₁,i(e₁+e₂) | 0; 1/(1·2)=½; ⟨2e₁,i(e₁+e₂)⟩=2i, 4/(4·2)=½ | Pass |
| 2 | `wigner_reconstruction` | H=ℂ; H=ℂ² with coordinate conjugation C | ℂ: one ray, U=id. ℂ²: Bloch map (x,y,z)↦(x,−y,z), det −1, outside SO(3)=image of U(2) (Fre11 line 109), so the antiunitary disjunct is needed | Pass |
| 3 | `whitehead_one` | L=ℝ, V=ℝ trivial, f=id | d₁₂f=0 but every ⁅x,v⁆=0≠x: semisimplicity needed and present; one `exact` closes it | Fail: R01 |
| 4 | `whitehead_two` | L=ℝ², V=ℝ trivial, c=det | d₂₃c=0; every d₁₂f=−f⁅x,y⁆=0≠det; one `exact` closes it | Fail: R01 |
| 5 | `exists_polishTopology_continuousSMul` | ℤ on ℝ by the Borel bijection swapping [0,1) and [1,2) by translation | not continuous for the usual topology; the refinement making both intervals clopen is Polish with the same Borel sets and makes it continuous; matches BK93 line 79 and the reformulation at 83–85 | Pass |
| 6 | `exists_inducedRepresentation` | C₂, H={1}, atom masses (1,4) | r_s=(4,¼); U_s(1,0)=(0,½), norm² 4·¼=1; inverse RN factor gives 16. Cocycles: k(g₁g₂,x)=k(g₁,x)k(g₂,g₁⁻¹x), r_{g₁g₂}(x)=r_{g₁}(x)r_{g₂}(g₁⁻¹x) | Pass |
| 7 | `InducedModelData.isotropy`, Check `:1262` | S₃, H=G, sections 1 and (12), g=(123) | k=g=(123) versus (12)(123)(12)=(132) | Pass |
| 8 | M1.Core Checks `:1142–1149` | B=[0,1], t=1 | `U₁E(B)U₁⁻¹f(x)=1_B(x−1)f(x)=1_[1,2]f`=E(1·B), not 1_[−1,0] | Pass |
| 9 | M2.TypeIDisintegration | A=ℂ⊕ℂ on ℂ⊕ℂ² (characters with multiplicity 1, 2); H=0 | Â two points, m=(1,2), dims 1+2=3; H=0 gives μ=0 | Pass |
| 10 | M2 Checks `:1704–1716` | shear; ℤ/2 on ℝ by negation, χ=e^{in} | stabilizers {0} (b≠0), ℝ (b=0); `χ̃((0,h)(n′,1))=χ(−n′)=e^{−in′}≠e^{in′}` | Pass |
| 11 | M4.TypeI weak support | m_φ=δ(0,2φ) | ζ_ℓ(m_φ)=e^{iℓφ}; −I=δ(0,2π)↦(−1)^ℓ, so the ordinary quotient keeps even ℓ; Ind_{MN}ζ_ℓ=∫Ind_{MAN}(ζ_ℓ⊗e^{iν})dν gives m=ℓ, all ν | Pass |
| 12 | M4.SpatialLocalization | helicity multisets {0}, {±½}, {+1}, {±1}; zero translations | spin 0 and spin ½ match; {+1} is not symmetric; weight ±1 forces integer j≥1, hence weight 0: not localizable; zero translations give P(E)=P(E+a), so disjoint translates give P(E)=0 and P(X)=0≠Id | Pass |
| 13 | Intrinsic contraction space | G=SO₀(4,1), basepoint Re₃, w=diag(−1,1,1,−1,1) | π₁(ℝ×S³)=0 so H is connected; dim 𝔤/𝔥=10−6=4 gives r⁻⁴; Ad(w)J_(a,3)=w_aw_3J_(a,3)=−w_aJ_(a,3); B=diag(1,−1,−1,−1) sends (0,0,r,r) to (0,0,−r,−r); scalar −1 on 𝔤/𝔥 forces det −1 or time reversal | Pass (locator: R03) |
| 14 | Little-dual irreducibility test `:4210–4218` | trivial ⊕ trivial on ℂ² | E₁₂ is not in the strong closure of the scalars, so the test fails as it must; irreducible case: Kadison gives ‖a‖≤1+δ<2 | Pass |
| 15 | M5.LorentzTemperedSupport | Ξ on H³; C_s spherical function | Ξ(a_t)=t/sinh t, Ξ(0)=1, ~2te^{−t}; C_s: sinh(st)/(s sinh t)~e^{(s−1)t}/s dominates; Haar ∝ sinh²t | Pass |
| 16 | M5.NullLittleDual | stabilizer of ζ≠0 in ℝ/4πℤ | {0,2π}; centre ζ_ℓ↦(−1)^ℓ, T_(ρ,e)↦e^{2πie}; ρ→0 limit is ⊕_{ℓ≡2e (2)}ζ_ℓ, matching the basis table | Pass |
| 17 | M5.PoincareDual gauges | a(m,j); zero-target rows | W²=−m²ℏ²j(j+1) gives \|W\|/ℏ=m√(j(j+1)); D_n gives n≤M, n≡M; trivial gives M=0 or (M≥2 even, ω=0) = Q; H_h gives P_(2\|h\|)(ω) for all ω | Pass |
| 18 | Fixed-label rows `:5138–5145` | ν_(0,σ), σ=¼−λ² | σ>−2 ⇔ λ<3/2; C_{λ−½}∈(0,1) ⇔ ½<λ<3/2; principal row equals CompactInductionSupport for D_p; every nontrivial τ has P_m(ω≠0), m≥1, outside Q | Pass |
| 19 | Uniform lower models `:5603` | massive regime | r²κ_f=r²(j(j+1)−f²−¼−ν²)→−(m/ℏ)² when rν→m/ℏ, so E→√(ρ_k²+(m/ℏ)²); Ω=2+s−μ(μ+1), Ω′=−μ(μ+1)s agree with `:3702` | Pass |
| 20 | M5.MasslessDilation | AL98 (2.51) at n=4; (3.8)–(3.13) | C″=½·2·s·s=s², C=½·6(s−1)(s+1)=3(s²−1) as at `:6136`; α(2−α)·½(α⁻¹P−αP̂)=(1−α/2)(P−α²P̂); Z_α=α^{(n−2)/2}=α | Pass |
| 21 | Kinematic classification `:6243–6296` | Jacobi; matrix dictionary with η=diag(1,1,1,−1,b) | (K₁,K₂,P₁): AP₂+acP₂ gives A=−ac; [K₁,K₂]=M₀₁=−J₃, [K₁,P₁]=−M₃₄=H, [K₁,H]=M₀₄=P₁, [P₁,H]=bM₀₃=bK₁; 3+3+3+2=11 cases; the seven contraction weight triples give the stated limits; for a=0, c=1 the P-action δk_i=bh, δh=−k_i preserves ‖K‖²+bH² (derivative 2k_i·bh−2bh·k_i=0) | Pass |
| 22 | Trivial spacelike row `:7175–7198` | p_s=(0,0,r₀,0), p_m as displayed | v·p_s=0; q(v)=m²+s²/r₀²; q(sum)=m²−r₀²+2s; spatial part (m²+r₀²−q)/(2r₀)>0; at q=0 the sum is nonzero null | Pass |
| 23 | Identical exchange sectors `:8530–8567` | swap z₁↔z₂ | Δα+2Δβ=−ΔA+ΔA₃/2; n≡2m (4) gives +1 (Sym²), n≡2m+2 gives −1 (Λ²); complementary (−1)^{n/2}; the atom symmetric in (ξ,η) lies in Sym²; Λ²(ℂ)=0 | Pass |
| 24 | Docstring `:27` | `TauCeti.ProjValMeasure` | the carrier exists; the scratch statement in R02 elaborates | Fail: R02 |
| 25 | `:138`, `:3746`, `:6312` | LieGroupoidsPoisson labels | "item0" occurs 0 times there; §G0.0 at `:261` | Fail: R03 |
| 26 | D1.BorelPrefix, D1.TwistedBorel, D4.Harmonic | main versus #1137 b15a0d4 | 0, 0, 0 versus 14, 12, 17 | Fail: R05 |

**Cross-roadmap citations resolved.**

- OperatorAlgebraDynamics on main: D1 `:75`, D3 `:205`, D5 `:277`; the three anchors match.
- VonNeumannAlgebras on main: Layer 3 `:905`, V4.0.Fields `:1181`, V4.0.Decomposition `:1279`, V11 harmonic analysis `:249–251`.
- SmoothBundlesConnections B1.4 (`:31`).
- InductionRestriction Layer 2.1 (`:346`) and `Gassmann.almostConjugate_iff_permutation_equiv` (its `Suggested.lean:729`, namespace `…InductionRestriction.Gassmann`), so the citation tool's lead is a false positive. The other three leads are this roadmap's own `InducedModelData.*` names.
- CStarAlgebras C2.AnnHull at #860 (`:695`, `:711`); HilbertModules H5 at #861 (`:88`); LaguerreJacobi Parts A–B at #117 (`:219`, `:277`).

**Ownership.** QuantumFoundations (#1771) and RelativisticQuantumFieldTheory (#1772) consume P and M without restating them (#1771 `:22`, `:65–66`; #1772 `:60–64`). QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (#1842) consumes M0. OperatorAlgebraDynamics (#1137, `:97–102`) hands P.2 and the M2 all-weights decomposition to this roadmap. BorelEquivalenceRelations (main `:667–672`) and CountableStructureSpaces (#1316 `:708`) both place Becker–Kechris out of scope, so M1.BorelRealization has a single owner. SelfAdjointSpectralTheory (main `:26`) lists the Tau Ceti `ProjValMeasure` directory as its home, consistent with R02. The overlap report shows no other open pull request changing this roadmap, no dropped id, and only the #1137 ids (R05).

## Not verifiable

- Mackey1958 (Acta Math. 99), Theorems 8.1, 8.4, 9.1, 9.3: uncertified in the manifest; cited by locator.
- Fell 1961 (doi 10.1007/BF02545788), §V Theorem 5.1: the service found only a paywalled page.
- Bacry–Lévy-Leblond 1968 (J. Math. Phys. 9), §II: the publisher returned HTTP 403; no legal copy found.
- Nelson 1959 ("Analytic vectors"), Theorems 3 and 5 and Lemma 6.2: only the paywalled journal page was found.
- Kechris1995 Theorem 9.10 and Weibel1994 Corollaries 7.8.10/7.8.12: books not held. The Weibel locator becomes moot under R01.
- Dooley's course notes: no legal source found.
- The README flags no locator as unverified.

## Source issues

- **Misprint** in Freed2012Wigner (arXiv:1112.2133v3) at Example 10, p. 3: the source says O(3) is the group of orthogonal transformations of SO(3); it should say orthogonal transformations of ℝ³, the isometries of the round 2-sphere; affects nothing.
- **Gap** in Benoist–Kobayashi (arXiv:1706.10131v2) at the proof of Lemma 3.2, p. 16: the source infers L^(2+ε) coefficients for bounded compactly supported |φ|, |ψ| directly from temperedness, yet Proposition 2.6 bounds only K-finite coefficients; it should dominate them by the coefficient of a compact K-invariant indicator, which is K-finite; affects the proof.
