# Review of EllipticCohomology (pull request #945 at 621dc2a)

**Verdict:** needs changes

Gate at this head: every check passes (`set_option=0 … depcheck=0 … build=0 OK`). The pull request changes nothing outside `TauCetiRoadmap/EllipticCohomology/` (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EllipticCohomology'` is empty). The blocking findings are a supply cycle with StringOrientation, two upward suppliers, and a headline theorem that is statable at the pins but absent from `Suggested.lean`.

## R01 (P1) — EllipticCohomology and StringOrientation cite each other

**Location.** `TauCetiRoadmap/EllipticCohomology/README.md` line 740: "Consume StringOrientation S2's actual E∞ MString model." Also lines 34–39 (S2/S4 ownership), 714 ("String's Bernoulli-normalized G_(2k)"), 752 ("comparison with the String S4 genus"), 756, 787, 806–807, 859 ("StringOrientation S6's positive-Ricci TMF vanishing question"), 876–878.

**Claim.** StringOrientation S2 and S4 are suppliers of this roadmap.

**Witness.** StringOrientation's README at its open head (the checkout the brief names for pull request 948) consumes this roadmap: line 580 "Consume EllipticCohomology E4's actual permanent classes `d₂∈π_192 tmf_(2)`, …", line 616 "Consume EllipticCohomology E5's genus/elliptic q-expansion comparison", and lines 638–640 state the loop outright: "EllipticCohomology E5 supplies the tmf orientation and genus comparison used by S5's I_OP questions and S6's tmf/TMF conclusions; E5 consumes S2's Thom ring and primary genus before those applications." The merge order lists EllipticCohomology on line 5 and StringOrientation on line 6, so this roadmap is the supplier and may not cite its consumer. The dependency check printed `depcheck: 201 roadmaps, 1328 edges, 0 problem(s)` with no UPWARD or CYCLE line; given the quoted lines on both sides I believe that is a false negative (the consumer's edges at its open head are apparently not in the check's data), not evidence that the cycle is absent.

**Repair.** Break the cycle on this side, since this roadmap is earlier in the order. (1) Delete every citation of StringOrientation as a supplier (lines 34–39, 714, 740, 752, 756, 787, 806–807, 859, 876–878). (2) The E∞ Thom spectrum `MString` of the 7-connected cover `BO⟨8⟩ → BO` moves down into E5 as a target: build it from GeneralizedCohomology G5 item 3 ("Thom spectra from diagrams", on main) and G3 item 8's Postnikov covers, which E5 already cites for the loop-space Thom spectra; the "particular E∞ model" clause at lines 787–788 then names this target. (3) Replace "Prove comparison with the String S4 genus" (line 752) by a target owned here: the characteristic series and q-expansion of `σ` on `π_*MString` (the Witten genus as the composite `π_*MString → π_*tmf → ℤ[[q]]` through E3's q-expansion), stated with the Bernoulli normalisation `c₄(q) = 240G₄(q)`, `c₆(q) = 504G₆(q)` written out at line 714 rather than attributed to "String's" normalisation; StringOrientation, the consumer, then compares its geometric genus with this one. (4) Lines 859–860 and 876–878 describe what a consumer does; move that text to a `Downstream consumers` note that names StringOrientation without consuming anything from it. Tested on the instance that refuted the original: after (1)–(4) the README contains no occurrence of "StringOrientation S" or "String S4", and StringOrientation's lines 580/616/638 remain valid as consumer citations.

## R02 (P2) — upward suppliers HomotopySpheres and TangentialBordism

**Location.** README lines 12–13: "HomotopySpheres is cited by stage: Stage 3C for three-fold Toda brackets and secondary composition, Stage 4 for stable SO, real Bott periodicity and the stable J-homomorphism"; lines 803–804: "consume HomotopySpheres Stage 4's Bott/J constructions and TangentialBordism's Adams theory."

**Claim.** HomotopySpheres and TangentialBordism are suppliers.

**Witness.** Merge order: EllipticCohomology line 5, TangentialBordism line 9, HomotopySpheres line 64; neither is on main (no `TauCetiRoadmap/HomotopySpheres` or `TauCetiRoadmap/TangentialBordism` folder in the main checkout). The `--movable` rule would move this roadmap after HomotopySpheres only if no consumer came earlier, and StringOrientation (line 6, R01) is a consumer. HomotopySpheres 3C item 3 at its open head does define three-fold Toda brackets, but only for spheres; BordismFormalGroups F4 on main (lines 329–352) already consumes them and constructs "three-fold Toda brackets for composable maps of spectra and of right modules" and the higher-arity systems this roadmap uses.

**Repair.** Repoint the three-fold brackets to BordismFormalGroups F4 (on main), which this roadmap already cites for every other Toda operation, and delete lines 12–13. For E5's unstable inputs (lines 803–804), the notions move down: state as E5 targets the specific finite facts the Devalapurkar route uses, namely the sphere bundle `S⁹ = O(10)/O(9)` on Mathlib's matrix groups, the element of `π₁₂O(10) ≅ ℤ/12` whose image in `π₁₂S⁹ ≅ ℤ/24` is `2ν` (Devalapurkar arXiv 1911.10534 lines 151–152 of the cached text, §3), and the mod-2 Adams tower inputs for `BP_*B`, citing GeneralizedCohomology G5.0's stable Spin classifier on main where it is used. Tested: with these two edits the README names no roadmap later than line 5 in the order.

## R03 (P2) — a statable headline theorem is absent from `Suggested.lean`

**Location.** `TauCetiRoadmap/EllipticCohomology/Suggested.lean` lines 13–15: "Headline theorems not statable at the pins: `H⁰(Mbar_ell, ω^*) ≅ ℤ[c₄, c₆, Δ]/(c₄³ − c₆² − 1728Δ)` (E1): Mathlib has no moduli stack …"; README lines 134–137: "Compute the Weierstrass Hopf-algebroid/cobar comparison … Prove the integral algebraic modular-form ring is `H⁰(Mbar_ell,ω^*)=ℤ[c₄,c₆,Δ]/(c₄³−c₆²−1728Δ)`".

**Claim.** The E1 headline cannot be stated against the pinned Mathlib.

**Witness.** E1 itself proves this ring as `H⁰` of the Weierstrass Hopf algebroid `(A,Γ)` (README lines 95–134), and `H⁰(A,Γ)` is the ring of polynomials in `(a₁,…,a₆)` that transform by `u⁻ᵏ` under every `WeierstrassCurve.VariableChange` over every ring (Deligne's definition of integral modular forms). Every carrier exists at the pin: `WeierstrassCurve`, `WeierstrassCurve.VariableChange` and its `SMul` action (`Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean` lines 57, 125), `MvPolynomial`, `Algebra.adjoin`, `AlgebraicIndependent`. The following elaborates under `lake env lean` at the pin with `sorry` as the only warning (my scratch probe):

```lean
def evalCoeff {R : Type*} [CommRing R] (W : WeierstrassCurve R)
    (f : MvPolynomial (Fin 5) ℤ) : R :=
  MvPolynomial.aeval ![W.a₁, W.a₂, W.a₃, W.a₄, W.a₆] f

/-- Deligne's integral modular forms of weight `k`. -/
def IsIntegralModularForm (k : ℕ) (f : MvPolynomial (Fin 5) ℤ) : Prop :=
  ∀ (R : Type) [CommRing R] (W : WeierstrassCurve R)
    (C : WeierstrassCurve.VariableChange R),
    evalCoeff (C • W) f = ((C.u⁻¹ : Rˣ) : R) ^ k * evalCoeff W f

theorem isIntegralModularForm_iff (f : MvPolynomial (Fin 5) ℤ) :
    (∃ k, IsIntegralModularForm k f) ↔
      f ∈ Algebra.adjoin ℤ {universalWeierstrass.c₄, universalWeierstrass.c₆,
        universalWeierstrass.Δ} := by sorry

theorem c₄_c₆_algebraicIndependent :
    AlgebraicIndependent ℤ ![universalWeierstrass.c₄, universalWeierstrass.c₆] := by sorry
```

The relation `c₄³ − c₆² = 1728Δ` holds in the polynomial ring by `WeierstrassCurve.c_relation` (`Weierstrass.lean` line 134), so the second theorem is what makes the subring `ℤ[c₄,c₆,Δ]/(c₄³ − c₆² − 1728Δ)`. The hard direction is the inclusion of invariants into `ℤ[c₄,c₆,Δ]`, which is E1's Hartogs/depth-two argument.

**Repair.** State the two theorems above (with `universalWeierstrass` kept as the one definition they need), add the weighted-homogeneity refinement if wanted (`IsIntegralModularForm k f` implies `f` is weighted homogeneous of weight `k`, from `u` alone), and revise the module docstring: the stack form of the E1 headline remains unstatable, its Hopf-algebroid form is stated. Name both theorems in E1's prose. Tested: the probe file elaborated at the pin with exactly the two `sorry` warnings.

## R04 (P3) — every declaration of `Suggested.lean` is padding, and none is named in the README

**Location.** `Suggested.lean` lines 29–104 (14 declarations, none with `sorry`).

**Claim.** The file is the roadmap's acceptance test.

**Witness.** One-tactic probe on a scratch copy at the pin: `universal_c_relation` is the term `universalWeierstrass.c_relation`; `universalEllipticCoordinateCurve_discriminant_isUnit` closes with one `simpa` from `IsLocalization.Away.algebraMap_isUnit`; `unipotentCoordinateChanges_noncommute` closes with one `simp [mul_def, ext_iff]`; `gammaOneThreeCurve_c₄`, `_c₆`, `_discriminant` compute small values by `simp; ring` (the README's E6 normalisation, which is a Check, not a headline); `translateX`, `shearY`, the two `abbrev`s, `universalWeierstrass`, `universalEllipticCoordinateCurve` and the `IsElliptic` instance exist only to support those. Grep: none of the nine names (`translateX`, `shearY`, `unipotentCoordinateChanges_noncommute`, `WeierstrassCoordinateRing`, `universalWeierstrass`, `EllipticCoordinateRing`, `universalEllipticCoordinateCurve`, `universal_c_relation`, `gammaOneThreeCurve`) occurs in the README (0 matches each), so README and Lean do not agree on what the file declares.

**Repair.** Delete all 14 declarations from `Suggested.lean`; the README keeps the product formula, the noncommutativity remark and the Γ₁(3) images as prose (they are already there at lines 103–105, 125–128 and 848–851). What remains is the module docstring plus, after R03, the two headline theorems and the one definition they need.

## R05 (P3) — fused number tokens and two broken sentences

**Location.** README line 77 "After inverting6", 78 "shift1", 154 "height1 … height2", 170 "dimension1"; 58 such tokens in all (`at2`, `order8`, `stem14`, `filtration2`, `level4`, `degree110`, `rank8`, `modulo8`, `Chapters6–8,12,16`, `Proposition4.6`, `Lemma8.6`, `Lemmas8.3–8.6`, `shifts−s+2`, …). Lines 103–105: the display "`(u,r,s,t)(v,R,S,T)=(uv,rv²+R,vs+S,tv³+rSv²+T)`," ends in a comma and is followed by the new sentence "For the curve morphism …". Lines 204–207: "… continuous-function hypotheses." is followed by the fragment "for continuous functions on ℤ_p; use completed function/tensor modules, …".

**Witness.** `grep -o -E '\b(at|inverting|shift|height|…)[0-9]+'` returns 58 matches; the two sentence breaks are quoted above.

**Repair.** Insert the missing spaces (`inverting 6`, `shift 1`, `at 2`, `Proposition 4.6`, …); end the display at line 104 with a full stop; join line 207 to the sentence at 204–206 ("… hypotheses, for continuous functions on ℤ_p; use …").

## R06 (P3) — two references point at copies on third-party pages

**Location.** README line 882 (Douglas–Francis–Henriques–Hill, linked to a PDF under a different person's university page) and line 888 (Ando–Hopkins–Rezk, linked to a "tmf-mirror" under a third person's page).

**Witness.** DFHH is AMS Mathematical Surveys and Monographs 201 (2014); AHR is J. reine angew. Math. 2010. Neither linked host is an author page, institutional repository of the authors, or open archive, so neither was read for this review (see Not verifiable).

**Repair.** Cite both by their published locators (volume, year, DOI) and link only an author-posted or open copy if one exists; otherwise record them as uncertified. The DFHH chapter numbers (6–8, 12, 16; Lemmas 8.3–8.6; §7 and Appendix A of Chapter 12) stay as locators.

## R07 (P3) — README shape: no Checks, no `*Needs:*` lines, locators by paper

**Location.** Whole README. Example: E1 lines 118–123 define `ω`, `c₄`, `c₆`, `Δ` with no `**Checks.**` bullets; E4.U (lines 573–596) states six theorems with no locator at the claim (the CDvN citation sits in E4.S at line 431 and E4.A at line 630).

**Witness.** `grep -c 'Checks\.' README.md` = 0; `grep -c 'Needs:' README.md` = 0. The sibling roadmaps on main in this family (BordismFormalGroups, GeneralizedCohomology) share this shape, so this is a note, not a blocker.

**Repair.** At minimum, put the locator at each E4.U claim (CDvN Proposition 5.9, Corollary 5.11, Proposition 6.19, Proposition 7.2) and at the transfer values (CDvN Proposition 4.6, Corollary 4.9), and add three Checks for the definitions of `ω, c₄, c₆, Δ` (the two-term witnesses in the table below are ready-made: the Γ₁(3) values at `(a₁,a₃) = (0,1)` and `(1,0)`, and `c₄³ − c₆² = 1728Δ` on them).

## Verified sound

**Gate and build.** The worker's gate at 621dc2a: every check passes, including the targeted build. Depcheck (movable, content = main checkout): `depcheck: 201 roadmaps, 1328 edges, 0 problem(s)` (see R01 for why I do not rely on it for the cycle).

**Sampled target E4.U (unit and atomic inputs), checked against Carrick–Davies–van Nigtevecht, arXiv 2412.01640v2 (fetched through the sources service; pages 49–53 of the cached extraction were empty and were re-extracted with pdftotext into my scratch directory).** Every statement of E4.U is the source's, at the stated generality:
- mod-τ vanishings in `(21,1),(21,2),(20,2),(20,3)` and the τ² cofibre sequence giving `τ² : π_(20,4)Smf_(2) ≅ π_(20,2)Smf_(2)`: Proposition 5.9 and its proof (2-local throughout, as the README's subscript says);
- `κ̄_ell` the unique preimage of `unit(κ̄_S)`, reducing to a generator `g` of `π_(20,4)Smf/τ ≅ ℤ/8`, and `4κ̄_ell = ν²κ`: Proposition 5.9, Notation 5.10, Corollary 5.11;
- `4κ̄_S = τ²ν²κ` from the classical relation and injectivity of τ-inversion in `(20,2)`: Lemma 5.7; indeterminacy `⟨ν²κ⟩`, `π₂₀S_(2) ≅ ℤ/8`, bracket contains a generator, `ν²κ` the nonzero 2-torsion: Lemma 5.6;
- `ν³κ̄_S` τ-power torsion from `π₂₉S_(2) = 0`: Lemma 5.8 (2-local; integrally `π₂₉^s ≅ ℤ/3`, which the README's `S_(2)` excludes);
- κ detected by `d` through `ηκ ∈ ⟨2ν,ν,ε⟩` and the vanishings `(12,2)`, `(7,1)`, never cancelling η: Proposition 5.4;
- `d₅(Δ) = ±h₂g` at 2 from the τ-torsion of `ν³κ̄`: Proposition 6.19; `d₅(Δ) = ±α₁β₁²` at 3 from `d₅(β₃/₃) = ±α₁β₁³` with `d₅(±β₁Δ) = α₁β₁³` the only possibility and β₁ permanent: Proposition 7.2.

**Other locators opened.** Bauer arXiv math/0311328v3: `d₅(Δ) = β²α` at 3 (line 361 of the cached text), `d₅(Δ) = gh₂` at 2 (line 809), basis `{1,s,s²,s³,t,st,s²t,s³t}` (line 423), Lemma 8.6 `κ̄ = ⟨ν,2ν,ν,4ν,ν,η⟩` (line 921), Corollary 8.7 `e[110,2] = ⟨κ̄⁴,ν,2ν,ν,4ν,κ⟩` and `2e[110,2] = e[110,14]` (lines 929–941), `d₂₃(e[121,1]) = g⁶` (line 943). Hopkins ICM math/0212397: Proposition 4.6 image basis with `a = 1` (i>0, j=0), `2` (j=1), `24/gcd(24,k)` (i=j=0) (lines 382–392). Mathew arXiv 1305.6100v5: Theorem 1.2 `tmf ∧ DA(1) ≃ tmf₁(3)` 2-locally (line 35), `ℤ_(2)[a₁,a₃]` (line 886), `tmf_*(DA(1))` from `Tmf_*(DA(1))` via the Gap Theorem (line 82). Devalapurkar arXiv 1911.10534v3: `BP_*B = BP_*[b₄,y₆]`, degrees 8, 12 (line 175); `S⁹ = O(10)/O(9)` and the element of `π₁₂O(10) ≅ ℤ/12` mapping to `2ν` (lines 151–152); Proposition 5.9 (a)–(h) (lines 417–426), the seven-fold brackets (lines 452–453). CDvN Proposition 4.3 (split injection, isomorphism for `5s ≤ n+12`), Proposition 4.6 (the eight trace values, exactly as README lines 648–650), Corollary 4.9 (`Tr(1)=8`, `Tr(3η_R(a₁a₃))=2c₄`, `Tr(−η_R(a₃²))=2c₆`), Theorem 4.4 (synthetic transfers, mod τ the algebraic transfer), Proposition 6.58 (`d₂₃(h₁Δ⁵) = g⁶` by the shuffle `τ¹⁶κ̄⁴·⟨κ,2,η,ν⟩·τ⁴κ̄ = ⟨τ¹⁶κ̄⁴,κ,2,η⟩·τ⁴νκ̄` with `π_(95,1)Smf/τ²⁴ = 0`), Lemma 6.57 (`τ⁴νκ̄ = 0` lifted from mod τ¹² to mod τ²⁴), Proposition 6.69 (the four-fold systems for ν₂ and ν₆), Theorem 7.4 (`Smf[1/6]`), line 2949 (`Smf[J⁻¹]` for every set of primes J).

**Library declarations at the pin (Mathlib 6b7abb3c, the commit the README's link at line 102 names).** `WeierstrassCurve.VariableChange` and `mul_def` (`VariableChange.lean` 57, 85–89), `variableChange_def` (137), `variableChange_c₄/c₆/Δ` (210–218), `mapHom` (294), `map_variableChange` (305); `c_relation` (`Weierstrass.lean` 134), `map_Δ` (272), `IsElliptic` (366); `FormalGroup` (`RingTheory/FormalGroup/Basic.lean`); `CategoryTheory.Pseudofunctor.IsStack` (`Sites/Descent/IsStack.lean`); `DescentData` (`Sites/Descent/DescentData.lean`); `SheafOfModules.IsQuasicoherent` (`Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean`); root `mahler` (`NumberTheory/Padics/MahlerBasis.lean` 102, outside `namespace PadicInt`), `PadicInt.hasSum_mahler` (338), `PadicInt.mahlerEquiv` (356), with the `NormedAddCommGroup`, `Module ℤ_[p]`, `IsBoundedSMul`, `IsUltrametricDist`, `CompleteSpace` hypotheses the README names. All `#check`ed in one scratch elaboration. The docstring's "not statable" claims for spectra, Thom spectra and the stack of stable curves are correct at the pin (no such carriers), except as R03 says.

**Cross-roadmap citations resolved.** On main: BordismFormalGroups F4 (lines 329–466: MU/BP resolution, normalised cobar, convergence, all-arity Toda systems, Hovey-model hypotheses assigned to "ELL"), F5 (466–553: Landweber exactness, Lubin–Tate ring `W(k)[[u₁,…,u_(h−1)]]`, "These algebraic targets supply EllipticCohomology's spectral realization"), F6.4–F6.5 (K(1)/K(2) comparisons, arithmetic square, the `E(n)`-locality theorem for `M/I_(n+1) = 0` at lines 2555–2569 naming E2 as the height-≤2 instance); GeneralizedCohomology G3 item 8 (derived limits, Milnor sequence, Postnikov covers, connective commutative rings), G5 item 3 ("Thom spectra from diagrams"), line 60 assigning tmf/Tmf/TMF to this roadmap; ModularCurves 5B (full level `N ≥ 3`), 7C–7F (formal completion, universal deformation over `W(k)[[T]]`, PD-1–PD-5, ST-1 over artinian local `W(k)`-algebras with `k` algebraically closed), Layer 10 (the Tate curve over `ℤ[1/N]((q))` with level structures), and its scope exclusion of generalized elliptic curves and Igusa curves (line 43), consistent with E1/E2 owning them; EllipticCurves Layer 1 (i) (line 638: the elliptic formal group law over the coefficient ring as a `RingTheory/FormalGroup` instance); SchemeAndStackFoundations §1.18–1.22 (lines 2745–3020) and §4.15 `StableCurves.Mbar g n` with `(1,1)` in range, smooth locus, proper DM, node-smoothing coordinates and Deligne's full-level normalisation (lines 5725–5800); ModularForms `E₄`, `E₆`, `Δ`, level-one graded ring. At open heads: HomotopySpheres 3C item 3 and Stage 4 (R02), TangentialBordism (R02), StringOrientation S2/S4/S6 (R01). Consumers that declare gaps against this roadmap (GeneralAlgebraicKTheoryPartII, ChromaticHomotopyTheory) cite, and do not restate, E1–E6; no `Suggested.lean` on main or at any open head declares a `TauCetiRoadmap.EllipticCohomology.*` name or the objects of this file. Ownership of the sphere inputs (E4.S), the Hovey stable comodule model and the elliptic higher systems is assigned to this roadmap by BordismFormalGroups F4 (lines 111, 385, 424).

**Elaborated signatures.** The worker's `signatures.md` lists 14 declarations with no dropped binder; I re-elaborated them on a scratch copy with the one-tactic probes of R04 and the convention witnesses below.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Product `(u,r,s,t)(v,R,S,T)` (README 104) vs `mul_def` | `(1,1,0,0)·(1,0,1,0)` and reverse | `(1,1,1,1)` vs `(1,1,1,0)`; general formula closes by `rw [mul_def]` | matches Mathlib; u=1 subgroup noncommutative with cross term `rS` | none |
| Comultiplication `Δt = t₁+u₁³t₂+s₁u₁²r₂` (README 112) | `C₂·C₁` with first arrow `C₁` | `t`-entry of `C₂*C₁` = `t₂u₁³ + r₂s₁u₁² + t₁` | matches | none |
| `φ_(CC′,W)=φ_(C′,W)∘φ_(C,C′•W)` | `C′` then `C` | composite target `C•(C′•W) = (CC′)•W` by `MulAction` | consistent | none |
| `φ_C*ω_W = u⁻¹ω_(C•W)`, weight k ↦ `u⁻ᵏ` | `x=u²x′+r, y=u³y′+su²x′+t` | `dx = u²dx′`; `2y+a₁x+a₃ = u³(2y′+a₁′x′+a₃′)`; `c₄(C•W) = u⁻⁴c₄(W)` (`variableChange_c₄`) | consistent | none |
| Γ₁(3) images (README 848–851) | `(a₁,a₃) = (0,1)`, `(1,0)` | `(c₄,c₆,Δ) = (0,−216,−27)`: `0 − 46656 = 1728·(−27)`; `(1,−1,0)`: `1−1 = 0` | relation holds; sign of `c₆` is Mathlib's | none |
| `c₄³−c₆²=1728Δ` at p = 2, 3 | `R = 𝔽₂, 𝔽₃` | `c₄³ = c₆²` (`c_relation_of_char_two/three`), Δ not determined by `c₄,c₆` | README keeps Δ as integral generator, `ℤ[1/6]` form separately | none |
| Dualizing line `ω^(−10)`, shift 1, `H¹(ω^(−10)) ≅ ℤ[1/6]` | CDvN Thm 7.4 basis `c₄^i c₆^j Δ^k`, `i,k ≤ −1`, `j∈{0,1}` | weight −10: `4i+6j+12k=−10` ⇒ `(−1,1,−1)` only; weight −9: none; `k=4`: `H⁰(ω⁴)=⟨c₄⟩`, `H¹(ω^(−14))=⟨c₄⁻²c₆Δ⁻¹⟩`, product = generator | pairing perfect on this instance | none |
| Edge-image basis `a_(i,j,k)` | `k=0,1,2`; `j=1` | `24/24=1` (unit), `24Δ`, `12Δ²`, `2c₆` in degree 12 | matches Hopkins 4.6 and `π₁₂tmf = ℤ` | none |
| Transfer `Tr(3η_R(a₁a₃)) = 2c₄` | expand with `η_R(a₁)=a₁+2s`, `η_R(a₃)=a₃+a₁s²/3+a₁²s/3+2t`, traces of Prop 4.6 | `24a₁a₃ −4a₁⁴ +6a₁⁴ −2a₁⁴ +2a₁⁴ −24a₁a₃ −24a₁a₃ −24a₁a₃ = 2a₁⁴ − 48a₁a₃` | `= 2c₄` | none |
| `τ²: π_(20,4) → π_(20,2)` iso (E4.U) | cofibre sequence `Σ^(−1,1)Smf/τ² → Σ^(0,−2)Smf → Smf → Smf/τ²` | kernel from `π_(21,1)Smf/τ²`, cokernel into `π_(20,2)Smf/τ²`, each controlled by two mod-τ groups: `(21,1),(21,2)` and `(20,2),(20,3)` | the four bidegrees are exactly those needed; consistent with `π₂₀tmf_(2) = ℤ ⊕ ℤ/8` having nothing in filtration 2 | none |
| `4κ̄_S = τ²ν²κ`, `4κ̄_ell = ν²κ` | filtrations | `κ̄_S` in `(20,2)`, `ν²κ` in `(20,4)`, `κ̄_ell` in `(20,4)` | τ² accounts for the filtration jump | none |
| `τ^Nν³κ̄_S = 0` in `π_(29,5−N)` | stems/filtrations | `3·3+20 = 29`, `3·1+2 = 5`; `π₂₉S_(2) = 0`, `π₂₉^s ≅ ℤ/3` integrally | 2-local statement correct, integral one would be false | none |
| `d₅(β₃/₃) = ±α₁β₁³` at 3 | `t(β_(s/j)) = 16s−4j` | `β₃/₃ ∈ E₂^(2,36)` stem 34; `α₁β₁³ ∈ E₅^(7,40)` stem 33 | correct | none |
| `d₅(Δ)` at 2 and 3 | `Δ ∈ (0,24)` | targets `h₂g ∈ (5,28)` and `α₁β₁² ∈ (5,28)`, stem 23 | correct | none |
| `d₂₃(h₁Δ⁵) = g⁶` | `h₁Δ⁵ ∈ (1, 121)`, `g ∈ (4, 20)` | `g⁶ ∈ (24, 120)`; `1+23 = 24` | correct | none |
| `ν₆` bidegree `(147,1)`, system `⟨ν₄,2ντ⁴,ντ⁴,κ̄²⟩` | degrees | `99+3+3+40+2 = 147` | correct (source misprints 51) | none |
| Even/odd dictionary `E(P⊗ω^k) ≃ T_kE(P)`, `(T_kM)_n = M_(n+2k)` | `P = O`, `k = ±1` | generator of `T₁MU_*` in degree −2 ↔ ω; `Ext^(0,2k)` = maps from the free comodule on a degree-`2k` generator ↔ `Hom(ω^(−k),P)` | consistent with `Ext^(s,2k) ≅ H^s(P⊗ω^k)` | none |
| Parity pairs: `S² = T_(−1)`, `(0,O)² = (ω⁻¹,0)` | `(SM)_n = M_(n−1)` | `(S²M)_n = M_(n−2) = (T_(−1)M)_n`; odd⊗odd lands in `T_(−1)iE(Q⊗Q′) = iE(Q⊗Q′⊗ω⁻¹)` | tensor formula consistent | none |
| Tot braiding sign | `x ∈ C_a^i`, `y ∈ D_b^j` | `(−1)^(ib)·(−1)^(ab+ij)·(−1)^(ja) = (−1)^((a−i)(b−j))` | consistent | none |
| p-adic completion preserves SES with p-torsion-free cokernel | `0→A→B→C→0` | `Tor₁(C,ℤ/p^m) = C[p^m] = 0`; `A/p^m` surjective system, `lim¹ = 0` | correct | none |
| Cusp locus `V(c₄,Δ)` codim 2, cuspidal | `y² = x³` | orbit of the cusp under `G` (dim 4) with ≥1-dim stabiliser (`u`-scaling), so dim ≤ 3 in `𝔸⁵`; `c₄,Δ` coprime | codimension 2 | none |
| Periodicity degrees | `Δ⁸, Δ³, Δ, Δ²⁴` | `192, 72, 24`; `lcm = 576` | correct | none |
| `c₄(q) = 240G₄`, `c₆(q) = 504G₆ = −E₆` | `G_(2k) = −B_(2k)/4k + Σσ_(2k−1)(n)qⁿ` | `240·(1/240) = 1`, `504·(−1/504) = −1` | matches Tate-curve signs `c₄=E₄`, `c₆=−E₆` | none |
| Gap range | `n = −21` vs `−20…−1` | `π_(−21)Tmf ≠ 0` | strict bound correct | none |

## Not verifiable

- Douglas–Francis–Henriques–Hill, *Topological Modular Forms* (Chapters 6–8, 12, 16; Lemmas 8.3–8.6; Chapter 12 §7 and Appendix A, cited at README lines 191, 262–266, 283): an AMS book; the README links a copy on a third party's page, which I did not read (R06). Cited by chapter only.
- Ando–Hopkins–Rezk, *Multiplicative orientations of KO-theory and of the spectrum of topological modular forms* (the orientation criterion, E5): J. reine angew. Math. 2010, paywalled; the linked mirror is not an author page and was not read (R06).
- CDvN Figure A.2 (the chart from which the four mod-τ vanishings and `π_(12,2)`, `π_(7,1)` are read): a chart, cross-checked only against the known groups `π₂₀tmf_(2) = ℤ⊕ℤ/8`, `π₂₁tmf = ℤ/2` in filtration 5.
- The eight trace values of CDvN Proposition 4.6 beyond `Tr(1)` and the `2c₄` combination: taken from the source, not recomputed.
- Ownership against open pull requests was checked only in the sibling checkouts the brief lists and through `roadmaps grep`; pull requests the brief names without files were not searched.

## Source issues

- **Misprint** in cdvn-dss-tmf (arXiv 2412.01640v2) at Corollary 4.9 proof, printed page 47: the source says the elements 8, 2c₄ and c₆ lie in the transfer image; it should be 8, 2c₄ and 2c₆, as its own displayed formula gives; affects nothing.
- **Misprint** in cdvn-dss-tmf at Proposition 5.4 proof, printed page 50: the source says ηκ lies in ⟨2ν,ν,ε⟩ in π₁₄S; it should be π₁₅S (stem 15, as the same proof later uses); affects nothing.
- **Misprint** in cdvn-dss-tmf at Proposition 6.69 second item, printed page 80: the source displays the bracket for ν₆ inside π_(51,1)Smf/τ¹⁰; it should be π_(147,1), the bidegree the item is labelled with; affects nothing.
- **Misprint** in cdvn-dss-tmf at Lemma 6.26, printed page 61: the source lists the bidegree (91,1) and the target ℤ/8⟨νΔ²⟩ for the map z ↦ νΔ⁴; it should be (99,1) and ℤ/8⟨νΔ⁴⟩; affects nothing.
- **Error** in cdvn-dss-tmf at Theorem 7.4, printed page 85: the source says the nonnegative part is a ring isomorphism with an exterior algebra on c₆; it should be the free ℤ[1/6,τ][c₄,Δ]-module on 1 and c₆, since c₆² = c₄³ − 1728Δ ≠ 0; affects a stated result (its ring form only).
- **Error** in Devalapurkar (arXiv 1911.10534v3) at the paragraph after Proposition 5.11, printed page 11: the source attributes κ̄ = ⟨ν,2ν,3ν,4ν,ν,η⟩ to Bauer Lemma 8.6; Bauer's Lemma 8.6 and Corollary 8.7(3) have ν, not 3ν, in the third slot (his 8.7(1)–(2) have 3ν); affects a stated result's form, reconciled by 12ν = 4ν in ℤ/8 as README lines 686–689 plan.
