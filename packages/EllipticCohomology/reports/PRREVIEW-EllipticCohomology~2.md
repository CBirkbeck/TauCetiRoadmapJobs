# Review of EllipticCohomology (pull request #945 at 9dabd3d)

**Verdict:** needs changes

Gate at this head: every check passes (`set_option=0 … depcheck=0 … build=0 OK`); the pull request changes nothing outside `TauCetiRoadmap/EllipticCohomology/`. Dependency check (movable, content = main): `depcheck: 207 roadmaps, 1425 edges, 0 problem(s)`, no UPWARD or CYCLE line. The one blocking finding is a false displayed identity among the Γ₁(3) transfer targets of E4, found by recomputing the transfer two independent ways. Everything else that changed since the previous review is repaired, as itemised below.

## Status of the previous review's findings

- **R01 (cycle with StringOrientation): repaired.** `grep StringOrientation` returns one line, the downstream note at line 1006 ("Downstream, the geometric String-bordism roadmap StringOrientation consumes E4's permanent classes … nothing in this roadmap is consumed from it"). MString, the Ando–Hopkins–Rezk orientation and its genus are owned here (lines 35–43, 819–860); "String's Bernoulli-normalized" is replaced by the written-out normalisation (lines 790–793).
- **R02 (upward suppliers): repaired.** No occurrence of HomotopySpheres, TangentialBordism or "Stage". Lines 12–15 name BordismFormalGroups F4 as the only Toda supplier; E5 owns its finite unstable inputs (lines 864–876) on Mathlib's `Matrix.orthogonalGroup` (an `abbrev` at the pin, `LinearAlgebra/UnitaryGroup.lean` line 293) and cites G2.5's Freudenthal theorem (GeneralizedCohomology G2 item 5, line 326 on main).
- **R03 (statable headline absent): repaired.** `Suggested.lean` states `isIntegralModularForm_iff` (line 58) and `ker_aeval_c₄_c₆_Δ` (line 68) with the four definitions they need; the docstring says the stack form stays unstatable and the Hopf-algebroid form is stated.
- **R04 (padding): repaired.** The fourteen proved declarations are gone; six declarations remain, each named once in the README (lines 173–182) and each declared once in the Lean file.
- **R05 (fused tokens, broken sentences): repaired.** The token scan returns only `mathlib4` (a URL); the product display at line 132 ends in a full stop; the Mahler sentence at lines 269–273 is one sentence.
- **R06 (third-party copies): partly repaired.** DFHH is cited by its AMS locator with no link (line 1014). Ando–Hopkins–Rezk is now linked on an author's page, which is legal, but is described as "preprint (2010)" without the published locator (R02 below).
- **R07 (shape): partly repaired.** Two `**Checks.**` blocks exist (E1, lines 98–119 and 192–206); E4.U carries its locators at every claim (lines 655–662, 670, 674). No other definition has Checks and there are no `*Needs:*` lines (R04 below).

## R01 (P1) — the displayed identity `Tr(−η_R(a₃²)) = 2c₆` is false

**Location.** `TauCetiRoadmap/EllipticCohomology/README.md` lines 714–716: "Identify the right-unit formulas and prove `Tr(1)=8`, `Tr(3η_R(a₁a₃))=2c₄`, `Tr(−η_R(a₃²))=2c₆`."

**Claim.** With the trace values of CDvN Proposition 4.6 (README lines 711–713) and the right units `η_R(a₁) = a₁+2s`, `η_R(a₃) = a₃ + a₁s²/3 + a₁²s/3 + 2t`, the trace of `−η_R(a₃)²` is `2c₆`.

**Witness.** Two independent computations. (1) Exact linear algebra in `Γ′ = A′[s,t]/(η_R(a₂), η_R(a₄), η_R(a₆))` with `r = (a₁s+s²)/3`: the multiplication traces on the basis `1,s,s²,s³,t,st,s²t,s³t` reproduce all eight values of Proposition 4.6 at 37 rational points `(a₁,a₃)`, and `Tr(3η_R(a₁a₃)) = 2c₄` at all of them, but `Tr(−η_R(a₃²)) = −2c₆/27` at all of them. (2) Numerically, summing `η_R(a₃)²` over the eight order-3 points (the roots of the degree-8 polynomial in `s`): at `(a₁,a₃) = (1,1)` the sum of `−η_R(a₃)²` is `13.407… = 362/27`, while `2c₆ = −362`; at `(3,2)` it is `−26 = −702/27` while `2c₆ = 702`. The identity that holds is `Tr(27·η_R(a₃²)) = 2c₆` (verified exactly at the same 37 points). The source carries the same slip (cdvn-dss-tmf line 1694); its conclusion survives because 27 is a 2-local unit.

**Repair.** Replace `Tr(−η_R(a₃²))=2c₆` by `Tr(27η_R(a₃²))=2c₆`, and add after it: "27 is a unit in ℤ_(2), so 2c₆ lies in the transfer image." Add a Check: at `(a₁,a₃) = (1,1)` the trace of `η_R(a₃²)` is `−362/27`, so the unit factor 27, not the sign, is what the displayed values force. Tested on the refuting instance: with the factor 27 the identity holds at `(1,1)`, `(3,2)` and the 35 other points.

## R02 (P3) — Ando–Hopkins–Rezk cited as a preprint without its published locator

**Location.** README line 1020: "Ando–Hopkins–Rezk, *Multiplicative orientations of KO-theory and of the spectrum of topological modular forms*, preprint (2010)".

**Witness.** The paper is published (J. reine angew. Math., 2010). The author-page copy was read for this review and its numbering supports every locator the README uses (ahr-ko-tmf lines 728–738 for §5 (5.1), 746 for Definition 5.3, 987 for Theorem 6.1, 1720–1724 for (10.8), 1733 for Proposition 10.9, 2034 for Theorem 12.3). The published numbering was not checked (paywalled).

**Repair.** Cite the journal, volume and year (and DOI) and keep the author-page link as the copy read, with a note that the locators follow that copy.

## R03 (P3) — "logarithm coefficients" names the wrong series

**Location.** README lines 853–858: "the ring map whose KO-characteristic series is Witten's `σ(L,q) = …`, with logarithm coefficients `2G_(2k)(q)/(2k)!` … (Ando–Hopkins–Rezk Proposition 10.9)".

**Witness.** Proposition 10.9 (ahr-ko-tmf line 1733) expands `x/σ(eˣ,q)`, not `σ`: `x/σ(eˣ,q) = exp(Σ_(k≥2) 2G_k x^k/k!)`. Two-term witness at `q = 0`: the `x⁴/4!` coefficient of `log(x/(e^(x/2)−e^(−x/2)))` is `−B₄/4 = 1/120 = 2G₄(0)`; the coefficient of `log σ` is `−1/120`. Theorem 12.3 (line 2034) calls `{G_k}` itself, not `{2G_k}`, the characteristic series.

**Repair.** Say "whose Hirzebruch characteristic power series `x/σ(eˣ,q)` has logarithm `Σ 2G_(2k)(q)x^(2k)/(2k)!`", and that Ando–Hopkins–Rezk's characteristic sequence is `{G_k}` (half those coefficients), with the `q = 0` witness above as a Check.

## R04 (P3) — Checks and `*Needs:*` lines outside E1

**Location.** Whole README. Definitions in E2–E6 (`V∞hat`, line 308; `κ̄_ell`, line 656; `DA(1)`, line 961; MString, line 829; `B`, line 864) have no `**Checks.**` bullets; `grep -c 'Needs:'` = 0.

**Witness.** The two E1 Checks blocks are the only ones. The sibling roadmaps on main in this family share the prose-only shape, so this stays a note.

**Repair.** At least three Checks per definition with a computed value or negative control: for MString, `π_iMString = π_iS` for `i ≤ 6` and the first new class in degree 8; for `DA(1)`, its cell count 8 and the bottom-cell map; for `κ̄_ell`, the two values `4κ̄_ell = ν²κ` and `τ²κ̄_ell = unit(κ̄_S)` already in the text.

## Verified sound

**Build and form.** `lake env lean Suggested.lean` at the pin: exactly two warnings, both `declaration uses sorry` (lines 58 and 68), exit 0. Single `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data, no `example`, docstrings on all six declarations, `theorem` names and the four definition names each appear once in the README and once in the file. Elaborated signatures (`#check`) match the README statements: `IsIntegralModularForm : ℕ → MvPolynomial (Fin 5) ℤ → Prop` quantifies over every `R : Type` with `[CommRing R]`, every curve and every `VariableChange`, as README line 176–177 says; `coefficientWeight = ![1,2,3,4,6]`; the kernel statement is over `MvPolynomial (Fin 3) ℤ`. One-tactic probe on a scratch copy: `simp [IsIntegralModularForm, evalCoeff]` and `simp` leave both theorems open (unsolved goals printed), `rfl`/`infer_instance` do not apply; neither is padding.

**Headline theorems.** E1's Deligne computation is stated (the Hopf-algebroid form); the stack form, `O^top`/tmf/Tmf/TMF, the Gap Theorem, `π_*tmf[1/6]`, MString with its orientation and surjectivity, and the DA(1) equivalence are named in the docstring as unstatable with the missing carrier each; none has a stand-in. The ℤ[1/6] presentation is a corollary of `ker_aeval_c₄_c₆_Δ`, not a separate headline.

**Sampled target E4.U (unit and atomic inputs), against cdvn-dss-tmf.** Each statement is the source's at the stated 2-local generality: mod-τ vanishings in `(21,1),(21,2),(20,2),(20,3)` and `τ²: π_(20,4)Smf ≅ π_(20,2)Smf` (Proposition 5.9, lines 1836–1848); `κ̄_ell` the unique τ²-division of `unit(κ̄_S)` with reduction a generator of `π_(20,4)Smf/τ ≅ ℤ/8` (lines 1849–1866, Notation 5.10); `4κ̄_ell = ν²κ` and `ν³κ̄` τ-power torsion (Corollary 5.11, lines 1868–1871); `4κ̄_S = τ²ν²κ` (Lemma 5.7, line 1825); `π₂₉S_(2) = 0` (Lemma 5.8, line 1829); `ηκ ∈ ⟨2ν,ν,ε⟩`, vanishing of `π_(12,2)` and `π_(7,1)` of `Smf/τ`, detection of κ by `d` without cancelling η (Proposition 5.4, lines 1792–1803); `d₅(Δ) = ±h₂g` from the τ-torsion of `ν³κ̄` and `d₅(Δh₂²) = gh₂³` (Proposition 6.19, lines 2109–2113); `d₅(Δ) = ±α₁β₁²` from `d₅(β₃/₃) = ±α₁β₁³` with `d₅(±β₁Δ) = α₁β₁³` the only option (Proposition 7.2, lines 2959–2970). Also opened: Proposition 4.3 (line 1588, `5s ≤ n+12`), Theorem 4.4 (line 1610, mod τ the algebraic transfer), Proposition 4.6 (lines 1673–1678, the eight values exactly as README lines 711–713), (4.8) (line 1682), Lemma 6.57 and Proposition 6.58 (lines 2603–2624, the `π_(95,1)` vanishing and the shuffle), Proposition 6.69 (lines 2833–2839).

**New E5 locators.** abghr-units: Definition 4.2 (line 1038, Thom spectrum as a pushout), Lemma 4.8 (line 1119), Theorem 4.9 (lines 1126–1137, E∞ maps as lifts through the fibre of `bgl₁R`), Theorem 5.2 (line 1189, the `Σ^∞_+Ω^∞ ⊣ gl₁` adjunction). ahr-ko-tmf: §1 (line 49, Witten's σ), §5 (5.1) and `bstring = Σ⁸bo` with `Ω^∞bstring = BO⟨8⟩` (lines 727–738), Definition 5.3 (line 746), Theorem 6.1 (lines 987–994, the KO orientation with `b_k = −B_k/2k` refines ABS), (10.8) (lines 1720–1724), Proposition 10.9 (line 1733), Theorem 12.3 (line 2034). devalapurkar-ahr-surjective: Construction 3.1 (lines 150–172: `S⁹ = O(10)/O(9)`, `f ∈ π₁₂O(10) ≅ ℤ/12` with boundary `2ν`, `BN`, `N = ΩBN`, the null composite into `B²String`), Proposition 3.2 (line 175, `BP_*B = BP_*[b₄,y₆]`), Remark 3.3 (line 205, `F₂[ζ₁⁸,ζ₂⁴]`), the equivalence in dimensions ≤ 12 (line 209), Proposition 5.9 (a)–(h) (lines 417–426), the sevenfold brackets (lines 452–453). bauer-tmf line 185: `H^(0,*)(A,Γ) = ℤ[c₄,c₆,Δ]/(c₄³−c₆²−1728Δ)` with `c₆ = −b₂³+36b₂b₄−216b₆` (line 192), the Mathlib sign. hopkins-icm lines 382–392 (the basis `a_(i,j,k)`). mathew-homology-tmf line 35 (Theorem 1.2) and Lemma 5.6 (lines 885–886, `ℤ_(2)[a₁,a₃]`).

**Supplier citations resolved on main.** GeneralizedCohomology: G2.5 "Sphere/space comparisons" with Freudenthal (line 326), G2.8 "Multiplicative infinite-loop construction" (line 432; the roadmap's own "G2.8's KO" at lines 1654 and 1807), G3.8 "Spectral homotopy limits and Postnikov covers" (line 785), G5.3 "Thom spectra from diagrams" (line 1536, with the symmetric Thom ring models), G5.4 "Canonical examples and maps" (line 1559: MSpin as a commutative symmetric Thom ring; ko/KO at line 1652), G5.5-ABS (line 1767; "Pin the spectral ABS route as an E∞ map", line 1806). BordismFormalGroups: F2 line 175 (`H_*(MU;F_p)` with its Steenrod-dual coaction), F4 lines 331–336 (three-fold brackets of spectra and right modules), line 424 (E4/E5 construct the proper faces), F5 line 544 (`W(k)[[u₁,…,u_(h−1)]]`), F6 lines 2557–2565 (`E(n)`-locality for `M/I_(n+1) = 0`, E2 the height-≤2 instance). ModularCurves 5B (line 1313), 7C–7F (lines 1490–1577, ST-1 over artinian local `W(k)`-algebras), scope exclusion of generalized elliptic and Igusa curves (line 43). SchemeAndStackFoundations §§1.18–1.22 (lines 2745–2989), §4.15 `StableCurves.Mbar g n` (lines 5725–5727). EllipticCurves Layer 1 (line 639, the formal group law as a `RingTheory/FormalGroup` instance). ModularForms `E₄`, `E₆`, level one (lines 7, 175, 204). Mathlib at the pin: `Matrix.orthogonalGroup` (`UnitaryGroup.lean` 293), root `mahler` (`MahlerBasis.lean` 102, outside `namespace PadicInt`), `PadicInt.mahlerEquiv` (356), `WeierstrassCurve.variableChange_c₄`, `c_relation`, `VariableChange.mul_def`, `map_variableChange`, `VariableChange.mapHom`, `MvPolynomial.IsWeightedHomogeneous` (all `#check`ed).

**Ownership.** No `Suggested.lean` on main or at any open head declares `TauCetiRoadmap.EllipticCohomology.*`, `universalWeierstrass`, `evalCoeff`, `IsIntegralModularForm` or `coefficientWeight` (`roadmaps grep --lean-only`: no match); no README on main or at an open head states the integral modular-form ring (the only hit is EllipticCurves line 1045, a local condition on `c₄,c₆,Δ`). MString: BordismFormalGroups on main (lines 33–34) assigns StringOrientation only Hovey's specialization (the `π_*MString_(p)` presentation) and the Cayley-plane kernel, which this roadmap does not take. StringOrientation at its open head still constructs MString in S2 (its line 212) and consumes E5's orientation (its lines 616, 638–640); since EllipticCohomology precedes it in the merge order (lines 5 and 6) and the orientation `σ: MString → tmf` needs MString here, this roadmap is the owner and the duplicate construction is StringOrientation's to turn into a citation of E5. Ownership was checked only in the sibling checkouts the brief lists and through `roadmaps grep`; the EllipticKTheory, ChromaticHomotopyTheory, StableHomotopyKTheoryPartII, GeneralAlgebraicKTheoryPartII, AlgebraicTopologyPartII, TangentialBordism and HomotopySpheres checkouts build none of tmf, Smf or MString.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `isIntegralModularForm_iff k f` | `f = 0`, any `k` | LHS `0 = u⁻ᵏ·0`; RHS `0 ∈ adjoin`, weighted-homogeneous vacuously | both sides true | none |
| same | `f = 1`, `k = 0` and `k = 4` | `k=0`: both true; `k=4` over `R = ℤ[u,u⁻¹]`: `1 ≠ u⁻⁴`; RHS weight 0 ≠ 4 | both sides false at `k=4` | none |
| same | `f = c₄`, `k = 4`, `k = 5` | `c₄(C•W) = u⁻⁴c₄(W)` elaborated at the pin; monomial weights of `c₄` all 4 | true at 4, false at 5 | none |
| same | `f = c₄+Δ` | `u⁻⁴c₄ + u⁻¹²Δ`, not `u⁻ᵏ(c₄+Δ)`; not weighted homogeneous | both sides false for every `k` | none |
| same | `f = a₁`, `k = 1`, `C = (1,0,1,0)` | `a₁(C•W) = a₁+2 ≠ a₁` (elaborated: `(C•W).a₁ = u⁻¹(a₁+2s)`); `a₁ ∉ ℤ[c₄,c₆,Δ]` (no weight-1 element) | both false | none |
| ℤ-points-only variant (Check, line 204) | `R = ℤ`, `f = 1`, `k = 4` | `u = ±1`, `u⁻⁴ = 1`, so `1` passes | Check correct, quantification over all `R` needed | none |
| `b₂` law (Check, line 202) | `C = (1,r,0,0)` | elaborated: `(C•W).b₂ = u⁻²(b₂+12r)` | matches | none |
| `ker_aeval_c₄_c₆_Δ` | the relation; independence; torsion | `c₄³−c₆²−1728Δ = 0` (`c_relation`); at `a₁=a₂=a₃=0`: `(c₄,c₆) = (−48a₄,−864a₆)` (elaborated); quotient basis `C₄^iC₆^jD^k`, `j∈{0,1}`; relation primitive (coefficient of `C₆²` is −1) | kernel is the principal ideal | none |
| Γ₁(3) values (Check, lines 99–104) | `(a₁,a₃) = (0,1)`, `(1,0)` | elaborated: `(0,−216,−27)`, `(1,−1,0)`; `0−46656 = 1728·(−27)`; `1−1 = 0` | holds; opposite Δ sign fails the first | none |
| Nodal/cusp/`y²=x³+1` (Check, lines 114–119) | `a₂=1`; all zero; `a₆=1` | elaborated: `(16,−64,0)`, `(0,0,0)`, `c₄=0, Δ=−432`; `16³−64² = 0`; `c₆=−864`, `−746496 = 1728·(−432)` | all three as stated | none |
| Γ₁(3) formulas (lines 969–971) | symbolic with `a₂=a₄=a₆=0` | `b₂=a₁²`, `b₄=a₁a₃`, `b₆=a₃²`, `b₈=0`: `c₄ = a₁⁴−24a₁a₃`, `c₆ = −a₁⁶+36a₁³a₃−216a₃²`, `Δ = a₁³a₃³−27a₃⁴`; weights `{4},{6},{12}` for `(1,3)` | matches CDvN (4.7) | none |
| Transfer values (lines 711–713) | 37 rational points `(a₁,a₃)` | traces of multiplication on `1,s,s²,s³,t,st,s²t,s³t` in `A′[s,t]/(η_R(a₂),η_R(a₄),η_R(a₆))` equal CDvN's eight values at every point | correct | none |
| `Tr(3η_R(a₁a₃)) = 2c₄` | same 37 points | equal at every point | correct | none |
| `Tr(−η_R(a₃²)) = 2c₆` | same 37 points; 8-point sums at `(2,−1),(1,1),(3,2),(−1,2)` | `−2c₆/27` at every point: e.g. `362/27` vs `−362` | false | R01: `Tr(27η_R(a₃²)) = 2c₆` |
| Bernoulli normalisation (lines 790–793) | `k = 4, 6` | `G₄(0) = −B₄/8 = 1/240`, `G₆(0) = −B₆/12 = −1/504`; `240·`, `504·` give `1, −1` | matches (10.8) | none |
| Prop 10.9 logarithm (line 857) | `q = 0`, `x⁴` term | `log(x/(2sinh(x/2)))`: `x⁴/4!` coefficient `−B₄/4 = 1/120 = 2G₄(0)` | the series is `x/σ`, not `σ` | R03 |
| Hopkins basis (lines 806–808) | `k = 0,…,6`, `i=j=0` | `a = 1,24,12,8,6,24,4` | matches 4.6 | none |
| `bstring = τ_(≥8)ko ≃ Σ⁸ko`, `BString` | Bott period 8 | `τ_(≥8)ko = τ_(≥8)KO = Σ⁸ko`; `Ω^∞ = BO⟨8⟩`; `π₈ = π₈BO = ℤ`, `π_(<8) = 0` | matches AHR §5 | none |
| `π₁₂S⁹ ≅ π₃S`, `π₁₂B²String = 0` | stable range; Bott | `12 ≤ 2·9−2`; `π₁₂B²String = π₁₀O = π₂O = 0` | correct | none |
| `τ²: π_(20,4) → π_(20,2)` | cofibre sequence `Σ^(−1,1)Smf/τ² → Σ^(0,−2)Smf → Smf → Smf/τ²` | kernel from `π_(21,1)Smf/τ²`, cokernel into `π_(20,2)Smf/τ²`, each zero by the mod-τ groups `(21,1),(21,2)` and `(20,2),(20,3)` | the four bidegrees are exactly the needed ones | none |
| `4κ̄_S = τ²ν²κ`, `4κ̄_ell = ν²κ` | filtrations | `κ̄_S ∈ (20,2)`, `ν²κ ∈ (20,4)`, `κ̄_ell ∈ (20,4)` | τ² is the filtration jump | none |
| `d₅(Δ)` targets | `Δ ∈ (24,0)` | `h₂g, α₁β₁² ∈ (23,5)`: stems `3+20`, `3+2·10`; filtrations `1+4`, `1+2·2` | correct | none |
| `d₅(β₃/₃) = ±α₁β₁³` | `β₃/₃ ∈ E₂^(2,36)` | stem `34`; target stem `3+30 = 33`, filtration `7` | correct | none |
| `d₂₃(h₁Δ⁵) = g⁶` | bidegrees | `(121,1) → (120,24)`; `1+23 = 24` | correct | none |
| `ν₆` system `⟨ν₄,2ντ⁴,ντ⁴,κ̄²⟩` | stems | `99+3+3+40+2 = 147` | correct (source prints 51) | none |
| Localization criterion (lines 981–983) | `TMF = tmf[D⁻¹]`, `|D| = 576 = 24·24` | `x ↦ 0` iff `D^j x = 0` for some `j` (colimit of multiplication by `D`) | correct | none |
| Bauer conventions vs Mathlib | `η_R(a₁)`, `η_R(a₂)` | `a₁+2s`, `a₂−a₁s+3r−s²` equal `variableChange_def` at `u=1` | same dictionary | none |

## Not verifiable

- Douglas–Francis–Henriques–Hill, *Topological Modular Forms* (Chapters 6–8, 12, 16; Lemmas 8.3–8.6; Chapter 12 §7 and Appendix A): no open copy; cited by chapter and lemma only.
- Ando–Hopkins–Rezk, published numbering (J. reine angew. Math. 2010, paywalled): the author-page copy was read and supports every locator; the published numbering was not compared (R02).
- CDvN Figure A.2 (the chart behind the four mod-τ vanishings and `π_(12,2)`, `π_(7,1)`): a chart, cross-checked only against `π₂₀tmf_(2) = ℤ⊕ℤ/8` and `π₂₁tmf = ℤ/2`.
- Kervaire's `π₁₂O(10) ≅ ℤ/12` (README line 875): taken from Devalapurkar line 152, Kervaire's table not opened.
- Ownership against open pull requests was checked only in the sibling checkouts the brief lists and through `roadmaps grep`; pull requests named without files were not searched.

## Source issues

- **Error** in cdvn-dss-tmf at Corollary 4.9 proof, printed page 47: the source says the trace of −η_R(a₃)² equals 2c₆; it should be the trace of 27·η_R(a₃)², since the trace of η_R(a₃)² is 2c₆/27 (27 a 2-local unit); affects nothing.
- **Misprint** in cdvn-dss-tmf at Corollary 4.9 proof, printed page 47: the source lists 8, 2c₄ and c₆ as lying in the transfer image; it should list 8, 2c₄ and 2c₆, as its own display gives; affects nothing.
- **Misprint** in cdvn-dss-tmf at Proposition 5.4 proof, printed page 50: the source places ηκ ∈ ⟨2ν,ν,ε⟩ in π₁₄S; it should be π₁₅S, the stem used later in the same proof; affects nothing.
- **Misprint** in cdvn-dss-tmf at Proposition 6.69, second item, printed page 80: the source displays the ν₆ bracket inside π_(51,1)Smf/τ¹⁰; it should be π_(147,1), the bidegree the item is labelled with; affects nothing.
