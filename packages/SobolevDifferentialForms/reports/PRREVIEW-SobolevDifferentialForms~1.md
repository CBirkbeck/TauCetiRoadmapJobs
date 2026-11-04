# Review of SobolevDifferentialForms (pull request #1609 at 9a92112)

**Verdict:** needs changes

Gate at this head (worker's run, data): `sorry-data=11 … build=0 FAIL`; every other check is 0. I re-elaborated `TauCetiRoadmap/SobolevDifferentialForms/Suggested.lean` with `lake env lean` (19 `sorry` warnings, no errors) and ran the dependency check (`depcheck: 205 roadmaps, 1498 edges, 0 problem(s)`, vacuous: the README has no `*Needs:*` lines, see R06). Pins checked: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` (the branch manifest); the main manifest pins Tau Ceti `358314d4`, checked as well where a declaration was missing.

## R01 (P1) — eleven sorry'd data declarations; the Lean file is an API catalogue, not the acceptance test

Location: `TauCetiRoadmap/SobolevDifferentialForms/Suggested.lean` lines 38, 41, 43, 46, 53, 64, 112–117, 136, 139, 142, 149; docstring lines 7–10 ("The statements here suggest Lean forms for particular items … not exhaustive").

Claim: the gate rule "no `sorry` in the body of a `def`, `abbrev`, `instance` or `opaque`" and the brief's rule "no sorry'd data … and nothing that mentions one".

Witness: `instance : NormedAddCommGroup (Covector n k) := sorry` (line 38), `def hodgeStar … := sorry` (64), `def dL … := sorry` (142), `def equivW1p … := sorry` (149); `wpΛSubmodule` (112) has `add_mem' := sorry` etc. Every theorem in the file mentions one of these, so the whole file is `sorryAx` data: `inner_eq_sum` quantifies over an inner product that is `sorry`, `hodgeStar_hodgeStar` over a map that is `sorry`.

Repair (tested: the carriers below exist at the pin, file and line given): rewrite the file as the acceptance test. (a) Give `Covector.toExteriorPower` a real body: `ContinuousAlternatingMap.toAlternatingMap`, then `exteriorPower.alternatingMapLinearEquiv` (`Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:212`), then `(LinearEquiv.ofBijective _ (LinearMap.BilinForm.bijective_exteriorPower (innerₗ (E n)) k hB)).symm` (`…/ExteriorPower/BilinForm.lean:41`); transport the `InnerProductSpace` of `⋀[ℝ]^k (E n)` (`Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean:121,124`) along it, and define `hodgeStar` as `exteriorPower.hodgeStar (innerₗ (E n)) hB vol hkl` (`…/ExteriorPower/HodgeStar.lean:48`) conjugated by it, with `vol` the unique trivialisation sending `(EuclideanSpace.basisFun (Fin n) ℝ).toBasis.topVector` (`…/ExteriorPower/WedgePairing.lean:78`) to `1`. (b) Give `wpΛSubmodule` its three proofs (linearity of the integral identity) or state `WpΛ` as the carrier of a `ClosedSubmodule`, as `TauCeti.W1p` does (`TauCeti/Analysis/Sobolev/W1p/Basic.lean:375`). (c) Delete `equivL`, `valueL`, `dL`, `equivW1p` and the `CompleteSpace` instance as sorry'd data: `valueL`/`dL` are `ContinuousLinearMap` compositions of the `Lp` projections once `WpΛ` is a submodule of `Lp (FormJet n k) p`, or they are README targets. (d) Replace the docstring by the standard form: this file states the headline theorems against the pinned APIs, and names each headline that is not statable and what it lacks (see R05). Anything in (a)–(c) that cannot be given a real body is a README target, not a `sorry`'d `def`.

## R02 (P1) — Tau Ceti declarations cited as supplied do not exist at the pin

Location: `README.md` lines 4–5 ("Tau Ceti has test forms with `TestFunction.extDerivCLM` (`d ∘ d = 0` on `𝓓(Ω, E [⋀^Fin k]→L[ℝ] F)`)"), 72–74 ("the formal adjoint of `TestFunction.extDerivCLM`"), 102–106 ("`TauCeti/Analysis/Sobolev/WeakDeriv/Divergence.lean`, the trace of a full weak derivative").

Claim: these are supplier citations the duality formulation of item 1 and the divergence link of item 9 rest on.

Witness: at the branch pin `a91d3aaf` and at the main pin `358314d4`, `grep -rn extDerivCLM TauCeti/` is empty; `TauCeti/Analysis/Sobolev/WeakDeriv/` contains `Basic, Laplacian, Limit, Local, TemperedDistribution, Translation` and no `Divergence.lean`; `TauCeti/Analysis/Calculus/DifferentialForm/` has only `Const.lean` (constant forms are closed). Test forms `𝓓(Ω, F)` exist (`TauCeti/Analysis/Sobolev/Wkp/Zero.lean:225` uses the notation), but no exterior derivative on them.

Repair: own both. In Milestone 1 define `d` on test forms `𝓓(Ω, Covector n k) → 𝓓(Ω, Covector n (k+1))` (pointwise `extDeriv`, with the support and smoothness proofs), prove `d ∘ d = 0` on it and the adjointness with the test-form codifferential; in item 9 define the divergence of a weakly differentiable field as the trace of its `TauCeti.HasWeakFDerivOn` derivative here (one definition, with its Checks), and state the link to the weak `d` in degree `n − 1` against it. If these exist in a Tau Ceti pull request, build them here with the same names and shapes (README "But never wait").

## R03 (P2) — the Standing setting re-plans ComplexKahlerGeometry K5a

Location: `README.md` lines 23–57 (inner product on `E [⋀^Fin k]→L[ℝ] ℝ` by the Gram determinant, identification with `⋀[ℝ]^k E`, the Hodge star with `α ∧ ⋆β = ⟪α, β⟫ vol`, `⋆⋆ = (−1)^{kl}`, isometry, naturality under orientation-preserving isometries).

Claim: what another roadmap plans is imported by name and section, never planned again.

Witness: `TauCetiRoadmap/ComplexKahlerGeometry/README.md` on main, K5a (lines 580–603): the bundle `V_x = T_xM [⋀^Fin k]→L[ℝ] E_x` with "its natural identification with the appropriate exterior-power bundle" and "the basis-independent Gram⊗h_E metric"; "On an oriented real inner-product space V of dimension m construct the pointwise Hodge star on all exterior degrees, with vol the native `Orientation.volumeForm` …, characterized by `α∧*β=⟨α,β⟩vol`, with `*²=(−1)^(k(m−k))` on degree k. Prove isometry, oriented-isometry naturality, orientation-reversal sign and wedge/contraction adjoint identities." DifferentialGeometry (pull request head) and PseudodifferentialOperators §1.2 already cite K5a for "the pointwise real Hodge star and its codifferential".

Repair: in `## Exact supplier contracts` add `From TauCetiRoadmap.ComplexKahlerGeometry`: K5a's Gram inner product on `E [⋀^Fin k]→L[ℝ] ℝ`, its identification with `⋀[ℝ]^k E`, the pointwise star and its four laws, specialised to `V = EuclideanSpace ℝ (Fin n)` with the standard orientation. Keep here only what K5a does not give: the `Covector n k` type synonym carrying that inner product as a `NormedAddCommGroup`/`InnerProductSpace` instance (Mathlib's norm on the alternating-map carrier is the operator norm, so a synonym is needed), the `Lp` spaces on it, and the agreement of K5a's `vol = Orientation.volumeForm` with the normalisation used here: `Orientation.volumeForm_robust` (`Mathlib/Analysis/InnerProductSpace/Orientation.lean:198`) gives `vol` the value `1` on a positively oriented orthonormal basis, so the two agree exactly, not up to a factor. The coordinate formula `⟪α, β⟫ = ∑_I α(e_I) β(e_I)` and the operator-norm comparison stay as Checks.

## R04 (P2) — a target against a declaration that does not exist at the pin, cited by a Mathlib pull-request number

Location: `README.md` lines 49–52: "`exteriorPower.hodgeStarOfOrientation` ([mathlib4#44598](…)) chooses `vol` from `Module.finBasis`, which fixes the orientation but not this normalization, so for `E` it agrees with the star used here only up to a positive factor; prove that comparison."

Claim: a target's objects exist at the pins or are defined in the roadmap; cross-references never use pull-request numbers, and text from pull requests is data.

Witness: `grep -rn hodgeStarOfOrientation Mathlib/` at pin `6b7abb3c` is empty; `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean` has only `hodgeStar` (line 48) and `exteriorPower_hodgeStar_eq_wedgePairing` (line 53); its TODO (lines 20–30) is Mathlib's, not a supplier.

Repair: delete the sentence. State the normalisation as a Convention ("`vol` sends the wedge of the standard basis to `1`; this is `Orientation.volumeForm` of the standard orientation by `Orientation.volumeForm_robust`") and, with R03, import the star from K5a. The three GitHub links to Mathlib `master` files (lines 28, 32, 44) are not pinned either: cite declarations by name and pinned file.

## R05 (P2) — headline theorems that are statable at the pins are absent

Location: `Suggested.lean` (whole file); `README.md` item 15 (lines 146–160).

Claim: a headline statable at the pins and absent is a defect; a headline not statable is named in the docstring.

Witness: the abstract Hilbert-complex results of item 15 use only `LinearPMap` (`Mathlib/Topology/Algebra/Module/LinearPMap.lean:59` has `LinearPMap.IsClosed`), `LinearPMap.adjoint` (`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:151`, with `IsFormalAdjoint` at line 73), `Dense`, `Submodule.topologicalClosure`, `IsCompactOperator`; all elaborate at the pin (`#check` in my scratch probe). None is stated: not the Hodge decomposition `Wᵏ = closure(range dᵏ⁻¹) ⊕ 𝔥ᵏ ⊕ closure(range dᵏ*)`, not "range dᵏ closed ⇔ Poincaré inequality on `dom dᵏ ∩ (ker dᵏ)ᗮ`", not "compact `dom dᵏ ∩ dom dᵏ⁻¹* ↪ Wᵏ` ⇒ closed ranges and `dim 𝔥ᵏ < ∞`", not the weight independence (Picard Lemma 2; `lsw2026` Theorem 2.11). The headlines that are not statable (Picard compactness, items 19–20; Gaffney on the cube, 17; gluing, 14; Green and traces, 11–13; pullback, 10; density, 6) are not named in the docstring either.

Repair: state item 15's four theorems for a pair `d₀ : W₀ →ₗ.[ℝ] W₁`, `d₁ : W₁ →ₗ.[ℝ] W₂` of closed densely defined operators with `range d₀ ≤ ker d₁` (hypotheses `d₀.IsClosed`, `Dense (d₀.domain : Set W₀)`, `[CompleteSpace Wᵢ]`), and list the others in the docstring with the missing carrier (`WᵖΛᵏ(Ω)` with its weak `d`, the Lipschitz-domain predicate and tangential trace).

## R06 (P2) — the README is not in roadmap form: no supplier contracts, no `*Needs:*` lines, no Checks, most targets without a locator

Location: `README.md` throughout: headings `## Standing setting`, `## Milestone k`, `## Boundaries`, `## Acceptance criteria`; items 1–20.

Claim: the normative shape (README "Writing a roadmap", and the brief): `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n` prose subsections ending in `*Needs:*`, `### Examples`, `### Dependencies`, `## Downstream consumers`; every definition with its API and at least three discriminating Checks; every theorem with exact hypotheses and a locator; every layer with its dependencies.

Witness: `grep -c 'Needs:' README.md` = 0, so the dependency check has no edge to read and its "0 problems" is vacuous; `grep -c 'Checks' README.md` = 0 (no Check anywhere, although the file defines `Covector`, `⋆`, `δ`, `HasWeakExtDerivOn`, `WᵖΛᵏ`, `WᵖΛᵏ₀`, `H*Λᵏ`, `tr`, Hilbert complexes); items 1–14 and 16 carry no locator at all (Meyers–Serrin for forms, pullback bounds, Green, zero-trace characterisation, gluing); the only locators are "Brüning–Lesch; Arnold–Falk–Winther §3", "Picard, Lemma 2", "(2.3)", "Chapter 3", "Theorem 4.10". The definitions carry no API lists; "Boundaries" and "Acceptance criteria" replace Scope and Downstream consumers.

Repair: rewrite in the house shape (model: `TauCetiRoadmap/QuaternionicAnalysis/README.md` on main). Supplier contracts: `From Mathlib` (the declarations of R01/R03/R05 with files), `From Tau Ceti` (`TauCeti.HasWeakFDerivOn` `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:248`, `TauCeti.W1p` `…/W1p/Basic.lean:375`, `TauCeti.W1p0` `…/W1p/Zero.lean:147`, Rellich `TauCeti.W1p0.isCompactOperator_valueL` `…/Sobolev/RellichKondrachov.lean:141`, Meyers–Serrin `TauCeti.W1p.dense_contDiffOn_representatives` `…/W1p/MeyersSerrin.lean:216`, `TauCeti.Wkp`), `From TauCetiRoadmap.PDE` (Lane A.6: the Lipschitz-domain predicate by description, the `W^{1,p}` trace, extension and Rellich on bounded Lipschitz domains), `From TauCetiRoadmap.GeometricMeasureTheory` (G6: Gauss–Green, BV integration by parts with the trace term, gluing across a Lipschitz interface; `μHE[n−1]`), `From TauCetiRoadmap.ComplexKahlerGeometry` (K5a, R03). Locators verified in this review that the targets can carry: `afw2006` (2.7) line 745 (the codifferential sign), (2.8) line 747 and (2.10)–(2.11) lines 798–802 (the two adjoints of item 5), Theorems 2.1–2.3 and (2.18) lines 940–995 (compactness, Poincaré, closed range, Hodge); `afw2010` §3.1.3 lines 1030–1087 ((14)–(16), compactness property) and Theorem 4.1 line 2118 (the adjoint of `d` on `HΛᵏ⁻¹` is `δ` on `˚H*Λᵏ`); `picard1984` Lemma 2 line 308 (p. 157), (2.3) line 277 (p. 157), Chapter 3 lines 418–484 (pp. 161–162; the model domain there is the unit ball, the cube is this roadmap's choice through `lsw2026`); `lsw2026` Theorem 2.11 line 219 (weight independence, for `a` with `ℜa ≥ c`, one direction), Theorem 4.10 line 760 (Gaffney equality on `(0,1)^d`, vector fields). Brüning–Lesch and Arnold 2018 are paywalled: cite them by theorem number or drop them.

## R07 (P3) — supplier names that are not the suppliers' names

Location: `README.md` line 123 (`Set.IsLipschitzDomainWith`), 121 ("Geometric measure theory G6"), 159–160 ("Tau Ceti's unbounded-operator API"), 6 (`TauCeti.Wkp`).

Witness: PDE on main names no Lean predicate for Lipschitz domains (its A.6 describes it in prose, lines 248–258); `Set.IsLipschitzDomainWith` occurs only in open pull requests that revise PDE (#1614) or depend on them (#1612), which are not suppliers; the open PDE head at #93 uses `IsLipschitzDomain`. Tau Ceti's `LinearPMap` files (`TauCeti/LinearAlgebra/LinearPMap/*.lean`) hold only `congr_fun`, `neg_smul`, shifts and restriction of scalars; the adjoint and closedness API is Mathlib's (R05).

Repair: cite PDE Lane A.6's predicate by description, GeometricMeasureTheory by its roadmap name, and Mathlib's `LinearPMap.adjoint`/`IsClosed` for the unbounded-operator API.

## R08 (P3) — README and Lean disagree on names and generality

Location: `README.md` lines 84, 97 (`TauCeti.WpΛ Ω p k`, `TauCeti.WpΛ₀ Ω p k`), 21–22 (a `k`-form is a function `Ω → …`), 34 (`Covector.toExteriorPower : … ≃ₗ[ℝ] …`); `Suggested.lean` lines 85, 53, 124.

Witness: the Lean declares `TauCetiRoadmap.SobolevDifferentialForms.WpΛ n Ω p k` and no `WpΛ₀`; forms are `E n → Covector n k`; `toExteriorPower` is `≃ₗᵢ[ℝ]`.

Repair: write the declared names (no `TauCeti.` prefix, with the `n` argument), add `WpΛ₀` to the Lean only if it becomes statable, and make the README's domain of a form the Lean's (functions on `E`, conditions on `Ω`).

## R09 (P3) — padding in `Suggested.lean`

Location: lines 48 (`equivL_apply`, a definitional restatement), 130 (`example … InnerProductSpace ℝ (HΛ n Ω k) := inferInstance`), 71–76 (`toExteriorPower_hodgeStar`, the definition's own characterisation), 57, 119, 145 (API lemmas), 94 (a bridge lemma).

Repair: delete them from `Suggested.lean`; the README keeps them as API bullets and Checks (one-tactic probes are not meaningful here because every one depends on sorry'd data, R01).

## R10 (P3) — hypotheses to tighten

Location: `README.md` item 14 (lines 136–140), item 1 (lines 69–71), item 10 (lines 112–113).

Witness: item 14 asks `closure Ω ⊆ ⋃ closure Ωᵢ` and `Ω ⊆ ⋃ closure Ωᵢ` (the second follows from the first) but never `Ωᵢ ⊆ Ω`, without which "`u ∈ LᵖΛᵏ(Ω)` Lipschitz on each `closure Ωᵢ`" is not meaningful; the counterexample `sign x₁ dx₁` for "`1 ≤ k ≤ n − 1`" is a `1`-form (for `2 ≤ k ≤ n − 1` take `sign x₁ dx₁ ∧ dx₂ ∧ … ∧ dx_k`); the affine bound needs `B` invertible explicitly (it is sharp: `B = 2·Id`, `u` any form, gives equality `2^k 2^{−n/p}`).

## Verified sound

Gate and build: worker's gate at `9a92112` (all checks 0 except `sorry-data=11`); `lake env lean` on `Suggested.lean` exits 0 with 19 `sorry` warnings; a scratch copy with `#check @name` for all 21 declarations and `#synth` for the five instances elaborates and the printed types agree with the README's statements (no binder lost: `Fact (1 ≤ p)` is carried explicitly on `wpΛSubmodule`, `WpΛ`, `valueL`, `dL`, `equivW1p`). Depcheck: `0 problem(s)` (vacuous, R06). Not in the merge order's earlier list but on main and so admissible: PDE, GeometricMeasureTheory, ComplexKahlerGeometry, DifferentialGeometry, OperatorTheory. Ownership against open pull requests: searched the 438 heads with `roadmaps grep` for Hilbert complexes, the weak exterior derivative, Sobolev forms, `H(curl)`/`H(div)`, Gaffney, Picard–Weber–Weck, Hodge decomposition, `Covector`, Hodge star: no second owner of the Sobolev spaces of forms, the weak `d`, the abstract Hilbert complex or the Picard compactness; the Hodge star and Gram metric are owned by ComplexKahlerGeometry K5a on main (R03); IncompressibleFlows (#237) has a Helmholtz–Leray decomposition on the torus only.

Library declarations opened at the pin: `exteriorPower.hodgeStar` and `exteriorPower_hodgeStar_eq_wedgePairing` (`HodgeStar.lean:48,53`), `wedgePairing`, `Module.Basis.topVector`, `isUnit_apply_topVector`, `wedgePairing_eq_apply_topVector_smul` (`WedgePairing.lean:42,78,92,103`), `LinearMap.BilinForm.exteriorPower`, `bilinForm_ιMulti_ιMulti`, `bijective_exteriorPower` (`BilinForm.lean:34,37,41`), the `InnerProductSpace.Core` on `⋀[ℝ]^n E` with `innerProductForm = pairingDual ∘ map n (innerₗ E)` (so `B.exteriorPower k` for `B = innerₗ E` is literally the inner product), `inner_ιMulti_ιMulti` (Gram determinant), `OrthonormalBasis.exteriorPower` indexed by `Set.powersetCard I n` (`InnerProductSpace/ExteriorPower.lean:52–53,127,144`), `alternatingMapLinearEquiv` (`ExteriorPower/Basic.lean:212`), `extDeriv`, `extDeriv_extDeriv` (`Calculus/DifferentialForm/Basic.lean:72,234`), `ContinuousAlternatingMap.alternatizeUncurryFin` (`Normed/Module/Alternating/Uncurry/Fin.lean:124`), `Set.powersetCard.ofFinEmbEquiv` (`Order/Hom/PowersetCard.lean:38`), `WithLp` (structure, `Normed/Lp/WithLp.lean:49`), `LinearPMap.IsClosed`, `LinearPMap.adjoint`, `IsFormalAdjoint`, `Orientation.volumeForm_robust`; Tau Ceti: `HasWeakLineDerivOn` (`WeakDeriv/Basic.lean:209`: `CompleteSpace F ∧ LocallyIntegrableOn u Ω μ ∧ LocallyIntegrableOn u' Ω μ ∧ ∀ φ : 𝓓(Ω, ℝ), ∫ lineDeriv φ • u = −∫ φ • u'`), `HasWeakFDerivOn` (:248, every direction), `Sobolev1Jet = WithLp 2 (ℝ × E)` and `W1p` (`W1p/Basic.lean:85,375`), `W1p0` (`W1p/Zero.lean:147`), `W1p0.isCompactOperator_valueL` (`RellichKondrachov.lean:141`), `W1p.dense_contDiffOn_representatives` (`MeyersSerrin.lean:216`), `Wkp` (`Wkp/Zero.lean:267`).

Cross-roadmap citations resolved: PDE Lane A.6 on main (`TauCetiRoadmap/PDE/README.md:243–258`: trace, extension, Rellich, the Lipschitz-domain predicate in prose, `μHE[n−1]`); GeometricMeasureTheory G6 on main (`…/GeometricMeasureTheory/README.md:275–296`: BV trace, Gauss–Green, integration by parts with the trace term, gluing across a Lipschitz interface); ComplexKahlerGeometry K5a on main (R03); DifferentialGeometry on main (no Sobolev forms, as the README says).

Sources read: `afw2006` (author page), `afw2010` (arXiv 0906.4325v3), `lsw2026` (arXiv 2608.31054v1), `picard1984` (GDZ scan, OCR; running heads give the printed page). Sampled targets (15, none by heading) and what the text says: codifferential sign (`afw2006` line 745: `⋆δω = (−1)^k d⋆ω` on `k`-forms, equivalent to the README's `δ = (−1)^{n(k+1)+1} ⋆d⋆`, computed below); `H*Λᵏ = ⋆HΛⁿ⁻ᵏ` (line 762); the two adjoints of item 5 (lines 798–802 and `afw2010` line 2118); harmonic forms `HΛᵏ ∩ ˚H*Λᵏ`, `dω = 0 = δω` (line 806); Hodge decomposition `L²Λᵏ = Bᵏ ⊕ Hᵏ ⊕ ˚B*ᵏ` (lines 968–975); Poincaré on `Zᵏ⊥` (line 952) and closed ranges (Theorem 2.3, line 954); Hilbert complex definition, domain complex, `(14)–(16)`, "compactness property ⇒ Fredholm ⇒ closed" (`afw2010` lines 1030–1087); weight independence (`lsw2026` Theorem 2.11 line 219, with `ℜa ≥ c`; `picard1984` Lemma 2 line 308, admissible `ε` symmetric bounded positive definite, p. 157); dual boundary conditions by `⋆` (`picard1984` (2.3) line 277); bi-Lipschitz reduction, the weight `(−1)^{…} ⋆Φ^*⋆Φ^{*−1}` and Lemma 2 removing it (`picard1984` lines 470–481, p. 162; the model domain is the unit ball); Gaffney equality on the cube for `H₀(Curl) ∩ H(div)`, `u ∈ H¹(Q)^d` (`lsw2026` Theorem 4.10 line 760, any dimension, `k = 1` only, as the README says); Rellich for `W^{1,p}_0` at the pin (`RellichKondrachov.lean:141`); PDE A.6 and GMT G6 (above). All agree with the README as written except that no locator points to them (R06).

Adversarial table (statement, instances, values, result, change):

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Weak `d` identity, item 1 / `HasWeakExtDerivOn` | `k = 0`, `v = (v₀)` | RHS `= −∫ u ∂_{v₀}ψ`; LHS `∫ ψ w(v₀)` | the weak directional derivative | none |
| same | `k = 1`, `v = (v₀,v₁)`, smooth `u` | RHS `= −∫ u(v₁)∂_{v₀}ψ + ∫ u(v₀)∂_{v₁}ψ = ∫ ψ [∂_{v₀}u(v₁) − ∂_{v₁}u(v₀)]` | equals Mathlib's `extDeriv` (`alternatizeUncurryFin`, `∑_j (−1)^j`) | none |
| `WᵖΛⁿ = LᵖΛⁿ`, item 8 | `k = n`, any `u ∈ L¹_loc`, `v : Fin (n+1) → E` | `∑_j (−1)^j u_x(removeNth j v) ℓ(v_j) = (ℓ ∧ u_x)(v) = 0` (an `(n+1)`-form on `ℝⁿ`) | holds with no hypothesis, as the Lean `def` gives | none |
| `d∘d = 0` weakly, item 2 / `ae_eq_zero` | `k = 0`, `u ∈ W^{1,1}_loc` | `∫ z(v₀,v₁)ψ = ∫ u (∂_{v₀}∂_{v₁} − ∂_{v₁}∂_{v₀})ψ = 0` | true | none |
| `k = 0` equivalence with `HasWeakFDerivOn` | both definitions | both: `L¹_loc` of `u`, of `U(·)v`/`w`, and `∫ ∂_vψ·u = −∫ ψ·U v` | equivalent (`Covector n 1` norm dominates `‖U x v‖`) | none |
| converse fails for `1 ≤ k ≤ n−1` | `u = sign x₁ dx₁`, `n ≥ 2` | `du = ∂₁sign(x₁) dx₁∧dx₁ = 0`; `∂₁ sign x₁ = 2δ(x₁) ∉ L¹_loc` | true for `k = 1` only | R10 |
| `⟪α,β⟫ = ∑_I α(e_I)β(e_I)` / `inner_eq_sum` | `k = 0`; `k > n`; `k = 1` | `k=0`: one term `α()β()`; `k>n`: empty sum `0` and `Covector = 0`; `k=1`: `∑_i α(e_i)β(e_i)` = Euclidean dual pairing | consistent with the transport along `B.exteriorPower` | none |
| operator norm not Hilbert, line 23 | `n = 4, k = 2`, `α = e¹∧e² + e³∧e⁴` | Gram norm `√2`, operator norm `1`; for `k = 1` the two norms coincide | true for `k ≥ 2` | Check wanted (R06) |
| Hodge star convention | `n = 2, k = 1` | Mathlib: `⟪⋆e₁, y⟫ = vol(e₁∧y)` gives `⋆e₁ = e₂`, `⋆e₂ = −e₁`; README `α∧⋆β = ⟪α,β⟫vol` gives the same | same map | none |
| `⋆⋆ = (−1)^{kl}` | basis `e_I`, `k + l = n` | `⋆e_I = sign(I) e_{I^c}`, `⋆⋆e_I = sign(I)sign(I^c) e_I`, `sign(I^c) = (−1)^{kl} sign(I)` | true; equals K5a's `(−1)^{k(m−k)}` | R03 |
| `Δ = 1` for the chosen `vol` | standard basis | `vol.symm 1 = topVector`, `⟪topVector, topVector⟫ = det Gram = 1` | Mathlib's TODO identities hold with `Δ = 1` | none |
| `δ = (−1)^{n(k+1)+1} ⋆d⋆` | general `n, k`; `n = 2, k = 1` | from `afw2006` (2.7) `δ = (−1)^k ⋆^{-1}d⋆`, `⋆^{-1} = (−1)^{(n−k+1)(k−1)}⋆`, exponent `≡ n(k+1)+1`; `n=2,k=1`: `δ(f dx₁+g dx₂) = −(∂₁f+∂₂g)` | true | none |
| item 9 `d⋆g♭ = tr G · vol` | `n = 2` | `⋆g♭ = g₁dx₂ − g₂dx₁`, `d⋆g♭ = (∂₁g₁+∂₂g₂) dx₁∧dx₂`; `n = 1`: `d(g) = g' dx` | true | none |
| adjoints, item 5 | `(d, ˚HΛᵏ⁻¹)` and `(d, HΛᵏ⁻¹)` | `afw2006` (2.10)–(2.11), lines 822–823; `afw2010` Thm 4.1 | `(δ, H*Λᵏ)` and `(δ, ˚H*Λᵏ)` as stated | locator (R06) |
| affine pullback bound, item 10 | `B = 2·Id`, `F⁻¹Ω` | `(F^*u)(x) = 2^k u(2x+b)`, `‖F^*u‖_p = 2^k 2^{−n/p}‖u‖_p = ‖B‖^k |det B|^{−1/p}‖u‖_p` | sharp, true for invertible `B` | R10 |
| Hodge decomposition, item 15 | one operator, `W⁻¹ = 0` | `𝔥⁰ = ker d⁰`, `W⁰ = 0 ⊕ ker d⁰ ⊕ (ker d⁰)^⊥` | true; general case `Z* = 𝔥 ⊕ Z^⊥` | none |
| weight independence, item 15 | `ε = Id`, `ε = 2·Id` | `dom d*_ε = dom d*` in both cases | trivially true; `lsw2026` Thm 2.11 one direction, symmetric `ε` gives the converse | locator (R06) |
| Gaffney equality on `Q`, item 17 | `n = 2, k = 1`, core element `a₁ = cos(πm₁x₁)sin(πm₂x₂)`, `a₂ = sin(πm₁'x₁)cos(πm₂'x₂)` | `∫|du|²+|δu|² − ∫|∇u|² = 2∫(∂₁a₁∂₂a₂ − ∂₁a₂∂₂a₁)` = boundary term; on `x₁ ∈ {0,1}`: `a₁∂₂a₂`, `∂₂a₂ ∝ sin(πm₁'x₁) = 0`; on `x₂ ∈ {0,1}`: `a₁∂₁a₂`, `a₁ ∝ sin(πm₂x₂) = 0` | identity holds on the core; `lsw2026` Thm 4.10 for `k = 1` | locator for general `k` (R06) |
| compact embedding, items 19–20 | `k = 0`; `k = n`; `Ω = Q` | `HΛ⁰₀ ∩ H*Λ⁰ = H¹₀`; `HΛⁿ₀ ∩ H*Λⁿ ≅ H¹(Ω)` (`d = 0` on `n`-forms, `⋆` to `H¹`); both compact into `L²` for bounded Lipschitz `Ω` | consistent with Rellich | none |
| item 14 hypotheses | `Ω₁ ⊄ Ω` | "`u ∈ LᵖΛᵏ(Ω)` Lipschitz on `closure Ω₁`" undefined | hypothesis missing | R10 |
| `equivW1p` norms | `p` any, `u ∈ W^{1,p}` | `Covector n 0 ≅ ℝ`, `Covector n 1 ≅ E` isometrically (Gram of `1×1`), jets `WithLp 2` both sides | equal norms | none |

## Not verifiable

- J. Brüning, M. Lesch, *Hilbert complexes*, J. Funct. Anal. 108 (1992): DOI 10.1016/0022-1236(92)90147-B resolves only to a paywalled page; the service refused the ScienceDirect archive page. Recorded `uncertified`; cited without theorem numbers in the README.
- D. N. Arnold, *Finite Element Exterior Calculus*, SIAM 2018: DOI 10.1137/1.9781611975543 returns HTTP 403; no legal copy found. Listed in `needs-references.toml`.
- Arnold–Falk–Winther, Acta Numerica 2006: the Cambridge page is paywalled; read from the author's page (`afw2006`), whose numbering matches the cited §2–3.

## Source issues

- none
