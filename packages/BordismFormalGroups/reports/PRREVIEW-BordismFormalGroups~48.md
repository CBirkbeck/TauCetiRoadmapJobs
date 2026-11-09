# Review of BordismFormalGroups (pull request #1807 at 9753a7d)

**Verdict:** needs changes

:robot: Independent AI review (Claude Opus 5.5). I reviewed `TauCetiRoadmap/BordismFormalGroups/README.md` and `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` at this head in full: the seeded source sample, the headline theorem, ownership against main and the open pull requests, supplier order and the house shape. The adversarial table covers the sampled targets, the headline and every target a finding touches. I did not re-derive every F6 construction step.

## R01 (P2) — The Lubin–Tate universal deformation theorem is statable at the pins but absent

**Location.** `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 24–26: "the Lubin–Tate universal deformation theorem (no deformations of formal groups over complete local rings and no universal deformation ring)". README lines 876–884 (F5), which also give no theorem locator.

**Claim.** The docstring lists this F5 headline as not statable. Every carrier it needs exists at the pins: `FormalGroup`, `FormalGroup.map`, `TauCeti.FormalGroupIso`, `MvPowerSeries (Fin (h-1)) (WittVector p k)`, `WittVector.constantCoeff`, `IsLocalRing`, `IsAdicComplete`, and `FormalGroup.height` for the height hypothesis. A ⋆-isomorphism is a one-line predicate on native data. This roadmap owns the theorem: EllipticCohomology on main consumes "BordismFormalGroups F5's Lubin–Tate deformation" (its README line 568).

**Witness.** The statement below, in a scratch copy, elaborates with `lake env lean` against the pinned Mathlib and Tau Ceti. Its only warning is `declaration uses 'sorry'`. lubin-tate-1966 line 284 (Theorem 3.1, p. 56) proves it: a unique tuple in m^(h−1) and a unique ⋆-isomorphism.

**Repair.** Add the following to `Suggested.lean` (tested as written; the imports are the two already in the file):

```lean
/-- An isomorphism of formal groups over `A` is a ⋆-isomorphism (relative to `π : A →+* k`)
when its series reduces to the identity series. -/
def IsStarIso {A k : Type*} [CommRing A] [CommRing k] (π : A →+* k) {G H : FormalGroup A}
    (e : TauCeti.FormalGroupIso G H) : Prop :=
  PowerSeries.map π e.toHom.toPowerSeries = PowerSeries.X

/-- F5 (Lubin–Tate 1966, Theorem 3.1): a commutative formal group of height `h`, `1 ≤ h < ∞`,
over a perfect field `k` of characteristic `p` has a universal deformation over
`W(k)[[t₁, …, t_{h−1}]]`. -/
theorem lubinTate_universal_deformation {p : ℕ} [Fact p.Prime] {k : Type*} [Field k]
    [CharP k p] [PerfectRing k p] (F₀ : FormalGroup k) [F₀.IsComm] {h : ℕ} (h0 : 0 < h)
    (hF₀ : F₀.height p = h) :
    ∃ Γ : FormalGroup (MvPowerSeries (Fin (h - 1)) (WittVector p k)), Γ.IsComm ∧
      Γ.map ((WittVector.constantCoeff).comp MvPowerSeries.constantCoeff) = F₀ ∧
      ∀ (A : Type*) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
        [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [Algebra (WittVector p k) A]
        (π : A →+* k), Function.Surjective π → RingHom.ker π = IsLocalRing.maximalIdeal A →
        π.comp (algebraMap (WittVector p k) A) = WittVector.constantCoeff →
        ∀ (G : FormalGroup A) [G.IsComm], G.map π = F₀ →
        ∃! θ : MvPowerSeries (Fin (h - 1)) (WittVector p k) →ₐ[WittVector p k] A,
          IsLocalHom θ ∧ ∃! e : TauCeti.FormalGroupIso (Γ.map θ.toRingHom) G, IsStarIso π e := by
  sorry
```

Remove the theorem from the docstring's "not statable" list. In README F5, state the theorem with these hypotheses and the locator (Lubin–Tate 1966, Theorem 3.1, p. 56; the universal law is Proposition 1.1, p. 50), and name `IsStarIso` and `lubinTate_universal_deformation` there. Add Checks:

- h=1, F₀=𝔾ₘ over 𝔽̄_p: `Fin 0` makes the ring W(k), θ is the structure map, and every lift of 𝔾ₘ is uniquely ⋆-isomorphic to 𝔾ₘ⊗A.
- 𝔾ₐ (height ∞) is excluded by `hF₀`.
- Dropping the ⋆ condition breaks the uniqueness of θ at h=2, because Aut(F₀) acts on the deformation space.

Lubin–Tate allow any base ring R with R/I=k, so the perfect-field form is a stated scope choice. Say so in the README rather than presenting it as the theorem's generality.

## R02 (P2) — Steenrod algebras, Adams towers, transgression and the MO splitting have two owners

**Location.** README lines 37–44: "This roadmap owns the mod-p Steenrod algebras and HF_p-based Adams towers, the unoriented coefficient ring MO_* … TangentialBordism consumes F1–F2's formal laws, Steenrod and Adams carriers". The constructions are at lines 346–427 and 487–522.

**Claim.** TangentialBordism's open head (#942) claims the same objects and says this roadmap consumes them. Each roadmap hands the object to the other. On main this roadmap consumed "TB's mod-p Steenrod/Adams carriers", and this pull request moves ownership here without the other side agreeing.

**Witness.** `TauCetiRoadmap/TangentialBordism/README.md` at #942:
- Lines 54–55: "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes".
- §4.2, lines 1131–1140: the same transgression-as-additive-relation construction as README lines 365–367.
- §6.1 (B4.4), lines 1792–1798: the additive MO≃∨Σ^dHF₂ splitting, which line 503 here also owns.

StableHomotopyKTheory (#1227, line 16) and StableHomotopyKTheoryPartII (#1733, line 12) cite TangentialBordism B4.1–B4.2 as the owner.

**Repair.** Keep one owner, using either option:
- **Keep the move here.** In the scope section, list TangentialBordism B4.1–B4.2, B4.4 and B4.7 as moved into F2 (old → new, one line each). In the merge-order paragraph, state that #942 is revised before either merges to cite F2 and drop its own copies.
- **Return them to TangentialBordism.** Cite B4.1–B4.2, B4.4 and B4.7 from F2. Remove TangentialBordism's consumption of F1–F2 formal laws, which would otherwise close a cycle.

Either way, the depcheck must stay free of CYCLE lines.

## R03 (P3) — F6.5's generic foundations moved to G2.11 with no old → new line; main still cites F6.5 for them

**Location.** README lines 1897–1912: "Consume GeneralizedCohomology G2.11's enriched, quasicategorical and monoidal foundations …". On main, F6.5 owned these, including the bold item "Coherent model diagrams and stable enhancements".

**Claim.** That item now lives only in `TauCetiRoadmap/GeneralizedCohomology/README.md` line 1137 (G2.11). This README records no old → new mapping, so every citation of F6.5 for the generic foundations breaks when this pull request merges.

**Witness.** Citers of F6.5 for the moved material:
- EnhancedDerivedSheaves on main, unchanged by this pull request: line 1119 ("absolute Kan extensions … supplied by BordismFormalGroups F6.5"), line 1438 and line 1872.
- GeometryOfNumbersAndQuadraticArithmetic (#851), line 204, which cites the item by name.
- GeneralAlgebraicKTheoryPartII (#1742), line 911.

**Repair.** In the scope section, add one line per moved F6.5 item: "F6.5 'Coherent model diagrams and stable enhancements', the quotient/Ind, straightening, Kan-extension, monoidal-localization and operadic sub-lanes → GeneralizedCohomology G2.11". Repoint EnhancedDerivedSheaves' F6.5 citations to G2.11 in this pull request or a stacked one, and name that pull request in the merge-order paragraph.

## R04 (P3) — Twelve backticked Lean names of this roadmap are declared nowhere

**Location.** README lines 828 (`gradedComoduleFilteredPresentation`), 924/952/958 (`muSmashNilpotence`), 928 (`muSelfMapNilpotence`), 932 (`muHurewiczNilpotence`), 1256/1606/2218 (`muPtypicalRingComparison`), 1605/2220 (`muPtypicalPolynomialCoefficientIso`), 1775 (`moravaStabilizer_cohomology_vanishing`), 2141/2200/2255 (`torusFiniteCellMappingEulerComparison`), 2150 (`momentNormalMU_eulerPrecomposition_injective`), 2179 (`finiteProductCircleCharacters`), 2226 (`muPtypicalFiniteCohomologyComparison`), 2266 (`momentStratumExtension_nullhomotopy`).

**Claim.** A backticked name of this roadmap's own claims a `Suggested.lean` declaration. `Suggested.lean` declares only `nonempty_formalGroupIso_iff_height_eq`, and none of these twelve is statable at the pins: all need MU, stable homotopy or MU-module families.

**Witness.** `roadmaps grep --lean-only` finds none of the twelve in any `Suggested.lean` on main or at any open head. The README at #1854 for this roadmap contains none of the twelve as backticked names.

**Repair.** Replace each with a prose name, for example "the MU-smash nilpotence theorem", "the p-typical ring comparison BP→MU_(p)" and "the torus mapping–Euler comparison". #1854's version of this README already drops all twelve. Add no declarations.

## R05 (P3) — Conflicting heads for this README in #1854, with no stated order

**Location.** README line 12 at this head, "## Carriers, conventions and owners", against "## Scope and ownership" at #1808 and #1854.

**Claim.** #1807, #1808 and #1854 each carry a different full text of this README. The description states only that #1808 follows this pull request. Nothing says how #1854 ("Cut the dependency loops main acquired after the pin bump") relates to it.

**Witness.** `roadmaps overlaps`: "#1807 and #1854 conflict in … `TauCetiRoadmap/BordismFormalGroups/README.md`". The #1854 head adds `## Conventions`, `## Exact supplier contracts`, `## How to read the build` and `## Downstream consumers`, and drops the R04 names.

**Repair.** In the merge-order paragraph, state which pull request is rebased on which. Alternatively, carry #1854's text of this folder here and leave #1854 without changes to it. Do not keep two independent rewrites.

## R06 (P3) — The README is not in TauCetiRoadmap form, and most definitions lack API lists and Checks

**Location.** Line 1, "# Bordism, formal groups and chromatic operations". Line 12, a single "## Carriers, conventions and owners". Layer headings `## F1.` … `## F6.`. Line 2290, "## Order and references".

**Claim.**
- There is no `# Roadmap:` title and no `**Summary.**` paragraph.
- These sections are missing: `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` and `## Downstream consumers`.
- No layer ends with `### Examples` and `### Dependencies`.
- Defined objects have no API bullets and no `**Checks.**` lists. F3 (lines 597–640) defines BP⟨n⟩, E(n), K(n) and the Ω-spectrum spaces with no Check at all. F6.1 defines Bousfield classes and L_E with none.

**Witness.** `grep '^#'` on the file lists only the headings above. The #1808 and #1854 heads of this README already have the house sections.

**Repair.** Adopt the house shape, starting from #1854's section skeleton. Give each definition API bullets and at least three discriminating Checks. For K(n), for example:
- π_*K(n)=𝔽_p[v_n^(±1)] with |v_n|=2(p^n−1).
- K(n)∧H𝔽_p≃0 for 1≤n<∞.
- At p=2, K(1) is KU/2.

## R07 (P3) — "As comodule algebras" is more than the cited splitting gives; Miller §13 omits the proof

**Location.** Lines 436–438: "H_*(MU;𝔽_p)≅P_*⊗C as comodule algebras … (Ravenel, Corollary A1.1.18)". Lines 498–501: "H_*(MO;𝔽₂)≅A_*⊗P as comodule algebras … (Miller … Proposition 10.4 and Theorem 12.3; Ravenel, Corollary A1.1.18)". Lines 513–514: the ring π_*MO "(Thom 1954, Chapitre IV; Miller, Chapter 1, Section 13)".

**Claim.** Corollary A1.1.18 gives an isomorphism of left C-modules and Σ-comodules, not of algebras. Lemma 3.1.7 states only "as a left A_*-comodule". Miller 10.4 and 12.3 are A-module freeness statements. Miller §13 states the ring π_*MO but omits its proof.

**Witness.**
- ravenel-green lines 18101–18103 (C-module and comodule only) and line 3770 (Lemma 3.1.7).
- miller-cobordism lines 1371–1376: the ring "appears" to be 𝔽₂[x_n : n≠2^i−1]; "true but we will omit the proof".

**Repair.**
- Write "as left C-modules and comodules (Ravenel, Corollary A1.1.18)".
- Add the step the polynomial conclusion actually uses: lift the polynomial generators of the target Hopf algebra. The multiplication map C⊗(lifts)→M is then an algebra isomorphism by graded Nakayama and a Poincaré-series count.
- Cite Miller §13 as stating the ring without proof, and Thom 1954 for the proof.

The degree-5 Check (7=1+2+0+2+0+2) is unchanged.

## R08 (P3) — The docstring says "no spectra", but the pinned Tau Ceti has symmetric spectra

**Location.** `Suggested.lean` lines 27–28: "Quillen's theorem `L ≅ MU_*` and Thom's computation of `π_*MO` (no spectra, no `MU`, `MO` or Eilenberg–MacLane spectra)".

**Claim.** `TauCeti.SymmetricSpectrum` exists at the pin. What is missing is a stable model structure or stable homotopy category, stable homotopy groups, Thom spectra and Eilenberg–MacLane spectra.

**Witness.** The pinned `TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean` line 92: `abbrev SymmetricSpectrum := Mod SymmetricSequence.{0} SymmetricSequence.sphere`. No stable-equivalence or homotopy-group API exists in `TauCeti/AlgebraicTopology/Spectra/`.

**Repair.** Replace "no spectra" with "no stable homotopy category or stable homotopy groups of the pinned point-set `TauCeti.SymmetricSpectrum`, no Thom spectra `MU`, `MO`, no Eilenberg–MacLane spectra".

## R09 (P3) — Undefined term, invented abbreviations and a stage-less supplier citation

**Location and witness.**
- Line 1749, "Use F3's height-m Honda law": F3 (lines 597–640) defines no Honda law. Line 277 uses the term too.
- Abbreviations not defined anywhere in the file:
  - "G's" (lines 638, 664, 792, 869, 921, 1102, 1277, 1883, 2118, 2294, 2308)
  - "ELL's" (line 770)
  - "AT8.8's" (line 1380)
  - "CC/G5.7's" (line 2170)
  - "Elliptic E2" (lines 1853, 2074, 2113)
- "String supplies the resulting BO⟨4k⟩ space splitting" (line 622) reads as a supplier citation of StringOrientation.
- Line 2128, "AlgebraicTopology's manifold-to-abstract-CW comparison", names no stage. Its owner is AlgebraicTopology's Ownership paragraph (lines 66–68) and the pinned `TauCeti.IsTriangulable.finiteCWType`.

**Repair.**
- Define the height-m Honda law in F3 as the law classified by BP_*→𝔽_(p^m), v_m↦1 and v_i↦0 for i≠m (Ravenel, Definition A2.2.11, p. 367). Pin which generators are meant (Ravenel's A2.2.6 formula uses Araki's), and add a Check computing its p-series.
- Spell each roadmap out with its section: "GeneralizedCohomology G2.4", "EllipticCohomology E2", "AlgebraicTopology Stage 8.8", "CharacteristicClasses Conventions (the standard-character line, its line 203) / GeneralizedCohomology G5.7".
- Write "StringOrientation consumes this splitting for its BO⟨4k⟩ space splitting".
- Cite `TauCeti.IsTriangulable.finiteCWType` for the finite CW model.

## R10 (P3) — Two pinned-API descriptions in F1 do not match the pin

**Location.** Lines 124–125: "`TauCeti.LazardRing.lift` is the natural bijection Hom_ring(L,R) ≃ {F : FormalGroup R // F.IsComm}". Lines 129–133: `mvPolynomialEquiv` "… (module `Indecomposable`, …)".

**Claim.** The pinned equivalence runs the other way, and `mvPolynomialEquiv` is not in module `Indecomposable`.

**Witness.** Pinned `LazardRing/Basic.lean` line 311: `def lift : {F : FormalGroup R // F.IsComm} ≃ (LazardRing →+* R)`. `LazardRing/Polynomial.lean` line 112: `def mvPolynomialEquiv : MvPolynomial ℕ+ ℤ ≃ₐ[ℤ] LazardRing`.

**Repair.** Write "{F // F.IsComm} ≃ Hom_ring(L,R)". Name module `LazardRing.Polynomial` for `mvPolynomialEquiv`, keeping `Indecomposable` for `generator` and `cotangentBasis`.

## Verified sound

**Gate and build.**
- The worker's push gate at 9753a7d passes, with every check 0 and build OK. I re-ran it: every check except `outside-folder` is 0. Its 21 `outside-folder` lines all lie in the 13 folders this brief names as the pull request's own; `git diff --stat` excluding the 14 folders is empty.
- `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean`: one warning, `declaration uses 'sorry'`.
- Form: a single `import Mathlib` plus two `TauCeti.*` modules, no `set_option`, no sorry'd data, `theorem` only, one declaration.

**Depcheck.** `gate --depcheck … --movable`: "depcheck: 239 roadmaps, 2334 edges, 0 problem(s)", with no UPWARD, CYCLE or moved line.

**Signature check.** `#check @nonempty_formalGroupIso_iff_height_eq` in a scratch file elaborates to the README's binders: k a separably closed field, Fact p.Prime, CharP k p, F and G commutative. No binder was lost. The automated signature listing read docstring words as declarations (rows `,` and `and`); that is a tool artefact, not a file defect.

**Padding probe.** `simp`, `exact ⟨…height_eq…, simp_all⟩` and `aesop` each fail on the headline, so it is not padding. It is the only statable headline besides R01: Quillen, Thom, Landweber, Devinatz–Hopkins–Smith, Hopkins–Smith, Hopkins–Ravenel, fracture and Tate vanishing all need stable homotopy of spectra, which the pin lacks.

**Pinned names.** The F1 section (lines 1–318) has 198 backticked tokens.
- All 170 declaration names resolve in the pinned Tau Ceti or Mathlib, at the modules stated (two exceptions in R10).
- The 27 module tokens are existing files under `TauCeti/RingTheory/FormalGroup/` or `TauCeti/RingTheory/PowerSeries/`.
- The remaining token is this roadmap's own `nonempty_formalGroupIso_iff_height_eq`.

**Declarations opened at the pin (33).**
- `FormalGroup.height`, `height_eq_top_iff`, `height_eq_natCast_iff`, `one_le_height`, `height_eq_one_iff`, `height_map`, `height_𝔾ₐ`, `height_𝔾ₘ`, `TauCeti.FormalGroupIso.height_eq` and `height_smul`: `Height/Basic.lean` lines 200–356.
- `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` (`Logarithm/InfiniteHeight.lean` line 278, any field of characteristic p) and `existsUnique_logarithm_of_nsmulSeries_eq_zero` (line 249, every prime p).
- `existsUnique_eq_smul_lazardCocycle` (`SymmetricCocycle/Classification.lean` line 420, n≥2, any commutative ring); `lazardGcd_prime_pow` and `lazardGcd_eq_one_of_not_isPrimePow` (`SymmetricCocycle/Basic.lean` lines 206, 197).
- `LazardRing.lift` and `LazardRing.grading` (`LazardRing/Basic.lean` lines 311, 390); `mvPolynomialEquiv` (`Polynomial.lean` line 112); `generator` (`Indecomposable.lean` line 190).
- `ExponentTwoLazardRing`, `.Index` and `.lift` (`ExponentTwo/Universal.lean` lines 83–215).
- `PowerSeries.subst_X_add_X_eq_add_iff_of_natCast_eq_zero` (`AdditiveSeries.lean` line 127).
- `TauCeti.FormalGroupHom`, `FormalGroupIso` and `IsStrict` (`Hom.lean` lines 137, 351, 433).
- The `Obstruction.lean` module documentation, which carries the degree-by-degree route of the headline.
- Mathlib's `FormalGroup`, `FormalGroup.Point`, `𝔾ₐ`, `𝔾ₘ` and `map` (`Mathlib/RingTheory/FormalGroup/Basic.lean` lines 57–185), and `WittVector.constantCoeff` (`WittVector/Basic.lean` line 343).
- `TauCeti.SymmetricSpectrum` (line 92).

**Cross-roadmap citations resolved (16).**
- GeneralizedCohomology at this head: G2.4, G2.6, G2.7, G2.9, G2.11 (item 11, line 669, defined in this same pull request, so not only at #1808/#1854), G3.8 (it does contain the homotopy Milnor sequence), G3.9, G4.3 and G5.3–G5.7.
- AlgebraicTopology Stages 5.5, 8.8 and 8.10 (lines 118–130).
- CharacteristicClasses C3 (line 1212).
- TopologicalKTheory Conventions: β=[L]−1 with L=O(−1). This matches F2's x_K(O(1))=u⁻¹β=1 and F_K=x+y+uxy, since (1+a)(1+b)−1=a+b+ab.
- RepresentationTheory/SchurWeyl Layers 0, 2 and 5; RepresentationTheory/CompactGroups Layers 1–2.
- DGAInfinity Layer 8 (line 520).
- GeometricTopology "The smoothing-and-triangulation comparison (far horizon)", item 1 "Smooth implies PL" (lines 930, 938), on main.
- SymplecticGeometry/ConvexityToric T2 (line 73).
- ProfiniteCohomology on main.
- No cited id is dropped by an open pull request.

**Ownership checked by object** (Steenrod operations, Adem relations, Serre–Cartan, James construction, Toda brackets, Lubin–Tate deformation, finite localization, fracture, Tate vanishing):
- Over main and the open heads in the index, only R02 is a double owner.
- ChromaticHomotopyTheory (#1643) cites F6.1–F6.4 as suppliers.
- GeneralAlgebraicKTheoryPartII (#1742) §§4.5, 4.8 and 4.24 are stated all-spectra and T(n)-local variants of F6.3, F6.4 and F6.5, each citing this roadmap.
- HomotopySpheres, the former James owner, is on the never-cite list, so owning J(Y) here is right.

### Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Headline `nonempty_formalGroupIso_iff_height_eq` | k=𝔽̄_p, F=𝔾ₐ, G=𝔾ₘ | [p]_𝔾ₐ=pT=0 gives height ⊤; [p]_𝔾ₘ=(1+T)^p−1=T^p, order p¹, gives 1. RHS false; LHS false by `FormalGroupIso.height_eq` | holds | none |
| same | F=G | iso X; heights equal; both sides true | holds | none |
| same | k=𝔽_p (not separably closed), 𝔾ₘ against its twist by u∈ℤ_p^×, u≠1 | heights 1=1, so RHS true. Frobenius X^p is p versus pu in End=ℤ_p, so no 𝔽_p-isomorphism and LHS false | IsSepClosed needed; README Check present | none |
| same | p=2, k=𝔽̄₂, 𝔾ₘ | [2](T)=2T+T²=T², order 2=2¹, height 1 (not 0) | holds | none |
| same, Ravenel route (A2.2.12/A2.2.13) | t₀θ(v_n)=t₀^(p^n); t_iθ(v_n)^(p^i)+c=t_i^(p^n) | derivatives (p^n−1)t₀^(p^n−2), with p∤p^n−1, and −θ(v_n)^(p^i)≠0, so both separable with roots in k | holds | none |
| Lubin–Tate (R01 probe) | h=1, F₀=𝔾ₘ/𝔽̄_p | Fin 0 gives W(k); θ is the structure map; LT Thm 3.1 gives m^0 = a point, so a unique ⋆-iso | holds | add theorem |
| same | F₀=𝔾ₐ | height ⊤ is not (h:ℕ), so excluded | holds | none |
| same, wrong model without ⋆ | h=2 | Aut(F₀)=O_D^× moves points of m¹, so θ is not unique | ⋆ condition needed | none |
| d_n and C_n (F1) | n=2, 4, 6, 1 | d₄=gcd(4,6,4)=2=`lazardGcd_prime_pow` p=2,k=2; d₆=gcd(6,15,20,15,6)=1; d₁=0 is junk, excluded by n≥2; C₂=XY | holds | none |
| cocycle uniqueness, torsion ring | R=ℤ/2, n=2 | r·XY=0 forces r=0 | holds | none |
| Lazard grading | a₁₁, x₁ | 2(1+1−1)=2 (ravenel-green line 19982); x₁ has degree 2·1=2 | holds | none |
| `LazardRing.lift` direction | pin line 311 | README Hom→{F}; Lean {F}→Hom | mismatch | R10 |
| Invariant differential | 𝔾ₘ, X+Y+XY | F_X(0,T)=1+T so P=(1+T)⁻¹; P(F)F_X=(1+Y)/((1+X)(1+Y))=P(X) | holds | none |
| same, wrong model | P=1+T | (1+X+Y+XY)(1+Y)≠1+X | rejected | none |
| `coeff_log` | 𝔾ₘ | p_(n−1)/n=(−1)^(n−1)/n, which is log(1+T) | holds | none |
| ℚ-algebra hypothesis | R=ℤ | log_𝔾ₘ has coefficient −1/2 in degree 2, not in ℤ | needed | none |
| `log_smul` normalisation | φ with φ′(0)=c′ | linear coefficient of c·log_F(φ⁻¹X) is c/c′=1, so c=φ′(0) | holds | none |
| Ravenel A2.1.6 versus P | commutative F | F₂(t,0)=∂F/∂y(t,0)=F_X(0,t) | agree | none |
| Exponent two | [2]_F=0 | the linear coefficient 2 must vanish, so 2=0 | holds | none |
| same | 𝔾ₐ/𝔽₂ | additive series are supported on 2^j; normalised gives g=X, unique | holds | none |
| exponent-two universal ring versus MO_* | degrees | generators i with i+1≠2^k: {2,4,5,6,8,…}={d≠2^k−1} | agree | none |
| char-2 cocycles | n=2, 3, 6 | C₂ diagonal a²≠0; C₃≡X²Y+XY² (d₃=3 a unit); n=6 gives X⁴Y²+X²Y⁴≠0 | holds | none |
| Quillen Thm 3 | F(X,X)=0 | equals [2]_F=0 (quillen-fgl-bulletin line 109) | agree | none |
| `height` | 𝔾ₘ/𝔽_p; 𝔾ₐ | order of T^p is p, giving 1; ⊤ | holds | none |
| `one_le_height` | any F, char p | linear coefficient p=0, so order≥2 and h≥1 | holds | none |
| Steenrod instability (Check) | a∈H¹(RP^∞) | Sq¹a=a² (top), Sq²a=0 (2>1) | holds | none |
| odd-p instability | p=3, \|x\|=2 | P¹x=x³; P²x=0 | holds | none |
| Milnor degrees | p=2: ξ₂, Q₁; p=3: ξ₁, τ₀, τ₁, Q₁ | 3, 3 (\|Sq²\|+\|Sq¹\|); 4, 1, 5, 5 (\|P¹\|+\|β\|) | holds | none |
| Adams d₂ | (s,t)=(1,2) | (1,2)+(2,1)=(3,3); t−s goes from 1 to 0 | holds | none |
| completion Check | M(ℤ/2^∞) | lim (ℤ/2^∞)/2^k=0; L₁=T₂(ℤ/2^∞)=ℤ₂ in π₁ | holds | none |
| Kudo (GW Thm 6.5(3)) | y of degree 2k | y^(p−1)⊗τy lies in E^(2k+1, 2k(p−1)), so r=2k(p−1)+1; target degree 2kp+2=\|βP^kτy\| | holds | none |
| Serre–Cartan locator | Hatcher p. 500 | the statement starts on printed p. 500 (hatcher-at line 21565) | holds | none |
| MU Hurewicz Check | x₁…x₆ | i+1=2,3,4,5,6,7 gives 2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆, matching −pb_i iff i=p^k−1 (ravenel-green line 3754) | holds | none |
| MU E₂ | a_i bidegree | (1, 2p^i−1); at p=2 represented by [ξ_(i+1)] | README right; source misprint | Source issues |
| MO degree 5 | ranks | p(5)=7; A_*: ξ₁⁵, ξ₁²ξ₂ gives 2; P: x₅ gives 1; Künneth 1+2+0+2+0+2=7 | holds | none |
| π₄MO | basis | x₄, x₂², rank 2 | holds | none |
| 2·id_MO=0 route | π₀MO=𝔽₂ | the cofiber has exponent 4; lowest π_k⊗𝔽₂≠0 contradicts H_*(C;𝔽₂)=0 | holds | none |
| "comodule algebras" (R07) | A1.1.18 | the source gives C-module and comodule only; the algebra iso needs Nakayama and counting | overclaim | R07 |
| Steenrod/MO ownership (R02) | #942 lines 54–55, 1131, 1792 | both READMEs claim B4.1–2/B4.4/B4.7 content | double owner | R02 |
| K-theory law (F2) | L=O(1) on CP¹ | x_K=u⁻¹([O(−1)]−1)=u⁻¹β=1; x(L⊗M)=x+y+uxy | holds | none |
| Smooth finite CW (F6.6) | compact smooth C | Whitehead triangulation (GeometricTopology item 1) is finite, so `TauCeti.IsTriangulable.finiteCWType` applies | holds | R09 locator |
| K(n)^(tC_p)=0 (F6.5) | [p](x)=v_nx^(p^n) | v_n a unit gives x^(p^n)=0, so Euler inversion gives 0 | holds | none |
| Adams v₁ maps | p odd; p=2 | 2p−2=\|v₁\|; 8=2·4·(2−1), i.e. v₁⁴ | holds | none |
| Thick classification boundary | S/p | K(0)_*(S/p)=0 and K(1)_*(S/p)≠0, so S/p∈C₁∖C₂ | holds | none |

## Not verifiable

- bousfield-1979, §6, Theorem 6.6 (F2: HF_p-nilpotent completion equals derived p-completion for bounded-below X). It is settled as uncertified (paywalled) and cited by locator; I did not request it. The cached Ravenel Theorem 2.1.1(ii) (ravenel-green line 2632) supports the finite-type tensor form.
- thom-1954, Chapitre IV (the ring π_*MO). It is settled as uncertified. Miller states the ring without proof (miller-cobordism line 1376), so R07 asks the README to say so.

## Source issues

- **Misprint** in ravenel-green at Corollary 3.1.10, printed p. 64: the source says the class a_i in Ext^(1,2p^i−1) is represented by [ξ_i] when p=2; it should be [ξ_(i+1)], whose degree 2^(i+1)−1 equals 2p^i−1 and which agrees with a₀=[ξ₁] on p. 62; affects nothing.
